---
chapter_id: ch_live_claim_governed_by_directive_a11247
topic_id: 40
family: 06_belief_structure
cited_terms: ['claim_governed_by_directive', 'claim_min_one_evidence', 'claim_not_disconfirmed']
model: engine-refine
---

Claims within the governance framework are anchored by unique identifiers—`DIRE-0001` through `DIRE-0004` for directive-governed assertions, `EVID-0001` through `EVID-0004` for evidence-bearing claims, and `DISC-0001` through `DISC-0004` for claims not disconfirmed—each serving as the primary key across a family of attribute-value tables. A claim such as "Waste disposal compliant" or "Latency within bounds" is not stored as a monolithic statement; rather, it is decomposed into a set of typed attributes, each with its own identifier and semantic type. The attribute schema is defined in a dedicated registry: `confidence` carries type `xsd:decimal`, `dimension_kind` and `method` are `xsd:string`, and `recorded_at` is `xsd:dateTime`. This separation of attribute definition from attribute value enables a flexible, extensible model where new properties can be introduced without schema migration.

**t_claim_governed_by_directive**

| id | claim |
| --- | --- |
| DIRE-0001 | Waste disposal compliant |
| DIRE-0002 | repository checksum mismatch |
| DIRE-0003 | Certificate chain valid |
| DIRE-0004 | thermal monitoring active |
| DIRE-0005 | Ocean acidity increased 0.3 |
| DIRE-0006 | Data lineage verified |
| DIRE-0007 | Deforestation rate doubled |
| DIRE-0008 | Microplastics in Arctic ice |

**t_claim_governed_by_directive_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIRE-0001 | confidence | xsd:decimal |
| DIRE-0002 | dimension_kind | xsd:string |
| DIRE-0003 | method | xsd:string |
| DIRE-0004 | recorded_at | xsd:dateTime |
| DIRE-0005 | uncertainty | xsd:decimal |
| DIRE-0006 | unit | xsd:string |
| DIRE-0007 | value | xsd:decimal |
| DIRE-0008 | encoding | xsd:string |

**t_claim_governed_by_directive_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0004 | 2025-05-26T03:20:10 |
| DIRE-0002 | DIRE-0002 | DIRE-0004 | 2024-09-09T11:00:31 |
| DIRE-0003 | DIRE-0003 | DIRE-0004 | 2023-10-05T17:19:44 |
| DIRE-0004 | DIRE-0004 | DIRE-0004 | 2023-08-28T07:17:18 |
| DIRE-0005 | DIRE-0005 | DIRE-0004 | 2023-09-24T23:34:03 |
| DIRE-0006 | DIRE-0006 | DIRE-0004 | 2025-02-15T08:57:16 |
| DIRE-0007 | DIRE-0007 | DIRE-0004 | 2025-03-19T03:02:46 |
| DIRE-0008 | DIRE-0008 | DIRE-0004 | 2023-07-28T10:43:49 |

**t_claim_governed_by_directive_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0001 | 0.133 |
| DIRE-0002 | DIRE-0001 | DIRE-0005 | 628.22 |
| DIRE-0003 | DIRE-0001 | DIRE-0007 | 405.89 |
| DIRE-0004 | DIRE-0002 | DIRE-0001 | 0.222 |
| DIRE-0005 | DIRE-0002 | DIRE-0005 | 369.68 |
| DIRE-0006 | DIRE-0002 | DIRE-0007 | 150.76 |
| DIRE-0007 | DIRE-0003 | DIRE-0001 | 0.686 |
| DIRE-0008 | DIRE-0003 | DIRE-0005 | 548.91 |

**t_claim_min_one_evidence**

| id | claim |
| --- | --- |
| EVID-0001 | Latency within bounds |
| EVID-0002 | network path rerouted |
| EVID-0003 | Sampling frequency adequate |
| EVID-0004 | Mercury threshold exceeded |
| EVID-0005 | firmware version outdated |
| EVID-0006 | Microplastics in Arctic ice |
| EVID-0007 | latency under SLA bounds |

**t_claim_min_one_evidence_supported_by_evidence**

| id | supported_by_evidence |
| --- | --- |
| EVID-0001 | Lancet longitudinal cohort study |
| EVID-0002 | Lancet longitudinal cohort study |
| EVID-0003 | ICES marine ecosystem index |
| EVID-0004 | WHO mortality surveillance Q3 |
| EVID-0005 | WHO mortality surveillance Q3 |
| EVID-0006 | EPA ambient monitor 7B |
| EVID-0007 | IPCC AR6 synthesis report |
| EVID-0008 | ICES marine ecosystem index |

**t_claim_not_disconfirmed**

| id | claim | claim_2 |
| --- | --- | --- |
| DISC-0001 | Waste disposal compliant | Sampling frequency adequate |
| DISC-0002 | checksum validation queued | Access policy enforced |
| DISC-0003 | Sampling frequency adequate | Emission limits met |
| DISC-0004 | temperature sensor offline | PII masking confirmed |
| DISC-0005 | Sampling frequency adequate | Certificate chain valid |
| DISC-0006 | Latency within bounds | access log anomaly detected |
| DISC-0007 | Glacier mass loss accelerating | Certificate chain valid |

**t_claim_not_disconfirmed_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DISC-0001 | confidence | xsd:decimal |
| DISC-0002 | dimension_kind | xsd:string |
| DISC-0003 | method | xsd:string |
| DISC-0004 | recorded_at | xsd:dateTime |
| DISC-0005 | uncertainty | xsd:decimal |
| DISC-0006 | unit | xsd:string |
| DISC-0007 | value | xsd:decimal |
| DISC-0008 | encoding | xsd:string |

**t_claim_not_disconfirmed_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DISC-0001 | DISC-0001 | DISC-0004 | 2023-08-09T14:45:08 |
| DISC-0002 | DISC-0002 | DISC-0004 | 2023-07-14T01:11:42 |
| DISC-0003 | DISC-0003 | DISC-0004 | 2023-07-27T10:01:23 |
| DISC-0004 | DISC-0004 | DISC-0004 | 2024-07-11T23:49:48 |
| DISC-0005 | DISC-0005 | DISC-0004 | 2024-06-18T23:43:54 |
| DISC-0006 | DISC-0006 | DISC-0004 | 2023-11-25T07:03:11 |
| DISC-0007 | DISC-0007 | DISC-0004 | 2025-06-11T19:52:01 |

**t_claim_not_disconfirmed_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DISC-0001 | DISC-0001 | DISC-0001 | 0.145 |
| DISC-0002 | DISC-0001 | DISC-0005 | 669.01 |
| DISC-0003 | DISC-0001 | DISC-0007 | 65.74 |
| DISC-0004 | DISC-0002 | DISC-0001 | 0.678 |
| DISC-0005 | DISC-0002 | DISC-0005 | 525.06 |
| DISC-0006 | DISC-0002 | DISC-0007 | 361.13 |
| DISC-0007 | DISC-0003 | DISC-0001 | 0.813 |
| DISC-0008 | DISC-0003 | DISC-0005 | 578.57 |

Attribute values are materialized across three value tables, partitioned by their `attr_type`. Decimal-valued attributes—such as `confidence`—are stored in the decimal valuation table, where an entity identified as `DIRE-0001` may carry a confidence of `0.133` or `628.22` depending on the attribute reference (`DIRE-0001`, `DIRE-0005`, `DIRE-0007`). String-valued attributes reside in the varchar valuation table: the same entity `DIRE-0001` might have `dimension_kind` set to "Dimension Kind 01", `method` to "Encoding 02", or a free-text field to "audit excerpt". Datetime attributes are captured in the datetime valuation table, recording timestamps such as `2025-05-26T03:20:10` or `2023-08-09T14:45:08` against the `recorded_at` attribute. The `entity_id` column in each value table establishes the foreign-key link back to the claim or directive, while `attr_id` resolves to the attribute definition, forming a normalized entity–attribute–value triad.

The evidence relationship layer introduces a subject–target–role triad that models how claims reference and depend upon one another. In the junction table `t_claim_min_one_evidence__supported_by_evidence`, the `claim_id` column designates the subject—the claim being supported—while `supported_by_evidence_id` designates the target—the evidence claim providing support. The `role` column qualifies the nature of this dependency: a target may act as a `contributor`, `reviewer`, or `owner` of the subject claim. For instance, claim `EVID-0004` ("Mercury threshold exceeded") is supported by `EVID-0002` in the role of `contributor`, while claim `EVID-0007` is supported by both `EVID-0004` (as `owner`) and `EVID-0005` (as `contributor`). This role-based relationship model allows the framework to distinguish between evidence that merely informs a claim and evidence that formally owns or reviews it.

**t_claim_min_one_evidence__supported_by_evidence**

| id | claim_id | supported_by_evidence_id | role |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0004 | EVID-0002 | contributor |
| EVID-0002 | EVID-0003 | EVID-0007 | reviewer |
| EVID-0003 | EVID-0007 | EVID-0004 | owner |
| EVID-0004 | EVID-0007 | EVID-0005 | contributor |
| EVID-0005 | EVID-0005 | EVID-0004 | reviewer |
| EVID-0006 | EVID-0004 | EVID-0005 | reviewer |
| EVID-0007 | EVID-0007 | EVID-0003 | reviewer |
| EVID-0008 | EVID-0004 | EVID-0004 | owner |

Cross-table consistency is maintained through the `id` columns, which serve as the universal identifier namespace within each table. The `t_claim_governed_by_directive` table holds the base claims—such as "repository checksum mismatch" or "thermal monitoring active"—and each row's `id` becomes the `entity_id` in the corresponding value tables and the `attr_id` in the attribute definition table. Similarly, the `t_claim_not_disconfirmed` table captures claims that have survived scrutiny, with entries like "checksum validation queued" or "PII masking confirmed", and its `id` values (`DISC-0001` through `DISC-0004`) are reused as entity identifiers in the not-disconfirmed attribute valuation tables. The `claim_2` column in this table provides a secondary claim reference, enabling pairwise relationships between disconfirmed and non-disconfirmed assertions—for example, linking "Waste disposal compliant" to "Sampling frequency adequate" under identifier `DISC-0001`.

**t_claim_governed_by_directive_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0002 | Dimension Kind 01 |
| DIRE-0002 | DIRE-0001 | DIRE-0008 | Encoding 02 |
| DIRE-0003 | DIRE-0001 | DIRE-0009 | audit excerpt |
| DIRE-0004 | DIRE-0001 | DIRE-0010 | en |
| DIRE-0005 | DIRE-0001 | DIRE-0003 | manual |
| DIRE-0006 | DIRE-0001 | DIRE-0006 | mg/L |
| DIRE-0007 | DIRE-0002 | DIRE-0002 | Dimension Kind 07 |
| DIRE-0008 | DIRE-0002 | DIRE-0008 | Encoding 08 |

**t_claim_not_disconfirmed_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DISC-0001 | DISC-0001 | DISC-0002 | Dimension Kind 01 |
| DISC-0002 | DISC-0001 | DISC-0008 | Encoding 02 |
| DISC-0003 | DISC-0001 | DISC-0009 | intake form |
| DISC-0004 | DISC-0001 | DISC-0010 | ja |
| DISC-0005 | DISC-0001 | DISC-0003 | hybrid |
| DISC-0006 | DISC-0001 | DISC-0006 | mg/L |
| DISC-0007 | DISC-0002 | DISC-0002 | Dimension Kind 07 |
| DISC-0008 | DISC-0002 | DISC-0008 | Encoding 08 |