exp=input("Enter expression",s);
func=sym(exp);

a=input("Enter lower bound");
b=input("Enter upper bound");

while func(a)*func(b)<0
    fprintf('Incorrect Bounds!\n');
    a=input("Enter lower bound");
    b=input("Enter upper bound");
end

for i=2:1000
    c=(a+b)/2;
    if f(a)*f(c)<0
        a=c;
    else
        b=c;
    end
end