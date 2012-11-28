function [ contour ] = SimpleDPA(divisions, im, contour1, contour2)
%SIMPLEDPA Summary of this function goes here
%   Detailed explanation goes here

contourLength = length(contour1(:, 1));

[vertices, intensities] = GenerateSearchSpace(divisions, im, contour1, contour2);

% Uncomment to see all the points
% PlotVertices(vertices);

Position = zeros(divisions, contourLength);
Energy = zeros(divisions, contourLength);

for col = 2 : contourLength
    for row = 1 : divisions
        [p, e] = SimplePosition(intensities, Energy, [row, col]);
        
        Position(row, col) = p;
        Energy(row, col) = e;
    end
end

contour = SimpleBacktrack(Position, Energy, vertices);


end

