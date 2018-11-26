function [Xnorm, Xmean] = normalizeRatings(X, R)

[m, n] = size(X);
Xmean = zeros(1, n);
Xnorm = zeros(size(X));
for i = 1:n
    idx = find(R(:, i) == 1);
    Xmean(1,i) = mean(X(idx, i));
    Xnorm(idx, i) = X(idx, i) - Xmean(1,i);
end

end
