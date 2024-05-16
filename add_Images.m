function newimage = add_Images(oldimage1, oldimage2)
    [oldrows, oldcols,c] = size(oldimage2);
    image = imresize(oldimage1, [oldrows, oldcols]);
    newimage = zeros(oldrows, oldcols,c,'uint8');
    for z=1:c
        for i = 1 : oldrows
            for j = 1 : oldcols
                newimage(i, j,z) = oldimage2(i, j,z) + image(i, j,z);
                if(newimage(i, j,z) > 255)
                    newimage(i, j,z) = 255;
                elseif(newimage(i, j,z) < 0)
                    newimage(i, j,z) = 0;
                end
            end
        end
    end
    
end