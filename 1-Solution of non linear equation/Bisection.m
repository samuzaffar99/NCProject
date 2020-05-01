fprintf("Bisection Method\n");
exp=input("Enter expression: ",'s');
f=inline(exp);

Lower=input("Enter Lower bound: ");
Upper=input("Enter Upper bound: ");
T=input("Enter the allowed error: ");
while Lower>Upper || f(Lower)*f(Upper)<0
    fprintf("Incorrect Bounds!\n");
    Lower=input("Enter Lower bound: ");
    Upper=input("Enter Upper bound: ");
end
xnew(1)=0;
for i=2:1000
    Mid=(Lower+Upper)/2;
    if f(Lower)*f(Mid)<0
        Lower=Mid;
    else
        Upper=Mid;
    end
    if f(Upper)*f(Mid)<0
        Upper=Mid;
    else
        Lower=Mid;
    end
xnew(i)=Mid;
if abs((xnew(i)-xnew(i-1))/xnew(i))<T
    break
end
end
format long
%str = ['The required root of the equation is: ', num2str(c), ''];
fprintf("The required root of the equation is: %f",num2str(Mid));