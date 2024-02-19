clear

L = 19600;
ratios_ideal = [];
ratios_golomb_rl = [];
range = 0.05:0.01:0.95;

for alpha = range

    beta = alpha;
    string = generateMarkov1String(L, alpha, beta);
    [~, string_rl] = binaryToRunLength(string);
    [length_rl_encoded, ~, ~] = computeOptLength(string_rl);
    ratio_ideal = L / (length_rl_encoded+1);
    ratios_ideal = [ratios_ideal, ratio_ideal];

    string_rl = string_rl - 1;
    string_rl_golomb = encodeGolomb(string_rl, mean(string_rl), 20);
    ratio_golomb_rl = L / (length(string_rl_golomb) + 1);
    ratios_golomb_rl = [ratios_golomb_rl, ratio_golomb_rl];

end

figure;
plot(range, ratios_ideal, LineWidth=1.5, LineStyle='-.')
hold on
plot(range, ratios_golomb_rl, LineWidth=1.5)
ylim([0 4])
title('Compress Ratio as a Function of \alpha')
xlabel('\alpha')
ylabel('Ratio (length source / length encoded)')
legend('Ideal RunLength Encoder', 'RunLength+Golomb')