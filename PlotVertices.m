function PlotVertices(vertices)

    for i = 1 : length(vertices(:,1,1))
        for j = 1 : length(vertices(1, :, 1))
            x = vertices(i, j, 1);
            y = vertices(i, j, 2);
            plot(x, y, 'g+-', 'LineWidth', 2)
        end
    end