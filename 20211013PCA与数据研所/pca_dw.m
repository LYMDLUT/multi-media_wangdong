function [U, mu, eRate] = pca_dw(data, dim, rate)
%%function [U, mu] = pca_dw(data, dim, rate)
%%Calculate PCA to obtain basis functions
%%Input:
%%      data:   data matrix [nDim*nSample]      
%%      dim:    Reserved Dimensions
%%      rate:   Reserved Energy Rate, only work when 0 < rate < = 1
%%Output:
%%      mu:   mean vector [nDim*1]
%%      U:    basis functions [nDim*dim]
%%      eRate:  Reserved Energy Rate

    [nDim, nSample] = size(data);
    %
    % % %%Calculate the mean
    % % muT = zeros(nDim,1);
    % % for num = 1:nSample
    % %     muT = muT + data(:,num);
    % % end
    % % muT = muT / nSample; 
    %
    %%Calculate the mean
    mu   = mean(data, 2);  
    % % %%Remove the mean
    % % dataT = data;
    % % for num = 1:nSample
    % %     dataT(:,num) = dataT(:,num) - mu;
    % % end
    %
    %%Remove the mean 
    data = data - repmat(mu, [1, nSample]);
    %
    covM = data*data'/nSample;
    [U, D] = eig(covM);
    [val, idx] = sort(diag(D), 'descend');
    U = U(:,idx);
    %
    valsum = cumsum(val)./sum(val);
    if  rate~=0
        dim    = find((valsum>=rate), 1, 'first');
    end
    eRate  = valsum(1:dim);
    %
    U = U(:, 1:dim);
end