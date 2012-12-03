% This Script can be used to generate a contour.
% Variables should be set to the desired values.

divisions = 50;

centrex = 260;
centrey = 190;

radius = 180;  

% Do not edit below this line 

coords = zeros(divisions, 2);

for i = 1:divisions;
    
    theta = ((2 * pi) / divisions) * i; 
    
    coords(i,1) = sin(theta) * radius + centrex;
    coords(i,2) = cos(theta) * radius + centrey;
end

figure(1)
PlotContour(coords, 'g-')