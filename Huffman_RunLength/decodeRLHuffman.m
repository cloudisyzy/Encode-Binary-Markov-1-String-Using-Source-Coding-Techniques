function binaryString = decodeRunLengthCode(startBit, encodedRunLengths, dict)

    % Decode the Huffman encoded run lengths
    decodedRunLengths = huffmandeco(encodedRunLengths, dict);
    binaryString = [];
    currentBit = startBit;
    
    for i = 1:length(decodedRunLengths)
        binaryString = [binaryString repmat(currentBit, 1, decodedRunLengths(i))];
        % Flip the bit for next iteration
        currentBit = ~currentBit;
    end

end
