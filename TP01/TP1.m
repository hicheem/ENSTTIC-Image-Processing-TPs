%--------------------------------------------------------------------------
clear all;
close all;
clc;
%____Chagement d'image_____
im=imread('C:\Program Files\MATLAB\R2007b\toolbox\images\imdemos\greens.jpg');
imag='greens.jpg';
%____Chargement d'image en concaténant le chemin et le nom
ch='C:\Program Files\MATLAB\R2007b\toolbox\images\imdemos\';
ima=imread(cat(2,ch,imag),'jpg');
imshow(ima);
%imtool(ima);
%image(ima);
%imagesc(ima);
imad=double(ima);
%imshow(imad/255);
im2d=im2double(im);
%imshow(im2d);

%________Conversion en image de niveau de gris_________
ima_gray = ima(:,:,1)*0.8 + ima(:,:,2)*0.1 + ima(:,:,3)*0.1;
imshow(ima_gray);
imwrite(ima_gray,'C:\Users\Hichem\Desktop\INTTIC\TPTI\FARAOUN_H_TP_01\ima_gray.jpg','jpg');

%--------------------------------------------------------------------------

%___________Type d’Images dans Matlab ________________*

%____Chargement d'image en concaténant le chemin et le nom

ch2='C:\Program Files\MATLAB\R2007b\toolbox\images\imdemos\';
cameraman='cameraman.tif';
ima2=imread(cat(2,ch2,cameraman),'tif');
imshow(ima2);
%______decrire les caracteristiques______
imageinfo(cameraman);

%---------------------------
RGB=reshape(ones(64,1)*reshape(jet(64),1,192),[64,64,3]);
imshow(RGB);
%___image rouge____
image_rouge=RGB;
image_rouge(:,:,2)=0;
image_rouge(:,:,3)=0;
imshow(image_rouge);
%____image blue_____
image_blue=RGB;
image_blue(:,:,1)=0;
image_blue(:,:,2)=0;
imshow(image_blue);
%_____image vert____
image_verte=RGB;
image_verte(:,:,1)=0;
image_verte(:,:,3)=0;
imshow(image_verte);

%--------------------------------------------------------------------------

%____image indexée_________*

[X, map]=imread('C:\Program Files\MATLAB\R2007b\toolbox\images\imdemos\trees.tif'); 
%imshow(X,map);
imageinfo('trees.tif');
imshow(X,colormap);

%__________Binary image__________
        %___utilisation de im2bw____
binary_image1=im2bw(im);
imshow(binary_image1);

        %___utilisation de im2bw et graythresh____
level=graythresh(im);
binary_image2=im2bw(im,level);
%imshow(binary_image2);

    %__ les caractéristiques de cette image__
imwrite(binary_image1,'C:\Users\Hichem\Desktop\INTTIC\TPTI\FARAOUN_H_TP_01\binary_image1.tif','tif');
imageinfo('binary_image1.tif');
%--------------------------------------------------------------------------

%________Propriétés d'une image____________

ima_gray1=ima_gray(11:14,44:50);
imshow(ima_gray1);
[nl,nc]=size(ima_gray1)
    %___max,min,mean de chaque ligne___
maxlig=max(ima_gray1,[],2);
minlig=min(ima_gray1,[],2);
moylig=mean(ima_gray1,2);

    %___tracer de max,min,moy___
plot(maxlig,'g');
hold on;
plot(minlig,'r');
hold on;
plot(moylig,'b');
  
    %___tracer de max=f(min)___
plot(minlig,maxlig);

    %___max,min,mean,sum___
MAX=max(max(ima_gray1,[],2));
MIN=min(min(ima_gray1,[],2));
MOY=mean(mean(ima_gray1,2));
SUM=sum(sum(ima_gray1));

    %___max,min,mean,sum pour une partie d'image___
part_image=ima_gray(100:200,100:200);
part_MAX=max(max(part_image,[],2));
part_MIN=min(min(part_image,[],2));
part_MOY=mean(mean(part_image,2));
part_SUM=sum(sum(part_image));

    %____traçage de l'histogramme avec imhist____
imhist(ima_gray);





