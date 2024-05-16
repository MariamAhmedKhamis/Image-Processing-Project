function [newimage] = Sharpen(oldimage)
    oldimage = GrayScaleLum(oldimage);
     [old_rows, old_cols] = size(oldimage);
     newimage = zeros(old_rows,old_cols);
     oldimage =double(oldimage);
     newimage = double(newimage);
     
    for i = 2 : old_rows-1
        for j = 2 : old_cols-1
            newimage(i,j)= -5*oldimage(i,j)+oldimage(i-1,j)+oldimage(i+1,j)+oldimage(i,j+1)+oldimage(i,j-1);
            %newimage(i,j)= 5*oldimage(i-1,j)-oldimage(i+1,j)-oldimage(i,j-1)-oldimage(i,j+1);
           
        end
    end
    newimage = uint8(newimage);
      oldimage = uint8(oldimage);
       figure, imshow(oldimage), title('old Image');
   figure, imshow(newimage), title('New Image');
end


