function r = Generate_r(dt, r0, rbar, sigma, alpha )
    W = normrnd(0,sqrt(dt));
    r = r0 + alpha*(rbar-r0)*dt+sigma*sqrt(r0)*W;
end

