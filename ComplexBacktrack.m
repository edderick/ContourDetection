function contour = ComplexBacktrack(Position, Energy, Vertices)

contourLength = length(Position(1,:,1));
x = ComplexMin(Energy(:, length(Energy(1, :, 1)), :));

p = x(1);
n = x(2);

contour = zeros(contourLength, 2);

for i =  contourLength : -1 : 1 
    contour(i, 1) = Vertices(p, i, 1);
    contour(i, 2) = Vertices(p, i, 2);
    
    temp = p;
    
    p = Position(p, i, n);
    
    n = temp;
end
end