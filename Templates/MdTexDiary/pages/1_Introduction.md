# Introduction


## Background

slower than than linear: One dollar, one vote $\rightarrow$ olligarchy

quickly than a linear: One person, one vote $\rightarrow$ tyranny of the
majority

Drawbacks of "One person, one vote" systems:
- Votes can end up split between two similar preferred candidates, allowing a
  less preferred dissimilar candidate to win.
- Issues that disproportionately affect minorities, can be decided on by a
  majority who may only have weak preferences, and for whom the outcome may
  have little impact.

Robustness of a voting system: how sensitive a voting scheme
is to non-ideal behavior from either voters or outside influence.

- Collusion: two or more individuals or groups work together in an illegal or
  unethical manner to influence the outcome of an election
  QV $>$ One-person-one-vote, VCG or Groves and Ledyard mechanisms.
- Voter irrationality and misconceptions

## Properties of an ideal voting system

### System behaviour
- *Eligibility*: Only the registered voters can vote. Nobody can vote more than
  once.
- *Fairness*: No preliminary results are available which could influence other
  voter's decisions.
- *Robustness*: The protocol should be able to tolerate a certain number of
  misbehaving voters.

### Verifiability
- *Individual Verifiability*: Each voter can check whether his vote was counted
  correctly.
- *Universal Verifiability*: Anybody can verify that the announced result
  corresponds to the sum of all votes.

### Privacy properties
- *Vote-Privacy*: The votes are kept private.
- *Receipt-Freeness*: A voter cannot construct a receipt which allows him to
  prove to a third party that he voted for a certain candidate. This is to
  prevent vote-buying.
- *Coercion-Resistance*: Even when a voter interacts with a coercer during the
  entire voting process, the coercer cannot be sure whether the voter followed
  his instructions or actually voted for another candidate.


## Vickrey–Clarke–Groves mechanism

- Let $X$ be a set of possible outcomes and there are $n$ agents (voters)

- Valuation of agent $i$ for an outcome $x \in X$ in monetary terms
  $$v\_i : X \longrightarrow R\_{+}$$

- The agents have _Quasilinear utility_ functions. If the outcome is $x$
  and in addition the agent receives a payment $p\_i$ (positive or negative),
  then the total utility is $$u\_i = v\_i(x) + p\_i$$

- The goals is select an outcome that maximizes the sum of values, so our
  social-choice function is utilitarian:
  $$x\_{\text{optimal}} = \arg\max\_{x \in X} \sum\_{i=1}^n v\_i(x)$$


$$\text{cost to the voter} = (\text{number of votes})^2$$

## Problem statement

