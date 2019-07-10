function members = mutation (members, mutation_prob)

	[rows, col] = size(members);

	for i=1:rows

		for j=1:col

			temp_prob = rand();

			if temp_prob<mutation_prob

				if members(i,j) == 0
					members(i,j) = 1;
				else
					members(i,j) = 0;
				end
			end

		end
	end

end