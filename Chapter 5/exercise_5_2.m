% We study the off-policy implementation
clear
% Definition of variables
random_walk_set_up
N_epi=20000;
v_mc=zeros(1,N_epi);

% Optimum solution
v_off=(eye(R_W.N_states)-gamma*pi_off*R_W.P)\pi_off*R_W.R;
v4_theory=v_off(4);

% MC off-policy algorithm. Only for state 4

for k=1:N_epi
    S_off=zeros(100,1);     % Buffer large enough
    S_off(1)=4;
    in=1;
    cont=1;
    R=0;
    cont_r=0;
    cont_l=0;
    while in==1
    	cont=cont+1;
        u=rand(1,1);
        if u>1/2,
            S_off(cont)=S_off(cont-1)+1;
            cont_r=cont_r+1;
        else
            S_off(cont)=S_off(cont-1)-1;
            cont_l=cont_l+1;
        end
        
        if S_off(cont)==1,in=0;end
        if S_off(cont)==7,R=1;in=0;end
        
    end
    % importance weight 
    weight = ((2/3)^(cont_r)*(1/3)^(cont_l))/((1/2)^(cont_l+cont_r));
    % v_mc weighted is the value of the state for the target policy
    v_mc(k) = R*(gamma^(cont-2))*weight;

end

% Results comparison
[v4_theory mean(v_mc)]






