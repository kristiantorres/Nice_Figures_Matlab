clear all
set(groot, 'defaultTextInterpreter', 'latex');
f6=load(' 6Hz.txt');
f9=load(' 9Hz.txt');
f12=load('12Hz.txt');
f15=load('15Hz.txt');
f18=load('18Hz.txt');
f21=load('21Hz.txt');
f24=load('24Hz.txt');
f27=load('27Hz.txt');
f30=load('30Hz.txt');

x=(1:21);

fig=figure(1);
p1=plot(x,f6);
xlabel('Iteracoes'); ylabel('\(f_{ob}\)');
ax=gca; ax.XLabel.FontSize=14; ax.YLabel.FontSize=18;
hold on
p2=plot(x,f9);
hold on
p3=plot(x,f12);
hold on
p4=plot(x,f15);
hold on
p5=plot(x,f18);
hold on
p6=plot(x,f21);
hold on
p7=plot(x,f24);
hold on
p8=plot(x,f27);
hold on
p9=plot(x,f30);
legend1=legend([p1, p2,p3,p4,p5,p6,p7,p8,p9],{'6 Hz','9 Hz','12 Hz','15 Hz','18 Hz','21 Hz','24 Hz','27 Hz','30 Hz'});
set(gca,'xlim',[min(x) max(x)])
set(gca,'ylim',[0 max(f6)])
print(fig,'fob','-djpeg','-r1000');%'-bestfit')
% set(fig,'PaperOrientation','landscape');
% print(fig,'fob','-dpdf','-bestfit')

fig=figure(1);
p2=plot(x,f9);
xlabel('Iteracoes'); ylabel('\(f_{ob}\)');
ax=gca; ax.XLabel.FontSize=14; ax.YLabel.FontSize=18;
hold on
p3=plot(x,f12);
hold on
p4=plot(x,f15);
hold on
p5=plot(x,f18);
hold on
p6=plot(x,f21);
hold on
p7=plot(x,f24);
hold on
p8=plot(x,f27);
hold on
p9=plot(x,f30);
legend1=legend([p2,p3,p4,p5,p6,p7,p8,p9],{'9 Hz','12 Hz','15 Hz','18 Hz','21 Hz','24 Hz','27 Hz','30 Hz'});
set(gca,'xlim',[min(x) max(x)])
set(gca,'ylim',[min(f30) max(f9)])
print(fig,'fobzoom','-djpeg','-r1000');%'-bestfit')
%set(fig,'PaperOrientation','landscape');
%print(fig,'fob','-dpdf','-bestfit')
