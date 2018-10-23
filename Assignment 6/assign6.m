function [solutions,info]=assign6(factor)

info.FirstName='Linh';
info.LastName='Nguyen';
info.UCID='30019908';%without your correct UCID here you cannot get a mark

P0=[-0.001 , 0.051 , -0.76 , 3.8 , -1.4 ]; LOW=9; HIGH=11;
solutions(1).ans=question1(P0*factor,LOW,HIGH);
h0 = [0         608        1520        2280        3040        6384        7904];
T0 = [100.00   98.8889   95.0000     92.2222     90.0000     81.1111      75.5556];
solutions(2).ans=question2(h0*factor,T0);
t0 = 10:10:50;
N0 = [38000 60000 250000 500000 1000000];
solutions(3).ans=question3(t0*factor,N0);
A0=0; B0=2;
solutions(4).ans=question4(A0,B0*factor);
V0 = 20:20:160;
F0 = [10,50,109,180,300,420,565,771];
v=70;
solutions(5).ans=question5(V0,F0,v*factor);
R0=10; L0=0.001; C0=3.33e-6;
solutions(6).ans=question6(R0*factor,L0,C0)
N00=1000; C0=1e4; Nc0=1e4; r0=1e4; R0=0.55;
solutions(7).ans=question7(N00*factor,C0,Nc0,r0,R0)

 
    function [answer] = question1(p,LOW,HIGH)
      r = abs(roots(p));
      x=[];
      i = 1;
      for n = 1:numel(r)
          if r(n) > LOW && r(n) < HIGH
              x(i) = r(n);
              i = i + 1;
          end
      end
      answer=x;
    end
    

    function [answer]=question2(h,T)
       p = polyfit(h,T,1);
       xp=h;
       yp = polyval(p,h);
       plot(h,T,'o',xp,yp);
       xlabel('h');
       ylabel('T');
       answer= abs(yp-T);
    end

    function [answer]=question3(t,N)
       p = polyfit(t,log(N),1);
       b = exp(p(2));
       m = p(1);
       answer = [b m];
    end

    function [answer]=question4(A,B)
       h = @(x)sin(x).*exp(-x.^2).*x.^3;
       answer = quad(h,A,B);
    end

    function [answer]=question5(V,F,v)
        answer=interp1(V,F,v,'spline');
    end
    
    function [answer]=question6(R,L,C)
        wd = linspace(0.5/sqrt(L*C),1.5/sqrt(L*C));
        I =@(wd)(1./sqrt((R^2)+(wd.*L-(1./(wd.*C))).^2))*-1;
        answer=fminbnd(I,0.5/sqrt(L*C),1.5/sqrt(L*C))/(2*pi);
    end

    function [answer]=question7(N0,C,Nc,r,R)
        ode1=@(t,N) (R*N.*(1 - (N/C))) - ((r*N.^2)./(Nc^2 + N.^2));
       [N, t] = ode45(ode1,0:1:50,N0);
       answer = t(50);
    end
   
    
end
