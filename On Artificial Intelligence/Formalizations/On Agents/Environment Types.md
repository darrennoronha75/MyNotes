
The properties of the environment determine the difficulty of the agent's task and the choice of algorithm design.

### Key Classifications
1. **Fully Observable vs. Partially Observable**:
   * **Fully**: Sensors detect the complete state of the world (e.g., Chess).
   * **Partially**: Noisy or missing data (e.g., Poker, Self-driving).

2. **Deterministic vs. Stochastic**:
   * **Deterministic**: Next state is determined purely by current state and action (e.g., Crossword).
   * **Stochastic**: Next state involves uncertainty/randomness (e.g., Dice games, Traffic).

3. **Episodic vs. Sequential**:
   * **Episodic**: Experience is divided into atomic episodes; current action doesn't affect future episodes (e.g., Image classification).
   * **Sequential**: Current decision affects all future decisions (e.g., Chess, Driving).

4. **Static vs. Dynamic**:
   * **Static**: Environment doesn't change while the agent is "thinking" (e.g., Sudoku).
   * **Dynamic**: Environment changes regardless of agent action (e.g., Taxi driving).

5. **Discrete vs. Continuous**:
   * **Discrete**: Finite number of states/actions (e.g., Chess).
   * **Continuous**: Infinite/Smooth states (e.g., Steering angle).

### Links
* **Context**: [[Agent]], [[PEAS]]