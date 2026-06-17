# Collection — topic 88 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **12 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): Activation of the Nrf2/HO-1 signaling pathway contributes to the protective effects of baicalein against oxidative stress-induced DNA damage and apoptosis in HEI193 Schwann cells Jae Yeob Jeong¹#, Hee-Jae Cha²#, Eun Ok Choi³, Cheol Hong Kim¹, Gi-Young Kim⁴, Young Hyun Yoo⁵, Hye-Jin Hwang⁶, Hwan Tae Park⁷✉, Hyun Min Yoon¹, Yung Hyun Choi³✉ 1. Department of Acupuncture and Moxibustion, Dongeui Uni.. …

## Chapters

- [Chapter 4: Structural Governance of Attestation and Control Mechanisms](chapters/07f1e5efc2cbde0b.md)
- [Chapter 4: Governance Directives and Evidence Integrity](chapters/173a4405588a220d.md)
- [Chapter 4: Formalization of Attestation and Control Verification Mechanisms](chapters/3d0492611a7bd8e6.md)
- [Chapter 4: Governance Directives and Evidence Verification Protocols](chapters/3d4daad924068168.md)
- [Chapter 4: Ontological Structures in Governance Compliance](chapters/47124292e3a75172.md)
- [Chapter 4: Governance Frameworks and Attestation Protocols](chapters/4f93d4f993a9686b.md)
- [Directive Governance in Pension Scheme Compliance](chapters/5a6ca82ddfc2385d.md)
- [Chapter 7: Formal Ontology of Governance Directives and Attestation Mechanisms](chapters/62cdd27393f2afd6.md)
- [Chapter 7: Directive Governance and Attestation Mechanisms](chapters/860c82bc7a1a2790.md)
- [Chapter 4: Directive Governance Patterns in Regulatory Attestations](chapters/8a2efc7d11d7c205.md)
- [Chapter 4: Governance Structures and Attestation Protocols in Compliance Frameworks](chapters/d0f95843b1518dbe.md)
- [Directive Governance in Institutional Compliance](chapters/da9be18ef204edf0.md)

## Ontology terms grounding this collection

- `attestation_at_period` — {X} is a process that at attestation period {Y}
- `attestation_signed_by` — {X} is a process that signed by person
- `attestation_with_supporting_evidence` — {X} is a process that with supporting evidence {Y}
- `control_with_evidence_requirement` — {X} is a directive information content entity that requires evidence {Y}
- `requirement_equiv_specifies_target` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:specifies some {Y:Class}) and (sdg:appliesTo some {Z:Class})

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_at_period`](tables/t_attestation_at_period.sql) — realizes `attestation_at_period`
- [`t_attestation_signed_by`](tables/t_attestation_signed_by.sql) — realizes `attestation_signed_by`
- [`t_attestation_with_supporting_evidence`](tables/t_attestation_with_supporting_evidence.sql) — realizes `attestation_with_supporting_evidence`
- [`t_control_with_evidence_requirement`](tables/t_control_with_evidence_requirement.sql) — realizes `control_with_evidence_requirement`
- [`t_requirement_equiv_specifies_target`](tables/t_requirement_equiv_specifies_target.sql) — realizes `requirement_equiv_specifies_target`
