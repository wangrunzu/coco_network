function s = evol_Lb(s)
    s.Lbh = s.Lbh - s.Db .* s.Lbh .* s.drl + 0.5 * s.Cb .* s.Lbh .* s.drl.^2;
    s.Lbi = s.Lb; % .^ 2 ./ s.Lbh;
end
