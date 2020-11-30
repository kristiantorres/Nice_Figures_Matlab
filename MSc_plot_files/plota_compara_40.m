set(groot, 'defaultAxesTickLabelInterpreter','latex'); set(groot, 'defaultLegendInterpreter','latex');
fig6=figure(5); set(gcf, 'Color', 'w');
com=read_bin('back_5.bin',4000,400);
esp_Born=read_bin('espalhado_5.bin',4000,400);
%cuando uses 2*deltac/vo3, see below
%esp_Born_mod=esp_Born;
%esp_Born_mod(15:end,1)=esp_Born(1:end-14,200);
%plot(tempo,esp_Born_mod(:,1),'b'); hold on
tempo=1:4000; 
plot(tempo,esp_Born(:,200),'b'); 
hold on;
plot(tempo,com(:,200),'r');
leg=legend({'$u - u_0$','$\delta u$ (Born)'}); leg.EdgeColor=[1 1 1];
%title('Canal 200','interpreter','latex'); 
xlabel('tempo (ms)','interpreter','latex'); 
xticks(0:1000:4000); %xticklabels({'0','1','2','3','4'})
ylabel('amplitude','interpreter','latex');
%yticks(0:1000:4000); yticklabels({'0','1','2','3','4'})
set(gca,'FontSize',11)
box off;
%ylim([-0.3000 0.2000]);
pbaspect([2.5 1 1])
ylim([-4e-3 2.5e-3]);
export_fig 'compara_5.pdf'