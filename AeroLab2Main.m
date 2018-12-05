%% ASEN 2002 Aerodynamics Lab 2
%{
William Watkins
Seth Krein
Ryan Burdick
Raymie Fotherby
%}

%% Let's read in our data
%DaGuds = ReadMahInput();
% this is for the sample data
DaGuds = csvread('AirfoilPressure_S013_G07.csv',1,0);
%% Now let's do something with it
%DaGuds = DaGuds'; Commented out because we're using the sample data which
%is just a matrix, not a cell array. Will need to uncomment

% Add the theoretical trailing edge pressure
DaGuds = TrailingEdge(DaGuds);

% Calculate coefficient of pressure along the airfoil, vector also has
% angle of attack in last column
CPressure = CPressureCalc(DaGuds);

LocationTop = [0 .175 .35 .7 1.05 1.4 1.75 2.1 2.8 3.5;...
                .14665 .33075 .4018 .476 .49 .4774 .4403 .38325 .21875 0];
LocationBot = [3.5 2.8 2.1 1.4 1.05 .7 .35 .175;...
                0 0 0 0 0 .0014 .0175 .03885];
figure(1)
%plot(LocationTop(1,:) ./ 3.5, CPressure(1,1:10))
hold on
plot(LocationBot(1,:) ./ 3.5, CPressure(1,10:17))
hold off