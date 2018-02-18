function l = Level( n, level, prob )
    l = zeros(n,1);
    rndnum = rand(n,1);
    cumprob = cumsum(prob);
    cumprob = [0,cumprob];
    for i= 1:length(prob)
        l(cumprob(i)<rndnum & rndnum<cumprob(i+1)) = level(i);
    end;
end

