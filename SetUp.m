% This script sets up the environment for an edge to be detected.
% Edit this file to configure the image to be loaded and the initial 
% contours to be used. Low pass filtering can also be configured.

im = LoadImage('tongue.png');




%Apply Low Pass filter
%im = LowPassFilter(im, 0.7);

% Invert Image 
im =  1 - im;


ShowImage(im);

contour1 = load('init1.ctr');
contour2 = load('init2.ctr');

PlotContour(contour1, 'r');
PlotContour(contour2, 'r');

