function isol = automate_gk_solver(R)

% initial guess for 15Ralpha and 15Rbeta 
x0 = [0.17; 0.08];

% Lower bounds and upper bounds for 15Ralpha and 15Rbeta
% These constraints ensure that the solver converges to a solution in the
% correct range.
lb = [0.07; 0.07]; ub = [0.19; 0.19];

% Options for solver function
% Include 'Display','iter' to see the solver output for each iteration
% This is helpful if the data output seems suspect
options=optimset('TolFun',1e-10,'TolX',1e-10,'MaxFunEvals',2000); 


% Run least squares nonlinear solver for each row of data
% to obtain 15Ralpha and 15Rbeta
for n = 1:length(R(:,1))
    [v,fval] = lsqnonlin(@automate_gk_eqns,x0,lb,ub,options,R(n,:));

    % Create a new array from the iterated solutions 
    % First column is gamma, second is kappa
    isol(n,:) = v; 
end 

return