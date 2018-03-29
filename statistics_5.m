clear;
clc;

file_prefix = ["../output/noshock_", "../output/oneshock_", "../output/twoshocks_"];
file = ["nococo.mat", "syscoco.mat", "coco.mat"];

data_all = zeros(1, 9);

for i=1:3
    for j=1:3
        load(file_prefix(i)+file(j));
        data = [sum(equity_l<=0, 2), ...
                sum(equity_l(:, 1:5)<=0, 2), ...
                sum(equity_l(:, 6:end)<=0, 2)];
        
        data(:, 4:9) = 0;
        
        data(:, i+3) = 1;
        data(:, j+6) = 1;
        
        data_all = [data_all; data];
    end
end

data_all(1, :) = [];