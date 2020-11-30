%GENERA MODELO WEBE 3
%requisito: vp_model_400x300.bin
clear all; clc
set(groot, 'defaultAxesTickLabelInterpreter','latex'); set(groot, 'defaultLegendInterpreter','latex');

modelo=read_bin('vp_model_400x300.bin',300,400);

modelo(:,:)=1500.0;

separation_x=100;

modelo(size(modelo,1)/2-50,size(modelo,2)/2-separation_x/2)=1800;
modelo(size(modelo,1)/2-50,size(modelo,2)/2+separation_x/2)=1800;

fileID = fopen('modelo_webe3.bin','w');
fwrite(fileID,modelo,'single');
fclose(fileID);

%cria refletividade
ref=zeros(size(modelo));
ref2=ref;
for i=1:size(modelo,1)-1
    for j=1:size(modelo,2)-1
        ref(i+1,j)=(modelo(i+1,j)-modelo(i,j))/(modelo(i+1,j)+modelo(i,j));
    end
end

fileID = fopen('ref_modelo_webe3.bin','w');
fwrite(fileID,ref,'single');
fclose(fileID);

back=ones(size(modelo))*1500;
true_ref=modelo-back;
fileID = fopen('trueref_modelo_webe3.bin','w');
fwrite(fileID,true_ref,'single');
fclose(fileID);

%figura 1 - modelo real
fig1=figure(1); set(gcf,'color','w');
imagesc(modelo)
cmocean('dense')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 14)
title('Modelo Webe 3','interpreter','latex','fontsize',16); 
xlabel('(m)', 'FontSize', 14,'Interpreter','latex'); % x-axis label
ylabel('(m)', 'FontSize',14,'Interpreter','latex'); % y-axis label
bar11=colorbar('southoutside'); set(bar11,'TickLabelInterpreter','latex'); bar11.Label.String = 'm/s'; bar11.Label.Interpreter = 'latex';

%figura 2 - refletividade offset zero
fig2=figure(2); set(gcf,'color','w');
imagesc(ref)
cmocean('grey')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 14)
title('Refletividade - Modelo Webe 3','interpreter','latex','fontsize',16); 
xlabel('(m)', 'FontSize', 14,'Interpreter','latex'); % x-axis label
ylabel('(m)', 'FontSize',14,'Interpreter','latex'); % y-axis label
bar11=colorbar('southoutside'); set(bar11,'TickLabelInterpreter','latex'); bar11.Label.Interpreter = 'latex';

%figura 3 - real-background homo
fig3=figure(3); set(gcf,'color','w');
imagesc(true_ref)
cmocean('grey')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 14)
title('$V_t - V_0$  Modelo Webe 3','interpreter','latex','fontsize',16); 
xlabel('(m)', 'FontSize', 14,'Interpreter','latex'); % x-axis label
ylabel('(m)', 'FontSize',14,'Interpreter','latex'); % y-axis label
bar11=colorbar('southoutside'); set(bar11,'TickLabelInterpreter','latex'); bar11.Label.Interpreter = 'latex';
