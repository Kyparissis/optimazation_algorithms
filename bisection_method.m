%   Implemetation of the BISECTION optimazation method for finding
% a narrow interval of a function's minima.
%
%% INPUT:
% ------
% f:                        objective function f(x) (Symbolic Function)
% initialSearchInterval:    a 1x2 vector of the values from the initial search (for the minimum value) interval
% epsilon:                  distance from the bisection (const > 0)
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
function [finalIntervalOfMin, a, b, objectiveFunctionCalculCOUNTER, k] = bisection_method(f, initialSearchInterval, epsilon, l)
    % INITIALIZATION
    % ______________
    a(1) = initialSearchInterval(1);
    b(1) = initialSearchInterval(2);

    k = 1;
    objectiveFunctionCalculCOUNTER = 0;
    
    while ( b(k) - a(k) >= l )
        x1(k) = ((a(k) + b(k)) / 2) - epsilon;
        x2(k) = ((a(k) + b(k)) / 2) + epsilon;
        
        % Calculating the values of both f(x1(k)) and f(x2(k))
        objectiveFunctionCalculCOUNTER = objectiveFunctionCalculCOUNTER + 2;
        if ( f(x1(k)) < f(x2(k)) )
            a(k + 1) = a(k);
            b(k + 1) = x2(k); 
        else
            a(k + 1) = x1(k);
            b(k + 1) = b(k);
        end % End of if 
        
        k = k + 1;
    end % End of while loop #1

    %______________
    finalIntervalOfMin(1) = a(k);
    finalIntervalOfMin(2) = b(k);
end % End of function
