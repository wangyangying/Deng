m1 = 0;  %第一个集鱼灯的起始位置
m2 = 20;  %最后一个集鱼灯
%（m2-m1+1）个集鱼灯
dl = 0.5;
d=2;
Epz = [];
y_0 = [];
z_0 = [];
for pn = 1:2
    [Ep,y_01,z_01] = dengzhixian3z(pn,m1,m2) ;
    Epz = [Epz,Ep];
    y_0 = [y_0,y_01];
    z_0 = [z_0,z_01];
    
end
xp1 = [];
for npz = 1:1:pn
    xp1 = [xp1,5*1+d*19*1/2+(npz-1)*dl];     
end



z_0 = -z_0;


s = surfc(xp1,y_0,z_0);
% axis([-inf,inf,-inf,inf,inf,0])
colormap jet
s(2).Fill = 'off';
s(2).LevelList = linspace(min(min(z_0)), max(max(xp1)), 4);
s(2).LineWidth = 2;
s(1).FaceAlpha = 0.95;
% s(1).FaceColor = 'interp';
s(1).EdgeColor = 'none';
zlabel("水深（m）")
ylabel("离船距离（m）")
xlabel("与船头水平距离（m）")

%%
% s1 = surfc(xp1,yp,Epz);
% axis([-inf,80,-inf,inf,-30,0])
% colormap jet
% s1(2).Fill = 'off';
% s1(2).LevelList = linspace(min(min(z_0)), max(max(xp1)), 4);
% s1(2).LineWidth = 2;
% s1(1).FaceAlpha = 0.95;
% s1(1).FaceColor = 'interp';
% s1(1).EdgeColor = 'none';
% zlabel("照度值（lx）")
% ylabel("离船距离（m）")
% xlabel("与船头水平距离（m）")