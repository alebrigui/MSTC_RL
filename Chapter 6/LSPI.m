function [theta_est,q_ite]=LSPI(R_W_approx,Niter,e_s,N_features,phi_q)

pi = zeros(R_W_approx.N_states,R_W_approx.N_states*R_W_approx.N_actions);
q_ite = zeros(R_W_approx.N_states*R_W_approx.N_actions);
epsilon = 0.1;

% we start with a randomly initialized determinstic policy
for kk=1:R_W_approx.N_states
    opt_a = randsample(1:R_W_approx.N_actions,1);
    pi(kk,((kk-1)*R_W_approx.N_actions+opt_a)) = 1;
end  

for k=1:Niter
    
    % Policy evaluation with an adapted version of LSTD
    [theta_est,q_ite] = LSTD_2(e_s,R_W_approx,N_features,phi_q,pi,epsilon);
    
    % we create an empty policy matrix
    pi_greedy = zeros(R_W_approx.N_states,R_W_approx.N_states*...
        R_W_approx.N_actions);
    
    % we create the greedy policy based on the q_est_approx
    for kk=1:R_W_approx.N_states
        aux = q_ite((kk-1)*R_W_approx.N_actions+1:kk*R_W_approx.N_actions);
        % Choose e-greedy action
        [~,opt_a] = max(aux);
        pi_greedy(kk,((kk-1)*R_W_approx.N_actions+opt_a)) = 1;
    end
    
    % Greedy update of the policy
    pi = pi_greedy; 
end

