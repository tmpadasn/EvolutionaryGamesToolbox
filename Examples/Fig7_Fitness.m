%% Figure 7
T = 1000;
B = [3 0; 5 1];  % CIPD matrix

Strategies = {'per_ccd', 'per_ddc', 'soft_majo'};
POP0 = [300, 244, 100];
POP1 = [300, 245, 100];
J = 1000;

[POP_sim, ~, FIT_sim] = TourTheFit(B, Strategies, POP0, T, J);
[POP_the, ~, FIT_the] = TourTheFit(B, Strategies, POP1, T, J);

figure('Position', [100, 100, 2400, 1000]);
subplot(1,2,1);
plot(POP_sim, 'LineWidth', 2); title('Theoretical_per_ddc_244'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_the, 'LineWidth', 2); title('Theoretical_per_ddc_245'); legend(Strategies); grid on;
sgtitle('Figure 7: per\_ccd244 vs per\_ccd245');

%% Figure 7 Simulated
Strategies = {'per_ccd', 'per_ddc', 'soft_majo'};
POP0 = [300, 244, 100];
POP1 = [300, 245, 100];
J = 1000;

[POP_sim, ~, FIT_sim] = TourSimFit(B, Strategies, POP0, T, J);
[POP_the, ~, FIT_the] = TourSimFit(B, Strategies, POP1, T, J);

figure('Position', [100, 100, 2400, 1000]);
subplot(1,2,1);
plot(POP_sim, 'LineWidth', 2); title('Simulated_per_ddc_244'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_the, 'LineWidth', 2); title('Simulated_per_ddc_245'); legend(Strategies); grid on;
sgtitle('Figure 7 Simulated: per\_ccd244 vs per\_ccd245');