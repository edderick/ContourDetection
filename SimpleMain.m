tic % Start Timer 

SetUp;

divisions = 50;
contour = SimpleDPA(divisions, im, contour1, contour2);

PlotContour(contour, 'g-');

toc % Stop Timer 