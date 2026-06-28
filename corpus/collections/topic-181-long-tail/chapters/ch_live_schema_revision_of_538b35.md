---
chapter_id: ch_live_schema_revision_of_538b35
topic_id: 181
family: 07_long_tail
cited_terms: ['schema_revision_of', 'regional_quality_benchmark', 'measurement_aggregated_into']
model: engine-refine
---

In governed data environments, schema evolution is tracked through revision identifiers that anchor every change to a reproducible lineage. A schema revision such as REVI-0001, which documents a network_flow_record definition, may itself be derived from a predecessor like legacy_compliance_log, establishing a chain of provenance that spans multiple revision records. The revision-to-revision relationship is further qualified by a role attribute that designates whether a given revision acts as reviewer, contributor, or owner within the lineage graph. In this model, the subject column identifies the revision being referenced, while the target column points to the revision it derives from or depends upon, creating a directed acyclic structure where REVI-0001 serves as both subject (referencing REVI-0006 as its target) and target (referenced by REVI-0001 itself in a self-referential loop). This role-based attribution ensures accountability: a contributor might author a clinical_trial_protocol revision, while a reviewer validates its alignment with upstream network_flow_record definitions, and an owner assumes stewardship over the final artifact.

**t_schema_revision_of**

| id | schema |
| --- | --- |
| REVI-0001 | network_flow_record |
| REVI-0002 | product_inventory_catalog |
| REVI-0003 | network_flow_record |
| REVI-0004 | clinical_trial_protocol |
| REVI-0005 | financial_ledger_format |
| REVI-0006 | network_flow_record |
| REVI-0007 | api_gateway_routing |
| REVI-0008 | compliance_audit_log |

**t_schema_revision_of_schema_revision_of**

| id | schema_revision_of |
| --- | --- |
| REVI-0001 | legacy_compliance_log |
| REVI-0002 | legacy_compliance_log |
| REVI-0003 | legacy_compliance_log |
| REVI-0004 | legacy_network_record |
| REVI-0005 | legacy_api_gateway |
| REVI-0006 | legacy_api_gateway |

**t_schema_revision_of__schema_revision_of**

| id | schema_id | schema_revision_of_id | role |
| --- | --- | --- | --- |
| REVI-0001 | REVI-0001 | REVI-0006 | reviewer |
| REVI-0002 | REVI-0001 | REVI-0001 | contributor |
| REVI-0003 | REVI-0001 | REVI-0003 | reviewer |
| REVI-0004 | REVI-0007 | REVI-0003 | owner |
| REVI-0005 | REVI-0006 | REVI-0001 | contributor |
| REVI-0006 | REVI-0005 | REVI-0001 | observer |
| REVI-0007 | REVI-0006 | REVI-0004 | owner |
| REVI-0008 | REVI-0007 | REVI-0004 | reviewer |

Measurement data enters the system through fact tables that pair quantitative observations with quality signals. Each measurement carries an identifier—INTO-0001, for instance—alongside a confidence score and an uncertainty value that together characterize the reliability of the recorded figure. A measurement with a confidence of 0.945 and an uncertainty of 279.24 conveys substantially higher assurance than one registering 0.307 confidence against 364.07 uncertainty, even when both report comparable raw values. These paired metrics enable downstream consumers to weight observations appropriately, filtering or down-weighting entries where uncertainty approaches or exceeds the magnitude of the measurement itself. The value column holds the actual observation—660.64 in the high-confidence case, 64.10 in the low-confidence one—while the confidence and uncertainty columns provide the metadata necessary to interpret it.

**fact_regional**

| id | regional_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| BENC-0001 | BENC-0001 | 0.036 | 509.32 | 915.44 |
| BENC-0002 | BENC-0001 | 0.601 | 253.71 | 567.07 |
| BENC-0003 | BENC-0004 | 0.818 | 510.50 | 179.17 |
| BENC-0004 | BENC-0006 | 0.286 | 762.47 | 261.10 |
| BENC-0005 | BENC-0004 | 0.995 | 619.46 | 410.15 |
| BENC-0006 | BENC-0005 | 0.995 | 647.39 | 276.26 |

**fact_measurement**

| id | aggregated_into_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| INTO-0001 | INTO-0005 | 0.496 | 306.26 | 353.34 |
| INTO-0002 | INTO-0005 | 0.945 | 279.24 | 660.64 |
| INTO-0003 | INTO-0004 | 0.506 | 120.70 | 878.99 |
| INTO-0004 | INTO-0006 | 0.307 | 364.07 | 64.10 |
| INTO-0005 | INTO-0006 | 0.923 | 642.96 | 897.70 |

Measurements are organized through an aggregation hierarchy that groups individual observations into broader categories. The aggregated_into dimension assigns each measurement to a parent grouping, identified by keys such as INTO-0005, which collects multiple child measurements (INTO-0001 and INTO-0002) under a single roll-up. Each aggregation category carries a human-readable label and a classification that supports filtering and reporting. Regional data follows an analogous structure: the regional dimension assigns labels like Regional Label 01 and categories such as Regional Category 01 to geographic or logical groupings, while the regional fact table records measurements (BENC-0001, BENC-0004) with their own confidence and uncertainty profiles. A regional measurement keyed to BENC-0001 might carry a confidence of 0.601 and an uncertainty of 253.71, whereas another regional entry at BENC-0004 registers 0.818 confidence with 510.50 uncertainty, illustrating that higher confidence does not necessarily imply lower absolute uncertainty.

**dim_regional**

| id | regional_label | regional_category |
| --- | --- | --- |
| BENC-0001 | Regional Label 01 | Regional Category 01 |
| BENC-0002 | Regional Label 02 | Regional Category 02 |
| BENC-0003 | Regional Label 03 | Regional Category 03 |
| BENC-0004 | Regional Label 04 | Regional Category 04 |
| BENC-0005 | Regional Label 05 | Regional Category 05 |
| BENC-0006 | Regional Label 06 | Regional Category 06 |

**dim_aggregated_into**

| id | aggregated_into_label | aggregated_into_category |
| --- | --- | --- |
| INTO-0001 | Aggregated Into Label 01 | Aggregated Into Category 01 |
| INTO-0002 | Aggregated Into Label 02 | Aggregated Into Category 02 |
| INTO-0003 | Aggregated Into Label 03 | Aggregated Into Category 03 |
| INTO-0004 | Aggregated Into Label 04 | Aggregated Into Category 04 |
| INTO-0005 | Aggregated Into Label 05 | Aggregated Into Category 05 |
| INTO-0006 | Aggregated Into Label 06 | Aggregated Into Category 06 |

The interplay between schema governance and measurement quality forms the backbone of data trust. Schema revisions establish the structural contracts that define what fields exist and how they are typed; measurement facts populate those structures with values qualified by confidence and uncertainty scores; and the aggregation and regional dimensions provide the categorical scaffolding that enables roll-ups, filters, and cross-domain comparisons. When a reviewer validates a clinical_trial_protocol revision, they are implicitly endorsing the schema under which future measurements will be recorded, and those measurements will in turn inherit the quality expectations encoded in their confidence and uncertainty attributes. The system thus creates a closed loop: schema definitions constrain data capture, data quality metrics validate schema fitness, and role-based attribution ensures that every link in the chain—from revision author to measurement recorder to category classifier—can be traced to a responsible party.