function PlotVertices(vertices)
%PLOTVERTICES Plots a matrix of vertices.
%   Plots a matrix of vertices to the current figure. The input matrix
%   should be for the form model_space_x, model_space_y, image_space_axis.
%   Where x is 1 and y is 2 for the image_space_axes.

    for i = 1 : length(vertices(:,1,1))
        for j = 1 : length(vertices(1, :, 1))
            x = vertices(i, j, 1);
            y = vertices(i, j, 2);
            hold on
            plot(x, y, 'g+-', 'LineWidth', 2)
        end
    end