clear all
close all

% computational contact mechanics, 1st lecture
% lagrange multiplier method: minimization problem with equality
% constraint g(u) = 0; lambda = equivalent to contact force;
% L(u, lambda) = Pi + lambda*g(u);
% lambda*g(u) is only active when upon contact (gap < 0) 
% minimum = variation of two indedepndent variables;

% solution to the same problem: u = 1, lambda = -2 (contact established)

% two parts of the plot:
%   (1) lambda is negative, established contact, constraint active, saddle
%   function (maximum value for one direction, minimum value in another)
%   (2) unconstrained problem
%   ---> discontinuous plot

u = -1:0.15:3;
lambda1 = -3:0.15:0;
[U, Lambda1] = meshgrid(u, lambda1);
L1 = (U-2).^2 + Lambda1.*(1-U);

lambda2 = 0:0.05:1;
[U, Lambda2] = meshgrid(u, lambda2);
% no contact: only potential energy
L2 = (U-2).^2;

subplot(2,1,1)
surf(U,Lambda1,L1)
hold on
surf(U,Lambda2,L2)
% constrained minimum
plot3(1,-2,(1-2)^2 -2*(1-1),'.r','markersize',20)
xlabel('u') 
ylabel('\lambda')
zlabel('Lagrange m.')
colorbar
hold off

subplot(2,1,2)
contour(U,Lambda1,L1)
hold on
contour(U,Lambda2,L2)
% constrained minimum
plot3(1,-2,(1-2)^2 -2*(1-1),'.r','markersize',20)
xlabel('u') 
ylabel('\lambda')
zlabel('Lagrange m.')
colorbar
hold off

suptitle('Potential energy function w/ Lagrange multiplier ')