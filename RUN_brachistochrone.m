%% PLOT BACHISTOCHRONE

% Objetive: graphical comparison for the brachistocrhone curve for
% different number of discretization given an initial and a final point

% Author: Igor Lau in 08/03/2021
%% PARAMETERS
% Number of discretizations vector
N = [1 2 5 10 25 50 75];
str = strcat('N', string(N));

% Initial and Final Positions [x; y]
pos_i = [0; 1];
pos_f = [1; 0];

%% CALL TO THE 'brachistochrone.m' FUNCTION
for i = 1:length(N)
    [x,y,fsol,flag,out,f] = brachistochrone(N(i),pos_i,pos_f);
    
    % Storing the outputs
    X.(str(i)) = x;
    Y.(str(i)) = y;
    time(i,1) = fsol;
    exitFlag(i,1) = flag;
    output.(str(i)) = out;
    optfval.(str(i)) = f;
end

%% PLOTS
% INDIVIDUAL PLOT
for i = 1:length(N)
    figure('Name', str(i))
    
    % Curve Shape
    subplot(1,2,1)
    plot(X.(str(i)), Y.(str(i)), ...
        'LineStyle', '-', 'LineWidth', 1.5, 'Color', 'k')
    axis equal
    axis([pos_i(1) pos_f(1) pos_f(2) pos_i(2)]) 
    grid on; box on;
    xlabel('X'); ylabel('Y'); title('Brachitochrone')
    
    % Number of Iterations
    subplot(1,2,2)
    plot(optfval.(str(i)).Xdata, optfval.(str(i)).Ydata, 'LineStyle', 'none',...
        'Marker', 'd', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'm')
    grid on; box on;
    xlabel('# of Iterations'); ylabel('Objetive Function Value [s]')
    ylim([0.58 0.64])   % Limiting the axis for better visualization
end

% COMPARTIVE PLOT
figure
% Curve Shape
subplot(2,2,[1 3])
hold on; grid on; box on;
for i = 1:length(N)
    plot(X.(str(i)), Y.(str(i)), ...
        'LineStyle', '-', 'LineWidth', 1.5)
end
xlabel('X'); ylabel('Y');
axis equal; axis([pos_i(1) pos_f(1) pos_f(2) pos_i(2)]) 
title('Brachistochrone')
legend(str)

% Time Taken (Objetive Function Value) vs Number of Discretizations
subplot(2,2,2)
hold on; grid on; box on;
plot(N, time, 'LineStyle', 'none',...
        'Marker', 'o', 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r')
xlabel('# of discretizations (n)'); ylabel('Time [s]');

% Number of Iterations vs Number of Discretizations
subplot(2,2,4)
hold on; grid on; box on;
for i = 1:length(N)
    plot(N(i), output.(str(i)).iterations, 'LineStyle', 'none',...
        'Marker', 'o', 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b')
end
xlabel('# of discretizations (n)'); ylabel('# of Iterations');
