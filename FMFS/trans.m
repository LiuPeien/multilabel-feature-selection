function [train, target]=trans(train_data,train_target,numB)
[m,n]=size(train_data);
target=train_target;
train=[];
for i=1:n
    res=dis_efi( train_data(:,i), numB );
    train=[train res];
end
index=find(target==-1);
target(index)=0;