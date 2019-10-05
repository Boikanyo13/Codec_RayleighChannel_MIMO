function [BER, SNR] = BER_SNR(EbNo,r,k,M,messageLength,encoder, decoder,errorRate)


errorStats = zeros(3,1);
BER = zeros(1,length(EbNo));

for i = 1:length(EbNo)
    
    SNR = EbNo(i) + 10*log10(r) + 10*log10(log2(M));      %signal to noise ratio
    errorStats = zeros(3,1);
    
    while errorStats(3) < messageLength
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%TRANSMITER%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Generate random binary message
        
        msgTx = GenerateMSG(k,M);
             
        % BCH encoding
        
        [encodedMSG] = BCHEncoder_(encoder, msgTx);
              
        %M-QAM Modulation
        
        [modulatedMSG] = M_QAM(encodedMSG, M);
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%RayleighChannel%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        %Introduce AWGN -Noise
        [noisyMSG] = rayleighChannel(modulatedMSG, SNR);
        
        % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%RECEIVER%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        %M-QAM Demodulation
        
        [demodulatedMSG] = M_QAM_Demodulator(noisyMSG, M);
        
        %Decode message
        
        msgRx= BCHDecoder(decoder, demodulatedMSG);
        
        %Confirm if codeword is decoded correctly
        
%         isCorrect = isequal(msgTx, msgTx);
        errorStats = errorRate(msgRx,msgTx );
        
    end
    
    %Generate error stats to compare the transmitted msg to the received msgs
        %The ErrorRate object returns 3 values
        %1--> bit error rate
        %2-->total error count
        %3-->total number of bits
        
        
        BER(i) = errorStats(1);
        
        reset(errorRate);
end

semilogy(EbNo,BER, 'bp-')

s = scatterplot(modulatedMSG,1,0,'r*'); 
hold on;
scatterplot(noisyMSG,1,0,'bp',s)
title('M-QAM Constellation');
grid on
end