function [theta_est,q_est_approx]=LSTD(Niter,problem,...
    N_features,phi_q,pol)

if pol=='op', epsilon=0; end
if pol=='rp', epsilon=1; end

M = N_features*problem.N_actions;

% rng
rng = RandStream('mlfg6331_64');            


G = zeros(M,M);
L = zeros(M,M);
z = zeros(M,1);


s = 1;
a = randsample(1:2,1); % we initialize s and a

for k=1:Niter
        % we get the index of the line corresponding to our s,a
        sa_index = (s-1)*problem.N_actions+a;
        % Reward for the previous state/action
        R = problem.R(sa_index);

        % we obtain the next state by sampling following the line in
        % the transition matrix that corresponds to our s,a combination
        s_prev = s;
        s = randsample(rng,1:problem.N_states,1,true,...
            problem.P(sa_index,:));
        
        % aux is the line of the policy matrix that corresponds to 
        % our state
        aux = problem.pi_opt(s,(s-1)*problem.N_actions+1:...
            s*problem.N_actions);
        % Choose greedy action
        a_opt = find(aux==1);
        u =randn(1,1);

        a_prev = a;
        % If we choose random policy we sample randomly else we take
        % the optimal action 
        if u<epsilon
            a=randsample(1:problem.N_actions,1);
        else
            a=a_opt;
        end    
        
        phi_sa_prev = phi_q((s_prev-1)*problem.N_actions+a_prev,:);
        phi_sa = phi_q((s-1)*problem.N_actions+a,:);
        
        G = G + phi_sa_prev'*phi_sa_prev;

        L = L + phi_sa_prev'*phi_sa;

        z = z + phi_sa'*R;
    
end

theta_est    = (G-problem.gamma*L)\z;
q_est_approx = phi_q*theta_est;
    