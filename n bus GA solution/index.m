function [fitness, solution, stats] = index(n, population, generation, Pc, Pm)
        
    x_min =  [0.075958, 0.084889, 0.07042, 0.07042, 0.04329, 0.08254, 0.07779, 0.08254, 0.05714, 0.071813, 0.07174, 0.084889, 0.073746, 0.07776];
    x_max = [1.2, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2];
    
    fitness = zeros(n,1);
    solution = [];
    cons_violated = zeros(n,1);
    stats = zeros(7,1);
    i=1;
    
    while (i<=n)
        
        clc
        fprintf('Iteration: %d\n', i);
    
        [fitness(i), temp_solution, cons_violated(i)] = n_bus_GA(x_min, x_max, population, generation, Pc, Pm);
        solution = [solution; temp_solution];
        fitness(i) = 1/fitness(i) - 1;
        
        if (fitness(i) > 25)
            i=i-1; 
        end
        
        i=i+1;
    
    end
    
    stats(1) = max(fitness);
    stats(2) = min(fitness);
    stats(3) = mean(fitness);
    stats(4) = median(fitness);
    stats(5) = std(fitness);
    stats(6) = mean(cons_violated);
    stats(7) = median(cons_violated);
    
end