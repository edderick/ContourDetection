tic % Start Timer

SetUp

divisions = 50;
contour = ComplexDPA(divisions, im, contour1, contour2);

PlotContour(contour, 'g-');

toc % Stop Timer 