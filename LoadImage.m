function im = LoadImage(imageName)
% Read a png file into a Matlab Matrix
im = imread(imageName);

% Convert the values to lie between 0 and 1
im = double(im);
imax = max(max(im));
imin = min(min(im));
im = (im - imin) / (imax - imin);

end