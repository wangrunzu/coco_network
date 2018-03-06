clear;
clc;

str = "../output/cash_oneshock_";
file = [str+"nococo.mat", str+"syscoco.mat", str+"coco.mat"];

figure;

for i = 1:3
    load(file(i));
    disp(file(i));
    
    subplot(3, 3, (i-1)*3+1);
    h_a = histogram(sum(equity_l<=0, 2),'Normalization','probability');
    ylim([0 1])
    subplot(3, 3, (i-1)*3+2);
    h_l = histogram(sum(equity_l(:, 1:5)<=0, 2),'Normalization','probability');
    ylim([0 1])
    subplot(3, 3, (i-1)*3+3);
    h_s = histogram(sum(equity_l(:, 6:end)<=0, 2),'Normalization','probability');
    ylim([0 1])
    h_a.Normalization = 'probability';
    h_a.BinEdges = 0:20;
    h_l.Normalization = 'probability';
    h_l.BinEdges = 0:20;
    h_s.Normalization = 'probability';
    h_s.BinEdges = 0:20;
end