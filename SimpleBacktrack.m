function contour = SimpleBacktrack(Position, Energy, Vertices)

contourLength = length(Position(1,:));
p = SimpleMin(Energy(:, length(Energy(1,:))));

contour = zeros(contourLength, 2);

for i =  contourLength : -1 : 1 
    contour(i, 1) = Vertices(p, i, 1);
    contour(i, 2) = Vertices(p, i, 2);
    
    p = Position(p, i);
end



end