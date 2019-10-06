% Boikanyo Radiokana 1386807
% ELEN4011 - 2019

% This script is responsible for running the entire codec, from
% transmission to the receiver end

clc
clear all
close all

EbNo = 0:30;           %ratio of bit energy to noise power spectral density

%==========================================================================
%BCH()-----16_QAM

messageLength1 = 20250;       %number of words
M = 16;                       %Modulation order
k = 45;                        %message length (length of words)
m = 6;
n = 2^(m)-1;                   %codeword length
r = k/n;                      %code rate

genpoly = bchgenpoly(n,k);    %generator polynomial

%BCH Encoder Object
encoder1 = comm.BCHEncoder(n,k,genpoly);
%BCH Decoder Object
decoder1 = comm.BCHDecoder(n,k,genpoly);
%Error stats
errorRate1 = comm.ErrorRate;   %ErrorRate object

BER = BER_SNR(EbNo,r,n,k,M, messageLength1, encoder1, decoder1, errorRate1);

%==========================================================================
%BCH()-----32_QAM

messageLength2 = 20250;       %number of words
M = 32;                      %Modulation order
k = 45;                       %message length (length of words)
m = 6;
n = 2^(m)-1;                 %codeword length
r = k/n;                     %code rate

genpoly2 = bchgenpoly(n,k);                  %generator polynomial

%BCH Encoder Object
encoder2 = comm.BCHEncoder(n,k,genpoly2);
%BCH Decoder Object
decoder2 = comm.BCHDecoder(n,k,genpoly2);
%Error stats
errorRate2 = comm.ErrorRate;                  %ErrorRate object

BER2 = BER_SNR(EbNo,r,n,k,M, messageLength2, encoder2, decoder2, errorRate2);

%==========================================================================
%BCH(63,45)-----64_QAM
messageLength3 = 20250;       %number of words
M = 64;                      %Modulation order
k = 45;                       %message length (length of words)
m = 6;
n = 2^(m)-1;                 %codeword length
r = k/n;                     %code rate

genpoly3 = bchgenpoly(n,k);                  %generator polynomial

%BCH Encoder Object
encoder3 = comm.BCHEncoder(n,k,genpoly3);
%BCH Decoder Object
decoder3 = comm.BCHDecoder(n,k,genpoly3);
%Error stats
errorRate3 = comm.ErrorRate;                  %ErrorRate object

BER3 = BER_SNR(EbNo,r,n,k,M, messageLength3, encoder3, decoder3, errorRate3);



