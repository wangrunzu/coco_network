%% Simulation

clear;
clc;

s.n = 40;
l = 365;
n = 10000;
equity_0 = zeros(n, s.n);
c_0 = zeros(n, s.n);
atb_0 = zeros(n, s.n);
atf_0 = zeros(n, s.n);
equity_l = zeros(n, s.n);
c_l = zeros(n, s.n);
atb_l = zeros(n, s.n);
atf_l = zeros(n, s.n);
triggered = zeros(n, s.n);
clear s;

% set shock mode
% 1 - day 20 industry shock
% 2 - day 200 industry shock
shock_flag = [true, true];

parfor i=1:n
    
    % control for random number
    rng(i * 10, 'twister');
    
    s.n = 40; % number of banks
    s = initialization(s);
    equity_0(i, :) = s.E;
    c_0(i, :) = s.C;
    atb_0(i, :) = s.Ab;
    atf_0(i, :) = s.Af;
    for j = 1:l
        if j == 20 && shock_flag(1)
            number = min(poissrnd(3), s.industry_n);
            identifier = randperm(s.industry_n, number);
            s.industry(identifier) = s.industry(identifier) * 0.894;
        end
        if j == 200 && shock_flag(2)
            number = min(poissrnd(3), s.industry_n);
            identifier = randperm(s.industry_n, number);
            s.industry(identifier) = s.industry(identifier) * 0.894;
        end
        s = evolution(s);
    end
    equity_l(i, :) = s.E;
    c_l(i, :) = s.C;
    atb_l(i, :) = s.Ab;
    atf_l(i, :) = s.Af;
    triggered(i, :) = s.triggered;
    if mod(i, 100) == 0
        fprintf('%d simulation finished.\n', i);
    end
end
%% Statistics

ind = all(~isnan(equity_l),2) .* all(~isnan(c_l),2) .* all(~isnan(atb_l),2) .* all(~isnan(atf_l),2) == 1;
equity_0 = equity_0(ind, :);
equity_l = equity_l(ind, :);
equity_ratio = equity_l ./ equity_0 * 100;
c_0 = c_0(ind, :);
c_l = c_l(ind, :);
c_ratio = c_l ./ c_0 * 100;
atb_0 = atb_0(ind, :);
atb_l = atb_l(ind, :);
atb_ratio = atb_l ./ atb_0 * 100;
atf_0 = atf_0(ind, :);
atf_l = atf_l(ind, :);
atf_ratio = atf_l ./ atf_0 * 100;

sta_equity = zeros(5, 4);
sta_equity(1, :) = [0.001, 0.01, 0.05, 0.1];
sta_equity(2, :) = quantile(reshape(equity_ratio, [], 1), sta_equity(1, :));
sta_equity(3, :) = quantile(reshape(equity_ratio(:, 1:5), [], 1), sta_equity(1, :));
sta_equity(4, :) = quantile(reshape(equity_ratio(:, 6:end), [], 1), sta_equity(1, :));
sta_equity(5, :) = quantile(sum(equity_ratio, 2)/40, sta_equity(1, :));

sta_trigger = zeros(4, 4);
sta_trigger(1, :) = 1 - sta_equity(1, :);
sta_trigger(2, :) = quantile(sum(equity_ratio<40, 2), sta_trigger(1, :));
sta_trigger(3, :) = quantile(sum(equity_ratio(:, 1:5)<40, 2), sta_trigger(1, :));
sta_trigger(4, :) = quantile(sum(equity_ratio(:, 6:end)<40, 2), sta_trigger(1, :));

clear i ind j l n s number identifier;

%% Graph

subplot(2,2,1);
histogram(equity_ratio(:),'Normalization','probability');
title('Equity');
subplot(2,2,2);
histogram(c_ratio(:),'Normalization','probability');
title('Cash');
subplot(2,2,3);
histogram(atb_ratio(:),'Normalization','probability');
title('Interbank Loan');
subplot(2,2,4);
histogram(atf_ratio(:),'Normalization','probability');
title('Industry Loan');