function [modulatedMSG] = M_QAM(codeWord, M)
%This function modulates the code word using
%quadrature amplitude modulation of order M

modulatedMSG = qammod(codeWord, M, 'UnitAveragePower', true,  'InputType', 'bit');

scatterplot(modulatedMSG,1,0,'r*');

end