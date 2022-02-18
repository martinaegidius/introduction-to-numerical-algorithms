function fit = LagrangeFormInterpolation(knots,ydata,t)
%LagrangeFormInterpolation: CalculateS the values of the interpolating 
%                           polynomial in Lagrange form
%
%   fit = LagrangeFormInterpolation(knots,ydata,t)
%
% Input:
%   knots=[x0 x1 ... xn]   is a row of n+1 knot-values
%   ydata=[y0 y1 ... yn]   is a row of the corresponding n+1 y-values
%   t=[t1 ... tm]          is a row of all the m values that the inter-
%                          polating polynomial is to be evaluated in
% Output:
%   fit=[P(t1) ... P(tm)]  a row with the m function values of the
%                          interpolating polynomial

m=length(knots);
if (m~=length(ydata) ) 
    display('Der skal v�re lige mange knuder og ydata'); 
    fit=NaN; return; 
end

kardinaler=zeros(m,length(t));
for i=1:m
    kardinaler(i,:)=kardinalpoly(knots,i,t)';
end
Y=repmat(ydata',1,length(t));
fit=sum(kardinaler.*Y);

% --------- Subfunction ----------------------------------

function l = kardinalpoly(knots,i,t)
%kardinalpoly: Calculates the function values of i'th kardinal 
%              polynomial in all t-values based on the knots 
%
%   l = kardinalpoly(knots,i,t)
%
% Input:
%    i      the index (between 1 and n+1) of the kardinal polynomial
%    knots: the knots [x_1 ... x_(n+1)]
%    t      a row [t1 ... tm] of all the values that the 
%           i'th kardinal polynomial is to be evaluated in  
% Output:
%    l      a row with the m function values of the
%           i'th kardinal polynomial

l=ones(size(t)); 
m=length(knots);
for j=[1:i-1 i+1:m]
    l=l.*(t-knots(j))./(knots(i)-knots(j));
end
