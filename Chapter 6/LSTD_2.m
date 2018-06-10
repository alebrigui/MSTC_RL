function [theta_est,q_est_approx]=LSTD_2(Niter,problem,...
    N_features,phi_q,pol,epsilon)

M = N_features*problem.N_actions;

% rng
rng = RandStream('mlfg6331_64');            

% for debugging purpose we see the number of visitations
N = zeros(problem.N_states*problem.N_actions,1);

% G,L,z initialization
G = zeros(M,M);
L = zeros(M,M);
z = zeros(M,1);

s = 1;
aux = pol(s,(s-1)*problem.N_actions+1:...
    s*problem.N_actions);

% Get the action following the policy
a= find(aux==1);


for k=1:Niter
        % we get the index of the line corresponding to our s,a
        sa_index = (s-1)*problem.N_actions+a;
        N(sa_index) = N(sa_index)+1;
        % Reward for the previous state/action
        R = problem.R(sa_index);

        % we obtain the next state by sampling following the line in
        % the transition matrix that corresponds to our s,a combination
        % because the transitions are stochastic        
        s_prev = s;
        a_prev = a;
        s = randsample(rng,1:problem.N_states,1,true,...
            problem.P(sa_index,:));
               
        % aux is the line of the policy matrix that corresponds to 
        % our state
        aux = problem.pi_opt(s,(s-1)*problem.N_actions+1:...
            s*problem.N_actions);
        
        % Get the action following the actual policy
        a_pol = find(aux==1);
        
        u = rand(1,1);
        
        if u<epsilon
            a = randsample(1:problem.N_actions,1);
        else
            a = a_pol;
        end
        
        index_prev = (s_prev-1)*problem.N_actions+a_prev;
        index_act = (s-1)*problem.N_actions+a;
        
        phi_sa_prev = phi_q(index_prev,:);
        phi_sa = phi_q(index_act,:);
        
        G = G + phi_sa_prev'*phi_sa_prev;

        L = L + phi_sa_prev'*phi_sa;

        z = z + phi_sa'*R;
    
end

theta_est    = (G-problem.gamma*L)\z;
q_est_approx = phi_q*theta_est;
    