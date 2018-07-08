function [pair] = pairUp(SIR)

[r,c] = size(SIR);
pair = NaN(r,c);

for i = 1:r
    [max_num,max_num_ind] = max(SIR(:));
    [X,Y] = ind2sub(size(SIR),max_num_ind);
    if(~isnan(max_num))
        pair(X,Y) = round(max_num);
        SIR(X,:) = NaN; SIR(:,Y) = NaN;
    end
end

end

