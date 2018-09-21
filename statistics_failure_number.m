clear;
clc;

%% Read Data

file_folder = "../output/coco_triggers/";
file_prefix = ["noshock_", "oneshock_", "twoshocks_"];
file = ["nococo.mat", "coco.mat", "syscoco.mat"];

data_all = [];

for sct = 0.2:0.05:0.6
    for ict = 0.2:0.05:0.6
        for i = 1:3
            for j = 1:3
                load(file_folder+num2str(sct)+"_"+num2str(ict)+"_"+file_prefix(i)+file(j));
                data = [sum(equity_l<=0, 2), ...
                        sum(equity_l(:, 1:5)<=0, 2), ...
                        sum(equity_l(:, 6:end)<=0, 2)];

                data(:, 4:10) = 0;

                data(:, i+3) = 1;
                data(:, j+6) = 1;
                data(:, 10) = round(sct*100);
                data(:, 11) = round(ict*100);

                data_all = [data_all; data];
            end
        end
    end
end

%% Statistics

d = [7, 8; 7, 9; 8, 9];
sta_all = [];
n = 1;
for sct = 0.2:0.05:0.6
    sta_ict = [];
    data_ict = data_all(data_all(:, 10)==round(sct*100), :);
    for ict = 0.2:0.05:0.6
        sta = [];
        data = data_ict(data_ict(:, 11)==round(ict*100), :);
        for i = 2:3
            for j = 1:3
                data_1 = data((data(:, 4)==1)&(data(:, d(j, 1))==1), 1);
                data_2 = data((data(:, 4)==1)&(data(:, d(j, 2))==1), 1);
                data_3 = data((data(:, 3+i)==1)&(data(:, d(j, 1))==1), 1);
                data_4 = data((data(:, 3+i)==1)&(data(:, d(j, 2))==1), 1);
                did = - mean(data_4) + mean(data_3) + mean(data_2) - mean(data_1);
                sta = [sta, did];
            end
        end
        sta_ict = [sta_ict; sta];
    end
    sta_all(n, :, :) = sta_ict;
    n = n + 1;
end

%% Plot

[x, y] = meshgrid(0.2:0.05:0.6, 0.2:0.05:0.6);
figure;
surfc(x, y, sta_all(:, :, 3)');
figure;
surfc(x, y, sta_all(:, :, 6)');
