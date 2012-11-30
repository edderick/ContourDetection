function contour = ComplexBacktrack(Position, Energy, Vertices)
% COMPLEXBACKTRACK Performs backtracking for the complex algorithm
%   Starts at the minimum point of the end of the contour and
%   backtracks along it to produce a contour.

contourLength = length(Position(1,:,1));
x = ComplexMin(Energy(:, length(Energy(1, :, 1)), :));

currentPosition = x(1);
previousPosition = x(2);

contour = zeros(contourLength, 2);

% Loop back through contour
for i =  contourLength : -1 : 1
    contour(i, 1) = Vertices(currentPosition, i, 1);
    contour(i, 2) = Vertices(currentPosition, i, 2);
    
    temp = currentPosition;    
    currentPosition = Position(currentPosition, i, previousPosition);
    previousPosition = temp;
end
end
