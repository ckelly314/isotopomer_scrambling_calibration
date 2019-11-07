function F = automate_gk_eqns(f,R)

% automate_gk_eqns   Calculates 15Ralpha and 15Rbeta from 31R, 45R and 46R
%=========================================================================
% automate_gk_eqns Version 1, Aug 28, 2017
%          
% USAGE:  [v,fval] = lsqnonlin(@SPnonlineq,x0,lb,ub,options,R(n,:));
%    Please see calcSPmain.m for definitions of these variables.
%
% DESCRIPTION:
%    Uses values of 31R, 45R and 46R to iteratively solve for 15Ralpha and 
%    15R beta
%
% INPUT:  R = array with dimensions n x 3 where n is the number of
%    measurements.  The three columns are 31R, 45R and 46R from left to 
%    right.
%
% OUTPUT:
%   F = array with dimensions n x 2 where n is the number of
%   measurements.  The two columns are 15Ralpha and 15Rbeta from left to 
%   right.
% 
% AUTHOR:  Colette Kelly (clkelly@stanford.edu)
%=========================================================================
% rename inputted data
x = R(:,1);
y = R(:,2);

x2 = R(:,4);
y2 = R(:,5);

% test dummy values
%a = 0.005;
%b = 0.005;

% calibrated sample: Toyoda Lab S1
%a = 0.00373422105; %alpha
%b = 0.003664698435; %beta

% calibrated sample: atmosphere-equilibrated seawater
a = 0.003734221050; %alpha, from "N2Ocalibrationsummary.xlsx"
b = 0.003664367550; %beta

% calibrated sample: Toyoda Lab S2
%a2 = 0.003696905; %alpha
%b2 = 0.003629183; %beta

% calibrated sample: Air Liquide B6
a2 = 0.00367501482137193; %alpha
b2 =0.00367595533009498; %beta

% solve two equations with two unknowns
% f(1) = = 15Ralpha = a, and f(2) = 15Rbeta = b
F = [(1-f(1)).*a + f(2)*b + a*b + (y - a - b).*(1 + f(1)*a + (1-f(2)).*b) - x*(1 + f(1)*a + (1-f(2)).*b);
     (1-f(1)).*a2 + f(2)*b2 + a2*b2 + (y2 - a2 - b2).*(1 + f(1)*a2 + (1-f(2)).*b2) - x2*(1 + f(1)*a2 + (1-f(2)).*b2)];

return

