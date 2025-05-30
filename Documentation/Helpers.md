Overview
This file briefly describes the helper (internal) functions used in the toolbox. These functions support core simulation and plotting routines.
Note: These are not intended for direct use by the end user.

1. AssignStrategies
Purpose:
Assigns strategy functions to players according to the specified population vector.

Usage:
Players = AssignStrategies(Pop, Strategies)
Where
	Pop: A vector indicating how many players use each strategy.
	Strategies: A cell array of strategy function handles.
Description:
Creates a cell array where each element corresponds to a player’s assigned strategy, repeating each strategy according to its population count.

2. Axel
Purpose:
Simulates a round-robin tournament among a population using given strategies and computes the total scores for each player.

Usage:
Scores = Axel(B, Strategies, Pop, T)
Where
	B: Payoff matrix for the Prisoner’s Dilemma.
	Strategies: Cell array of strategy function handles.
	Pop: Population vector for each strategy.
	T: Number of rounds per match.
Description:
Assigns strategies to all players, then plays a match between every unique pair, summing up the payoffs.

3. GrPlot
Purpose:
Helper function for plotting the state transition graph with node coloring, based on loaded data.

Usage:
SC = GrPlot(fname)
Where
	fname: Filename of the .mat file containing necessary simulation data.

Description:
Loads state and payoff data from a file, processes node colors for the state graph, and plots it.
Note: This function is primarily used internally for visualizing Markov chains or state transitions.

4. MatchPayoff
Purpose:
Simulates a repeated Prisoner's Dilemma match between two strategies and returns the accumulated payoffs.

Usage:
[Payoff1, Payoff2] = MatchPayoff(Strategy1, Strategy2, B, T)

Where
	Strategy1, Strategy2: Function handles for the two strategies.
	B: Payoff matrix.
	T: Number of rounds to play.
Description:
Plays T rounds between the two strategies, maintaining and updating the history, and sums the total payoffs for both players.

Final Note:
Users do not need to run these helper functions explicitly
