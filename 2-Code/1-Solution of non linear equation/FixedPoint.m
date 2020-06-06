fprintf("Secant Method\n");

N=1000;
x=zeros(N);
Gx=zeros(N);
Err=zeros(N);
nitr=N;

exp=input("Enter g(x): ",'s');
g=str2func(['@(x)' exp]);

x(1)=input("Enter inital Value: ");
T=input("Enter the allowed error: ");

Err(1)=0;

for i=1:N
	Gx(i)=g(x(i));
	if(i~=1)
		Err(i)=abs(x(i)-x(i-1));
		if Err(i)<T
			fprintf("The required root of the equation is: %f\n",x(i));
			nitr=i;
			break;
		end
	end
	
	if i==N
		fprintf("Solution did not fit within tolerance parameters/Formula is Divergent\n");
		break;
	end
	x(i+1)=Gx(i);
end

x=transpose(x(1:nitr));
Gx=transpose(Gx(1:nitr));
Err=transpose(Err(1:nitr));
i=transpose(1:nitr);

Table = table(i,x,Gx,Err)