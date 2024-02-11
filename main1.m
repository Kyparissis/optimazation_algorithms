clc;        % Clearing the console
close all;  % Closing all windows/figures
clear;      % Clearing the workspace

%%      ARISTOTLE UNIVERSITY OF THESSALONIKI
%              School of Engineering
%  Department of Electrical and Computer Engineering
%% =-=-=-=-= Optimization Techniques COURSE =-=-=-=-=
%%              1st LAB Assignment
%   Finding the minima of a convex, single-variable, 
% function in a given interval.
%
%% Author: Kyparissis Kyparissis 
%         ( University ID: 10346 )
%% NOTES:
%   Please give the code some time to run, it's kinda slow due to  
%  many for-loops.

%% Declaring the 3 functions.
% Also, ploting those 3 functions to prove they are convex.
initialSearchInterval = [-1, 3];

% ====> For f_1(x):
syms f_1(x)
f_1(x) = (x - 2)^2 + x*log(x + 3);

figure('Name', 'Plot of f_1(x)')
fplot(f_1, initialSearchInterval);
xlabel('x');
ylabel('f_{1}(x)');
title(['Plot of f_{1}(x) = (x - 2)^{2} + x \cdot ln(x + 3) ' ,'    , x \in [' , num2str(initialSearchInterval(1)), ', ', num2str(initialSearchInterval(2)), ']']);
subtitle([])
saveas(gcf, [pwd '/plots/f_1-plot.png']);

% ====> For f_2(x):
syms f_2(x)
f_2(x) = 5^x + (2 - cos(x))^2;

figure('Name', 'Plot of f_2(x)')
fplot(f_2, initialSearchInterval);
xlabel('x');
ylabel('f_{2}(x)');
title(['Plot of f_{2}(x) = 5^{x} + (2 - cos(x))^{2}' ,'    , x \in [' , num2str(initialSearchInterval(1)), ', ', num2str(initialSearchInterval(2)), ']']);
saveas(gcf, [pwd '/plots/f_2-plot.png']);

% ====> For f_3(x):
syms f_3(x)
f_3(x) = exp(x)*((x^3) - 1) + (x - 1)*sin(x);

figure('Name', 'Plot of f_3(x)')
fplot(f_3, initialSearchInterval);
xlabel('x');
ylabel('f_{3}(x)');
title(['Plot of f_{3}(x) = e^{x} \cdot (x^{3} - 1) + (x - 1) \cdot sin(x)' ,'    , x \in [' , num2str(initialSearchInterval(1)), ', ', num2str(initialSearchInterval(2)), ']']);
saveas(gcf, [pwd '/plots/f_3-plot.png']);

%% 1st PART
%% ( BISECTION METHOD )
% Keeping l = const and changing the epsilon > 0 value.
l = 0.01;
% ====> For f_1(x):
sampleSize = 100;
epsilon = linspace(0.0001, (l/2 - 0.0001), sampleSize); % 0 < epsilon < l/2

objectiveFunction_CalculCOUNTER = zeros(1, sampleSize);

for i = 1:length(epsilon)
    [~, ~, ~, objectiveFunction_CalculCOUNTER(i)] = bisection_method(f_1, initialSearchInterval, epsilon(i), l);
end
figure('Name', ['BISECTION METHOD | Calculations of obj. function f_1 for const. l = ', num2str(l)]);
plot(epsilon, objectiveFunction_CalculCOUNTER);
title(['Calculations of obj. function for const. l = ', num2str(l)])
subtitle({'( For function f_{1}(x) = (x - 2)^{2} + x \cdot ln(x + 3) )'; 'BISECTION METHOD'})
xlabel('\epsilon (distance from the bisection)');
ylabel('Number of objective function calculations');
saveas(gcf, [pwd '/plots/part1-bisection_method/NumberOfObjFuncCalcs-constLambda-f_1.png']);

% ====> For f_2(x):
sampleSize = 100;
epsilon = linspace(0.0001, (l/2 - 0.0001), sampleSize);

objectiveFunction_CalculCOUNTER = zeros(1, sampleSize);

for i = 1:length(epsilon)
    [~, ~, ~, objectiveFunction_CalculCOUNTER(i)] = bisection_method(f_2, initialSearchInterval, epsilon(i), l);
end
figure('Name', ['BISECTION METHOD | Calculations of obj. function f_2 for const. l = ', num2str(l)]);
plot(epsilon, objectiveFunction_CalculCOUNTER);
title(['Calculations of obj. function for const. l = ', num2str(l)])
subtitle({'( For function f_{2}(x) = 5^{x} + (2 - cos(x))^{2} )'; 'BISECTION METHOD'})
xlabel('\epsilon (distance from the bisection)');
ylabel('Number of objective function calculations');
saveas(gcf, [pwd '/plots/part1-bisection_method/NumberOfObjFuncCalcs-constLambda-f_2.png']);

% ====> For f_3(x):
sampleSize = 100;
epsilon = linspace(0.0001, (l/2 - 0.0001), sampleSize);

objectiveFunction_CalculCOUNTER = zeros(1, sampleSize);

for i = 1:length(epsilon)
    [~, ~, ~, objectiveFunction_CalculCOUNTER(i)] = bisection_method(f_3, initialSearchInterval, epsilon(i), l);
end
figure('Name', ['BISECTION METHOD | Calculations of obj. function f_3 for const. l = ', num2str(l)]);
plot(epsilon, objectiveFunction_CalculCOUNTER);
title(['Calculations of obj. function for const. l = ', num2str(l)])
subtitle({'( For function f_{3}(x) = e^{x} \cdot (x^{3} - 1) + (x - 1) \cdot sin(x) )'; 'BISECTION METHOD'})
xlabel('\epsilon (distance from the bisection)');
ylabel('Number of objective function calculations');
saveas(gcf, [pwd '/plots/part1-bisection_method/NumberOfObjFuncCalcs-constLambda-f_3.png']);

% ___________________________________________________________
% Keeping the epsilon = const and changing the l > 0 value.
epsilon = 0.001;
% ====> For f_1(x):
sampleSize = 100;
l = linspace(0.005, 2, sampleSize);

objectiveFunction_CalculCOUNTER = zeros(1, sampleSize);

for i = 1:length(l)
    [~, ~, ~, objectiveFunction_CalculCOUNTER(i)] = bisection_method(f_1, initialSearchInterval, epsilon, l(i));
end
figure('Name', ['BISECTION METHOD | Calculations of obj. function f_1 for const. \epsilon = ', num2str(epsilon)]);
plot(l, objectiveFunction_CalculCOUNTER);
title(['Calculations of obj. function for const. \epsilon = ', num2str(epsilon)])
subtitle({'( For function f_{1}(x) = (x - 2)^{2} + x \cdot ln(x + 3) )'; 'BISECTION METHOD'})
xlabel('l (tolerance / final search interval length)');
ylabel('Number of objective function calculations');
saveas(gcf, [pwd '/plots/part1-bisection_method/NumberOfObjFuncCalcs-constEpsilon-f_1.png']);

% ====> For f_2(x):
sampleSize = 100;
l = linspace(0.005, 2, sampleSize);

objectiveFunction_CalculCOUNTER = zeros(1, sampleSize);

for i = 1:length(l)
    [~, ~, ~, objectiveFunction_CalculCOUNTER(i)] = bisection_method(f_2, initialSearchInterval, epsilon, l(i));
end
figure('Name', ['BISECTION METHOD | Calculations of obj. function f_2 for const. \epsilon = ', num2str(epsilon)]);
plot(l, objectiveFunction_CalculCOUNTER);
title(['Calculations of obj. function for const. \epsilon = ', num2str(epsilon)])
subtitle({'( For function f_{2}(x) = 5^{x} + (2 - cos(x))^{2} )'; 'BISECTION METHOD'})
xlabel('l (tolerance / final search interval length)');
ylabel('Number of objective function calculations');
saveas(gcf, [pwd '/plots/part1-bisection_method/NumberOfObjFuncCalcs-constEpsilon-f_2.png']);

% ====> For f_3(x):
sampleSize = 100;
l = linspace(0.005, 2, sampleSize);

objectiveFunction_CalculCOUNTER = zeros(1, sampleSize);

for i = 1:length(l)
    [~, ~, ~, objectiveFunction_CalculCOUNTER(i)] = bisection_method(f_3, initialSearchInterval, epsilon, l(i));
end
figure('Name', ['BISECTION METHOD | Calculations of obj. function f_3 for const. \epsilon = ', num2str(epsilon)]);
plot(l, objectiveFunction_CalculCOUNTER);
title(['Calculations of obj. function for const. \epsilon = ', num2str(epsilon)])
subtitle({'( For function f_{3}(x) = e^{x} \cdot (x^{3} - 1) + (x - 1) \cdot sin(x) )'; 'BISECTION METHOD'})
xlabel('l (tolerance / final search interval length)');
ylabel('Number of objective function calculations');
saveas(gcf, [pwd '/plots/part1-bisection_method/NumberOfObjFuncCalcs-constEpsilon-f_3.png']);

% ___________________________________________________________
% Calculate how the edges of the intervals change for different l values
epsilon = 0.001;
l = [0.005, 0.05, 0.5, 1];
% ====> For f_1(x):
for i = 1:length(l)
    [~, a, b, ~, k_max] = bisection_method(f_1, initialSearchInterval, epsilon, l(i));
    k = 1:1:k_max; % Step index (k)
    figure('Name', ['BISECTION METHOD | Limits of f_1 search interval for l = ', num2str(l(i)), ' and const. \epsilon = ', num2str(epsilon)]);
    plot(k, b);
    hold on;
    plot(k, a);
    ylim(initialSearchInterval + [-1, 1]);
    xlim([1, k_max])
    title(['Limits of search interval for l = ', num2str(l(i)), ' and const. \epsilon = ', num2str(epsilon)])
    subtitle({'( For function f_{1}(x) = (x - 2)^{2} + x \cdot ln(x + 3) )'; 'BISECTION METHOD'})
    xlabel('Step index (k)')
    legend('Upper limit (b_k)','Lower limit (a_k)')
    saveas(gcf, [pwd '/plots/part1-bisection_method/IntervalEdges-number' num2str(i) '-f_1.png']);
end

% ====> For f_2(x):
for i = 1:length(l)
    [~, a, b, ~, k_max] = bisection_method(f_2, initialSearchInterval, epsilon, l(i));
    k = 1:1:k_max; % Step index (k)
    figure('Name', ['BISECTION METHOD | Limits of f_2 search interval for l = ', num2str(l(i)), ' and const. \epsilon = ', num2str(epsilon)]);
    plot(k, b);
    hold on;
    plot(k, a);
    ylim(initialSearchInterval + [-1, 1]);
    xlim([1, k_max])
    title(['Limits of search interval for l = ', num2str(l(i)), ' and const. \epsilon = ', num2str(epsilon)])
    subtitle({'( For function f_{2}(x) = 5^{x} + (2 - cos(x))^{2} )'; 'BISECTION METHOD'})
    xlabel('Step index (k)')
    legend('Upper limit (b_k)','Lower limit (a_k)')
    saveas(gcf, [pwd '/plots/part1-bisection_method/IntervalEdges-number' num2str(i) '-f_2.png']);
end

% ====> For f_3(x):
for i = 1:length(l)
    [~, a, b, ~, k_max] = bisection_method(f_3, initialSearchInterval, epsilon, l(i));
    k = 1:1:k_max; % Step index (k)
    figure('Name', ['BISECTION METHOD | Limits of f_3 search interval for l = ', num2str(l(i)), ' and const. \epsilon = ', num2str(epsilon)]);
    plot(k, b);
    hold on;
    plot(k, a);
    ylim(initialSearchInterval + [-1, 1]);
    xlim([1, k_max])
    title(['Limits of search interval for l = ', num2str(l(i)), ' and const. \epsilon = ', num2str(epsilon)])
    subtitle({'( For function f_{3}(x) = e^{x} \cdot (x^{3} - 1) + (x - 1) \cdot sin(x) )'; 'BISECTION METHOD'})
    xlabel('Step index (k)')
    legend('Upper limit (b_k)','Lower limit (a_k)')
    saveas(gcf, [pwd '/plots/part1-bisection_method/IntervalEdges-number' num2str(i) '-f_3.png']);
end

%% 2nd PART
%% ( GOLDEN SECTION METHOD ) 
% Study the change on calculations of the objective function for different l values
% ====> For f_1(x):
sampleSize = 100;
l = linspace(0.005, 2, sampleSize);

objectiveFunction_CalculCOUNTER = zeros(1, sampleSize);

for i = 1:length(l)
    [~, ~, ~, objectiveFunction_CalculCOUNTER(i)] = goldenSection_method(f_1, initialSearchInterval, l(i));
end
figure('Name', 'GOLDEN SECTION METHOD | Calculations of obj. function f_1');
plot(l, objectiveFunction_CalculCOUNTER);
title('Calculations of obj. function')
subtitle({'( For function f_{1}(x) = (x - 2)^{2} + x \cdot ln(x + 3) )'; 'GOLDEN SECTION METHOD'})
xlabel('l (tolerance / final search interval length)');
ylabel('Number of objective function calculations');
saveas(gcf, [pwd '/plots/part2-goldenSection_method/NumberOfObjFuncCalcs-f_1.png']);

% ====> For f_2(x):
sampleSize = 100;
l = linspace(0.005, 2, sampleSize);

objectiveFunction_CalculCOUNTER = zeros(1, sampleSize);

for i = 1:length(l)
    [~, ~, ~, objectiveFunction_CalculCOUNTER(i)] = goldenSection_method(f_2, initialSearchInterval, l(i));
end
figure('Name', 'GOLDEN SECTION METHOD | Calculations of obj. function f_2');
plot(l, objectiveFunction_CalculCOUNTER);
title('Calculations of obj. function')
subtitle({'( For function f_{2}(x) = 5^{x} + (2 - cos(x))^{2} )'; 'GOLDEN SECTION METHOD'})
xlabel('l (tolerance / final search interval length)');
ylabel('Number of objective function calculations');
saveas(gcf, [pwd '/plots/part2-goldenSection_method/NumberOfObjFuncCalcs-f_2.png']);

% ====> For f_3(x):
sampleSize = 100;
l = linspace(0.005, 2, sampleSize);

objectiveFunction_CalculCOUNTER = zeros(1, sampleSize);

for i = 1:length(l)
    [~, ~, ~, objectiveFunction_CalculCOUNTER(i)] = goldenSection_method(f_3, initialSearchInterval, l(i));
end
figure('Name', 'GOLDEN SECTION METHOD | Calculations of obj. function f_3');
plot(l, objectiveFunction_CalculCOUNTER);
title('Calculations of obj. function')
subtitle({'( For function f_{3}(x) = e^{x} \cdot (x^{3} - 1) + (x - 1) \cdot sin(x) )'; 'GOLDEN SECTION METHOD'})
xlabel('l (tolerance / final search interval length)');
ylabel('Number of objective function calculations');
saveas(gcf, [pwd '/plots/part2-goldenSection_method/NumberOfObjFuncCalcs-f_3.png']);

% ___________________________________________________________
% Calculate how the edges of the intervals change for different l values
% ====> For f_1(x):
l = [0.005, 0.05, 0.5, 1];
% ====> For f_1(x):
for i = 1:length(l)
    [~, a, b, ~, k_max] = goldenSection_method(f_1, initialSearchInterval, l(i));
    k = 1:1:k_max; % Step index (k)
    figure('Name', ['GOLDEN SECTION METHOD | Limits of f_1 search interval for l = ', num2str(l(i))]);
    plot(k, b);
    hold on;
    plot(k, a);
    ylim(initialSearchInterval + [-1, 1]);
    xlim([1, k_max])
    title(['Limits of search interval for l = ', num2str(l(i))])
    subtitle({'( For function f_{1}(x) = (x - 2)^{2} + x \cdot ln(x + 3) )'; 'GOLDEN SECTION METHOD'})
    xlabel('Step index (k)')
    legend('Upper limit (b_k)','Lower limit (a_k)')
    saveas(gcf, [pwd '/plots/part2-goldenSection_method/IntervalEdges-number' num2str(i) '-f_1.png']);
end

% ====> For f_2(x):
for i = 1:length(l)
    [~, a, b, ~, k_max] = goldenSection_method(f_2, initialSearchInterval, l(i));
    k = 1:1:k_max; % Step index (k)
    figure('Name', ['GOLDEN SECTION METHOD | Limits of f_2 search interval for l = ', num2str(l(i))]);
    plot(k, b);
    hold on;
    plot(k, a);
    ylim(initialSearchInterval + [-1, 1]);
    xlim([1, k_max])
    title(['Limits of search interval for l = ', num2str(l(i))])
    subtitle({'( For function f_{2}(x) = 5^{x} + (2 - cos(x))^{2} )'; 'GOLDEN SECTION METHOD'})
    xlabel('Step index (k)')
    legend('Upper limit (b_k)','Lower limit (a_k)')
    saveas(gcf, [pwd '/plots/part2-goldenSection_method/IntervalEdges-number' num2str(i) '-f_2.png']);
end

% ====> For f_3(x):
for i = 1:length(l)
    [~, a, b, ~, k_max] = goldenSection_method(f_3, initialSearchInterval, l(i));
    k = 1:1:k_max; % Step index (k)
    figure('Name', ['GOLDEN SECTION METHOD | Limits of f_3 search interval for l = ', num2str(l(i))]);
    plot(k, b);
    hold on;
    plot(k, a);
    ylim(initialSearchInterval + [-1, 1]);
    xlim([1, k_max])
    title(['Limits of search interval for l = ', num2str(l(i))])
    subtitle({'( For function f_{3}(x) = e^{x} \cdot (x^{3} - 1) + (x - 1) \cdot sin(x) )'; 'GOLDEN SECTION METHOD'})
    xlabel('Step index (k)')
    legend('Upper limit (b_k)','Lower limit (a_k)')
    saveas(gcf, [pwd '/plots/part2-goldenSection_method/IntervalEdges-number' num2str(i) '-f_3.png']);
end

%% 3rd PART
%% ( Same as 2nd PART but using the FIBONACCI METHOD ) 
% Study the change on calculations of the objective function for different l values
% ====> For f_1(x):
sampleSize = 100;
l = linspace(0.005, 2, sampleSize);

objectiveFunction_CalculCOUNTER = zeros(1, sampleSize);

for i = 1:length(l)
    [~, ~, ~, objectiveFunction_CalculCOUNTER(i)] = fibonacci_method(f_1, initialSearchInterval, l(i));
end
figure('Name', 'FIBONACCI METHOD | Calculations of obj. function f_1');
plot(l, objectiveFunction_CalculCOUNTER);
title('Calculations of obj. function')
subtitle({'( For function f_{1}(x) = (x - 2)^{2} + x \cdot ln(x + 3) )'; 'FIBONACCI METHOD'})
xlabel('l (tolerance / final search interval length)');
ylabel('Number of objective function calculations');
saveas(gcf, [pwd '/plots/part3-fibonacci_method/NumberOfObjFuncCalcs-f_1.png']);

% ====> For f_2(x):
sampleSize = 100;
l = linspace(0.005, 2, sampleSize);

objectiveFunction_CalculCOUNTER = zeros(1, sampleSize);

for i = 1:length(l)
    [~, ~, ~, objectiveFunction_CalculCOUNTER(i)] = fibonacci_method(f_2, initialSearchInterval, l(i));
end
figure('Name', 'FIBONACCI METHOD | Calculations of obj. function f_2');
plot(l, objectiveFunction_CalculCOUNTER);
title('Calculations of obj. function')
subtitle({'( For function f_{2}(x) = 5^{x} + (2 - cos(x))^{2} )'; 'FIBONACCI METHOD'})
xlabel('l (tolerance / final search interval length)');
ylabel('Number of objective function calculations');
saveas(gcf, [pwd '/plots/part3-fibonacci_method/NumberOfObjFuncCalcs-f_2.png']);

% ====> For f_3(x):
sampleSize = 100;
l = linspace(0.005, 2, sampleSize);

objectiveFunction_CalculCOUNTER = zeros(1, sampleSize);

for i = 1:length(l)
    [~, ~, ~, objectiveFunction_CalculCOUNTER(i)] = fibonacci_method(f_3, initialSearchInterval, l(i));
end
figure('Name', 'FIBONACCI METHOD | Calculations of obj. function f_3');
plot(l, objectiveFunction_CalculCOUNTER);
title('Calculations of obj. function')
subtitle({'( For function f_{3}(x) = e^{x} \cdot (x^{3} - 1) + (x - 1) \cdot sin(x) )'; 'FIBONACCI METHOD'})
xlabel('l (tolerance / final search interval length)');
ylabel('Number of objective function calculations');
saveas(gcf, [pwd '/plots/part3-fibonacci_method/NumberOfObjFuncCalcs-f_3.png']);

% ___________________________________________________________
% Calculate how the edges of the intervals change for different l values
l = [0.005, 0.05, 0.5, 1];
% ====> For f_1(x):
for i = 1:length(l)
    [~, a, b, ~, k_max] = fibonacci_method(f_1, initialSearchInterval, l(i));
    k = 1:1:(k_max + 1); % Step index (k)
    figure('Name', ['FIBONACCI METHOD | Limits of f_1 search interval for l = ', num2str(l(i))]);
    plot(k, b);
    hold on;
    plot(k, a);
    ylim(initialSearchInterval + [-1, 1]);
    xlim([1, (k_max + 1)])
    title(['Limits of search interval for l = ', num2str(l(i))])
    subtitle({'( For function f_{1}(x) = (x - 2)^{2} + x \cdot ln(x + 3) )'; 'FIBONACCI METHOD'})
    xlabel('Step index (k)')
    legend('Upper limit (b_k)','Lower limit (a_k)')
    saveas(gcf, [pwd '/plots/part3-fibonacci_method/IntervalEdges-number' num2str(i) '-f_1.png']);
end

% ====> For f_2(x):
for i = 1:length(l)
    [~, a, b, ~, k_max] = fibonacci_method(f_2, initialSearchInterval, l(i));
    k = 1:1:(k_max + 1); % Step index (k)
    figure('Name', ['FIBONACCI METHOD | Limits of f_2 search interval for l = ', num2str(l(i))]);
    plot(k, b);
    hold on;
    plot(k, a);
    ylim(initialSearchInterval + [-1, 1]);
    xlim([1, (k_max + 1)])
    title(['Limits of search interval for l = ', num2str(l(i))])
    subtitle({'( For function f_{2}(x) = 5^{x} + (2 - cos(x))^{2} )'; 'FIBONACCI METHOD'})
    xlabel('Step index (k)')
    legend('Upper limit (b_k)','Lower limit (a_k)')
    saveas(gcf, [pwd '/plots/part3-fibonacci_method/IntervalEdges-number' num2str(i) '-f_2.png']);
end

% ====> For f_3(x):
for i = 1:length(l)
    [~, a, b, ~, k_max] = fibonacci_method(f_3, initialSearchInterval, l(i));
    k = 1:1:(k_max + 1); % Step index (k)
    figure('Name', ['FIBONACCI METHOD | Limits of f_3 search interval for l = ', num2str(l(i))]);
    plot(k, b);
    hold on;
    plot(k, a);
    ylim(initialSearchInterval + [-1, 1]);
    xlim([1, (k_max + 1)])
    title(['Limits of search interval for l = ', num2str(l(i))])
    subtitle({'( For function f_{3}(x) = e^{x} \cdot (x^{3} - 1) + (x - 1) \cdot sin(x) )'; 'FIBONACCI METHOD'})
    xlabel('Step index (k)')
    legend('Upper limit (b_k)','Lower limit (a_k)')
    saveas(gcf, [pwd '/plots/part3-fibonacci_method/IntervalEdges-number' num2str(i) '-f_3.png']);
end

%% 4th PART
%% ( Same as 2nd PART but using the BISECTION WITH DERIVATIVES METHOD ) 
% Study the change on calculations of the objective function for different l values
% ====> For f_1(x):
sampleSize = 100;
l = linspace(0.005, 2, sampleSize);

objectiveFunction_CalculCOUNTER = zeros(1, sampleSize);

for i = 1:length(l)
    [~, ~, ~, objectiveFunction_CalculCOUNTER(i)] = bisection_withDerivatives_method(f_1, initialSearchInterval, l(i));
end
figure('Name', 'BISECTION (WITH DERIVATIVES) METHOD METHOD | Calculations of obj. function f_1');
plot(l, objectiveFunction_CalculCOUNTER);
title('Calculations of obj. function')
subtitle({'( For function f_{1}(x) = (x - 2)^{2} + x \cdot ln(x + 3) )'; 'BISECTION (WITH DERIVATIVES) METHOD'})
xlabel('l (tolerance / final search interval length)');
ylabel('Number of objective function calculations');
saveas(gcf, [pwd '/plots/part4-bisection_WithDerivatives_method/NumberOfObjFuncCalcs-f_1.png']);

% ====> For f_2(x):
sampleSize = 100;
l = linspace(0.005, 2, sampleSize);

objectiveFunction_CalculCOUNTER = zeros(1, sampleSize);

for i = 1:length(l)
    [~, ~, ~, objectiveFunction_CalculCOUNTER(i)] = bisection_withDerivatives_method(f_2, initialSearchInterval, l(i));
end
figure('Name', 'BISECTION (WITH DERIVATIVES) METHOD METHOD | Calculations of obj. function f_2');
plot(l, objectiveFunction_CalculCOUNTER);
title('Calculations of obj. function')
subtitle({'( For function f_{2}(x) = 5^{x} + (2 - cos(x))^{2} )'; 'BISECTION (WITH DERIVATIVES) METHOD'})
xlabel('l (tolerance / final search interval length)');
ylabel('Number of objective function calculations');
saveas(gcf, [pwd '/plots/part4-bisection_WithDerivatives_method/NumberOfObjFuncCalcs-f_2.png']);

% ====> For f_3(x):
sampleSize = 100;
l = linspace(0.005, 2, sampleSize);

objectiveFunction_CalculCOUNTER = zeros(1, sampleSize);

for i = 1:length(l)
    [~, ~, ~, objectiveFunction_CalculCOUNTER(i)] = bisection_withDerivatives_method(f_3, initialSearchInterval, l(i));
end
figure('Name', 'BISECTION (WITH DERIVATIVES) METHOD METHOD | Calculations of obj. function f_3');
plot(l, objectiveFunction_CalculCOUNTER);
title('Calculations of obj. function')
subtitle({'( For function f_{3}(x) = e^{x} \cdot (x^{3} - 1) + (x - 1) \cdot sin(x) )'; 'BISECTION (WITH DERIVATIVES) METHOD'})
xlabel('l (tolerance / final search interval length)');
ylabel('Number of objective function calculations');
saveas(gcf, [pwd '/plots/part4-bisection_WithDerivatives_method/NumberOfObjFuncCalcs-f_3.png']);

% ___________________________________________________________
% Calculate how the edges of the intervals change for different l values
l = [0.005, 0.05, 0.5, 1];
% ====> For f_1(x):
for i = 1:length(l)
    [~, a, b, ~, k_max] = bisection_withDerivatives_method(f_1, initialSearchInterval, l(i));
    k = 1:1:k_max; % Step index (k)
    figure('Name', ['BISECTION (WITH DERIVATIVES) METHOD | Limits of f_1 search interval for l = ', num2str(l(i))]);
    plot(k, b);
    hold on;
    plot(k, a);
    ylim(initialSearchInterval + [-1, 1]);
    xlim([1, k_max])
    title(['Limits of search interval for l = ', num2str(l(i))])
    subtitle({'( For function f_{1}(x) = (x - 2)^{2} + x \cdot ln(x + 3) )'; 'BISECTION (WITH DERIVATIVES) METHOD'})
    xlabel('Step index (k)')
    legend('Upper limit (b_k)','Lower limit (a_k)')
    saveas(gcf, [pwd '/plots/part4-bisection_WithDerivatives_method/IntervalEdges-number' num2str(i) '-f_1.png']);
end

% ====> For f_2(x):
for i = 1:length(l)
    [~, a, b, ~, k_max] = bisection_withDerivatives_method(f_2, initialSearchInterval, l(i));
    k = 1:1:k_max; % Step index (k)
    figure('Name', ['BISECTION (WITH DERIVATIVES) METHOD | Limits of f_2 search interval for l = ', num2str(l(i))]);
    plot(k, b);
    hold on;
    plot(k, a);
    ylim(initialSearchInterval + [-1, 1]);
    xlim([1, k_max])
    title(['Limits of search interval for l = ', num2str(l(i))])
    subtitle({'( For function f_{2}(x) = 5^{x} + (2 - cos(x))^{2} )'; 'BISECTION (WITH DERIVATIVES) METHOD'})
    xlabel('Step index (k)')
    legend('Upper limit (b_k)','Lower limit (a_k)')
    saveas(gcf, [pwd '/plots/part4-bisection_WithDerivatives_method/IntervalEdges-number' num2str(i) '-f_2.png']);
end

% ====> For f_3(x):
for i = 1:length(l)
    [~, a, b, ~, k_max] = bisection_withDerivatives_method(f_3, initialSearchInterval, l(i));
    k = 1:1:k_max; % Step index (k)
    figure('Name', ['BISECTION (WITH DERIVATIVES) METHOD | Limits of f_3 search interval for l = ', num2str(l(i))]);
    plot(k, b);
    hold on;
    plot(k, a);
    ylim(initialSearchInterval + [-1, 1]);
    xlim([1, k_max])
    title(['Limits of search interval for l = ', num2str(l(i))])
    subtitle({'( For function f_{3}(x) = e^{x} \cdot (x^{3} - 1) + (x - 1) \cdot sin(x) )'; 'BISECTION (WITH DERIVATIVES) METHOD'})
    xlabel('Step index (k)')
    legend('Upper limit (b_k)','Lower limit (a_k)')
    saveas(gcf, [pwd '/plots/part4-bisection_WithDerivatives_method/IntervalEdges-number' num2str(i) '-f_3.png']);
end


%% ===============
%% OTHER PLOTS
%% ===============
%% METHODS COMPARISON - NUMBER OF CALCULATIONS
% Keeping the epsilon = const and changing the l > 0 value.
epsilon = 0.001;
% ====> For f_1(x):
sampleSize = 100;
l = linspace(0.005, 2, sampleSize);

objectiveFunction_CalculCOUNTER_bis = zeros(1, sampleSize);
objectiveFunction_CalculCOUNTER_gold = zeros(1, sampleSize);
objectiveFunction_CalculCOUNTER_fib = zeros(1, sampleSize);
objectiveFunction_CalculCOUNTER_bisDer = zeros(1, sampleSize);


for i = 1:length(l)
    [~, ~, ~, objectiveFunction_CalculCOUNTER_bis(i)] = bisection_method(f_1, initialSearchInterval, epsilon, l(i));
    [~, ~, ~, objectiveFunction_CalculCOUNTER_gold(i)] = goldenSection_method(f_1, initialSearchInterval, l(i));
    [~, ~, ~, objectiveFunction_CalculCOUNTER_fib(i)] = fibonacci_method(f_1, initialSearchInterval, l(i));
    [~, ~, ~, objectiveFunction_CalculCOUNTER_bisDer(i)] = bisection_withDerivatives_method(f_1, initialSearchInterval, l(i));

end
figure('Name', 'METHODS COMPARISON | Calculations of obj. function f_1');
plot(l, objectiveFunction_CalculCOUNTER_bis, "red");
hold on
plot(l, objectiveFunction_CalculCOUNTER_gold, "blue");
plot(l, objectiveFunction_CalculCOUNTER_fib, "magenta");
plot(l, objectiveFunction_CalculCOUNTER_bisDer, "green");

yline(objectiveFunction_CalculCOUNTER_bis(1), '--r', 'Bisection method')
yline(objectiveFunction_CalculCOUNTER_gold(1), '--b', 'Golden Section method')
yline(objectiveFunction_CalculCOUNTER_fib(1), '--m', 'Fibonacci method' , 'LabelVerticalAlignment', 'bottom')
yline(objectiveFunction_CalculCOUNTER_bisDer(1), '--g', 'Bisection (with derivatives) method')
xline(l(1), '-', ['l = ', num2str(l(1))]);

title('Calculations of obj. function')
subtitle({'( ex. for function f_{1}(x) = (x - 2)^{2} + x \cdot ln(x + 3) )'; 'METHODS COMPARISON'})
xlabel('l (tolerance / final search interval length)');
ylabel('Number of objective function calculations');
legend('BISECTION METHOD', 'GOLDEN SECTION METHOD', 'FIBONACCI METHOD', ' BISECTION (WITH DERIVATIVES) METHOD', 'Location','north');
saveas(gcf, [pwd '/plots/NumberOfObjFuncCalcsCOMPARISON2-f_1.png']);



% Keeping the epsilon = const and changing the l > 0 value.
epsilon = 0.001;
% ====> For f_1(x):
sampleSize = 100;
l = linspace(0.005, 2, sampleSize);

objectiveFunction_CalculCOUNTER_bis = zeros(1, sampleSize);
objectiveFunction_CalculCOUNTER_gold = zeros(1, sampleSize);
objectiveFunction_CalculCOUNTER_fib = zeros(1, sampleSize);
objectiveFunction_CalculCOUNTER_bisDer = zeros(1, sampleSize);


for i = 1:length(l)
    [~, ~, ~, objectiveFunction_CalculCOUNTER_bis(i)] = bisection_method(f_1, initialSearchInterval, epsilon, l(i));
    [~, ~, ~, objectiveFunction_CalculCOUNTER_gold(i)] = goldenSection_method(f_1, initialSearchInterval, l(i));
    [~, ~, ~, objectiveFunction_CalculCOUNTER_fib(i)] = fibonacci_method(f_1, initialSearchInterval, l(i));
    [~, ~, ~, objectiveFunction_CalculCOUNTER_bisDer(i)] = bisection_withDerivatives_method(f_1, initialSearchInterval, l(i));

end
figure('Name', 'METHODS COMPARISON | Calculations of obj. function f_1');
plot(l, objectiveFunction_CalculCOUNTER_bis, "red");
hold on
plot(l, objectiveFunction_CalculCOUNTER_gold, "blue");
plot(l, objectiveFunction_CalculCOUNTER_fib, "magenta");
plot(l, objectiveFunction_CalculCOUNTER_bisDer, "green");

yline(objectiveFunction_CalculCOUNTER_bis(11), '--r', 'Bisection method')
yline(objectiveFunction_CalculCOUNTER_gold(11), '--b', 'Golden Section method')
yline(objectiveFunction_CalculCOUNTER_fib(11), '--m', 'Fibonacci method' , 'LabelVerticalAlignment', 'bottom')
yline(objectiveFunction_CalculCOUNTER_bisDer(11), '--g', 'Bisection (with derivatives) method')
xline(l(11), '--', ['l = ', num2str(l(11))]);

title('Calculations of obj. function')
subtitle({'( ex. for function f_{1}(x) = (x - 2)^{2} + x \cdot ln(x + 3) )'; 'METHODS COMPARISON'})
xlabel('l (tolerance / final search interval length)');
ylabel('Number of objective function calculations');
legend('BISECTION METHOD', 'GOLDEN SECTION METHOD', 'FIBONACCI METHOD', ' BISECTION (WITH DERIVATIVES) METHOD', 'Location','north');
saveas(gcf, [pwd '/plots/NumberOfObjFuncCalcsCOMPARISON2-f_1.png']);