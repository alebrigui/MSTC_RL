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





    
