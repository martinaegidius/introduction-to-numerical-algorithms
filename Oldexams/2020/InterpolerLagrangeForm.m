function fit = InterpolerLagrangeForm(nodes,ydata,t)
%InterpolerLagrangeForm: Calculate the values of the interpolating 
%                           polynomial in Lagrange form
%
%   fit = InterpolerLagrangeForm(nodes,ydata,t)
%
% Input:
%   nodes=[x0 x1 ... xn]   is a row of n+1 node-values
%   ydata=[y0 y1 ... yn]   is a row of the corresponding n+1 y-values
%   t=[t1 ... tm]          is a row of all the m values that the inter-
%                          polating polynomial is to be evaluated in
% Output:
%   fit=[P(t1) ... P(tm)]  a row with the m function values of the
%                          interpolating polynomial

m=length(nodes);
if (m~=length(ydata) ) 
    disp('The numbers of the nodes and ydata should be the same!'); 
    fit=NaN; return; 
end

cardinals=zeros(m,length(t));
for i=1:m
    cardinals(i,:)=CardinalPolynomial(nodes,i,t)';
end
Y=repmat(ydata',1,length(t));
fit=sum(cardinals.*Y);
