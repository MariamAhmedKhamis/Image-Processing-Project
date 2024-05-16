function [newimage] = direct_resize(image , numsize)
[rows, cols, ch] = size(image);
newrows=rows*numsize;
 f = newrows/rows;
newimage = zeros(rows*numsize, cols*numsize, ch);
for k =1:ch
    for i=1:rows
        for j=1:cols
            newimage(i*f-f+1:i*f,j*f-f+1:j*f,k)=image(i,j,k);
            
        end 
    end 
end
newimage=uint8(newimage);
figure;imshow(newimage);title('direct resize Of Image');
end