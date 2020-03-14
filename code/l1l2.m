function [l1,l2,umax]=l1l2(rho,a1,a2,ag,bg,ad,bd)
% % a1=0.9;a2=0.1;
% pd13=makedist('beta','a',1,'b',3); %fast grow first then saturate
% pd22=makedist('beta','a',2,'b',2); %sigmoid
% pd51=makedist('beta','a',5,'b',1); %slow grow first

pdg=makedist('beta','a',ag,'b',bg);
pdd=makedist('beta','a',ad,'b',bd);
gfw=@(x) rho*cdf(pdg,x);

w=(0.001:0.001:1);
    dfw=@(x) (1-cdf(pdd,x));
    %dfw=@(x) k*(1-x);
%ufw=@(w) k*log(w)-(k+1)*w+k+1;
ufw=@(x) ufwext(x,gfw,dfw);
ufwvec=ufw(w);
[umax,umaxind]=max(ufwvec);
w1p=interp1(ufwvec(1:umaxind),w(1:umaxind),umax*a1);
w1m=interp1(ufwvec(umaxind:end),w(umaxind:end),umax*a1);
w2=interp1(ufwvec(umaxind:end),w(umaxind:end),umax*a2);
dzodw=@(w) -1./ufw(w)./gfw(w);
l1=integral(dzodw,w1m,w1p);
l2=integral(dzodw,w2,w1m);
%r=l1/l2;
end

function out=ufwext(w,gfw,dfw)
n=length(w);
out=zeros(1,n);
for i=1:n
    intgrad=@(x) dfw(x)./gfw(x)-1;
    out(i)=integral(intgrad,1,w(i));
end
end
