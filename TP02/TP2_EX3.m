clear all;
close all;
clc;
I=imread('rose.jpeg'); %Recupérer l'image
[j,k,c]=size(I); % vérifier la taille de l'image
figure(1);
imshow(I); title('Original');%affichage de l'image
scale=17;%definir le SCALE
x_new=floor(j/scale);%nv axed des abscisses
y_new=floor(k/scale);%nv axed des ordonnées

M=zeros(x_new,y_new,c);%initiation de la nouvelle matrice avec des zeros
for ch = 1:c 
    for count1 = 1:x_new
        for count2 = 1:y_new
            M(count1,count2,ch)=I(count1*scale,count2*scale,ch);%remplissage du nv matrice
        end
    end
end

subplot(1,2,1); imagesc(uint8(I)); axis tight;title('Original');%affichage de l'image originale
subplot(1,2,2); imagesc(uint8(M)); axis tight;%affichage de l'image sous échantillonner

            