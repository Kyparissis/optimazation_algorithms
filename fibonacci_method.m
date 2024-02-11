%   Implemetation of the FIBONACCI optimazation method for finding a
% narrow interval of a function's minima.
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
function [finalIntervalOfMin, a, b, objectiveFunctionCalculCOUNTER, k] = fibonacci_method(f, initialSearchInterval, l)
    
    % Computing the number of calculations of the objective function f(x) ,
    % so that Fn > (b(1) - a(1)) / l
    % =====================================================================
    n = 1;

    while (((initialSearchInterval(2) - initialSearchInterval(1)) / l) > fibonacci(n))
        n = n + 1;
    end
    % =====================================================================
    
    % INITIALIZATION
    % ______________
    x1 = zeros(1, n);
    x2 = zeros(1, n);

    a = zeros(1, n);
    b = zeros(1, n);
    a(1) = initialSearchInterval(1);
    b(1) = initialSearchInterval(2);
    
    x1(1) = a(1) + (fibonacci(n - 2) / fibonacci(n)) * (b(1) - a(1));
    x2(1) = a(1) + (fibonacci(n - 1) / fibonacci(n)) * (b(1) - a(1));
    
    for k = 1:(n - 1)
        if ( f(x1(k)) > f(x2(k)) )
            % STEP #2
            a(k + 1) = x1(k);
            b(k + 1) = b(k);
            
            % Calculating the value of f(x2(k + 1)) (f(x1(k + 1)) is known)
            x1(k + 1) = x2(k);
            x2(k + 1) = a(k + 1) + (fibonacci(n - k) / fibonacci(n - k + 1)) * (b(k + 1) - a(k + 1));

        else
            % STEP #3
            a(k + 1) = a(k);
            b(k + 1) = x2(k);
            
            % Calculating the value of f(x1(k + 1)) (f(x2(k + 1)) is known)
            x1(k + 1) = a(k + 1) + (fibonacci(n - k - 1) / fibonacci(n - k + 1)) * (b(k + 1) - a(k + 1));
            x2(k + 1) = x1(k);
        end
    end 

    %______________
    finalIntervalOfMin(1) = a(n);
    finalIntervalOfMin(2) = b(n); 
    
    objectiveFunctionCalculCOUNTER = n; % 2 for k=1, 2 for every k = 2,3,4...(n-1)
end % End of function
