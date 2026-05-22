# Unicity Infrastructure: the Aggregation Layer (Unicity Bluepaper)

Technical report on the Aggregation Layer of the Unicity Network: the
component that records spent token-state identifiers in a sharded Sparse
Merkle Tree (SMT) and produces Unicity Proofs: inclusion and non-inclusion proofs.
The paper details the security model, identifies the properties needed for 
trustless operation
(*prior-state preservation*), and reports the design and measured
performance of a Plonky3 AIR implementation that proves it in Zero Knowledge.

This paper is also referred to as the **Unicity Bluepaper**.

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

## Unicity Paper Map

- [Unicity Whitepaper](https://github.com/unicitynetwork/whitepaper)
  ([PDF](https://github.com/unicitynetwork/whitepaper/releases/download/latest/Unicity.pdf)) -
  protocol overview, tokenomics, and network architecture.
- [Unicity Yellowpaper](https://github.com/unicitynetwork/unicity-yellowpaper-tex)
  ([PDF](https://github.com/unicitynetwork/unicity-yellowpaper-tex/releases/download/latest/unicity-yellowpaper.pdf)) -
  low-level protocol specification, including consensus-layer engineering
  details, data availability, and aggregation shard operation.
- [Unicity Infrastructure: the Aggregation Layer / Unicity Bluepaper](https://github.com/unicitynetwork/aggr-layer-paper)
  ([PDF](https://github.com/unicitynetwork/aggr-layer-paper/releases/download/latest/aggregation-layer.pdf)) -
  aggregation-layer design, sharded SMT commitments, inclusion and
  non-inclusion proofs, and the ZK consistency proof model.
- [Unicity Execution Layer](https://github.com/unicitynetwork/execution-model-tex)
  ([PDF](https://github.com/unicitynetwork/execution-model-tex/releases/download/latest/unicity-execution-layer.pdf)) -
  off-chain transaction execution, service-side privacy, user-wallet
  privacy, and formal security proofs.
- [Unicity: Predicates and Atomic Swaps](https://github.com/unicitynetwork/unicity-predicates-tex)
  ([PDF](https://github.com/unicitynetwork/unicity-predicates-tex/releases/download/latest/unicity-predicates.pdf)) -
  programmable spending conditions and trustless atomic swaps on top of
  the execution layer.

## Related Implementations

- [rsmt-air](https://github.com/ristik/rsmt-air) &mdash; reference
  implementation of the Plonky3 AIR proving Aggregation Layer
  consistency, including the `rsmt-bench` performance harness and the
  adversarial tamper tests cited in Section 8.
- [nd-smt](https://github.com/unicitynetwork/nd-smt) &mdash; earlier
  CIRCOM/Groth16 experiment on non-deletion proofs (Section 6 in the
  paper).
- [zkvm-ndsmt](https://github.com/unicitynetwork/zkvm-ndsmt) &mdash;
  SP1 zkVM-based consistency proof (Section 7 in the paper), integrated
  to the [research implementation](https://github.com/ristik/rugregator)
  of the Unicity Aggregator.
