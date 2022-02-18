nodes = linspace(1,2,26);
ydata = log(nodes);
sampleSpace = linspace(1,2,400);

fit = InterpolerLagrangeForm(nodes,ydata,sampleSpace);

ydataErrs = log(sampleSpace);
absErr = abs(ydataErrs-fit);
[maxVal,maxIdx] = max(absErr);
plot(nodes,ydata,'x')
hold on 
plot(sampleSpace,fit)
plot(sampleSpace(maxIdx),fit(maxIdx),'o')
