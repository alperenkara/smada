
%%
function [finalPosition] = random_walk(Nsteps,mua)
%% Monte Carlo Photon Random Walk in 3 Dimensions
% Nsteps = number of photon reflections within media mua = absorption coefficient. 
% 1/mua determines step size

% Example Initial Parameters
%  Nsteps = 1000; % number of iterations/steps in walk 
%  mua = 10; % absorption of media

% possible step size for photon
ds = 1/mua;
%% Angle Ranges

XYa = 2*pi; % 0 to 360 degrees
Za = pi/2; % 0 to 90 degrees
%% Iterate Positions

% initialize start at origin
theta = 0;phi = 0;
Xvec = zeros(1,Nsteps+1); 
Yvec = zeros(1,Nsteps+1); 
Zvec = zeros(1,Nsteps+1);

iPos = [Xvec(1) Yvec(1) Zvec(1)];

tic;
for i = 1:Nsteps
    
    dr = ds*rand(); % step length
    dr = exp(-mua*dr); % actual length (probability)
    
%   switch phi parameter for controlling photon direction (+/- Z-AXIS)
    theta = ((2*XYa)*rand() - XYa); % angle in x/y plane
    phi = (2*Za*rand() - Za); % have +/- Z axis (elevation angle) 
%     phi = (Za)*rand(); % just going in + Z axis direction

    theta = theta + theta;

    [X Y Z] = sph2cart(theta,phi,dr);
    Xvec(1,i+1) = Xvec(1,i) + X;; 
    Yvec(1,i+1) = Yvec(1,i) + Y;
    Zvec(1,i+1) = Zvec(1,i) + Z;
end 
elapsedTime = toc;
finalPosition = [Xvec(end) Yvec(end) Zvec(end)];

Dtravel = sqrt(Xvec(end)^2+Yvec(end)^2+Zvec(end)^2); % length Magnitude of final position 
                                     % with respect to origin 
                                     
fprintf('Total Distance from Origin: %3.3f \n',Dtravel);
%% MAX/MIN positions for plot viewing

xMax = max(Xvec);xMin = min(Xvec); 
yMax = max(Yvec);yMin = min(Yvec); 
zMax = max(Zvec);zMin = min(Zvec); 

if abs(xMin) > xMax 
    xlim = abs(xMin); 
else 
    xlim = xMax; 
end 
if abs(yMin) > xMax 
    ylim = abs(yMin); 
else 
    ylim = yMax; 
end 
if abs(zMin) > zMax 
    zlim = abs(zMin); 
else 
    zlim = zMax; 
end 

xlim = xlim+1;ylim = ylim+1;zlim = zlim+1;
Xo = 0;Yo = 0;Zo = 0;
Xf = Xvec(end);Yf = Yvec(end);Zf = Zvec(end); 
% Plotting (Line 3-D Plot)
figure(1)
plot3(Xo,Yo,Zo,'ro'); % marks origin
hold on
plot3(Xo,Yo,Zo,'r*'); % marks origin
% hold on
plot3(Xvec,Yvec,Zvec,'b.-') % plots path
axis([-xlim xlim -ylim ylim -zlim zlim]);
% hold on 
plot3(Xvec(end),Yvec(end),Zvec(end),'ro');  % marks final position
hold on
xlabel('X AXIS'); 
ylabel('Y AXIS'); 
zlabel('Z AXIS'); 


end