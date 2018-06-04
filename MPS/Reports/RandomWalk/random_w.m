%random walk in 2D
clear all;
close all;
%number of steps
N = 5000;
%beginning point 
x(1) = 0 ;
y(1) = 0;

for i = 1:N
    
	theta = 2*pi*rand();
	r=1;
    %random movement
	dx = r*cos(theta);
	dy = r*sin(theta);

	x(i+1) = x(i) + dx;
	y(i+1) = y(i) + dy;

end

plot(x,y,'b-');