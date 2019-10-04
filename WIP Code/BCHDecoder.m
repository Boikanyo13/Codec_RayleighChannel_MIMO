function [decodedMSG]= BCHDecoder(noisyMSG, n,k)

%This function decodes the message by correcring the errors introduced
% in the channel

genpoly = bchgenpoly(n,k);                  %generator polynomial

%Decode message

decoder = comm.BCHDecoder(n,k,genpoly);      %BCH Object
decodedMSG = decoder(noisyMSG); 

end