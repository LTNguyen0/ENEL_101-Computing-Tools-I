function [solutions,info]=assign7(factor,x,y,current)

info.FirstName='Linh';
info.LastName='Nguyen';
info.UCID='30019908';%without your correct UCID here you cannot get a mark

r0=0.1;
solutions(1).ans=question1(r0*factor,x,y);
X0=-0.1;
solutions(2).ans=question2(X0*factor,x,y);
R0=1;
solutions(3).ans=question3(R0*factor,x);
L0=3;R0=10;C0=80e-6;
solutions(4).ans=question4(L0*factor,R0,C0,current);

 
    function [answer] = question1(r,x,y)
        ellipse1=(((x-1+r)^2)/6^2) + ((y^2)/(3^2)) == 1;
        ellipse2=(((x+2)^2)/(2^2)) + (((y-5)^2)/(4^2)) == 1;
        [x y]=solve(ellipse1,ellipse2,'MaxDegree',4);
        x=eval(x);
        y=eval(y);
        i=1;
        leftX=real(x(i));
        leftY=real(y(i));
        for n=i+1:numel(x)
           if real(x(n))<real(x(i))
               leftX=real(x(n));
               leftY=real(y(n));
               i=n;
               n=i+1;
           end
           n=n+1;
        end
        answer=[leftX leftY];
    end
    
    function [answer] = question2(X,x,y)
        ellipse=((x+2)^2)/2^2 + ((y-5)^2)/4^2==1;
        y=solve(ellipse,y);
        m=diff(y);
        m=vpa(subs(m,x,X));
        b=vpa(subs(y,X)-m*X);
        i = 1;
        for n=i+1:numel(m)
           if m(n) < m(i)
               m = m(n);
           end
           if b(n) > b(i)
               b = b(n);
           end
        end
        answer=m*x+b;      
    end

    function [answer]=question3(R,x)
        I=int((x^3)/(sqrt(R-(x^2))),x);
        answer=I;
    end

    function [answer]=question4(L,R,C,current)
        %use current instead of i
        answer=subs(subs(subs(dsolve('L*D2current - R*Dcurrent + (1/C)*current = 0', 'current(0) = 0', 'Dcurrent(0) = 8'),'R',R),'C',C),'L',L);
    end
    
end
