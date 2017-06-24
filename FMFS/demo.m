train_data = loadCSV('E:\DataProcess\python\train_data.csv');
train_target = loadCSV('E:\DataProcess\python\train_target.csv');
[numsam, numfea]=size(train_data);
numlabel=size(train_target,2);
[train, target]=trans(train_data,train_target,2);
[res,time] = fimf( train, target, numfea, numlabel);
emotion_FAST_MI=res(:,1)';


%%%%%%%%%%%%%%%%%%分类精度%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Num=10;Smooth=1;
%n=length(emotion_FAST_MI);
%for i=1:n
 %    f=emotion_FAST_MI(1:i);
  %   [Prior,PriorN,Cond,CondN]=MLKNN_train(train_data(:,f),train_target,Num,Smooth);
   %  [HammingLoss,RankingLoss,OneError,Coverage,Average_Precision,Outputs,Pre_Labels]=MLKNN_test(train_data(:,f),train_target,test_data(:,f),test_target,Num,Prior,PriorN,Cond,CondN);
    % HL_FAST_MI(i)=HammingLoss;
     %RL_FAST_MI(i)=RankingLoss;
     %OE_FAST_MI(i)=OneError;
     %CV_FAST_MI(i)=Coverage;
     %AP_FAST_MI(i)=Average_Precision;
 %end

