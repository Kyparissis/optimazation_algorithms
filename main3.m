clc;        % Clearing the console
close all;  % Closing all windows/figures
clear;      % Clearing the workspace

%%      ARISTOTLE UNIVERSITY OF THESSALONIKI
%              School of Engineering
%  Department of Electrical and Computer Engineering
%% =-=-=-=-= Optimization Techniques COURSE =-=-=-=-=
%%              3rd LAB Assignment
%   Finding the minima using the Projected Steepest Descent method.
%
%% Author: Kyparissis Kyparissis 
%         ( University ID: 10346 )
%% NOTES:

%% Declaring the objective 2-variable function
syms f(x1,x2)
f(x1,x2) = (1/3)*x1^2 + 3*x2^2;
f_text = 'f(x_1, x_2) = ^{1}/_{3}\cdotx_1^2 + 3\cdotx_2^2';

%% Plotting the function f
% Surface plot of f
figure('Name', 'Surface plot of the function f(x_1, x_2)')
fsurf(f, [-20 20], 'ShowContours', 'on');
grid on
xlabel('x_1');
ylabel('x_2');
zlabel('f(x_1, x_2)');
title('Surface plot of the function f(x), x = [x_1 x_2]^T');
subtitle([', where ' f_text]);

% Contour lines of f
figure('Name', 'Contour lines of the function f(x_1, x_2)')
fcontour(f, [-20 20])
% fcontour(f, [-20 20], 'Fill', 'on');
% hold on;
% plot(0, 0, 'o', 'LineWidth', 2, 'MarkerSize', 5)
grid on
xlabel('x_1');
ylabel('x_2');
title('Contour lines of the function z = f(x_1, x_2) for constant levels of z');
subtitle([', where ' f_text]);

%% Part 1
% Use 2nd lab's assignment SteepestDescent_method() , with:
epsilon = 0.001;         % tolerance
InitialPoint = [4, 3];   % Random chosen initial point (must be diff. from [0 0])

% γ = 0.1
gammaConstValue = 0.1;
[~, maxIterations, x_values, y_values] = SteepestDescent_method(f, InitialPoint, epsilon, 'StepChoise', 'const', gammaConstValue);

figure('Name', ['Steepest Descent - const step ', num2str(gammaConstValue), ' - contour plot'])
fcontour(f, [-5, 5]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x_1');
ylabel('x_2');
title({'Convergance of (x_1, x_2)', ['Initial Point: (x_1, x_2) = (', num2str(InitialPoint(1)), ', ', num2str(InitialPoint(2)), ')']})
subtitle({['Step choise (\gamma_k) == ', num2str(gammaConstValue),' {\it (const.)}']; 'STEEPEST DESCENT METHOD'})

figure('Name', ['Steepest Descent - const step ', num2str(gammaConstValue), ' - f value plot'])
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
% set(gca, 'XTick', iterations)
ylabel('f(x_1, x_2)');
title({'Objective function value per iteration (k)';['Initial Point: (x_1, x_2) = (', num2str(InitialPoint(1)), ', ', num2str(InitialPoint(2)), ')']})
subtitle({['Step choise (\gamma_k) == ', num2str(gammaConstValue),' {\it (const.)}']; 'STEEPEST DESCENT METHOD'})


% γ = 0.3
gammaConstValue = 0.3;
[~, maxIterations, x_values, y_values] = SteepestDescent_method(f, InitialPoint, epsilon, 'StepChoise', 'const', gammaConstValue);

figure('Name', ['Steepest Descent - const step ', num2str(gammaConstValue), ' - contour plot'])
fcontour(f, [-5, 5]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x_1');
ylabel('x_2');
title({'Convergance of (x_1, x_2)', ['Initial Point: (x_1, x_2) = (', num2str(InitialPoint(1)), ', ', num2str(InitialPoint(2)), ')']})
subtitle({['Step choise (\gamma_k) == ', num2str(gammaConstValue),' {\it (const.)}']; 'STEEPEST DESCENT METHOD'})

figure('Name', ['Steepest Descent - const step ', num2str(gammaConstValue), ' - f value plot'])
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
% set(gca, 'XTick', iterations)
ylabel('f(x_1, x_2)');
title({'Objective function value per iteration (k)';['Initial Point: (x_1, x_2) = (', num2str(InitialPoint(1)), ', ', num2str(InitialPoint(2)), ')']})
subtitle({['Step choise (\gamma_k) == ', num2str(gammaConstValue),' {\it (const.)}']; 'STEEPEST DESCENT METHOD'})

% % γ = 1/3
% gammaConstValue = 1/3;
% [~, maxIterations, x_values, y_values] = SteepestDescent_method(f, InitialPoint, epsilon, 'StepChoise', 'const', gammaConstValue);
% 
% figure('Name', ['Steepest Descent - const step ', num2str(gammaConstValue), ' - contour plot'])
% fcontour(f, [-5, 5]);
% hold on;
% plot(x_values, y_values, 'Color', 'red');
% hold on;
% plot(x_values(end), y_values(end), '-*');
% plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
% xlabel('x_1');
% ylabel('x_2');
% title({'Convergance of (x_1, x_2)', ['Initial Point: (x_1, x_2) = (', num2str(InitialPoint(1)), ', ', num2str(InitialPoint(2)), ')']})
% subtitle({['Step choise (\gamma_k) == ', num2str(gammaConstValue),' {\it (const.)}']; 'STEEPEST DESCENT METHOD'})
% 
% figure('Name', ['Steepest Descent - const step ', num2str(gammaConstValue), ' - f value plot'])
% f_values = double(f(x_values, y_values));
% iterations = 1:1:maxIterations;
% plot(iterations, f_values);
% hold on;
% plot(iterations(end), f_values(end), '-*');
% hold on;
% plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
% xlabel('k (Number of iteration)');
% % set(gca, 'XTick', iterations)
% ylabel('f(x_1, x_2)');
% title({'Objective function value per iteration (k)';['Initial Point: (x_1, x_2) = (', num2str(InitialPoint(1)), ', ', num2str(InitialPoint(2)), ')']})
% subtitle({['Step choise (\gamma_k) == ', num2str(gammaConstValue),' {\it (const.)}']; 'STEEPEST DESCENT METHOD'})

% γ = 3
gammaConstValue = 3;
[~, maxIterations, x_values, y_values] = SteepestDescent_method(f, InitialPoint, epsilon, 'StepChoise', 'const', gammaConstValue);

figure('Name', ['Steepest Descent - const step ', num2str(gammaConstValue), ' - contour plot'])
fcontour(f)
colorbar
hold on;
xline(4,'--','x = 4');
xline(-4,'--','x = -4');
plot3(x_values, y_values, double(f(x_values,y_values)), 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x_1');
ylabel('x_2');
title({'Convergance of (x_1, x_2)', ['Initial Point: (x_1, x_2) = (', num2str(InitialPoint(1)), ', ', num2str(InitialPoint(2)), ')']})
subtitle({['Step choise (\gamma_k) == ', num2str(gammaConstValue),' {\it (const.)}']; 'STEEPEST DESCENT METHOD'})

figure('Name', ['Steepest Descent - const step ', num2str(gammaConstValue), ' - f value plot'])
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
semilogy(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
% set(gca, 'XTick', iterations)
ylabel('f(x_1, x_2)');
title({'Objective function value per iteration (k)';['Initial Point: (x_1, x_2) = (', num2str(InitialPoint(1)), ', ', num2str(InitialPoint(2)), ')']})
subtitle({['Step choise (\gamma_k) == ', num2str(gammaConstValue),' {\it (const.)}']; 'STEEPEST DESCENT METHOD'})

% γ = 5
gammaConstValue = 5;
[~, maxIterations, x_values, y_values] = SteepestDescent_method(f, InitialPoint, epsilon, 'StepChoise', 'const', gammaConstValue);

figure('Name', ['Steepest Descent - const step ', num2str(gammaConstValue), ' - contour plot'])
fcontour(f)
colorbar
hold on;
plot3(x_values, y_values, double(f(x_values,y_values)), 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
xlabel('x_1');
ylabel('x_2');
title({'Convergance of (x_1, x_2)', ['Initial Point: (x_1, x_2) = (', num2str(InitialPoint(1)), ', ', num2str(InitialPoint(2)), ')']})
subtitle({['Step choise (\gamma_k) == ', num2str(gammaConstValue),' {\it (const.)}']; 'STEEPEST DESCENT METHOD'})

figure('Name', ['Steepest Descent - const step ', num2str(gammaConstValue), ' - f value plot'])
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
semilogy(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
% set(gca, 'XTick', iterations)
ylabel('f(x_1, x_2)');
title({'Objective function value per iteration (k)';['Initial Point: (x_1, x_2) = (', num2str(InitialPoint(1)), ', ', num2str(InitialPoint(2)), ')']})
subtitle({['Step choise (\gamma_k) == ', num2str(gammaConstValue),' {\it (const.)}']; 'STEEPEST DESCENT METHOD'})

%% x1 x2 ASSUMPTIONS
x1_interval = [-10, 5];  % -10 <= x1 <= 5
x2_interval = [-8, 12];  % -8 <= x2 <= 12   
figure('Name','contour with rectangle')
fcontour(f, [-15 15]);
rectangle('Position',[x1_interval(1) x2_interval(1) (x1_interval(2) - x1_interval(1)) (x2_interval(2) - x2_interval(1))], 'LineStyle','--', 'EdgeColor','black' , 'LineWidth', 1.5)
xlabel('x_1');
ylabel('x_2');
title('Assumptions for (x_1, x_2)')
subtitle( {[num2str(x1_interval(1)), ' ', char(8804), ' x_1 ' char(8804), ' ', num2str(x1_interval(2))]; [num2str(x2_interval(1)), ' ', char(8804), ' x_2 ' char(8804), ' ', num2str(x2_interval(2))]} );

%% Part 2
s = 5;
gammaConstValue = 0.5;
InitialPoint = [5, -5];
epsilon = 0.01;
[~, maxIterations, x_values, y_values] = ProjectedSteepestDescent_method(f, InitialPoint, epsilon, 'StepChoise', 'const', gammaConstValue, s, x1_interval, x2_interval);

figure('Name', ['Projected Steepest Descent - const step ', num2str(gammaConstValue), ' - contour plot - sk=' , num2str(s)])
fcontour(f, [-12, 12, -14, 14]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
% plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
rectangle('Position',[x1_interval(1) x2_interval(1) (x1_interval(2) - x1_interval(1)) (x2_interval(2) - x2_interval(1))], 'LineStyle','--', 'EdgeColor','black' , 'LineWidth', 1.5)
xlabel('x_1');
ylabel('x_2');
title({'Convergance of (x_1, x_2)', ['Initial Point: (x_1, x_2) = (', num2str(InitialPoint(1)), ', ', num2str(InitialPoint(2)), ')']})
subtitle({['Step choise (\gamma_k) == ', num2str(gammaConstValue),' {\it (const.)}']; ['Projection-step choise (s_k) == ', num2str(s)]; 'PROJECTED STEEPEST DESCENT METHOD'})

figure('Name', ['Projected Steepest Descent - const step ', num2str(gammaConstValue), ' - f value plot - sk=' , num2str(s)])
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
semilogx(iterations, f_values);
hold on;
% plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
% set(gca, 'XTick', iterations)
ylabel('f(x_1, x_2)');
title({'Objective function value per iteration (k)';['Initial Point: (x_1, x_2) = (', num2str(InitialPoint(1)), ', ', num2str(InitialPoint(2)), ')']})
subtitle({['Step choise (\gamma_k) == ', num2str(gammaConstValue),' {\it (const.)}']; ['Projection-step choise (s_k) == ', num2str(s)]; 'PROJECTED STEEPEST DESCENT METHOD'})

[~, maxIterations, x_values, y_values] = ProjectedSteepestDescent_method(f, InitialPoint, epsilon, 'StepChoise', 'ArmijoRule', gammaConstValue, s, x1_interval, x2_interval);

figure('Name', ['Projected Steepest Descent - armijo initial step ', num2str(gammaConstValue), ' - contour plot - sk=' , num2str(s)])
fcontour(f, [-12, 12, -14, 14]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
rectangle('Position',[x1_interval(1) x2_interval(1) (x1_interval(2) - x1_interval(1)) (x2_interval(2) - x2_interval(1))], 'LineStyle','--', 'EdgeColor','black' , 'LineWidth', 1.5)
xlabel('x_1');
ylabel('x_2');
title({'Convergance of (x_1, x_2)', ['Initial Point: (x_1, x_2) = (', num2str(InitialPoint(1)), ', ', num2str(InitialPoint(2)), ')']})
subtitle({['Step choise (\gamma_k) given by Armijo Rule ( Initial Step used: ', num2str(gammaConstValue), ' )']; ['Projection-step choise (s_k) == ', num2str(s)]; 'PROJECTED STEEPEST DESCENT METHOD'})

figure('Name', ['Projected Steepest Descent - armijo initial step ', num2str(gammaConstValue), ' - f value plot - sk=' , num2str(s)])
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
% set(gca, 'XTick', iterations)
ylabel('f(x_1, x_2)');
title({'Objective function value per iteration (k)';['Initial Point: (x_1, x_2) = (', num2str(InitialPoint(1)), ', ', num2str(InitialPoint(2)), ')']})
subtitle({['Step choise (\gamma_k) given by Armijo Rule ( Initial Step used: ', num2str(gammaConstValue), ' )']; ['Projection-step choise (s_k) == ', num2str(s)]; 'PROJECTED STEEPEST DESCENT METHOD'})

%% Part 3
s = 15;
gammaConstValue = 0.1;
InitialPoint = [-5, 10];
epsilon = 0.01;
[~, maxIterations, x_values, y_values] = ProjectedSteepestDescent_method(f, InitialPoint, epsilon, 'StepChoise', 'const', gammaConstValue, s, x1_interval, x2_interval);

figure('Name', ['Projected Steepest Descent - const step ', num2str(gammaConstValue), ' - contour plot - sk=' , num2str(s)])
fcontour(f, [-12, 12, -14, 14]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
rectangle('Position',[x1_interval(1) x2_interval(1) (x1_interval(2) - x1_interval(1)) (x2_interval(2) - x2_interval(1))], 'LineStyle','--', 'EdgeColor','black' , 'LineWidth', 1.5)
xlabel('x_1');
ylabel('x_2');
title({'Convergance of (x_1, x_2)', ['Initial Point: (x_1, x_2) = (', num2str(InitialPoint(1)), ', ', num2str(InitialPoint(2)), ')']})
subtitle({['Step choise (\gamma_k) == ', num2str(gammaConstValue),' {\it (const.)}']; ['Projection-step choise (s_k) == ', num2str(s)]; 'PROJECTED STEEPEST DESCENT METHOD'})

figure('Name', ['Projected Steepest Descent - const step ', num2str(gammaConstValue), ' - f value plot - sk=' , num2str(s)])
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
% set(gca, 'XTick', iterations)
ylabel('f(x_1, x_2)');
title({'Objective function value per iteration (k)';['Initial Point: (x_1, x_2) = (', num2str(InitialPoint(1)), ', ', num2str(InitialPoint(2)), ')']})
subtitle({['Step choise (\gamma_k) == ', num2str(gammaConstValue),' {\it (const.)}']; ['Projection-step choise (s_k) == ', num2str(s)]; 'PROJECTED STEEPEST DESCENT METHOD'})

gammaConstValue = 1;
[~, maxIterations, x_values, y_values] = ProjectedSteepestDescent_method(f, InitialPoint, epsilon, 'StepChoise', 'ArmijoRule', gammaConstValue, s, x1_interval, x2_interval);

figure('Name', ['Projected Steepest Descent - armijo initial step ', num2str(gammaConstValue), ' - contour plot - sk=' , num2str(s)])
fcontour(f, [-12, 12, -14, 14]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
rectangle('Position',[x1_interval(1) x2_interval(1) (x1_interval(2) - x1_interval(1)) (x2_interval(2) - x2_interval(1))], 'LineStyle','--', 'EdgeColor','black' , 'LineWidth', 1.5)
xlabel('x_1');
ylabel('x_2');
title({'Convergance of (x_1, x_2)', ['Initial Point: (x_1, x_2) = (', num2str(InitialPoint(1)), ', ', num2str(InitialPoint(2)), ')']})
subtitle({['Step choise (\gamma_k) given by Armijo Rule ( Initial Step used: ', num2str(gammaConstValue), ' )']; ['Projection-step choise (s_k) == ', num2str(s)]; 'PROJECTED STEEPEST DESCENT METHOD'})

figure('Name', ['Projected Steepest Descent - armijo initial step ', num2str(gammaConstValue), ' - f value plot - sk=' , num2str(s)])
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
% set(gca, 'XTick', iterations)
ylabel('f(x_1, x_2)');
title({'Objective function value per iteration (k)';['Initial Point: (x_1, x_2) = (', num2str(InitialPoint(1)), ', ', num2str(InitialPoint(2)), ')']})
subtitle({['Step choise (\gamma_k) given by Armijo Rule ( Initial Step used: ', num2str(gammaConstValue), ' )']; ['Projection-step choise (s_k) == ', num2str(s)]; 'PROJECTED STEEPEST DESCENT METHOD'})
%% Part 4
s = 0.1;
gammaConstValue = 0.2;
InitialPoint = [8, - 10];
epsilon = 0.01;
[~, maxIterations, x_values, y_values] = ProjectedSteepestDescent_method(f, InitialPoint, epsilon, 'StepChoise', 'const', gammaConstValue, s, x1_interval, x2_interval);

figure('Name', ['Projected Steepest Descent - const step ', num2str(gammaConstValue), ' - contour plot - sk=' , num2str(s)])
fcontour(f, [-12, 12, -14, 14]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
rectangle('Position',[x1_interval(1) x2_interval(1) (x1_interval(2) - x1_interval(1)) (x2_interval(2) - x2_interval(1))], 'LineStyle','--', 'EdgeColor','black' , 'LineWidth', 1.5)
xlabel('x_1');
ylabel('x_2');
title({'Convergance of (x_1, x_2)', ['Initial Point: (x_1, x_2) = (', num2str(InitialPoint(1)), ', ', num2str(InitialPoint(2)), ')']})
subtitle({['Step choise (\gamma_k) == ', num2str(gammaConstValue),' {\it (const.)}']; ['Projection-step choise (s_k) == ', num2str(s)]; 'PROJECTED STEEPEST DESCENT METHOD'})

figure('Name', ['Projected Steepest Descent - const step ', num2str(gammaConstValue), ' - f value plot - sk=' , num2str(s)])
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
% set(gca, 'XTick', iterations)
ylabel('f(x_1, x_2)');
title({'Objective function value per iteration (k)';['Initial Point: (x_1, x_2) = (', num2str(InitialPoint(1)), ', ', num2str(InitialPoint(2)), ')']})
subtitle({['Step choise (\gamma_k) == ', num2str(gammaConstValue),' {\it (const.)}']; ['Projection-step choise (s_k) == ', num2str(s)]; 'PROJECTED STEEPEST DESCENT METHOD'})

if (InitialPoint(1) < x1_interval(1))
    x1Bar = x1_interval(1);
elseif (InitialPoint(1) > x1_interval(2))
    x1Bar = x1_interval(2);
else
    x1Bar = InitialPoint(1);
end
% Projecting χ2Bar on the set of restraints
if (InitialPoint(2) < x2_interval(1))
    x2Bar = x2_interval(1);
elseif (InitialPoint(1) > x2_interval(2))
    x2Bar = x2_interval(2);
else
    x2Bar = InitialPoint(2);
end

InitialPointBar = [x1Bar x2Bar];
[~, maxIterations, x_values, y_values] = ProjectedSteepestDescent_method(f, InitialPointBar, epsilon, 'StepChoise', 'const', gammaConstValue, s, x1_interval, x2_interval);

figure('Name', ['Projected Steepest Descent - const step ', num2str(gammaConstValue), ' - contour plot 2 - sk=' , num2str(s)])
fcontour(f, [-12, 12, -14, 14]);
hold on;
plot(x_values, y_values, 'Color', 'red');
hold on;
plot(x_values(end), y_values(end), '-*');
plot(x_values(1), y_values(1), '-hexagram', 'Color', '#808080')
rectangle('Position',[x1_interval(1) x2_interval(1) (x1_interval(2) - x1_interval(1)) (x2_interval(2) - x2_interval(1))], 'LineStyle','--', 'EdgeColor','black' , 'LineWidth', 1.5)
xlabel('x_1');
ylabel('x_2');
title({'Convergance of (x_1, x_2)', ['Initial Point: (x_1, x_2) = (', num2str(InitialPoint(1)), ', ', num2str(InitialPoint(2)), ') but initially projected to: (', num2str(InitialPointBar(1)), ', ', num2str(InitialPointBar(2)), ')']})
subtitle({['Step choise (\gamma_k) == ', num2str(gammaConstValue),' {\it (const.)}']; ['Projection-step choise (s_k) == ', num2str(s)]; 'PROJECTED STEEPEST DESCENT METHOD'})

figure('Name', ['Projected Steepest Descent - const step ', num2str(gammaConstValue), ' - f value plot 2 - sk=' , num2str(s)])
f_values = double(f(x_values, y_values));
iterations = 1:1:maxIterations;
plot(iterations, f_values);
hold on;
plot(iterations(end), f_values(end), '-*');
hold on;
plot(iterations(1), f_values(1), '-hexagram', 'Color', '#808080');
xlabel('k (Number of iteration)');
% set(gca, 'XTick', iterations)
ylabel('f(x_1, x_2)');
title({'Objective function value per iteration (k)';['Initial Point: (x_1, x_2) = (', num2str(InitialPoint(1)), ', ', num2str(InitialPoint(2)), ') but initially projected to: (', num2str(InitialPointBar(1)), ', ', num2str(InitialPointBar(2)), ')']})
subtitle({['Step choise (\gamma_k) == ', num2str(gammaConstValue),' {\it (const.)}']; ['Projection-step choise (s_k) == ', num2str(s)]; 'PROJECTED STEEPEST DESCENT METHOD'})