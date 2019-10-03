% Boikanyo Radiokana 1386807
% ELEN4011 - 2019

% This script is responsible for running the entire codec, from
% transmission to the receiver end

clc
clear all


%%%%%%%%%%%%%%%%%%%%%%%%%%%TRANSMITER%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Generate random binary message

numWords = 1;   %number of words
msglen = 4;     %lenth of words
msgTx = GenerateMSG(numWords,msglen)


% BCH encoding

m = 3;
n = 2^(m)-1;    %codeword length
k = 4;          %message length
[t, encodedMSG] = BCHEncoder_(msgTx, n,k);

 
% Channel - Introduce Error

noisyMSG = rayleighChannel(encodedMSG,n,t)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%RECEIVER%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Decode message

decodedMSG= BCHDecoder(noisyMSG, n,k);

% Confirm if codeword is decoded correctly

decodedMSG = decodedMSG.';
isCorrect = isequal(msgTx, decodedMSG)


