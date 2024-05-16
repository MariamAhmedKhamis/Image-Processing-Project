function [ grayImage ] = ConvertRGB2Gray2( image )
% RGB2Gray Average Algorithm

[Rows,Columns,~]=size(image);
grayImage =zeros(Rows,Columns,'uint8');

  for i=1:Rows
      for j=1:Columns       
    grayImage(i,j)=0.3*image(i,j,1)+0.59*image(i,j,2)+0.11*image(i,j,3);end
  end
  
end