using MPI
using Dates
include("functions.jl")
include("psofunction.jl")

MPI.Init()
comm = MPI.COMM_WORLD
rank = MPI.Comm_rank(comm)
size = MPI.Comm_size(comm)

if rank == 0
  initial = now()
end

d = 2
a = [-5, -5]
b = [10, 10]
Part_N = 1000
Max_iter = 1000

pn_act = Part_N ÷ size
min_act = pso(d, a, b, pn_act, Max_iter)
if rank != 0
  MPI.send(min_act, comm; dest=0, tag=0)
else
  RES_MIN = zeros(d)
  for i = 1:size-1
    mssgrcv = MPI.recv(comm; source=i, tag=0)
    minima = min(rosenbrock_function(RES_MIN, d), rosenbrock_function(mssgrcv, d))

    # Save the minima
    if minima == rosenbrock_function(RES_MIN, d)
      global RES_MIN = RES_MIN
    else
      global RES_MIN = mssgrcv
    end
  end
end

if rank == 0
  println("The minimum value is in  x=$(RES_MIN)")
  final = now()
  println("Execution time: $(final- initial)")
end


MPI.Barrier(comm)
MPI.Finalize()
