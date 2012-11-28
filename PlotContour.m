function PlotContour(contour, lineType)

% Plot contour 1
hold on % Plot to same figure...
plot(contour(:,1), contour(:,2), lineType, 'LineWidth', 2)

end