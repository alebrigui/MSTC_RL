% Analysis Random Walk problem
clear all
r_w_approx_set_up;
N_steps_value_ite=5000;
N_features=2;
% Exercise_6_1
% Optimum value / random policy no approximation

v_rp=(eye(R_W_approx.N_states)-R_W_approx.gamma*R_W_approx.pi_rp*...
    R_W_approx.P)\(R_W_approx.pi_rp*R_W_approx.R);
q_rp=(eye(R_W_approx.N_states*R_W_approx.N_actions)-R_W_approx.gamma*...
    R_W_approx.P*R_W_approx.pi_rp)\(R_W_approx.R);

v_opt=(eye(R_W_approx.N_states)-R_W_approx.gamma*R_W_approx.pi_opt*...
    R_W_approx.P)\(R_W_approx.pi_opt*R_W_approx.R);
q_opt=(eye(R_W_approx.N_states*R_W_approx.N_actions)-R_W_approx.gamma*...
    R_W_approx.P*R_W_approx.pi_opt)\(R_W_approx.R);

% Here goes the code that calculates the features

sta=[1:4]';         % States
pd1 = makedist('Normal','mu',2,'sigma',4);
pd2 = makedist('Normal','mu',3,'sigma',4);

sta_pd1= pdf(pd1,sta);
sta_pd2= pdf(pd2,sta);

sta_phi = kron(sta_pd1,[1;0])+kron(sta_pd2,[0;1]);
% this part was quite difficult and convoluted, maybe a for loop is more
% readable
phi_v = kron(sta_pd1,[1 0])+kron(sta_pd2,[0 1]);
phi_q = kron(sta_pd1,kron(eye(2),[1 0]))+kron(sta_pd2,kron(eye(2),[0 1]));

phi_v
phi_q


% Exercise 6.2
% We calculate the solutions by BPE

G_rp=phi_q'*R_W_approx.D_q_rp*phi_q;
L_rp=phi_q'*R_W_approx.D_q_rp*R_W_approx.P*R_W_approx.pi_rp*phi_q;
z_rp=phi_q'*R_W_approx.D_q_rp*R_W_approx.R;

G_opt=phi_q'*R_W_approx.D_q_opt*phi_q;
L_opt=phi_q'*R_W_approx.D_q_opt*R_W_approx.P*R_W_approx.pi_opt*phi_q;
z_opt=phi_q'*R_W_approx.D_q_opt*R_W_approx.R;

theta_rp  =(G_rp-R_W_approx.gamma*L_rp)\z_rp;
theta_opt =(G_opt-R_W_approx.gamma*L_opt)\z_opt;  

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




    
