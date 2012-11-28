SetUp

limit = 100;
step = 2;

timing = zeros(limit, 1);

figure(2)
axis square

for i = 1:limit
    divisions = i * step
    
    tic
    contour = SimpleDPA(divisions, im, contour1, contour2);
    timing(i) = toc
    
    hold on
    plot(divisions , timing(i), 'g+-', 'LineWidth', 2)
    
end

%PlotContour(contour, 'g-');

