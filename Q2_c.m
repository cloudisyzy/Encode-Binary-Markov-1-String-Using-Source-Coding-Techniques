clear

L = 19600;
ratios = [];
range = 0.05:0.01:0.95;

ratios_1 = [];

for alpha = range
    beta = alpha;
    string = generateMarkov1String(L, alpha, beta);
    [~, string_rl] = binaryToRunLength(string);
    [length_rl_encoded, rl_values, rl_value_prob] = computeOptLength(string_rl);
    ratio = L / (length_rl_encoded+1);
    ratios = [ratios, ratio];

    if (alpha == 0.05) || (alpha == 0.5)
        figure;
        stem(rl_values, rl_value_prob, "filled")
        title(sprintf('PMF of RunLength Values, alpha=beta=%.2f', alpha))
        xlabel('RunLength Values')
        ylabel('Probability')
    end

end

figure;
stem(rl_values, rl_value_prob, "filled")
title(sprintf('PMF of RunLength Values, alpha=beta=%.2f', alpha))
xlabel('RunLength Values')
ylabel('Probability')

figure;
plot(range, ratios, LineWidth=1.5, LineStyle='-.')
ylim([0 4])
title('Optimal Compress Ratio as a Function of \alpha')
xlabel('\alpha')
ylabel('Ratio (length source / length encoded)')

figure;
x = 1:16;
y = geopdf(x,0.25);
stem(x, y, "filled")
title('PMF of Geometric Distribution')
xlabel('x')
ylabel('PMF f(x)')
axis off
