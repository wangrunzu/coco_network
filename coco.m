%% test case for one time simulation

%% initialization

s.n = 40; % number of banks
s = initialization(s);
s0 = s; % back up for comparation

%% simulation

n = 365;

equity = zeros(n + 1, 40);
atf = zeros(n + 1, 40);
atb = zeros(n + 1, 40);
equity(1, :) = s.E;
atf(1, :) = s.Af;
atb(1, :) = s.Ab;

for i=1:n
    s = evolution(s);
    equity(i + 1, :) = s.E;
    atf(i + 1, :) = s.Af;
    atb(i + 1, :) = s.Ab;
end

for i=1:s.n
    equity(:, i) = equity(:, i) / equity(1, i) * 100;
    atf(:, i) = atf(:, i) / atf(1, i) * 100;
    atb(:, i) = atb(:, i) / atb(1, i) * 100;
end

% figure;
% plot(equity);
% 
% figure
% plot(atf);
% 
% figure
% plot(atb);