function [msgTx] = GenerateMSG(numWords, k)

clc
%This function generates a random binary message that needs to be 
%transmitted

% k --> Message Length
% numWords --> Number of words

msgTx = gf(randi([0 1], numWords, k));

end