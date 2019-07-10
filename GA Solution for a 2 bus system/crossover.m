function [members]  = crossover(members, roulette_index, x1_length, x2_length, crossover_probability)

	rows = length(roulette_index);

	for i=1:(rows/2)

		temp_prob = rand();

		if temp_prob < crossover_probability

			random_position_1 = randi([1, x1_length], 1, 1);
			random_position_2 = randi([1, x2_length], 1, 1);

			temp_1 = members(roulette_index(i*2 - 1), random_position_1:x1_length);
			temp_2 = members(roulette_index(i*2 - 1), (x1_length+random_position_2):end);

			members(roulette_index(i*2 - 1), random_position_1:x1_length) = members(roulette_index(i*2), random_position_1:x1_length);
			members(roulette_index(i*2 - 1), (x1_length + random_position_2):end) = members(roulette_index(i*2), (x1_length + random_position_2):end);
			
			members(roulette_index(i*2), random_position_1:x1_length) = temp_1;
			members(roulette_index(i*2), (x1_length+random_position_2):end) = temp_2;

		end
	end
end