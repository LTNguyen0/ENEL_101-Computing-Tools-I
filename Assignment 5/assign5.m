function [solutions,info]=assign5(factor)

info.FirstName='Linh';
info.LastName='Nguyen';
info.UCID='30019908';%without your correct UCID here you cannot get a mark

X0 = [-200:10:200];
solutions(1).ans=question1(X0*factor);
x0=0.5;
solutions(2).ans=question2(x0*factor);
rng('default');
s = rng(1);
X0=rand(2,2);
solutions(3).ans=question3(X0*factor);
X0=0.5;
s0(1).operation='invert';
s0(2).operation='root2';
s0(3).operation='none'; 
solutions(4).ans=question4(X0*factor,s0);
a0=0.5;
b0=0.5;
c0=0.5;
solutions(5).ans=question5(a0,b0*factor,c0);
n0=5;
solutions(6).ans=question6(n0*factor)
P0=5;
solutions(7).ans=question7(P0*factor)
f= @(x) x^2*exp(x);
x0=0.25;
solutions(8).ans=question8(f,x0*factor)



    function [answer]=question1(X)
      answer=X(X>0);
    end

    function [answer]=question2(x)
      answer=(-0.2*(x^3)+7*(x^2))*exp(-0.3*x);
    end

    function [answer]=question3(X)
      answer=(-0.2.*(X.^3)+7.*(X.^2)).*exp(-0.3.*X);
    end

    function [answer]=question4(x,s)
      for i=1:3
        switch s(i).operation
          case 'invert'
              y=inv(x);
          case 'root2'
              z=sqrt(x);
          otherwise
              w=0;
        end
      end
      X=[y z w];
      answer=X;
    end

    function [answer]=question5(a,b,c)
      D=(b^2)-4*a*c;
      if D>0
          numroot=2;
      elseif D<0
          numroot=0;
      else 
          numroot=1;  
      end 
      answer=numroot;
    end
    
    function [answer]=question6(n)
      F=[0 1];
      x=0;
      x2=1;
      i=3;
      while i<=n
          x3=x+x2;
          F(i)=x3;
          x=x2;
          x2=x3;
          i=i+1;
      end
      answer=F';
    end

    function [answer]=question7(P)
      x=P;
      E=1;
      i=0;
      while E>0.00001
         x2=x-(((x^5)-P)/(5*(x^4)));
         E=abs((x2-x)/x);
         x=x2;
         i=i+1;
      end
      answer=[x i];
    end
     
    function [answer]=question8(f,x)
        h=x/10;
        x0=0.25;
        num=y(x0,h);
        f=@(y) (x^2)*exp(x);
        function num=y(x0,h)
            num=f(x0-2*h)-f(x0-h)+f(x0+h)-f(x0+2*h);
        end
        denom=12*h;
        answer=[num denom num/denom];
    end
end
