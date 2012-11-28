function e = ComplexEnergy(intensities, v1, v2, v3 )
%SIMPLEENERGY Summary of this function goes here
%   Detailed explanation goes here
    lambda = 0.5;
    
    % norm is used to calculate the magnitude of a vector
    %numerator = norm(v3 - (2 * v2) + v1) ^ 2;
    %denominator = norm(v3 - v1) ^ 2;
    
    % Cancel out a the square root for slight speed increase
    u1 = v3 - (2 * v2) + v1; 
    numerator = u1(1) ^ 2 + u1(2) ^ 2;
    
    u2 = v3 - v1;
    denominator = u2(1) ^ 2 + u2(2) ^ 2;
    
    
    e = lambda * ((numerator) / (denominator)) + (1 - lambda) * intensities(v2(1), v2(2));
    
end