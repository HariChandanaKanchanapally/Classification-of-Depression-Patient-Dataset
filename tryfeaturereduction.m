trainActual=[0 0; 0 2; 3 5;0 4; 1 5; 2 0; 0 0; 3 0;3 0;7 0];
testActual = [0 0; 0 2; 3 5;0 4; 1 5; 2 0; 0 0; 3 0;3 0;7 0];

sumtrain=zeros(2);
 sumtest=zeros(2);
for i=1:2
  
    for j=1:10
       
            sumtrain(i)=sumtrain(i)+trainActual(j,i);
            sumtest(i)=sumtest(i)+testActual(j,i);
        
    end
    
end
for i=1:2
    for j=1:10
        trainActual(j,i)=trainActual(j,i)/sumtrain(i,1);
    testActual(j,i)=testActual(j,i)/sumtest(i,1);
    end
end

% for i= 1:2
%      for j=1:10
%          count=0;
%          for k=j:10 
%         if(trainActual(k,i) == trainActual(j,i))
%             
%             count=count+1;
%             
%             if(count>=5)
%         
%                 
%            trainActual(:,i)=0;
%             testActual(:,i)=0;
% 
% 
%                 break;
%             end
%             
%         end
%          end
%         if(count>=5)
%                 break;
%         end
%      end
%     
% end
% testActualtemp=testActual;
% trainActualtemp=trainActual;
% trainActual( :, ~any(trainActualtemp,1) & ~any(testActualtemp,1)) = [];  %columns
% %data1( ~any(datatemp,2) & ~any(data1temp,2), : )  = [] ;  %rows
% testActual( :, ~any(trainActualtemp,1) & ~any(testActualtemp,1)) = [];  %columns
% 
