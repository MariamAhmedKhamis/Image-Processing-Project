function x = matche(img1, img2)
    x = zeros(size(img1));
    
    % Check if img1 is an RGB image
    if ndims(img1) == 3 && size(img1, 3) == 3
        % Split img1 into its color channels
        r1 = img1(:,:,1);
        g1 = img1(:,:,2);
        b1 = img1(:,:,3);
    else
        % Handle case where img1 is not an RGB image
        error('Input image img1 is not an RGB image.');
    end

    % Perform histogram equalization on both images
    img1 = HistoEqualization(img1);
    img2 = HistoEqualization(img2);

    % Perform histogram matching for each channel
    a = myown(r1, img2(:,:,1));
    b = myown(g1, img2(:,:,2));
    c = myown(b1, img2(:,:,3));

    % Display the original images and the matched image
    figure;
    tiledlayout(1, 4);

    nexttile;
    imshow(img1);
    title('Image 1');

    nexttile;
    imshow(img2);
    title('Image 2');

    nexttile;
    imshow(cat(3, a, b, c));
    title('Histogram Matched Image');

    % Concatenate the matched channels
    x(:,:,1) = a;
    x(:,:,2) = b;
    x(:,:,3) = c;
end
