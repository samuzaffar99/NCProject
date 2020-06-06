fprintf("Heun's Method\n");

eq = input(" Enter the Equation \n",'s');
eq2 = input(" Enter the Equation for the actual solution \n",'s');
f = str2func(['@(t,y)' eq]);
f2 = str2func(['@(t,y)' eq2]);


s = input("Enter the start of the range\n");
e = input("Enter the end of the range\n");

h = input("Enter the value of h\n");
i = input("Enter the initial value of y\n");
yprev = i;
clc
fprintf('t \t\t\t\t Heun \t\t\t y(t) \t\t\t Error\n');
for t=s:h:e-h
    y0 = yprev;
    y = y0 + (h/4)*(f(t,y0)+3*f(t+(2*h/3),y0+((2*h/3)*f(t+(h/3),y0+(h/3)*f(t,y0)))));
    yprev = y;
    y2 = f2(t+h,y0);
    error = abs(y2-y);
    fprintf('%f \t\t %f \t\t %f \t\t %f\n',t+h,y,y2,error);
end