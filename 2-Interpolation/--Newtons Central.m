n = input("Enter the degree of interpolating polynomials \n");

for i=1:n+1
    promptx = sprintf("Enter the value for x(%d) \n",i-1);
    x(i) = input(promptx);
    prompty = sprintf("Enter the value for y(%d) \n",i-1);
    y(i) = input(prompty);
end
c = input("Enter the value for x to interpolate \n");
