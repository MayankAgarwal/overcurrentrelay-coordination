function [dec] = gray2dec (input)
    
    bin=0;
    output=[];
    
    while input~=0
        temp = rem(input,10);
        input=floor(input/10);
        output = [output temp];
    end

    % GRAY code to BINARY
    
    for i=2:length(output)
        output(i) = xor(output(i-1), output(i)); 
    end
    
    for i=1:length(output)
        bin = bin*10 + output(i);
    end
    
    dec = bin2dec(num2str(bin));
    
end