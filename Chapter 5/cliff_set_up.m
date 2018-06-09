% Cliff problem

N_states=48;
N_actions=4;
gamma=.95;
alpha=.02;
% We split the states in blocks
B1=1;
B2=12;
B3=37;
B4=48;
B5=[25 13];
B6=[38:47];
B7=[36 24];
B8=[2:11];
B9=[26:35];
B10=[14:23];

% We build all variables
P=zeros(N_states*N_actions,N_states);
R=zeros(N_states*N_actions,1);
pi_rp=zeros(N_states,N_states*N_actions);
pi_opt=zeros(N_states,N_states*N_actions);

for k=1:N_states
    k
    if k==1,
        P((k-1)*N_actions+1,13)=1;R((k-1)*N_actions+1)=-1;
        P((k-1)*N_actions+2,2)=1;R((k-1)*N_actions+2)=-100;
        P((k-1)*N_actions+3,1)=1;R((k-1)*N_actions+3)=-1;
        P((k-1)*N_actions+4,1)=1;R((k-1)*N_actions+4)=-1;
        pi_opt(k,(k-1)*N_actions+1:k*N_actions)=[1 0 0 0];
            pi_rp(k,(k-1)*N_actions+1:k*N_actions)=[.25 .25 .25 .25];

    elseif k==12,
        P((k-1)*N_actions+1,12)=1;
        P((k-1)*N_actions+2,12)=1;
        P((k-1)*N_actions+3,12)=1;
        P((k-1)*N_actions+4,12)=1;
        %pi_opt(k,(k-1)*N_actions+1:k*N_actions)=[0 0 1 0];
         %   pi_rp(k,(k-1)*N_actions+1:k*N_actions)=[.25 .25 .25 .25];

    elseif k==37,
        P((k-1)*N_actions+1,k)=1;R((k-1)*N_actions+1)=-1;
        P((k-1)*N_actions+2,k+1)=1;R((k-1)*N_actions+2)=-1;
        P((k-1)*N_actions+3,k-12)=1;R((k-1)*N_actions+3)=-1;
        P((k-1)*N_actions+4,k)=1;R((k-1)*N_actions+4)=-1;
        pi_opt(k,(k-1)*N_actions+1:k*N_actions)=[0 1 0 0];
            pi_rp(k,(k-1)*N_actions+1:k*N_actions)=[.25 .25 .25 .25];

    elseif k==48,
        P((k-1)*N_actions+1,k)=1;R((k-1)*N_actions+1)=-1;
        P((k-1)*N_actions+2,k)=1;R((k-1)*N_actions+2)=-1;
        P((k-1)*N_actions+3,k-12)=1;R((k-1)*N_actions+3)=-1;
        P((k-1)*N_actions+4,k-1)=1;R((k-1)*N_actions+4)=-1;
        pi_opt(k,(k-1)*N_actions+1:k*N_actions)=[0 0 1 0];
            pi_rp(k,(k-1)*N_actions+1:k*N_actions)=[.25 .25 .25 .25];

    elseif find(k==B5),
        P((k-1)*N_actions+1,k+12)=1;R((k-1)*N_actions+1)=-1;
        P((k-1)*N_actions+2,k+1)=1;R((k-1)*N_actions+2)=-1;
        P((k-1)*N_actions+3,k-12)=1;R((k-1)*N_actions+3)=-1;
        P((k-1)*N_actions+4,k)=1;R((k-1)*N_actions+4)=-1;
        pi_opt(k,(k-1)*N_actions+1:k*N_actions)=[0 1 0 0];
            pi_rp(k,(k-1)*N_actions+1:k*N_actions)=[.25 .25 .25 .25];

    elseif find(k==B6),
        P((k-1)*N_actions+1,k)=1;R((k-1)*N_actions+1)=-1;
        P((k-1)*N_actions+2,k+1)=1;R((k-1)*N_actions+2)=-1;
        P((k-1)*N_actions+3,k-12)=1;R((k-1)*N_actions+3)=-1;
        P((k-1)*N_actions+4,k-1)=1;R((k-1)*N_actions+4)=-1;
        pi_opt(k,(k-1)*N_actions+1:k*N_actions)=[0 1 0 0];
            pi_rp(k,(k-1)*N_actions+1:k*N_actions)=[.25 .25 .25 .25];

    elseif find(k==B7),
        P((k-1)*N_actions+1,k+12)=1;R((k-1)*N_actions+1)=-1;
        P((k-1)*N_actions+2,k)=1;R((k-1)*N_actions+2)=-1;
        P((k-1)*N_actions+3,k-12)=1;R((k-1)*N_actions+3)=-1;
        P((k-1)*N_actions+4,k-1)=1;R((k-1)*N_actions+4)=-1;
        pi_opt(k,(k-1)*N_actions+1:k*N_actions)=[0 0 1 0];
            pi_rp(k,(k-1)*N_actions+1:k*N_actions)=[.25 .25 .25 .25];


    elseif find(k==B8),
        P((k-1)*N_actions+1,k)=1;R((k-1)*N_actions+1)=0;
        P((k-1)*N_actions+2,k)=1;R((k-1)*N_actions+2)=0;
        P((k-1)*N_actions+3,k)=1;R((k-1)*N_actions+3)=0;
        P((k-1)*N_actions+4,k)=1;R((k-1)*N_actions+4)=0;
       % pi_opt(k,(k-1)*N_actions+1:k*N_actions)=[.25 .25 .25 .25];
    elseif find(k==B9'),
        P((k-1)*N_actions+1,k+12)=1;R((k-1)*N_actions+1)=-1;
        P((k-1)*N_actions+2,k+1)=1;R((k-1)*N_actions+2)=-1;
        P((k-1)*N_actions+3,k-12)=1;R((k-1)*N_actions+3)=-1;
        P((k-1)*N_actions+4,k-1)=1;R((k-1)*N_actions+4)=-1;
        pi_opt(k,(k-1)*N_actions+1:k*N_actions)=[0 1 0 0];
            pi_rp(k,(k-1)*N_actions+1:k*N_actions)=[.25 .25 .25 .25];

    elseif find(k==B10'),
        P((k-1)*N_actions+1,k+12)=1;R((k-1)*N_actions+1)=-1;
        P((k-1)*N_actions+2,k+1)=1;R((k-1)*N_actions+2)=-1;
        P((k-1)*N_actions+3,k-12)=1;R((k-1)*N_actions+3)=-100;
        P((k-1)*N_actions+4,k-1)=1;R((k-1)*N_actions+4)=-1;
        pi_opt(k,(k-1)*N_actions+1:k*N_actions)=[0 1 0 0];
            pi_rp(k,(k-1)*N_actions+1:k*N_actions)=[.25 .25 .25 .25];

    end
 %   pi_rp(k,(k-1)*N_actions+1:k*N_actions)=[.25 .25 .25 .25];
end
v_ini=zeros(N_states,1);
q_ini=zeros(N_states*N_actions,1);

cliff=struct('N_states',N_states,'N_actions',N_actions,'P',P,'R',R,'pi_rp',...
    pi_rp,'gamma',gamma,'pi_opt',pi_opt,'v_ini',v_ini,'q_ini',q_ini,...
    'alpha',alpha)
