% FMFS特征选择
% 数据源，tfidf数据和标签
train_data = csvread('E:\DataProcess\text\特征选择\TextWordVector.csv');
train_target = csvread('E:\DataProcess\text\特征选择\TagVector.csv');

FAST_MI = wordfilter(train_data, train_target);

[~, numfea]=size(train_data);

outfile = 'E:\DataProcess\text\fmfsall.csv';
fid = fopen(outfile, 'w');
for i = 1 : numfea
    fprintf(fid, '%d', FAST_MI(1, i));
    fprintf(fid, '\r\n');
end