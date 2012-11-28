% This script sets up the environment for an edge to be detected.
% Edit this file to configure the image to be loaded and the initial 
% contours to be used. Low pass filtering can also be configured.

im = LoadImage('vapour_trail.png');

%Apply Low Pass filter
im = LowPassFilter(im, 0.7);

% Invert Image 
im =  1 - im;

ShowImage(im);

contour1 = load('vapour1.ctr');
contour2 = load('vapour2.ctr');

PlotContour(contour1, 'r');
PlotContour(contour2, 'r');

