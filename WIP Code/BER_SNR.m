function [BER, SNR] = BER_SNR(EbNo,r,k,M,messageLength,encoder, decoder,errorRate)

%This function calculates the Bit Error Rate of each message evaluated at a
%certain Eb/No ratio, using certain BCH values and M-QAM Modulation scheme

errorStats = zeros(3,1);
BER = zeros(1,length(EbNo));

%For constelattion plots
noisyComponents = [];


for i = 1:length(EbNo)
    
    SNR = EbNo(i) + 10*log10(r) + 10*log10(log2(M));      %signal to noise ratio
    errorStats = zeros(3,1);
    
    
    while errorStats(3) < messageLength
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%TRANSMITER%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Generate random binary message
      
        msgTx = randi([0 1], k*log2(M)*length(EbNo), 1);
        
             
        % BCH encoding
        % This function implements a BCH(n,k) forward error-correction
        % code capable of correcting t < 2^(m-1) errors 

        encodedTx = encoder(msgTx);                 %encode message
        
              
        %M-QAM Modulation
        
        modulatedTx = qammod(encodedTx, M, 'UnitAveragePower', true,  'InputType', 'bit');
 
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%RayleighChannel%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        %Introduce AWGN -Noise
        [noisyRx] = rayleighChannel(modulatedTx, SNR);
        noisyComponents = [noisyComponents; noisyRx];
        
        % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%RECEIVER%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        %M-QAM Demodulation
        
        demodulatedRx = qamdemod(noisyRx, M, 'UnitAveragePower', true,  'OutputType', 'bit');
        
        %Decode message
        %This function decodes the message by correcring the errors introduced
        % in the channel
        msgRx= decoder(demodulatedRx);
        
        
        %Confirm if codeword is decoded correctly
        
        %isCorrect = isequal(msgTx, msgTx);
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

%%%%%%%%%%%%Plots 
%BER and Eb/No
semilogy(EbNo,BER, 'bp-')
xlabel('Eb/No(dB)')
ylabel('BER')
title('Performance of BCH(n,k), M-QAM Codec')

%Constellations
constellaton = scatterplot(noisyComponents,1,0,'k.');
title('BCH(n,k) M-QAM Constellation');
grid on
hold on;
scatterplot(modulatedTx,1,0,'rp',constellaton); 

end