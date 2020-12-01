function g=population(x,t) % logistic
g=x(1)./(1+(x(1)/7041.982-1)*exp(-x(2)*t)) ; 
% x(1)为最大人口数量xm, x(2)为增长率r