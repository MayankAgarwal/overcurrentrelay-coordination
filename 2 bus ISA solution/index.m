% Improved Simulated Annealing
% for Optimal Coordination of Overcurrent Relays 
% in  a 2 bus radial Power system.

clear all;

To = 0.95;                  % Initial temperature
Tf = 1e-8;                  % final temperature
alpha = 0.95;            % cooling rate

objective = @(x1, x2) 2.63*x1 + 2*x2;       % Objective function
constraint = @(x1,x2) 2.97*x1 - 2*x2 - 0.57;    % Coordination Time Interval (CTI)

% lower and upper bounds on variables
x1_lower = 0.076;
x1_upper = 1.2;
x2_lower = 0.1;
x2_upper = 1.2;

x1 = x1_lower + (x1_upper - x1_lower)*rand(1,10);       % Initial solution for variable X1
x2 = x2_lower + (x2_upper - x2_lower)*rand(1,10);       % Initial solution for variable X2

T = To;         % Initialiazing current temperature as initial temperature

 % computing the fittest solution of the randomly generated initial population

[fun_solution, index_min] = compute_fittest (objective, constraint, x1, x2, x1_lower, x1_upper, x2_lower, x2_upper);       
x1_solution = x1(index_min);
x2_solution = x2(index_min);

figure;
ezsurf(objective);
hold on;
ezsurf(constraint);

while (T>Tf)
    
   iteration = 1; 
    while (iteration ~= 20)
    x1_new = x1_solution + (x1_upper - x1_lower)* (-1 + 2*rand(1,10));
    x2_new = x2_solution + (x2_upper - x2_lower) * (-1 + 2*rand(1,10));
    [x1_new x2_new] = prune_solutions(x1_new, x2_new, x1_lower, x1_upper, x2_lower, x2_upper);
    
    [new_fun_solution, new_index_min] = compute_fittest (objective, constraint, x1_new, x2_new, x1_lower, x1_upper, x2_lower, x2_upper);
    
    if (new_fun_solution < fun_solution)
        x1_solution = x1_new(new_index_min);
        x2_solution = x2_new(new_index_min);
        fun_solution = new_fun_solution;    
    else
        r= rand();
        probability = exp ( -(new_fun_solution - fun_solution)/T);
        
        if (r<probability)
            x1_solution = x1_new(new_index_min);
            x2_solution = x2_new(new_index_min);
            fun_solution = new_fun_solution;
        end
        
    end
    iteration = iteration +1;
    end
    
    T = alpha * T;
    plot3(x1_solution, x2_solution, fun_solution, '--rs', 'MarkerSize',5);
    xlabel('X1');
    ylabel('X2');
    zlabel('function value');
end


fprintf('The optimal solution is found to be:\n X1 = %0.5f and X2 = %0.5f\n', x1_solution, x2_solution);