function s = evol_industry_shock(s)
    s.IS_timer = s.IS_timer - s.dt;
    % there could be multiple shocks in one period
    while s.IS_timer < 0
        % number of industries being shocked is poisson distributed
        number = min(poissrnd(s.IS_aver), s.industry_n);
        % shuffle to get the industries being shocked
        identifier = randperm(s.industry_n, number);
        s.industry(identifier) = s.industry(identifier) .* (1 + s.IS_para(1) + s.IS_para(2) .* randn()); % same shock to every industry
        s.IS_timer = s.IS_timer + exprnd(s.IS_fre);
    end
end