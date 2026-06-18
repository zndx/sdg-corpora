# Collection — topic 125 · 04_ebpf_kernel

FinePDFs-grounded topic (carried forward from the coverage audit). **11 chapters** · **22 topics** (target + style) · **3 ontology terms** · **3 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 125: topic 5, topic 8, topic 26, topic 28, topic 40, topic 44, topic 46, topic 62, topic 70, topic 74, topic 76, topic 77, topic 78, topic 82, topic 98, topic 100, topic 108, topic 139, topic 150, topic 155, topic 188.

> **Topic gist** (representative FinePDFs text): On the Eﬀiciency Modelling of Cryptographic Protocols by Means of the Quality of Protection Modelling Language (QoP-ML) Bogdan Ksiezopolski, Damian Rusinek, Adam Wierzbicki To cite this version: Bogdan Ksiezopolski, Damian Rusinek, Adam Wierzbicki. On the Eﬀiciency Modelling of Cryptographic Protocols by Means of the Quality of Protection Modelling Language (QoP-ML). 1st International Conferenc... …

## Chapters

- [Chapter 4: Ontological Constraints in Asset Governance and Provenance](chapters/125fdda0f5db56b4.md)
- [Chapter 5: Relational Mapping of Artifacts, Processes, and Spatial Attributes in Governance Frameworks](chapters/25861e0a6e405d74.md)
- [Laboratory Event Modeling Using OWL-Derived Schemas](chapters/30d621b083cdeb20.md)
- [Chapter 4: Ontological Foundations of Asset Governance and Compliance Verification](chapters/52e498ec1680d9e3.md)
- [Chapter 4: Governance of Physical Artifacts and Addressable Locations in Regulatory Compliance](chapters/539a719ba4a2db5e.md)
- [Chapter 4: Ontological Mapping in Asset Governance and Compliance Verification](chapters/6761e1e1c3805f26.md)
- [Chapter 4: Ontological Mapping of Physical Artifacts and Process Participants in Compliance Auditing](chapters/73ae9dc13266a314.md)
- [Chapter 4: Ontological Mapping of Physical Assets and Custodial Governance](chapters/ae2c0bf8e04fcd3f.md)
- [Chapter 4: Ontological Foundations of Asset Governance and Custodial Verification](chapters/b8eab43b01cf408f.md)
- [Chapter 4: Relational Mapping of Artifact Governance and Addressability](chapters/ca6dc6e775ae3297.md)
- [Laboratory Artifact and Observation Registry](chapters/ede5ba72fe9c043b.md)

## Ontology terms grounding this collection

- `artifact_min_one_owner` — {X} is an artifact
- `observation_with_participant` — {X} is a process that has participant artifact
- `schemaorg_place_address` — {X} is an artifact that has postal address {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_artifact_min_one_owner`](tables/t_artifact_min_one_owner.sql) — realizes `artifact_min_one_owner`
- [`t_observation_with_participant`](tables/t_observation_with_participant.sql) — realizes `observation_with_participant` · _shared with 3 other collection(s)_
- [`t_schemaorg_place_address`](tables/t_schemaorg_place_address.sql) — realizes `schemaorg_place_address` · _shared with 12 other collection(s)_
