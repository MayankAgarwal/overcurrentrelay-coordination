function [phenomes] = decode(genomes, x_length, x_min, x_max)

    [rows, col] = size(genomes);
    n = col/x_length;       % no. of variables
    
    phenomes = [];
    
    normalize = (x_max - x_min)./(2^x_length - 1);
    
    for i=1:rows
        temp = [];
        
        decoded_string = num2str(genomes(i,:));
        decoded_string = strrep(decoded_string,' ', '');
        
        for j=1:n
            temp  = [temp, bin2dec(decoded_string((j-1)*x_length+1:(j*x_length)))];
        end
        
        temp = x_min + temp.*normalize;
        
        phenomes = [phenomes; temp];
        
    end
    
end