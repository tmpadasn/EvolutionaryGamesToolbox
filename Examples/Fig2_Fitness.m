%% Figure 2
T = 1000;
B = [3 0; 5 1];  % CIPD matrix

Strategies = {'gradual', 'tit_for_tat', 'per_cd'};
POP0 = [100, 100, 100];
J = 10;

[POP_sim, ~, FIT_sim] = TourSimFit(B, Strategies, POP0, T, J);
[POP_the, ~, FIT_the] = TourTheFit(B, Strategies, POP0, T, J);

figure('Position', [100, 100, 2400, 1000]);
subplot(1,2,1);
plot(POP_sim, 'LineWidth', 2); title('Simulated'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_the, 'LineWidth', 2); title('Theoretical'); legend(Strategies); grid on;
sgtitle('Figure 2: gradual vs tit\_for\_tat vs per\_cd');