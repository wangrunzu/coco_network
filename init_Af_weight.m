function s = init_Af_weight(s)
% s.Af_weight is the weight of industry loan holdings
% it is share weight conditional on all initial share values equal to 1
    s.Af_weight = zeros(s.n, s.industry_n);
    % randomly group midium banks
    group_b = [1:s.n_l, ceil(rand(1, s.n_m) * s.n_l)];
    group_n = zeros(1, s.industry_n);
    shuffle = randperm(s.industry_n);
    % make sure every group has at least two focus industries
    for i = 1:s.n_l
        group_n(shuffle(2 * i - 1)) = i;
        group_n(shuffle(2 * i)) = i;
    end;
    % randomly group rest industries
    group_n(shuffle(2 * s.n_l + 1:end)) = ceil(rand(1, s.industry_n - 2 * s.n_l) * s.n_l);
    % diversified large banks
    for i = 1:s.n_l
        s.Af_weight(i, :) = max(randn(1, s.industry_n) + 2, 0);
    end;
    for i = 1:s.n
        randnum = max(randn(1, s.industry_n) + 2, 0);
        s.Af_weight(i, :) = s.Af_weight(i, :) + randnum .* (group_n == group_b(i));
        s.Af_weight(i, :) = s.Af_weight(i, :) / sum(s.Af_weight(i, :)) * s.Af(i);
    end;
end

