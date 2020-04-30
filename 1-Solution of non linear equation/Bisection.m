exp=input("Enter expression: ",'s');
f=inline(exp);

a=input("Enter lower bound: ");
b=input("Enter upper bound: ");
tol=input("Enter the allowed error: ");
while f(a)*f(b)<0
    fprintf("Incorrect Bounds!\n");
    a=input("Enter lower bound: ");
    b=input("Enter upper bound: ");
end
xnew(1)=0;
for i=2:1000
    c=(a+b)/2;
    if f(a)*f(c)<0
        a=c;
    else
        b=c;
    end
    if f(b)*f(c)<0
        b=c;
    else
        a=c;
    end
xnew(i)=c;
if abs((xnew(i)-xnew(i-1))/xnew(i))<tol,break,end
end
format long
%str = ['The required root of the equation is: ', num2str(c), ''];
fprintf("The required root of the equation is: %f",num2str(c));