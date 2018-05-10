function [v_pi q_pi]=policy_iteration(gamma,N_states,N_actions,N_steps,N_steps_pe,P,R,pi_m)

% Policy improvement. Start from uniform distribution
pi_ite=pi_m;
q_pi=zeros(N_states*N_actions,N_steps);
v_pi=zeros(N_states,N_steps);
q_pi(:,1)=R;
for k=1:N_steps-1
    aux=zeros(N_states*N_actions,N_steps);
    aux(:,1)=q_pi(:,k);
    for kk=1:N_steps_pe-1
    	aux(:,kk+1)=R+P*gamma*pi_ite*aux(:,kk);   
    end
    q_pi(:,k+1)=aux(:,N_steps_pe);
    for kk=1:N_states
        v_pi(kk,k+1)=max(q_pi(1+(kk-1)*(N_actions):kk*(N_actions),k+1));
        aux=q_pi((kk-1)*N_actions+1:kk*N_actions,k+1);
        aux2=find(aux==max(aux));
        sol=zeros(1,N_actions);
        sol(aux2)=ones(1,length(aux2))/length(aux2);    
        pi_ite(kk,(kk-1)*N_actions+1:kk*N_actions)=sol;
    end
end


