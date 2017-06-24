function [ FAST_MI ] = wordfilter(train_data, train_target)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
    [~, numfea]=size(train_data);
    numlabel=size(train_target,2);
    [train, target]=trans(train_data,train_target,2);
    [res,~] = fimf( train, target, numfea, numlabel);
    FAST_MI=res(:,1)';
end

