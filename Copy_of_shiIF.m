clc;
 clear all;
 close all;
kx=100;
lattice=kx;
mu=3.88;
x=linspace(0.01,0.999,kx);
xt=ones(1,2000);
pt=2000;
xx=zeros(21,kx,pt);
i=0;
for e=0:0.05:1
    i=i+1;
     x2=meshgrid(x,xt');
    for n=1:pt-1
        for mm=1:floor(kx/2)
             for m=mm*2
            j1=m-1;
            k1=m+1;
            if j1==0
                j1=kx;
            end
            if k1==0
                k1=kx;
            end
            if j1==kx+1
                j1=1;
            end
            if k1==kx+1
                k1=1;
            end
   
s=mu*(x2(n,m))*(1-(x2(n,m)));
y(m)=1/(1+e)*(s) +e/(2*(1+e))*(x2(n,j1)+x2(n,k1));
             end
              for m=mm*2-1
            j1=m+1;
            k1=m-1;
             if j1==0
                j1=kx;
            end
            if k1==0
                k1=kx;
            end
            if j1==kx+1
                j1=1;
            end
            if k1==kx+1
                k1=1;
            end
 
  s=mu*(x2(n,m))*(1-(x2(n,m)));
y(m)=1/(1+e)*(s) +e/(2*(1+e))*(x2(n+1,j1)+x2(n+1,k1));
        end
        end
%         xc(:)=yc(:);
         x2(n+1,:)=y(1,:);
%             if n>1500
          xx(i,:,n)=y(:);
%              xxc(i,:,n-1500)=xc(:);
%             end
    end
end
%  xx=xx(:,:,1:499);
K=size(xx);
k1=K(1,1);
k2=K(1,2);
k3=K(1,3);
Y=zeros(k1,k2);
for n=1:k1
    for m=1:k2
%       CV=reshape(cv,1,2000);
       
       Y(n,m)=info_entropy_gaijin(xx(n,m,:),256);
%        Y(n,m)=8;
% zz=xx(n,m,:);
%         Y(n,m)=yyshang(xx(n,m,:),256);
    end
    end
% for n=1:k1
%     for m=1:k2
%        for kk=1:k3
%  
%        Y(n,m)=info_entropy_gaijin(xx(:,:,kk),256);
% %        Y(n,m)=8;
% % zz=xx(n,m,:);
% %         Y(n,m)=yyshang(xx(n,m,:),256);
%     end
%     end
% end
x=1:kx;
e=0:0.05:1;
[X,E]=meshgrid(x,e);
mesh(X,E,Y);
 axis([0 100 0 1 0 log2(256)]);
xlabel('\it i');
ylabel('\it e');
zlabel('InformationEntropy \it H');