
function x= geometric_mean_filter(img,sof)%sof=size of filter (sof =3 or 5 or ...)
figure;
subplot(1,2,1);imshow(img),title('original');
x=zeros(size(img));
temp=padarray(img,[floor(sof/2) floor(sof/2)],'replicate','both');
mask=repmat(1/(sof^2),sof,sof);
for k=1:size(img,3)
    for i =1:size(img,1)
        for j=1:size(img,2)
           tmask= mask.*double(temp(i:i+sof-1,j:j+sof-1,k));
           newvalue=sum(sum(tmask));
           x(i,j,k)=newvalue;
        end
    end
end
x=uint8(x);
subplot(1,2,2);imshow(x),title('New Image');
end