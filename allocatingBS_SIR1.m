Area = 10; % area defined as 10x10 grid
noOfMobiles = 2;
threshold = 15;

% Generate fixed x and y positions for base stations
xBS = [8 2];
yBS = [3 8];

% Generate random x and y position of transmitters
xT = Area*rand(1,noOfMobiles);
yT = Area*rand(1,noOfMobiles);

plot(xT,yT,'.',xBS,yBS,'rs','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',8);
grid on
hold off
axis([0 Area 0 Area])
xlabel('Distance (km)');
ylabel('Distance (km)');

% %label formatting for transmitter coordinates
% xoffset = -.5;
% yoffset = -.3;
% fsize = 8;
% temp_str = mat2cell(num2str([xT(:) yT(:)], '(%.2f,%.1f)'), ones(1,noOfMobiles));
% text(xT+xoffset, yT+yoffset, temp_str,'fontsize', fsize)

%label formatting for BS
A = [1:numel(xBS)]';
dx = -.1; dy = .4;
text(xBS+dx, yBS+dy, char(A+64));

%label formatting for transmitters
a = [1:noOfMobiles]'; b = num2str(a); c = cellstr(b);
dX = -.1; dY = .3;
text(xT+dX, yT+dY, c);

%Uplink
%Use loop to find the distance from each transmitter to BS
distances = size(numel(xT),numel(xT));
for i = 1:numel(xBS)
    for j = 1:numel(xT)
        distances(i,j) = pdist([xBS(i),yBS(i);xT(j),yT(j)],'euclidean');
        %         Ds = sprintf('Distance from BS %c to Mobile %d is %.2f km', char(i+64), j, S(i,j));
        %         disp(Ds);
    end
end

%Calculate pathloss of each Tx to each BS
gain = pathLoss(distances);
[r,c] = size(gain);

%This condition decides which mobile gets to connect to the BS, if there
%was only one BS in the area
if(r == 1)
    [M,I] = min(distances,[],2);
    pair = sprintf('\nMobile %d connects BS A', I);
    disp(pair);
    %This condition decides which BS the mobile should connect to, if there was
    %only one mobile operating in the area
elseif(c == 1)
    [M,I] = min(distances,[],1);
    pair = sprintf('\nMobile 1 connects BS %c', char(I+64));
    disp(pair);
else
    SIR = signalToNoiseRatio(gain);

    pair = pairUp(SIR);
    disp(pair);
    
%     A = powerControl(Pairs, numel(xBS),noOfMobiles);
%     disp(A);
    
end


