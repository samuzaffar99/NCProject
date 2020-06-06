fprintf("Midpoint Formula\n");

eq = input(" Enter the Equation F(x) \n",'s');
f = str2func(['@(x)' eq]);

a = input("Enter the lower limit \n");
b = input("Enter the upper limit \n");

n = input("Enter the number of subintervals\n");
delta_x = (b-a)/n;
calc = 0 ;
start = a;
ending = a + delta_x;

for i=0:n-1
    mi = (start+ending)/2;
    calc = calc + delta_x*f(mi);
    start = ending;
    ending = ending + delta_x;
end
calc