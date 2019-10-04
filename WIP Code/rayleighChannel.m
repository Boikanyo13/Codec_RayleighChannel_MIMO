function [noisySIG] = rayleighChannel(modulatedMSG, SNR )

%This function models a rayleigh fading channel and the
% effects it will have on the transmitted signal

%introduce white gaussian noise

noisySIG = awgn(modulatedMSG, SNR);
%Plot constellation

scatterplot(noisySIG,1,0,'b*');         
title('M-QAM Constellation- AWGN');
grid on;
ax = gca;                        % gets the current axes
ax.XAxisLocation = 'origin';     % sets them to zero
ax.YAxisLocation = 'origin';     % sets them to zero


end