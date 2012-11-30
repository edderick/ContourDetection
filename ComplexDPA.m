function contour = ComplexDPA(divisions, Image, Contour1, Contour2)
%COMPLEXDPA Performs the complex dynamic programming algorithm.
%   Using the supplied parameter, number of divisions, and image and two
%   contours, this function performs the complex dynamic programming
%   function to calculate a contour.

contourLength = length(Contour1(:, 1));
[vertices, intensities] = GenerateSearchSpace(divisions, Image, Contour1, Contour2);

% Uncomment to see all the points
% PlotVertices(vertices);

Position = zeros(divisions, contourLength, divisions);
Energy = zeros(divisions, contourLength, divisions);

% Loop over all points
for col = 2 : contourLength
    for row = 1 : divisions
        %Loop over all posible next points
        for future = 1 : divisions
            [p, e] = ComplexPosition(intensities, Energy, [row, col], [future, col + 1]);
            
            Position(row, col, future) = p;
            Energy(row, col, future) = e;
        end
    end
end

contour = ComplexBacktrack(Position, Energy, vertices);
end