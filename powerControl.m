function [pairs] = powerControl(matrixOfPairs, numberOfBS,numberOfMobiles)
%powerControl function takes two inputs, a matrix of Tx allocated to BS
%and the number of BS respectively. The purpose of this function is to
%balance the powers between all Tx with respect to median number.

%retrieves the median number in the matrix
% m = round(median(matrixOfPairs(:),'omitnan'));

midRangeValue = round((max(matrixOfPairs(:))+ min(matrixOfPairs(:)))/2);

%get the size of matrix
[r,c] = size(matrixOfPairs);

%intiate the counter variable to 1
count = 0;

%Use a while loop to make sure that the cycle does not end until all Tx 
%values have been equalized
while ((count < numberOfBS) && (count < numberOfMobiles))  
    for i = 1:r
        for j = 1:c
            if(~isnan(matrixOfPairs(i,j)))
                if(matrixOfPairs(i,j) > midRangeValue)
                    matrixOfPairs(i,j) = matrixOfPairs(i,j) - 1;
                    if (matrixOfPairs(i,j) == midRangeValue)
                        count = count + 1;
                    end
                elseif (matrixOfPairs(i,j) < midRangeValue)
                    matrixOfPairs(i,j) = matrixOfPairs(i,j) + 1;
                    if (matrixOfPairs(i,j) == midRangeValue)
                        count = count + 1;
                    end
                end
            end
        end
    end  
end
pairs = matrixOfPairs;
end

