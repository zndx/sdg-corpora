---
chapter_id: ch_live_instrument_only_emits_type_1012df
topic_id: 0
family: 01_foundation
cited_terms: ['instrument_only_emits_type', 'claim_observed_by_event', 'iso27001_annexa_subclass']
model: engine-refine
---

The governance of technical assets and the evaluation of assertions both depend upon a shared vocabulary of identifiers, classifications, and confidence measures. Every instrument, claim, and standard control is anchored by a unique identifier—TYPE-0001 through TYPE-0004 for emitting devices, EVEN-0001 through EVEN-0004 for claims, and ANNE-0001 through ANNE-0004 for ISO annex mappings—ensuring that each entity can be traced across operational and compliance contexts without ambiguity. These identifiers serve as the primary keys that bind together disparate dimensions: the instrument name and its emitted signal, the claim label and its associated category, the ISO standard and its corresponding annex-a control. Without such stable references, the reconciliation of operational telemetry against compliance frameworks would collapse into an unresolvable tangle of aliases and duplicates.

**t_instrument_only_emits_type**

| id | instrument | emits_signal | created_date | size_bytes |
| --- | --- | --- | --- | --- |
| TYPE-0001 | Seismograph | Acoustic echo | 2024-12-01 | 370347470 |
| TYPE-0002 | Ion chamber | Ultrasound pulse | 2023-12-08 | 631989835 |
| TYPE-0003 | Acoustic transducer | Infrared radiation | 2023-01-25 | 565520223 |
| TYPE-0004 | Ion chamber | Telemetry stream | 2024-07-30 | 541950157 |
| TYPE-0005 | Spectrometer | RF pulse | 2024-06-22 | 83957422 |
| TYPE-0006 | Magnetometer | Acoustic echo | 2024-05-04 | 105995168 |
| TYPE-0007 | Particle detector | Ultrasound pulse | 2024-10-26 | 587447986 |

**dim_claim**

| id | claim_label | claim_category |
| --- | --- | --- |
| EVEN-0001 | Claim Label 01 | Claim Category 01 |
| EVEN-0002 | Claim Label 02 | Claim Category 02 |
| EVEN-0003 | Claim Label 03 | Claim Category 03 |
| EVEN-0004 | Claim Label 04 | Claim Category 04 |
| EVEN-0005 | Claim Label 05 | Claim Category 05 |
| EVEN-0006 | Claim Label 06 | Claim Category 06 |

**t_iso27001_annexa_subclass**

| id | iso |
| --- | --- |
| ANNE-0001 | ISO/IEC 27001 |
| ANNE-0002 | ISO/IEC 27001 |
| ANNE-0003 | ISO/IEC 27701 |
| ANNE-0004 | ISO 20000-1 |
| ANNE-0005 | ISO/IEC 27701 |
| ANNE-0006 | ISO 20000-1 |

**t_iso27001_annexa_subclass_iso27001_annex_a**

| id | iso27001_annex_a |
| --- | --- |
| ANNE-0001 | A.5.22 Cloud security |
| ANNE-0002 | A.5.7 Threat intelligence |
| ANNE-0003 | A.6.3 Remote working |
| ANNE-0004 | A.8.12 Data masking |
| ANNE-0005 | A.7.4 Physical security monitoring |
| ANNE-0006 | A.5.30 Incident response |
| ANNE-0007 | A.8.22 Data leakage prevention |

Claims are the central artifacts of an evidence-based governance model, each carrying a categorical classification, a confidence score, and an uncertainty bound that together quantify the reliability of the assertion. A claim such as EVEN-0002, classified under Claim Category 02, may be asserted with a confidence of 0.621 and an uncertainty of 571.46, while a separate claim EVEN-0003, belonging to Claim Category 03, carries a markedly lower confidence of 0.338 and an uncertainty of 142.53. The confidence values—ranging from 0.338 to 0.621 across the observed set—represent the degree of belief in the claim's validity, whereas the uncertainty metric, expressed in absolute units such as 43.01 or 296.86, captures the dispersion or margin of error surrounding the associated value. These paired measures enable downstream consumers to weight claims appropriately in risk assessments, audit trails, and automated decision pipelines.

**fact_claim**

| id | claim_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| EVEN-0001 | EVEN-0002 | 0.621 | 571.46 | 164.54 |
| EVEN-0002 | EVEN-0002 | 0.596 | 43.01 | 173.58 |
| EVEN-0003 | EVEN-0006 | 0.338 | 142.53 | 166.95 |
| EVEN-0004 | EVEN-0002 | 0.364 | 296.86 | 152.06 |
| EVEN-0005 | EVEN-0001 | 0.316 | 715.93 | 997.16 |
| EVEN-0006 | EVEN-0006 | 0.410 | 701.36 | 614.41 |
| EVEN-0007 | EVEN-0003 | 0.162 | 133.33 | 142.05 |

The categorical taxonomy of claims provides the structural scaffolding upon which compliance reporting and operational monitoring are built. Each claim is assigned a label—Claim Label 01 through Claim Label 04—and a category—Claim Category 01 through Claim Category 04—that together form a two-level hierarchy suitable for aggregation and drill-down analysis. This classification scheme allows auditors to group claims by domain, such as security controls or data handling practices, and to compute aggregate confidence and uncertainty statistics across categories. The separation of label from category ensures that human-readable identifiers remain decoupled from machine-processable groupings, supporting both narrative reporting and programmatic filtering.

Operational assets, specifically instruments that emit signals, are tracked with a parallel set of metadata that includes creation dates and storage footprints. A seismograph emitting an acoustic echo was registered on 2024-12-01 and occupies 370,347,470 bytes of storage, whereas an ion chamber producing an ultrasound pulse, created on 2023-12-08, requires 631,989,835 bytes. These size metrics, ranging from approximately 541 MB to 631 MB across the observed instruments, are critical for capacity planning, data retention policies, and cost allocation. The creation dates—spanning from January 2023 through December 2024—provide a temporal axis for trend analysis, enabling operators to correlate instrument deployment cycles with changes in signal types, such as infrared radiation or telemetry streams.

The relationship between ISO/IEC standards and their annex-a controls is mediated through a junction structure that assigns roles to each linkage. An ISO standard such as ISO/IEC 27001, identified as ANNE-0001, may be linked to an annex-a control like A.5.22 Cloud security, with the relationship itself carrying a role designation—observer, reviewer, or owner—that specifies the nature of the association. In one observed configuration, ANNE-0001 serves as the subject linked to target ANNE-0003 with the role of observer, while ANNE-0002 assumes the role of reviewer against target ANNE-0007. This role-based relationship model enables fine-grained accountability: the owner of a control relationship bears primary responsibility, the reviewer provides independent validation, and the observer maintains awareness without direct authority. The standards themselves span multiple frameworks—ISO/IEC 27001, ISO/IEC 27701, and ISO 20000-1—each contributing distinct annex-a controls such as A.5.7 Threat intelligence, A.6.3 Remote working, and A.8.12 Data masking to the compliance ontology.

**t_iso27001_annexa_subclass__iso27001_annex_a**

| id | iso_id | iso27001_annex_a_id | role |
| --- | --- | --- | --- |
| ANNE-0001 | ANNE-0003 | ANNE-0001 | observer |
| ANNE-0002 | ANNE-0001 | ANNE-0004 | reviewer |
| ANNE-0003 | ANNE-0002 | ANNE-0007 | owner |
| ANNE-0004 | ANNE-0001 | ANNE-0003 | observer |
| ANNE-0005 | ANNE-0003 | ANNE-0007 | observer |
| ANNE-0006 | ANNE-0004 | ANNE-0005 | contributor |
| ANNE-0007 | ANNE-0003 | ANNE-0001 | reviewer |
| ANNE-0008 | ANNE-0006 | ANNE-0006 | reviewer |