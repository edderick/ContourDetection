function sample = BasicSample(im, x, y)
% Returns an an approximation of the value at x,y
% Could be extended to use fancier sampling

x = round(x);
y = round(y);

sample = im(y, x);

end

