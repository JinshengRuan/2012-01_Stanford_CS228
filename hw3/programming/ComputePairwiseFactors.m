function factors = ComputePairwiseFactors (images, pairwiseModel, K)
% This function computes the pairwise factors for one word and uses the
% given pairwise model to set the factor values.
%
% Input:
%   images: An array of structs containing the 'img' value for each
%     character in the word.
%   pairwiseModel: The provided pairwise model. It is a K-by-K matrix. For
%     character i followed by character j, the factor value should be
%     pairwiseModel(i, j).
%   K: The alphabet size (accessible in imageModel.K for the provided
%     imageModel).
%
% Output:
%   factors: The pairwise factors for this word.
%
% Hint: Every character pair in the word will use the same 'val' table.
%   Consider computing that array once and then resusing for each factor.


n = length(images);

% If there are fewer than 2 characters, return an empty factor list.
if (n < 2)
    factors = [];
    return;
end

factors = repmat(struct('var', [], 'card', [], 'val', []), n - 1, 1);

% Your code here:
for i=1:n-1
    factors(i).var=[i i+1];           
    factors(i).card=[K K];
    factors(i).val = zeros(prod(factors(i).card), 1);
    for m=1:K
        for n=1:K
            factors(i).val(AssignmentToIndex([m n], factors(i).card)) = pairwiseModel(m, n);
        end
    end
end

end
