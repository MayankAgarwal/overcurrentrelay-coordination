function [x1,x2] = prune_solutions(x1,x2,x1_lower,x1_upper, x2_lower, x2_upper)
    x1(x1<x1_lower) = x1_lower;
    x1(x1>x1_upper) = x1_upper;
    x2(x2<x2_lower) = x2_lower;
    x2(x2>x2_upper) = x2_upper;
end