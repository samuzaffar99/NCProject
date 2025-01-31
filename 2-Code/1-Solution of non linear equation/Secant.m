fprintf("Secant Method\n");

N=1000;
p0=zeros(N);
p1=zeros(N);
Fp0=zeros(N);
Fp1=zeros(N);
Err=zeros(N);
nitr=N;

exp=input("Enter expression: ",'s');
f=str2func(['@(x)' exp]);

p0(1)=input("Enter Lower bound: ");
p1(1)=input("Enter Upper bound: ");
T=input("Enter the allowed error: ");

Err(1)=0;

for i=1:N
	Fp0(i)=f(p0(i));
	Fp1(i)=f(p1(i));
	if(i~=1)
		Err(i)=abs(p1(i)-p1(i-1));
		if Err(i)<T
			fprintf("The required root of the equation is: %f\n",p1(i));
			nitr=i;
			break;
		end
	end
% 	if(Fp1(i)==0)
% 		fprintf("The required root of the equation is: %f\n",p1(i));
% 		nitr=i;
% 		break
% 	end
	
	if i==N
		fprintf("Solution did not fit within tolerance parameters\n");
		break;
	end
	p0(i+1)=p1(i);
	p1(i+1)=p1(i)-Fp1(i)*((p1(i)-p0(i))/(Fp1(i)-Fp0(i)));
end

p0=transpose(p0(1:nitr));
p1=transpose(p1(1:nitr));
Fp0=transpose(Fp0(1:nitr));
Fp1=transpose(Fp1(1:nitr));
Err=transpose(Err(1:nitr));
i=transpose(1:nitr);

Table = table(i,p0,p1,Fp0,Fp1,Err)