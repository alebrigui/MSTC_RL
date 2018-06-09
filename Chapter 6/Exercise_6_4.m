% Analysis Random Walk problem
clear all
r_w_approx_set_up;
N_steps_value_ite=5000;
N_features=2;
% Exercise_6_1
% Optimum value / random policy no approximation
v_rp=...;
q_rp=...;
v_opt=...;
q_opt=.;
[v_rp v_opt]
[q_rp q_opt]

% Here goes the code that calculates the features

sta=[1:4]';         % States
pd1 = makedist('Normal','mu',2,'sigma',4);
pd2 = makedist('Normal','mu',3,'sigma',4);
...
...
...
...
phi_v
phi_q

% Exercise 6.2
% We calculate the solutions by BPE
G_rp=...;
L_rp=...;
z_rp=...;
G_opt=...;
L_opt=...;
z_opt=...;
theta_rp=...;
theta_opt=...;  
q_rp_approx=phi_q*theta_rp;
[q_rp q_rp_approx]
q_opt_approx=phi_q*theta_opt;
[q_opt q_opt_approx]
[v_opt q_opt_approx([1 3 6 8])]
[v_rp q_rp_approx([1 3 6 8])]
plot(q_rp,'r','LineWidth',3), hold
plot(q_rp_approx,'--r','LineWidth',3), 
plot(q_opt,'b','LineWidth',3), 
plot(q_opt_approx,'--b','LineWidth',3), hold off
legend('Random policy','Approx. random policy','Optimum policy','Approx. optimum policy')
grid
axis([1 8 0 15])
xlabel('State-Actions space')
ylabel('Q-function')
title('Comparative: Block solution')

% Exercise 6.3
Niter=500000;
pol='op';
[theta_est_opt,q_est_opt_approx]=LSTD(Niter,R_W_approx,N_features,phi_q,pol)
pol='rp';
[theta_est_rp,q_est_rp_approx]=LSTD(Niter,R_W_approx,N_features,phi_q,pol)

plot(q_rp,'r','LineWidth',2), hold
plot(q_rp_approx,'--r','LineWidth',8), 
plot(q_est_rp_approx,'-g','LineWidth',4), 
plot(q_opt,'b','LineWidth',2), 
plot(q_opt_approx,'--b','LineWidth',8), 
plot(q_est_opt_approx,'-m','LineWidth',4), 
hold off
legend('Random policy','Approx. random policy','LSTD Random policy',...
    'Optimum policy','Approx. optimum policy','LSTD optimum policy')
grid
axis([1 8 0 15])
xlabel('State-Actions space')
ylabel('Q-function')
title('Comparative: Block / LSTD solution')


% Exercise 6.4
% We implement the LSPI on-line
e_s=30000;         % Size of an episode
Niter=600000;
[theta_est,q_opt_ite]=LSPI(R_W_approx,Niter,e_s,N_features,phi_q);
aux=repmat(q_opt,[1 Niter/e_s])-q_opt_ite;
plot(1:Niter/e_s,10*log10(sum(aux.^2,1)),'r','LIneWidth',5)
xlabel('Steps')
ylabel('Error')
title('LSPI'),
[q_est_opt_approx q_opt_ite(:,Niter/e_s)]
[v_opt q_opt_ite([1 3 6 8],Niter/e_s)]
plot(q_opt,'r','LineWidth',3), hold
plot(q_opt_approx,'--r','LineWidth',8), 
plot(q_est_opt_approx,'b','LineWidth',3), 
plot(q_opt_ite(:,Niter/e_s),'--b','LineWidth',3), hold off
legend('Tabular','Projection','LSTD','LSPI')
grid
axis([1 8 0 15])
xlabel('State-Actions space')
ylabel('Optimum Q-function')
title('Comparative: Tabular / Projection / LSTD /LSPI solution')

    
