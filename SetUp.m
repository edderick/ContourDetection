im = LoadImage;


% Invert Image 
im =  1 - im;

% Apply Low Pass filter
%im = LowPassFilter(im, 0.5);


ShowImage(im);

contour1 = load('init1.ctr');
contour2 = load('init2.ctr');

PlotContour(contour1, 'r');
PlotContour(contour2, 'r');

