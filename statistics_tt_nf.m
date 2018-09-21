clear;
clc;

%% Read Data

file_folder = "../output/two_tranches2/";
file_prefix = ["noshock_", "oneshock_", "twoshocks_"];

data_all = [];

for junior = 0:0.05:1
    for i = 1:3
        load(file_folder+num2str(junior)+"_"+file_prefix(i)+"syscoco.mat");
        data = [sum(equity_l<=0, 2), ...
                sum(equity_l(:, 1:5)<=0, 2), ...
                sum(equity_l(:, 6:end)<=0, 2)];
        
        data(:, 4:7) = 0;
        
        data(:, i+3) = 1;
        data(:, 7) = round(junior*100);
        
        data_all = [data_all; data];
    end
end

%% Statistics

data_base_0 = data_all(data_all(:, 7)==0, :);
data_base_1 = data_all(data_all(:, 7)==100, :);
sta_all = [];
n = 1;
for junior = 0:0.05:1
    sta = [];
    data = data_all(data_all(:, 7)==round(junior*100), :);
    for i = 2:3
        data_1 = data_base_1((data_base_1(:, 4)==1), 1);
        data_2 = data((data(:, 4)==1), 1);
        data_3 = data_base_1((data_base_1(:, 3+i)==1), 1);
        data_4 = data((data(:, 3+i)==1), 1);
        did = - mean(data_4) + mean(data_3) + mean(data_2) - mean(data_1);
        sta = [sta, did];
    end
    sta_all(n, :) = sta;
    n = n + 1;
end

%% Plot

x = 0:0.05:1;
figure;
plot(x, sta_all(:, 1));
figure;
plot(x, sta_all(:, 2));
