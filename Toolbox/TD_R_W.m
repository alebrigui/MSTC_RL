function [v_td] = TD_R_W(R_W,N_epi)

% Implementation of the temporal difference for the random walk problem
% predicting the value function for the random policy in N_epi episodes.

v_td = zeros(R_W.N_states,N_epi);

for k=1:N_epi
	if k>1, v_td(:,k)=v_td(:,k-1); end % Start from the previous episodes value function
    S=zeros(100,1);
    S(1)=4;
    in=1;
    cont=1;
    R=0;
    while in==1
    	cont=cont+1;
    	S(cont)=S(cont-1)+sign(randn(1,1));
        if S(cont)==1,in=0;end
        if S(cont)==7,R=1;in=0;end
        td_err = R+R_W.gamma*v_td(S(cont),k)- v_td(S(cont-1),k); %td error
        v_td(S(cont-1),k)=v_td(S(cont-1),k)+R_W.alpha*td_err; %update
    end 

end

