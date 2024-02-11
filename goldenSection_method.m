%   Implemetation of the GOLDEN SECTION optimazation method for finding
% a narrow interval of a function's minima.
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
function [finalIntervalOfMin, a, b, objectiveFunctionCalculCOUNTER, k] = goldenSection_method(f, initialSearchInterval, l)
    % INITIALIZATION
    % ______________
    a(1) = initialSearchInterval(1);
    b(1) = initialSearchInterval(2);
    
    % Constant of proportionality ( gamma )
    gamma = (sqrt(5)/2) - (1/2); %  Actually, gamma^2 + gamma - 1 = 0 =>
                                 %            => gamma(1) = -(1/2) - (sqrt(5)/2)  = -1.618 ( REJECTED, since  0 < gamma < 1 ),
                                 %      AND   => gamma(2) = (sqrt(5)/2) - (1/2) = 0.618
                                 % So, gamma = (sqrt(5)/2) - (1/2) = 0.618


    x1(1) = a(1) + (1 - gamma)*(b(1) - a(1));
    x2(1) = a(1) + gamma*(b(1) - a(1));
    
    % Calculating the values of f(x1(1)) and f(x2(1))
    objectiveFunctionCalculCOUNTER = 2;
    
    k = 1;

    while (b(k) - a(k) >= l)
        if (f(x1(k)) > f(x2(k)))
            a(k + 1) = x1(k);
            b(k + 1) = b(k);

            x2(k + 1) = a(k + 1) + gamma*(b(k + 1) - a(k + 1));
            x1(k + 1) = x2(k);
            
            % Calculating the value of f(x2(k + 1)) (f(x1(k + 1)) is known)
            objectiveFunctionCalculCOUNTER = objectiveFunctionCalculCOUNTER + 1;
        else
            a(k + 1) = a(k);
            b(k + 1) = x2(k);

            x2(k + 1) = x1(k);
            x1(k + 1) = a(k + 1) + (1 - gamma)*(b(k + 1) - a(k + 1));

            % Calculating the value of f(x1(k + 1)) (f(x2(k + 1)) is known)
            objectiveFunctionCalculCOUNTER = objectiveFunctionCalculCOUNTER + 1;
        end
        k = k + 1;
    end

    %______________
    finalIntervalOfMin(1) = a(k);
    finalIntervalOfMin(2) = b(k);
end % End of function
