# Unicity Infrastructure: the Aggregation Layer
# (The Unicity Bluepaper)

Tech report on the Aggregation Layer of the Unicity Network: the
component that records spent token-state identifiers in a sharded Sparse
Merkle Tree (SMT) and produces inclusion and non-inclusion proofs.
The paper details the security model, identifies the single property
that needs to be cryptographically enforced per round
(*prior-state preservation*), and reports the design and measured
performance of a Plonky3 AIR implementation that proves it.

## Download

- Latest PDF:
  [aggregation-layer.pdf](https://github.com/unicitynetwork/aggr-layer-paper/releases/download/latest/aggregation-layer.pdf)
- Source repository:
  [github.com/unicitynetwork/aggr-layer-paper](https://github.com/unicitynetwork/aggr-layer-paper/)

## Abstract

Unicity is a novel blockchain protocol with the ambitious goal of
enabling token transactions to occur off-chain and, when necessary,
offline. This premise requires supporting infrastructure to guarantee
that there are no parallel states of assets, or more specifically, that
there is no double-spending; a property we term the *unicity*. It turns
out that the lack of globally shared state and ordering reduces the
blockchain overhead considerably. In designing this infrastructure, no
compromises were made regarding its trust assumptions. This paper
details the design of the Aggregation Layer, the component responsible
for producing Proofs of Inclusion and Non-inclusion to the users. We
analyze its design for efficiency and evaluate the robustness of its
trust and security model. We then identify a single critical property
that the Consensus Layer must verify on each round&mdash;*prior-state
preservation*&mdash;and observe that the remaining desirable properties
of the trustless key-value store (canonical tree shape, batch
incorporation, no phantom inserts, completeness) are not required by
the Unicity Aggregator's security model. This optimal statement is
implemented as an Algebraic Intermediate Representation (AIR) circuit
on top of the Plonky3 STARK toolkit. The implementation sustains a
proving throughput in excess of 10&thinsp;000 insertions per second on
a single consumer-class CPU, with a succinct proof and tens of
milliseconds verification time, and no trusted setup.

## Related Papers

- [Unicity Whitepaper](https://github.com/unicitynetwork/whitepaper) &mdash;
  protocol overview, tokenomics, and network architecture.
- [Unicity Execution Model](https://github.com/unicitynetwork/execution-model-tex) &mdash;
  off-chain transaction execution, service-side and user-wallet privacy
  model. Companion to this paper.
- [rsmt-air](https://github.com/ristik/rsmt-air) &mdash; reference
  implementation of the Plonky3 AIR proving Aggregation Layer
  consistency, including the `rsmt-bench` performance harness and the
  adversarial tamper tests cited in Section 8.
- [nd-smt](https://github.com/unicitynetwork/nd-smt) &mdash; earlier
  CIRCOM/Groth16 experiment on non-deletion proofs (Section 6 in the
  paper).
- [zkvm-ndsmt](https://github.com/unicitynetwork/zkvm-ndsmt) &mdash;
  SP1 zkVM-based consistency proof (Section 7 in the paper).
