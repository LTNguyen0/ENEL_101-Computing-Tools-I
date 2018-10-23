clear all;

showanswers=1; %change to 0 if you don't want to see the answers

factor=1;%don't change this if you want your answers to match
%factor will be set to a random number by the auto-correct algorithm

[myAnswers,info]=assign1(factor); %assumes there is a file assign1.m with function name 'assign1'
%change your working directory if MATLAB fails to find assign1.m

load assign1_solutions.mat
%contains the answers with factor=1

score=0;
 
tol=1e-6;
for i=1:length(myAnswers)
    fprintf('Question %d \n',i);
    diff=myAnswers(i).ans-chrisAnswers(i).ans;
    if sum(sum(abs(diff)))<tol
       fprintf('Your answer matches\n');
       score=score+1;
       if showanswers==1
           theAnswer=myAnswers(i).ans
       end;
    else
       fprintf('Your answer does NOT match\n');
       if showanswers==1
         yourAnswer=myAnswers(i).ans    
         chrisAnswer=chrisAnswers(i).ans
       end;
    end;
end;

fprintf('Your score %d out of %d\n',score,length(myAnswers));