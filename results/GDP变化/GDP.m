%建立符号变量a(发展系数)和b(灰作用量)
syms a b;
c = [a b]';

A = [4819, 5059, 5226, 5684, 6130, 6693, 7282, 7904, 8649, 9653, 10771, 11915 ...
    13208, 13778, 14484, 15709, 16619, 17304, 18301, 19337, 20140, 21510, 21602 ...
    22289, 22328, 22854, 23763, 24891, 25810, 27741, 28629, 30003, 30913, 31548 ...
    32945, 35004, 37278, 40529, 42444, 43426, 41863, 43594, 46470, 49525, 49157 ...
    52272, 55578, 57538, 59625, 62300, 65094];
%绘制曲线图
t1 = 1969:2019;

plot(t1, A,'ro'); hold on;

xlabel('year'); ylabel('Income/USD');
legend('actual income');
title('Los Angeles annual income per capita');
grid on;