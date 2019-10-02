% Boikanyo Radiokana 1386807
% ELEN4011 - 2019

% This script is responsible for running the entire codec, from
% transmission to the receiver end

%Generate Message
clc

numWords = 1;
msglen = 5;
msgTx = GenerateMSG(numWords,msglen)

% BCH encoding
n = 63;
k = 45;
[t] = BCHEncoder(msgTx, n,k);