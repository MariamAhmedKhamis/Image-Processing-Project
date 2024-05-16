function newimage = GrayScaleDes(oldimage)
[oldrow,oldcol,c]=size(oldimage);
newimage = zeros(oldrow ,oldcol);
 for i= 1 : oldrow
  for j = 1 :oldcol
        newimage(i,j)= (max(oldimage(i,j,1)+oldimage(i,j,2)+oldimage(i,j,3))+min(oldimage(i,j,1)+oldimage(i,j,2)+oldimage(i,j,3)))/2;
  end
 end
newimage = uint8(newimage);

end
