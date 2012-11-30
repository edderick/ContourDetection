function PlotContour(contour, lineType)
%PLOTCONTOUR Plots a contour to the current figure.
%   Plots a contour as a line to the current figure. See plot for more
%   about the line type string.

hold on % Plot to same figure...
plot(contour(:,1), contour(:,2), lineType, 'LineWidth', 2)
end