options.MaxIter=100000;

trainB1= csvread('C:\Program Files (x86)\Baseline1_Training.csv',1,1);
trainB2= csvread('C:\Program Files (x86)\Baseline2_Training.csv',1,1);

train_labelB1B2=csvread('C:\Users\Rachita\Desktop\Training_Label.txt');
trainB1B2= horzcat(trainB1,trainB2) ;

modelB1B2=svmtrain(trainB1B2, train_labelB1B2,'Options',options);

test_B1=csvread('C:\Program Files (x86)\Baseline1_Testing(1).csv',1,1);
test_B2=csvread('C:\Program Files (x86)\Baseline2_Testing.csv',1,1);

testB1B2=horzcat(test_B1,test_B2);

labelB1B2=svmclassify(modelB1B2, testB1B2);

%trainAB1B2= csvread('C:\Users\Rachita\Documents\MATLAB\trainB1B2.mat',0,0,[0 0 539 5723]);
trainAB1B2=trainB1B2(1:540,1:5724);

%testAB1B2= csvread('C:\Users\Rachita\Documents\MATLAB\trainB1B2.mat',540,0,[540 0 539 5723]);
testAB1B2=trainB1B2(541:600,1:5724);

train_labelAB1B2=csvread('C:\Users\Rachita\Desktop\Training_Label.txt', 0,0,[0 0 539 0]);

modelAB1B2=svmtrain(trainAB1B2, train_labelAB1B2,'Options',options);

labelAB1B22=svmclassify(modelAB1B2, testAB1B2);

labelAcurracyAB1B2= csvread('C:\Users\Rachita\Desktop\Training_Label.txt', 540,0,[540 0 599 0]);


valueAB1B2=labelAB1B22==labelAcurracyAB1B2;

countAB1B2=sum(valueAB1B2==1);