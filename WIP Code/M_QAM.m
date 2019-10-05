function [modulatedMSG] = M_QAM(codeWord, M)
%This function modulates the code word using
%quadrature amplitude modulation of order M

modulatedMSG = qammod(codeWord, M, 'UnitAveragePower', true,  'InputType', 'bit');

%Plot constellation

% scatterplot(modulatedMSG,1,0,'r*');         
% title('M-QAM Constellation');
% grid on;
% ax = gca;                        % gets the current axes
% ax.XAxisLocation = 'origin';     % sets them to zero
% ax.YAxisLocation = 'origin';     % sets them to zero
% ax.Box = 'off';
end