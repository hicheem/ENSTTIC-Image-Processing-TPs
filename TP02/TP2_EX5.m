% Ce programme permet de faire la quatification d'une image

clear all;
close all;
clc;
x = imread('rose.jpeg');
[r,c,w] = size(x);
B = 256;
q=input('veuillez entrez une valeur'); 
l = B / q ;
E = zeros(256, 1);
for i = 0:255,
    E(i+1, 1) = floor(i / l) *l + l/2 ;
end
figure(1); plot(0:255,E);
y = zeros(size(x));
for ch = 1:w            %changement le variable w1 en w car w1 n'existe pas
     for i = 1:r,       %changement le variable r1 en r car r1 n'existe pas
         for j = 1:c,   %changement le variable c1 en c car c1 n'existe pas
            y(i, j,ch) = E(x(i,j,ch) + 1);
         end
    end
end

y=uint8(y); %changement de type de l'image de 'double' en 'uint8'
figure(2); imagesc(y);title('Image resultante');


