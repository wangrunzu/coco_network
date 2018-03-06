%% Determin the external cash shock size

n = 40;
fre = 14/365;
aver = n/10;
para = [0, 0.01216];
dt = 1/365;

timer = exprnd(fre);

m = 1e6;

cash_sample = zeros(m, n);

for i=1:m
    
    cash = ones(1, n);

    for l=1:183
        timer = timer - dt;
        while timer<0
            % number of banks being shocked is poisson distributed
            number = min(poissrnd(aver), n);
            % shuffle to get the banks being shocked
            identifier = randperm(n, number);
            cash(identifier) = cash(identifier) .* (1 + para(1) + para(2) .* randn(1, number));
            timer = timer + exprnd(fre);
        end
    end
    
    cash_sample(i, :) = cash;
end

cash_sample = reshape(cash_sample, 1, []);