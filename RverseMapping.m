function [ newImage ] = RverseMapping( oldImage,newRow,newColumn )
[oldRow , oldColumn] = size(oldImage);
 newImage = zeros(newRow,newColumn,3,'uint8');
[newRow , newColumn] = size(newImage);
rowRatio = oldRow / newRow;
colRatio = oldColumn / newColumn;

for i = 1:newRow
    oldx = i*rowRatio;
    for j = 1:newColumn
       oldy = j*colRatio;
        x1=floor(oldx);
        if(x1<1)
            x1=1;
        end
        y1=floor(oldy);
         if(y1<1)
            y1=1;
        end
        x2=x1+1;
        if(x2<newRow)
            x2=x2-1;
        end
        y2=y1+1;
        if(y2<newColumn)
            y2=y2-1;
        end
        p1=oldImage(x1,y1);
        p2=oldImage(x2,y1);
        p3=oldImage(x1,y2);
        p4=oldImage(x2,y2);
        xfraction=oldx-x1;
        yfraction=oldy-y1;
        
        z1=p1*(1-xfraction)+p2*xfraction;
        z2=p3*(1-xfraction)+p4*xfraction;
        
        newPixel=z1*(1-yfraction)+z2*yfraction;
       newImage(i,j)=uint8(newPixel);
    end
end
imshow(newImage);
title('NewImage');


end

