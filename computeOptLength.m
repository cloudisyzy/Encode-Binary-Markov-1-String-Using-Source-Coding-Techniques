function [bitLength, uniqueRunLengths, prob] = computeOptLength(runLengths)

%     Calc prob of each run length, e.g., rl=[1 1 2 2 3 3 5] ->
%     unique_rl = [1 2 3 5] -> freq = [2 2 2 1] -> prob = [2/7, ...]
    uniqueRunLengths = unique(runLengths);
    freq = histc(runLengths, uniqueRunLengths);
    prob = freq / sum(freq);
    
%     l_i_min = -log2(pi), +1 because there is a start bit besides runlengths
    bitLength = sum((freq .* (-log2(prob)))) + 1;

end
