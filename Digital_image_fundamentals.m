x=imread('lenna.jpg');
figure,imshow(x),title('lenna');
impixelinfo();

y=rgb2gray(x);
figure,imshow(y),title('gray');
impixelinfo();

I = imread('lenna.jpg');
subplot(2,1,1), imshow(I)
%I(I<100) = 255;     %By using Logical Indexing
I(50:100,40:80) = 255;
subplot(2,1,2), imshow(I)

I = imread('E:\6 Sem\DIP\cameraman.tif');
subplot(3,1,1), imshow(I)
I6 = bitget(I,6)*2^6;
subplot(3,1,2), imshow(I6)
J = I - I6;
subplot(3,1,3), imshow(J)

z=imsubtract(y,50);
figure,imshow(z);

figure;
subplot(1,2,1),imshow(x),title('colour');
subplot(1,2,2),imshow(y),title('gray');

I = imread('E:\6 Sem\DIP\cameraman.tif');
I_6_Bit = uint8(floor(double(I)/4));
I_4_Bit = uint8(floor(double(I)/8));
subplot(3,1,1), imshow(I)
subplot(3,1,2), imshow(I_6_Bit)
subplot(3,1,3), imshow(I_4_Bit)

%[r,c]=size(x);
%I(1:r/2,1:c/2)=x(1:2:r,1:2:c);
%figure;
%subplot(1,2,1),imshow(x);
%subplot(1,2,2),imshow(I);

p=imread('lenna.jpg');
b=imresize(p,0.5,'bilinear');
n=imresize(p,0.5,'nearest');
figure;
subplot(1,2,1),imshow(b);
subplot(1,2,2),imshow(n);

r=imrotate(p,45);
figure;
subplot(1,2,1),imshow(p);
subplot(1,2,2),imshow(r);

imshow('E:\6 Sem\DIP\lena_color_512.tif')
[x,y] = ginput(2);
D4 = abs(x(2)-x(1))+abs(y(2)-y(1))
D8 = max(abs(x(2)-x(1)),abs(y(2)-y(1)))
Euclidian = sqrt((x(2)-x(1))^2+(y(2)-y(1))^2);
fprintf('D4 distance between selected points is %f\n', D4)
fprintf('D8 distance between selected points is %f\n', D8)
fprintf('Euclidian distance between selected points is %f\n', Euclidian)