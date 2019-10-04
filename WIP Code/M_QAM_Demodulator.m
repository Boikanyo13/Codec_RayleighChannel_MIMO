function [demodulatedMSG] = M_QAM_Demodulator(msgRx, M)
%This function demodulates the received code word using
%quadrature amplitude modulation of order M


demodulatedMSG = qamdemod(msgRx, M, 'UnitAveragePower', true,  'OutputType', 'bit');



end