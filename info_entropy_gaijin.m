 function Z=info_entropy_gaijin(X,grade)
% clc;
%  clear all;
%  close all;
%  load xx.mat
%  grade=255;
%  for i=1:21
%      for j=1:100
%  X=xx(i,j,:);
   kx=length(X);%–Ú¡–≥§∂»
   Y=zeros(1,grade);
   for n=1:kx
       for m=1:grade
           if X(n)<m/grade
               Y(m)=Y(m)+1;
               break;
           end
       end
   end
   Y=Y/kx;
   total=0;
   for n=1:grade
       if Y(n)==0
           continue;
       end
       total=total+Y(n)*log2(Y(n));
   end
   Z=-total;
%      end
%  end