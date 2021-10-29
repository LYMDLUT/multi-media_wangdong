function out = myupsample(in, L)
out = zeros(1, (length(in)-1)*L+1);
for j = 1:length(in)
    out(L*(j-1)+1) = in(j);
end
