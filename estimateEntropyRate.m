function entropyRate = estimateEntropyRate(str)

    N = length(str);
    
    % Calculate the # of occurrences of 0, 1
    num0 = sum(str == 0);
    num1 = sum(str == 1);
    % Compute the probs of 0 and 1
    phat_0 = num0 / N;
    phat_1 = num1 / N;

    % Compute transition probabilities
    % P = [P_00  P_01
    %      P_10  P_11]
    P_00 = sum(str(1:end-1) == 0 & str(2:end) == 0) / num0;
    P_01 = sum(str(1:end-1) == 0 & str(2:end) == 1) / num0;
    P_10 = sum(str(1:end-1) == 1 & str(2:end) == 0) / num1;
    P_11 = sum(str(1:end-1) == 1 & str(2:end) == 1) / num1;
    % The above section of code may be a biased estimation of P, but as N goes
    % up, the biase can be ignored

    % Calculate the entropy rate
    eps = 1e-10;

    if phat_0 == 1
        entropyRate = -phat_0 * (P_00 * log2(P_00));
    elseif phat_1 == 1
        entropyRate = -phat_1 * (P_11 * log2(P_11));
    else
        entropyRate = -(phat_0 * (P_00 * log2(P_00+eps) + P_01 * log2(P_01+eps)) + ...
                        phat_1 * (P_10 * log2(P_10+eps) + P_11 * log2(P_11+eps)));
    end

    
end
