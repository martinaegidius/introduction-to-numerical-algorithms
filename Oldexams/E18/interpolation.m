x = linspace(0,6,17);
y = (x+3).*exp(x);
sample_t = linspace(0,6,300);
sample_y = (sample_t+3).*exp(sample_t);

F = LagrangeFormInterpolation(x,y,sample_t);

err = sample_y-F;
plot(1:numel(sample_t),err)
