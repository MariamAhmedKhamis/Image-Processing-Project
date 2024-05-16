function newimage = filter_Weighted_Guassian1(oldimage, segma)
    oldimage = GrayScaleLum(oldimage);
     N = round(3.7*segma-0.5);
    MSize = 2*N+1;
    mask = ones(MSize ,MSize );
    x = (floor(-MSize /2):floor(MSize /2));
    y = (floor(-MSize /2):floor(MSize /2));

    index = 1;
    for i=1:MSize 
        for j=1:MSize 
            coef = 1/(2*pi*power(segma,2));
            mask(i,j)= coef*exp(-(power(x(index),2)+power(y(index),2))/(2*power(segma,2)));
        end
        index = index + 1;
    end
    
    %%replicate the image    
    newimage = padarray(oldimage,[MSize MSize], 'replicate', 'both');
    [new_rows, new_cols] = size(newimage);
    
    %%Create New Image Which will Be the Filtered Image
    newimage2 = newimage;
    
    %%====== Start Applying the Filter on the New Image ======= 
   
        for row=1:new_rows-MSize+1
            for col=1:new_cols-MSize+1
                
                %filter the image
                val = 0;
                for i=1:MSize
                    for j=1:MSize
                        val = val + (newimage(row+i-1, col+j-1) * mask(i, j));
                    end
                end
                newimage2(row+1, col+1) = val;
       
            end
        end
  
    %%Display the new image
    newimage2 = uint8(newimage2);
end