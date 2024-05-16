
function x = weightedFilter(img, sigma)
    title('Original Image');
    x = zeros(size(img));
    [mask, ~] = GaussianMask(sigma);
    masksize = size(mask, 1);
    halfmask = floor(masksize / 2);
    tempimg = padarray(img, [halfmask, halfmask], 'replicate', 'both');
    
    for k = 1:size(img, 3)
        for i = 1:size(img, 1)
            for j = 1:size(img, 2)
                tmask = double(tempimg(i:i+masksize-1, j:j+masksize-1, k)) .* mask;
                newvalue = sum(tmask(:));
                x(i, j, k) = newvalue;
            end
        end
    end
    x = uint8(x);
    subplot(1,2,2);
    imshow(x);
    title('Filtered Image');
end

function [mask, masksize] = GaussianMask(sigma)
    masksize = 2 * ceil(3 * sigma) + 1;
    mask = zeros(masksize);
    center = (masksize + 1) / 2;
    for i = 1:masksize
        for j = 1:masksize
            mask(i, j) = exp(-((i - center)^2 + (j - center)^2) / (2 * sigma^2));
        end
    end
    mask = mask / sum(mask(:)); % Normalize the mask
end

