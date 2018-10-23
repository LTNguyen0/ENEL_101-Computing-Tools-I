function [solutions,info]=assign3(factor)

info.FirstName='Linh';
info.LastName='Nguyen';
info.UCID='30019908';%without your correct UCID here you cannot get a mark

X10 = [-200:10:20];
solutions(1).ans=question1(X10*factor);
X20 = [-200:10:20];
solutions(2).ans=question2(X20*factor);
X30 = [0:100];
Y30 = [10:110];
solutions(3).ans=question3(X30*factor,Y30);
A0 = [[-4 3 1];[5 6 -2];[2 -5 4.5]];
Y40 = [-18.2;-48.8;92.5];
solutions(4).ans=question4(A0*factor,Y40);
solutions(5).ans=question5();
M0=10000;
solutions(6).ans=question6(M0*factor); 
solutions(7).ans=question7();
N0=10;
solutions(8).ans=question8(N0*factor);
M0=11;
solutions(9).ans=question9(M0*factor);
K0=12;
solutions(10).ans=question10(K0*factor);



    function [answer]=question1(X1)
       answer=sum(X1);
    end

    function [answer]=question2(X2)
       answer = sum(sin(X2).*cos((5*X2)+100));
    end

    function [answer]=question3(X3,Y3)
       answer = sin((pi*X3)/180)+ 2*cos((pi/180)^2 * X3.*Y3);
    end

    function [answer]=question4(A,Y4) 
      answer=A\Y4;
    end
    
    function [answer]=question5()
        angle=load('Q5theta.mat');
        height=load('Q5h.mat');
        R=(height.h .* cosd(angle.theta)) ./ (1-cosd(angle.theta));
        answer=mean(R);
    end
    
    function [answer]=question6(M)
      X=rand(M,1);
      answer = sqrt((1/M)*sum((X-(1/M)*sum(X)).^2));
    end

    function [answer]=question7()
      mag=load('Q7xy.mat');
      X7=(mag.Mdata(:,1))';
      Y7=(mag.Mdata(:,2))';
      answer = atan(Y7./X7)*(180/pi);
    end

    function [answer]=question8(N)
        answer = 0;
        for n=5:N
            for m=-3:n
                answer=answer+sin(n*m/10);
            end
        end
    end

    function [answer]=question9(M)
        answer =0;
        for m=0:M
            for n=5:15
                for k=n:20
                    answer=answer+m+n+k;
                end
            end
        end
    end

    function [answer]=question10(K)
        z=0;
        for k=5:K
            y=0;
            for m=5:k
                x=0;
                for n=-3:m
                    x=x+cos(n+m);
                end
                y=y+(x*m);
            end
            z=z+(y*k);
        end
        answer=z;
    end

    
end
