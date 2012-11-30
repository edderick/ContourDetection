function [p, s] = ComplexPosition(Intensities, Energy, V2, V3)
%COMPLEXPOSITION The position function for the complex algorithm.
%   Calculates the position value for the given vertices.

% Used for finding minimum
s = -1;

for i = 1 : length(Intensities(:, 1))
    v1 = [i, V2(2) - 1];
    
    % Calculate energy required to get here
    this_s = Energy(v1(1), v1(2), V2(1)) + ComplexEnergy(Intensities, v1, V2, V3);
    
    % If this is the first value
    if s == -1
        p = i;
        s = this_s;
        % If this is the smallest value so far
    elseif this_s < s
        p = i;
        s = this_s;
    end
end
end