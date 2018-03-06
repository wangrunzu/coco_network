clear;
clc;


str = "../output/noshock_";
file_0 = [str+"nococo.mat", str+"syscoco.mat", str+"coco.mat"];

sta_0 = zeros(8, 9);

for i = 1:3
    load(file_0(i));
    ind = [i, i+3, i+6];
    
    data_1 = [sum(equity_l<=0, 2), sum(equity_l(:, 1:5)<=0, 2), sum(equity_l(:, 6:end)<=0, 2)];
    data_2 = [sum(equity_l, 2)./sum(equity_0, 2), sum(equity_l(:, 1:5), 2)./sum(equity_0(:, 1:5), 2), sum(equity_l(:, 6:end), 2)./sum(equity_0(:, 6:end), 2)];
    
    for j = 1:3
        sta_0(1, ind(j)) = mean(data_1(:, j));
        sta_0(2, ind(j)) = std(data_1(:, j));
        sta_0(3, ind(j)) = quantile(data_2(:, j), 0.1);
        sta_0(4, ind(j)) = quantile(data_2(:, j), 0.05);
        sta_0(5, ind(j)) = quantile(data_2(:, j), 0.01);
        sta_0(6, ind(j)) = quantile(data_2(:, j), 0.5) - quantile(data_2(:, j), 0.1);
        sta_0(7, ind(j)) = quantile(data_2(:, j), 0.5) - quantile(data_2(:, j), 0.05);
        sta_0(8, ind(j)) = quantile(data_2(:, j), 0.5) - quantile(data_2(:, j), 0.01);
    end
end

str = "../output/oneshock_";
file_1 = [str+"nococo.mat", str+"syscoco.mat", str+"coco.mat"];

sta_1 = zeros(8, 9);

for i = 1:3
    load(file_1(i));
    ind = [i, i+3, i+6];
    
    data_1 = [sum(equity_l<=0, 2), sum(equity_l(:, 1:5)<=0, 2), sum(equity_l(:, 6:end)<=0, 2)];
    data_2 = [sum(equity_l, 2)./sum(equity_0, 2), sum(equity_l(:, 1:5), 2)./sum(equity_0(:, 1:5), 2), sum(equity_l(:, 6:end), 2)./sum(equity_0(:, 6:end), 2)];
    
    for j = 1:3
        sta_1(1, ind(j)) = mean(data_1(:, j));
        sta_1(2, ind(j)) = std(data_1(:, j));
        sta_1(3, ind(j)) = quantile(data_2(:, j), 0.1);
        sta_1(4, ind(j)) = quantile(data_2(:, j), 0.05);
        sta_1(5, ind(j)) = quantile(data_2(:, j), 0.01);
        sta_1(6, ind(j)) = quantile(data_2(:, j), 0.5) - quantile(data_2(:, j), 0.1);
        sta_1(7, ind(j)) = quantile(data_2(:, j), 0.5) - quantile(data_2(:, j), 0.05);
        sta_1(8, ind(j)) = quantile(data_2(:, j), 0.5) - quantile(data_2(:, j), 0.01);
    end
end

sta = sta_1 - sta_0;
sta(2, :) = [];