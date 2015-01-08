data=[0 0 0 0 0 0 0 0; 0 0 2 3 4 0 1 0; 0 0 1 2 3 0 0 0; 0 0 0 0 0 0 0 0];
data1 = [0 0 1 2 3 0 0 0; 0 0 2 3 4 0 1 0;0 1 1 1 1 1 1 1;0 0 0 0 0 0 0 0];
datatemp = data;
data1temp = data1;
%data( ~any(datatemp,2) & ~any(data1temp,2), : )  = [] ;  %rows
data( :, ~any(datatemp,1) & ~any(data1temp,1)) = [];  %columns
%data1( ~any(datatemp,2) & ~any(data1temp,2), : )  = [] ;  %rows
data1( :, ~any(datatemp,1) & ~any(data1temp,1)) = [];  %columns