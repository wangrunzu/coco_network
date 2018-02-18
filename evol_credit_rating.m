function s = evol_credit_rating(s)

    down = 0.9;
    up = 1/down;
    zscore = 1.2 * s.C ./ (s.C + s.Ab + s.Af) + 0.6 * s.E ./ (s.D + s.Lb + s.Lc);
    
    % downgrade
    s.level(zscore <= s.zscore_0 * down) = min(4, s.level(zscore <= s.zscore_0 * down) + 1);
    s.zscore_0(zscore <= s.zscore_0 * down) = zscore(zscore <= s.zscore_0 * down);
    
    % upgrade
    s.level(zscore >= s.zscore_0 * up) = max(1, s.level(zscore >= s.zscore_0 * up) - 1);
    s.zscore_0(zscore >= s.zscore_0 * up) = zscore(zscore >= s.zscore_0 * up);
    
    % change alpha_l
    s.alpha_l = s.alpha_l_cons(s.level);
end
