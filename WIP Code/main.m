% Boikanyo Radiokana 1386807
% ELEN4011 - 2019

% This script is responsible for running the entire codec, from
% transmission to the receiver end

clc
clear all
close all

messageLength = 12000;       %number of words
EbNo = 0:30;                 %ratio of bit energy to noise power spectral density
M = 16;                      %Modulation order
k = 4;                       %message length (length of words)
m = 3;
n = 2^(m)-1;                 %codeword length
r = k/n;                     %code rate

genpoly = bchgenpoly(n,k);                  %generator polynomial

%BCH Encoder Object
encoder = comm.BCHEncoder(n,k,genpoly);      
%BCH Decoder Object
decoder = comm.BCHDecoder(n,k,genpoly);      
%Error stats
errorRate = comm.ErrorRate;                  %ErrorRate object

BER = BER_SNR(EbNo,r,k,M, messageLength, encoder, decoder, errorRate);



