close all
set(groot,'defaultLineLineWidth',2)
u=u1(2,:);
u=u/max(u);
plot(x,u)
ax=gca;
ax.FontSize=14;
xlim([0 60])
drawArrow = @(x,y) quiver( x(1),y(1),x(2)-x(1),y(2)-y(1),0 ) ;
hold on
plot([0 35.9],[0.9 0.9],'k:',[0 39.8],[0.1 0.1],'k:',[32.2 32.2],[0.9 0],':k',[35.3 35.3],[0.9 0],':k',[39.8 39.8],[0.1 0],':k')
%drawArrow([32.2 35.3],[0.5 0.5])
annotation('textarrow',[32.2 35.3],[0.5 0.5],'String','y = x ')