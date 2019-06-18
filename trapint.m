function y = trapint(x,f,a,b)
% function y = trapint(f,x,a,b)
% Author: Damon Bradley
% Purpose: Modified trapezoidal integration over specific limits of integration.
% Last revised: Tuesday, March 20, 2012
%
% Inputs:
% ----------------------------------------------
% x - Domain of function f
% f - A fuction defined by a vector of points
% a - Lower limit of integration
% b - Upper limit of integration
%
% NOTE: If a and b are not specified, this function is reduced to the
% normal trapz function
%
% Outputs:
% ----------------------------------------------
% y - Integration result
%
% Prerequisites:
% None
%
% Usage Example
% clear
% clc
% close all
% N=1000000; mu=5; sig=1; % Define parameters for an N-sample Gaussian random vector
% [counts bins] = hist(mu+sig*randn(N,1),sqrt(N)); % Compute histogram. 
% p = counts/((bins(2)-bins(1))*N); % Compute corresponding PDF
% stairs(bins,p)
% y=trapint(bins,p,mu,inf) % Integrate from the mean to infinity. Should get 0.5 in theory.
% y =
% 
%     0.5019

switch nargin
    case 2,
        y = trapz(x,f);
    case 4,
        N = length(x);
        if a == -inf,
            idxa = 1;
        else
            [ga idxa] = min(abs(x-a));
        end

        if b == inf,
            idxb = N;
        else
            [gb idxb] = max(abs(x-b));
        end
        range = idxa:idxb;
        y = trapz(x(range),f(range));
    otherwise
        error('Incorrect number function arguments. See HELP trapint.')
end

