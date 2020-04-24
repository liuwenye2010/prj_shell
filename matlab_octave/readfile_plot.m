#clean up 
clc 
clear 
#load the data1.dat data2.dat 
for i=1:2
file_prefix = "data" ; 
file_suffix = ".dat" ;
file_idx  = num2str(i); 
file_name = [file_prefix, file_idx, file_suffix]
load(file_name);
end 

#plot the data1 line and data2 line  on one figure 
figure 1
plot (data1(4,:),data1(5,:)); 
hold on 
plot (data2(4,:),data2(5,:)); 
hold off 
title ("example of load data and plot"); 