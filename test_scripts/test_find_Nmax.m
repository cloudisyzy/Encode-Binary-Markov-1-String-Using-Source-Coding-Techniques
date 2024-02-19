clear
addpath('..\Huffman_RunLength\')
addpath('..\')

L = 6000;
alpha_list = [0.05 0.1 0.15 0.2 0.3 0.5 0.95];
len_hist = zeros(length(alpha_list), 200);

for i = 1:length(alpha_list)
    
    alpha = alpha_list(i);
    beta = alpha;
    string = generateMarkov1String(L,alpha,beta);
    [bit_1, string_rl] = binaryToRunLength(string);
    string_rl = string_rl - 1;
    
    for j = 1:200
        code_Golomb = encodeGolomb(string_rl, mean(string_rl), j);
        len = length(code_Golomb);
        len_hist(i,j) = len;
    end
    
end


figure;
for i = 1:size(len_hist,1)
%     plot(1:200, len_hist(i,:)/mean(len_hist(i,:)),LineWidth=1.5)
    plot(1:200, L./len_hist(i,:),LineWidth=1.5)
    hold on 
end
xlabel('N_{max}')
ylabel('Ratio (length source / length encoded)')
legend('\alpha = 0.05', '\alpha = 0.1', '\alpha = 0.15', '\alpha = 0.2', '\alpha = 0.3', '\alpha = 0.5', '\alpha = 0.95');
