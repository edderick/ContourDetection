function [Vertices, Intensities] = GenerateSearchSpace(divisions, Image, Contour1, Contour2)
%GENERATESEARCHSPACE Generates a search space.
%   Using the paramaters provided, an matrix of intensities is produced that
%   represents the image. A matrix of vertices is also returned to allow
%   easy mapping back to image space.

Vertices = zeros(divisions, length(Contour1(:, 1)), 2);
Intensities = zeros(divisions, length(Contour1(:, 1)));

% Iterate through arrays calculating and plotting mid-points
for i = 1 : length(Contour1(:, 1))
    dx = Contour2(i,1) - Contour1(i,1);
    dy = Contour2(i,2) - Contour1(i,2);
    
    for j = 1 : divisions
        % Interpolate
        x = Contour1(i, 1) + j * (dx / (divisions + 1));
        y = Contour1(i, 2) + j * (dy / (divisions + 1));
        
        Vertices(j, i, 1) = x;
        Vertices(j, i, 2) = y;
        
        Intensities(j, i) = BasicSample(Image, x, y);
        
    end
end
end