% Poorya Aghaomidi
% 9961391001
% Question_6 , Function_2
% Goal : calculate the derivative of n at the point t given that the membrane potential is V

function n = ode_euler_modified(nprime, t, f_o, V)
% function arguments : t and n_o and V
% t   : a vector that specifies the time points that the n should be approximated for
% f_o : the initial condition
% V   : membrane potential
% n   : representing the approximate solution to the differential equation with n(0)=n_o

delta_t=t(2)-t(1);
% delta_t : as the difference between successive t values

l_t=length(t);
% Determine how much time we need to approximate by finding the length of vector t

n=zeros(1, l_t);
% Initialize n by creating a vector of the right length
% We will reset the elements to the correct values in the for loop below

n(1)=f_o;
% Set the initial value of n to n_o

%Use a for-loop to implement Equation :
for i = 1:(l_t-1)
n(i+1) = n(i) + delta_t * feval(nprime ,t(i) ,f_o ,V);
end;

