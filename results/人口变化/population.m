function g=population(x,t) % logistic
g=x(1)./(1+(x(1)/7041.982-1)*exp(-x(2)*t)) ; 
% x(1)Ϊ����˿�����xm, x(2)Ϊ������r