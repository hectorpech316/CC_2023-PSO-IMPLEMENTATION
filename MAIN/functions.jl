function square_function(x)             #We define a 
  return (x[1] - 3)^2 + (x[2] - 5)^2    #Cuadratic Function
end

"""
In mathematical optimization,
the Rosenbrock function is a non-convex function,
introduced by Howard H. Rosenbrock in 1960, which
is used as a performance test problem for optimization algorithms
    """
function rosenbrock_function(x, d) #We define the
  res = 0                          #Rosenbrock function
  for i = 1:d-1
    res += 100*(x[i+1]-x[i]^2)^2 + (1-x[i])^2
  end
  return res  
end
