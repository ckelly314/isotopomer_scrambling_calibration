function isol = automate_gk_solver(R)

% automate_gk_solver   Calculates scrambling coefficients gamma & kappa
%=========================================================================
% automate_gk_solver Version 1, Aug 28, 2017
%          
% USAGE:  isol = calcSPmain(R)
%
% DESCRIPTION:
%    Uses values of 31R, 45R and 46R and known 15Ralpha and 15Rbeta to 
%     iteratively solve for scrambling coefficients gamma and kappa.
%
% INPUT:  R = array with dimensions n x 6 where n is the number of
%   reference pairs. The six columns are 31R, 45R and 46R for reference #1,
%   then 31R, 45R, 46R for reference #2, from left to right.
%
% OUTPUT:
%   isol = array with dimensions n x 2 where n is the number of
%   reference pairs. The two columns are gamma, kappa from left to right.
% 
% AUTHOR:  Colette Kelly (clkelly@stanford.edu)
%=========================================================================

% initial guess for 15Ralpha and 15Rbeta 
x0 = [0.17; 0.08];

% Lower bounds and upper bounds for gamma and kappa
% These constraints ensure that the solver converges to a solution in the
% correct range.
lb = [0.07; 0.07]; ub = [0.19; 0.19];

% Options for solver function
% Include 'Display','iter' to see the solver output for each iteration
% This is helpful if the data output seems suspect
options=optimset('TolFun',1e-10,'TolX',1e-10,'MaxFunEvals',2000); 


% Run least squares nonlinear solver for each row of data
% to obtain gamma and kappa
for n = 1:length(R(:,1))
    [v,fval] = lsqnonlin(@automate_gk_eqns,x0,lb,ub,options,R(n,:));

    % Create a new array from the iterated solutions 
    % First column is gamma, second is kappa
    isol(n,:) = v; 
end 

return