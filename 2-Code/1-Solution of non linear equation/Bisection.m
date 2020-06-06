fprintf("Bisection Method\n");

N=1000;
Lower=zeros(N);
Upper=zeros(N);
Mid=zeros(N);
FLower=zeros(N);
FUpper=zeros(N);
FMid=zeros(N);
Err=zeros(N);
nitr=N;

exp=input("Enter expression: ",'s');
f=str2func(['@(x)' exp]);

Lower(1)=input("Enter Lower bound: ");
Upper(1)=input("Enter Upper bound: ");
T=input("Enter the allowed error: ");

while Lower(1)>Upper(1) || f(Lower(1))*f(Upper(1))>0
    fprintf("Incorrect Bounds!\n");
    Lower(1)=input("Enter Lower bound: ");
    Upper(1)=input("Enter Upper bound: ");
end

Err(1)=0;

for i=1:N
	fprintf("Iteration: %d\n",i);
	Mid(i)=(Lower(i)+Upper(i))/2;
	FMid(i)=f(Mid(i));
	FLower(i)=f(Lower(i));
	FUpper(i)=f(Upper(i));
	if (f(Mid(i))==0)
		fprintf("The required root of the equation is: %f\n",Mid(i));
		nitr=i;
		break
	end
	if(i~=1)
		Err(i)=abs((Mid(i)-Mid(i-1)));
		if Err(i)<T
			fprintf("The required root of the equation is: %f\n",Mid(i));
			nitr=i;
			break
		end
	end
	
	if i==N
		fprintf("Solution did not fit within tolerance parameters\n");
		break;
	end
	
	if ((FLower(i)*FMid(i))<0)
		Upper(i+1)=Mid(i);
		Lower(i+1)=Lower(i);
	else
		Lower(i+1)=Mid(i);
		Upper(i+1)=Upper(i);
	end
	
end

Lower=transpose(Lower(1:nitr));
Upper=transpose(Upper(1:nitr));
Mid=transpose(Mid(1:nitr));
FLower=transpose(FLower(1:nitr));
FUpper=transpose(FUpper(1:nitr));
FMid=transpose(FMid(1:nitr));
Err=transpose(Err(1:nitr));
i=transpose(1:nitr);

Table = table(i,Lower,Upper,Mid,FMid,Err,FUpper,FLower)
