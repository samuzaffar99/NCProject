fprintf("Newton-Raphson Method\n");

N=1000;
x=zeros(N);
Fx=zeros(N);
Fdx=zeros(N);
Err=zeros(N);
nitr=N;

exp=input("Enter expression: ",'s');
f=str2func(['@(x)' exp]);
d=matlabFunction(diff(sym(f)));

x(1)=input("Enter inital Value: ");
T=input("Enter the allowed error: ");

Err(1)=0;

for i=1:N
	Fx(i)=f(x(i));
	Fdx(i)=d(x(i));
	
	if(i~=1)
		Err(i)=abs((x(i)-x(i-1)));
		if Err(i)<=T
			fprintf("The required root of the equation is: %f\n",x(i));
			nitr=i;
			break;
		end
	end

	if i==N
		fprintf("Solution did not fit within tolerance parameters\n");
		break;
	end
	
	x(i+1)=x(i)-((Fx(i)/Fdx(i)));
end

x=transpose(x(1:nitr));
Fx=transpose(Fx(1:nitr));
Fdx=transpose(Fdx(1:nitr));
Err=transpose(Err(1:nitr));
i=transpose(1:nitr);

Table = table(i,x,Fx,Fdx,Err)
