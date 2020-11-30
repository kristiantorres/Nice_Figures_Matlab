%--------------Exercicio 2--------------
% Seja a função que descreve a fonte sísmica s(t). Considerando a frequência de
% corte igual a 60Hz, plote o gráfico da fonte sísmica no
% domínio do tempo. Trace agora o gráfico do módulo da transformada de Fourier da
% fonte sísmica no domínio da frequênciA
set(groot, 'defaultAxesTickLabelInterpreter','latex'); set(groot, 'defaultLegendInterpreter','latex');
clear
clc
C = linspecer(2);
Fs=1000; %Hz - freq de corte
t = 0:1/Fs:1-1/Fs; %vetor tempo
 % Calcular_fonte
 fcorte=30; % Hertz
 fc=fcorte/(3*sqrt(pi));
 tt=(2*sqrt(pi)/fcorte);
 td=t-tt;
 var3=(pi*fc.*td);
 var2=var3.^2;
 var1=2*pi.*var2;
 ss=(1-var1);
 sss=exp(-pi.*var2).^7;
 s=ss.*sss; % fonte
 % plot fonte no tempo
 plot(t,s,'color',C(1,:),'LineWidth',2);
 set(gcf, 'Color', 'w');
 xlabel('tempo (s)','FontSize',13)
 ylabel('amplitude','FontSize',13)
 %title("Gr\'afico da fonte sismica no dominio do tempo",'FontSize',13,'fontweight','bold');
 % plot Fourier
 N=length(s);
 k=0:N-1;
 T=N/Fs;
 freq=k/T; % vetor de faixa de freq
 X=fft(s)/N; % Transformada de Fourier
 cutOff=100; % Freq max no plot
 X=X(1:cutOff);
 

 %export_fig 'time_ricker30.pdf'
 figure, plot(freq(1:cutOff),(abs(X)-min(abs(X)))./(max(abs(X))-min(abs(X))),'color',C(2,:),'LineWidth',2);
 xlabel('frequ\^encia (Hz)','FontSize',13)
 ylabel('amplitude','FontSize',13)
 %title('Espectro de Frequencia da fonte','FontSize',13, 'fontweight','bold');
 set(gcf, 'Color', 'w');
 xlim([0 60])
%  %export_fig 'espectro_ricker30.pdf'