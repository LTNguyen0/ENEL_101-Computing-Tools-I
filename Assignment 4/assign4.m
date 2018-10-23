function [graphs,info]=assign4(factor)

info.FirstName='Linh';
info.LastName='Nguyen';
info.UCID='30019908';%without your correct UCID here you cannot get a mark

for i=1:8
    graphs(i).z=0;
end;
N0=1;
[graphs(1).graph,graphs(1).x,graphs(1).y]=question1(N0*factor);
N0=5;
[graphs(2).graph,graphs(2).x,graphs(2).y]=question2(N0*factor);
N0=1;
[graphs(3).graph,graphs(3).x,graphs(3).y]=question3(N0*factor);
N0=3;
[graphs(4).graph,graphs(4).x,graphs(4).y]=question4(N0*factor);
N0=3;
[graphs(5).graph,graphs(5).t,graphs(5).u,graphs(5).v]=question5(N0*factor);
vs0=12; rs0=2.5;
[graphs(6).graph,graphs(6).x,graphs(6).y]=question6(vs0*factor,rs0);
L0=0.001; C0=3.33e-6;
[graphs(7).graph,graphs(7).x,graphs(7).y,graphs(7).z]=question7(L0*factor,C0);
a0=1; b0=1; h0=1; n0=5;
[graphs(8).graph,graphs(8).x,graphs(8).y,graphs(8).z]=question8(a0*factor,b0,h0,n0);


    function [graph,x,y]=question1(N)
        x=linspace(0,10,100);
        y=N*sin(x);
        %you must use double quotes instead of single quotes within the
        %string 
        graph='plot(x,y);grid on;xlabel(''x'');ylabel(''y'')';
    end


    function [graph,x,y]=question2(N) 
      x=linspace(-5,10,1000);
      y=((N*sin(x))./(x+exp(-0.75*x)))-(3*x/5);
      graph='plot(x,y);grid on;xlabel(''x'');ylabel(''y'')'; 
    end

    function [graph,x,y]=question3(N)
       x=linspace(-pi,pi,400);
      y=(sin(N*4*pi*x))./(N*4*pi*x);
      graph='polar(x,y);grid on';
    end

    function [graph,x,y]=question4(N)
      
      x=linspace(-4,3,50);
      y=((x.^2)+N*x+3)./(0.8*(x+1));
      graph='plot(x,y,''r.'',''MarkerSize'',20);xlabel(''x'');ylabel(''y'');title(''ANSWER TO QUESTION 4'');grid on;ylim([-12 10]);hold on;plot(x(end),y(end),''k*'',''MarkerSize'',20)';
    end

    function [graph,t,u,v]=question5(N) 
       t   = linspace(0,10,100)';
       u   = (N*t)./(1+t.^3);
       v   = (N*t.^2)./(1+t.^3);

       graph = 'subplot(2,1,1);plot(t,u);hold on;plot(t,v);grid on;xlabel(''t'');legend(''u'',''v'');subplot(2,1,2);plot(u,v);xlabel(''u'');ylabel(''v'');grid on;';
    end
    
    function [graph,x,y]=question6(vs,rs)
      
      x=linspace(1,10,100);
      y=((vs.^2)*x)./(x+rs).^2;
      graph='plot(x,y);grid on;xlabel(''RL'');ylabel(''P'')'; 
    end
    
    function [graph,x,y,z]=question7(L,C)
        %use x=R,  y=wd,  and z=I
       [R,wd] = meshgrid(linspace(10,40,100),linspace(0.5/sqrt(L*C),1.5/sqrt(L*C),100));
       x=R;
       y=wd;
       I = 1./sqrt((x.^2)+(y*L-(1./(y*C))).^2);
       z=I;
       graph='mesh(x,y,z);grid on;xlabel(''R (\Omega)'');ylabel(''\omega_d (rad)'');zlabel(''I (amps)'')';
       
    end

    function [graph,x,y,z]=question8(a,b,h,n)
       t = linspace(0,2*pi*n,100);
       r = ((a.*b)./(sqrt((b.^2).*((cos(t)).^2)+(a.^2).*((sin(t)).^2)))).*exp(-0.04.*t);
       x = r.*cos(t);
       y = r.*sin(t);
       z = (h*t)./(2*pi*n);
       graph='plot3(x,y,z)';
    end
    
end
