function fitness = calculate_fitness (population, phenomes, objective, penalty)

	fitness = zeros(population,1);

	for i = 1:population
	
		fitness_temp = feval(objective, phenomes(i,1), phenomes(i,2));
		penalty_temp = feval(penalty, phenomes(i,1), phenomes(i,2));

		if penalty_temp<0
			total_fitness = abs(fitness_temp + abs(10*penalty_temp));
		else
			total_fitness = fitness_temp;
		end

		fitness(i) = 1/(1+total_fitness); 

	end

end