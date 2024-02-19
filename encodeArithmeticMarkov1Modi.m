function codeArithmetic = encodeArithmeticMarkov1Modi(string, alpha)
    N = 22;
    P = 8;
    C = 0;
    A = 2^N;
    r = -1;
    b = 0;
    codeArithmetic = [];
%     mask = 2^(N+P) - 1;
    P_diff= floor(alpha * 2^P);
    P_same = floor((1-alpha) * 2^P);
    prevBit = string(1);

    for xn = string
        
        if alpha <= 0.5
            if xn == prevBit
                T = A * P_same;
            elseif xn ~= prevBit
                T = A * P_diff;            
                C = C + T;
            end                                           

        elseif alpha > 0.5
            if xn == prevBit
                T = A * P_same;
                C = C + T;
            elseif xn ~= prevBit
                T = A * P_diff;
            end
                            
            
        end

        if C >= 2^(N+P)
%             C = round(C);
%             C = bitand(C, mask);
            C = mod(C, 2^(N+P));
            codeArithmetic = [codeArithmetic 1];
            if r > 0
                codeArithmetic = [codeArithmetic zeros(1,r-1)];
                r = 0;
            else
                r = -1;
            end
        end

        while T < 2^(N+P-1)
            b = b + 1;
% 		    T = bitshift(T, 1);
% 		    C = bitshift(C, 1);
            T = 2 * T;
		    C = 2 * C;

            if C >= 2^(N+P)

%                 C = round(C);
%                 C = bitand(C, mask);
                C = mod(C, 2^(N+P));
                if r < 0
                    codeArithmetic = [codeArithmetic 1];
                else
                    r = r + 1;
                end

            else
                
                if r >= 0
                    codeArithmetic = [codeArithmetic 0 ones(1,r)];
                end
                r = 0;

            end
        end

        A = floor(T / 2^P);
        prevBit = xn;
      
    end

    if r >= 0
        codeArithmetic = [codeArithmetic 0 ones(1,r)];
    end

    C_bin = dec2binvec(C);
    if length(C_bin) > (N + P)
        C_bin = C_bin(end-(N+P)+1:end); 
    end
    codeArithmetic = [codeArithmetic C_bin]; 
end

