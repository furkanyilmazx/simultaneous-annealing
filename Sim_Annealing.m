clear all; clc; close all;

T = 0.005;                                  % Ad�m 1
N = 5;                                      % Ad�m 2
xi = 0.009;                                 % Ad�m 2
fxi = fonk(xi);                             % Ad�m 2
fMin = fxi;                                 % Ad�m 6
xMin = xi;                                  % Ad�m 6
zaman = 0:0.01:5;
count = 0;
for T = 1:-0.05:0.005;                      % Ad�m 7
    for i = 0:0.01:N                        % Ad�m 5
        count = count + 1;
        xi1 = xi + xi * rand(1);            % Ad�m 3
        fxi1 = fonk(xi1);                   % Ad�m 3
        if fxi1 < fxi                       % Ad�m 4
            xi = xi1;                       % Ad�m 4
            fxi = fxi1;                     % Ad�m 4
        else
            w = exp(-(fxi1-fxi)/T);         % Ad�m 4a
            r = rand(1);                    % Ad�m 4b
            if w > r                        % Ad�m 4c
                xi = xi1;                   % Ad�m 4c
                fxi = fxi1;                 % Ad�m 4c
            end
        end
        if fMin > fxi;                      % Ad�m 6
            fMin = fxi;                     % Ad�m 6
            xMin = xi;                      % Ad�m 6
        end
        plot(i,fxi,i,fxi1,'-');             %Grafikleri �izdir
        hold on;
        
    end
    xi = xMin;                              % Ad�m 8   
end                                         % Ad�m 9
plot(zaman,fonk(zaman),xMin,fMin,'r+');     %grafikleri �izdir
hold on;