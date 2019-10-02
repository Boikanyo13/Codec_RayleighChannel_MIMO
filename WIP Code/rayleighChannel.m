function [noisyMSG] = rayleighChannel(encodedMSG,n,t )

%This function models a rayleigh fading channel and the
% effects it will have on the transmitted signal


%Introduce errors in the code word

noisyMSG = encodedMSG + randerr(1, n,1:t);


end