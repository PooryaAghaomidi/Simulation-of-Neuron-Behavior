% Poorya Aghaomidi
% 9961391001
% Question_1 , Function_1
% Goal : calculate sample differential equation

function f = ode_euler(func, x, f_o)
% function arguments : x and f_o
% x   : a vector that specifies the time points that the f should be approximated for
% f_o : the initial condition
% f   : representing the approximate solution to the differential equation with f(0)=f_o

delta_x=x(2)-x(1);
% delta_x : as the difference between successive x values

l_x=length(x);
% Determine how many points we need to approximate by finding the length of vector x

f=zeros(1, l_x);
% Initialize f by creating a vector of the right length
% We will reset the elements to the correct values in the for loop below

f(1)=f_o;
% Set the initial value of f to f_o

%Use a for-loop to implement Equation :
for i = 1:(l_x-1)
f(i+1) = f(i) + delta_x * feval(func,x(i));
end

