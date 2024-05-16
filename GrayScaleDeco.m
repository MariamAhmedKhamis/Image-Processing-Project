function newimage = GrayScaleDeco(oldimage)
[oldrow,oldcol,c]=size(oldimage);
newimage = zeros(oldrow ,oldcol);
 for i= 1 : oldrow
  for n = 1 :oldcol
       newimage(i,n)= min(oldimage(i,n,1)+oldimage(i,n,2)+oldimage(i,n,3));
  end
 end
newimage = uint8(newimage);

end
