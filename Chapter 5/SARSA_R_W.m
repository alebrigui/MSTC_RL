function [q_sarsa] = SARSA_R_W(R_W,N_epi)

q_sarsa=zeros(R_W.N_states*R_W.N_actions,N_epi);
epsilon=0.2;

for k=1:N_epi
	if k>1, q_sarsa(:,k)=q_sarsa(:,k-1); end % Start from the previous episode value function
    S=zeros(100,1); %buffer for states
    S(1)=4;
    in=1;
    cont=1;
    R=0;
    % Subset q for the the actual state (4)
    aux = q_sarsa((S(cont)-1)*R_W.N_actions+1:S(cont)*R_W.N_actions,k);
    % Choose e-greedy action
    [~,a] = max(aux);
    u = rand(1,1);
     
    if u<epsilon
        a_egreedy = 1-a;
    else
        a_egreedy = a;
    end
    
    while in==1
        cont= cont+1;
        % Epsilon greedy action selection
        
        if a_egreedy==0, S(cont)=S(cont-1)+1; end
        if a_egreedy==1, S(cont)=S(cont-1)-1; end
        
        % Did we get a reward?
        if S(cont)==1,in=0;end
        if S(cont)==7,R=1;in=0;end
        
        aux2 = q_sarsa((S(cont)-1)*R_W.N_actions+1:S(cont)*R_W.N_actions,k);
        [~,a_prim] = max(aux2);
        a_prim_greedy = a_prim - 1; % 0 is right and 1 is left
        
        u = rand(1,1);
        % we take an epsilon-greedy action
        if u<epsilon
            a_prim_egreedy = 1-a_prim_greedy;
        else
            a_prim_egreedy = a_prim_greedy;
        end
        
        % index for previous (s,a) and actual (s',a')
        index_prev = 1+a_egreedy+(S(cont-1)-1)*(R_W.N_actions);
        index_act  = 1+a_prim_egreedy+(S(cont)-1)*(R_W.N_actions);
        
        ql_err = R + R_W.gamma*q_sarsa(index_act,k)-q_sarsa(index_prev,k); %q error
        q_sarsa(index_prev,k)=q_sarsa(index_prev,k)+R_W.alpha*ql_err; %update
        
        % next action is the actual one a_prim
        a_egreedy = a_prim_egreedy;     
    end 

end