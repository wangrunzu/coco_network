function s = init_weight( s )
% This function will generage a weight matrix reflecting the percentage of
% the liability held by each other bank. The matrix will be a (s.n, s.n)
% matrix. Each row represents a bank whose bonds are held by other banks.
% Each col represents a bank that hold the bonds issued by the banks in
% each row.
% The weight matrix is separated into four parts:
% LL,LM;
% ML,MM.
% means: large bank held by large bank, large bank held by medium bank
%        medium bank held by large bank, medium bank held by medium bank
% The percentage of large bank's bonds held by large bank is calculated
% carefully, in order to make the percentage of large bank's bonds held by medium
% banks not so big that the medium banks' assets are not enough. The details
% can be seen in Part 1.



% -> ___Part 1.___ Decide the percentage allocation among large banks and medium banks.
meanLm = mean(s.Lb(s.n_l+1:end));% + mean(s.Lc(s.n_l+1:end)); % Mean of medium banks' liability in ferm of bank bond and coco bond
meanLl = mean(s.Lb(1:s.n_l));% + mean(s.Lc(1:s.n_l)); % Mean of large banks' liability in ferm of bank bond and coco bond
pp = 1- meanLm/meanLl * s.n_l/s.n_m; % [eq:1] Percentage of large banks' bonds held by large banks.
% As shown in [eq:1], the percentage of large banks' bonds held by medium
% banks is determined by the liability size of medium banks, liability size 
% of large banks and the number of medium banks and large banks.
dp = (1-pp)/2; % The range size the percentage can fluctuate in.

LL_rng = [pp-dp,pp+dp]; % The range of the percentage of large banks' bonds held by large banks.
ML_rng = [0.5,0.8]; % The range of the percentage of medium banks' bonds held by large banks.
limit = 15; % [def:1] The ratio limit that used in [eq:2] below. 
% The [def:1] constrains that the medium bank cannot hold too large value of bonds issued by other banks.
% <- ___Part 1.___ Decide the percentage allocation among large banks and medium banks.

LL_p = (LL_rng(2)-LL_rng(1)).*rand(s.n_l,1) + LL_rng(1); % In total, large bank held by large bank
ML_p = (ML_rng(2)-ML_rng(1)).*rand(s.n_m,1) + ML_rng(1); % In total, medium bank held by large bank
LM_p = 1-LL_p; % In total, large bank held by medium bank
MM_p = 1-ML_p; % In total, medium bank held by medium bank
part = [LL_p,LM_p;ML_p,MM_p];

s.w = zeros(s.n,s.n);
isok = false;
triedtime = 0;
while ~isok
    triedtime = triedtime + 1;
%     if mod(triedtime,100) == 0
%         clc
%         disp(['Weight Generation Tried Times:', num2str(triedtime)]);
%     end
    for i = 1:s.n
        % Every row is cut into two parts: weights of liability held by large
        % bank (L_rnd); weights of liability held by medium bank (M_rnd).
        % The weights of liabilities held by specific bank are constrained
        % by L_rnd and M_rnd.
        if i <= s.n_l % For a large bank, there are only (s.n_l-1) large banks can hold its bonds, because it cannot hold its own bonds
            L_rnd = rand(1,s.n_l-1); L_rnd = L_rnd./sum(L_rnd)*part(i,1);
            M_rnd = rand(1,s.n_m); M_rnd = M_rnd./sum(M_rnd)*part(i,2);
        else % For a medium bank, there are only (s.n_m-1) medium banks can hold its bonds, because it cannot hold its own bonds
            L_rnd = rand(1,s.n_l); L_rnd = L_rnd./sum(L_rnd)*part(i,1);
            M_rnd = rand(1,s.n_m-1); M_rnd = M_rnd./sum(M_rnd)*part(i,2);
        end
        irow = [L_rnd,M_rnd]; irow = [irow(1:i-1),0,irow(i:end)];
        s.w(i,:) = irow;
    end
    if s.Lb*s.w<s.Lb*limit % if the value of all the loans held by a bank is mediumer than limit times of the value of its equity
        isok = true;
    end
    if triedtime > 10000
        s.w = s.w / 0;
        isok = true;
        fprintf('Fail to initialize weight matrix.\n');
    end
end
% disp(['Weight Generation Tried Times:', num2str(triedtime)]);
end

