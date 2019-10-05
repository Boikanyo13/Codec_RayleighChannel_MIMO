function [decodedMSG]= BCHDecoder(decoder, noisyMSG)

%This function decodes the message by correcring the errors introduced
% in the channel


decodedMSG = decoder(noisyMSG); 

end