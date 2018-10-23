function [solutions,info]=assign1(factor)

info.FirstName= 'Linh';
info.LastName= 'Nguyen';
info.UCID= '30019908'; %without your correct UCID here you cannot get a mark

x0=0.2; 
solutions(1).ans=question1(x0*factor);
x0=0.2;
solutions(2).ans=question2(x0*factor);
x0=1.5; y0=0.5;
solutions(3).ans=question3(x0*factor,y0);
x0=8.3; y0=2.4;
solutions(4).ans=question4(x0*factor,y0);
x0=2.1;
solutions(5).ans=question5(x0*factor);
x0=2; y0=3;
solutions(6).ans=question6(x0*factor,y0);
R0=800; C0=1e-6; L0=1e-3;
solutions(7).ans=question7(R0*factor,C0,L0);
r0=2; n0=52;
solutions(8).ans=question8(r0*factor,n0);
V0=120; R0=240; L0=0.5; t0=0.003;
solutions(9).ans=question9(V0*factor,R0,L0,t0);
a0=4; N0=0.085;
solutions(10).ans=question10(a0*factor,N0);
solutions(11).ans=question11();
solutions(12).ans=question12();
x0=0.5 ; y0=1  ;
solutions(13).ans=question13(x0*factor,y0);
solutions(14).ans=question14();
solutions(15).ans=question15();
solutions(16).ans=question16();
solutions(17).ans=question17();
solutions(18).ans=question18();
x0=ones(2,2);
y0=zeros(2,2);
solutions(19).ans=question19(x0*factor,y0);
solutions(20).ans=question20(x0*factor,y0);


    function [answer]=question1(x)
      %first answer has been done for you to give you the idea
      %note you can write more than one line of code here if you like
      answer=5 * pi^(2.5) * cos(x)^2 * exp(3) ; 
    end

    function [answer]=question2(x)
     answer=log(sqrt(exp(1))) - tan(x)^2;
       
    end

    function [answer]=question3(x,y)
        
      answer=sqrt(cos((x*y^2)/pi));
    end

    function [answer]=question4(x,y)
      answer=x^2 + y^2 - (x^2)/(y^2);
    end
    
    function [answer]=question5(x)
        y=2*x;
        answer=x^2 + y^2 - (x^2)/(y^2);
    end
    
    function [answer]=question6(x,y)
        A=x^2;
        B=x*(y^2);
        answer=A*tan(B);
    end

    function [answer]=question7(R,C,L)
         answer=-R/(2*L) + sqrt((R/(2*L))^2 - 1/(L*C));
    end

    function [answer]=question8(r,n)
        answer=factorial(n)/(factorial(r)*factorial(n-r));
    end

    function [answer]=question9(V,R,L,t)
        answer=(V/R)*(1-exp(1)^((-R/L)*t));
    end

    function [answer]=question10(a,N)
        answer=log(N)/log(a);
    end

    function [answer]=question11()
         answer=[32/(3.2^2);sin(pi/3)^2;6.1;log(29^2);133];
    end

    function [answer]=question12()
         answer=3:5:38;
    end

    function [answer]=question13(x,y)
        z=[x sin(x*y) tan(y/x)]
         answer=diag(z);
    end

    function [answer]=question14()
        answer=eye(4);
    end

    function [answer]=question15()
         answer=[1 2;1 2;1 2];
    end

    function [answer]=question16()
        answer=[ones(5,1) zeros(5,1) linspace(3,7,5)'];
    end

    function [answer]=question17()
        x=[1:6;7:12;13:18];
        X=x(2,:);
        answer=X;
    end

    function [answer]=question18()
         answer=[ones(1,4);zeros(1,4);zeros(1,4);ones(1,4)];
    end

    function [answer]=question19(x,y)
         answer=[x y];
    end

    function [answer]=question20(x,y)
       answer=[x y; x y];
    end;
end
