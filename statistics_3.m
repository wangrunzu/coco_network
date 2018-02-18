%clear;
clc;

file_0 = ["sim_noshock_nococo.mat", "sim_noshock_syscoco.mat", "sim_noshock_coco.mat"];

sta_0 = zeros(5, 9);

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
    end
end

% file_1 = ["sim_5_1shock_nococo.mat", "sim_5_1shock_syscoco.mat", "sim_5_1shock_coco.mat"];
file_1 = ["sim_5_2shocks_nococo.mat", "sim_5_2shocks_syscoco.mat", "sim_5_2shocks_coco.mat"];

sta_1 = zeros(5, 9);

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
    end
end

sta = sta_1 - sta_0;
sta(2, :) = [];