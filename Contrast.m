function contrastimage = Contrast(oldimage,newmin,newmax)
[oldrows,oldcols,c] = size(oldimage);
contrastimage = zeros(oldrows,oldcols,c,'uint8');
oldmin = 255;
oldmax = 0;
for z= 1 : c
    for i = 1 : oldrows
        for j = 1 : oldcols
             if(oldimage(i,j,z) < oldmin)
                oldmin = oldimage(i,j,z);
             elseif(oldimage(i,j,z) > oldmax)
                oldmax = oldimage(i,j,z );
             end 
        end
     end
end
for z= 1 : c
    for i = 1 : oldrows
        for j = 1 : oldcols
            contrastimage(i,j,z) = ((oldimage(i,j,z) - oldmin) / (oldmax-oldmin)) * (newmax - newmin) + (newmin) ;
            if(contrastimage(i,j,z) < 0)
                contrastimage(i,j,z) = 0;
            elseif(contrastimage(i,j,z)>255)
                contrastimage(i,j,z) = 255;
            end
        end
     end
end
%figure,imshow(contrastimage),title('NewImage');
end

