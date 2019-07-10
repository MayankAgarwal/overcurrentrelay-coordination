function [value, index_min] = compute_fittest (objective, constraint, x1, x2, x1_lower, x1_upper, x2_lower, x2_upper)

    objective_value = feval(objective,x1,x2);
    constraint_value = feval(constraint, x1, x2);
    
    temp = constraint_value > 0;
    constraint_value(temp) = 0;                         % cancelling all values that satisfy the constraints
    constraint_value = -constraint_value;       % converting non-satisfying constraint values to postive
    
    net_fitness = objective_value + 10*constraint_value;
    
    %temp = x1<x1_lower | x1>x1_upper;
    %net_fitness(temp) = Inf;
    %temp = x2<x2_lower | x2>x2_upper;
    %net_fitness(temp) = Inf;
    
    [value, index_min] = min(net_fitness);

end