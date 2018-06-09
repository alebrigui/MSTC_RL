% Random Walk problem
R=[.9 0.1 .9 0.1 0.1 .9 0.1 .9]';
P=[.1 .9 0 0;
   .9 .1 0 0;
   .1 0 .9 0;
   .9 0 .1 0;
   0 .1 0 .9;
   0 .9 0 .1;
   0 0 .1 .9
   0 0 .9 .1];
pi_rp=[.5 .5 0 0 0 0 0 0;
0 0 0.5 0.5 0 0 0 0 ;
0 0 0 0 0.5 0.5 0 0 ;
0 0 0 0 0 0 0.5 0.5];
 
pi_opt=[1 0 0 0 0 0 0 0;
0 0 1 0 0 0 0 0 ;
0 0 0 0 0 1 0 0;
0 0 0 0 0 0 0 1];

N_states=4;
N_actions=2;
gamma=.9;
alpha=.05;
v_ini=zeros(N_states,1);
q_ini=zeros(N_states*N_actions,1);

% We calculate the visiting probability (random policy)   
P_rp=pi_rp*P;
[V S]=eig(P_rp');
autovalor_unit = find(isAlways(abs(diag(S) - 1) < 1e-12,'Unknown','error'))
d_v_rp = V(:,autovalor_unit)/ sum(V(:,autovalor_unit))
assert(all(d_v_rp >= 0))
d_q_rp=zeros(N_states*N_actions,1);
d_q_rp(1:2:end)=d_v_rp;d_q_rp(2:2:end)=d_v_rp;d_q_rp=d_q_rp*.5;D_q_rp=diag(d_q_rp);
 
% We calculate the visiting probability (optimum policy)   
P_opt=pi_opt*P;
[V S]=eig(P_opt');
autovalor_unit = find(isAlways(abs(diag(S) - 1) < 1e-12,'Unknown','error'))
d_v_opt = V(:,autovalor_unit)/ sum(V(:,autovalor_unit))
assert(all(d_v_opt >= 0))
d_q_opt=zeros(N_states*N_actions,1);
d_q_opt(1)=d_v_opt(1);d_q_opt(3)=d_v_opt(2);d_q_opt(6)=d_v_opt(3);d_q_opt(8)=d_v_opt(4);
D_q_opt=diag(d_q_opt);


R_W_approx=struct('N_states',N_states,'N_actions',N_actions,'P',P,'R',R,'pi_rp',...
    pi_rp,'gamma',gamma,'pi_opt',pi_opt,'D_q_opt',D_q_opt,'D_q_rp',D_q_rp,'v_ini',v_ini,'q_ini',q_ini,...
    'alpha',alpha);
