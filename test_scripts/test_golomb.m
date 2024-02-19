clear
addpath('..\Huffman_RunLength\')
addpath('..\')

seq = [1 1 1 1 1 0]

[bit0, seq_run] = binaryToRunLength(seq);

seq_run = seq_run - 1

code_golomb = encodeGolomb(seq_run, mean(seq_run), 20)