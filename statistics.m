clear;
clc;

str = "../output/noshock_";
file = [str+"nococo.mat", str+"syscoco.mat", str+"coco.mat"];

sta = zeros(5, 9);

for i = 1:3
    load(file(i));
    ind = [i, i+3, i+6];
    
    data_1 = [sum(equity_l<=0, 2), sum(equity_l(:, 1:5)<=0, 2), sum(equity_l(:, 6:end)<=0, 2)];
    data_2 = [sum(equity_l, 2)./sum(equity_0, 2), sum(equity_l(:, 1:5), 2)./sum(equity_0(:, 1:5), 2), sum(equity_l(:, 6:end), 2)./sum(equity_0(:, 6:end), 2)];
    
    for j = 1:3
        sta(1, ind(j)) = mean(data_1(:, j));
        sta(2, ind(j)) = std(data_1(:, j));
        sta(3, ind(j)) = quantile(data_2(:, j), 0.5) - quantile(data_2(:, j), 0.1);
        sta(4, ind(j)) = quantile(data_2(:, j), 0.5) - quantile(data_2(:, j), 0.05);
        sta(5, ind(j)) = quantile(data_2(:, j), 0.5) - quantile(data_2(:, j), 0.01);
    end
end