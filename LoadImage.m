function Image = LoadImage(imageName)
%LOADIMAGE Loads an image from a file and normalises it.
%   Loads an image from the specified file and normalises the values to lie
%   between zero and one.

% Read a png file into a Matlab Matrix
Image = imread(imageName);

% Convert the values to lie between 0 and 1
Image = double(Image);
imax = max(max(Image));
imin = min(min(Image));
Image = (Image - imin) / (imax - imin);

end