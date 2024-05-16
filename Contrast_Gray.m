function contrastedimage = Contrast_Gray(oldimage, newMin, newMax)
oldimage = GrayScaleLum(oldimage);
[rows,cols] = size(oldimage);
contrastedimage = zeros(rows,cols);
oldmin = 255;
oldmax = 0;

    for i = 1 : rows
        for j = 1 : cols
            if(oldimage(i,j) < oldmin)
                oldmin = oldimage(i,j);
            elseif(oldimage(i,j) > oldmax)
                oldmax = oldimage(i,j);
            end
        end
    end


    for i = 1 : rows
        for j = 1 : cols
            contrastedimage(i,j) = double(double(oldimage(i,j) - oldmin) / double(oldmax-oldmin)) * double(newMax - newMin) + double(newMin) ;
            if(contrastedimage(i,j) < 0)
                contrastedimage(i,j) = 0;
            elseif(contrastedimage(i,j)>255) %cut off
                contrastedimage(i,j) = 255;
            end
        end
    end

contrastedimage = uint8(contrastedimage);

end