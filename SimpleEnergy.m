function e = SimpleEnergy(intensities, v1, v2 )
%SIMPLEENERGY Summary of this function goes here
%   Detailed explanation goes here
    lambda = 0.5;
    
    % norm is used to calculate the magnitude of a vector
    e = lambda * norm(v2 - v1) + (1 - lambda) * intensities(v1(1), v1(2));
    
end