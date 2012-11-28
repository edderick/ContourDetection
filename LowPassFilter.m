function im = LowPassFilter( im, threshold )
im = arrayfun(@(im)LowPass(threshold,im), im);
end

function [ y ] = LowPass( threshold, x )
%F Summary of this function goes here
%   Detailed explanation goes here

    if x < threshold
        y = 0;
    else
        y = x;
    end;

end
