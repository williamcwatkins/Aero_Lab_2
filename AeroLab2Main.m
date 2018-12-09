%% ASEN 2002 Aerodynamics Lab 2
%{
William Watkins
Seth Krein
Ryan Burdick
Raymie Fotherby
%}

%% Clean up, clean up, everybody clean up
clear all
clc

%% Declare some variables
global Location c
c = 3.5;
LocationTop = [0 .175 .35 .7 1.05 1.4 1.75 2.1 2.8 3.5;...
                .14665 .33075 .4018 .476 .49 .4774 .4403 .38325 .21875 0];
LocationBot = [3.5 2.8 2.1 1.4 1.05 .7 .35 .175 0;...
                0 0 0 0 0 .0014 .0175 .03885 .14665];
Location = [LocationTop LocationBot(:,2:end - 1)];

%% Let's read in our data and sort it
DaGuds = ReadMahInput();

DaGuds = SortAoA(DaGuds);

[DaGuds, AoAIndex] = SortVelocity(DaGuds);

% this is for the sample data
%DaGuds = csvread('AirfoilPressure_S013_G03.csv',1,0);

%% Now let's do something with it

% Add the theoretical trailing edge pressure
DaGuds = TrailingEdge(DaGuds);

% Average the readings for each AoA
DaGuds = AverageOut(DaGuds, AoAIndex);

% Calculate coefficient of pressure along the airfoil, vector also has
% angle of attack in last column
CPressure = CPressureCalc(DaGuds);

% Calculate Cl and Cd
[CLift, CDrag, AoA, Velocity] = WillItFlyMan(CPressure);



% CPressure is sorted by AoA and within AoA by velocity
% Change the next two variables for different plots of cpressure vs %chord
velocity = 1; % 1 is 9, 2 is 17, 3 is 34
aoa = 1; % 1 is -16, 2 is -15, etc. onto 32 for 16
figure(1)
plot(LocationTop(1,:) ./ c, CPressure(velocity * aoa,2:11))
hold on
plot(LocationBot(1,:) ./ c, [CPressure(velocity * aoa,11:18) CPressure(velocity * aoa,2)])
hold off

velocity = 1; % As above, 1 is 9, 2 is 17, 3 is 34
figure(2)
plot(AoA(velocity,:), CLift(velocity,:));
hold on
plot(AoA(velocity,:), CDrag(velocity,:));
hold off