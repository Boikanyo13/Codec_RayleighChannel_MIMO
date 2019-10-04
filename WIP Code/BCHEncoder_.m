function [t, encodedMSG] = BCHEncoder_(msgTx,n,k)

% This function implements a BCH(n,k) forward error-correction
% code capable of correcting t < 2^(m-1) errors 

% Parameters 
% k - Message Length before encoding
% n - length of code word after encoding
% parity - number of parity bits (n-k)

t = bchnumerr(n,k);                         %Error correcting capability
genpoly = bchgenpoly(n,k);                  %generator polynomial

%Encode message

encoder = comm.BCHEncoder(n,k,genpoly);      %BCH Object
encodedMSG = encoder(msgTx);                 %encode message



end