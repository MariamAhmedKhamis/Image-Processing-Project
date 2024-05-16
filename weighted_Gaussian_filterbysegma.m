function [newimagebymask] = weighted_Gaussian_filterbysegma(oldimage, segma)
    oldimage = GrayScaleLum(oldimage);
   [old_rows, old_cols] = size(oldimage);
    N = round((3.7*segma)-0.5);
    
    nunmask = 2*N+1;
    coun = round(N/2)-1;
    maskguass = ones(nunmask ,nunmask );
    x = (floor(-nunmask /2):floor(nunmask /2));
    y = (floor(-nunmask /2):floor(nunmask /2));

    ind = 1;
    for i=1:nunmask 
        for j=1:nunmask 
            cf = 1/(2*pi*power(segma,2));
            maskguass(i,j)= cf*exp(-(power(x(ind),2)+power(y(ind),2))/(2*power(segma,2)));
        end
        ind = ind + 1;
    end    
   
    %pading by zero
       %newimagebymask = padarray(oldimage,[coun coun],0, 'both');
   %pading by replicating
    newimagebymask = padarray(oldimage,[coun coun],'replicate', 'both');
    [new_rows, new_cols] = size(newimagebymask);
    newImage = zeros(old_rows, old_cols);
    
    maskguass = maskguass(:);
         for x = coun+1 : new_rows-coun
            for y = coun+1 : new_cols-coun
                z = 1;
                sum = 0;
                for k = i-1 : i+1
                    for w = j-1 : j+1
                       sum = sum + newimagebymask(k, w) * maskguass(z);
                        z = z+1;
                    end
                end
                newImage(i, j) = sum ;
            end
        end

   newimagebymask = newImage;
   newImage = uint8(newImage);
    newimagebymask = newImage;
    imshow(newimagebymask);
end

