function [] = BER_SNRPlot(EbNo,BER,n,k,M)

%This function plots the BER and Eb/No at different M-QAM Modulation
%schemes

figure
semilogy(EbNo,BER, 'bp-')
xlabel('Eb/No(dB)')
ylabel('BER')
n_ = int2str(n);
k_ = int2str(k);
M_ = int2str(M);

title_ = strcat('Performance of BCH(',n_,',', k_,'),  ',M_, '-QAM Codec' );
title(title_);



end