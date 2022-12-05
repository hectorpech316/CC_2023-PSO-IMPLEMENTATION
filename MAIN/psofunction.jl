using Distributions
using Statistics
include("functions.jl")

"""
In computational science, particle swarm optimization (PSO)
is a computational method that optimizes a problem by iteratively 
trying to improve a candidate solution with regard to a given measure of quality.
    """

function pso(d, l, u, Part_N, Max_iter)               #We define the
  x = l' .+ rand(Uniform(0,1), Part_N, d) .* (u - l)' #particle swarm optimization (PSO)
  v = zeros(Part_N, d)                                #function
  obj_func = [rosenbrock_function(x[i, :], d) for i=1:Part_N]
  glob_opt = minimum(obj_func)

  ind = argmin(obj_func)
  G_opt = reshape(x[ind, :], 1, d) * ones(d, Part_N)
  better_pos = x[ind, :]
  Loc_opt = x
  Nva_obj_func = zeros(1, Part_N)
  Evol_func_obj = zeros(1, Max_iter)

  for t = 1:Max_iter
    v = v .+ rand(Uniform(0,1), Part_N, d) .* (Loc_opt - x) .+ rand(d)' .* (G_opt' .- x)
    x = x .+ v
    
    for i=1:Part_N
      if x[i, :] > u
        x[i, :] = u
      elseif x[i, :] < l
        x[i, :] = l
      end
      
      Nva_obj_func[i] = rosenbrock_function(x[i, :], d)
      if Nva_obj_func[i] < obj_func[i]
        Loc_opt[i, :] = x[i, :]
        obj_func[i] = Nva_obj_func[i]
      end
    end

    Nvo_glob_opt = minimum(obj_func)
    ind = argmin(obj_func)

    if Nvo_glob_opt < glob_opt
      glob_opt = Nvo_glob_opt
      G_opt[:] = reshape(x[ind, :], 1, d) * ones(d, Part_N)
      better_pos = x[ind, :]
    end
    Evol_func_obj[t] = glob_opt

    t += 1
  end
  
  return better_pos
end
