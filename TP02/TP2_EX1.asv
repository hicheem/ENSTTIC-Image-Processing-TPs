%--------------------------------------------------------------------------
clear all;
close all;
clc;
im=imread('onion.png');
im_gray=im(:,:,1); %Résolution spectrale
figure(1);imshow(im_gray);title('image en niveau de gris');
[l,c,w]=size(im); %resolution spacial
figure(2);
imshow(im); title('Original');

%____translation horizontale de 20 pixel a droite
shift(1:l,1+20:c+20,:)=im;
decalage_droite=shift;
figure(3);
imshow(decalage_droite);title('translation horizontale de 20 pixel a droite');

%____translation de 50 ligne et 100 colonne
shift1(1+50:l+50,1+100:c+100,:)=im;
decalage_hoVer=shift1;
figure(4);
imshow(decalage_hoVer);title('_translation de 50 ligne et 100 colonne');

%___une translation qui permet de cacher totalement le poivron jaune
se = translate(strel(1), [40 40]);
J = imdilate(im,se);
figure(5), imshow(J), title('Translated');




