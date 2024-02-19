clear

addpath('../')
L = 19600;
ratios = [];
ratios_golomb_rl = [];

for alpha = 0.05:0.01:0.95
    beta = alpha;
    string = generateMarkov1String(L, alpha, beta);
    [bit_1, string_rl] = binaryToRunLength(string);
    [length_rl_encoded, rl_encoded, dict, rl_values, rl_value_prob] = encodeRLHuffman(string_rl);
    estimateEntropy(rl_encoded)
    estimateEntropyRate(rl_encoded)
    ratio = L / (length_rl_encoded+1);
    ratios = [ratios, ratio];

%     string_rl = string_rl - 1;
%     string_rl_golomb = encodeGolomb(string_rl, mean(string_rl), 20);
%     ratio_golomb_rl = L / (length(string_rl_golomb) + 1);
%     ratios_golomb_rl = [ratios_golomb_rl, ratio_golomb_rl];

end

figure;
plot(0.05:0.01:0.95, ratios, LineWidth=1.5, LineStyle='-.')
% hold on
% plot(0.05:0.01:0.95, ratios_golomb_rl, LineWidth=1.5)
ylim([0 4])
title('Compress Ratio as a function of \alpha')
xlabel('\alpha')
ylabel('Ratio (length source / length encoded)')
legend('RunLength+Huffman', 'RunLength+Golomb')
