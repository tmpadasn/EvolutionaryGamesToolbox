%% Figure 10
Strategies = {'per_ccd', 'per_ddc', 'soft_majo'};
POP0 = [300, 244, 100];
T = 1000;
J = 500;
B = [3 0; 4.6 1];  % CIPD matrix
[POP_sim, ~, FIT_sim] = TourTheFit(B, Strategies, POP0, T, J);

J = 1000;
B = [3 0; 4.7 1];  % CIPD matrix
[POP_the, ~, FIT_the] = TourTheFit(B, Strategies, POP0, T, J);

figure('Position', [100, 100, 2400, 1000]);
subplot(1,2,1);
plot(POP_sim, 'LineWidth', 2); title('T=4.6'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_the, 'LineWidth', 2); title('T=4.7'); legend(Strategies); grid on;
sgtitle('Figure 10: T=4.6 vs T=4.7');

%% Figure 10 Simulated
Strategies = {'per_ccd', 'per_ddc', 'soft_majo'};
POP0 = [300, 244, 100];
T = 1000;
J = 500;
B = [3 0; 4.6 1];  % CIPD matrix
[POP_sim, ~, FIT_sim] = TourSimFit(B, Strategies, POP0, T, J);

J = 1000;
B = [3 0; 4.7 1];  % CIPD matrix
[POP_the, ~, FIT_the] = TourSimFit(B, Strategies, POP0, T, J);

figure('Position', [100, 100, 2400, 1000]);
subplot(1,2,1);
plot(POP_sim, 'LineWidth', 2); title('T=4.6'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_the, 'LineWidth', 2); title('T=4.7'); legend(Strategies); grid on;
sgtitle('Figure 10 Simulated: T=4.6 vs T=4.7');