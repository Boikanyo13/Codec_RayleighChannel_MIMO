% Boikanyo Radiokana 1386807
% ELEN4011 - 2019

% This script is responsible for running the entire codec, from
% transmission to the receiver end

clc
clear all
close all


%%%%%%%%%%%%%%%%%%%%%%%%%%%TRANSMITER%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Generate random binary message

numWords = 1;   %number of words
M = 16;         %Modulation order
k = 4;          %message length (length of words)
msgTx = GenerateMSG(k,M)


% BCH encoding

m = 3;
n = 2^(m)-1;    %codeword length
r = k/n;        %code rate
[t, encodedMSG] = BCHEncoder_(msgTx, n,k);


%M-QAM Modulation

[modulatedMSG] = M_QAM(encodedMSG, M);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%RayleighChannel%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

EbNo = 10;              %ratio of bit energy to noise power spectral density
SNR = EbNo + 10*log10(r) + 10*log10(log2(M));

%Introduce AWGN -Noise
[noisyMSG] = rayleighChannel(modulatedMSG, SNR )

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%RECEIVER%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%M-QAM Demodulation

[demodulatedMSG] = M_QAM_Demodulator(modulatedMSG, M);

%Decode message

msgRx= BCHDecoder(demodulatedMSG, n,k);

%Confirm if codeword is decoded correctly

isCorrect = isequal(msgTx, msgTx);


