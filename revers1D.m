function newimage = revers1D(image , rfact,cfact)
[old_rows, old_cols, ch]=size(image);
Newrows = old_rows * rfact;
Newcols = old_cols * cfact;
newimage = zeros(Newrows, Newcols, ch,'uint8');
rowratio = old_rows / Newrows;
colratio = old_cols / Newcols ;
for k=1:ch
    for i =1 :Newrows
         oldx = i*rowratio;
         X1 = floor (oldx)	;                   
         X2 = X1 + 1;
          if (X1 == 0)
              X1=1;
         end
        if (X2 > old_rows)
              X2 = old_rows;
        end
          for j=1:Newcols
             oldy = j * colratio;
             Y1 = floor (oldy)	;
             Y2 = Y1 + 1;
             if (Y1 == 0)
               Y1=1;
             end
             if (Y2 > old_cols)
                 Y2 = old_cols;
             end
               P1 = image(X1,Y1,ch); 
               P2 = image(X2,Y1,ch);
               P3 = image(X1,Y2,ch);
               P4 = image(X2,Y2,ch) ; 
               
               X_fraction = oldx - X1;
               Y_fraction = oldy - Y1;
                
               
               Z1 = P1 * (1 - X_fraction) + P2 * X_fraction;
               Z2 = P3 *(1 - X_fraction) + P4 * X_fraction;
               
               
               New_Pixel = Z1 * (1 - Y_fraction) + Z2 * Y_fraction;
              if(New_Pixel == 0)
                New_Pixel = 1;
              end
             newimage(i, j, k) = floor (New_Pixel);
          end
    end
end
figure;imshow(newimage);title('revers resize Of Image');

end