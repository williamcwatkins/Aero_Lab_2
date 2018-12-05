%% ASEN 2002 Aerodynamics Lab 2
%{
William Watkins
Seth Krein
Ryan Burdick
Raymie Fotherby
%}

%% Let's read in our data
DaGuds = ReadMahInput();
% this is for the sample data
DaGuds = csvread('sample_set_2018.csv',1,0);
%% Now let's do something with it
%DaGuds = DaGuds'; Commented out because we're using the sample data which
%is just a matrix, not a cell array. Will need to uncomment

for i = 1:length(DaGuds)
    DaGuds(i) = TrailingEdge(DaGuds(i));
end