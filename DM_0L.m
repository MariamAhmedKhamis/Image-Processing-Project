function Resized_image = DM_0L(image,factor)
% Get image size
[rows,cols,channels] = size(image);
Resized_image = zeros(rows*factor,cols*factor,channels);
% move over 3 channels
for k=1:channels
    x = 1;
    for i=1:rows
        y = 1;
        for j=1:cols
            Resized_image(x : x + factor-1 , y : y+factor-1 , k ) = image(i,j,k);
            y = y + factor;
        end
        x = x + factor;
    end
end
%Casting image type for show
Resized_image=uint8(Resized_image);
figure;imshow(Resized_image);
title('direct resize Of Image');

end