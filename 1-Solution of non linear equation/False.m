fprintf("False Position Method\n");
exp=input("Enter expression: ",'s');
f=inline(exp);
p0=input("Enter Lower bound: ");
p1=input("Enter Upper bound: ");
T=input("Enter the allowed error: ");

q0=f(p0);
q1=f(p1);
for i=1:N
	p=p1-q1*((p1-p0)/(q1-q0));
	d=abs(p-p1);
	err=abs(p-p1);
	if err<T
		fprintf("Final Value: %f\n",p);
		break;
	end
	q=f(p);
	if (q*q1)<0
		p0=p1;
		q0=q1;
	end
	p1=p;
	q1=q;
	if i==N
		fprintf("Solution did not fit within tolerance parameters\n");
	end
end
%Table = table(p,q)