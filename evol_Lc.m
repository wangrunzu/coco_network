function s = evol_Lc(s)
%     s.Lc = s.Lc - s.Dc .* s.Lc .* s.drl + 0.5 * s.Cc .* s.Lc .* s.drl.^2;
end
