function [maskedImage] = Mid_point_Filter(oldImage)
    [old_rows, old_cols ,c] = size(oldImage);
    if c>1
        oldImage=GrayScaleLum(oldImage);
    end      
    maskedImage = padarray(oldImage,[1 1],'replicate', 'both');
    [new_rows, new_cols] = size(maskedImage);
    newImage = zeros(old_rows, old_cols);
   
        for x = 2 : new_rows-1
            for y = 2 : new_cols-1
                index = 1;
                vert = zeros(9, 1);
                for i = x-1 : x+1
                    for j = y-1 : y+1
                        vert(index) = maskedImage(i, j);
                        index = index+1;
                    end
                end
                
                Mid_point = 0.5 *(max(vert) + min(vert));
                newImage(x-1, y-1) = Mid_point;
            end
        end
     maskedImage = newImage;
     newImage = uint8(newImage);
     maskedImage = newImage;
end