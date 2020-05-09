function jacobi(A, b, N) 
%function Jacobi with 3 Params A, b from Ax=b & N is the number of iterations
test=all((2*abs(diag(A)))- sum(abs(A),2)>=0);  %1st check of Diagonal Dominance
if test==0
    A([1 2],:) = A([2 1],:);    %Elementary Row Transformation of A
    b([1 2]) = b([2 1]);     %Elementary Row Transformation of b
end

test=all((2*abs(diag(A)))- sum(abs(A),2)>=0); 
%2nd check of Diagonal Dominance after 1st exchange

if test==0
    A([2 1],:) = A([1 2],:); %if test=0 then switch back to original A
    b([2 1]) = b([1 2]);
    A([1 3],:) = A([3 1],:); %Elementary Row Transformation of A   
    b([1 3]) = b([3 1]); %Elementary Row Transformation of b
end
d=diag(A); %Extracting the diagonal Element of A
D=diag(d); %Making the diagonal matrix D from extracted diagonal elements
D_inv=1/D; %inverse of a diagonal matrix is simply 1/D
E=A-D; %Calculating Remainder Matrix
x=rand(3,1); %Initializing the vector 'x' with a random initial value
T=-D_inv*E;
C=D_inv*b;

for j=1:N %performing Jacobi Iterations for 'N' times
    x=T*x+C;
end
disp(x) %Display of result