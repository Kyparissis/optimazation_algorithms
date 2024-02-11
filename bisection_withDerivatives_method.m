%   Implemetation of the BISECTION optimazation method (USING FUNCTION DERIVATIVES)  
% for finding a narrow interval of a function's minima.
%
%% INPUT:
% ------
% f:                        objective function f(x) (Symbolic Function)
% initialSearchInterval:    a 1x2 vector of the values from the initial search (for the minimum value) interval
% l:                        final range of search interval (const > 0), tolerance
%
%% OUTPUT:
% ------
% finalIntervalOfMin:               a 1x2 vector of the values from the narrowest interval the function's minima value exists in. ( == b(k) - a(k) )
% a:                                a vector of ALL the values from the lower limits of the interval the minimum value exists in.
% b:                                a vector of ALL the values from the upper limits of the interval the minimum value exists in.
% objectiveFunctionCalculCOUNTER:   Counter to hold the number of times the obj. function has been calculated
% k:                                Max number of iterations
%%
function [finalIntervalOfMin, a, b, objectiveFunctionCalculCOUNTER, k] = bisection_withDerivatives_method(f, initialSearchInterval, l)
    
    dfx = diff(f); % Differentiating the function f with respect to x (dfx = df(x)/dx)
    
    % Computing the number of calculations of the objective function f(x) ,
    % so that ((1/2)^n) > (l / (b(1) - a(1)))
    % =====================================================================
    n = 1;

    while (((1/2)^n) > (l / (initialSearchInterval(2) - initialSearchInterval(1)))) 
        n = n + 1;
    end
    % =====================================================================

    % INITIALIZATION
    % ______________
    x = zeros(1, n);

    a = zeros(1, n);
    b = zeros(1, n);
    a(1) = initialSearchInterval(1);
    b(1) = initialSearchInterval(2);

    for k = 1:n
        x(k) = (a(k) + b(k)) / 2;
        
        % Calculation the value only of dfx(x(k))
%       objectiveFunctionCalculCOUNTER = objectiveFunctionCalculCOUNTER + 1;
        if (dfx(x(k)) == 0)
            % Then, there is no interval. Exact value of min is found
            % Returning value as an single value "interval" [x(k), x(k)]
            finalIntervalOfMin(1) = x(k);
            finalIntervalOfMin(2) = x(k);

            return;
        elseif (dfx(x(k)) > 0)
            a(k + 1) = a(k);
            b(k + 1) = x(k);
        else
            a(k + 1) = x(k);
            b(k + 1) = b(k);
        end
    end
    
    %______________
    k = k + 1;
    
    finalIntervalOfMin(1) = a(n + 1);
    finalIntervalOfMin(2) = b(n + 1); 

    objectiveFunctionCalculCOUNTER = n; % 1 calculation per iteration
end % End of function
