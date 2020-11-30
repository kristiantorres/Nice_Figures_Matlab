    dt=0.001;                 % 
    Fs=1/dt;               % 
    T=dt;                  %
    L=5000;                 %
    t = (0:L-1)*T;         % 
    f = Fs*(0:(L/2))/L;    % 
                           % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
    Y=sum(FONTE35,2);
    Y=fft(Y);
    P2=abs(Y/L); %P2=(Y.*conj(Y)./L); 
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    plot(f,(P1-min(P1(:)))./(max(P1(:))-min(P1(:))))% amp normalizada       
    hold on
     
    Y=sum(FONTE10,2);
    Y=fft(Y);
    P2=abs(Y/L); %P2=(Y.*conj(Y)./L); 
    P11 = P2(1:L/2+1);
    P11(2:end-1) = 2*P11(2:end-1);
    plot(f,(P11-min(P11(:)))./(max(P11(:))-min(P11(:))))

    legend('spike','smoothed spike')