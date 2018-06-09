function [v, q]=policy_evaluation(gamma,N_states,N_actions,N_steps,...
    P,R,pi_m)
% Policy evaluation. V / Q functions


v=zeros(N_states,N_steps);
q=zeros(N_states*N_actions,N_steps);

for k=1:N_steps-1
    v(:,k+1)=pi_m*(R+gamma*P*v(:,k));
    q(:,k+1)=R+P*gamma*pi_m*q(:,k);
end
