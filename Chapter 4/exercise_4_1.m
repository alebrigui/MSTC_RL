% We analyze exercise 3.3 from the PE perspective
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
N_steps=400;

% Analytical solution. Second policy (optimal)
v_opt=inv(eye(2)-gamma*pi2*P)*pi2*R;
q_opt=inv(eye(4)-gamma*P*pi2)*R;
% Policy evaluation. V / Q functions.Second policy (optimal)
v_ini=zeros(N_states,1);
q_ini=zeros(N_states*N_actions,1);
[v_pe q_pe]=policy_evaluation(gamma,N_states,N_actions,N_steps,P,R,pi2,v_ini,q_ini);
% Results comparison
[v_opt v_pe(:,N_steps)]
[q_opt q_pe(:,N_steps)]
% Graphical representation
figure(1),aux=repmat(v_opt,[1 N_steps])-v_pe;
plot(1:N_steps,10*log10(sum(aux.^2,1)),'LineWidth',3),grid
xlabel('Steps')
title('Policy Evaluation. V function')
figure(2),aux=repmat(q_opt,[1 N_steps])-q_pe;
plot(1:N_steps,10*log10(sum(aux.^2,1)),'LineWidth',3),grid
xlabel('Steps')
title('Policy Evaluation. Q function')



