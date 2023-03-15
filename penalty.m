close all
clear all

% computational contact mechanics, 1st lecture
% penalty method: constrained minimization problem
% minimization of the potential energy of the spring - variation

syms epsilon

% plot u (displacement) as a function of epsilon (penalty coefficient)
% constraint at u=1: epsilon = 0, displacement can go all the way to 2
%               the higher epsilon is, 'the less behind 1' the spring goes 
figure(1)
u = (4+epsilon)/(2+epsilon);
fplot(u,[0 100],'c','LineWidth',2)
xlabel('epsilon') 
ylabel('u min')

% plot lambda (contact force) as a function of epsilon (penalty coefficient)
figure(2)
lambda = -2*epsilon/(2+epsilon);
fplot(lambda,[0 100],'m','LineWidth',2)
xlabel('epsilon')
ylabel('lambda (contact force)')

syms u

energy = (u-2)^2 + 0.5*epsilon*(u-1)^2;     % potential energy of the spring

% lot potential energy of the spring for different epsilon (constraint at 1)
figure(3)
energy_epsilon0 = subs(energy, epsilon, 0); 
fplot(energy_epsilon0, [-1 3], '--k','LineWidth',2);

hold on

energy_epsilon2 = subs(energy, epsilon, 2); 
fplot(energy_epsilon2, [1 3], 'c','LineWidth',2);

energy_epsilon50 = subs(energy, epsilon, 10); 
fplot(energy_epsilon50, [1 3], 'm','LineWidth',2);

energy_epsilon100 = subs(energy, epsilon, 100); 
fplot(energy_epsilon100, [1 3], 'y','LineWidth',2);

xline(1);

title('Pi of the spring for different epsilon');
xlabel('u') 
ylabel('Pi')
ylim([0 10])
legend('\epsilon = 0','\epsilon = 2','\epsilon = 10','\epsilon =100')

hold off



