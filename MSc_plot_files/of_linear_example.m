%==========================================================================
%Bird's function
x=(-2*pi:0.1:2*pi); y=(-2*pi:0.1:2*pi)';
z=(sin(x).*exp((1-cos(y)).^2)+cos(y).*exp((1-sin(x)).^2))+(x-y).^2;%((x).^2)+((y).^2);
z=z-min(min(z));
fig=figure();
set(gcf, 'Color', 'w');
set(fig,'PaperOrientation','landscape');
set(0, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex'); set(groot, 'defaultLegendInterpreter','latex');
subplot(1,2,2)
surf(x,y,z); shading flat %interp;
zlabel('$E(m_1,m_2)$','interpreter','latex')
%pbaspect([1.5 1 1])
%zlim([min(min(f)) max(max(f))])
hold on
contour(x,y,z,15); %h=colorbar; 
xlabel('$m_2$','interpreter','latex'); ylabel('$m_1$','interpreter','latex');
set(gca,'FontSize',11)

%==========================================================================
% %Quadratic function
x=(-2*pi:0.1:2*pi); y=(-2*pi:0.1:2*pi)';
z=x.^2+y.^2;
z=z-min(min(z));
set(gcf, 'Color', 'w');
set(fig,'PaperOrientation','landscape');
set(0, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex'); set(groot, 'defaultLegendInterpreter','latex');
subplot(1,2,1)
surf(x,y,z); shading flat %interp;
zlabel('$E(m_1,m_2)$','interpreter','latex')
%pbaspect([1.5 1 1])
%zlim([min(min(f)) max(max(f))])
hold on
contour(x,y,z,10); %h=colorbar; 
xlabel('$m_2$','interpreter','latex'); ylabel('$m_1$','interpreter','latex');
set(gca,'FontSize',11);
colormap(linspecer)

%colormap(cbrewer('div','Spectral', 80));