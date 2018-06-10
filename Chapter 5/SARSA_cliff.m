function q_sarsa = SARSA_cliff(cliff,N_epi)

q_sarsa=zeros(cliff.N_states*cliff.N_actions,N_epi);
epsilon=0.5;

for k=1:N_epi
	if k>1, q_sarsa(:,k)=q_sarsa(:,k-1); end % Start from the previous episodes value function
    S(1)=1; %varying size buffer
    in=1;
    cont=1;
    aux = q_sarsa((S(cont)-1)*cliff.N_actions+1:S(cont)*cliff.N_actions,k);
    % Choose e-greedy action
    [~,a] = max(aux);
    u = rand(1,1);
     
    if u<epsilon
        a_egreedy = randsample(1:4,1);
    else
        a_egreedy = a;
    end
    
    while in==1
        % we get the next state and the reward
        
        % sa_index is the index corresponding to the previous state and
        % action
        sa_index = (S(cont)-1)*cliff.N_actions+a_egreedy;
        % Reward for the previous state/action
        R = cliff.R(sa_index);
        cont = cont+1;
        
        % we increment the cont and get the next state
        S(cont) = find(cliff.P(sa_index,:)==1);
        
        % end episode if we fall (2 to 11) or finish 12
        if (S(cont)>1 && S(cont)<13),in=0;end
        
        aux2 = q_sarsa((S(cont)-1)*cliff.N_actions+1:S(cont)*cliff.N_actions,k);     
        % Choose e-greedy action
        [~,a] = max(aux2);
        u = rand(1,1);
        
        if u<epsilon
            a_prim_egreedy = randsample(1:4,1);
        else
            a_prim_egreedy = a;
        end
        
        index_prev = a_egreedy +(S(cont-1)-1)*(cliff.N_actions);
        index_act = a_prim_egreedy + (S(cont)-1)*(cliff.N_actions);
        
        ql_err = R + cliff.gamma*q_sarsa(index_act,k)-q_sarsa(index_prev,k); %q error
        
        q_sarsa(index_prev,k)=q_sarsa(index_prev,k)+cliff.alpha*ql_err; %update
        
        % next action is the actual one a_prim
        a_egreedy = a_prim_egreedy;     
        
    end 

end


end