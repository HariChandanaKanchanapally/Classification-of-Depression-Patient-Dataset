testSampath= csvread('C:\Users\Rachita\Desktop\Sampath.txt');

% testOurs= csvread('C:\Users\Rachita\Desktop\Ours.txt');

% testOurs=csvread('C:\Users\Rachita\Desktop\Satyasi-1207644252 (1).txt');

testOurs=csvread('C:\Users\Rachita\Desktop\NormalTop.txt');

valueTest=testSampath==testOurs;

countTest=sum(valueTest==1);