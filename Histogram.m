function [countpixal] = Histogram(oldimage)
countpixal = zeros(1,256);
oldimage = GrayScaleLum(oldimage);
[r,c]=size(oldimage);
            for x = 1 : r
               for y = 1 : c
                 for i = 1 : 256
                  if (oldimage(x, y) == i-1)
                      countpixal(i) = countpixal(i)+1 ;
                  end  
                 end    
               end  
            end   
end