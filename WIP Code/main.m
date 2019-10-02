% Boikanyo Radiokana 1386807
% ELEN4011 - 2019

% This script is responsible for running the entire codec, from
% transmission to the receiver end

%Generate Message
clc
clear all

numWords = 1;
msglen = 4;
msgTx = GenerateMSG(numWords,msglen)

% BCH encoding
n = 7;
k = 4;
[t, encodedMSG] = BCHEncoder(msgTx, n,k)

%Channel - Introduce Error

noisyMSG = rayleighChannel(encodedMSG,n,t)

