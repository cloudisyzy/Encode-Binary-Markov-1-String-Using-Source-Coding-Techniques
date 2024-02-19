clear

addpath('../')

L = 50;
alpha = 0.2;
beta = 0.2;

% Encode
string = generateMarkov1String(L, alpha, beta);
[bit_1, string_rl] = binaryToRunLength(string);
[~, rl_encoded, dict, ~, ~] = encodeRLHuffman(string_rl);

% Decode
decoded_string = decodeRLHuffman(bit_1, rl_encoded, dict);

% Testify whether it is correctly decoded
isequal(string, decoded_string)
