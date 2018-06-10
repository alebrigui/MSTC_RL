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

[v_rp v_opt]
[q_rp q_opt]

% Here goes the code that calculates the features

sta=[1:4]';         % States
pd1 = makedist('Normal','mu',2,'sigma',4);
pd2 = makedist('Normal','mu',3,'sigma',4);

sta_pd1= pdf(pd1,sta);
sta_pd2= pdf(pd2,sta);

sta_phi = kron(sta_pd1,[1;0])+kron(sta_pd2,[0;1]);
% convoluted use of kronecker product is not the most readable..

phi_v = kron(sta_pd1,[1 0])+kron(sta_pd2,[0 1]);
phi_q = kron(sta_pd1,kron(eye(2),[1 0]))+kron(sta_pd2,kron(eye(2),[0 1]));

phi_v
phi_q




    
