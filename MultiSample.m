function sample = MultiSample(Image, x, y)
%MULTISAMPLE Returns an approximation of the intensity at this point.
%   Calculates the energy value for the given vertices.

x = round(x);
y = round(y);

% Matrix of weights to apply to samples
weights = [1, 2, 1 ; 2, 4, 2 ; 1, 2, 1];
sampleSpace = Image( (y-1):(y+1) , (x-1):(x+1) );

weightedSampleSpace = weights .* sampleSpace;

sample = sum(sum(weightedSampleSpace)) / sum(sum(weights));
end