clear
% Definition of variables
random_walk_set_up
N_epi=20000;

% Optimum solution
v_rp=inv(eye(R_W.N_states)-R_W.gamma*R_W.pi_rp*R_W.P)*R_W.pi_rp*R_W.R;

% MC solution in exercise 5.1
exercise_5_1

% TD algorithm in script TD_RW (only works for the random policy)
[v_td] = TD_R_W(R_W,N_epi);

% We plot the results
aux=repmat(v_rp,[1 N_epi])-v_mc(:,1:N_epi);
plot(1:N_epi,10*log10(diag(aux'*aux)),'b','LIneWidth',3),grid
hold
aux=repmat(v_rp,[1 N_epi])-v_td;
plot(1:N_epi,10*log10(diag(aux'*aux)),'r','LIneWidth',3)
xlabel('Episodes')
ylabel('Error')
title('Comparison MonteCarlo / Temporal Difference'),hold off
legend('MC','TD')
axis([0 10000 -60 10])





