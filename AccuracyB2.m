
options.MaxIter=100000;

trainingB2= csvread('C:\Program Files (x86)\Baseline2_Training.csv',1,1);

training_labelB2=csvread('C:\Users\Rachita\Desktop\Training_Label.txt');

modelB2=svmtrain(trainingB2, training_labelB2,'Options',options);

testing_B2=csvread('C:\Program Files (x86)\Baseline2_Testing.csv',1,1);

labelb2=svmclassify(modelB2, testing_B2);

trainingB12= csvread('C:\Program Files (x86)\Baseline2_Training.csv',1,1,[1 1 540 2553]);

testingB22= csvread('C:\Program Files (x86)\Baseline2_Training.csv',541,1,[541 1 600 2553]);

training_labelB22=csvread('C:\Users\Rachita\Desktop\Training_Label.txt', 0,0,[0 0 539 0]);

modelB22=svmtrain(trainingB12, training_labelB22,'Options',options);

labelB22=svmclassify(modelB22, testingB22);

labelAcurracyB2= csvread('C:\Users\Rachita\Desktop\Training_Label.txt', 540,0,[540 0 599 0]);


valueB2=labelB22==labelAcurracyB2;

countB2=sum(valueB2==1);


