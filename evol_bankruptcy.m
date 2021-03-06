function s = evol_bankruptcy(s)
    ind = s.E < 0;
    while sum(ind) ~= 0
        Lb_back_mid = s.Lb' * ones(1, s.n) .* s.w;
        if sum(ind) == 1
            Lb_back = Lb_back_mid(ind, :) * 0.6;
        else
            Lb_back = sum(Lb_back_mid(ind, :)) * 0.6;
        end
        s.C = s.C + Lb_back;
        s.C(ind) = 0;
        s.Ab(ind) = 0;
        s.Af(ind) = 0;
        s.D(ind) = 0;
        s.Lbi(ind) = 0;
        s.Lc(ind) = 0;
        s.E(ind) = 0;
        s.Lbh(ind) = 0;
        s.w(ind, :) = 0;
        s.w(:, ind) = 0;
        s.Af_weight(ind, :) = 0;
        s = Ab_calculation(s);
        s.E = s.C + s.Ab + s.Af - s.D - s.Lbi - s.Lc;
        ind = s.E < 0;
    end
end