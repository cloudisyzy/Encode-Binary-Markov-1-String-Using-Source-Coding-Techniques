clear

code_len = [1 1 2 3 2 3];

kraft(2,code_len) <= 1
kraft(3,code_len) <= 1
kraft(4,code_len) <= 1

code_len_2 = [1 2 2];
code_len_3 = [2 2 3 3];

kraft(2, code_len_2)
kraft(2, code_len_3)

code_len_4 = [1 2 2 2 2];
code_len_5 = [2 2 2 2 2 2 2 2 3 3 3];
kraft(3, code_len_4)
kraft(3, code_len_5)

function left = kraft(D, codeLengths)

    left = sum(D .^ (-codeLengths));

end

