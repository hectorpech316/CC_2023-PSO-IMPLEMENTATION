using Distributions
using Printf
using Statistics

#function: function1(x)
#    return 3*x^4 - 8*x^3 + 12*x^2 - 48*x + 25;
#end

#Number of dimensions in which our particle moves
d = 1

#Lower limit of the domain in which each particle moves
l = [0]

#Upper limit of the domain in which each particle moves
u = [3]

#Maximum number of iterations
Max_iter = 500

#Number of particles
Part_N = 100

#Initialize the initial position of each particle
x = l[1] .+ rand(Uniform(0,1), Part_N,d) .* (u[1] - l[1])

#Evaluate the objective function in each particle
obj_func = zeros(1,Part_N)
for i = 1:Part_N
    obj_func[i] = funcion1d_1(x[i])
end

#Best global value (minumum), value and index
glob_opt = minimum(obj_func)
ind = argmin(obj_func)[2]

#Optimal values vector
G_opt = x[ind] .* ones(Part_N,d)

#Best global position
Mejor_pos = [x[ind]]

#Best local of each particle
Loc_opt = x

#Starting veolicities
v = zeros(Part_N,d)

#Iteration counter
t = 1

#Arrays for feature evaluations and their evolution through iterations
Nva_obj_func = zeros(1,Part_N)
Evol_func_obj = zeros(1,Max_iter)

while t < Max_iter

#Calculate the new velocity
global v = v .+ rand(Uniform(0,1), Part_N,d) .* (Loc_opt - x) + rand(Part_N,d) .* (G_opt - x);

#We get new position
global x = x .+ v

# For each particle it is verified that they do not go out of the limits l and u
for i=1:Part_N
if x[i] > u[1]
global x[i] = u[1];
elseif x[i] < l[1]
global x[i] = l[1];
end

#The new positions in the objective function are re-evaluated
global Nva_obj_func[i] = funcion1d_1(x[i])

#Check if local optima are updated
if Nva_obj_func[i] < obj_func[i]

#Update local optimal 
global Loc_opt[i] = x[i]

#Update objective function
global obj_func[i] = Nva_obj_func[i]
end
end

#Gets the best maximum value
global Nvo_glob_opt = minimum(obj_func)
global ind = argmin(obj_func)[2]

#Check if the global optimum is updated
if Nvo_glob_opt < glob_opt

    #Optimal values are updated
    global glob_opt = Nvo_glob_opt;
    global G_opt[:] = x[ind] .* ones(Part_N,d)
    global Mejor_pos = [x[ind]]
end

# Save objective function values
global Evol_func_obj[t] = glob_opt

#Increase the iteration
global t = t + 1;
end
