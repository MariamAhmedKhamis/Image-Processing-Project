function newImage = ImageNegative(oldImage)
    [rows, cols, ch] = size(oldImage);
    newImage = zeros(rows, cols, ch,'uint8');
    k = 1 : ch;
         x = 1 : rows;
            y = 1 : cols;
                newImage(x, y, k) = 255 - oldImage(x, y, k);
            
   
end