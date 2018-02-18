function s = evol_Af(s)
    s = evol_industry_shock(s);
    dind = 0.1 * (1 - s.industry) * s.dt + 0.05 * s.industry .* randn(s.industry_n, 1) * sqrt(s.dt);
    s.industry = s.industry + dind;
    s.Af = (s.Af_weight * s.industry)';
end