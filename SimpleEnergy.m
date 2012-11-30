function e = SimpleEnergy(Intensities, V1, V2 )
%SIMPLEENERGY The energy function for the simple dpa
%   Returns an energy value for the gievn vertices based on the intensity
%   and the distance between the points.

lambda = 0.5;

% norm is used to calculate the magnitude of a vector
e = lambda * norm(V2 - V1) + (1 - lambda) * Intensities(V1(1), V1(2));
end