% This Script can be used to generate a contour 

divisions = 50;

startx = 2.0000000e+002;
starty = 0.10000e+002;

endx = 2.8000000e+002;  
endy = 5.00000e+002;

dx = (endx - startx) / divisions;
dy = (endy - starty) / divisions;

coords = zeros(divisions,2);

for i = 1:divisions; 
    coords(i,1) = startx + (dx * i);
    coords(i,2) = starty + (dy * i);
end