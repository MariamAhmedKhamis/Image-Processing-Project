function out = RM_0_order(oldImage, fact_r, fact_c)
[r, c, ch] = size(oldImage);
new_r = r * fact_r;
new_c = c * fact_c;
r_ratio = r / new_r;
c_ratio = c / new_c;
out = zeros(new_r, new_c, ch);
for k = 1:ch
    for new_x = 1:new_r
        old_x = new_x * r_ratio;
        old_x = floor(old_x);
        if(old_x == 0)
            old_x = 1;
        end
        for new_y = 1:new_c
            old_y = new_y * c_ratio;
            old_y = floor(old_y);
            if(old_y == 0)
                old_y = 1;
            end
            out(new_x, new_y, k) = oldImage(old_x, old_y, k);
        end
    end
end
out = uint8(out);
figure, imshow(oldImage), title('Original');
figure, imshow(out), title('Resized');
end
