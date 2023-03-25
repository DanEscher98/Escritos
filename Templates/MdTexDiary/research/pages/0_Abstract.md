# Abstract

The present work describes the implementation of a *quadratic voting system* on
the `Substrate` blockchain framework, using `FRAME` pallets. It is inspired by
the Fujioka protocol- a practical secret voting scheme for large scale
elections. The properties provided are:

- Quadratic Voting: Users with verified identities can reserve and lock
  tokens, which weigh their votes on a quadratic scale.
- Sybil-resilence: To prevent this kind of attacks, an identity verification
  mechanism is provided
- Two different types of proposal systems are described:
  - Simple Proposal System: Proposals are text or hash-based, and users can
    vote for or against.
  - Complex Proposal System: Users can vote on multiple proposals
    simultaneously and distribute their votes.
- On-chain calls: Proposals can trigger on-chain calls and make changes to
  the runtime.
