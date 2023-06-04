clear all;
close all;
clc;

%=========================================================================%
im = imread('IMG.JPG');
imchoise = rgb2gray(im);
[r c]=size(imchoise);
imtool(imchoise);
figure(1),imhist(imchoise);

%===================Histogramme cumulée===================================%
    %___1-Calcul d'Histogramme

h=imhist(imchoise);
    %___2-Calcul d'Histogramme cumulée 
hc(256)=0;
d=0;
for i=1:256
    hc(i)=h(i)+d;
    d=hc(i);
end
subplot(1,2,1),plot(h),title('Histogramme');
subplot(1,2,2),plot(hc),title('Histogramme cumulée ');

%==============la luminance ==============================================%

l=0;
for i=1:r
    for j=1:c
        l=l+imchoise(i,j);
    end
end
moyenne=double(l)/double((r*c));
%==========================================================================

%===========Contraste======================================================

%===1-Michelson ======
minimum=min(min(imchoise));
maximum=max(max(imchoise));
C=double((maximum-minimum))/double((maximum+minimum));
%==========================================================================

%=======Etirement d'histogramme============================================
imchoise_adj=imadjust(imchoise);
figure,
subplot(221),imshow(imchoise),title('Image originale');
subplot(222),imhist(imchoise),title('Histogramme originale');
subplot(223),imshow(imchoise_adj),title('Image ajuster');
subplot(224),imhist(imchoise_adj),title('Histogramme etirer');


%=======Égalisation d'histogramme==========================================

imchoise_ega=histeq(imchoise);
figure,
subplot(221),imshow(imchoise),title('Image originale');
subplot(222),imhist(imchoise),title('Histogramme originale');
subplot(223),imshow(imchoise_ega),title('Image egaliser');
subplot(224),imhist(imchoise_ega),title('Histogramme egaliser');


%====Etirement et Égalisation d'histogramme================================
ima=imread('image-satellitaire.JPG');
ima_adj(:,:,1)=imadjust(ima(:,:,1));
ima_adj(:,:,2)=imadjust(ima(:,:,2));
ima_adj(:,:,3)=imadjust(ima(:,:,3));
ima_adj_ega(:,:,1)=histeq(ima_adj(:,:,1));
ima_adj_ega(:,:,2)=histeq(ima_adj(:,:,2));
ima_adj_ega(:,:,3)=histeq(ima_adj(:,:,3));

figure,
subplot(321),imshow(ima),title('Image originale');
subplot(322),imhist(rgb2gray(ima)),title('Histogramme Originale');
subplot(323),imshow(ima_adj),title('image etirer');
subplot(324),imhist(rgb2gray(ima_adj)),title('Histogramme etirer');
subplot(325),imshow(ima_adj_ega),title('image etirer et egaliser');
subplot(326),imhist(rgb2gray(ima_adj_ega)),title('Histogramme etirer et egaliser');






        


