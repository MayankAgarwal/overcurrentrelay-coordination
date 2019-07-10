function [index] = roulette_wheel_selection (population, fitness)

	total_sum = sum(fitness);
	individual_probability = fitness./total_sum;
	cumulative_probability = individual_probability;

	index = zeros(population*2,1);

	for i=1:population-1
		cumulative_probability(i+1) = sum(individual_probability(1:i));
	end;
	cumulative_probability(1)=0;


	for i=1:population*2
		temp = rand();

		index(i)=find(cumulative_probability<temp, 1, 'last' );
	end

end