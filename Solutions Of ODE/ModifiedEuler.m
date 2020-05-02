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
    k2 = h*f(t+h,y0+k1);
    y = y0 + 0.5*(k1+k2)
    yprev = y;
end

    
