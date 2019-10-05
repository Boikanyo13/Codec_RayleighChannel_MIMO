function [ encodedMSG] = BCHEncoder_(encoder,msgTx)

% This function implements a BCH(n,k) forward error-correction
% code capable of correcting t < 2^(m-1) errors 


encodedMSG = encoder(msgTx);                 %encode message


end