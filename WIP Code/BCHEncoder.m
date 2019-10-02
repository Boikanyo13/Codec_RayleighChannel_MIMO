function [t] = BCHEncoder(msgTx,n,k)

% This function implements a BCH(n,k) forward error-correction
% code capable of correcting t < 2^(m-1) errors 

% Parameters 
% k - Message Length before encoding
% n - length of code word after encoding
% parity - number of parity bits (n-k)

%Error correcting capability

t = bchnumerr(n,k);



end