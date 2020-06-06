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

c = input("Enter the value for x to interpolate \n");
