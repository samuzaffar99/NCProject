eq = input(" Enter the Equation \n",'s');
f = str2func(['@(t,y)' eq]);

s = input("Enter the start of the range\n");
e = input("Enter the end of the range\n");

h = input("Enter the value of h\n");
i = input("Enter the initial value of y\n");
yprev = i;

for t=s:h:e-h
    y0 = yprev;
    y = y0 + (h/4)*(f(t,y0)+3*f(t+(2*h/3),y0+((2*h/3)*f(t+(h/3),y0+(h/3)*f(t,y0)))))
    yprev = y;
end