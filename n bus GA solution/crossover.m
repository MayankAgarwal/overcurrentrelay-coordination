function [genomes]  = crossover(population, genomes, roulette_index, x_length, n, Pc)

	for i=1:population

		temp_prob = rand();

		if temp_prob < Pc

			random_position = randi([1,x_length], 1, n);
            
            for j=1:n
                
                temp = genomes(roulette_index(2*i-1), (j-1)*x_length + random_position(j):j*x_length);
                genomes(roulette_index(2*i-1), (j-1)*x_length + random_position(j):j*x_length) = genomes(roulette_index(2*i), (j-1)*x_length + random_position(j):j*x_length);
                genomes(roulette_index(2*i), (j-1)*x_length + random_position(j):j*x_length) = temp;
                
            end

		end
	end
end