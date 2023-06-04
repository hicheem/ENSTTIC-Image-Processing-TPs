clear all;
close all;
clc;
im=imread('onion.png');
im1=imrotate(im,45);

subplot(1,2,1),imshow(im),title('Image Originale')
subplot(1,2,2),imshow(im1),title('Rotation 45°');
