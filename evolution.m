function s = evolution(s)
    s = evol_rl(s);
    s = evol_Lb(s);
    s = evol_Lc(s);
    s = Ab_calculation(s);
    s = evol_Af(s);
    s = evol_cash_shock(s);
    s.E = s.C + s.Ab + s.Af - s.D - s.Lbi - s.Lc;
    
    % system trigger flag may close again once opened
    if s.twolayers
        s.systri = mean(s.E ./ s.E0) < 0.6; % system coco trigger
    end
    
    if s.systri
        s = evol_bankruptcy_coco(s);
    else
        s = evol_bankruptcy(s);
    end
    s = evol_credit_rating(s);
end