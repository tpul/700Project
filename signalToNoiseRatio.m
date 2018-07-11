function [SIR] = signalToNoiseRatio(desSigRecPow)
%This function takes input gain and Calculates the Signal to Noise ratio 
%for each Tx to each BS

[r,c] = size(desSigRecPow);
SIR = [r,c];

for i = 1:r
    for j = 1:c
        interSigRecPow = sum(desSigRecPow(i,:)) - desSigRecPow(i,j);
        SIR(i,j) = (10*log10((desSigRecPow(i,j)/interSigRecPow)^4));
    end
end

end

