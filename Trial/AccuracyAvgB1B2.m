options.MaxIter=100000;

trainAvgB1= csvread('C:\Users\Rachita\Documents\MATLAB\Trial\Baseline1_Training.csv',1,1);
trainAvgB2= csvread('C:\Users\Rachita\Documents\MATLAB\Trial\Baseline2_Training.csv',1,1);

train_labelAvgB1B2=csvread('C:\Users\Rachita\Documents\MATLAB\Training_Label.txt');
trainAvgPart1= trainAvgB1(1:600,1:2416)  ;
trainAvgPart2= trainAvgB2(1:600,1:2416)  ;
trainB1B2Avg = (trainAvgPart1)*0 + (trainAvgPart2)*1;
trainActual = horzcat(trainB1B2Avg,trainAvgB1(1:600,2417:3171),trainAvgB2(1:600,2417:2553));

test_B1Avg=csvread('C:\Users\Rachita\Documents\MATLAB\Trial\Baseline1_Testing(1).csv',1,1);
test_B2Avg=csvread('C:\Users\Rachita\Documents\MATLAB\Trial\Baseline2_Testing.csv',1,1);
testAvgPart1= test_B1Avg(1:130,1:2416)  ;
testAvgPart2= test_B2Avg(1:130,1:2416)  ;
testB1B2Avg=(testAvgPart1)*0.1+(testAvgPart2)*0.9;
testActual = horzcat(testB1B2Avg,test_B1Avg(1:130,2417:3171),test_B2Avg(1:130,2417:2553));

sumtrain=zeros(3308);
 sumtest=zeros(3308);
for i=1:3308
  
    for j=1:600
       
            sumtrain(i)=sumtrain(i)+trainActual(j,i);
%            sumtest(i)=sumtest(i)+testActual(j,i);
        
    end
    
end
for i=1:3308
  
    for j=1:130
       
%             sumtrain(i)=sumtrain(i)+trainActual(j,i);
           sumtest(i)=sumtest(i)+testActual(j,i);
        
    end
    
end
for i=1:3308
    for j=1:600
        trainActual(j,i)=trainActual(j,i)/sumtrain(i,1);
%     testActual(j,i)=testActual(j,i)/sumtest(i,1);
    end
end

for i=1:3308
    for j=1:130
%         trainActual(j,i)=trainActual(j,i)/sumtrain(i,1);
     testActual(j,i)=testActual(j,i)/sumtest(i,1);
    end
end

i = 1;
j = 1;

% for i= 1:3308
%      for j=2:600
%          count=0;
%         if(trainActual(i:j)==trainActual(i:(j+1)))
%             count=count+1;
%             if(count>=500)
%                 trainActual(:,i)=[];
%                 testActual(:,i)=[];
%                 break;
%             end
%         end
%     end
% end

for i= 1:3308
     for j=1:600
         count=0;
         for k=j:600 
        if(trainActual(k,i) == trainActual(j,i))
            
            count=count+1;
            
            if(count>=500)
        
                
           trainActual(:,i)=0;
            testActual(:,i)=0;


                break;
            end
            
        end
         end
        if(count>=4)
                break;
        end
     end
    
end
testActualtemp=testActual;
trainActualtemp=trainActual;
trainActual( :, ~any(trainActualtemp,1) & ~any(testActualtemp,1)) = [];  %columns
%data1( ~any(datatemp,2) & ~any(data1temp,2), : )  = [] ;  %rows
testActual( :, ~any(trainActualtemp,1) & ~any(testActualtemp,1)) = [];  %columns

% for i=1:601
%     sumtrain=zeros(601);
%     sumtest=zeros(601);
%     for j=1:600
%        
%             sumtrain(i)=sumtrain(i)+trainActual(j,i);
%             sumtest(i)=sumtest(i)+testActual(j,i);
%         
%     end
%     
% end
% for i=1:601
%     for j=1:600
%         trainActual(j,i)=trainActual(j,i)/sumtrain(i);
%     testActual(j,i)=testActual(j,i)/sumtest(i);
%     end
% end

% sumtrain=zeros(601);
%  sumtest=zeros(601);
% for i=1:601
%   
%     for j=1:600
%        
%             sumtrain(i)=sumtrain(i)+trainActual(j,i);
% %            sumtest(i)=sumtest(i)+testActual(j,i);
%         
%     end
%     
% end
% for i=1:601
%   
%     for j=1:130
%        
% %             sumtrain(i)=sumtrain(i)+trainActual(j,i);
%            sumtest(i)=sumtest(i)+testActual(j,i);
%         
%     end
%     
% end
% for i=1:601
%     for j=1:600
%         trainActual(j,i)=trainActual(j,i)/sumtrain(i,1);
% %     testActual(j,i)=testActual(j,i)/sumtest(i,1);
%     end
% end
% 
% for i=1:601
%     for j=1:130
% %         trainActual(j,i)=trainActual(j,i)/sumtrain(i,1);
%      testActual(j,i)=testActual(j,i)/sumtest(i,1);
%     end
% end


modelB1B2Avg=svmtrain(trainActual, train_labelAvgB1B2,'Options',options);
%  modelB1B2Avg=fitctree(trainActual,train_labelAvgB1B2);


labelB1B2Avg=svmclassify(modelB1B2Avg, testActual);

% labelB1B2Avg=predict(modelB1B2Avg,testActual);

%trainAB1B2=
%csvread('C:\Users\Rachita\Documents\MATLAB\trainB1B2.mat',0,0,[0 0 539
%5723]);\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\    