?clear
Nb=2;                          % number of bandits
m=[10 30]';                    % mean of every bandit (expectation of q(a))
[mmax, im]=max(m);
N_steps=100;
r=[0.1 0];                           % e-greedy values
rew=randn(Nb,N_steps)+kron(m,ones(1,N_steps));
u=ones(1,N_steps);
u([25 50 75])=[0.05 0.05 0.05];

win=zeros(length(r),N_steps);
for kk=1:length(r)                     % we repeat this process for the two values of e greedy values
    q=zeros(N_steps,Nb);
    N=zeros(1,Nb);                      % Number of times we visited every state
    in_ma=1;win(kk,1)=rew(in_ma,1);     % we always start playing at the first machine
    N(1,in_ma)=N(1,in_ma)+1;            % We add 1 to the count of machine 1
    ind=N(1,in_ma);                     % Ind is the number of time we played the machine in_ma
    q(1,in_ma)=win(kk,1);               % the action value function is equal to the generated winnings
    for k=2:N_steps                     % we loop through the N_steps
        q(k,:)=q(k-1,:);                %
        if  u(k)<r(kk)
            in_ma= 1*(in_ma==2)+...     % as explained we switch to the other machine every time u is
                2*(in_ma==1);           % below threshold                                     
        else
            [ma, in_ma]=max(q(k,:));    % greedy action choosing the machine that maximizes q
        end
        N(1,in_ma)=N(1,in_ma)+1;        % we increment the count of the machine chosen in_ma
        ind=N(1,in_ma);                 % we retrieve the value of this count
        win(kk,k) = rew(in_ma,k); % we add the reward collected to the cumulated winnings
        q(k,in_ma)=(ind-1)/ind*q(k,in_ma)+1/ind*(win(kk,k)); %we calculate new q
    end
end
plot(1:N_steps,cumsum(win(1,:)),'b','LineWidth',3),grid,hold
plot(1:N_steps,cumsum(win(2,:)),'r','LineWidth',3),
plot(1:N_steps,(1:N_steps)*max(m),'m','LineWidth',3),hold off
legend('Deterministic exploration','No exploration','Maximum Gain'),
xlabel('Steps')
ylabel('Winnings')
title('Analysis of the Multiarmed Bandit')