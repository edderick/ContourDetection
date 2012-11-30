function ShowImage( Image )
%SHOWIMAGE Draws the image to figure one.
%   Draws a greyscale image to figure one. 

% Display the image
figure(1)
imagesc(Image)
colormap(gray)
axis square

end

