
A = load('Results\Core_In_TempA1.mat');
B = load('Results\Core_Out_TempA1.mat');
C = load('Results\Total_Power1.mat');
D = load('Results\Fuel_FB1.mat'); 

M = load('Results\Core_In_TempA2.mat');
N = load('Results\Core_Out_TempA2.mat');
P = load('Results\Total_Power2.mat');
Q = load('Results\Fuel_FB2.mat');

AA = load('Results\Core_In_TempA.mat');
BB = load('Results\Core_Out_TempA.mat');
CC = load('Results\Total_Power.mat');
DD = load('Results\Fuel_FB.mat');

x0=10;
y0=10;
width=1100;
height=1050;

plottime = 200;
starttime = 2000;

%starttime = 2000; %Time removed from  start of data (s)
%plottime = 200; %plotted time (s)

xxx = tiledlayout(3,1,'TileSpacing','Compact','Padding','Compact');

% Power
nexttile
%subplot(3,1,2);
set(gcf, 'position',[x0,y0,width,height]);
time_tp1 = C.Total_Power(1,:)-starttime;
data_tp1 = C.Total_Power(2,:)*557;
plot(time_tp1, data_tp1, 'color', '#9E00BF', 'linewidth', 1.5);
hold on
time_tp2 = P.Total_Power(1,:)-starttime;
data_tp2 = P.Total_Power(2,:)*557;
plot(time_tp2, data_tp2, '--', 'color', '#BF9E00', 'linewidth', 1.5);
hold on
time_tp3 = CC.Total_Power(1,:)-starttime;
data_tp3 = CC.Total_Power(2,:)*557;
plot(time_tp3, data_tp3, 'color', '#00BF9E', 'linewidth', 1.5);
hold on
title('Reactor Power')
%lgd = legend('10 sec', '30 sec', '50 sec');
%lgd = legend('Benchmark 1', 'Benchmark 2', 'Benchmark 3');
lgd = legend('-30%', 'Nominal', '+30%');
xlim([-15 plottime]);
%ylim([-1 600]);
xlabel('Time (sec)');
ylabel('Power (MW_{th})');
grid on

% Primary Temperature
%subplot(3,1,1);
nexttile
% set(gcf, 'position',[x0,y0,width,height]);

time_out1 = B.Temp_OutA(1,:)-starttime;
data_out1 = B.Temp_OutA(2,:);
plot(time_out1, data_out1, 'color', '#9E00BF', 'linewidth', 1.5); %pink-#ED04FB'
hold on
time_out2 = N.Temp_OutA(1,:)-starttime;
data_out2 = N.Temp_OutA(2,:);
plot(time_out2, data_out2, 'color', '#BF9E00', 'linewidth', 1.5); %orange
% hold on
time_out3 = BB.Temp_OutA(1,:)-starttime;
data_out3 = BB.Temp_OutA(2,:);
plot(time_out3, data_out3, 'color', '#00BF9E', 'linewidth', 1.5); %lime green
hold on
time_in1 = A.TempA(1,:)-starttime;
data_in1 = A.TempA(2,:);
plot(time_in1, data_in1, '--', 'color', '#9E00BF', 'linewidth', 1.5);
hold on
time_in2 = M.TempA(1,:)-starttime;
data_in2 = M.TempA(2,:);
plot(time_in2, data_in2, '--', 'color', '#BF9E00', 'linewidth', 1.5);
hold on
time_in3 = AA.TempA(1,:)-starttime;
data_in3 = AA.TempA(2,:);
plot(time_in3, data_in3, '--', 'color', '#00BF9E', 'linewidth', 1.5);
title('Core Temperature')
%lgd = legend('10 sec Outlet', '30 sec Outlet', '50 sec Outlet', '10 sec Inlet', '30 sec Inlet', '50 sec Inlet');
lgd = legend('-30% Outlet', 'Nominal Outlet', '+30% Outlet', '-30% Inlet', 'Nominal Inlet', '+30% Inlet');
%lgd = legend('Benchmark 1 Outlet', 'Benchmark 2 Outlet', 'Benchmark 3 Outlet', 'Benchmark 1 Inlet', 'Benchmark 2 Inlet', 'Benchmark 3 Inlet');
xlim([-15 plottime]);
%ylim([580 770]);
xlabel('Time (sec)');
ylabel('Temperature ({\circ}C)');
grid on

% Feedback
F_fb1 = ((D.Fuel_FB(2,:))*10^5)+0.481;
F_fb2 = ((Q.Fuel_FB(2,:))*10^5)+0.481;
F_fb3 = ((DD.Fuel_FB(2,:))*10^5)+0.481;
%subplot(3,1,3);
nexttile
% set(gcf, 'position',[x0,y0,width,height]);
time_Ffb1 = D.Fuel_FB(1,:)-starttime;
plot(time_Ffb1, F_fb1, 'color', '#9E00BF', 'linewidth', 1.5);
hold on
time_Ffb2 = Q.Fuel_FB(1,:)-starttime;
plot(time_Ffb2, F_fb2, '--', 'color', '#BF9E00', 'linewidth', 1.5);
hold on
time_Ffb1 = DD.Fuel_FB(1,:)-starttime;
plot(time_Ffb1, F_fb3, 'color', '#00BF9E', 'linewidth', 1.5);
%hold on
title('Reactivity Feedback from Temperature')
%lgd = legend('10 sec', '30 sec', '50 sec');
%lgd = legend('Benchmark 1', 'Benchmark 2', 'Benchmark 3');
lgd = legend('-30%', 'Nominal', '+30%');
xlim([-15 plottime]);
xlabel('Time (sec)');
ylabel('Reactivity (pcm)');
grid on

fontsize(gcf,scale=2)
set(gca,'LooseInset',get(gca,'TightInset'));




%sgtitle('ULOF-Pertubation of the Temperature Feedback Coefficient of the Fuel Salt')

%sgtitle('Cold Slug-Pertubation of the Mean Generation Time')
%sgtitle('Changing Slug Duration') 

% t=data_out1(:, 48400:483900);
% v=data_out2(:, 48400:483900);
% w=data_out3(:, 48400:483900);
% MAXOUT1=max(t);
% MAXOUT2=max(v);
% MAXOUT3=max(w);
% 
% q=data_in1(:, 48400:483900);
% r=data_in2(:, 48400:483900);
% s=data_in3(:, 48400:483900);
% MAXIN1=max(q);
% MAXIN2=max(r);
% MAXIN3=max(s);
% MININ1=min(q);
% MININ2=min(r);
% MININ3=min(s);
% 
% x=data_tp1(:, 48400:483900);
% y=data_tp2(:, 48400:483900);
% z=data_tp3(:, 48400:483900);
% MAXP1=max(x);
% MAXP2=max(y);
% MAXP3=max(z);
% MINP1=min(x);
% MINP2=min(y);
% MINP3=min(z);
% 
% a=F_fb1(:, 48400:483900);
% b=F_fb2(:, 48400:483900);
% c=F_fb3(:, 48400:483900);
% MAXREACT1=max(a);
% MAXREACT2=max(b);
% MAXREACT3=max(c);
% MINREACT1=min(a);
% MINREACT2=min(b);
% MINREACT3=min(c);
% 
