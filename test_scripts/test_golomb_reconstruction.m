clear
addpath('..\Huffman_RunLength\')
addpath('..\')

r = 100;
k = 5;

ru = floor(r / 2^k);
unaryCode = [zeros(1, ru), 1];
rc = mod(r, 2^k);
binaryCode = dec2binvec(rc, k);
encoded_r = [unaryCode binaryCode]

ru_1 = length(find(unaryCode == 0));
rc_1 = binvec2dec(binaryCode); 
r_reconstructed = 2^k * ru_1 + rc_1;