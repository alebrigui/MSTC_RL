function [q_ql] = QL_R_W(R_W,N_episodes)

q_ql=zeros(R_W.N_states*R_W.N_actions,N_episodes);

for k=1:N_epi
	if k>1, q_ql(:,k)=q_ql(:,k-1); end % Start from the previous episodes value function
    S=zeros(100,1); %buffer
    S(1)=4;
    in=1;
    cont=1;
    R=0;
    while in==1
    	cont=cont+1;
    	S(cont)=S(cont-1)+sign(randn(1,1));
        if S(cont)==1,in=0;end
        if S(cont)==7,R=1;in=0;end
        ql_err = R + R_W.gamma*max(q_ql(1+(S(cont)-1)*...
            (N_actions):S(cont)*(N_actions),k)); %td error
        q_ql(S(cont-1),k)=q_ql(S(cont-1),k)+R_W.alpha*ql_err; %update
    end 

end



