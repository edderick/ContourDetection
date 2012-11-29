SetUp

iterations = 30;
step = 2;

timing = zeros(iterations, 2);

figure(2)
axis square

for i = 1:iterations
    divisions = i * step
    
    timing(i, 1) = divisions;
    
    tic
    contour = ComplexDPA(divisions, im, contour1, contour2);
    timing(i, 2) = toc
    
end


PlotContour(timing, 'g-+');

