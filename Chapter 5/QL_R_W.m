function [q_ql] = QL_R_W(R_W,N_epi)

q_ql=zeros(R_W.N_states*R_W.N_actions,N_epi);
epsilon=0.2;

for k=1:N_epi
	if k>1, q_ql(:,k)=q_ql(:,k-1); end % Start from the previous episodes value function
    S=zeros(100,1); %buffer
    S(1)=4;
    in=1;
    cont=1;
    R=0;
    while in==1
        aux = q_ql((S(cont)-1)*R_W.N_actions+1:S(cont)*R_W.N_actions,k);
        
        % Choose e-greedy action
        [~,a] = max(aux);
        u = rand(1,1);

        if u<epsilon
            a_egreedy = 1-a;
        else
            a_egreedy = a;
        end
        % We increment count and go to the next state
        cont=cont+1;
        % We choose obtain the value of the next state and the possible
        % reward
        if a_egreedy==0, S(cont)=S(cont-1)+1; end
        if a_egreedy==1, S(cont)=S(cont-1)-1; end

        if S(cont)==1,in=0;end
        if S(cont)==7,R=1;in=0;end
        
        index_prev=1+a_egreedy +(S(cont-1)-1)*(R_W.N_actions);
        
        ql_err = R + R_W.gamma*max(q_ql(1+(S(cont)-1)*(R_W.N_actions)...
            :S(cont)*(R_W.N_actions),k))-q_ql(index_prev,k); %q error
        
        q_ql(index_prev,k)=q_ql(index_prev,k)+R_W.alpha*ql_err; %update
        
    end 

end



