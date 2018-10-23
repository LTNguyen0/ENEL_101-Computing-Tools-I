function [solutions,info]=assign2(factor)

info.FirstName='Linh';
info.LastName='Nguyen';
info.UCID='30019908';%without your correct UCID here you cannot get a mark

X0=[-100:100]; 
solutions(1).ans=question1(X0*factor);
R0=0.06;
X0 = [0.02:0.0001:0.06] ; 
solutions(2).ans=question2(R0*factor,X0);
R0=3800; C0=4000e-6;
solutions(3).ans=question3(R0*factor,C0);
solutions(4).ans=question4();
solutions(5).ans=question5();
solutions(6).ans=question6();
A0 = [ 1 -1 1 ; -1 1 -1 ; 1 -1 1 ]; B0= [ 10 2 0 ; 3 8 3 ; 1 3 12 ]; 
solutions(7).ans=question7(A0*factor,B0);
A0 = [ 1 -3 5 ; 2 2 4 ; -2 0 6 ]; B0 = [ 0 -2 1 ; 5 1 -6 ; 2 7 -1 ];
solutions(8).ans=question8(A0*factor,B0);
A0 = [ 1 -3 5 ; 2 2 4 ; -2 5 6 ]   ;
solutions(9).ans=question9(A0);
solutions(10).ans=question10();



    function [answer]=question1(X)
      Y=0.001*(X.^2)+1;
      answer=[X;Y;X+Y];
    end

    function [answer]=question2(R,X)
       Y=9604.5*((R.*X)./((X.^2 + R^2).^(3/2)));
       answer=[X;Y];
    end

    function [answer]=question3(R,C)
      T=0:2:20;  
      X=24*(1-exp(1).^(-T/(R*C))); 
      Y=(24/R)*exp(1).^(-T/(R*C));
      answer=[T;X;Y];
    end

    function [answer]=question4()
       u=[-1 2.5 0.5];
       v=[1 0.2 2];
       answer=dot(u,v);
    end
    
    function [answer]=question5()
       u=[-1 2.5 0.5];
       v=[1 0.2 2];
       answer=cross(u,v);
    end
    
    function [answer]=question6()
       X=0, Y=0, Z=0;
       for n=1:10
       X=X+(1/n^2);
       end
       for n=1:50
       Y=Y+(1/n^2);
       end
       for n=1:100
       Z=Z+(1/n^2);
       end
       answer=[X Y Z];
    end

    function [answer]=question7(A,B)
       answer=A*B*B';
    end

    function [answer]=question8(A,B)
       answer=inv(A)*(A+(B*A'));
    end

    function [answer]=question9(A)
        B=1./A;
        answer=A*B;
    end

    function [answer]=question10()
        A=[-44 10 16 0;10 -43 6 12;16 6 -30 8;0 12 8 -34];
        B=[-20;0;12;-40];
        answer=(A\B)';
    end

    
end
