clear
addpath('..\Huffman_RunLength\')
addpath('..\')

p = 0.2;
randomArray = rand(1, 20000);
a = randomArray < p;
code_0 = encodeArithmetic(a, 1-p);
ratio_0 = 20000/length(code_0)
estimateEntropy(code_0)
estimateEntropyRate(code_0)

% a = generateMarkov1String(20000, 0.9, 0.9);
% code_1 = encodeArithmeticMarkov1Modi(a, 0.9);
% ratio_1 = 20000/length(code_1)
% estimateEntropy(code_1)
% estimateEntropyRate(code_1)