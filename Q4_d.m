clear

N = 20000;
ratios_golomb_rl = [];
ratios_arith = [];
ratios_ideal = [];
range = 0.05:0.05:0.95;

for alpha = range

    beta = alpha;
    string = generateMarkov1String(N, alpha, beta);

    [~, string_rl] = binaryToRunLength(string);
    string_rl = string_rl - 1;
    string_rl_golomb = encodeGolomb(string_rl, mean(string_rl), 20);
%     estimateEntropy(string_rl_golomb)
%     estimateEntropyRate(string_rl_golomb)
    ratio_golomb_rl = N / (length(string_rl_golomb) + 1);
    ratios_golomb_rl = [ratios_golomb_rl, ratio_golomb_rl];

    [length_rl_encoded, ~, ~] = computeOptLength(string_rl);
    ratio_ideal = N / (length_rl_encoded+1);
    ratios_ideal = [ratios_ideal, ratio_ideal];

    string_arith = encodeArithmeticMarkov1Modi(string, alpha);
%     estimateEntropyRate(string_arith)
%     estimateEntropy(string_arith)
    ratio_arith = N / length(string_arith);
    ratios_arith = [ratios_arith ratio_arith];

end

figure;
plot(range, ratios_ideal, '-.', LineWidth=1.5)
hold on 
plot(range, ratios_golomb_rl, LineWidth=1.5)
hold on
plot(range, ratios_arith, '-*', LineWidth=1.5, Color='cyan')
line([0 1], [1 1], 'Color','magenta','LineStyle','--')
ylim([0 4])
title('Compress Ratio as a Function of \alpha')
xlabel('\alpha')
ylabel('Ratio (length source / length encoded)')
legend('Ideal RunLength Encoder', 'RunLength+Golomb','Arithmetic Code','Compression Threshold, Ratio=1')

figure;
plot(range, ratios_arith, '-*', LineWidth=1.5,Color='cyan')
line([0 1], [1 1], 'Color','magenta','LineStyle','--')
ylim([0 4])
title('Compress Ratio as a Function of \alpha')
xlabel('\alpha')
ylabel('Ratio (length source / length encoded)')
legend('Arithmetic Code','Compression Threshold, Ratio=1')