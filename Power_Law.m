function powerImage = Power_Law(oldImage, gamma)
[rows,cols,ch] = size(oldImage);
powerImage = zeros(rows,cols,ch,'uint8');
for k = 1 : ch
    for x = 1 : rows
        for y = 1 : cols
            powerImage(x,y,k) = oldImage(x,y,k)^gamma ;
        end
    end
end
powerImage = Contrast(powerImage,0,255);
end