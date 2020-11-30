clear all; clc; 
%to be executed at criamodelos..sigsbee2a..finales
    dt=10;                 % 
    Fs=1/dt;               % 
    T=dt;                  %
    L=1200;                 %
    t = (0:L-1)*T;         % 
    f = Fs*(0:(L/2))/L;    % 
                           % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
    mig=read_bin('sigsbee2a_mig_resamp.bin',1201,3201);
    mig=mig(1:end-1,:);
    real=read_bin('sigsbee2a_real.bin',1201,3201);
    real=real(1:end-1,:);
    lap=read_bin('lap.bin',1150,3201);
    
    
    set(groot, 'defaultAxesTickLabelInterpreter','latex'); set(groot, 'defaultLegendInterpreter','latex');

    Y=mig(1:end-50,312);
    %Y=mig(1:end-50,312);
    Y=fft(Y);
    P2=abs(Y/L); %P2=(Y.*conj(Y)./L); 
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    %plot(f,(P1-min(P1(:)))./(max(P1(:))-min(P1(:))))% amp normalizada      
    plot(f,log(P1),'b')%(P1-min(P1(:)))./(max(P1(:))-min(P1(:))))% amp normalizada 
    hold on
     
    Y=(real(1:end-50,312));
    %Y=mig(1:end-50,312)-real(1:end-50,312);
    Y=fft(Y);
    P2=abs(Y/L); %P2=(Y.*conj(Y)./L); 
    P11 = P2(1:L/2+1);
    P11(2:end-1) = 2*P11(2:end-1);
    %plot(f,(P11-min(P11(:)))./(max(P11(:))-min(P11(:))))
    plot(f,log(P11),'k')%(P11-min(P11(:)))./(max(P11(:))-min(P11(:))))

    Y=(0.90*lap(:,312));
    %Y=(ref_2(1:end-50,312));
   % Y=real(1:end-50,312);
    Y=fft(Y);
    P2=abs(Y/L); %P2=(Y.*conj(Y)./L); 
    P11 = P2(1:L/2+1);
    P11(2:end-1) = 2*P11(2:end-1);
    %plot(f,(P11-min(P11(:)))./(max(P11(:))-min(P11(:))))
    plot(f,log(P11),'r')%(P11-min(P11(:)))./(max(P11(:))-min(P11(:))))

%     Y=sum(-ref,2);
%     Y=fft(Y);
%     P2=abs(Y/L); %P2=(Y.*conj(Y)./L); 
%     P111 = P2(1:L/2+1);
%     P111(2:end-1) = 2*P111(2:end-1);
%     plot(f,(P111-min(P111(:)))./(max(P111(:))-min(P111(:))))
    
    legend('Low-wavenumber','real','high-wavenumber')%,'Refletividade real')
    leg.EdgeColor=[1 1 1];
    xlabel('kz (1/m)'); ylabel('amplitude normalizada');