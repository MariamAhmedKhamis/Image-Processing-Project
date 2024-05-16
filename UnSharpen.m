function [newimage,b] = UnSharpen(oldimage)
     oldimage = GrayScaleLum(oldimage);
     [old_rows, old_cols] = size(oldimage);
     newimage = zeros(old_rows,old_cols);
    oldimage=double(oldimage);
     newimage = double(newimage);
     imblurr = imgaussfilt(oldimage);
    imblurr = double(imblurr);
    b=imblurr;
    for i = 1 : old_rows
        for j = 1 : old_cols
            newimage(i,j)= 2*oldimage(i,j)-imblurr(i,j);      
            if newimage(i,j) > 255
                newimage(i,j) = 255;
            elseif newimage(i,j) < 0
                newimage(i,j) = 0;
            end
        end
    end
    newimage = uint8(newimage);
      oldimage = uint8(oldimage);
       figure, imshow(oldimage), title('old Image');
   
end


