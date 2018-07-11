function [balancedSIR] = powerControlTwo(gain, pair, desSigRecPow)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[r,c] = size(gain);

pairDiff = sum(diff(sort(pair(~isnan(pair))')));
newPairDiff = 0;
count = 0;

[max_num,max_num_ind] = max(gain(:));
[X,Y] = ind2sub(size(gain),max_num_ind);

while ( newPairDiff < pairDiff)
    for i = 1:r
        for j = 1:c
            if i == X && j == Y
                gain(i,j) = gain(i,j) - (gain(i,j)/4);
            elseif j == Y
                gain(i,j) = gain(i,j) - (gain(i,j)/4);
            end
        end
    end
    newSIR = signalToNoiseRatio(gain);
    balancedPair = pairUp(newSIR);
    newPairDiff = sum(diff(sort(balancedPair(~isnan(balancedPair))')));
    if newPairDiff <= pairDiff
        pairDiff = newPairDiff;
        newPairDiff = 0;
        balancedSIR = balancedPair;
        count = count + 1;
    elseif count == 0
        balancedSIR = pair;
    end
end

end

