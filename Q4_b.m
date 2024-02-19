clear

N = 20000;
entropy_string_track = [];
entropy_enc_string_track = [];
range = 0.1:0.05:0.9;
% range = 0.01:0.05:0.99;

for alpha = range
    beta = alpha;
    string = generateMarkov1String(N, alpha, beta);
    enc_string = encodeArithmeticMarkov1Modi(string, alpha);
    entropy_string = estimateEntropy(string);
    entropy_enc_string = estimateEntropy(enc_string);
    entropy_string_track = [entropy_string_track entropy_string];
    entropy_enc_string_track = [entropy_enc_string_track entropy_enc_string];
end

figure;
plot(range, entropy_string_track, '-x', Color='r', LineWidth=1.5)
hold on 
plot(range, entropy_enc_string_track, '--*', Color='b', LineWidth=1.5)
ylim([0 1])
xlabel('\alpha')
ylabel('Entropy H(x)')
legend('Markov-1 String', 'Arithmetic Code Stream')

