% This Script can be used to generate a contour.
% Variables should be set to the desired values.

divisions = 50;

startx = 250;
starty = 25;

endx = 600;  
endy = 400;

% Do not edit below this line. 

dx = (endx - startx) / divisions;
dy = (endy - starty) / divisions;

coords = zeros(divisions,2);

for i = 1:divisions; 
    coords(i,1) = startx + (dx * i);
    coords(i,2) = starty + (dy * i);
end

coords