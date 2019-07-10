function [flag] = check_feasibility(phenomes, population)
    
    flag=1; % 1 = solution feasible, 0 = solution not feasible
    for i=1:population
        if(penalty(phenomes(i,:)) ~= 0)
            flag=0;
        end
    end
    
end