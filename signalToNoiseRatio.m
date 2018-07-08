function [SIR] = signalToNoiseRatio(gain)
%This function takes input gain and Calculates the Signal to Noise ratio 
%for each Tx to each BS

[r,c] = size(gain);
SIR = [r,c];

for i = 1:r
    for j = 1:c
        g = sum(gain(i,:)) - gain(i,j);
        SIR(i,j) = 10*log10((gain(i,j)/g)^4);
    end
end

end

