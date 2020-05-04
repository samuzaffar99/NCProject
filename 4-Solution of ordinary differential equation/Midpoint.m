eq = input(" Enter the Equation \n",'s');
f = str2func(['@(t,y)' eq]);

s = input("Enter the start of the range\n");
e = input("Enter the end of the range\n");

h = input("Enter the value of h\n");
i = input("Enter the initial value of y\n");
yprev = i;

for t=s:h:e-h
    y0 = yprev;
    y = y0 + h*f(t+(h/2),y0+((h/2)*f(t,y0)))
    yprev = y;
end