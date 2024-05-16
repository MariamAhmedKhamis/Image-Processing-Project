function mattu=myown(p,q)
M = zeros(256,1,'uint8'); 
hist1 = imhist(p); 
hist2 = imhist(q);
cdf1 = cumsum(hist1) / numel(p);
cdf2 = cumsum(hist2) / numel(q);
for idx = 1 : 256
    [~,ind] = min(abs(cdf1(idx) - cdf2));
    M(idx) = ind-1;
end
[H, W] = size(p);
mattu=zeros(H,W,'uint8');
for x = 1: H
    for y = 1:W
             mattu(x,y) =M(double(p(x,y))+1);
    end
end
end