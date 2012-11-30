function Contour = SimpleDPA(divisions, Image, Contour1, Contour2)
%SIMPLEDPA Performs the simple dynamic programming algorithm
%   Performs the simple dynamic programming algorithm which minimises
%   energy and ensures continuity.

contourLength = length(Contour1(:, 1));

[Vertices, Intensities] = GenerateSearchSpace(divisions, Image, Contour1, Contour2);

% Uncomment to see all the points
%PlotVertices(vertices);

Position = zeros(divisions, contourLength);
Energy = zeros(divisions, contourLength);

% For each point
for col = 2 : contourLength
    for row = 1 : divisions
        [p, e] = SimplePosition(Intensities, Energy, [row, col]);
        
        Position(row, col) = p;
        Energy(row, col) = e;
    end
end

Contour = SimpleBacktrack(Position, Energy, Vertices);
end