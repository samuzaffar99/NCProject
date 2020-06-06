fprintf("Lagrange Interpolation\n");

n = input("Enter the degree of interpolating polynomials \n");

for i=1:n+1
    promptx = sprintf("Enter the value for x(%d) \n",i-1);
    x(i) = input(promptx);
    prompty = sprintf("Enter the value for y(%d) \n",i-1);
    y(i) = input(prompty);
end
c = input("Enter the value for x to interpolate \n");
calc1 = 1;
calc2 = 1;
Answer = 0; 
index = 1;
for i=1:n+1
    for j=1:n+1
        if(index~=i)
            calc1 = calc1 * (c - x(index))
            calc2 = calc2 * (x(i) - x(index))
            index = index + 1;
        else
            index = index + 1;
        end
    end
    index = 1; 
    calc3 = (calc1/calc2) * y(i);
    Answer = Answer + calc3;
    calc1= 1;
    calc2 = 1;
end
Answer