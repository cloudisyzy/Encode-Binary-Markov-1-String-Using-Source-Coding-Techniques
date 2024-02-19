clear
addpath('..\Huffman_RunLength\')
addpath('..\')

p = 0.8;
N = 10000; 
seq = geornd(p, [1, N]);
% disp(seq);
histogram(seq, 'Normalization', 'probability');

seq_bin = [];
for i = 1:length(seq)
    seq_bin = [seq_bin dec2binvec(seq(i))];
end

seq_golomb = encodeGolomb(seq, mean(seq),length(seq));
[~, seq_Huffman, ~, ~, ~] = encodeRunLengths(seq);
