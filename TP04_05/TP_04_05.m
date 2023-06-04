clear all;
close all;
clc;

im1=imread('cameraman.tif');

%=========Filtre Moyenneur 'Passe_bas'=====================================

vect1=fspecial('average',3);
imfilt_avereage2=filter2(vect1,im1,'same');
imfilt_avereage3=filter2(vect1,im1,'valid');
imfilt_avereage4=filter2(vect1,im1,'full');

figure,
subplot(221),imshow(im1),title('Image Originale');
subplot(222),imshow(imfilt_avereage2/255),title('Image Filtrer Moyenneur''same''');
subplot(223),imshow(imfilt_avereage3/255),title('Image Filtrer Moyenneur''valid''');
subplot(224),imshow(imfilt_avereage4/255),title('Image Filtrer Moyenneur''full''');



%========Filtre Gaussienne 'Passe_bas' 'Image couleur'=====================
im2=imread('IMG.JPG');
im2_noise=imnoise(im2,'gaussian');
sigma=3;
cuteoff=ceil(3*sigma);
h=fspecial('gaussian',2*cuteoff,sigma);
for i=1:3
im2_n_resul(:,:,i)=conv2(double(h),double(im2_noise(:,:,i)));
end
figure,
subplot(1,3,1); imshow(im2); title('Image Originale');
subplot(1,3,2); imshow(im2_noise); title('Image Noised');
subplot(1,3,3); imshow(im2_n_resul/255); title('Image noised filtred gauss');

figure,
surf(h),title('courbe de gauss');
%=========Filtre Wiener 'Passe_bas'========================================

for i=1:3
    w(:,:,i)=wiener2(im2_noise(:,:,i),[5 5]);
end
figure
subplot(1,2,1)
imshow(im2_noise); title('noised image');
subplot(1,2,2)
imshow(w); title('filtered image wiener');



%===========Filtres linéaires passe haut===============================
clear all;
clc;

image =imread('circuit.tif');
Px=[-1 0 1;-1 0 1]; %deriveé par rapport au x
Imagex=filter2(Px,image); %calcul de l'intensité de l'image par rapport a x
figure,imshow(Imagex/255),title('Contour Verticale');
Py =Px';%deriveé par rapport au y
Imagey=filter2(Py,image); %calcul de l'intensité de l'image par rapport a y
figure, imshow(Imagey/255),title('Contour Horizontale');
edge=sqrt(Imagex.^2+ Imagey.^2);
figure, imshow(edge/255),title('Tous les Contour');

%======Seuillage ====
im_s=edge>(0.3*255);
figure,
imshow(im_s),title('Seuillage');

%=============La morphologie mathématique==================================
clear all;
clc;

image=imread ('IMG.JPG') ;
im3=image ;
x=im2bw(im3);
se=[0 1 0;1 1 1;0 1 0];
im4=imopen(x,se);
figure,
imshow(im4),title('ouverture');
se2=strel('disk',10);
closebw=imclose(x,se2);
figure,
imshow(closebw),title('fermeture');




