function [pair] = pairUp(SIR)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[r,c] = size(SIR);
pair = NaN(r,c);

for i = 1:r
    [max_num,max_num_ind] = max(SIR(:));
    [X,Y] = ind2sub(size(SIR),max_num_ind);
    if(~isnan(max_num))
        pair(X,Y) = (max_num);
%         pair = sprintf('\nMobile %d connects BS %c',Y,char(X+64));
%         disp(pair);
        SIR(X,:) = NaN; SIR(:,Y) = NaN;
    end
end

end

