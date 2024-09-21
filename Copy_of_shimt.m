clc;
 clear all;
 close all;
kx=20;
lattice=kx;
pt=2000;
ii=1;
jj=1; 
muu=linspace(3.6,4,50);
for mu=muu
    for e=0.01:0.05:0.99    
        % mu=3.84;
        % e=0.89;
   
        x=linspace(0.1,0.99,kx);
        xt=ones(1,2000);
        x2=meshgrid(x,xt');
        y=zeros(1,kx);
        xx=zeros(kx,500);
        
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
            for m1=mm*2-1
            j1=m1+1; 
            k1=m1-1;
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
  
      s=mu*(x2(n,m1))*(1-(x2(n,m1)));
 
      y(m1)=1/(1+e)*(s) +e/(2*(1+e))*(x2(n+1,j1)+x2(n+1,k1));
  
             end
        end
            x2(n+1,:)=y(1,:);
%             if n>100
                xx(:,n)=y(:);
%             end
        end
        mutualinfo=zeros(kx,kx);
        for n=1:kx
            for m=1:kx
                if n==m
                else
                    mutualinfo(n,m)=calc_mi(xx(n,:)',xx(m,:)',5);
                end
            end
        end
        Z(ii,jj)=sum(sum(mutualinfo))/(kx*kx-kx);
        jj=jj+1;
    end
    ii=ii+1;
    jj=1;
end
% mu=3.6:0.01:3.99;
e=0.01:0.05:0.99;
[xx,yy]=meshgrid(e,muu);
Z=real(Z);
mesh(xx,yy,Z);
axis([0 1 3.6 4 0 1]);
xlabel('\it e');
ylabel('\mu');
zlabel('Ld');