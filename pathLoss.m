function [desSigRecPow,powerTransmitted] = pathLoss(distances)
%Calculate the gain(path loss) of each Tx to each BS

[r,c] = size(distances);
gain = [r,c];
powerTransmitted = [r,c];
desSigRecPow = [r,c];

for i = 1:r
    for j = 1:c
        gain(i,j) = (1/(distances(i,j)^4));
        powerTransmitted(i,j) = (5*rand(1));
        desSigRecPow(i,j) = gain(i,j)*powerTransmitted(i,j);
    end
end


