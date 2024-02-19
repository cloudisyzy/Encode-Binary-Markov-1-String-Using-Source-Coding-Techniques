function entropy = estimateEntropy(str)

    N = length(str);
    
    % Calculate the # of occurrences of 0, 1
    num0 = sum(str == 0);
    num1 = sum(str == 1);
    % Compute the probs of 0 and 1
    phat_0 = num0 / N;
    phat_1 = num1 / N;

    entropy = -phat_0 * log2(phat_0) - phat_1 * log2(phat_1);
    
end

