clear
addpath('..\Huffman_RunLength\')
addpath('..\')

L = 20000;
alpha = 0.5;
beta = alpha;

string = generateMarkov1String(L,alpha,beta);
enc_string = encodeArithmeticMarkov1Modi(string,alpha);

% entropy_str = estimateEntropy(string)
% entropy_str_enc = estimateEntropy(enc_string)