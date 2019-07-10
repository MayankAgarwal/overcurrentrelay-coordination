function genomes_final = mix_population (genomes, genomes_new, fitness, fitness_new, crossover_prob)

	[rows, ~] = size(genomes);

	new_genomes_number = floor(rows*0.90); %floor(rows * crossover_prob);
	old_genomes_number = rows - new_genomes_number;

	[~, old_indices] = sort(fitness,1, 'descend');
	[~, new_indices] = sort(fitness_new, 1, 'descend');

	genomes_final = [genomes(old_indices(1:old_genomes_number), :); genomes_new(new_indices(1:new_genomes_number), :)];

end