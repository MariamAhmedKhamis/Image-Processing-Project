function newimage = GrayScaleAvr(oldimage)
[oldrow,oldcol,c]=size(oldimage);
newimage = zeros(oldrow ,oldcol);
for i =1 : oldrow
    for j = 1 :oldcol
        newimage(i,j)= (oldimage(i,j,1)+oldimage(i,j,2)+oldimage(i,j,3))/3;
        if(newimage(i,j) < 0)
                newimage(i,j) = 0;
            elseif(newimage(i,j)>255)
                newimage(i,j) = 255;
        end
    end
end
newimage = uint8(newimage);
end