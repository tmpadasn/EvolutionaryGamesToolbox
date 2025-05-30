Overview
This document describes the core functions that implement Fitness Dynamics in the toolbox.
Fitness dynamics model how the population of each strategy evolves based on their average payoffs, simulating evolutionary selection in the Iterated Prisoner’s Dilemma.

Each function below offers a different way to simulate fitness-based evolution of strategies.

1. TourSimFit
Purpose:
Simulates evolutionary dynamics where the population of each strategy changes each generation according to relative average fitness.

Usage:
	[POP, BST, FIT] = TourSimFit(B, Strategies, POP0, T, J)
Where
	B: Payoff matrix.
	Strategies: Cell array of strategy function handles.
	POP0: Initial population vector for each strategy.
	T: Number of rounds per match between strategies.
	J: Number of generations to simulate.
Outputs:
	POP: Population of each strategy at every generation.
	BST: Index of the best-performing strategy at each generation.
	FIT: Fitness (average payoff) of each strategy at each generation.
	
Description:
In each generation, every strategy is matched against all others for a set number of rounds to determine average payoffs (fitness).
The next generation’s population for each strategy is set proportional to its fitness. The process repeats for a given number of generations.

2. TourSimFitPvP
Purpose:
Simulates fitness dynamics at the player-versus-player (PvP) level, where each individual is explicitly represented.

Usage:
	[POP, BST, FIT] = TourSimFitPvP(B, Strategies, POP0, T, J)
Where
	B: Payoff matrix.
	Strategies: Cell array of strategy function handles.
	POP0: Initial population vector for each strategy.
	T: Number of rounds per match.
	J: Number of generations.
Outputs:
	POP: Population of each strategy at each generation.
	BST: Index of the best-performing strategy at each generation.
	FIT: Fitness (average score) of each strategy at each generation.
Description:
Each player is assigned a strategy, and all pairs play matches.
Average scores for each strategy are computed. The population for the next generation is then set proportional to these scores, keeping the total number of players constant.

3. TourTheFit
Purpose:
Simulates fitness dynamics using a theoretical approach based on a precomputed payoff matrix, updating populations according to distributed payoffs.

Usage:
	[POP, BST, FIT] = TourTheFit(B, Strategies, POP0, T, J)
Where
	B: Payoff matrix.
	Strategies: Cell array of strategy function handles.
	POP0: Initial population vector for each strategy.
	T: Number of rounds per match.
	J: Number of generations.
Outputs:
	POP: Population of each strategy at each generation.
	BST: Index of the best-performing strategy at each generation.
	FIT: Fitness (score) of each strategy at each generation.
Description:
First, a matrix of expected payoffs for all strategy pairs is computed.
For each generation, the fitness of each strategy is determined by its total expected payoff against the current population. The population for the next generation is updated proportionally, simulating a theoretical distribution of payoffs.

=================> Example Usage <========================
% Example: Run fitness dynamics with 3 strategies
B = [3 0; 5 1];                % Standard PD payoff matrix
Strategies = {@tit_for_tat, @all_d, @all_c};
POP0 = [10 10 10];             % Initial population: 10 of each
T = 100;                       % 100 rounds per match
J = 50;                        % 50 generations

[POP, BST, FIT] = TourSimFit(B, Strategies, POP0, T, J);
