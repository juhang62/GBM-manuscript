function [D,rho,k]=findparams(rhohat,l1hat,L1,L2,r0,ts,a1,a2)
%rho=fzero(@(x) L2+r0*(exp(x*ts))^(1/3)-ts*2*x*L1/rhohat/l1hat,0);
a0=r0;
r1=(L1/(2*l1hat*rhohat))^2; %D=r1*rho
% eq=@(x) (L2/ts)-sqrt(4*r1*x.^2-4*r1*x/ts.*log(2*a2/a0/r0*sqrt(pi*r1*x*ts)))...
%     +sqrt(4*r1*x.^2-4*r1*x/ts.*log(2*a1/a0/r0*sqrt(pi*r1*x*ts)));
eq=@(rho) L2-sqrt(4*r1*rho*ts.*(rho*ts-log(a2/a0*(4*pi*ts*r1*rho).^(3/2))))+...
    sqrt(4*r1*rho*ts.*(rho*ts-log(a1/a0*(4*pi*ts*r1*rho).^(3/2))));
haha=@(rho) -sqrt(4*r1*rho*ts.*(rho*ts-log(a2/a0*(4*pi*ts*r1*rho).^(3/2))))+...
    sqrt(4*r1*rho*ts.*(rho*ts-log(a1/a0*(4*pi*ts*r1*rho).^(3/2))));
%4*r1*rho*ts.*(rho*ts-log(a1/a0*(4*pi*ts*r1*rho).^(3/2)));

rho=fzero(eq,0.3);
if isnan(rho)
    keyboard
end
%D=rho/(rhohat*l1hat/L1)^2;
D=r1*rho;
k=rho/rhohat;
end