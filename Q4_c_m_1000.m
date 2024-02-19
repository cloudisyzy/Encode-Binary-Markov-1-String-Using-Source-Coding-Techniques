clear

N = 20000;
m = 1000;
L_1 = N/m;
entropy_rate_string_track = [];
entropy_rate_enc_string_track = [];
range = 0.1:0.05:0.9;

for alpha = range
    beta = alpha;
    string = generateMarkov1String(N, alpha, beta);
    enc_string = encodeArithmeticMarkov1Modi(string, alpha);
    L_2 = floor(length(enc_string)/m);

    entropy_rate_string_m_hist = [];
    entropy_rate_enc_string_m_hist = [];
    for i = 1:L_1
        idx = (i-1)*m+1:i*m;
        entropy_rate_string_m = estimateEntropyRate(string(idx));
        entropy_rate_string_m_hist = [entropy_rate_string_m_hist entropy_rate_string_m];
    end
    for i = 1:L_2
        idx = (i-1)*m+1:i*m;
        entropy_rate_enc_string_m = estimateEntropyRate(enc_string(idx));
        entropy_rate_enc_string_m_hist = [entropy_rate_enc_string_m_hist entropy_rate_enc_string_m];
    end

    entropy_rate_string = mean(entropy_rate_string_m_hist);
    entropy_rate_enc_string = mean(entropy_rate_enc_string_m_hist);

    entropy_rate_string_track = [entropy_rate_string_track entropy_rate_string];
    entropy_rate_enc_string_track = [entropy_rate_enc_string_track entropy_rate_enc_string];
end

figure;
plot(range, entropy_rate_string_track, '-x', Color='r', LineWidth=1.5)
hold on 
plot(range, entropy_rate_enc_string_track, '--*', Color='b', LineWidth=1.5)
ylim([0 1])
title('m = 1000')
xlabel('\alpha')
ylabel('Entropy Rate H\{X_n\}')
legend('Markov-1 String', 'Arithmetic Code Stream')