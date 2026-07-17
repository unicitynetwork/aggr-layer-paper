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

Unicity is a novel blockchain protocol with the ambitious goal of enabling peer-to-peer token transactions to occur off-chain, without shared ordering and execution overhead. This premise requires supporting infrastructure to guarantee that there are no parallel states of assets, or more specifically, that there is no double-spending; a property we term the *unicity*. It turns out that the lack of globally shared state and ordering reduces the blockchain overhead considerably. In designing this infrastructure, no compromises were made regarding its trust assumptions. This paper details the design of the Aggregation Layer, the component responsible for producing Proofs of Inclusion and Non-inclusion to the users. We analyze its design for efficiency and evaluate the robustness of its trust and security model, and design optimal data structures and algorithms for this setup. We then identify the critical property that the Consensus Layer must verify on each round---*append-only consistency*, combining prior-state preservation with coherent placement of insertions---give it a formal definition, and prove that the RSMT consistency proof enforces it over the entire certified history, assuming only collision resistance of the hash function. The structural core of this statement is implemented as Algebraic Intermediate Representation (AIR) circuit on top of the Plonky3 STARK toolkit. The implementation sustains a proving throughput in excess of 10 000 insertions per second on a single consumer-class CPU, with a succinct proof and tens of milliseconds verification time, and no trusted setup. Finally, we describe how the per-round proofs of all shards, together with the Consensus Layer's state transitions, are folded into a single recursively aggregated STARK: a fixed-size certificate of the correctness of the system's entire operating history, verifiable against the genesis configuration alone, without trusting the validator set.

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

- [rsmt-air](https://github.com/ristik/rsmt-air) -- reference
  implementation of the Plonky3 AIR proving Aggregation Layer
  consistency, including the `rsmt-bench` performance harness and the
  adversarial tamper tests.
- [ndsmt-experiments](https://github.com/ristik/ndsmt-experiments) --
  prototyping and benchmarking of different RSMT implementation options
- [research implementation](https://github.com/ristik/rugregator)
  of the Unicity Aggregator.
