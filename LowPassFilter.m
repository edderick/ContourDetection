function im = LowPassFilter( im, threshold )
%LOWPASSFILTER Applies a low pass filter to the image.
%   Sets any pixels in the image which do not excede the threshold, to
%   zero.

im = arrayfun(@(im)LowPass(threshold,im), im);
end

function out_intensity = LowPass( threshold, in_intensity )
%LOWPASS Does the actual work of the low pass filter
%   Compares a pixel to a threshold. Returns zero if it is less, the
%   original intensity if it is greater.

if in_intensity < threshold
    out_intensity = 0;
else
    out_intensity = in_intensity;
end;
end
