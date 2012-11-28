function [ Position ] = ComplexMin( Matrix )
%SIMPLEMIN Find the position of the minimum element
%   Finds the index of the minimum element of the Array

Position = [0,0];
Value = -1;

for i = 1 : length(Matrix(:, 1))
    for j = 1 : length(Matrix(1, :))
        
        this_value = Matrix(i, j);
        if Value == -1
            Position(1) = i;
            Position(2) = j;
            Value = this_value;
        elseif this_value < Value
            Position(1) = i;
            Position(2) = j;
            Value = this_value;
        end
    end
    
end
end

