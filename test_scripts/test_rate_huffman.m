clear

prob = [.06 .06 .06 .06 .08 .15 .23 .30];
sum(prob)
entropy = compEntropy(prob)
rate = compRate(prob)

function entropy = compEntropy(prob)
    entropy = 0;
    for p = prob
        h = -p * log2(p);
        entropy = entropy + h;
    end
end

function rate = compRate(prob)
    [~, rate] = huffmandict(1:length(prob), prob);
end