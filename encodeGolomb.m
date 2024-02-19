function golombCode = encodeGolomb(runLengths, initialA, Nmax)

    N = 1;
    A = initialA;
    golombCode = [];

    for i = 1:length(runLengths)

        r = runLengths(i);
        k = max(0, ceil(log2(A/(2*N))));

        ru = floor(r / 2^k);
        unaryCode = [zeros(1, ru), 1];

        rc = mod(r, 2^k);
        binaryCode = dec2binvec(rc, k);

        golombCode = [golombCode, unaryCode, binaryCode];

        if N == Nmax
            A = floor(A / 2);
            N = floor(N / 2);
        end

        A = A + r;
        N = N + 1;

    end

end

