
options.MaxIter=100000;

trainingB1= csvread('C:\Program Files (x86)\Baseline1_Training.csv',1,1);

training_label=csvread('C:\Users\Rachita\Desktop\Training_Label.txt');

model=svmtrain(trainingB1, training_label,'Options',options);

testing_B1=csvread('C:\Program Files (x86)\Baseline1_Testing(1).csv',1,1);

label=svmclassify(model, testing_B1);

trainingB11= csvread('C:\Program Files (x86)\Baseline1_Training.csv',1,1,[1 1 540 3171]);

testingB11= csvread('C:\Program Files (x86)\Baseline1_Training.csv',541,1,[541 1 600 3171]);

training_labelB11=csvread('C:\Users\Rachita\Desktop\Training_Label.txt', 0,0,[0 0 539 0]);

modelB11=svmtrain(trainingB11, training_labelB11,'Options',options);

labelB11=svmclassify(modelB11, testingB11);

labelAcurracy= csvread('C:\Users\Rachita\Desktop\Training_Label.txt', 540,0,[540 0 599 0]);

match= intersect(labelB11,labelAcurracy);

value=labelB11==labelAcurracy;

count=sum(value==1);


