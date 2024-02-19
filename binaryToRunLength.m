function [startBit, runLengths] = binaryToRunLength(binaryString)

    runLengths = [];
    currentRunLength = 1;
    startBit = binaryString(1);

    for i = 2:length(binaryString)
        if binaryString(i) == binaryString(i-1)
            currentRunLength = currentRunLength + 1;
        else
            runLengths = [runLengths, currentRunLength];
            currentRunLength = 1;
        end
    end

    runLengths = [runLengths, currentRunLength];

end
