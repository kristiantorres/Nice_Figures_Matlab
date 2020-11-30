clear all; close all
set(groot, 'defaultAxesTickLabelInterpreter','latex'); set(groot, 'defaultLegendInterpreter','latex');

modelo=read_bin('sigsbee2a_real_small.bin',801,1601);
 
clims = [min(min(modelo)) max(max(modelo))];

fig1=figure(1);
set(gcf,'color','w');
h11=subplot(1,1,1);
imagesc(modelo,clims)
cmocean('deep')
% bar11=colorbar('southoutside');
% set(bar11,'TickLabelInterpreter','latex')
% bar11.Label.String = 'm/s'; bar11.Label.Interpreter = 'latex';



% title(bar11,'Original Image','Interpreter','latex')
 xlabel('(m)', 'FontSize', 12,'Interpreter','latex'); % x-axis label
 ylabel('(m)', 'FontSize',12,'Interpreter','latex'); % y-axis label

% % INTERPOLATION IN CASE THE IMAGE IS CHOPPY
% F = griddedInterpolant(modelo);
% [sy,sx] = size(modelo);
%  xq = (1:0.01:sx)';
%  yq = (1:0.1:sy)'; 
%  
%  figure
%  F.Method = 'spline';
%  vq = (F({yq,xq}));
%  imagesc(vq,clims)
%  cmocean('deep')
%  title('spline method')

%mesh(x,y,P); view([0 90])
%axis([0 (max(x)-2.5*100) 0 (max(y)-2.5*100)]); %image
%set(gca, 'FontName', 'Arial','Units','points');
% xlabel('distância (m)', 'FontSize', 7); % x-axis label
% ylabel('profundidade (m)', 'FontSize', 7); % y-axis label
% t1=title('a)','FontSize', 7,'Color',[0 0 0]);
% cmocean('dense');
% caxis([min(P(:)),max(P(:))]);
% %xlim([0 2000]);
% xticks(0:500:2000);
% ax=gca;
% ax.LabelFontSizeMultiplier=1;
% ax.TitleFontSizeMultiplier=1;
% ax.TitleFontWeight = 'normal';
% ax.XColor = [0 0 0];
% ax.YColor = [0 0 0];
% 
% %figura 2
% h21=subplot(2,1,2);
% imagesc(x,y,P2)
% %mesh(x,y,P2); view([0 90])
% %axis([0,(max(x)-2.5*100), 0, (max(y)-2.5*100)]) %image
% set(gca, 'FontName', 'Arial','Units','points');
% xlabel('distância (m)', 'FontSize', 7) % x-axis label
% ylabel('profundidade (m)', 'FontSize', 9) % y-axis label
% t2=title('b)','FontSize', 7,'Color',[0 0 0]);
% cmocean('dense')
% caxis([min(P(:)),max(P(:))])
% %xlim([0 2000])
% xticks(0:500:2000)
% ax=gca;
% ax.LabelFontSizeMultiplier=1;
% ax.TitleFontSizeMultiplier=1;
% ax.TitleFontWeight = 'normal';
% ax.XColor = [0 0 0];
% ax.YColor = [0 0 0];
% 
% % % %colorbar
% bar11=colorbar('southoutside');
% set(bar11, 'FontName', 'Arial','FontSize',7);
% set(bar11,'YTick',[min(P(:)) (max(P(:))+min(P(:)))/2 max(P(:))])    
% bar11.XColor = [0 0 0];
% bar11.YColor = [0 0 0];
% % bar11.YTickMode = 'manual';
% % bar11.XTickMode = 'manual';
% 
% 
% % % % fig_to_eps
%  fig1.PaperUnits = 'centimeters';
%  fig1.PaperSize   = [7.7 11];
%  fig1.PaperPosition = [0 0 7.7 11];
%  set(h11,'Fontsize',7);
%  set(h21,'Fontsize',7);
%  
% 
%  set(h11,'Units','centimeters', 'Position', [2.30 8.1 11.9 3.2]);
%  set(h21,'Units','centimeters', 'position', [2.30 2.8 11.9 3.2]);
%  set(t1,'Units','centimeters', 'position', [-1.9 3.5 0]);
%  set(t2,'Units','centimeters', 'position', [-1.9 3.5 0]);   
%  set(bar11,'Units','centimeters', 'position', [2.30 1.2 11.8 0.2]);
%  
%  
%  
%  print(fig1,'Real','-depsc2')%'-bestfit')
 %close(fig1)