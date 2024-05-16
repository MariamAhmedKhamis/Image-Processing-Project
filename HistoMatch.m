% Function for histogram matching
function newimage = HistoMatch(oldimage, col1round, col2round)
    % Convert images to grayscale using luminance method
    oldimage = GrayScaleLum(oldimage);
    
    % Create the histogram table
    hist = zeros(256, 4, 1);

    % Fill the first column from 0 to 255
    for i = 1:256
        hist(i, 1) = i - 1;
    end
    
    newimage = oldimage;
    hist(:, 2) = col1round;
    hist(:, 3) = col2round;
    
    % Compare between the rounds of two images
    for i = 1:256
        pixel = hist(i, 2); % Select the round value of the first image for each iteration
        dif = 10000; % Compute the difference between the pixels to find the closest row
        
        % Select the row index of the closest value near to pixel1 value
        for j = 1:256
            x = abs(pixel - hist(j, 3));
            if x < dif 
                dif = x;
                pointer = j;
            end
        end
        
        % Add the color to the matching column
        hist(pointer, 4) = hist(pointer, 1);
    end
    
    % Replace the color of each pixel by the corresponding new color
    [rows, cols] = size(newimage);
     
    for i = 1:256
        for row = 1:rows
            for col = 1:cols
                if newimage(row, col) == hist(i, 1)
                    newimage(row, col) = hist(i, 4);
                end
            end
        end
    end
end
