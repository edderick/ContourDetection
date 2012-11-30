function sample = BasicSample(Image, x, y)
%BASICSAMPLE Returns an approximation of the value of intensity at given point.
%   Rounds the real number coordinates to the nearest integer and returns
%   the intensity at that pixel.

x = round(x);
y = round(y);

sample = Image(y, x);
end

