
clear all; clc; close all

% Plots the boundary layer data on a sphere colour plot to easily visualise the flow for a given Reynolds number (Re)
% Note: As Re increases the width of the boundary layer decreases, so keep it reasonably low to get decent plots

BLfile = 'BL.mat';
load(BLfile); U = VelBL{1}; V = VelBL{2}; W = VelBL{3}; 

Re = 50; r = 1+eta/Re;
XA = repmat(sin(theta)',1,length(r)); YA = repmat(cos(theta)',1,length(r));
for i=1:length(r); XA(:,i) = r(i)*XA(:,i); YA(:,i) = r(i)*YA(:,i); end

figure(1); t1 = tiledlayout(1,3); 
%title(t1,'Boundary Layer Flow','interpreter','latex');

% plot U
h1(1) = nexttile(t1); hold on; set(gca,'Color','none'); x = 0:1e-3:1; area(x,sqrt(1-x.^2),'FaceColor','white')
fn = pcolor(XA,YA,U); fn.FaceColor = 'interp'; set(fn,'EdgeColor','none');
cb = colorbar('southoutside'); 
set(get(cb,'label'),'string','$U$','interpreter','latex', 'fontsize',11);

% plot V
h1(2) = nexttile(t1); hold on; set(gca,'Color','none'); area(x,sqrt(1-x.^2),'FaceColor','white')
fn = pcolor(XA,YA,V); fn.FaceColor = 'interp'; set(fn,'EdgeColor','none'); 
cb = colorbar('southoutside'); caxis([0 1]); set(cb, 'YTick', 0:0.2:1);
set(get(cb,'label'),'string','$V$','interpreter','latex', 'fontsize',11);

% plot W
h1(3) = nexttile(t1); hold on; set(gca,'Color','none'); area(x,sqrt(1-x.^2),'FaceColor','white')
fn = pcolor(XA,YA,W); fn.FaceColor = 'interp'; set(fn,'EdgeColor','none'); 
cb = colorbar('southoutside'); caxis([-0.9 1.6]); 
set(get(cb,'label'),'string','$\overline{W}$','interpreter','latex', 'fontsize',11);

% settings
set(h1,'Colormap', jet)
t1.TileSpacing = 'tight'; t1.Padding = 'tight'; 
set(gcf, 'Position',  [50, 150, 1450, 500])

% labelling
grey = [0.4 0.4 0.4]; ticks = [1 1+7.5/Re 1+15/Re 1+22.5/Re 1+30/Re]; 
for i=1:3
    nexttile(i); 
    % axis ticks
    set(gca,'Xtick',[]); 
    yticks(ticks); yticklabels({'0','7.5','15','22.5','30'}); 
    yh = ylabel('$\eta$','interpreter','latex', 'fontsize',11); 
    yh.Position(1)=-0.1; yh.Position(2)=1+15/Re; yh.Rotation=0;
    % grid
    plot([0 0], [0 ticks(end)], 'color', grey);
    plot([0 ticks(end)], [0 0], 'color', grey);
    for j=ticks
        x = 0:1e-3:j; plot(x,sqrt(j^2-x.^2),'color', grey)
    end
    for k=15:15:75
        plot([cos(k*pi/180) ticks(end)*cos(k*pi/180)], [sin(k*pi/180) ticks(end)*sin(k*pi/180)], 'color', grey)
        text(0.97*sin(k*pi/180), 0.97*cos(k*pi/180), [num2str(k),'^o'],'fontsize',10,'HorizontalAlignment','right')
    end
end

%figname = ['BLRegion'.png']; saveas(figure(1),figname);
