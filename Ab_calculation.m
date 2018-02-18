function s = Ab_calculation(s)
    s.Ab = sum(s.Lbh' * ones(1, s.n) .* s.w);
end
