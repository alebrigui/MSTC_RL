clear all
clc

P=[0.6 0.4;0.1 0.9];
% Eigen-analysis solution
[eigvecs, eigvals, W] = eig(P');
d_final = eigvecs(:,2)/sum(eigvecs(:,2))



