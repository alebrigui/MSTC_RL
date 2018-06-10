clear
% Definition of variables
random_walk_set_up
N_epi=20000;
v_mc=zeros(R_W.N_states,N_epi);
N=zeros(R_W.N_states,1);

% Optimum solution
v_rp=(eye(R_W.N_states)-gamma*pi_rp*R_W.P)\pi_rp*R_W.R;

% MC every visit algorithm
for k=1:N_epi
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
    end
    
    g=R; 
    
    for kk=cont-1:-1:1     
        N(S(kk)) = N(S(kk))+1;
        v_mc(S(kk),k) = v_mc(S(kk),k)+1/N(S(kk))*(g-v_mc(S(kk),k));
        g = gamma*g;
    end
    v_mc(:,k+1)=v_mc(:,k);
    
end

[v_rp v_mc(:,N_epi)]






