x=[0 8 16 24 32 40];
fx=[14.621 11.843 9.870 8.418 7.305 6.413];
dt=zeros(6,7);
for i=1:6
dt(i,1)=x(i);
dt(i,2)=fx(i);
end
n=5;
for j=3:7
for i=1:n
dt(i,j)=dt(i+1,j-1)-dt(i,j-1)
end
n=n-1;
end
h=x(2)-x(1)
xp=27;
for i=1:6
q=(xp-x(i))/h;
if (q>0&&q<1)
p=q;
end
end
p
l=xp-(p*h)
for i=1:6
if(l==x(i))
r=i;
end
end
f0=fx(r);
f01=dt((r-1),3);
f02=dt((r-2),(3+1));
f03=dt((r-3),(3+2));
f04=dt((r-4),(3+3));
fp=(f0)+((p*f01)+(p*(p+1)*f02)/(2)) + ((p*(p+1)*(p+2)*f03)/(6))