function [max_fitness, solution, no_cons_violated] = n_bus_GA (x_min, x_max, population, generation, Pc, Pm)

x_length = 8;      % width of each chromosome for each variable

n = length(x_min);  % no. of variables

T = 1;
alpha = 0.98;

% k=10; % for Adaptive penalty
% case1 = 1;    % 1 means last k solutions were all feasible
% case2 = 1;     % 1 means last k solutions were never feasible
% lambda = 1000;
% b1 = 1.5;
% b2=2;

%initialize population
genomes = randi([0,1], population, n*x_length);
phenomes = decode(genomes, x_length, x_min, x_max);
% Feasiblity check condition
% while(check_feasibility(phenomes, population) == 0)
%     fprintf('Checking feasibility...\n');
%     genomes = randi([0,1], population, n*x_length);
%     phenomes = decode(genomes, x_length, x_min, x_max);
% end

[fitness, ~] = calculate_fitness(population, phenomes, T, 1);
    
% figure;

for gen = 1:generation
    if rem(gen,100)==0
        fprintf('generation: %d, Max. fitness: %f\n', gen, max(fitness));
    end
     T = alpha*T;
    
    %Roulette Wheel selection
    roulette_index = roulette_wheel_selection(population, fitness);
    
    %Crossover
    genomes_new = crossover (population, genomes, roulette_index, x_length, n, Pc);
    
    %Mutation
    genomes_new = mutation(genomes_new, Pm);
    
    phenomes_new = decode(genomes_new, x_length, x_min, x_max);
    [fitness_new, ~] = calculate_fitness(population, phenomes_new, T, gen);
    
    %Mix Population
    genomes = mix_population(genomes, genomes_new, fitness, fitness_new, Pc);
    phenomes = decode(genomes, x_length, x_min, x_max);
    [fitness, ~] = calculate_fitness(population, phenomes, T, gen);
    
    
%     % For Adaptive penalties
%     if (rem(gen, k) ~= 0)
%         [~, index_temp] = max(fitness);
%         if(penalty(phenomes(index_temp, :)) ~= 0)
%             case1 = 0;
%         else
%             case2 = 0;
%         end
%     else
%         if (case1 == 1 && case2 == 0)
%             lambda = lamda/b1;
%         elseif (case1 == 0 && case2 == 1)
%             lambda = b2*lambda;
%         end
%         case1 = 1;
%         case2 = 1;
%     end
        
    %Plotting fitness function values
%         temp = max(fitness);
% 		plot(gen, temp, '--rs', 'MarkerSize',5);
% 		hold on;	
% 		title('Objective function value');
%         xlabel('Generation');
%         ylabel('Objective function value');
                
end

phenomes = decode(genomes, x_length, x_min, x_max);
[fitness, s] = calculate_fitness(population, phenomes, T, gen);

[max_fitness, I] = max(fitness);
solution = phenomes(I, :);
no_cons_violated = s(I);
end