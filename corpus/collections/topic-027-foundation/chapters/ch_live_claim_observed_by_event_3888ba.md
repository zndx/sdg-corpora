---
chapter_id: ch_live_claim_observed_by_event_3888ba
topic_id: 27
family: 07_long_tail
cited_terms: ['claim_observed_by_event', 'subclass_to_directive_ice', 'labrun_with_protocol']
model: engine-refine
---

The provenance of any analytical observation rests on a structured chain of identifiers that anchor claims to their evidentiary basis. Each assertion is assigned a unique identifier—EVEN-0001 through EVEN-0004 in the claim registry—serving as the immutable key by which the claim is referenced across all downstream tables. The claim itself carries a categorical classification, such as Claim Category 01 or Claim Category 02, and a human-readable label like Claim Label 01, which together provide the semantic context necessary for audit and review. These categorical dimensions are not merely organizational; they determine which validation rules, confidence thresholds, and uncertainty tolerances apply when the claim is evaluated against observed data.

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

**dim_claim**

| id | claim_label | claim_category |
| --- | --- | --- |
| EVEN-0001 | Claim Label 01 | Claim Category 01 |
| EVEN-0002 | Claim Label 02 | Claim Category 02 |
| EVEN-0003 | Claim Label 03 | Claim Category 03 |
| EVEN-0004 | Claim Label 04 | Claim Category 04 |
| EVEN-0005 | Claim Label 05 | Claim Category 05 |
| EVEN-0006 | Claim Label 06 | Claim Category 06 |

Confidence and uncertainty form the dual metrics by which the reliability of each claim is quantified. Confidence scores—0.621, 0.596, 0.338, 0.364 across the EVEN series—express the degree of belief in the claim's validity, while uncertainty values—ranging from 43.01 to 571.46—capture the magnitude of potential deviation. These paired measures are stored alongside a miscellaneous value field that holds the claim's asserted quantity, whether 164.54 or 173.58, enabling direct comparison between what is claimed and what is observed. The inverse relationship between confidence and uncertainty is not guaranteed; a claim with moderate confidence of 0.364 may carry an uncertainty of 296.86, reflecting a domain where low belief does not necessarily imply high variance, but rather a different class of epistemic risk.

Attribute definitions and their typed values constitute the observational backbone against which claims are tested. The attribute registry assigns a name—duration_seconds, end_time, exit_code, host_name—to each measured dimension and binds it to an XSD type: xsd:decimal, xsd:dateTime, xsd:integer, xsd:string. This type discipline ensures that values are stored and compared in their semantically appropriate form. A duration of 301.25 or 4042.33 is preserved as a decimal; an exit code of 497 or 538 as an integer; a host name such as node-b14 as a string; and a timestamp like 2023-11-19T15:13:31 as a dateTime. The entity column in each value table identifies the subject to which the attribute belongs—PROT-0001, PROT-0002—creating a star-like schema where a single entity can accumulate heterogeneous attributes across multiple typed value tables without schema modification.

**t_labrun_with_protocol_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PROT-0001 | duration_seconds | xsd:decimal |
| PROT-0002 | end_time | xsd:dateTime |
| PROT-0003 | exit_code | xsd:integer |
| PROT-0004 | host_name | xsd:string |
| PROT-0005 | log_level | xsd:string |
| PROT-0006 | phase | xsd:string |
| PROT-0007 | retry_count | xsd:integer |
| PROT-0008 | scheduled_at | xsd:dateTime |

**t_labrun_with_protocol_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0002 | 2023-11-19T15:13:31 |
| PROT-0002 | PROT-0001 | PROT-0008 | 2023-04-19T03:43:36 |
| PROT-0003 | PROT-0001 | PROT-0009 | 2023-06-05T09:50:58 |
| PROT-0004 | PROT-0002 | PROT-0002 | 2023-12-21T19:08:32 |
| PROT-0005 | PROT-0002 | PROT-0008 | 2023-06-26T20:13:34 |
| PROT-0006 | PROT-0002 | PROT-0009 | 2023-11-18T07:40:33 |
| PROT-0007 | PROT-0003 | PROT-0002 | 2024-09-05T03:02:45 |
| PROT-0008 | PROT-0003 | PROT-0008 | 2024-06-07T02:35:38 |

**t_labrun_with_protocol_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0001 | 301.25 |
| PROT-0002 | PROT-0002 | PROT-0001 | 4042.33 |
| PROT-0003 | PROT-0003 | PROT-0001 | 6125.88 |
| PROT-0004 | PROT-0004 | PROT-0001 | 1565.69 |
| PROT-0005 | PROT-0005 | PROT-0001 | 1033.06 |
| PROT-0006 | PROT-0006 | PROT-0001 | 3134.56 |

**t_labrun_with_protocol_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0003 | 497 |
| PROT-0002 | PROT-0001 | PROT-0007 | 434 |
| PROT-0003 | PROT-0002 | PROT-0003 | 538 |
| PROT-0004 | PROT-0002 | PROT-0007 | 309 |
| PROT-0005 | PROT-0003 | PROT-0003 | 513 |
| PROT-0006 | PROT-0003 | PROT-0007 | 375 |
| PROT-0007 | PROT-0004 | PROT-0003 | 355 |
| PROT-0008 | PROT-0004 | PROT-0007 | 171 |

**t_labrun_with_protocol_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0004 | node-b14 |
| PROT-0002 | PROT-0001 | PROT-0005 | Log Level 02 |
| PROT-0003 | PROT-0001 | PROT-0006 | closeout |
| PROT-0004 | PROT-0001 | PROT-0010 | running |
| PROT-0005 | PROT-0001 | PROT-0011 | Triggered By 05 |
| PROT-0006 | PROT-0002 | PROT-0004 | worker-07 |
| PROT-0007 | PROT-0002 | PROT-0005 | Log Level 07 |
| PROT-0008 | PROT-0002 | PROT-0006 | review |

The linkage between laboratory runs and their governing protocols introduces a second layer of structured provenance. A lab run such as MassSpec_LC_MS or Nanopore_FC_Nine is associated with a specific protocol—Microbiome_QIIME2_Pipe, SingleCell_Gelbead10x, MassSpec_QTOF_Cal—forming a many-to-many relationship that captures the operational context of each measurement. This relationship is not merely documentary; it determines which attributes are expected, which validation rules apply, and which claims are relevant. The attribute definitions in the attribute registry are shared across all lab-run-to-protocol associations, enabling cross-protocol comparison of duration, exit codes, and host environments while preserving the protocol-specific semantics of each run.

**t_labrun_with_protocol**

| id | labrun | follows_protocol |
| --- | --- | --- |
| PROT-0001 | MassSpec_LC_MS | Microbiome_QIIME2_Pipe |
| PROT-0002 | Nanopore_FC_Nine | SingleCell_Gelbead10x |
| PROT-0003 | Nanopore_FC_Nine | MassSpec_QTOF_Cal |
| PROT-0004 | MassSpec_LC_MS | FlowCytometry_Panel7 |
| PROT-0005 | Microbiome_16S_Seq | Nanopore_Basecall_v2 |
| PROT-0006 | Proteomics_ICP_MS | PCR_ColdStart |

Directive encoding and label text provide the policy layer that governs how data is produced and documented. Directives such as ProvenanceTraceRequirement, EncryptionStandard, and CalibrationInstruction are mapped to subclasses and annotated with an encoding—ascii or unicode—and a label text such as intake form, calibration record, or nightly summary. These annotations determine the character set in which directive content is rendered and the document type to which the directive applies. The encoding choice is not trivial: ascii suffices for standard directive text, while unicode is required for calibration records and nightly summaries that may contain non-ASCII characters. The label text, in turn, identifies the artifact that carries the directive's instructions, creating a traceable link from policy to production artifact.

**t_subclass_to_directive_ice**

| id | directive | encoding | label_text |
| --- | --- | --- | --- |
| ICE-0001 | ProvenanceTraceRequirement | ascii | intake form |
| ICE-0002 | EncryptionStandard | ascii | calibration record |
| ICE-0003 | CalibrationInstruction | unicode | nightly summary |
| ICE-0004 | CalibrationInstruction | unicode | intake form |
| ICE-0005 | BatchIngestionRule | ascii | nightly summary |