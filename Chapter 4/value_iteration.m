function [v, q]=value_iteration(gamma,N_states,N_actions,N_steps,P,R,pi_m)
% Value iteration
v=zeros(N_states,N_steps);
q=zeros(N_states*N_actions,N_steps);
q(:,1)=R;
for k=1:N_steps-1
    for kk=1:N_states
        v(kk,k+1)=max(R(1+(kk-1)*(N_actions):kk*(N_actions))+gamma*...
            P(1+(kk-1)*(N_actions):kk*(N_actions),:)*v(:,k));
    end
    q(:,k+1)=R+P*gamma*v(:,k+1);
end
