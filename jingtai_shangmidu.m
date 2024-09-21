clc;
 clear all;
 close all;

e=0.399;
mu=3.99;
entropy_arnold_logistic_t=0;
entropy_arnold_logistic=0;
   times=200;
    lattice=10;
for n=2:times
                t(n)=cos(2*acos(6*n/(times*lattice)-1)+1);
                       t1(n)=mod(floor(abs(t(n))*10^10),n);
 
end

for alpha=3:0.01:4
        for  xn=0:0.05:1
            p=12;
            q=7;
            M=2;
            %%%%%%%%%%%%%%%%
            digits(14);
%             lattice=10;
%             times=200;
            cs=zeros(lattice,times);
            temp=zeros(1,lattice);
            for i=1:lattice
                temp(i)=i/(lattice+1);
            end
             c=zeros(1,lattice);
             c(1)=0.34565487923280;
             for i=2:lattice*4
                 c(i)=alpha*c(i-1)*(1-c(i-1));
             end
             for i=1:lattice    
                    cs(i,1)=c(i*3);
             end
             %xn=0.434;
             for n=2:times
                 
               
                for i=1:lattice
                     %xn=mu1*xn*(1-xn);
                    x=mod(((i)+p*(i)),lattice)+1;%√®”≥…‰
                      y=mod(q*(i)+(p*q+1)*(i),lattice)+1;
% 
%             x=i+1;
%             y=i-1;
              kk=n-1-t1(n);   
                 if kk<=0;
                   kk=n-1;
                 end
%                     x=i-1;
%                     y=i+1;
%                     xn=mu*xn*(1-xn);
%                     x=floor(xn*lattice)+1;
%                     xn=mu*xn*(1-xn);
%                     y=floor(xn*lattice)+1;
                    
                    %x=floor(temp(i)*lattice)+1;
%                     temp(i)=mu*temp(i)*(1-temp(i));
%                     y=floor(temp(i)*lattice)+1;
%                     x=floor(rand*lattice)+1;%ÀÊª˙ÒÓ∫œ
%                     y=floor(rand*lattice)+1;
                    if x==0
                        x=lattice;
                    end
                    if y==lattice+1
                        y=1;
                    end
                    if y==0
                        y=lattice;
                    end
                    if y==lattice+1
                        y=1;
                    end
                   % cs(i,n)=(1-e)*alpha*cs(i,n-1)*(1-cs(i,n-1)) +(e/2)*(    alpha*cs(x,n-1)*(1-cs(x,n-1))   +    alpha*cs(y,n-1)*(1-cs(y,n-1))     );  
%                      cs(i,n)=(1-xn)*alpha*cs(i,n-1)*(1-cs(i,n-1)) +(1-e)*(xn/2)*(alpha*cs(x,n-1)*(1-cs(x,n-1))+alpha*cs(y,n-1)*(1-cs(y,n-1)))+xn*e/2*(alpha*cs(y,kk)*(1-cs(y,kk))+alpha*cs(x,kk)*(1-cs(x,kk)));
                     cs(i,n)=(1-xn)*(alpha*cs(i,n-1)*(1-cs(i,n-1))) +(xn/4)*(alpha*cs(x,n-1)*(1-cs(x,n-1))+alpha*cs(y,n-1)*(1-cs(y,n-1))+alpha*cs(y,kk)*(1-cs(y,kk))+alpha*cs(x,kk)*(1-cs(x,kk)));
% cs(i,n)=mod(cs(i,n),1);
                     %                      cs(i,n)=(1-xn)*Pw(alpha,cs(i,n-1)) + (xn/2)* (Pw(alpha,cs(x,n-1))+Pw(alpha,cs(y,n-1)));
                    %temp(i)=mu*temp(i)*(1-temp(i));%logisticµƒŒ±ÀÊª˙ÒÓ∫œ
                         xn=mu*xn*(1-xn);
                end
            end                                                                             
             lyapunov_cs=zeros(lattice,1);
             summ=0;
             summ1=0;
               sum=0;
             for ii=1:lattice
                   for nn=1:times
               sum=sum+log(abs(alpha*(1-2*cs(ii,nn))));
                   end
                  lyapunov_cs(ii)=sum/times;
% lyapunov_cs=cs(ii,:)
%   lyapunov_cs(ii)=sum(log(abs(alpha*(1-2*cs(ii,:)))))/times;
                 if lyapunov_cs(ii) >0
                     summ=summ+lyapunov_cs(ii);  
                     summ1=summ1+1;
                 end
            end
            
             entropy_arnold_logistic=[entropy_arnold_logistic summ/lattice];%%
             entropy_arnold_logistic_t=[entropy_arnold_logistic_t summ1/lattice];%%
        end
end
alpha=3:0.01:4;
e=0:0.05:1;
%e=0:0.05:1;
% figure(1)
% plot(alpha,entropy_arnold_logistic(2:end));
% hold on
% plot(alpha,entropy_arnold_logistic_t(2:end));
% xlabel('\it e=0');
[xx,yy]=meshgrid(e,alpha);
aa=reshape(entropy_arnold_logistic(2:end),21,101);
bb=reshape(entropy_arnold_logistic_t(2:end),21,101);

% total=0;
% full=0;
% for n=1:21
%     for m=81:101
%                if n==4
%                else
%                    if bb(n,m)==1
%                       total=total+1; 
%                    end
%                    full=full+aa(n,m);
%                end
%                
%     end
% end
% disp(total/(21*20));
% disp(full/(21*20));

figure(1);
mesh(xx,yy,aa');
xlabel('\it e');
ylabel('\it \mu');
zlabel('\it h');
figure(2);
mesh(xx,yy,bb');
xlabel('\it e');
ylabel('\it \mu');
zlabel('\it hu');