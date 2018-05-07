% Grid world problem
N_states=25;
N_actions=4;
gamma=.9;
% We split the states in blocks
B1=1;
B2=5;
B3=21;
B4=25;
B5=6;
B6=16;
B7=11;
B8=[22 23 24];
B9=[10 15 20];
B10=[2 3 4];
B11=[7 8 9 12 13 14 17 18 19];
P=zeros(N_states*N_actions,N_states);
R=zeros(N_states*N_actions,1);
pi_m=zeros(N_states,N_states*N_actions);
for k=1:N_states
    k
    if k==1,
        P((k-1)*N_actions+1,1)=1;R((k-1)*N_actions+1)=-1;
        P((k-1)*N_actions+1+1,6)=1;
        P((k-1)*N_actions+1+2,2)=1;
        P((k-1)*N_actions+1+3,1)=1;R((k-1)*N_actions+1+3)=-1;
    elseif k==5,
        P((k-1)*N_actions+1,4)=1;
        P((k-1)*N_actions+1+1,10)=1;
        P((k-1)*N_actions+1+2,k)=1;R((k-1)*N_actions+1+2)=-1
        P((k-1)*N_actions+1+3,k)=1;R((k-1)*N_actions+1+3)=-1;
    elseif k==21,
        P((k-1)*N_actions+1,k)=1;R((k-1)*N_actions+1)=-1;
        P((k-1)*N_actions+1+1,k)=1;R((k-1)*N_actions+1+1)=-1;
        P((k-1)*N_actions+1+2,22)=1;
        P((k-1)*N_actions+1+3,16)=1;
    elseif k==25,
        P((k-1)*N_actions+1,24)=1;
        P((k-1)*N_actions+1+1,k)=1;R((k-1)*N_actions+1+1)=-1;
        P((k-1)*N_actions+1+2,k)=1;R((k-1)*N_actions+1+2)=-1;
        P((k-1)*N_actions+1+3,20)=1;
    elseif k==6,
        P((k-1)*N_actions+1,10)=1;R((k-1)*N_actions+1)=10;
        P((k-1)*N_actions+1+1,10)=1;R((k-1)*N_actions+1+1)=10;
        P((k-1)*N_actions+1+2,10)=1;R((k-1)*N_actions+1+2)=10;
        P((k-1)*N_actions+1+3,10)=1;R((k-1)*N_actions+1+3)=10;
    elseif k==16,
        P((k-1)*N_actions+1,18)=1;R((k-1)*N_actions+1)=5;
        P((k-1)*N_actions+1+1,18)=1;R((k-1)*N_actions+1+1)=5;
        P((k-1)*N_actions+1+2,18)=1;R((k-1)*N_actions+1+2)=5;
        P((k-1)*N_actions+1+3,18)=1;R((k-1)*N_actions+1+3)=5;
    elseif k==11,
        P((k-1)*N_actions+1,k)=1;R((k-1)*N_actions+1)=-1;
        P((k-1)*N_actions+1+1,16)=1;
        P((k-1)*N_actions+1+2,12)=1;
        P((k-1)*N_actions+1+3,6)=1;
    elseif find(k==B8),
        P((k-1)*N_actions+1,k-1)=1;
        P((k-1)*N_actions+1+1,k)=1;R((k-1)*N_actions+1+1)=-1;
        P((k-1)*N_actions+1+2,k+1)=1;
        P((k-1)*N_actions+1+3,k-5)=1;
    elseif find(k==B9),
        P((k-1)*N_actions+1,k-1)=1;
        P((k-1)*N_actions+1+1,k+5)=1;
        P((k-1)*N_actions+1+2,k)=1;R((k-1)*N_actions+2+1)=-1;
        P((k-1)*N_actions+1+3,k-5)=1;
    elseif find(k==B10),
        P((k-1)*N_actions+1,k-1)=1;
        P((k-1)*N_actions+1+1,k+5)=1;
        P((k-1)*N_actions+1+2,k+1)=1;
        P((k-1)*N_actions+1+3,k)=1;R((k-1)*N_actions+1+3)=-1;
    elseif find(k==B11'),
        P((k-1)*N_actions+1,k-1)=1;
        P((k-1)*N_actions+1+1,k+5)=1;
        P((k-1)*N_actions+1+2,k+1)=1;
        P((k-1)*N_actions+1+3,k-5)=1;
    end
    pi_m(k,(k-1)*N_actions+1:k*N_actions)=[.25 .25 .25 .25];
end