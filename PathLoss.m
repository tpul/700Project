function [gain] = PathLoss(distances)
%Calculate the gain(path loss) of each Tx to each BS
gain = [r,c];
for i = 1:r
    for j = 1:c
        gain(i,j) = (1/(distances(i,j)^4));
    end
end

SIR = [r,c];
Pairs = NaN(r,c);