%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Script that reads the data that was taken at the lab with the arduino
%   and without it, and plot it with matlab funtions.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
clc
close all
load('data.mat');
%% The variables that are listed below, were colected and saved in a previous
%%execution of this script.

%excel_doc='wp3_11_excel.xlsx';
%data = xlsread(excel_doc);
%p_kPa=data(:,3)';
%V_withoutArd=data(:,4)';
%V_withArdV=data(:,6)';
%%

%%The graph
plot(p_kPa,V_withoutArd,p_kPa,V_withArdV)
title('Voltage as a function of Pressure');
ylabel('Voltage (V)')
xlabel('Pressure (kPa)')

grid on
hold on

p=polyfit(p_kPa,V_withoutArd,1);
pp=polyval(p,p_kPa);
plot(p_kPa,pp)

hold on
%%Linearity error
linErr=pp-V_withoutArd;
plot (p_kPa,linErr)

legend('without Arduino','with Arduino','Trend Line','Linearity Error')
