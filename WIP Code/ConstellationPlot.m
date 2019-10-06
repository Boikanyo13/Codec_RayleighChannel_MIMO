function [] = ConstellationPlot(noisyComponents,modulatedTx)

%This function plots the constellations for different M-QAM modulation
%schemes


constellaton = scatterplot(noisyComponents,1,0,'k.');
title('BCH(n,k) M-QAM Constellation');
grid on
hold on;
scatterplot(modulatedTx,1,0,'rp',constellaton);



end