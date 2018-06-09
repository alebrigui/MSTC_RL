function [q_ql] = QL_R_W(R_W,N_epi)

q_ql=zeros(R_W.N_states*R_W.N_actions,N_epi);

for k=1:N_epi
	if k>1, q_ql(:,k)=q_ql(:,k-1); end % Start from the previous episodes value function
    S=zeros(100,1); %buffer
    S(1)=4;
    in=1;
    cont=1;
    R=0;
    while in==1
    	cont=cont+1;
        u=rand(1,1);
        if u>1/2
            S(cont)=S(cont-1)+1;
            a=0; 
        else
            S(cont)=S(cont-1)-1;
            a=1;
        end
        if S(cont)==1,in=0;end
        if S(cont)==7,R=1;in=0;end
        index_prev=1+a+(S(cont-1)-1)*(R_W.N_actions);
        ql_err = R + R_W.gamma*max(q_ql(1+(S(cont)-1)*(R_W.N_actions)...
            :S(cont)*(R_W.N_actions),k))-q_ql(index_prev,k); %q error
        q_ql(index_prev,k)=q_ql(index_prev,k)+R_W.alpha*ql_err; %update
    end 

end



