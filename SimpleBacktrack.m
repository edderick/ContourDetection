function Contour = SimpleBacktrack(Position, Energy, Vertices)
%SIMPLEBACKTRACK Produces a contour for simple dpa by backtracking.
%   Uses backtracking to produce a contour for the simple dynamic
%   programming algorthm.

contourLength = length(Position(1,:));
next_position = SimpleMin(Energy(:, length(Energy(1,:))));

Contour = zeros(contourLength, 2);

for i =  contourLength : -1 : 1
    Contour(i, 1) = Vertices(next_position, i, 1);
    Contour(i, 2) = Vertices(next_position, i, 2);
    
    next_position = Position(next_position, i);
end
end