% We analyze exercise 3.2 from the PI perspective
clear all
% Definition of the problem
gamma=.9;
R=[-1;.6;.5;-.9];
P=[0.8 0.2;0.2 0.8;0.3 0.7;0.9 0.1];
pi1=[1 0 0 0;0 0 1 0];
pi2=[0 1 0 0;0 0 1 0];
pi3=[1 0 0 0;0 0 0 1];
pi4=[0 1 0 0;0 0 0 1];
N_states=2;
N_actions=2;
N_steps_pe=20;
N_steps_pi=50;

% Analytical solution. Second policy (optimal)
v_opt=inv(eye(2)-gamma*pi2*P)*pi2*R;
q_opt=inv(eye(4)-gamma*P*pi2)*R;
% Policy Improvement. V / Q functions.Second policy (optimal)
% Start from uniform distributionv_ini=zeros(N_states,1);
q_ini=zeros(N_states*N_actions,1);
[v_pi q_pi]=policy_iteration(gamma,N_states,N_actions,N_steps_pi,N_steps_pe,P,R,pi2);
% Results comparison
[v_opt v_pi(:,N_steps_pi)]
[q_opt q_pi(:,N_steps_pi)]
% Graphical representation
figure(1),aux=repmat(q_opt,[1 N_steps_pi])-q_pi;
plot(1:N_steps_pi,10*log10(sum(aux.^2,1)),'LineWidth',3),grid
xlabel('Steps')
title('Policy iteration. Q function')

figure(2)
aux=repmat(v_opt,[1 N_steps_pi])-v_pi;
plot(1:N_steps_pi,10*log10(sum(aux.^2,1)),'LineWidth',3),grid
xlabel('Steps')
ylabel('Policy improvement')
title('Policy iteration. V function')






