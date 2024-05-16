function [newImage] = ideal_HPF(oldImage, D0)
oldImage = rgb2gray(oldImage);
[M, N] = size(oldImage);
newImage = zeros(M, N);
Fuv =fft2(oldImage);
Fuv =(fftshift(Fuv));
% Set up range of variables.
u = 0:(M - 1);
v = 0:(N - 1);
% Compute the indices for use in meshgrid.
idx = find(u > M/2);
u(idx) = u(idx) - M;
idy = find(v > N/2);
v(idy) = v(idy) - N;
% Compute the meshgrid arrays.
[V, U] = meshgrid(v, u);
% Compute the distances D(U, V).
D1 =D0;
D = sqrt(U.^2 + V.^2);
H =ifftshift(double(D <=D1));
HP = 1-H;
%Applying the transfer function
g=real(ifft2(HP .* Fuv));
%Crop to original size.
%g=g(1:size(F_u_v,1),1:size(F_u_v,2));
newImage = uint8(abs(g));
figure(1);subplot(1,2,1);imshow(newImage);
title('Filtered Image');subplot(1,2,2);imshow(HP,[]);title('Idle Lowpass filter');
end