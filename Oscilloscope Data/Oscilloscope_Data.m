clear; clc; close all

%% 10x Response Data
% Load oscilloscope data
data10 = readtable("SDS00018_Edited.CSV");

[peak10, tp_index10] = max(data10.Var2);
tp10 = data10.Var1(tp_index10)*-1;
ss_value10 = data10.Var2(end);

M_percent10 = (peak10 - ss_value10)/ss_value10;

R10 = log(100/M_percent10);
zeta10 = R10/sqrt(pi^2 + R10^2);

w_n10 = pi/(tp10*sqrt(1-zeta10^2));
t_s10 = 4/(zeta10*w_n10);

data10.Var1 = -1*data10.Var1;

% Plot oscilloscope data
figure
plot(data10.Var1, data10.Var2);
xlim([data10.Var1(end) data10.Var1(1)])
xlabel('Time (s)')
ylabel('Position Voltage (V)')
title('Pendulum Response')

dim10 = [.79 .8 .1 .1];
str10 = {'Response Characteristics',['M-%: ',num2str(M_percent10,'%02g')], ...
['t_s: ',num2str(t_s10,'%02g')], ['zeta: ',num2str(zeta10,'%02g')], ... 
['w_n: ',num2str(w_n10,'%02g')]};
str10{1} = ['\bf ', str10{1}, ' \rm'];

annotation('textbox',dim10,'String',str10,'FitBoxToText','on');

%% 30x Response Data
% Load oscilloscope data
data30 = readtable("SDS00017_Edited.CSV");

[peak30, tp_index30] = max(data30.Var2);
tp30 = data30.Var1(tp_index30);
ss_value30 = data30.Var2(end);

M_percent30 = (peak30 - ss_value30)/ss_value30;

R30 = log(100/M_percent30);
zeta30 = R30/sqrt(pi^2 + R30^2);

w_n30 = pi/(tp30*sqrt(1-zeta30^2));
t_s30 = 4/(zeta30*w_n30);

% Plot oscilloscope data
figure
plot(data30.Var1, data30.Var2);
xlim([data30.Var1(1) data30.Var1(end)])
xlabel('Time (s)')
ylabel('Position Voltage (V)')
title('Pendulum Response')

dim30 = [.79 .8 .1 .1];
str30 = {'Response Characteristics',['M-%: ',num2str(M_percent30,'%02g')], ...
['t_s: ',num2str(t_s30,'%02g')], ['zeta: ',num2str(zeta30,'%02g')], ... 
['w_n: ',num2str(w_n30,'%02g')]};
str30{1} = ['\bf ', str30{1}, ' \rm'];

annotation('textbox',dim30,'String',str30,'FitBoxToText','on');