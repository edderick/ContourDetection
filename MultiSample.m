function sample = MultiSample(im, x, y)
% Returns an an approximation of the value at x,y
% Could be extended to use fancier sampling

x = round(x);
y = round(y);

weights = [1, 2, 1 ; 2, 4, 2 ; 1, 2, 1];
sampleSpace = im( (y-1):(y+1) , (x-1):(x+1) );

weightedSampleSpace = weights .* sampleSpace;

sample = sum(sum(weightedSampleSpace)) / sum(sum(weights));

end

