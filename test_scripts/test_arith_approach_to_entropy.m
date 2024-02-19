clear
addpath('..\Huffman_RunLength\')
addpath('..\')

a = generateMarkov1String(20000, 0.2, 0.2);
a_ar = encodeArithmeticMarkov1Modi(a, 0.2);

% Code length
length(a_ar)

% EntropyRateofSource * SourceLength
round(length(a) * estimateEntropyRate(a))