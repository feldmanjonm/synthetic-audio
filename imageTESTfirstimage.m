
% read the image file
infile = '_img/image.jpg';
I = imread(infile);

% make image square
I = I(1:2387,1:2387,:);

J1 = squeeze(I(:,:,1));
J2 = squeeze(I(:,:,2));
J3 = squeeze(I(:,:,3));

J = J1 + J2 + J3;

B = [ 1 -1 1; -1 1 -1; 1 -1 1 ];

Y = conv2(J,B);

figure(1);
image(J);

figure(2);
image(Y);
