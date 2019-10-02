function [decodedMSG]= BCHDecoder(noisyMSG, n,k)

%This function decodes the message by correcring the errors introduced
% in the channel

decodedMSG = bchdec(noisyMSG, n, k ,'beginning')


end