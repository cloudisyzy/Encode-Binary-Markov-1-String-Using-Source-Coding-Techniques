clear

% by using p0 = 0.5, the entropy (rate) of the coded seq will approximate 1, 
% if p0 = 0.5, they will deviate from 1, this is because for inbalanced
% distributed sources, i.e., p0 = 0.1, the huffman code is inefficient, but
% for balanced source, it is efficient and can approach to the entropy of
% the source. Same rule applies to golomb and arthmetic code

% p0 = 0.1;
p0 = 0.5
randomArray = rand(1, 20000);
a = double(randomArray < p0);
p1 = 1 - p0;
p = [p0 p1];
[dict,~] = huffmandict([0 1], p);
a_enc = huffmanenco(a, dict)
estimateEntropyRate(a_enc)
estimateEntropy(a_enc)