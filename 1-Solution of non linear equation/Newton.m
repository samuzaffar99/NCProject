fprintf("Newton-Raphson Method\n");
exp=input("Enter expression: ",'s');
f=inline(exp);
dif=diff(str2sym(exp));
d=inline(dif);
x=input("Enter inital Value: ");
T=input("Enter the allowed error: ");
N=1000;
for i = 1:N
	x(i+1)=x(i)-((f(x(i))/d(x(i))));
	err(i)=abs((x(i+1)-x(i))/x(i));
	if err(i)<=T
		fprintf("Final Value: %f\n",x(i+1));
		break;
	end
	if i==N
		fprintf("Solution did not fit within tolerance parameters\n");
	end
end
