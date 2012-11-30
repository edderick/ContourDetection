function energy = ComplexEnergy(Intensities, V1, V2, V3 )
%SIMPLEENERGY The energy function for the complex algorithm.
%   Calculates the energy value for the given vertices. This function
%   ensure that the line is smooth.
    
    lambda = 0.5;
    
    % norm is used to calculate the magnitude of a vector
    %numerator = norm(v3 - (2 * v2) + v1) ^ 2;
    %denominator = norm(v3 - v1) ^ 2;
    
    % Cancelled the square root with squared for slight speed increase
    U1 = V3 - (2 * V2) + V1; 
    numerator = U1(1) ^ 2 + U1(2) ^ 2;
    
    U2 = V3 - V1;
    denominator = U2(1) ^ 2 + U2(2) ^ 2;
    
    energy = lambda * ((numerator) / (denominator)) + (1 - lambda) * Intensities(V2(1), V2(2));
end