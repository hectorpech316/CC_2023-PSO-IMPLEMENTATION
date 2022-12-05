# CC_2023-PSO-IMPLEMENTATION
## Particle Swarm Optimization. An implementation.
### Authors: Isaac Fernandez, Hector Pech. 

## Brief overview and introduction to PSO.

A swarm is a collection of agents or organisms; swarm intelligence can be defined as the social behaviours of a swarm in which autonomous individuals interact with each other in a decentralised and self-organised manner. The interaction of individuals improves the empirical knowledge about the environment and brings the swarm to the optimal state.
We can observe such intelligence in nature. For example, ants are known to find the shortest path from their colony to a food source. In the beginning, individuals explore various directions from and to the destination. When a favourable route is found, ants mark the path with pheromones which are chemical substances ants deposit on the ground. As more ants take the same trail, the pheromones intensify, attracting more ants. Consequently, the majority of ants follow and converge to the shortest path.



Particle swarm optimization (PSO) algorithm is a stochastic
optimization technique based on swarm, which was proposed
by Eberhart and Kennedy (1995) and Kennedy and Eberhart
(1995). PSO algorithm simulates animal’s social behavior,
including insects, herds, birds and fishes. These swarms conform a cooperative way to find food, and each member in the
swarms keeps changing the search pattern according to the
learning experiences of its own and other members.
Main design idea of the PSO algorithm is closely related
to two researches: One is evolutionary algorithm, just like
evolutionary algorithm; PSO also uses a swarm mode which
makes it to simultaneously search large region in the solution space of the optimized objective function. The other is
artificial life, namely it studies the artificial systems with life
characteristics.

The algorithm of PSO is simple. Particles are a number of simple entities in a search space. We create a population of particles and measure their individual fitness with an objective function of the problem. Particles are then moved from their current to the next position based on their personal best location, and on the swarm’s best location so far. By iterating the moves the swarm gradually reaches an optimal point of the objective function over generations.


### PSO Algorithm.
1. Initialise the particle population array x_i
2. Loop
3. For each particle, calculate the fitness using the 
   fitness function f(x_i)
4. Compare the current fitness value with its best p_i. 
   Replace the best with the current value x_i 
   if it is better than the best.
5. Check the swarm’s best particle from individual particle’s best 
   and assign the best array to the global best p_g.
6. Calculate the velocity v_i(t+1) and update the position of 
   the particles to x_i(t+1)
7. If a criterion is met, exit the loop.
8. End loop
