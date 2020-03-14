function [wid,lwid,spd,peak]=wavprof(a1,a2,dx,difft,U1,U2)
% U1=U1/max(U1);
% U2=U2/max(U2);
[maxU1,maxU1ind]=max(U1);
[maxU2,maxU2ind]=max(U2);
marg=double(U1<0.01).*double(U2<0.01);
n=length(U1);
if sum(marg(1:maxU1ind))<0.05*n || sum(marg(maxU2ind:end))<0.05*n
    warning('margin too small')
end    
spd=(maxU2ind-maxU1ind)*dx/difft;
% if maxU1<=0.5
%     wid=NaN;
%     slp=NaN;
% else
    lastind=find(U1>maxU1*a1,1,'last');
    wid=(lastind-find(U1>maxU1*a1,1,'first'))*dx;
    lowind=find(U1>maxU1*a2,1,'last');
    lwid=(lowind-lastind)*dx;
    %slp=(U1(lastind)-U1(lastind+1))/dx;
    peak=maxU1;
end