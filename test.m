options.MaxIter=100000;

trainingB1= csvread('C:\Program Files (x86)\Baseline1_Training.csv',1,1);

training_label=csvread('C:\Users\Rachita\Desktop\Training_Label.txt');

model=svmtrain(trainingB1, training_label,'Options',options);

testing_B1=csvread('C:\Program Files (x86)\Baseline1_Testing(1).csv',1,1);

label=svmclassify(model, testing_B1);



