function out = mydownsample(in, M)
out = in(1:M:floor((length(in)-1)/M)*M+1);
