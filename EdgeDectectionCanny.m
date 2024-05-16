function [ newimage ] = EdgeDectectionCanny( oldimage )
[row,col,chanel]=size(oldimage);
if chanel>1
    oldimage=GrayScaleLum(oldimage);
end
newimage=edge(oldimage,'canny');

end

