clear all;
clc;

% defining parameters

x1_length = 10;
x2_length = 10;
x1_min = 0.076;
x2_min = 0.1;
x1_max = 1.2;
x2_max = 1.2;

population = 256;
generation = 50;

crossover_prob = 0.5;
mutation_prob = 0.01;

objective = @(x1,x2) 2.63*x1 + 2*x2;
penalty = @(x1,x2) 2.97*x1 - 2*x2 - 0.57;


% initialize the population

phenomes = randi([0,1], population, x1_length+x2_length);

for gen = 1:generation

	genomes = decode(phenomes, x1_length, x2_length, x1_min, x1_max, x2_min, x2_max);

	%compute fitness values with penalty

	fitness = calculate_fitness (population, genomes, objective, penalty);

	% Roulette Wheel Selection

	N = population*2;		% how many number of members to generate
	Roulette_index = sum( bsxfun(@ge, rand(N,1), transpose(cumsum(fitness./sum(fitness)))), 2) + 1;

	% Crossover

	phenomes = crossover (phenomes, Roulette_index, x1_length, x2_length, crossover_prob);

	% Mutation

	phenomes = mutation (phenomes, mutation_prob);

end

genomes = decode(phenomes, x1_length, x2_length, x1_min, x1_max, x2_min, x2_max);
fitness = calculate_fitness (population, genomes, objective, penalty);

[max_fitness, I] = max(fitness);

figure
scatter (genomes(:,1), genomes(:,2));

fprintf('The optimal solution is found to be:\n X1 = %0.5f and X2 = %0.5f\n', genomes(I, 1), genomes(I,2));