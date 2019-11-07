% Example function demonstrating how to calculate scrambling coefficients.

% Input data used to solve equation.
% Columns are 31R, 45R and 46R (x, y and z) for reference #1,
% ...then 31R, 45R and 46R (x, y and z) for reference #2.
% Each row is one pair of reference gases.
% Input data should include at least six significant figures for accurate 
% results.

R = load('example_input.csv');

% Run function that iteratively solves for gamma and kappa 
% (scrambling coefficients).
isol = automate_gk_solver(R);

% Create a commma delimited text file containing the output data
% 'precision', 8 saves each value to 8 decimal places instead of the
% default 6
% The columns from left to right are: gamma, kappa
dlmwrite('example_output.txt', isol, 'delimiter', '\t', 'precision', 8)

