clear all; clc; close all;

T = 0.005;                                  % Adým 1
N = 5;                                      % Adým 2
xi = 0.009;                                 % Adým 2
fxi = fonk(xi);                             % Adým 2
fMin = fxi;                                 % Adým 6
xMin = xi;                                  % Adým 6
zaman = 0:0.01:5;
count = 0;
for T = 1:-0.05:0.005;                      % Adým 7
    for i = 0:0.01:N                        % Adým 5
        count = count + 1;
        xi1 = xi + xi * rand(1);            % Adým 3
        fxi1 = fonk(xi1);                   % Adým 3
        if fxi1 < fxi                       % Adým 4
            xi = xi1;                       % Adým 4
            fxi = fxi1;                     % Adým 4
        else
            w = exp(-(fxi1-fxi)/T);         % Adým 4a
            r = rand(1);                    % Adým 4b
            if w > r                        % Adým 4c
                xi = xi1;                   % Adým 4c
                fxi = fxi1;                 % Adým 4c
            end
        end
        if fMin > fxi;                      % Adým 6
            fMin = fxi;                     % Adým 6
            xMin = xi;                      % Adým 6
        end
        plot(i,fxi,i,fxi1,'-');             %Grafikleri çizdir
        hold on;
        
    end
    xi = xMin;                              % Adým 8   
end                                         % Adým 9
plot(zaman,fonk(zaman),xMin,fMin,'r+');     %grafikleri çizdir
hold on;