function [p, s] = ComplexPosition(intensities, Energy, v2, v3)

% Used to find minimum
s = -1;

for i = 1 : length(intensities(:, 1))
    
        v1 = [i, v2(2) - 1];
        
        
        this_s = Energy(v1(1), v1(2), v2(1)) + ComplexEnergy(intensities, v1, v2, v3);
        
        if s == -1
            p = i;
            s = this_s;
        elseif this_s < s
            p = i;
            s = this_s;
        end
       
end
end