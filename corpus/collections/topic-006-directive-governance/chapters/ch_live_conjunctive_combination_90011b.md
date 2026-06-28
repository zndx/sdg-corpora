---
chapter_id: ch_live_conjunctive_combination_90011b
topic_id: 6
family: 07_long_tail
cited_terms: ['conjunctive_combination', 'schemaorg_event_location', 'attestation_with_supporting_evidence']
model: engine-refine
---

Attributes and their typed values constitute the foundational mechanism by which event locations acquire descriptive properties within the provenance framework. The attribute schema defines named characteristics—checksum, created_date, identifier, and license—each bound to a specific type that governs its representation: `xsd:string` for textual identifiers such as `c0ffee42` and `ref-8842`, `xsd:date` for temporal markers like `2024-05-14` and `2023-06-13`, and `cco:DesignativeICE` for designative constructs. These typed attributes are materialized through a value-dispatch architecture that partitions entries by data domain: integer-valued attributes (400, 6, 223) reside in dedicated integer stores, date-valued attributes in temporal tables, and string-valued attributes in variable-character repositories. The entity column anchors each value to its owning object—`LOCA-0001` may simultaneously carry the checksum `c0ffee42`, the license `Apache-2.0`, and the integer metric `400`—ensuring that multi-attribute records remain traceable to their source entity without ambiguity.

**t_schemaorg_event_location**

| id | schemaorg | event_location |
| --- | --- | --- |
| LOCA-0001 | audit-log-archive | EVID-0001 |
| LOCA-0002 | data-lake-ingestion-job | EVID-0001 |
| LOCA-0003 | provenance-trace-record | EVID-0006 |
| LOCA-0004 | provenance-trace-record | EVID-0003 |
| LOCA-0005 | field-observation-dataset | EVID-0006 |
| LOCA-0006 | governance-policy-update | EVID-0006 |
| LOCA-0007 | lab-sample-tracker | EVID-0003 |
| LOCA-0008 | field-observation-dataset | EVID-0006 |

**t_schemaorg_event_location_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LOCA-0001 | checksum | xsd:string |
| LOCA-0002 | created_date | xsd:date |
| LOCA-0003 | identifier | cco:DesignativeICE |
| LOCA-0004 | license | xsd:string |
| LOCA-0005 | mime_type | xsd:string |
| LOCA-0006 | size_bytes | xsd:long |
| LOCA-0007 | uri | xsd:string |
| LOCA-0008 | version | xsd:integer |

**t_schemaorg_event_location_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LOCA-0001 | LOCA-0001 | LOCA-0002 | 2024-05-14 |
| LOCA-0002 | LOCA-0002 | LOCA-0002 | 2024-02-21 |
| LOCA-0003 | LOCA-0003 | LOCA-0002 | 2023-06-13 |
| LOCA-0004 | LOCA-0004 | LOCA-0002 | 2023-08-21 |
| LOCA-0005 | LOCA-0005 | LOCA-0002 | 2025-03-20 |
| LOCA-0006 | LOCA-0006 | LOCA-0002 | 2025-01-04 |
| LOCA-0007 | LOCA-0007 | LOCA-0002 | 2023-08-21 |
| LOCA-0008 | LOCA-0008 | LOCA-0002 | 2025-03-26 |

**t_schemaorg_event_location_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LOCA-0001 | LOCA-0001 | LOCA-0006 | 400 |
| LOCA-0002 | LOCA-0001 | LOCA-0008 | 6 |
| LOCA-0003 | LOCA-0002 | LOCA-0006 | 223 |
| LOCA-0004 | LOCA-0002 | LOCA-0008 | 6 |
| LOCA-0005 | LOCA-0003 | LOCA-0006 | 283 |
| LOCA-0006 | LOCA-0003 | LOCA-0008 | 2 |
| LOCA-0007 | LOCA-0004 | LOCA-0006 | 450 |
| LOCA-0008 | LOCA-0004 | LOCA-0008 | 8 |

**t_schemaorg_event_location_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LOCA-0001 | LOCA-0001 | LOCA-0001 | c0ffee42 |
| LOCA-0002 | LOCA-0001 | LOCA-0003 | ref-8842 |
| LOCA-0003 | LOCA-0001 | LOCA-0004 | Apache-2.0 |
| LOCA-0004 | LOCA-0001 | LOCA-0009 | ap-south-2 |
| LOCA-0005 | LOCA-0001 | LOCA-0005 | application/json |
| LOCA-0006 | LOCA-0001 | LOCA-0010 | Name 06 |
| LOCA-0007 | LOCA-0001 | LOCA-0011 | analytics |
| LOCA-0008 | LOCA-0001 | LOCA-0012 | Tags 08 |

Categories and labels provide the organizational taxonomy that classifies conjunctively combines entries, enabling structured grouping and retrieval. The dimension table assigns each identifier—`COMB-0001` through `COMB-0004`—a human-readable label such as `Conjunctively Combines Label 01` and a categorical designation like `Conjunctively Combines Category 01`, establishing a two-tier classification scheme. This categorical metadata is not merely descriptive; it governs how conjunctive combinations are resolved during provenance queries, as the category field serves as the primary join key when aggregating evidence across multiple attestation records. The identifier column, consistently formatted with the `COMB-` prefix, functions as the stable primary key that persists across schema migrations and remains the canonical reference point for all foreign-key relationships.

**dim_conjunctively_combines**

| id | conjunctively_combines_label | conjunctively_combines_category |
| --- | --- | --- |
| COMB-0001 | Conjunctively Combines Label 01 | Conjunctively Combines Category 01 |
| COMB-0002 | Conjunctively Combines Label 02 | Conjunctively Combines Category 02 |
| COMB-0003 | Conjunctively Combines Label 03 | Conjunctively Combines Category 03 |
| COMB-0004 | Conjunctively Combines Label 04 | Conjunctively Combines Category 04 |
| COMB-0005 | Conjunctively Combines Label 05 | Conjunctively Combines Category 05 |
| COMB-0006 | Conjunctively Combines Label 06 | Conjunctively Combines Category 06 |

Confidence and uncertainty metrics quantify the reliability of conjunctive combination evaluations, providing decision-makers with calibrated measures of evidentiary strength. The fact table records confidence scores ranging from `0.045` to `0.799`, where values near unity indicate high-certainty conjunctions and values approaching zero signal weak or contradictory evidence. Paired with these are uncertainty values—`666.33`, `736.08`, `785.73`, `898.42`—that express the absolute variance associated with each combination, enabling downstream systems to apply threshold-based filtering or to weight results in aggregation pipelines. The value column, containing numeric measures such as `598.69` and `980.44`, represents the computed result of the conjunctive operation itself, while the `conjunctively_combines_key` column establishes the recursive relationship by pointing to the identifier of the combined entity, thereby forming a self-referential graph that captures hierarchical evidence composition.

**fact_conjunctive**

| id | conjunctively_combines_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| COMB-0001 | COMB-0004 | 0.738 | 736.08 | 793.45 |
| COMB-0002 | COMB-0004 | 0.045 | 898.42 | 791.51 |
| COMB-0003 | COMB-0006 | 0.764 | 666.33 | 598.69 |
| COMB-0004 | COMB-0003 | 0.799 | 785.73 | 980.44 |
| COMB-0005 | COMB-0006 | 0.312 | 470.05 | 427.17 |
| COMB-0006 | COMB-0003 | 0.643 | 227.57 | 137.91 |
| COMB-0007 | COMB-0004 | 0.630 | 30.12 | 467.22 |

The attestation lifecycle is governed by phase and triggeredby columns that encode both the temporal stage and the activation mechanism of each compliance review. Four distinct phases—`initiation`, `execution`, `review`, and `closeout`—map the progression of attestations such as the `SOC2 Compliance Review` (`EVID-0001`) or the `Patient Consent Declaration` (`EVID-0003`) through their operational lifecycle. The triggeredby column distinguishes between `event`-driven attestations, which arise from system-level occurrences, and `api`-driven attestations, which are invoked programmatically; this distinction is critical for audit trails, as event-triggered records require different provenance validation than their API-triggered counterparts. Each attestation references supporting evidence through the `with_supporting_evidence` column, which points to location identifiers (`LOCA-0006`, `LOCA-0007`, `LOCA-0008`), creating a bidirectional linkage between the attestation record and the underlying evidence artifacts it validates.

**t_attestation_with_supporting_evidence**

| id | attestation | with_supporting_evidence | phase | triggered_by |
| --- | --- | --- | --- | --- |
| EVID-0001 | SOC2 Compliance Review | LOCA-0007 | initiation | event |
| EVID-0002 | Data Provenance Statement | LOCA-0006 | execution | event |
| EVID-0003 | Patient Consent Declaration | LOCA-0007 | review | api |
| EVID-0004 | Data Provenance Statement | LOCA-0008 | closeout | api |
| EVID-0005 | Sensor Calibration Record | LOCA-0001 | initiation | manual |
| EVID-0006 | Sensor Calibration Record | LOCA-0003 | execution | schedule |