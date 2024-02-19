function [bitLength, encodedRunLengths, dict, uniqueRunLengths, prob] = encodeRunLengths(runLengths)

    % Calc prob of each run length, e.g., rl=[1 1 2 2 3 3 5] ->
    % unique_rl = [1 2 3 5] -> freq = [2 2 2 1] -> prob = [2/7, ...]
    uniqueRunLengths = unique(runLengths);
    freq = histc(runLengths, uniqueRunLengths);
    prob = freq / sum(freq);
    
    % Encode in Huffman, acquire the dict
    [dict, ~] = huffmandict(uniqueRunLengths, prob);
    encodedRunLengths = huffmanenco(runLengths, dict);
    
    % Print the length of encoded run lengths
    bitLength = length(encodedRunLengths);

end
