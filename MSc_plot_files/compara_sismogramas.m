% Comparison of seismograms
clear all; clc; close all
set(groot, 'defaultAxesTickLabelInterpreter','latex'); set(groot, 'defaultLegendInterpreter','latex');

sismo=read_bin('dado_obs_30Hz.bin',4000,1);
sismo2=read_bin('/home/aluno/Downloads/FWI/Codigos/Modelagem2D/Mod_acust_2D_snapshot/outputs/dado_obs_30Hz.bin',4000,1);
sismo=-sismo*10^-8;

%kills direct arrival
% for i=1:2226
%     sismo2(i)=0;
% end

%figura 1
fig1=figure(1); set(gcf,'color','w'); 
passo=0.001; Ntotal=4000;
tempo=(1:1:Ntotal)*passo;
plot(tempo,sismo); box 'off'
xt = get(gca, 'XTick');
set(gca, 'FontSize', 10)
title('Sismograma offset $280$ metros','interpreter','latex','fontsize',12); 
xlabel('Tempo (s)', 'FontSize', 10,'Interpreter','latex'); % x-axis label
ylabel('Amplitude', 'FontSize',10,'Interpreter','latex'); % y-axis label
hold on
plot(tempo,sismo2)
legend('Born','Full')

fig1.PaperUnits = 'centimeters';
fig1.PaperSize = [7.7 11];
fig1.PaperPosition = [0 0 14 8];
print(fig1,'two_points','-depsc2')%'-bestfit')
%  set(h11,'Fontsize',14);
%  set(h21,'Fontsize',14);






%%%%%%%%%%READ BINARY FILE%%%%%%%%%%%%%%%%%%%%%
function data=read_bin(filename,n1,n2,n3,n4,n5)

fid=fopen(filename,'rb');

if nargin == 2 % readin a vector
   temp = fread(fid,n1,'float');fclose(fid);
   data = temp;
elseif nargin == 3 % readin a 2D matrix
   temp = fread(fid,n1*n2,'float');fclose(fid);
   data = reshape(temp,n1,n2);
elseif nargin == 4  % readin a 3D matrix
   temp = fread(fid,n1*n2*n3,'float');fclose(fid);
   data = reshape(temp,n1,n2,n3);
elseif nargin == 5 % readin 2 4D matrix
   temp = fread(fid,n1*n2*n3*n4);fclose(fid);
   data = reshape(temp,n1,n2,n3,n4);
elseif nargin == 6 % readin a 5D matrix
   temp = fread(fid,n1*n2*n3*n4*n5);fclose(fid);
   data = reshape(temp,n1,n2,n3,n4,n5);
elseif nargin == 1 % wrong
   disp('You have to define the dimension of your data!');
else % readin higher dimension matrix
   disp('Higher than 6 dimension matrix readin is not supported by this code!');
end

end

    
    
