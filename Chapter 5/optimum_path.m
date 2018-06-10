function [path] = optimum_path(problem,q)

% Variables
N_states = problem.N_states;
N_actions = problem.N_actions;
P = problem.P;
pi_greedy = zeros(N_states,N_states*N_actions);
final_state = 12;
% We calculate the optimum trajectory
% initialize the first state 
S_ini = zeros(1,N_states);
S_ini(1)=1;

% we obtain the matrix pi_greedy 

for kk=1:N_states
    aux = q((kk-1)*N_actions+1:kk*N_actions);
    % Choose e-greedy action
    [~,opt_a] = max(aux);
    pi_greedy(kk,((kk-1)*N_actions+opt_a)) = 1;
end

s = 1; %initial state
k = 1;
S(:,k)=S_ini;
path(k)=1;
while s~=final_state
    %greedy action selection
    k = k+1;
    S(:,k)= (S(:,k-1)'*(pi_greedy*P))';
    s = find(S(:,k)==1);
    path(k)=s;
end 

