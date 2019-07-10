function [decoded] = decode (members, x1_length, x2_length, x1_min, x1_max, x2_min, x2_max)

	[rows, col] = size(members);

	decoded = [];

	for i=1:rows


		decoded_string = num2str(members(i,:));

		decoded_string = strrep(decoded_string, ' ', '');

		decoded = [decoded;bin2dec(decoded_string(1:x1_length)) bin2dec(decoded_string(x1_length+1:end))];

	end

	x1_pre = (x1_max - x1_min) / (2^x1_length - 1);
	x2_pre = (x2_max - x2_min) / (2^x2_length - 1); 

	decoded = [(x1_min + x1_pre.*decoded(:,1)) (x2_min + x2_pre.*decoded(:,2))];

end