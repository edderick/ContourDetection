function [p, s] = SimplePosition(intensities, Energy, v2)

    % Used to find the minimum
    s = -1;

    for i = 1 : length(intensities(:, 1))
        v1 = [i, v2(2) - 1];
        this_s = Energy(v1(1), v1(2)) + SimpleEnergy(intensities, v1, v2);
        
        if s == -1
            p = i;
            s = this_s;
        elseif this_s < s
            p = i;
            s = this_s;
        end
    end
end