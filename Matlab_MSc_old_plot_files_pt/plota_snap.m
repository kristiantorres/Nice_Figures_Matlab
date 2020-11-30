%this code creates plots for camembert model
close all;
set(groot, 'defaultAxesTickLabelInterpreter','latex'); set(groot, 'defaultLegendInterpreter','latex');
texto='snap1020.bin';
modelo_camem=read_bin(texto,500,600);
fig1=figure(1); set(gcf, 'Color', 'w');
x=0:0.01:4; y=0:0.01:2;
imagesc(x,y,modelo_camem(100:end-100,100:end-100)); 
caxis([-0.02 0.02])
%cmocean('matter'); %colormap(cm_viridis)% 
%cb=colorbar; 
%cb.Location='southoutside'; 
%set(cb,'YTick',1500:50:1650); 
%    cb.TickLabelInterpreter = 'latex'; 
%cb.Label.String = '(m/s)'; 
%title(cb,'(m/s)','interpreter','latex','fontsize',11);
%cb.Label.Interpreter = 'latex'; 
%cb.FontSize=12;% title(cb,'(m/s)','Interpreter','latex'); 
%title('Modelo real $V_p$','interpreter','latex'); 
xlabel('x (km)','interpreter','latex'); 
set(gca,'xaxisLocation','top')
xticks(0:0.5:4); 
ylabel('z (km)','interpreter','latex'); 
yticks(0:0.5:2);
set(gca,'FontSize',12)
%set(fig1,'PaperOrientation','landscape');
pbaspect([1.8 1 1])
% w = 0.5;h = 0.5; % this is good for double column format
% set(fig1,'WindowStyle','Normal')
% w=round(w*1050);h=round(h*800);
% size=[0 0 w h];
% set(fig1,'Units','pixels','Position',size);
%CT=cbrewer('seq', 'Blues',300);
%colormap(CT)
cmocean('gray')
export_fig snap20.pdf
%close(fig1)


% 
% it25_preco=read_bin('vel_15Hz_it25.bin',200,400);
% fig2=figure(2); set(gcf, 'Color', 'w');
% x=0:0.01:4; y=0:0.01:2;
% imagesc(x,y,it25_preco); 
% %cmocean('thermal'); %colormap(cm_viridis)% 
% cb=colorbar; 
% cb.Location='southoutside'; 
% set(cb,'YTick',1500:50:1650); 
%     cb.TickLabelInterpreter = 'latex'; 
% cb.Label.String = '(m/s)'; 
% cb.Label.Interpreter = 'latex'; 
% cb.FontSize=11;% title(cb,'(m/s)','Interpreter','latex'); 
% %title('Modelo real $V_p$','interpreter','latex'); 
% xlabel('x (km)','interpreter','latex'); 
% %set(gca,'xaxisLocation','top')
% xticks(0:0.5:4); 
% ylabel('z (km)','interpreter','latex'); 
% yticks(0:0.5:2);
% set(gca,'FontSize',12)
% %set(fig1,'PaperOrientation','landscape');
% pbaspect([1.8 1 1])
% % w = 0.5;h = 0.5; % this is good for double column format
% % set(fig1,'WindowStyle','Normal')
% % w=round(w*1050);h=round(h*800);
% % size=[0 0 w h];
% % set(fig1,'Units','pixels','Position',size);
% shading flat %interp;
% %export_fig 'camembert.pdf' -nocrop
% %close(fig1)
% colormap(lbmap(150))