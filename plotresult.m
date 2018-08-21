%Weilei Zeng 08/06/2018
%plot the result of simulations

%control switch inside draw_code()
draw_code()



%outdated function
%draw1() %not sure what is inside
%figure
%draw_6_7() % DS code P vs repetition
%draw_6b_7b()  % DS code P vs repetition with different error model, % pq=pm,ps=(1-(1-2pm)^wt(g))/2
%draw_6c_7c() 
%draw_6d_7d()
%draw_6d_7d_51qubits() 
%draw_6b_7b_51qubits() 

%draw_7a_8a()



function draw1()
% %0-0.2
% filename1 = 'data/simulation1-3.mat';
% filename2 = 'data/simulation2-3.mat';
% 
% %0-0.02
% filename1 = 'data/simulation1-4.mat';
% filename2 = 'data/simulation2-4.mat';

filename1 = 'data/simulation5-3.mat';
filename2 = 'data/minWeight1-3.mat';

%get data 
load(filename1);
x1=table(:,2);
y1=table(:,4);

%get data 

load(filename2);
x2=table(:,2);
y2=table(:,4);

figure
plot(x1,y1,'-o',x2,y2)
plot(log10(x1),log10(y1),'-o',log10(x2),log10(y2),'-o')
legend('data 1: convolutional','data 2: repetition');
legend('Location','northwest')

 %legend('convolutional viterbi','repetition')
 title('decoding simulation');
 xlabel('error probability on qubits and syndrome bits (log10)')
 ylabel('rate of decoding failure (log10)')
end


%get upper bound on the classical conolutional code with repeat =4
 %compare it with repetition and other data(convolutional or min weight)

 function draw_6_7() 
%pq=ps=pm
 repeat=4;

 pms=0.5:0.1:4;
 pms=0.1.^pms ;
 
 %repetition
%pm=pms %0:p_error_max/division:p_error_max;
pm_good = (1-pms).^3 + 2*pms.*(1-pms).^2;
pm_fail=1-pm_good.^(2*repeat+4); %all syndrome bits has no error

filename1 = 'data/simulation6-4.mat'; %convolutional DS P
%filename1 = 'data/simulation7-3.mat';
filename2 = 'data/simulation7-8.mat'; %repetition 
%get data 
load(filename1,'table');
tableConvolutional =table;
load(filename2,'table');
tableRepetition =table;

figure
plot(log10(tableRepetition(:,2)),log10(tableRepetition(:,4)),'-o',...
    log10(tableConvolutional(:,2)),log10(tableConvolutional(:,4)),'-o',...
    log10(pms),log10(pm_fail),'--')

legend('repetition','convolutional','repetition syndrome')%,'bound')
legend('Location','northwest')
 title('decoding simulation on DS code P, compared with repetition');
 label()
 
 end
 
 
 function draw_6b_7b() 
% pq=pm,ps=(1-(1-2pm)^wt(g))/2
 
 repeat=4;

 pms=0.5:0.1:4;
 pms=0.1.^pms ;
 
%  %repetition
% %pm=pms %0:p_error_max/division:p_error_max;
% pm_good = (1-pms).^3 + 2*pms.*(1-pms).^2;
% pm_fail=1-pm_good.^(2*repeat+4); %all syndrome bits has no error
% 

filename1 = 'data/simulation6b-2.mat'; %convolutional DS P
filename2 = 'data/simulation7b-1.mat'; %repetition 7b-1
%get data 
load(filename1,'table');
tableConvolutional =table;
load(filename2,'table');
tableRepetition =table;

figure
plot(log10(tableRepetition(:,2)),log10(tableRepetition(:,4)),'-o',...
    log10(tableConvolutional(1:end-1,2)),log10(tableConvolutional(1:end-1,4)),'-o')
legend('repetition','convolutional')
legend('Location','northwest')
 title({'decoding simulation on DS code P, compared with repetition','pq=pm,ps=ps(pm,wt(g))'});
 xlabel('error probability on qubits and syndrome bits (log10)')
 ylabel('rate of decoding failure (log10)')

 end
 
 function draw_6c_7c() 
% pq=pm,ps=(1-(1-2pm)^wt(g))/2
 
 repeat=4;

 pms=0.5:0.1:4;
 pms=0.1.^pms ;
 
 %repetition syndrome
pm_good = (1-pms).^3 + 2*pms.*(1-pms).^2;
pm_fail=1-pm_good.^(2*repeat+4); %all syndrome bits has no error


filename1 = 'data/simulation6c-1.mat'; %convolutional DS P
%filename1 = 'data/simulation7-3.mat';
filename2 = 'data/simulation7c-1.mat'; %repetition 7c-1 has best data
%get data 
load(filename1,'table');
tableConvolutional =table;
load(filename2,'table');
tableRepetition =table;

figure
plot(log10(tableRepetition(:,2)),log10(tableRepetition(:,4)),'-o',...
    log10(tableConvolutional(1:end-1,2)),log10(tableConvolutional(1:end-1,4)),'-o',...
    log10(pms),log10(pm_fail),'--')
% ...
%     log10(pms),log10(Pcw),':')
legend('repetition','convolutional','repetition syndrome')
legend('Location','northwest')
 title({'decoding simulation on DS code P, compared with repetition','ps=pm,pq=pq(pm,n/2)'});
 label()
 
 end
 
 
 function draw_6d_7d() 
% pq=pm,ps=(1-(1-2pm)^wt(g))/2
 
 repeat=4;

pms=1.5:0.2:3.5
 pms=0.1.^pms ;
 
 %repetition syndrome
pm_good = (1-pms).^3 + 2*pms.*(1-pms).^2;
pm_fail=1-pm_good.^(2*repeat+4); %all syndrome bits has no error

filename1 = 'data/simulation6d-1.mat'; %convolutional DS P
filename2 = 'data/simulation7d-1.mat'; %repetition 7c-1 has best data




%get data 
load(filename1,'table');
tableConvolutional =table;
load(filename2,'table');
tableRepetition =table;

figure
plot(log10(tableRepetition(:,2)),log10(tableRepetition(:,4)),'-o',...
    log10(tableConvolutional(1:end-1,2)),log10(tableConvolutional(1:end-1,4)),'-o')

legend('repetition','convolutional')
legend('Location','northwest')
 title({'decoding simulation on DS code P, compared with repetition','ps=ps(pm,wt(g)),pq=pq(pm,n/2)'});
 label()
 end
 
 function draw_6d_7d_51qubits() 
% pq=pm,ps=(1-(1-2pm)^wt(g))/2
 
 repeat=4;

pms=1.5:0.2:3.5
 pms=0.1.^pms ;
 
 %repetition syndrome
pm_good = (1-pms).^3 + 2*pms.*(1-pms).^2;
pm_fail=1-pm_good.^(2*repeat+4); %all syndrome bits has no error

filename1 = 'data/simulation6d-51qubits-567.mat'; %convolutional DS P  6d-51qubits-, 56, 7,567
filename2 = 'data/simulation7d-51qubits-3.mat'; %repetition 

%get data 
load(filename1,'table');
tableConvolutional =table;
load(filename2,'table');
tableRepetition =table;

figure
plot(log10(tableRepetition(:,2)),log10(tableRepetition(:,4)),'-o',...
    log10(tableConvolutional(1:end-1,2)),log10(tableConvolutional(1:end-1,4)),'-o')

legend('repetition','convolutional')
legend('Location','northwest')
 title({'decoding simulation on DS code P, compared with repetition','ps=ps(pm,wt(g)),pq=pq(pm,n/2)'});
 label()
 end
 
 
 function draw_6b_7b_51qubits() 
% pq=pm,ps=(1-(1-2pm)^wt(g))/2
 
 repeat=4;

pms=1.5:0.2:3.5
 pms=0.1.^pms ;
 
 %repetition syndrome
pm_good = (1-pms).^3 + 2*pms.*(1-pms).^2;
pm_fail=1-pm_good.^(2*repeat+4); %all syndrome bits has no error

filename1 = 'data/simulation6b-51qubits-1.mat'; %convolutional DS P  6b-51qubits-1
filename2 = 'data/simulation7b-51qubits-2.mat'; %repetition 

%get data 
load(filename1,'table');
tableConvolutional =table;
load(filename2,'table');
tableRepetition =table;

figure
plot(log10(tableRepetition(:,2)),log10(tableRepetition(:,4)),'-o',...
    log10(tableConvolutional(1:end-1,2)),log10(tableConvolutional(1:end-1,4)),'-o')

legend('repetition','convolutional')
legend('Location','northwest')
 title({'decoding simulation on DS code P, compared with repetition','ps=ps(pm,wt(g)),pq=pq(pm,n/2)'});
 label()
 end
 
 
 function draw_7a_8a()
 filename1='data/simulation8a-4.mat';% 4 5
 filename1='data/simulations/code3/simulation8a-2.mat'
 filename2='data/simulation7-10.mat';
 filename2='data/simulations/code2/simulation8a-2.mat'
 
 
 titleText='Convolutional v.s. repetition, repeat = 5';
 %draw_two(filename1,filename2,titleText) ;
 draw_more({filename1,filename2},titleText) ;
 end
  
 function draw_7a_8a_51qubits()
 filename1='data/simulation8a-4.mat';% 4 5
 filename2='data/simulation7-10.mat';
 titleText='Convolutional v.s. repetition, repeat = 5';
 draw_two(filename1,filename2,titleText) ;
 
 end
 
 function draw_code()
%  %compare error model a b c d
%  repeat=2+5;code='code1';
%     codePrefix=['data/simulations/',code,'/simulation678-repeat'];
%     filenames = {...
%         [codePrefix,num2str(repeat),'model-a-1.mat'],...   
%         [codePrefix,num2str(repeat),'model-b-1.mat'],...
%         [codePrefix,num2str(repeat),'model-c-1.mat'],...
%         [codePrefix,num2str(repeat),'model-d-1.mat'],...
%     };
%     legends={'convolutional, model a';'convolutional, model b';'convolutional, model c';'convolutional, model d';}
%         
%     titleText=['Comparison between different error models [',code,' repeat ',num2str(repeat),']'];
% %     
 
 
%  %compare convolutional and repetitioin
%     repeat=2+5;code='code1';
%     codePrefix=['data/simulations/',code,'/simulation678-repeat'];
%     repeat2=5;
%     codePrefix2 =['data/simulations/',code,'/simulation7-repeat'];
%     filenames = {...
%         [codePrefix,num2str(repeat),'model-b-1.mat'],...
%         [codePrefix,num2str(repeat),'model-d-1.mat'],... 
%         [codePrefix2,num2str(repeat2),'model-b-2.mat'],...
%         [codePrefix2,num2str(repeat2),'model-d-2.mat']...
%     };
%     legends={'convolutional, model b';'convolutional, model d';...
%         'repeatment, model b';'repeatment, model d';};
%     titleText=['convolutional v.s. repetition [',code,' repeat ',num2str(repeat),']'];
    
%  %code 2 and code 3
%  filenames={...
%      'data/simulations/code3/simulation8a-2.mat',...
%      'data/simulations/code2/simulation8a-2.mat',...
%      'data/simulations/code3/simulation8a-51qubits-1.mat',...
%      'data/simulations/code2/simulation8a-51qubits-1.mat',...
%     'data/simulation7-10.mat',...
%     'data/simulation8a-4.mat',...
%     'data/simulation7d-51qubits-3.mat',...
%     };
%  titleText='code 2 and code 3';

    
%     %comparison of model abcd with code 1,2,3
%     repeat=2+5;code='code2'
%     codePrefix=['data/simulations/',code,'/simulation678-repeat'];
%     filenames = {...
%         [codePrefix,num2str(repeat),'model-a-1.mat'],...   
%         [codePrefix,num2str(repeat),'model-b-1.mat'],...
%         [codePrefix,num2str(repeat),'model-c-1.mat'],...
%         [codePrefix,num2str(repeat),'model-d-1.mat']...
%     };
%     titleText=[code,' repeat ',num2str(repeat)];
    
%     %compare code 1 and code 2   
%     repeat=2+5;code='code1'
%     codePrefix=['data/simulations/',code,'/simulation678-repeat'];
%     code2='code2'
%     codePrefix2=['data/simulations/',code2,'/simulation678-repeat'];
%     code3='code3'
%     codePrefix3=['data/simulations/',code3,'/simulation678-repeat'];
% %     filenames = {...
% %         [codePrefix,num2str(repeat),'model-a-1.mat'],...   
% %         [codePrefix,num2str(repeat),'model-b-1.mat'],...
% %         [codePrefix,num2str(repeat),'model-c-1.mat'],...
% %         [codePrefix,num2str(repeat),'model-d-1.mat'],...
% %         [codePrefix2,num2str(repeat),'model-a-1.mat'],...   
% %         [codePrefix2,num2str(repeat),'model-b-1.mat'],...
% %         [codePrefix2,num2str(repeat),'model-c-1.mat'],...
% %         [codePrefix2,num2str(repeat),'model-d-1.mat']...
% %     };%hard decision
%     filenames = {...     
%         [codePrefix,num2str(repeat),'model-b-soft-2.mat'],...
%         [codePrefix,num2str(repeat),'model-d-soft-2.mat'],...   
%         [codePrefix2,num2str(repeat),'model-b-soft-2.mat'],...
%         [codePrefix2,num2str(repeat),'model-d-soft-2.mat'],...
%         [codePrefix3,num2str(repeat+4),'model-b-soft-2.mat'],...
%         [codePrefix3,num2str(repeat+4),'model-d-soft-2.mat'],...
%     }%soft decision
%     titleText=['compare ',code,' and ', code2,' repeat = ',num2str(repeat)];
%     legends={'code 1 model b';'code 1 model d';'code 2 model a';'code 2 model d';'code 3 model b';'code 3 model d';};
    
%compare hard decision and soft decision
    repeat=5+2;code='code1';
    codePrefix=['data/simulations/',code,'/simulation678-repeat'];
    repeat2=5+2;
    codePrefix2 =['data/simulations/',code,'/simulation678-repeat'];
    filenames = {...
        [codePrefix,num2str(repeat),'model-b-soft-2.mat'],...
        [codePrefix,num2str(repeat),'model-d-soft-2.mat'],...
        [codePrefix2,num2str(repeat2),'model-b-1.mat'],...
        [codePrefix2,num2str(repeat2),'model-d-1.mat']...
    };
    titleText=['hard decision v.s. soft decision ',code,' repeat ',num2str(repeat)];
    legends={'code 1 model b soft';'code 1 model d soft';'code 1 model b hard';'code 1 model d hard';};



    draw_more(filenames,titleText,legends) ;
 end
 function draw_two(filename1,filename2,titleText) 
 %draw two curves, first for convolutional, and second for repetition
% pq=pm,ps=(1-(1-2pm)^wt(g))/2
 
%  repeat=4;
% 
% pms=1.5:0.2:3.5
%  pms=0.1.^pms ;
%  
%  %repetition syndrome
% pm_good = (1-pms).^3 + 2*pms.*(1-pms).^2;
% pm_fail=1-pm_good.^(2*repeat+4); %all syndrome bits has no error

%filename1 = 'data/simulation6b-51qubits-1.mat'; %convolutional DS P  6b-51qubits-1
%filename2 = 'data/simulation7b-51qubits-2.mat'; %repetition 

%get data 
load(filename1,'table');
table1 =table;
load(filename2,'table');
table2 =table;

figure
plot(log10(table1(:,2)),log10(table1(:,4)),'-o',...
    log10(table2(:,2)),log10(table2(:,4)),'-o')

legend(filename1,filename2)
legend('Location','northwest')
 %title({'decoding simulation on DS code P, compared with repetition','ps=ps(pm,wt(g)),pq=pq(pm,n/2)'});
 title(titleText)
 label()
 end
 
 function draw_more(filenames,titleText,legends, extraXY,extraName) 
%draw any number of curves, filenames is a cell of filenames
%extraXY is not necessary, reserverd for some calculated bounds.
%get data 
length=size(filenames,2);
tables=cell(1,length);
for i=1:length
    filename = filenames{i};
    load(filename,'table');
    tables{i} = table;
end
figure('pos',[100 400 700 500])  %left bottom width height
hold on
halfLength=ceil(length/2);
for i=1:halfLength
    plots(i)=plot(log10(tables{i}(:,2)),log10(tables{i}(:,4)),'-o');
end
for i=(halfLength+1):length
    plots(i)=plot(log10(tables{i}(:,2)),log10(tables{i}(:,4)),'--*');
end
if nargin==5
    plots(length+1)=plot(log10(extraXY(:,1)),log10(extraXY(:,2)),'-o');
    filenames{1,end+1}=extraName;
end
if nargin==2
    legends=filenames;
end
filenames'
legend(plots,legends,'FontSize',11)
legend('Location','southeast')
 title(titleText)
 label()
 hold off
 end
 
 
 function label()
 xlabel('Input error probability pm (log10)')
 ylabel('rate of decoding failure (log10)')
 end
 
 