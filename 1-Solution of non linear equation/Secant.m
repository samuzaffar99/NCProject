fprintf("Secant Method\n");
exp=input("Enter expression: ",'s');
f=inline(exp);
p0=input("Enter Lower bound: ");
p1=input("Enter Upper bound: ");
T=input("Enter the allowed error: ");

for i=1:N
	q0=f(p0);
	q1=f(p1);
	p=p1-q1*((p1-p0)/(q1-q0));
	err=abs(p-p1);
	if err<T
		fprintf("Final Value: %f\n",p);
		break;
	end
	p0=p1;
	p1=p;
	if i==N
		fprintf("Solution did not fit within tolerance parameters\n");
	end
end