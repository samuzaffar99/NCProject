eq = input(" Enter the Equation \n",'s');
f = str2func(['@(t,y)' eq]);

s = input("Enter the start of the range\n");
e = input("Enter the end of the range\n");

h = input("Enter the value of h\n");
i = input("Enter the initial value of y\n");
yprev = i;

for t=s:h:e-h
    y0 = yprev;
    k1 = h*f(t,y0);
    k2 = h*f(t+(h/2),y0+(k1/2));
    k3 = h*f(t+(h/2),y0+(k2/2));
    k4 = h*f(t+h,y0+k3);
    y = y0 + (1/6)*(k1+(2*k2)+(2*k3)+k4)
    yprev = y;
end
