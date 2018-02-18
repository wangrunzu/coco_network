function s = evol_cash_shock(s)
    s.CS_timer = s.CS_timer - s.dt;
    % there could be multiple shocks in one period
    while s.CS_timer < 0
        % number of banks being shocked is poisson distributed
        number = min(poissrnd(s.CS_aver), s.n);
        % shuffle to get the banks being shocked
        identifier = randperm(s.n, number);
        s.C(identifier) = s.C(identifier) .* (1 + s.CS_para(1) + s.CS_para(2) .* randn(1, number));
        s.CS_timer = s.CS_timer + exprnd(s.CS_fre);
    end;
end