function [msgTx] = GenerateMSG(numWords, k)

% Boikanyo Radiokana 1386807
% ELEN4011 - 2019


%This function generates a random binary message that needs to be 
%transmitted

% k --> Message Length
% numWords --> Number of words

msgTx = gf(randi([0 1], numWords, k));

end