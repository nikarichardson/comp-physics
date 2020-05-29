% Random I 
% visualizes 1,000 2D random walkers starting at same bar @ same t 
% (Prof's Refactored Code) 
close all; clear; clc;
set(gcf, 'Position', get(0, 'Screensize'));

% setup variables 
num_walkers = 1000; 
nmax = 100;                       % number of attempts 
m_grid = 600;                     % grid points 
dx = 300;                         % starting x coordinate of grid
dy = 300;                         % starting y coordinate of grid
n_steps = 2;                      % steps for time intervals 
m_time = 301;                     % number of steps to display
p = zeros( m_grid );              % record for positions visited
p(dx,dy) = 1;                     % location occupied/visited by walker
xp = zeros(1000,1);               % record in sequence of points visited for x
yp = xp;                          % and y
xp(1) = dx;
yp(1) = dy;
p1 = zeros(m_time,1);             % stores distance^2 traveled
p2 = p1;                          % stores sum of distance^2 traveled of all runs
x = 0 : m_time-1;
x = x';
n_completed = 0;

title(['2D Random Walkers'],'Fontsize',20) 
hold on;
w = 0; 
for i = 1:num_walkers;
    for k = 1: nmax;                     
        dx = 300;                         % starting x-coordinate
        dy = 300;                         % starting y-coordinate
        p = zeros( m_grid );              % record for positions visited
        p( dx , dy ) = 1;                 % location occupied/visited by walker
        xp = zeros( 1000 , 1 );           % record in time of points visited for x
        yp = xp;                          % and y
        kt = 1;                           % counter for attempted steps
        stuck = 0;                        % boolean variable: is random walk stuck?
        for j = 2 : m_time;               % rounds the elements of X to the nearest integers.
            s = round( 4*rand( n_steps , 1 ) -.5 ); % takes n_steps steps in each t interval
            for n = 1:n_steps;
                xp(kt) = dx;          % saving sequence of x and y coordinates
                yp(kt) = dy;
                kt = kt+1;
                switch s( n )
                    case 0
                        if p( dx+1 , dy ) == 0
                            dx = dx+1;
                            p( dx , dy ) = 1;
                        end;
                    case 1
                        if p( dx-1 , dy ) == 0
                            dx = dx-1;
                            p( dx , dy ) = 1;
                        end;
                    case 2
                        if p( dx , dy+1 ) == 0
                            dy = dy+1;
                            p( dx , dy ) = 1;
                        end;
                    case 3
                        if p( dx , dy-1 ) == 0
                            dy = dy-1;
                            p( dx , dy ) = 1;
                        end;
                end;
            end;
            p1( j ) = ( dx-300 )^2 + ( dy-300 )^2;    % square of total distance traveled
            if p( dx+1 , dy )* p( dx-1 , dy )* p( dx , dy+1 )* p( dx , dy-1 ) ~= 0;
                stuck = 1;
                break;
            end;
        end;
        if stuck  == 0;
            w = w + 1; 
            n_completed = n_completed + 1 ;
            % we only plot one successful attempt for each RW 
            if n_completed ~= 1; 
                c = rand(1,3);
                p(1) = plot(xp(1:kt-1),yp(1:kt-1),'.-','color',c); 
                p(2) = plot(xp(1:1),yp(1:1),'color',c);
                hold on;
        
                grid on;
                pause(.01);
                for j = 1:m_time;
                    p2(j) = p2(j)+p1(j); % distance squared summed over completed runs
                end;
                hold on; 
            end 
        end;
    end; 
end;  
hold off; 
xlim([190 410])