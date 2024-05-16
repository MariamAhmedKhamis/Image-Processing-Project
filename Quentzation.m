function  [newimage] = Quentzation(oldimage , k)
image =  GrayScaleLum(oldimage) ;
[oldrows ,oldcol] = size(image);
newimage = zeros(oldrows, oldcol,'uint8');
Gray_level = power(2, k);
Gap = 256 / Gray_level;
Colors = Gap : Gap : 256;

for i = 1 : oldrows
    for j = 1 : oldcol
        temp = image(i,j)/Gap;
        index= floor(temp);
       if(index > 255)
         index = 255; 
      elseif(index < 1) 
                    index = 1;
       end 
        newimage(i,j)=Colors(index);
    end
end
    
end    