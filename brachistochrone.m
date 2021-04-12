function [X,Y,fsol,exitFlag,output,f] = brachistochrone(N,pos0,posf)

% Objetive: define the opmization parameters, the promblem's restrictions 
% and the initial parameters

% Author: Igor Lau in 08/03/2021

%% PARAMETERS
% Gravity
g = 9.81;

%% X AND Y VECTORS
% X Vector Discretized
X = linspace(pos0(1),posf(1),N+1)';

% Coordinate Transformation (y upward => y downward)
y0 = 0;
yf = pos0(2)-posf(2);

% Initial Guess y-vector (straight line)
y_guess = linspace(y0, yf, N+1);

%% OBJETIVE FUNCTION
time = @(y)time_fun(X,y,N,g);

%% RESTRICTIONS (initial and final points)
Aeq = zeros(2,N+1);
Aeq(1,1) = 1; Aeq(2,end) = 1;
beq = [y0 yf];

%% OPTIMIZATION AND OPTIMIZATION PARAMETERS
problem.objective = time;
problem.x0 = y_guess;
problem.Aineq = [];
problem.bineq = [];
problem.Aeq = Aeq;
problem.beq = beq;
problem.lb = [];
problem.ub = [];
problem.nonlcon = [];
problem.solver = 'fmincon';
problem.options = optimoptions(@fmincon,'Display','final-detailed',...
    'Algorithm','sqp', 'MaxIterations', 1000, 'PlotFcn', 'optimplotfval');

[sol, fsol, exitFlag, output] = fmincon(problem);

%% Y-AXIS REDEFINITION (y upward)
Y = pos0(2)-sol;
X = X';

%% 'fmincon' OUTPUT GRAPH
f.fig = gcf;
f.ax = gca;
f.chax = get(gca,'Children'); 
f.Xdata = get(f.chax,'Xdata');
f.Ydata = get(f.chax,'Ydata');
close
% f.fig.Visible = 'off';
end