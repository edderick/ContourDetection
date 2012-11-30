function [ Position ] = ComplexMin( Matrix )
%SIMPLEMIN Find the position of the minimum element.
%   Finds the index of the minimum element of the 2D matrix.

% Initialise variables
Position = [0,0];
value = -1;

% Loop through matrix
for i = 1 : length(Matrix(:, 1))
    for j = 1 : length(Matrix(1, :))
        this_value = Matrix(i, j);
        % If this is the first value
        if value == -1
            Position(1) = i;
            Position(2) = j;
            value = this_value;
            % If this is the smallest value so far
        elseif this_value < value
            Position(1) = i;
            Position(2) = j;
            value = this_value;
        end
    end    
end
end