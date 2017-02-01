%% Ploting trajectory based on R
% 
outfile=fopen('subject_output_refined.txt');
s=textscan(outfile,' %f %f %f %f %f %f %d %d %d %d %d %d');
fclose(outfile);
x=s{1};
y=s{2};
z=s{3};
% u=s{4};
% v=s{5};
% w=s{6};

outfile=fopen('sat_close_approach_refined_29110.txt');
s=textscan(outfile,'%f %f %f %f %d %d %d %d %d %d %d');
fclose(outfile);
x1=s{2};
y1=s{3};
z1=s{4};


close all
set(gcf,'Menubar','default','Name','Orbit Visualization', ... 
    'NumberTitle','off','Position',[10,350,750,750], ... 
    'Color',[0.38 0.26 0.67]); 
lim=(1+ecc)*a;%Setting the limits of the graph
clf
axis([-lim, lim, -lim, lim, -lim, lim])	
view(150,15) 
axis equal
shg
hold on
grid on
title('Orbital Visualization');

equat_rad=6378.13700;
    polar_rad=6356.7523142;
    [xx, yy, zz]=ellipsoid (0,0,0,equat_rad, equat_rad, polar_rad);
    load('topo.mat','topo','topomap1');
    topo2 = [topo(:,181:360) topo(:,1:180)];
    pro.FaceColor= 'texture';
    pro.EdgeColor = 'none';
    pro.FaceLighting = 'phong';
    pro.Cdata = topo2;
   earth= surface(xx,yy,zz,pro);
    colormap(topomap1)

    x0=0;
    y0=0;
    z0=0;
    
    x1_0=0;
    y1_0=0;
    z1_0=0;
    
    for k=1:length(x)
     line([x0 x(k)],[y0 y(k)],[z0 z(k)]);
     x0=x(k);
     y0=y(k);
     z0=z(k);
     
     line([x1_0 x1(k)],[y1_0 y1(k)],[z1_0 z1(k)],'Color','r');
     x1_0=x1(k);
     y1_0=y1(k);
     z1_0=z1(k);
     
     pause (0.01);
    end

