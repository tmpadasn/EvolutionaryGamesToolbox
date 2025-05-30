%% Figure 2 a = 3
T = 100;
a = 3;
B = [a 1;
     4 2];

Strategies = {'per_ddc', 'per_cd', 'soft_majo'};
POP0 = [6, 6, 6];
J = 90;
K = 1;
POP_the = TourTheFit(B, Strategies, POP0, T, J);
[POP_sim, ~] = TourSimImi(B, Strategies, POP0, K, T, J);

figure('Position', [100, 100, 2400, 1000]);
subplot(1,2,1);
plot(POP_the, 'LineWidth', 2); title('Theoretical'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_sim, 'LineWidth', 2); title('Simulation'); legend(Strategies); grid on;
sgtitle('Figure 2 a = 3 (Initial Pop: [6, 6, 6]): per\_cd vs per\_ddc vs soft\_majo');

%% Figure 2 a = 3.4
T = 100;
a = 3.4;
B = [a 1;
     4 2];

Strategies = {'per_ddc', 'per_cd', 'soft_majo'};
POP0 = [6, 6, 6];
J = 90;
K = 1;
POP_the = TourTheFit(B, Strategies, POP0, T, J);
[POP_sim, ~] = TourSimImi(B, Strategies, POP0, K, T, J);

figure('Position', [100, 100, 2400, 1000]);
subplot(1,2,1);
plot(POP_the, 'LineWidth', 2); title('Theoretical'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_sim, 'LineWidth', 2); title('Simulation'); legend(Strategies); grid on;
sgtitle('Figure 2 a = 3.4 (Initial Pop: [6, 6, 6]): per\_cd vs per\_ddc vs soft\_majo');

%% Figure 2 a = 3.8
T = 100;
a = 3.8;
B = [a 1;
     4 2];

Strategies = {'per_ddc', 'per_cd', 'soft_majo'};
POP0 = [6, 6, 6];
J = 90;
K = 1;
POP_the = TourTheFit(B, Strategies, POP0, T, J);
[POP_sim, ~] = TourSimImi(B, Strategies, POP0, K, T, J);

figure('Position', [100, 100, 2400, 1000]);
subplot(1,2,1);
plot(POP_the, 'LineWidth', 2); title('Theoretical'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_sim, 'LineWidth', 2); title('Simulation'); legend(Strategies); grid on;
sgtitle('Figure 2 a = 3.8 (Initial Pop: [6, 6, 6]): per\_cd vs per\_ddc vs soft\_majo');