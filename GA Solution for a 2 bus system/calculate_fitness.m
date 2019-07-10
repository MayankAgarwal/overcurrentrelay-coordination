function fitness = calculate_fitness (population, genomes, objective, penalty)

	fitness = zeros(population,1);

	for i = 1:population
	
		fitness_temp = feval(objective, genomes(i,1), genomes(i,2));
		penalty_temp = feval(penalty, genomes(i,1), genomes(i,2));

		if penalty_temp<0
			total_fitness = fitness_temp + abs(penalty_temp);
		else
			total_fitness = fitness_temp;
		end

		fitness(i) = 1/(1+total_fitness); 

	end

end