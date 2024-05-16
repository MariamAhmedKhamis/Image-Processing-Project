function [newimagebymask] = midpointmask(oldimage,nunmask)
    oldimage = GrayScaleLum(oldimage);
    [old_rows, old_cols] = size(oldimage);
    coun = round(nunmask/2)-1;
    %pading by zero
       %newimagebymask = padarray(oldimage,[1 1],0, 'both');
   %pading by replicating
    newimagebymask = padarray(oldimage,[coun coun],'replicate', 'both');
    [new_rows, new_cols] = size(newimagebymask);
    newImage = zeros(old_rows, old_cols);
     coun = round(nunmask/2)-1;
       for x = coun+1 : new_rows-coun
            for y = coun+1 : new_cols-coun
                z = 1;
                array = zeros(nunmask*nunmask, 1);
                for i = x-coun : x+coun
                    for j = y-coun : y+coun
                        array(z) = newimagebymask(i, j);
                        z = z+1;
                    end
                end
                newImage(x, y) = round((max(array)+min(array))/2);
            end
        end
    newimagebymask = newImage;
    newImage = uint8(newImage);
    figure, imshow(oldimage), title('Old Image');
    figure, imshow(newImage), title('midpoint Filter Image');
end