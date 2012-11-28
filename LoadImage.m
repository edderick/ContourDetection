function im = LoadImage()
% Read a png file into a Matlab Matrix
im = imread('tongue.png');

% Convert the values to lie between 0 and 1
im = double(im);
imax = max(max(im));
imin = min(min(im));
im = (im - imin) / (imax - imin);

end