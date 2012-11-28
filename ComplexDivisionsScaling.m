SetUp

timing = zeros(divisions, 1);

for divisions = 1:5:50
    divisions
    
    tic
    contour = ComplexDPA(divisions, im, contour1, contour2);
    timing(((divisions -1) / 5) +1) = toc
    
end

%PlotContour(contour, 'g-');

