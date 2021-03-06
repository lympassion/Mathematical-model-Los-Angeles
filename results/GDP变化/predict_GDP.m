%建立符号变量a(发展系数)和b(灰作用量)
syms a b;
c = [a b]';
A = [4819, 5059, 5226, 5684, 6130, 6693, 7282, 7904, 8649, 9653, 10771, 11915 ...
    13208, 13778, 14484, 15709, 16619, 17304, 18301, 19337, 20140, 21510, 21602 ...
    22289, 22328, 22854, 23763, 24891, 25810, 27741, 28629, 30003, 30913, 31548 ...
    32945, 35004, 37278, 40529, 42444, 43426, 41863, 43594, 46470, 49525, 49157 ...
    52272, 55578, 57538, 59625, 62300, 65094];
n = length(A);

%对原始数列 A 做累加得到数列 B
B = cumsum(A);

%对数列 B 做紧邻均值生成
for i = 2:n
    C(i) = (B(i) + B(i - 1))/2; 
end
C(1) = [];

%构造数据矩阵 
B = [-C;ones(1,n-1)];
Y = A; Y(1) = []; Y = Y';

%使用最小二乘法计算参数 a(发展系数)和b(灰作用量)
c = inv(B*B')*B*Y;
c = c';
a = c(1); b = c(2);

%预测后续数据
F = []; F(1) = A(1);
for i = 2:(n+5)
    F(i) = (A(1)-b/a)/exp(a*(i-1))+ b/a;
end

%对数列 F 累减还原,得到预测出的数据
G = []; G(1) = A(1);
for i = 2:(n+5)
    G(i) = F(i) - F(i-1); %得到预测出来的数据
end

disp('The forecast data is;');
G

%模型检验
H = G(1:51);
%计算残差序列
epsilon = A - H;

% 计算相对误差序列
delta = abs(epsilon./A);
% 计算相对误差Q
disp('Relative residual Q test：')
Q = mean(delta)

%绘制曲线图
t1 = 1969:2019;
t2 = 1969:2024;

plot(t1, A,'ro'); hold on;
plot(t2, G, 'g-');
xlabel('year'); ylabel('Income/USD');
legend('actual income','forecast income','Location','northwest');
title('Los Angeles annual income per capita');
grid on;