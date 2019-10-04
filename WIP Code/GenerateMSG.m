function [msgTx] = GenerateMSG(k, M)

%This function generates a random binary message that needs to be 
%transmitted

% msglen --> Message Length
% numWords --> Number of words

msgTx = randi([0 1], k*log2(M), 1);

end