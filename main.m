clear;
clc;
n = input('Please input the value of n (n>0):');
a = zeros(1,n);
for k = 1:n
    a(1,2*k+1) = (-1)^k / factorial(2*k+1);
end
p = fliplr(a);
A = zeros(1,2*k+2);
for i = 1:(2*k)
    A(1,i) = p(1,i);
end
[x,y] = size(A);
A(1,y-1) = 1;
solution_temp = roots(A);
imaginary = imag(solution_temp);
[x1,y1] = size(imaginary);

for n = 1:x1
    if imaginary(n,1) ~= 0
        solution_temp(n,1) = 0;
    end
end

[e,f] = size(solution_temp);
if solution_temp == zeros(e,1);
    disp('The number of irregular roots is 0.');
    disp('The number of regular roots is 1, the regular roots is 0.');
else
m = 1;
for z = 1:e
    if solution_temp(z,1) ~= 0
        Non_zero = z;
        v(1,m) = Non_zero;
        m = m + 1;
    end
end

[m1,n1] = size(v);
solution = zeros(n1+1,1);
for j = 1:n1
    h = v(1,j);
    solution(j,1) = solution_temp(h,1);
end

[x2,y2] = size(solution);
IRRE = 0;
RE = 0;
r = 1;
s = 1;
for i=1:x2
    if abs(sin(solution(i))) > sin(0.1)
        IRRE = IRRE + 1;
        irregular(r,1) = solution(i);
        r = r + 1;
    else
        RE = RE + 1;
        regular(s,1) = solution(i);
        s = s + 1;
    end
end

if IRRE ~= 0 && RE ~=0
    disp(['The number of irregular roots is ' num2str(IRRE) ', the irregular roots are ' num2str(irregular') '.']);
    disp(['The number of regular roots is ' num2str(RE) ', the irregular roots are ' num2str(regular') '.']);
else if IRRE == 0
    disp('The number of irregular roots is 0.');
    disp(['The number of regular roots is ' num2str(RE) ', the irregular roots are ' num2str(regular') '.']);
    end
end
end
