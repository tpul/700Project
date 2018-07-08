function [dist] = distance(xBS,yBS,xT,yT)

%Uplink
dist = size(numel(xT),numel(xT));

%Use loop to find the distance from each transmitter to BS
for i = 1:numel(xBS)
    for j = 1:numel(xT)
        dist(i,j) = pdist([xBS(i),yBS(i);xT(j),yT(j)],'euclidean');
        %         Ds = sprintf('Distance from BS %c to Mobile %d is %.2f km', char(i+64), j, S(i,j));
        %         disp(Ds);
    end
end

