function [Ep,y_0,z_0] = dengzhixian3z(np,m1,m2)
% function Ep = dengzhixian3(np)
D = 8;
a = 1.5;%集鱼灯距舷边距离
b = 5;%船尾第1个灯距船尾距离
h = 10;%集鱼灯距离海面高度
d = 0.7;%灯间距
m = 1;%第i个集鱼灯
n = 1.33;
miu = 0.2;
y_1i = D/2;
z_1i = 0;
dl = 0.5;
x_1n = [];%灯
%表示多个集鱼灯
for m = m1:1:m2
    x_1n = [x_1n,b+d*(m-1)];
end

load('D:\PycharmProjects\\flaskProject\LED_21_10_18blue_cd_Table.mat')
A = LED_21_10_18blue_cd_Table;
theta_11 = A(40:160,1)/180*pi;
Itheta_11 = A(40:160,2);   %C0/180
gama = asin(sin(theta_11)/n);
%% 原始p1点
xp = [];
 %np代表水面上第np个Pi点,xp表示一系列Pi坐标值
xp = 5+d*19*1/2+(np-1)*dl;
% for npz = 1:1:np
%     xp = [xp,5*(1+(npz-1)*dl)];     
% end
yp = tan(theta_11)*h+y_1i;
% yp = tan(theta_11)*h;
zp = h;
x_0 = xp;

%%

R = h./cos(theta_11(1,1));
% Epz1 = Itheta_11./R.^2*cos(0);
beta_theta1i = 1-0.5.*((tan(theta_11-gama)).^2./(tan(theta_11+gama)).^2+(sin(theta_11-gama)).^2./(sin(theta_11+gama)).^2);%光能折射比
% x_1n = b:d:b+d*(7-1);%不同灯间距
Rn = [];
alphan = [];
Epzn = [];
for jn =1:length(x_1n)
    alpha1 = atan(abs(x_1n(jn)-xp)./R);
    alphan = [alphan,alpha1];
end
for jn =2:length(x_1n)
    Rn = [R,R./cos(alphan(2:end))];
end
kn = [];
for jn =1:length(x_1n)
    [j2,k2] = min(abs(A(1,:)-alphan(jn)./pi.*180));
    kn = [kn,k2];
    Itheta_1n = A(40:160,kn);
    
    Epzn = Itheta_1n(1:end,jn)./Rn.^2.*cos(alphan); 
end
%%
Ep = sum(Epzn,2);   %一个P点的水面照度值
Epf = Ep.*beta_theta1i;
%%

syms  y_0 z_0
R_0 = z_0./cos(gama);
beta = atan((np-1)*dl./R_0);
% f2 = Epf.*exp(-miu.*R_0./cos(beta)).*cos(gama)-0.1;
f2 = Epf.*exp(-miu.*R_0).*cos(gama)-0.1;
z_0 = [];
for n = 1:1:length(theta_11)
    z_01 = solve(f2(n));
    z_01 = double(z_01);
    z_0 = [z_0;z_01];
end
f1 = (y_0-yp)./(z_0-zp)-tan(gama);
y_0 = [];
for n = 1:1:length(theta_11)
    y_01 = solve(f1(n));
    y_01 = double(y_01);
    y_0 = [y_0;y_01];
end

% z_0 = z_0+h;


