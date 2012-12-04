% This script extends the optimised Complex DPA to implement the
% Closed contour extraction method suggested by Gunn and Nixon.

tic

% Read in and display image
im = imread('heart.png');
im = double(im);
imax = max(max(im));
imin = min(min(im));
im = (im - imin) / (imax - imin);
figure(1)
imagesc(im)
colormap(gray)
axis square

% %%% Apply Low Pass filter %%%
%im = LowPassFilter(im, 0.7);

% %%% Invert Image %%%
im =  1 - im;

Contour1 = load('circle3.ctr');
Contour2 = load('circle4.ctr');

hold on % Plot to same figure...
plot(Contour1(:,1), Contour1(:,2), 'r', 'LineWidth', 2)
plot(Contour2(:,1), Contour2(:,2), 'r', 'LineWidth', 2)

contourLength = length(Contour1(:, 1));


% %%% SET DIVISIONS HERE %%%
divisions = 75;


vertices = zeros(divisions, contourLength, 2);
intensities = zeros(divisions, contourLength);

% Interpolation
for i = 1 : contourLength
    dx = Contour2(i,1) - Contour1(i,1);
    dy = Contour2(i,2) - Contour1(i,2);
    
    xstep = (dx / (divisions + 1));
    ystep = (dy / (divisions + 1));
    
    xcont = Contour1(i, 1);
    ycont = Contour1(i, 2);
    
    for j = 1 : divisions
        x = xcont + j * xstep;
        y = ycont + j * ystep;
        
        vertices(j, i, 1) = x;
        vertices(j, i, 2) = y;
        
        intensities(j, i) = im(round(y), round(x));
    end
end

% %%% Uncomment to see all the points %%%
% PlotVertices(vertices);

Position = zeros(divisions, contourLength, divisions);
Energy = zeros(divisions, contourLength, divisions);

% FIRST DPA LOOP %
for col = 2 : contourLength
    %col minus 1
    clmo = col - 1;
    for row = 1 : divisions
        % two row
        trow = row * 2;
        int = 0.5 * intensities(row , col);
        for future = 1 : divisions          
            e = Inf; 
            %future minus trow
            fmtrow = future - trow;
            for i = 1 : divisions
                u1a = fmtrow + i; 
                u2a = future - i;
                %Note 0.5 is magic number for lambda
                this_s = Energy(i, clmo, row) + 0.5 * ((u1a * u1a) / (u2a * u2a + 4)) + int;
                if this_s < e
                    p = i;
                    e = this_s;
                end
            end
            Position(row, col, future) = p;
            Energy(row, col, future) = e;
        end
    end
end

% Find min
Matrix = Energy(:, contourLength, :);
currentPosition = 0;
previousPosition = 0;
value = Inf;
for i = 1 : divisions
    for j = 1 : divisions
        this_value = Matrix(i, j);
        if this_value < value
            currentPosition = i;
            previousPosition = j;
            value = this_value;
        end
    end    
end

halfContourLength = floor(contourLength / 2);

% Backtrack
contour = zeros(halfContourLength, 2);
for i =  contourLength : -1 : halfContourLength +1
    contour(i - halfContourLength, 1) = vertices(currentPosition, i, 1);
    contour(i - halfContourLength, 2) = vertices(currentPosition, i, 2);
    
    temp = currentPosition;    
    currentPosition = Position(currentPosition, i, previousPosition);
    oldPreviousPosition = previousPosition;
    previousPosition = temp;
end
 
%plot(contour(:,1), contour(:,2), 'g-', 'LineWidth', 2)

Contour3 = [ Contour1(halfContourLength+1:contourLength, :) ; Contour1(1:halfContourLength+1, :)];
Contour4 = [ Contour2(halfContourLength+1:contourLength, :) ; Contour2(1:halfContourLength+1, :)];

hold on % Plot to same figure...
plot(Contour3(:,1), Contour3(:,2), 'r', 'LineWidth', 2)
plot(Contour4(:,1), Contour4(:,2), 'r', 'LineWidth', 2)

vertices = zeros(divisions, contourLength, 2);
intensities = zeros(divisions, contourLength);

% Interpolation
for i = 1 : contourLength
    dx = Contour4(i,1) - Contour3(i,1);
    dy = Contour4(i,2) - Contour3(i,2);
    
    xstep = (dx / (divisions + 1));
    ystep = (dy / (divisions + 1));
    
    xcont = Contour3(i, 1);
    ycont = Contour3(i, 2);
    
    for j = 1 : divisions
        x = xcont + j * xstep;
        y = ycont + j * ystep;
        
        vertices(j, i, 1) = x;
        vertices(j, i, 2) = y;
        
        intensities(j, i) = im(round(y), round(x));
    end
end


Position = zeros(divisions, contourLength, divisions);
Energy = zeros(divisions, contourLength, divisions);

Position(:,2,:) = previousPosition;
Energy(:,2,:) = Inf;

Energy(oldPreviousPosition, 2, :) = 0;

% SECOND DPA LOOP %
for col = 3 : contourLength
    %col minus 1
    clmo = col - 1;
    for row = 1 : divisions
        % two row
        trow = row * 2;
        int = 0.5 * intensities(row , col);
        for future = 1 : divisions          
            e = Inf; 
            %future minus trow
            fmtrow = future - trow;
            for i = 1 : divisions
                u1a = fmtrow + i; 
                u2a = future - i;
                %Note 0.5 is magic number for lambda
                this_s = Energy(i, clmo, row) + 0.5 * ((u1a * u1a) / (u2a * u2a + 4)) + int;
                if this_s < e
                    p = i;
                    e = this_s;
                end
            end
            Position(row, col, future) = p;
            Energy(row, col, future) = e;
        end
    end
end

startPosition = previousPosition;

 % Backtrack
finalContour = zeros(contourLength, 2);
for i =  contourLength : -1 : 1
    finalContour(i, 1) = vertices(currentPosition, i, 1);
    finalContour(i, 2) = vertices(currentPosition, i, 2);
    
    temp = currentPosition;    
    currentPosition = Position(currentPosition, i, previousPosition);
    previousPosition = temp;
end

%Join ends
finalContour(contourLength + 1, 1) = vertices(startPosition, 1, 1);
finalContour(contourLength + 1, 2) = vertices(startPosition, 1, 2);

plot(finalContour(:,1), finalContour(:,2), 'g-', 'LineWidth', 2)

%plot(finalContour(1,1), finalContour(1,2), 'b-+', 'LineWidth', 2)
%plot(finalContour(contourLength,1), finalContour(contourLength,2), 'y-+', 'LineWidth', 2)

toc % Stop Timer