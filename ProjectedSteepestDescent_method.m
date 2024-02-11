%   This function implements the Projected Steepest Descent optimization method
% to optimize multivariable functions where the variables have constraints.
%% INPUT:
% ------
% f:                        objective function f(x1,x2) (Symbolic Function)
% InitialPoints:            points [x1_1 x2_1] where the algorithm starts searching
% epsilon:                  tolerance
% stepSwitchText:           Switch for stepSwitchChoise
% stepSwitchChoise:         'const'         sets a constant step to gammma (γ)
%                           'ArmijoRule'    sets, per k, a step according to Armijo's Rule
%                           'FuncMinimize'  sets, per k, a step that minimizes the function f(xk + gamma*grad_f(xk)) with respect to gamma
% stepValue:                Initial step value (used for 'ArmijoRule' and 'const' stepSwitchChoise)
% s:                        projection step
% x1_interval:              x1 variable interval / constraints
% x2_interval:              x2 variable interval / constraints
%% OUTPUT:
% ------
% FinalPoints:              the [x1 x2] values where the algorithm stops and declares it found the minimum
% maxIterations:            number of iterations the algorithm runs for
% x_values:                 how the x values change while the algorithm runs
% y_values:                 how the y values change while the algorithm runs
%%
function [FinalPoints, maxIterations, x1_values, x2_values] = ProjectedSteepestDescent_method(f, InitialPoints, epsilon, ...
                                                                                            stepSwitchText, stepSwitchChoise,  stepValue, ...
                                                                                            s, x1_interval, x2_interval)
    
    % Initial points (x1_1,x2_1)
    % =======================
    x1(1) = InitialPoints(1);
    x2(1) = InitialPoints(2);
    
    % Gradient computation ∇f(x1_1,x2_1)
    % =======================
    grad_f = gradient(f);
    J = grad_f(x1(1), x2(1));
    
    k = 1;   % Iterations counter
    while norm(J) >= epsilon && k < 1000
        
        % Search direction calculation
        % =======================
        d = -J;

        % Calculating x1,x2 bar for feasible points
        % =======================
        x1Bar = x1(k) - s*J(1);
        x2Bar = x2(k) - s*J(2);
        % Projecting x1Bar on the set of restraints
        if (x1Bar < x1_interval(1))
            x1Bar = x1_interval(1);
        elseif (x1Bar > x1_interval(2))
            x1Bar = x1_interval(2);
        end
        % Projecting χ2Bar on the set of restraints
        if (x2Bar < x2_interval(1))
            x2Bar = x2_interval(1);
        elseif (x2Bar > x2_interval(2))
            x2Bar = x2_interval(2);
        end


        % --- γ calculation ---
        %        Constant step
        % =============================        
        if (strcmp(stepSwitchText,'StepChoise') && strcmp(stepSwitchChoise,'const'))
            gamma(k) = stepValue;
        end
        %        Armijo Rule step
        % =============================        
        if (strcmp(stepSwitchText,'StepChoise') && strcmp(stepSwitchChoise,'ArmijoRule'))
            m = 0;
            a = 10^(-3);
            b = 1/6;
            s = stepValue;        % Initial step  
            temp_gamma = s*(b^m); % Initial step ( = s )
           
            while ( double((f(x1(k), x2(k))) - (f((x1(k) + temp_gamma*d(1)), (x2(k) + temp_gamma*d(2))))) < -a*(b^(m))*s*(d')*J )
                m = m + 1;
                temp_gamma = s*(b^m);
            end

            gamma(k) = temp_gamma;
        end
        %   Function Minimization step
        % =============================
        if (strcmp(stepSwitchText,'StepChoise') && strcmp(stepSwitchChoise,'FuncMinimize'))
            syms func2minimize(gamma_value)
            func2minimize(gamma_value) = f( x1(k)-gamma_value*J(1) , x2(k)-gamma_value*J(2));
            resultsArr = bisection_withDerivatives_method(func2minimize, [0.001 3], 0.001);
            FinalInterval = resultsArr(1);

            gamma(k) = FinalInterval(1);
        end

        % Update x1 and x2 values
        % =======================
        x1(k + 1) = x1(k) + gamma(k)*(x1Bar - x1(k));
        x2(k + 1) = x2(k) + gamma(k)*(x2Bar - x2(k));
        
        % Update gradient matrix ∇f(x1(k+1),x2(k+1))
        % =======================
        J = grad_f(x1(k + 1), x2(k + 1));

        k = k + 1;  % Update iterations counter
    end
    
    % Return values
    % =======================
    FinalPoints = [x1(k), x2(k)];
    maxIterations = k;
    x1_values = x1;
    x2_values = x2;

%     fprintf("%f", f(x1(k), x2(k)));
end 