%==========================================================================
%quadratic function
x=(-2*pi:0.1:2*pi); y=(-2*pi:0.1:2*pi)';
z=x.^2+y.^2;
z=z-min(min(z));
xx=(-2*pi:2:2*pi); yy=(-2*pi:2:2*pi)';
zz=xx.^2+yy.^2;


fig=figure();
set(gcf, 'Color', 'w');
set(fig,'PaperOrientation','landscape');
set(0, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex'); set(groot, 'defaultLegendInterpreter','latex');
subplot(1,2,1)
surf(x,y,z); shading flat %interp;
zlabel('$E(\textbf{m})$','interpreter','latex')
pbaspect([1 1 1])
%zlim([min(min(f)) max(max(f))])
hold on
[dx,dy] = gradient(-zz);
%quiver(xx,yy,dx,dy);
contour(x,y,z,15); %h=colorbar; 
xlabel('$m_2$','interpreter','latex'); ylabel('$m_1$','interpreter','latex');
set(gca,'FontSize',11);
colormap(linspecer)
%export_fig 'linear_pres.pdf'
subplot(1,2,2)
xx=(-2*pi:1:2*pi); yy=(-2*pi:1:2*pi)';
zz=xx.^2+yy.^2;
[dx,dy] = gradient(-zz);
contour(x,y,z,20); %h=colorbar; 
hold on
quiver(xx,yy,dx,dy);
ylim([-5.5 5.5]); yticks([-5 0 5])
xlabel('$m_2$','interpreter','latex'); ylabel('$m_1$','interpreter','latex');
h=colorbar; 
title(h,'$E(\textbf{m})$','interpreter','latex','fontsize',11);
h.TickLabelInterpreter = 'latex';
set(gca,'FontSize',11);
%title(h,'$E(x)$','interpreter','latex','fontsize',12); hold on
%colormap(cbrewer('div','Spectral', 80));