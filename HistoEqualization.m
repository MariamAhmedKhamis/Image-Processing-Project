function [newimage, colround] = HistoEqualization(oldimage)
   oldimage = GrayScaleLum(oldimage);
    %size of old image
    [rows, cols] = size(oldimage);
    %create new image
    newimage = zeros(rows, cols);
    %create the table which get the round of each pixel from it
    histo = zeros(256, 5, 1); 
    %full the first col from 0 to 255
    
    for i=1:256
        histo(i, 1) = i-1;
    end
    
    % Start loop for the depth channels of the image
        % step 1 => Calculate the histogram
        for i=1:256
            count = 0; %used to count number of levels for single value
            for row=1:rows
                for col=1:cols
                    if oldimage(row, col) == i-1
                        count = count + 1;
                    end
                end
            end
            histo(i, 2) = count;  %col 2
        end

        % step 2 => Calculate running sum over the histogram.
        max_value = 0; %used in step 3 to divide on it all indexes
        histo(1, 3) = histo(1, 2); %get the first value from #pixels to Run.sum
        
        for i=2:256
            sum = histo(i, 2) + histo(i-1, 3); 
            histo(i, 3) = sum;
            if sum > max_value
                max_value = sum;
            end
        end

        % step 3 => Divide each value by the max value.
        for i=1:256
            histo(i, 4) = histo(i, 3) / max_value;
        end

        % step 4 => Multiply by the new range
        % step 5 => Round the results
        
        for i=1:256
            histo(i, 5) = round(histo(i, 4) * 255);
        end

        %step 6 => Replace the color of each pixel by the corresponding new color
        for i=1:256
            for row=1:rows
                for col=1:cols
                    if oldimage(row, col) == histo(i, 1)
                        newimage(row, col) = histo(i, 5);
                    end
                end
            end
        end
 
    
    colround(:, 1) = histo(:, 5); % return round colomn for using it in histogram matching 
    newimage = uint8(newimage);

end
