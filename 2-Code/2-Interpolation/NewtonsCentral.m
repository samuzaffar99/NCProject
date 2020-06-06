fprintf("Central Divided Difference\n");

n = input(" Enter the number of data sets(values) \n");
k = n;
delta_y = cell(n,n-1);
for i=1:n
    for j=1:n-1
        delta_y{i,j}=0;  
    end
end    
for i=1:n
	promptx = sprintf("Enter the value for x(%d) \n",i-1);
    x(i) = input(promptx);
    prompty = sprintf("Enter the value for y(%d) \n",i-1);
    y(i) = input(prompty);
end

val= input(" Enter the value to estimate result\n");
h = x(2)-x(1);
y0=(n+1)/2;
t0 = y0;
t1 = y0;
f0 = 0;
f1 = 0;
u1 = (val-x(y0))/h;
u2 = u1;
A = y(y0);
temp1 = u1;
temp2 = u2
for i=1:n-1
    if (i==1)
        for j=1:k-1
            yprev = y(j);
            ynext = y(j+1);
            delta_y{j,i}=ynext-yprev;
        end
    else
        for j=1:k-1
            yprev = delta_y{j,i-1};
            ynext = delta_y{j+1,i-1};
            delta_y{j,i}=ynext-yprev;
        end
    end
    if(mod(i,2)==1)
        GF = ((delta_y{t0,i}*u1)/factorial(i));
        t0 = t0 - 1;
        GB = ((delta_y{t0,i}*u2)/factorial(i));
        f0 = f0 + 1;
        u1 = u1 * (temp1-f0);
        u2 = u2 * (temp1+f0);
    else
        GF = ((delta_y{t0,i}*u1)/factorial(i));
        GB = ((delta_y{t0,i}*u2)/factorial(i));
        f1 = f1 + 1;
        u1 = u1 * (temp1+f1);
        u2 = u2 * (temp1-f1);
    end
    A = A + (GF+GB)/2;
    k = k-1;
end
clc
T2 = (cell2table(delta_y));    
T = (array2table([x(:) y(:)],...
    'VariableNames',{'x','f(x)'}));
Table=[T T2]
fprintf("The estimated result for the interpolation is %f\n",A);