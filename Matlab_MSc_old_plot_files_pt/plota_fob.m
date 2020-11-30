load('fob.txt')
x=1:1:107;
fig=figure();
plot(x,fob)
xlabel('Iterações','fontsize',12); ylabel('\(f_{ob}\)','fontsize',20    );
set(fig,'PaperOrientation','landscape');
print(fig,'-dpdf','-bestfit')