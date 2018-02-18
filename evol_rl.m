function s = evol_rl(s)
    s.s = Generate_r(s.dt, s.s, s.s_bar, s.s_sigma, s.s_alpha );
    s.r = Generate_r(s.dt, s.r, s.r_bar, s.r_sigma, s.r_alpha );
    s.drl = s.r + s.alpha_l .* s.s - s.rl; % store the change of interest rate
    s.rl = s.rl + s.drl; % store the new interest rate
end