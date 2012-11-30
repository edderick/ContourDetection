function [p, s] = SimplePosition(intensities, Energy, v2)
%SIMPLEPOSITION The position function for the simple algorithm.
%   Calculates the position value for the given vertices.

    % Used to find the minimum
    s = -1;

    for i = 1 : length(intensities(:, 1))
        v1 = [i, v2(2) - 1];
        this_s = Energy(v1(1), v1(2)) + SimpleEnergy(intensities, v1, v2);
    
        % If this is the first value
        if s == -1
            p = i;
            s = this_s;
        % If this is the smallest value yet
        elseif this_s < s
            p = i;
            s = this_s;
        end
    end
end