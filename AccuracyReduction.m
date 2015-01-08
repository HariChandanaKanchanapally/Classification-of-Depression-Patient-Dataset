options.MaxIter=100000;

trainAvgB1R= csvread('C:\Program Files (x86)\Baseline1_Training.csv',1,1);
trainAvgB2R= csvread('C:\Program Files (x86)\Baseline2_Training.csv',1,1);

train_labelAvgB1B2R=csvread('C:\Users\Rachita\Desktop\Training_Label.txt');
trainAvgPart1R= trainAvgB1R(1:600,1:2416)  ;
trainAvgPart2R= trainAvgB2R(1:600,1:2416)  ;
trainB1B2AvgR = (trainAvgPart1R)*0.1 + (trainAvgPart2R)*0.9;
trainActualR = horzcat(trainB1B2AvgR,trainAvgB1R(1:600,2417:3171),trainAvgB2R(1:600,2417:2553));

test_B1AvgR=csvread('C:\Program Files (x86)\Baseline1_Testing(1).csv',1,1);
test_B2AvgR=csvread('C:\Program Files (x86)\Baseline2_Testing.csv',1,1);
testAvgPart1R= test_B1AvgR(1:130,1:2416)  ;
testAvgPart2R= test_B2AvgR(1:130,1:2416)  ;
testB1B2AvgR=(testAvgPart1R)*0.1+(testAvgPart2R)*0.9;
testActualR = horzcat(testB1B2AvgR,test_B1AvgR(1:130,2417:3171),test_B2AvgR(1:130,2417:2553));

trainActualRtemp = trainActualR;
testActualRtemp = testActualR;
%data( ~any(datatemp,2) & ~any(data1temp,2), : )  = [] ;  %rows
trainActualR( :, ~any(trainActualRtemp,1) & ~any(testActualRtemp,1)) = [];  %columns
%data1( ~any(datatemp,2) & ~any(data1temp,2), : )  = [] ;  %rows
testActualR( :, ~any(trainActualRtemp,1) & ~any(testActualRtemp,1)) = [];  %columns

modelB1B2AvgR=svmtrain(trainActualR, train_labelAvgB1B2R,'Options',options);

labelB1B2AvgR=svmclassify(modelB1B2AvgR, testActualR);

%trainAB1B2= csvread('C:\Users\Rachita\Documents\MATLAB\trainB1B2.mat',0,0,[0 0 539 5723]);
trainAB1B2AvgR=trainActualR(1:540,1:920);

%testAB1B2= csvread('C:\Users\Rachita\Documents\MATLAB\trainB1B2.mat',540,0,[540 0 539 5723]);
testAB1B2AvgR=trainActualR(541:600,1:920);

train_labelAB1B2AvgR=csvread('C:\Users\Rachita\Desktop\Training_Label.txt', 0,0,[0 0 539 0]);

modelAB1B2AvgR=svmtrain(trainAB1B2AvgR, train_labelAB1B2AvgR,'Options',options);

labelAB1B2AvgR=svmclassify(modelAB1B2AvgR, testAB1B2AvgR);

labelAcurracyAB1B2AvgR= csvread('C:\Users\Rachita\Desktop\Training_Label.txt', 540,0,[540 0 599 0]);

valueAB1B2AvgR = labelAB1B2AvgR == labelAcurracyAB1B2AvgR;

countAB1B2AvgR=sum(valueAB1B2AvgR==1);