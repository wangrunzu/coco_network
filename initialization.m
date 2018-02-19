function s = initialization(s)
    s.n_l = 5; % number of large banks
    s.n_m = s.n - s.n_l; % number of middium banks
    s.dt = 1/365; % daily basis simulation

    s.leverage_l = 0.1; % leverage ratio of large banks
    s.leverage_m = 0.1; % leverage ratio of midium banks
    s.LtDR_para_l = [0.1, 0.00]; % Debt to Deposit reatio parameters of large banks
    s.LtDR_para_m = [0.1, 0.00]; % Debt to Deposit reatio parameters of midium banks
    s.D_para_l = [10^11, 0]; % large bank deposit parameters
    s.D_para_m = [1.5 * 10^10, 0]; % medium bank deposit parameters 
    s.C_para_l = [5 * 10^10, 0]; % large bank cash equivelent parameters
    s.C_para_m = [1.5 * 10^9, 0]; % midium bank cash equivelent parameters
    s.Db_para = [1.5, 0.2]; % interbank loan duration para
    s.Cb_para = [5, 0.5]; % interbank loan convexity para
    s.Dc_para = [5, 2]; % Coco duration para, guess number
    s.Cc_para = [25, 2.5]; % Coco convexity para, guess number
    
    % initialize cash shock parameters
    s.CS_fre = 14 / 365;
    s.CS_aver = s.n / 10;
    s.CS_para = [0, 0.01];
    s.CS_timer = exprnd(s.CS_fre);
    
    % initialize intereste rate
    s.r = 0.014714769;
    s.r_bar = 0.014714769;
    s.r_alpha = 10.62083101;
    s.r_sigma = 0.127547709;
    s.s = 0.034307521;
    s.s_bar = 0.034307521;
    s.s_alpha = 13.30975223;
    s.s_sigma = 0.141748164;
    s.alpha_l_cons = [0.290958942,0.380008873,0.660839662,1];
    s.level = [Level(s.n_l,[1,2,3],[0.1,0.6,0.3]);Level(s.n_m,[1,2,3,4],[0.03,0.17,0.5,0.3])];
    s.alpha_l = s.alpha_l_cons(s.level);
    s.rl = s.r + s.alpha_l .* s.s;
    s.drl = zeros(1, s.n); % for calculating the change of debt value
    
    % initialize deposit
    s.D = zeros(1, s.n);
    s.D(1:s.n_l) = s.D_para_l(1) + s.D_para_l(2) * randn(1, s.n_l);
    s.D(s.n_l+1:end) = s.D_para_m(1) + s.D_para_m(2) * randn(1, s.n_m);
    
    % calculate interbank debt
    s.Lb = zeros(1, s.n);
    s.Lb(1:s.n_l) = s.D(1:s.n_l) .* (s.LtDR_para_l(1) + s.LtDR_para_l(2) * randn(1, s.n_l));
    s.Lb(s.n_l+1:end) = s.D(s.n_l+1:end) .* (s.LtDR_para_m(1) + s.LtDR_para_m(2) * randn(1, s.n_m));
    
    % Lb is saperated into to two values: market value for holder, and
    % market value for issuer.
    s.Lbi = s.Lb;
    s.Lbh = s.Lb;
    
    % initialize equity
    s.E = zeros(1, s.n);
    s.E(1:s.n_l) = (s.D(1:s.n_l) + s.Lb(1:s.n_l)) * s.leverage_l / (1 - s.leverage_l);
    s.E(s.n_l+1:end) = (s.D(s.n_l+1:end) + s.Lb(s.n_l+1:end)) * s.leverage_m / (1 - s.leverage_m);
    s.E0 = s.E;
    
    % initialize duration and convexity for interbank liability
    s.Db = s.Db_para(1) + s.Db_para(2) * randn(1, s.n);
    s.Cb = s.Cb_para(1) + s.Cb_para(2) * randn(1, s.n);
    
    % initialize duration and convexity for coco liability
    s.Dc = s.Dc_para(1) + s.Dc_para(2) * randn(1, s.n);
    s.Cc = s.Cc_para(1) + s.Cc_para(2) * randn(1, s.n);
    
    % initialize cash and cash equivalents
    s.C = zeros(1, s.n);
    s.C(1:s.n_l) = s.C_para_l(1) + s.C_para_l(2) * randn(1, s.n_l);
    s.C(s.n_l+1:end) = s.C_para_m(1) + s.C_para_m(2) * randn(1, s.n_m);
    
    % initialize weight
    s = init_weight(s);
    
    % calculate interbank asset (liability holding)
    s = Ab_calculation(s);
    
    % initialize loan to firms
    s.industry_n = 15;
    s.industry = ones(s.industry_n, 1);
    s.Af = s.D + s.Lb + s.E - s.C - s.Ab;
    s = init_Af_weight(s);
    
    % calculate and coco debt
    s.Lc = (s.Ab + s.Af) * 0.05;
    s.D = s.D - s.Lc;
    
    % initialize industry shock parameters
    s.IS_fre = 0.5;
    s.IS_aver = 3;
    s.IS_para = [0, 0.0645];
    s.IS_timer = exprnd(s.IS_fre);
    
    % store init Z-score
    s.zscore_0 = 1.2 * s.C ./ (s.C + s.Ab + s.Af) + 0.6 * s.E ./ (s.D + s.Lb + s.Lc);
    
    % bank trigger flag
    s.triggered = zeros(1, 40);
    
    % two layers flag
    s.twolayers = true;
    
    % system trigger flag
    s.systri = true;
end
