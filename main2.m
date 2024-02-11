clc;        % Clearing the console
close all;  % Closing all windows/figures
clear;      % Clearing the workspace

%%      ARISTOTLE UNIVERSITY OF THESSALONIKI
%              School of Engineering
%  Department of Electrical and Computer Engineering
%% =-=-=-=-= Optimization Techniques COURSE =-=-=-=-=
%%              2nd LAB Assignment
%   Finding the minima using derivatives.
%
%% Author: Kyparissis Kyparissis 
%         ( University ID: 10346 )
%% NOTES:
%   Please give the code some time to run, it's kinda slow due to  
%  many for-loops.

%% Declaring the objective 2-variable function
syms f(x,y)
% f(x,y) = (x^5)*exp(-(x^2)-(y^2));
f(x,y) = (x^3)*exp((-x^2)-(y^4));
% f_text = 'f(x, y) = x^{5} \cdot e^{- x^{2} - y^{2}}';
f_text = 'f(x, y) = x^{3} \cdot e^{- x^{2} - y^{4}}';

%% 1st PART
%% Plotting the function f
% Surface plot of f
figure('Name', 'Surface plot of the function f(x, y)')
fsurf(f, 'ShowContours', 'on');
grid on
xlabel('x');
ylabel('y');
zlabel('f(x, y)');
title('Surface plot of the function f(x, y)');
subtitle([', where ' f_text]);

% Contour lines of f
figure('Name', 'Contour lines of the function f(x, y)')
fcontour(f);
grid on
xlabel('x')
ylabel('y')
title('Contour lines of the function z = f(x, y) for constant levels of z');
subtitle([', where ' f_text]);

%% 2nd PART
epsilon = 0.01;
%% Steepest Descent METHOD
%% i) Starting point (0,0)
InitialPoints = [0 0];

% a) const step
[FinalPoints, maxIterations, x_values, y_values] = SteepestDescent_method(f, InitialPoints, epsilon, 'StepChoise', 'const', 0.5);

figure('Name', 'Steepest Descent - [0 0] - const step - contour plot')
fcontour(f, [-3, 3]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x');
ylabel('y');
title({'Convergance of (x, y)', ['Initial Point: (x, y) = (', num2str(InitialPoints(2)), ', ', num2str(InitialPoints(2)), ')']})
subtitle({'Step choise (\gamma_k): {\it CONST (== 0.5)}'; 'STEEPEST DESCENT METHOD'})

figure('Name', 'Steepest Descent - [0 0] - const step - f(x,y)(k) plot')
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
set(gca, 'XTick', iterations)
ylabel('f(x, y)');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (', num2str(InitialPoints(2)), ', ', num2str(InitialPoints(2)), ')']})
subtitle({'Step choise (\gamma_k): {\it CONST (== 0.5)}'; 'STEEPEST DESCENT METHOD'})

% b) function-minimization step
[FinalPoints, maxIterations, x_values, y_values] = SteepestDescent_method(f, InitialPoints, epsilon, 'StepChoise', 'FuncMinimize', []);

figure('Name', 'Steepest Descent - [0 0] - FuncMinimize step - contour plot')
fcontour(f, [-3, 3]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x');
ylabel('y');
title({'Convergance of (x, y)', ['Initial Point: (x, y) = (', num2str(InitialPoints(2)), ', ', num2str(InitialPoints(2)), ')']})
subtitle({'Step choise (\gamma_k): {\it Found by minimizing f(x_k +\gamma_k\cdotd_k) with respect to \gamma_k}'; 'STEEPEST DESCENT METHOD'})

figure('Name', 'Steepest Descent - [0 0] - FuncMinimize step - f(x,y)(k) plot')
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
set(gca, 'XTick', iterations)
ylabel('f(x, y)');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (', num2str(InitialPoints(2)), ', ', num2str(InitialPoints(2)), ')']})
subtitle({'Step choise (\gamma_k): {\it Found by minimizing f(x_k +\gamma_k\cdotd_k) with respect to \gamma_k}'; 'STEEPEST DESCENT METHOD'})

% c) Armijo rule step
[FinalPoints, maxIterations, x_values, y_values] = SteepestDescent_method(f, InitialPoints, epsilon, 'StepChoise', 'ArmijoRule', 0.5);

figure('Name', 'Steepest Descent - [0 0] - armijo step - contour plot')
fcontour(f, [-3, 3]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x');
ylabel('y');
title({'Convergance of (x, y)', ['Initial Point: (x, y) = (', num2str(InitialPoints(2)), ', ', num2str(InitialPoints(2)), ')']})
subtitle({'Step choise (\gamma_k): {\it Given by Armijo`s rule}'; 'STEEPEST DESCENT METHOD'})

figure('Name', 'Steepest Descent - [0 0] - armijo step - f(x,y)(k) plot')
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
set(gca, 'XTick', iterations)
ylabel('f(x, y)');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (', num2str(InitialPoints(2)), ', ', num2str(InitialPoints(2)), ')']})
subtitle({'Step choise (\gamma_k): {\it Given by Armijo`s rule}'; 'STEEPEST DESCENT METHOD'})


%% ii) Starting point (-1,1)
InitialPoints = [-1 1];

[FinalPoints, maxIterations, x_values, y_values] = SteepestDescent_method(f, InitialPoints, epsilon, 'StepChoise', 'const', 0.5);

% a) const step
figure('Name', 'Steepest Descent - [-1 1] - const step - contour plot')
fcontour(f, [-3, 3]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x');
ylabel('y');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (-1, 1)']})
subtitle({'Step choise (\gamma_k): {\it CONST (== 0.5)}'; 'STEEPEST DESCENT METHOD'})

figure('Name', 'Steepest Descent - [-1 1] - const step - f(x,y)(k) plot')
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
set(gca, 'XTick', iterations)
ylabel('f(x, y)');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (-1, 1)']})
subtitle({'Step choise (\gamma_k): {\it CONST (== 0.5)}'; 'STEEPEST DESCENT METHOD'})

% b) function-minimization step
[FinalPoints, maxIterations, x_values, y_values] = SteepestDescent_method(f, InitialPoints, epsilon, 'StepChoise', 'FuncMinimize', []);

figure('Name', 'Steepest Descent - [-1 1] - FuncMinimize step - contour plot')
fcontour(f, [-3, 3]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x');
ylabel('y');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (-1, 1)']})
subtitle({'Step choise (\gamma_k): {\it Found by minimizing f(x_k +\gamma_k\cdotd_k) with respect to \gamma_k}'; 'STEEPEST DESCENT METHOD'})

figure('Name', 'Steepest Descent - [-1 1] - FuncMinimize step - f(x,y)(k) plot')
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
set(gca, 'XTick', iterations)
ylabel('f(x, y)');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (-1, 1)']})
subtitle({'Step choise (\gamma_k): {\it Found by minimizing f(x_k +\gamma_k\cdotd_k) with respect to \gamma_k}'; 'STEEPEST DESCENT METHOD'})

% c) Armijo rule step
[FinalPoints, maxIterations, x_values, y_values] = SteepestDescent_method(f, InitialPoints, epsilon, 'StepChoise', 'ArmijoRule', 0.5);

figure('Name', 'Steepest Descent - [-1 1] - armijo step - contour plot')
fcontour(f, [-3, 3]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x');
ylabel('y');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (-1, 1)']})
subtitle({'Step choise (\gamma_k): {\it Given by Armijo`s rule}'; 'STEEPEST DESCENT METHOD'})

figure('Name', 'Steepest Descent - [-1 1] - armijo step - f(x,y)(k) plot')
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
set(gca, 'XTick', iterations)
ylabel('f(x, y)');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (-1, 1)']})
subtitle({'Step choise (\gamma_k): {\it Given by Armijo`s rule}'; 'STEEPEST DESCENT METHOD'})


%% iii) Starting point (1,-1)
InitialPoints = [1 -1];

[FinalPoints, maxIterations, x_values, y_values] = SteepestDescent_method(f, InitialPoints, epsilon, 'StepChoise', 'const', 0.5);

% a) const step
figure('Name', 'Steepest Descent - [1 -1] - const step - contour plot')
fcontour(f, [-3, 3]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x');
ylabel('y');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (1 -1)']})
subtitle({'Step choise (\gamma_k): {\it CONST (== 0.5)}'; 'STEEPEST DESCENT METHOD'})

figure('Name', 'Steepest Descent - [1 -1] - const step - f(x,y)(k) plot')
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
set(gca, 'XTick', iterations)
ylabel('f(x, y)');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (1 -1)']})
subtitle({'Step choise (\gamma_k): {\it CONST (== 0.5)}'; 'STEEPEST DESCENT METHOD'})

% b) function-minimization step
[FinalPoints, maxIterations, x_values, y_values] = SteepestDescent_method(f, InitialPoints, epsilon, 'StepChoise', 'FuncMinimize', []);

figure('Name', 'Steepest Descent - [1 -1] - FuncMinimize step - contour plot')
fcontour(f, [-3, 3]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x');
ylabel('y');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (1 -1)']})
subtitle({'Step choise (\gamma_k): {\it Found by minimizing f(x_k +\gamma_k\cdotd_k) with respect to \gamma_k}'; 'STEEPEST DESCENT METHOD'})

figure('Name', 'Steepest Descent - [1 -1] - FuncMinimize step - f(x,y)(k) plot')
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
set(gca, 'XTick', iterations)
ylabel('f(x, y)');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (1 -1)']})
subtitle({'Step choise (\gamma_k): {\it Found by minimizing f(x_k +\gamma_k\cdotd_k) with respect to \gamma_k}'; 'STEEPEST DESCENT METHOD'})

% c) Armijo rule step
[FinalPoints, maxIterations, x_values, y_values] = SteepestDescent_method(f, InitialPoints, epsilon, 'StepChoise', 'ArmijoRule', 0.5);

figure('Name', 'Steepest Descent - [1 -1] - armijo step - contour plot')
fcontour(f, [-3, 3]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x');
ylabel('y');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (1 -1)']})
subtitle({'Step choise (\gamma_k): {\it Given by Armijo`s rule}'; 'STEEPEST DESCENT METHOD'})

figure('Name', 'Steepest Descent - [1 -1] - armijo step - f(x,y)(k) plot')
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
set(gca, 'XTick', iterations)
ylabel('f(x, y)');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (1 -1)']})
subtitle({'Step choise (\gamma_k): {\it Given by Armijo`s rule}'; 'STEEPEST DESCENT METHOD'})

%% 3rd PART
epsilon = 0.01;
%% Newton METHOD
%% i) Starting point (0,0)
InitialPoints = [0 0];

% a) const step
[FinalPoints, maxIterations, x_values, y_values] = Newton_method(f, InitialPoints, epsilon, 'StepChoise', 'const', 0.5);

figure('Name', 'NEWTON - [0 0] - const step - contour plot')
fcontour(f, [-3, 3]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x');
ylabel('y');
title({'Convergance of (x, y)', ['Initial Point: (x, y) = (', num2str(InitialPoints(2)), ', ', num2str(InitialPoints(2)), ')']})
subtitle({'Step choise (\gamma_k): {\it CONST (== 0.5)}'; 'NEWTON METHOD'})

figure('Name', 'NEWTON - [0 0] - const step - f(x,y)(k) plot')
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
set(gca, 'XTick', iterations)
ylabel('f(x, y)');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (', num2str(InitialPoints(2)), ', ', num2str(InitialPoints(2)), ')']})
subtitle({'Step choise (\gamma_k): {\it CONST (== 0.5)}'; 'NEWTON METHOD'})

% b) function-minimization step
[FinalPoints, maxIterations, x_values, y_values] = Newton_method(f, InitialPoints, epsilon, 'StepChoise', 'FuncMinimize', []);

figure('Name', 'NEWTON - [0 0] - FuncMinimize step - contour plot')
fcontour(f, [-3, 3]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x');
ylabel('y');
title({'Convergance of (x, y)', ['Initial Point: (x, y) = (', num2str(InitialPoints(2)), ', ', num2str(InitialPoints(2)), ')']})
subtitle({'Step choise (\gamma_k): {\it Found by minimizing f(x_k +\gamma_k\cdotd_k) with respect to \gamma_k}'; 'NEWTON METHOD'})

figure('Name', 'NEWTON - [0 0] - FuncMinimize step - f(x,y)(k) plot')
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
set(gca, 'XTick', iterations)
ylabel('f(x, y)');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (', num2str(InitialPoints(2)), ', ', num2str(InitialPoints(2)), ')']})
subtitle({'Step choise (\gamma_k): {\it Found by minimizing f(x_k +\gamma_k\cdotd_k) with respect to \gamma_k}'; 'NEWTON METHOD'})

% c) Armijo rule step
[FinalPoints, maxIterations, x_values, y_values] = Newton_method(f, InitialPoints, epsilon, 'StepChoise', 'ArmijoRule', 0.5);

figure('Name', 'NEWTON - [0 0] - armijo step - contour plot')
fcontour(f, [-3, 3]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x');
ylabel('y');
title({'Convergance of (x, y)', ['Initial Point: (x, y) = (', num2str(InitialPoints(2)), ', ', num2str(InitialPoints(2)), ')']})
subtitle({'Step choise (\gamma_k): {\it Given by Armijo`s rule}'; 'NEWTON METHOD'})

figure('Name', 'NEWTON - [0 0] - armijo step - f(x,y)(k) plot')
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
set(gca, 'XTick', iterations)
ylabel('f(x, y)');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (', num2str(InitialPoints(2)), ', ', num2str(InitialPoints(2)), ')']})
subtitle({'Step choise (\gamma_k): {\it Given by Armijo`s rule}'; 'NEWTON METHOD'})


%% ii) Starting point (-1,1)
InitialPoints = [-1 1];

[FinalPoints, maxIterations, x_values, y_values] = Newton_method(f, InitialPoints, epsilon, 'StepChoise', 'const', 0.5);

% a) const step
figure('Name', 'NEWTON - [-1 1] - const step - contour plot')
fcontour(f, [-3, 3]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x');
ylabel('y');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (-1, 1)']})
subtitle({'Step choise (\gamma_k): {\it CONST (== 0.5)}'; 'NEWTON METHOD'})

figure('Name', 'NEWTON - [-1 1] - const step - f(x,y)(k) plot')
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
set(gca, 'XTick', iterations)
ylabel('f(x, y)');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (-1, 1)']})
subtitle({'Step choise (\gamma_k): {\it CONST (== 0.5)}'; 'NEWTON METHOD'})

% b) function-minimization step
[FinalPoints, maxIterations, x_values, y_values] = Newton_method(f, InitialPoints, epsilon, 'StepChoise', 'FuncMinimize', []);

figure('Name', 'NEWTON - [-1 1] - FuncMinimize step - contour plot')
fcontour(f, [-3, 3]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x');
ylabel('y');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (-1, 1)']})
subtitle({'Step choise (\gamma_k): {\it Found by minimizing f(x_k +\gamma_k\cdotd_k) with respect to \gamma_k}'; 'NEWTON METHOD'})

figure('Name', 'NEWTON - [-1 1] - FuncMinimize step - f(x,y)(k) plot')
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
set(gca, 'XTick', iterations)
ylabel('f(x, y)');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (-1, 1)']})
subtitle({'Step choise (\gamma_k): {\it Found by minimizing f(x_k +\gamma_k\cdotd_k) with respect to \gamma_k}'; 'NEWTON METHOD'})

% c) Armijo rule step
[FinalPoints, maxIterations, x_values, y_values] = Newton_method(f, InitialPoints, epsilon, 'StepChoise', 'ArmijoRule', 0.5);

figure('Name', 'NEWTON - [-1 1] - armijo step - contour plot')
fcontour(f, [-3, 3]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x');
ylabel('y');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (-1, 1)']})
subtitle({'Step choise (\gamma_k): {\it Given by Armijo`s rule}'; 'NEWTON METHOD'})

figure('Name', 'NEWTON - [-1 1] - armijo step - f(x,y)(k) plot')
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
set(gca, 'XTick', iterations)
ylabel('f(x, y)');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (-1, 1)']})
subtitle({'Step choise (\gamma_k): {\it Given by Armijo`s rule}'; 'NEWTON METHOD'})


%% iii) Starting point (1,-1)
InitialPoints = [1 -1];

[FinalPoints, maxIterations, x_values, y_values] = Newton_method(f, InitialPoints, epsilon, 'StepChoise', 'const', 0.5);

% a) const step
figure('Name', 'NEWTON - [1 -1] - const step - contour plot')
fcontour(f, [-3, 3]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x');
ylabel('y');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (1 -1)']})
subtitle({'Step choise (\gamma_k): {\it CONST (== 0.5)}'; 'NEWTON METHOD'})

figure('Name', 'NEWTON - [1 -1] - const step - f(x,y)(k) plot')
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
set(gca, 'XTick', iterations)
ylabel('f(x, y)');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (1 -1)']})
subtitle({'Step choise (\gamma_k): {\it CONST (== 0.5)}'; 'NEWTON METHOD'})

% b) function-minimization step
[FinalPoints, maxIterations, x_values, y_values] = Newton_method(f, InitialPoints, epsilon, 'StepChoise', 'FuncMinimize', []);

figure('Name', 'NEWTON - [1 -1] - FuncMinimize step - contour plot')
fcontour(f, [-3, 3]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x');
ylabel('y');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (1 -1)']})
subtitle({'Step choise (\gamma_k): {\it Found by minimizing f(x_k +\gamma_k\cdotd_k) with respect to \gamma_k}'; 'NEWTON METHOD'})

figure('Name', 'NEWTON - [1 -1] - FuncMinimize step - f(x,y)(k) plot')
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
set(gca, 'XTick', iterations)
ylabel('f(x, y)');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (1 -1)']})
subtitle({'Step choise (\gamma_k): {\it Found by minimizing f(x_k +\gamma_k\cdotd_k) with respect to \gamma_k}'; 'NEWTON METHOD'})

% c) Armijo rule step
[FinalPoints, maxIterations, x_values, y_values] = Newton_method(f, InitialPoints, epsilon, 'StepChoise', 'ArmijoRule', 0.5);

figure('Name', 'NEWTON - [1 -1] - armijo step - contour plot')
fcontour(f, [-3, 3]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x');
ylabel('y');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (1 -1)']})
subtitle({'Step choise (\gamma_k): {\it Given by Armijo`s rule}'; 'NEWTON METHOD'})

figure('Name', 'NEWTON - [1 -1] - armijo step - f(x,y)(k) plot')
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
set(gca, 'XTick', iterations)
ylabel('f(x, y)');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (1 -1)']})
subtitle({'Step choise (\gamma_k): {\it Given by Armijo`s rule}'; 'NEWTON METHOD'})

%% 4th PART
epsilon = 0.01;
%% Levenberg-Marquardt METHOD
%% i) Starting point (0,0)
InitialPoints = [0 0];

% a) const step
[FinalPoints, maxIterations, x_values, y_values] = LevenbergMarquardt_method(f, InitialPoints, epsilon, 'StepChoise', 'const', 0.5);

figure('Name', 'LEVENBERG - MARQUARDT - [0 0] - const step - contour plot')
fcontour(f, [-3, 3]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x');
ylabel('y');
title({'Convergance of (x, y)', ['Initial Point: (x, y) = (', num2str(InitialPoints(2)), ', ', num2str(InitialPoints(2)), ')']})
subtitle({'Step choise (\gamma_k): {\it CONST (== 0.5)}'; 'LEVENBERG - MARQUARDT METHOD'})

figure('Name', 'LEVENBERG - MARQUARDT - [0 0] - const step - f(x,y)(k) plot')
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
set(gca, 'XTick', iterations)
ylabel('f(x, y)');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (', num2str(InitialPoints(2)), ', ', num2str(InitialPoints(2)), ')']})
subtitle({'Step choise (\gamma_k): {\it CONST (== 0.5)}'; 'LEVENBERG - MARQUARDT METHOD'})

% b) function-minimization step
[FinalPoints, maxIterations, x_values, y_values] = LevenbergMarquardt_method(f, InitialPoints, epsilon, 'StepChoise', 'FuncMinimize', []);

figure('Name', 'LEVENBERG - MARQUARDT - [0 0] - FuncMinimize step - contour plot')
fcontour(f, [-3, 3]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x');
ylabel('y');
title({'Convergance of (x, y)', ['Initial Point: (x, y) = (', num2str(InitialPoints(2)), ', ', num2str(InitialPoints(2)), ')']})
subtitle({'Step choise (\gamma_k): {\it Found by minimizing f(x_k +\gamma_k\cdotd_k) with respect to \gamma_k}'; 'LEVENBERG - MARQUARDT METHOD'})

figure('Name', 'LEVENBERG - MARQUARDT - [0 0] - FuncMinimize step - f(x,y)(k) plot')
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
set(gca, 'XTick', iterations)
ylabel('f(x, y)');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (', num2str(InitialPoints(2)), ', ', num2str(InitialPoints(2)), ')']})
subtitle({'Step choise (\gamma_k): {\it Found by minimizing f(x_k +\gamma_k\cdotd_k) with respect to \gamma_k}'; 'LEVENBERG - MARQUARDT METHOD'})

% c) Armijo rule step
[FinalPoints, maxIterations, x_values, y_values] = LevenbergMarquardt_method(f, InitialPoints, epsilon, 'StepChoise', 'ArmijoRule', 0.5);

figure('Name', 'LEVENBERG - MARQUARDT - [0 0] - armijo step - contour plot')
fcontour(f, [-3, 3]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x');
ylabel('y');
title({'Convergance of (x, y)', ['Initial Point: (x, y) = (', num2str(InitialPoints(2)), ', ', num2str(InitialPoints(2)), ')']})
subtitle({'Step choise (\gamma_k): {\it Given by Armijo`s rule}'; 'LEVENBERG - MARQUARDT METHOD'})

figure('Name', 'LEVENBERG - MARQUARDT - [0 0] - armijo step - f(x,y)(k) plot')
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
set(gca, 'XTick', iterations)
ylabel('f(x, y)');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (', num2str(InitialPoints(2)), ', ', num2str(InitialPoints(2)), ')']})
subtitle({'Step choise (\gamma_k): {\it Given by Armijo`s rule}'; 'LEVENBERG - MARQUARDT METHOD'})


%% ii) Starting point (-1,1)
InitialPoints = [-1 1];

[FinalPoints, maxIterations, x_values, y_values] = LevenbergMarquardt_method(f, InitialPoints, epsilon, 'StepChoise', 'const', 0.3);

% a) const step
figure('Name', 'LEVENBERG - MARQUARDT - [-1 1] - const step - contour plot')
fcontour(f, [-3, 3]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x');
ylabel('y');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (-1, 1)']})
subtitle({'Step choise (\gamma_k): {\it CONST (== 0.3)}'; 'LEVENBERG - MARQUARDT METHOD'})

figure('Name', 'LEVENBERG - MARQUARDT - [-1 1] - const step - f(x,y)(k) plot')
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
set(gca, 'XTick', iterations)
ylabel('f(x, y)');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (-1, 1)']})
subtitle({'Step choise (\gamma_k): {\it CONST (== 0.3)}'; 'LEVENBERG - MARQUARDT METHOD'})

% b) function-minimization step
[FinalPoints, maxIterations, x_values, y_values] = LevenbergMarquardt_method(f, InitialPoints, epsilon, 'StepChoise', 'FuncMinimize', []);

figure('Name', 'LEVENBERG - MARQUARDT - [-1 1] - FuncMinimize step - contour plot')
fcontour(f, [-3, 3]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x');
ylabel('y');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (-1, 1)']})
subtitle({'Step choise (\gamma_k): {\it Found by minimizing f(x_k +\gamma_k\cdotd_k) with respect to \gamma_k}'; 'LEVENBERG - MARQUARDT METHOD'})

figure('Name', 'LEVENBERG - MARQUARDT - [-1 1] - FuncMinimize step - f(x,y)(k) plot')
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
set(gca, 'XTick', iterations)
ylabel('f(x, y)');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (-1, 1)']})
subtitle({'Step choise (\gamma_k): {\it Found by minimizing f(x_k +\gamma_k\cdotd_k) with respect to \gamma_k}'; 'LEVENBERG - MARQUARDT METHOD'})

% c) Armijo rule step
[FinalPoints, maxIterations, x_values, y_values] = LevenbergMarquardt_method(f, InitialPoints, epsilon, 'StepChoise', 'ArmijoRule', 0.5);

figure('Name', 'LEVENBERG - MARQUARDT - [-1 1] - armijo step - contour plot')
fcontour(f, [-3, 3]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x');
ylabel('y');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (-1, 1)']})
subtitle({'Step choise (\gamma_k): {\it Given by Armijo`s rule}'; 'LEVENBERG - MARQUARDT METHOD'})

figure('Name', 'LEVENBERG - MARQUARDT - [-1 1] - armijo step - f(x,y)(k) plot')
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
set(gca, 'XTick', iterations)
ylabel('f(x, y)');
title({'Objective function value per iteration (k)';['Initial Point: (x, y) = (-1, 1)']})
subtitle({'Step choise (\gamma_k): {\it Given by Armijo`s rule}'; 'LEVENBERG - MARQUARDT METHOD'})
