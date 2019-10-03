function [msgTx] = GenerateMSG(numWords, msglen)

%This function generates a random binary message that needs to be 
%transmitted

% msglen --> Message Length
% numWords --> Number of words

msgTx = randi([0 1], numWords, msglen);

end