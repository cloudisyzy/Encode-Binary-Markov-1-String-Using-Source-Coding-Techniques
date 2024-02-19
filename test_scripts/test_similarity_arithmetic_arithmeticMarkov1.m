clear
addpath('..\Huffman_RunLength\')
addpath('..\')

N=20000;
range = 0.05:0.05:0.95;
ratios_mar=[];
ratios_rand=[];
mar_entropy=[];
mar_entropy_rate=[];
rand_entropy=[];
rand_entropy_rate=[];

for p=range
    seq_mar=generateMarkov1String(N,p,p) ;
    randomArray = rand(1, 20000);
    seq_rand = randomArray > p;

    code_mar = encodeArithmeticMarkov1Modi(seq_mar,p);
    code_rand = encodeArithmetic(seq_rand, p);

    ratios_mar = [ratios_mar N/length(code_mar)];
    ratios_rand = [ratios_rand N/length(code_rand)];

    mar_entropy=[mar_entropy estimateEntropy(code_mar)];
    rand_entropy=[rand_entropy estimateEntropy(code_rand)];

    mar_entropy_rate=[mar_entropy_rate estimateEntropyRate(code_mar)];
    rand_entropy_rate=[rand_entropy_rate estimateEntropyRate(code_rand)];
end

figure;
plot(range, ratios_mar)
hold on
plot(range, ratios_rand)

mean(mar_entropy)
mean(rand_entropy)
mean(mar_entropy_rate)
mean(rand_entropy_rate)