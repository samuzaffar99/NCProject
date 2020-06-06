fprintf("Heun's Method\n");

eq = input(" Enter the Equation \n",'s');
eq2 = input(" Enter the Equation for the actual solution \n",'s');
f = str2func(['@(t,y)' eq]);
f2 = str2func(['@(t,y)' eq2]);

s = input("Enter the start of the range\n");
e = input("Enter the end of the range\n");

h = input("Enter the value of h\n");
i = input("Enter the initial value of y\n");

n = (e-s)/h;
x = zeros(1,n);
y = zeros(1,n);
y2 = zeros(1,n);
error = zeros(1,n);
itr = 1;
yprev = i;
clc
for t=s:h:e-h
    y0 = yprev;
    y(itr) = y0 + (h/4)*(f(t,y0)+3*f(t+(2*h/3),y0+((2*h/3)*f(t+(h/3),y0+(h/3)*f(t,y0)))));
    yprev = y(itr);
    y2(itr) = f2(t+h,y0);
    error(itr) = abs(y2(itr)-y(itr));
    x(itr) = t+h;
    itr = itr + 1;
end
T = (array2table([x(:) y(:) y2(:) error(:)],...
    'VariableNames',{'t','Heun','f(t)','Error'}))