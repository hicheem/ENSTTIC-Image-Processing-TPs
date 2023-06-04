clear all;
close all;
clc;
%=========L'histogramme conjoint===========================================

imchoise1 = imread('cameraman.tif');
imshow(imchoise1)
[n n]=size(imchoise1);
imchoise1_T=transpose(imchoise1);

HistConj(1:n,1:n)=0;

for k=1:n
    for i=1:n
        HistConj(k,i)=n;
        for j=1:n
            if(imchoise1(k,j)~=imchoise1_T(i,j))
                HistConj(k,i)=HistConj(k,i)-1;
            end
        end
    end
end
stem(HistConj),title('Histogramme Conjoint');




