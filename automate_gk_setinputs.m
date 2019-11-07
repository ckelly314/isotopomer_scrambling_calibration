% Example function demonstrating how to calculate scrambling coefficients,
% using Colette's package of functions.

% Input data used to solve equation.
% Columns are 31R, 45R and 46R (x, y and z) from left to right.
% Each row is the data for one sample.
% Input data should include at least six significant figures for accurate 
% results.

R = load('example_input.csv');

% Run function that iteratively solves for 15Ralpha and 15Rbeta (a and b) 
% and then calculates 17R and 18R (c and d) by substitution
isol = automate_gk_solver(R);

% Create a commma delimited text file containing the isotope data
% 'precision', 8 saves each value to 8 decimal places instead of the
% default 6
% The columns from left to right are: 
% d15Nalpha, d15Nbeta, 15N site pref, d15Nbulk,  d17O, d18O
dlmwrite('example_output.txt', isol, 'delimiter', '\t', 'precision', 8)

