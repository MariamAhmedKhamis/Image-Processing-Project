function newimage = GrayScaleLum(oldimage)
[oldrow,oldcol,c]=size(oldimage);
newimage = zeros(oldrow ,oldcol);
 i = 1 : oldrow;
   n=1 :oldcol;
        newimage(i,n)= (0.3*oldimage(i,n,1)+0.59*oldimage(i,n,2)+.11*oldimage(i,n,3));
newimage = uint8(newimage);
end
