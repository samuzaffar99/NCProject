%*************************Eric Douglas*****************************%
%***********************August 30th, 2013**************************%
%This code is used to compute the Jacobi Method of a certain matrix.%
%Input:
%       C_n = convergence criteria value
%       N = number of equations in the matrix
%       Imax = the maximum number of iterations
%Output:
%       S = the solution( M x 1 matrix ; jacobi approximation)
%       j = the number of iterations it took to
%           converge to the user inputed value
%       R = Residual Values

%establishes the variables needed
%B is an M x 1 matrix
%A is an M x M matrix
%P is the initial M x 1 matrix
%Z = remembering matrix

%Ask the user for each input statement required
Imax = input('What do you want the maximum iteration to be? ');
N = input('How many equations do you want? ');
C_n = input('What number do you want to converge to? ');

%Assigns the values inputed by the user into the matrices
for x=1:1:N
    for y=1:1:N
        strA = ['What do you desire your numbers in the matrix to be? ' num2str(x) 'Row: ' num2str(y) 'Column: '];
        A = input(strA);
    end
end

for l=1:1:N
    strB = ('What do you desire the Solution matrix to be? ');
    B = input(strB);
end

n = length(B);
X = zeros(n,1);
e = ones(n,1);

%%Check if the matrix A is diagonally dominant
for i = 1:n
    j = 1:n;
    j(i) = [];
    C = abs(A(i,j));
    Check(i,1) = abs(A(i,i)) - sum(B); % Is the diagonal value greater than the remaining row values combined?
    if Check(i) < 0
        fprintf('The matrix is not strictly diagonally dominant at row %2i\n\n',i)
    end
end