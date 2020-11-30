%==========================================================================
%BIRDS FUNCTION
x=(-2*pi:0.1:2*pi); y=(-2*pi:0.1:2*pi)';
z=(sin(x).*exp((1-cos(y)).^2)+cos(y).*exp((1-sin(x)).^2))+(x-y).^2;%((x).^2)+((y).^2);
z=z-min(min(z));
xx=(-2*pi:2:2*pi); yy=(-2*pi:2:2*pi)';
zz=(sin(xx).*exp((1-cos(yy)).^2)+cos(yy).*exp((1-sin(xx)).^2))+(xx-yy).^2;%((x).^2)+((y).^2);
zz=zz-min(min(zz));
z_para=25 + 90*(x+1.8).^2 +90*(y+3).^2;
fig=figure();
set(gcf, 'Color', 'w');
set(fig,'PaperOrientation','landscape');
set(0, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex'); set(groot, 'defaultLegendInterpreter','latex');
subplot(1,2,1)
surf(x,y,z); shading flat %interp;
zlabel('$E(\textbf{m})$','interpreter','latex')
%pbaspect([1.5 1 1])
zlim([min(min(z)) max(max(z))])
colormap(linspecer)
freezeColors
hold on
CT=cbrewer('seq', 'Greys',300);
colormap(CT)
surf(x,y,z_para); shading flat %interp;

% [dx,dy] = gradient(-zz);
% quiver(xx,yy,dx,dy);
% contour(x,y,z,15); %h=colorbar; 
% xlabel('$m_2$','interpreter','latex'); ylabel('$m_1$','interpreter','latex');
% set(gca,'FontSize',11);
% colormap(linspecer)



subplot(1,2,2)
xx=(-2*pi:0.4:2*pi); yy=(-2*pi:0.4:2*pi)';
zz=(sin(xx).*exp((1-cos(yy)).^2)+cos(yy).*exp((1-sin(xx)).^2))+(xx-yy).^2;%((x).^2)+((y).^2);
zz=zz-min(min(zz));
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

hold off

fig2=figure(2);

set(gcf, 'Color', 'w');
set(fig2,'PaperOrientation','landscape');
set(0, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex'); set(groot, 'defaultLegendInterpreter','latex');
subplot(1,2,1)
surf(x,y,z); shading flat %interp;
zlabel('$E(\textbf{m})$','interpreter','latex')
%pbaspect([1.5 1 1])
%zlim([min(min(f)) max(max(f))])
hold on
[dx,dy] = gradient(-zz);
%quiver(xx,yy,dx,dy);
contour(x,y,z,15); %h=colorbar; 
xlabel('$m_2$','interpreter','latex'); ylabel('$m_1$','interpreter','latex');
set(gca,'FontSize',11);
colormap(linspecer)
pointA = [-1.58,-6,0];
pointB = [-1.58,-6,max(max(z))];
pointC = [-1.58,6,max(max(z))];
pointD = [-1.58,6,0];
points=[pointA' pointB' pointC' pointD'];
plano=fill3(points(1,:),points(2,:),points(3,:),'w');
%alpha(plano,0.3)

subplot(1,2,2)
z2=interp2(x,y,z,-2.5,y); 
z2=z2-min(min(z2(:,1)));
plot(y,z2);
xlim([-6 6]);
ylabel('$E(\textbf{m})$','interpreter','latex')
xlabel('$m_1$','interpreter','latex');
export_fig 'alpha1.pdf'
% h11=2.*exp((sin(x) - 1).^2).*cos(x).^2.*cos(y)-exp((cos(y) - 1).^2).*sin(x) + 4.*exp((sin(x)-1).^2).*cos(x).^2.*cos(y).*(sin(x) - 1).^2 - 2.*exp((sin(x) - 1).^2).*cos(y).*sin(x).*(sin(x) - 1) + 2;                                                                        
% h12=- 2.*exp((cos(y) - 1).^2).*cos(x).*sin(y).*(cos(y) - 1) - 2.*exp((sin(x) - 1).^2).*cos(x).*sin(y).*(sin(x) - 1) - 2;
% h21=- 2.*exp((cos(y) - 1).^2).*cos(x).*sin(y).*(cos(y) - 1) - 2.*exp((sin(x) - 1).^2).*cos(x).*sin(y).*(sin(x) - 1) - 2;
% h22=2.*exp((cos(y) - 1).^2).*sin(x).*sin(y).^2 - exp((sin(x) - 1).^2).*cos(y) + 4.*exp((cos(y) - 1).^2).*sin(x).*sin(y).^2.*(cos(y) - 1).^2 - 2.*exp((cos(y) - 1).^2).*cos(y).*sin(x).*(cos(y) - 1) + 2;
% H=[h11, h12; h21, h22];
% g1=2.*x - 2.*y + exp((cos(y) - 1).^2).*cos(x) + 2.*exp((sin(x) - 1).^2).*cos(x).*cos(y).*(sin(x) - 1);
% g2= 2.*y - 2.*x - exp((sin(x) - 1).^2).*sin(y) - 2.*exp((cos(y) - 1).^2).*sin(x)*sin(y).*(cos(y) - 1);
% g=[g1;g2];
% delta=ones(size(z))*0.1;
% m=g*delta+0.5.*delta'*H*delta;
