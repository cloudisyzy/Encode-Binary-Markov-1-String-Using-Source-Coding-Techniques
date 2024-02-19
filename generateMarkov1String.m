function markovString = generateMarkov1String(N, alpha, beta)
    markovString = zeros(1, N);
    markovString(1) = rand() > 0.5;
    for i = 2:N
        if markovString(i-1) == 0 % Previous bit = 0 
            markovString(i) = rand() <= alpha;
        else % Previous bit = 1
            markovString(i) = rand() >= beta;
        end
    end
end
