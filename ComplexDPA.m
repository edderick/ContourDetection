function [ contour ] = ComplexDPA(divisions, im, contour1, contour2)
%COMPLEXDPA Summary of this function goes here
%   Detailed explanation goes here

contourLength = length(contour1(:, 1));

[vertices, intensities] = GenerateSearchSpace(divisions, im, contour1, contour2);

% Uncomment to see all the points
% PlotVertices(vertices);

Position = zeros(divisions, contourLength, divisions);
Energy = zeros(divisions, contourLength, divisions);

for col = 2 : contourLength
    for row = 1 : divisions
        for future = 1 : divisions
        [p, e] = ComplexPosition(intensities, Energy, [row, col], [future, col + 1]);
        
        Position(row, col, future) = p;
        Energy(row, col, future) = e;
        end
    end
end

contour = ComplexBacktrack(Position, Energy, vertices);

end

