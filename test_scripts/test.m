clear
addpath('..\Huffman_RunLength\')
addpath('..\')

L = 5000;
alpha = 0.2;
beta = alpha;

string = generateMarkov1String(L,alpha,beta);
[bit_1, string_rl] = binaryToRunLength(string);
string_rl = string_rl - 1;
[a,~,~] = computeOptLength(string_rl);
avg_string_rl = mean(string_rl);
code_Golomb = encodeGolomb(string_rl, avg_string_rl, 10);
% [~, code_Huffman, ~, ~, ~] = encodeRunLengths(string_rl);

% size = zeros(1,500);
% for i = 1:500
%     code_Golomb = encodeGolomb(string_rl, mean(string_rl), i);
%     size(1,i) = length(code_Golomb);
% end
% 
% [val,idx]=min(size)
% max(string_rl)

