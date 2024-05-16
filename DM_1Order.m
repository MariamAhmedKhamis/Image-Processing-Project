function Resized_image = DM_1Order(Original_image,factor)
% Get image size
[rows,cols,channels]=size(Original_image);
Resized_image=zeros(rows*factor,cols*factor,channels);
% move over 3 channels
for k=1:channels
    x = 1;
    for i=1:rows
        y = 1;
        for j=1:cols
            Resized_image(x , y , k) = Original_image(i , j , k);
            y = y + factor;
        end
        x = x + factor;
    end
end
for k=1:channels
    for i=1:rows
        x = 1 + (i-1)*factor;
        for j=1:cols
            c = 1;
            if(j + 1 > cols)
                max = Original_image(i,j,k);
                min = Original_image(i,j,k);
                y = 1 + (j-1) * factor;
                d = 1;
            elseif(Original_image(i,j,k) > Original_image(i,j+1,k))
                max = Original_image(i,j,k);
                min = Original_image(i,j+1,k);
                y = 1 + j * factor;
                d = -1;
            else
                max = Original_image(i,j+1,k);
                min = Original_image(i,j,k);
                d = 1;
                y = 1 + (j-1) * factor;
            end 
            while( c <= factor - 1)
                Resized_image(x,y+d,k) = round((max-min)/factor * c + min);
                y = y + d;
                c = c + 1;
            end
        end
    end
end
for k=1:channels
    for i=1:cols * factor
        for j=1:rows
            curRow = 1 + (j-1)*factor;
            nextRow = 1 + j*factor;
            c = 1;
            if(j + 1 > rows)
                max = Resized_image(curRow,i,k);
                min = Resized_image(curRow,i,k);
                y = curRow;
                d = 1;
            elseif(Resized_image(curRow,i,k) > Resized_image(nextRow,i,k))
                max = Resized_image(curRow,i,k);
                min = Resized_image(nextRow,i,k);
                y = nextRow;
                d = -1;
            else
                max = Resized_image(nextRow,i,k);
                min = Resized_image(curRow,i,k);
                d = 1;
                y = curRow;
            end
            while(c <= factor - 1)
                y = y + d;
                Resized_image(y,i,k) = round((max-min)/factor * c + min);
                c = c + 1;
            end
        end
    end
end
Resized_image=uint8(Resized_image);

end