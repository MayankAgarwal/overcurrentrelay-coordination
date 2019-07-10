clear all;

% parameters initialization

x1_length = 10;
x2_length = 10;

x1_min = 0.076;
x2_min = 0.1;

x1_max = 1.2;
x2_max = 1.2;

population = 264;
generation = 50;

crossover_prob = 0.8;
mutation_prob = 0.01;

objective = @(x1,x2) 2.63*x1 + 2*x2;
penalty = @(x1,x2) 2.97*x1 - 2*x2 - 0.57;


% initialize the population

genomes = randi([0,1], population, x1_length+x2_length);

for gen = 1:generation

	phenomes = decode(genomes, x1_length, x2_length, x1_min, x1_max, x2_min, x2_max);

	%compute fitness values with penalty

	fitness = calculate_fitness (population, phenomes, objective, penalty);

	% Roulette Wheel Selection

%	N = population*2;		% how many number of members to generate
%	Roulette_index = sum( bsxfun(@ge, rand(N,1), transpose(cumsum(fitness./sum(fitness)))), 2) + 1;
	Roulette_index = roulette_wheel_selection (population, fitness);

	% Crossover

	genomes_new = crossover (population, genomes, Roulette_index, x1_length, x2_length, crossover_prob);

	phenomes_new = decode(genomes_new, x1_length, x2_length, x1_min, x1_max, x2_min, x2_max);
	fitness_new = calculate_fitness(population, phenomes_new, objective, penalty);

	% Mutation

	genomes = mutation (genomes, mutation_prob);
    
    genomes = mix_population (genomes, genomes_new, fitness, fitness_new, crossover_prob);
        
        temp = sum(fitness)/population;
		plot(gen, ((1/temp)-1), '--rs', 'MarkerSize',10);
		hold on;	
		title('Objective function value');
        xlabel('Generation');
        ylabel('Objective function value');
end

phenomes = decode(genomes, x1_length, x2_length, x1_min, x1_max, x2_min, x2_max);
fitness = calculate_fitness (population, phenomes, objective, penalty);

[max_fitness, I] = max(fitness);

figure
scatter (phenomes(:,1), phenomes(:,2));
title('Spread of optimal solutions');

%plotting objective and penalty functions
figure
ezsurf(objective);
hold on;
ezsurf(penalty);
plot3(phenomes_new(:,1), phenomes(:,2), feval(objective, phenomes(:,1), phenomes(:,2)), '--bs', 'MarkerSize', 10);

fprintf('The optimal solution is found to be:\n X1 = %0.5f and X2 = %0.5f\n', phenomes(I, 1), phenomes(I,2));