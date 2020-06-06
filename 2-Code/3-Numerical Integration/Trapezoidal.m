fprintf("Trapezoidal Rule\n");

eq = input(" Enter the Equation F(x) \n",'s');
f = str2func(['@(x)' eq]);

a = input("Enter the lower limit \n");
b = input("Enter the upper limit \n");

n = input("Enter the number of subintervals\n");
delta_x = (b-a)/n;
calc = 0 ;
temp = a;

for i=0:n
    if (i==0 || i==n)
        calc = calc + f(temp);
        temp = temp + delta_x;
    else
        calc = calc + 2*f(temp);
        temp = temp + delta_x;
    end
end
Ans = (delta_x/2) * calc