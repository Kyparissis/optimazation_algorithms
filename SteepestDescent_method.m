%   This function implements the Steepest Descent optimization method
% to optimize multivariable functions without conditions.
%% INPUT:
% ------
% f:                        objective function f(x, y) (Symbolic Function)
% InitialPoints:            points [x y] where the algorithm starts searching
% epsilon:                  tolerance
% stepSwitchText:           Switch for stepSwitchChoise
% stepSwitchChoise:         'const'         sets a constant step to gammma (γ)
%                           'ArmijoRule'    sets, per k, a step according to Armijo's Rule
%                           'FuncMinimize'  sets, per k, a step that minimizes the function f(xk + gamma*grad_f(xk)) with respect to gamma
% stepValue:                Initial step value (used for 'ArmijoRule' and 'const' stepSwitchChoise)
%% OUTPUT:
% ------
% FinalPoints:              the [x y] values where the algorithm stops and declares it found the minimum
% maxIterations:            number of iterations the algorithm runs for
% x_values:                 how the x values change while the algorithm runs
% y_values:                 how the y values change while the algorithm runs
%%
function [FinalPoints, maxIterations, x_values, y_values] = SteepestDescent_method(f, InitialPoints, epsilon, stepSwitchText, stepSwitchChoise, stepValue)
    
    % Initial points (x1,y1)
    % =======================
    x(1) = InitialPoints(1);
    y(1) = InitialPoints(2);
    
    % Gradient computation ∇f(x1,y1)
    % =======================
    grad_f = gradient(f);
    J = grad_f(x(1), y(1));
    
    k = 1;   % Iterations counter
    while norm(J) >= epsilon
        
        % Search direction calculation
        % =======================
        d = -J;
        
        % --- γ calculation ---
        %        Constant step
        % =============================        
        if (strcmp(stepSwitchText,'StepChoise') && strcmp(stepSwitchChoise,'const'))
            gamma(k) = stepValue;
        end
        %        Constant step
        % =============================        
        if (strcmp(stepSwitchText,'StepChoise') && strcmp(stepSwitchChoise,'ArmijoRule'))
            m = 0;
            a = 10^(-3);
            b = 1/6;
            s = stepValue;        % Initial step  
            temp_gamma = s*(b^m); % Initial step ( = s )
           
            while ( double((f(x(k), y(k))) - (f((x(k) + temp_gamma*d(1)), (y(k) + temp_gamma*d(2))))) < -a*(b^(m))*s*(d')*J )
                m = m + 1;
                temp_gamma = s*(b^m);
            end

            gamma(k) = temp_gamma;
        end
        %        Constant step
        % =============================
        if (strcmp(stepSwitchText,'StepChoise') && strcmp(stepSwitchChoise,'FuncMinimize'))
            syms func2minimize(gamma_value)
            func2minimize(gamma_value) = f( x(k)-gamma_value*J(1) , y(k)-gamma_value*J(2));
            resultsArr = bisection_withDerivatives_method(func2minimize, [0.001 3], 0.001);
            FinalInterval = resultsArr(1);

            gamma(k) = FinalInterval(1);
        end

        % Update x and y values
        % =======================
        x(k + 1) = x(k) + gamma(k)*d(1);
        y(k + 1) = y(k) + gamma(k)*d(2);
        
        % Update gradient matrix ∇f(x(k),y(k))
        % =======================
        J = grad_f(x(k + 1), y(k + 1));

        k = k + 1;  % Update iterations counter
    end
    
    % Return values
    % =======================
    FinalPoints = [x(k), y(k)];
    maxIterations = k;
    x_values = x;
    y_values = y;
end 