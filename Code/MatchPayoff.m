function [Payoff1, Payoff2] = MatchPayoff(Strategy1, Strategy2, B, T)
    % history1 = []; history2 = [];
    History = zeros(0, 2);
    Payoff1 = 0; Payoff2 = 0;
    for Turn = 1:T
        P1History = [History(:, 1) History(:, 2)];
        Move1 = feval(Strategy1, P1History);
        P2History = [History(:, 2) History(:, 1)];
        Move2 = feval(Strategy2, P2History);
        % Move1 = feval(Strategy1, history1, history2);
        % Move2 = feval(Strategy2, history2, history1);
        Payoff1 = Payoff1 + B(Move1, Move2); 
        Payoff2 = Payoff2 + B(Move2, Move1);
        HistoryNew = [Move1 Move2];
        History = [History; HistoryNew];
        % history1 = [history1 move1];
        % history2 = [history2 move2];
    end
end