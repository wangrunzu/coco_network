clear;
clc;

file_folder = "../output/individual_trigger/";
file_prefix = ["noshock_", "oneshock_", "twoshocks_"];
file = ["nococo.mat", "coco.mat", "syscoco.mat"];

data_all = zeros(1, 10);

for ict = 0.2:0.05:0.6
    for i=1:3
        for j=1:3
            load(file_folder+num2str(ict)+"_"+file_prefix(i)+file(j));
            data = [sum(equity_l, 2)./sum(equity_0, 2), ...
                    sum(equity_l(:, 1:5), 2)./sum(equity_0(:, 1:5), 2), ...
                    sum(equity_l(:, 6:end), 2)./sum(equity_0(:, 6:end), 2)];

            data(:, 4:10) = 0;

            data(:, i+3) = 1;
            data(:, j+6) = 1;
            data(:, 10) = ict;

            data_all = [data_all; data];
        end
    end
end

data_all(1, :) = [];
csvwrite("sample_equity_ratio.csv", data_all)
