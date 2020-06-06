n = input(" Enter the number of data sets(values) \n");
k= n;
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
u = (val-x(n))/h;
A = y(n);
temp = u;
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
    k = k-1;
    A = A + ((delta_y{k,i}*u)/factorial(i));
    u = u * (temp+i);
end
clc
T2 = (cell2table(delta_y));    
T = (array2table([x(:) y(:)],...
    'VariableNames',{'x','f(x)'}));
Table=[T T2]
fprintf("The estimated result for the interpolation is %f\n",A);
    