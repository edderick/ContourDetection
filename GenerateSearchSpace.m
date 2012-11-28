function [vertices, intensities] = GenerateSearchSpace(n, im, contour1, contour2)

vertices = zeros(n, length(contour1(:, 1)), 2);
intensities = zeros(n, length(contour1(:, 1)));

% Iterate through arrays calculating and plotting mid-points
for i = 1 : length(contour1(:, 1))
    dx = contour2(i,1) - contour1(i,1);
    dy = contour2(i,2) - contour1(i,2);
    
    for j = 1 : n
        x = contour1(i, 1) + j * (dx / (n + 1));
        y = contour1(i, 2) + j * (dy / (n + 1));
        
        vertices(j, i, 1) = x;
        vertices(j, i, 2) = y;
       
        intensities(j, i) = BasicSample(im, x, y);

    end
    
end

end