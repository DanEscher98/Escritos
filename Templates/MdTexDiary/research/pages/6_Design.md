# Abstract voting model

## Brief lifecycle of a Voting process
Unless specified, all actions not listed in a particular `VotingStatus` are
interpreted as not allowed

1. `=> ProposalTime`:
  - Any `user` can emit a `proposal`
  - `users` can be registered as `voters`
  - When a `voter` is registered, they recives a fixed amount of `tokens`
2. `=> InProgress`:
  - As long as they had enough `tokens`, any `voter` can create or modify a
    `ballot` for a `proposal`. The difference is refunded instantaneously
  - A `voter` can vote for multiple `proposals`
  - A `voter` cannot vote for a `proposal` emitted by themself
  - A `voter` cancels his vote if `amount` is zero
3. `=> Counting`:
  - Any action for `users` is blocked
  - The `amount` of a negative `vote` is redistributed to the rest of `proposals`
  - If there's a tie between `proposals` with same amount of `tokens`, wins
    which has less `ballots`
  - The `amount` of the winning `proposal` is transferred to the `user` who
      proposed it
  - The `amount` of all non-winning `proposals` is returned to their respective
      `voters`
4. `=> Finished`:
  - Anybody can claim their own amount of `tokens`
  - Anybody can know the winning `proposal`


## Global variables and Data structures
```rust
struct Proposal {
  title: String,
  description: String,
  emiter: address,
} // at the end, they should have an associated score

enum Vote {
  Positive(tokens),
  Negative(tokens),
  Canceled
} // amount always will be a squared number

enum VotingStatus {
  ProposalTime,
  InProgress,
  Counting,
  Finished(id_proposal)
}

struct Ballot {
  vote: Vote,
  proposal: Proposal
}

const MAX_PROPOSALS = /* to define */;

let mut voting_status: VotingStatus::InProgress;
let mut voters: HashMap<Address, tokens>;
let mut proposals: <BoundedVec<Proposal>>::new(MAX_PROPOSALS);
let mut ballot_box = <HashMap<Address, Vec<Ballot>>>::new();
```

## Pseudo-coded for actions
```rust
/// Any user can emit a proposal
fn emit_proposal(address, proposal) {
  // write: proposals
  ensure!(/* address is valid user */);
  ensure!(/* proposals is not full */);
}

fn register_voter(address) {
  // write: voters[address]
}

/// Only way voters have
fn emit_vote(address, id_proposal, vote) {
  // reads: voters
  // modify: voters[address]
  // modify: ballot_box
}

/// When triggered, count votes and Finish the voting
fn count_voting() -> id_proposal {
  // reads: ballot_box
  // write: voters (refund or reward)
  // modify: voting status
}

/// Voters can recover his tokens to his wallet
fn claim_tokens(address) {
  // drain: voters[address]
  ensure!(/* user is the emiter of proposal */);
  ensure!(/* voting is Finished */);
  // transfer proposal amount to user
}
```
