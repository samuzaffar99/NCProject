fprintf("Boole's Formula\n");

eq = input(" Enter the Equation F(x) \n",'s');
f = str2func(['@(x)' eq]);

a = input("Enter the lower limit \n");
b = input("Enter the upper limit \n");

n = 4; %Boole's Formula Divides The SubIntervals Into 4
delta_x = (b-a)/n;
x = a;
calc = 0;
for i=0:n
  y = f(x);
  if(i==0 || i==4)
      calc = calc + 7*y;
  elseif (i==1 || i==3)
      calc = calc + 32*y;
  else
      calc = calc + 12*y;
  end
  x = x + delta_x;
end
Ans = (2/45)*delta_x*calc