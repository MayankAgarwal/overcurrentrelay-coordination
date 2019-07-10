function [fitness, no_const_violated] = calculate_fitness (population, phenomes, T, gen)

    fitness = zeros(population,1);
    no_const_violated = zeros(population,1);
%     fitness_value = zeros(population,1);
%     penalty_value=zeros(population,1);
    
    for i=1:population
        
        fitness_value = objective(phenomes(i,:));
        [penalty_value, no_const_violated(i)] = penalty(phenomes(i,:));
      
        %Static Penalty 1
%         if (gen<=100)
%             R=100;
%         elseif (gen>100 && gen<=300)
%             R=200;
%         elseif (gen>300 && gen<=600)
%             R=500;
%         else
%             R=1000;
%         end
%         total_fitness = fitness_value + R*abs(penalty_value);
        
%         %Dynamic Penalty
%         C=0.5;
%         total_fitness = fitness_value + (C*gen)^2*penalty_value^2;
        
%         %Annealing Penalty
        %temp = exp(-penalty_value/T);
        %total_fitness = temp * fitness_value;
        total_fitness = fitness_value + abs(penalty_value)^2 / (T);
        fitness(i) = 1/(1+total_fitness);

%         % Adaptive Penalty
%         total_fitness = fitness_value + lambda * abs(penalty_value)^2;


%           fitness(i) = 1/(1+total_fitness);
        
    end
    
% %     %Penalty based on Feasibilty
%     temp = penalty_value==0;
%     fitness(temp) = fitness_value(temp);
%     
%     f_worst = max(fitness_value(temp));
%     if isempty(f_worst) == 1
%         f_worst = 0;
%     end
%     fitness(not(temp)) = f_worst + abs(penalty_value(not(temp)));
    
%     fitness = 1./(1+fitness); 
    
end