---
chapter_id: ch_live_dempster_conflict_mass_951aff
topic_id: 83
family: 07_long_tail
cited_terms: ['dempster_conflict_mass', 'dengue_transmission_process', 'descriptive_either_evidence_or_claim']
model: engine-refine
---

Conflict mass quantifies contested or unresolved material in an operational record—mass that must be attributed, bounded, and reconciled before downstream decisions can be treated as defensible. Each conflict-mass instance carries a stable identifier (for example MASS-0001 through MASS-0004) that joins measured facts to human-readable labels and categorical placement; Conflict Mass Label 03 sits in Conflict Mass Category 03, while Conflict Mass Label 04 maps to Conflict Mass Category 04, so analysts can roll up granular observations without collapsing distinct phenomena into a single undifferentiated bucket. The measured value itself—520.46 for one record, 846.10 for another—expresses magnitude in the misc field of the fact layer, but magnitude alone is insufficient for governance: the same fact row pairs that value with confidence and uncertainty so that reviewers can see not only how large a conflict mass is, but how firmly the system believes the measurement and how wide the credible interval remains. A confidence of 0.728 attached to MASS-0004 signals comparatively strong endorsement of that reading, whereas 0.014 on MASS-0002 marks a finding that should trigger manual review or supplemental corroboration before it influences enforcement thresholds; uncertainty values ranging from 9.49 to 687.80 make the epistemic spread explicit, preventing a low-confidence estimate from being mistaken for a precise one merely because its point value appears numerically modest.

**fact_dempster**

| id | conflict_mass_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MASS-0001 | MASS-0003 | 0.153 | 9.49 | 520.46 |
| MASS-0002 | MASS-0002 | 0.014 | 392.06 | 137.18 |
| MASS-0003 | MASS-0005 | 0.025 | 687.80 | 197.61 |
| MASS-0004 | MASS-0001 | 0.728 | 479.57 | 846.10 |
| MASS-0005 | MASS-0006 | 0.918 | 172.36 | 296.96 |
| MASS-0006 | MASS-0001 | 0.755 | 608.06 | 341.51 |

**dim_conflict_mass**

| id | conflict_mass_label | conflict_mass_category |
| --- | --- | --- |
| MASS-0001 | Conflict Mass Label 01 | Conflict Mass Category 01 |
| MASS-0002 | Conflict Mass Label 02 | Conflict Mass Category 02 |
| MASS-0003 | Conflict Mass Label 03 | Conflict Mass Category 03 |
| MASS-0004 | Conflict Mass Label 04 | Conflict Mass Category 04 |
| MASS-0005 | Conflict Mass Label 05 | Conflict Mass Category 05 |
| MASS-0006 | Conflict Mass Label 06 | Conflict Mass Category 06 |

Host–vector involvement extends the same identifier discipline into relational epidemiology and process surveillance, where events are counted at the intersection of who or what is affected and what agent or pathway transmits risk. Records keyed as PROC-0001 through PROC-0004 tie involves_host and involves_vector foreign keys to dimension tables that supply Involves Host Label 01 and Involves Vector Label 02 alongside parallel category taxonomies (Involves Host Category 03, Involves Vector Category 04, and so on). Event count becomes the operational frequency measure: 444 events where PROC-0002 hosts intersect PROC-0002 vectors, 56 events under another host–vector pairing, 167 and 251 elsewhere—each figure an auditable tally suitable for trend monitoring, outbreak attribution, or compliance sampling plans. Because host and vector identifiers can reference entities outside the immediately visible dimension slice (PROC-0005 as host, PROC-0007 as vector), the model assumes an open registry rather than a closed enumeration, which is why identifier integrity and referential discipline matter as much as the labels displayed to end users.

**fact_dengue**

| id | involves_host_key | involves_vector_key | event_count |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0002 | PROC-0004 | 251 |
| PROC-0002 | PROC-0001 | PROC-0002 | 444 |
| PROC-0003 | PROC-0005 | PROC-0007 | 56 |
| PROC-0004 | PROC-0002 | PROC-0003 | 167 |
| PROC-0005 | PROC-0002 | PROC-0008 | 168 |

**dim_involves_host**

| id | involves_host_label | involves_host_category |
| --- | --- | --- |
| PROC-0001 | Involves Host Label 01 | Involves Host Category 01 |
| PROC-0002 | Involves Host Label 02 | Involves Host Category 02 |
| PROC-0003 | Involves Host Label 03 | Involves Host Category 03 |
| PROC-0004 | Involves Host Label 04 | Involves Host Category 04 |
| PROC-0005 | Involves Host Label 05 | Involves Host Category 05 |
| PROC-0006 | Involves Host Label 06 | Involves Host Category 06 |

**dim_involves_vector**

| id | involves_vector_label | involves_vector_category |
| --- | --- | --- |
| PROC-0001 | Involves Vector Label 01 | Involves Vector Category 01 |
| PROC-0002 | Involves Vector Label 02 | Involves Vector Category 02 |
| PROC-0003 | Involves Vector Label 03 | Involves Vector Category 03 |
| PROC-0004 | Involves Vector Label 04 | Involves Vector Category 04 |
| PROC-0005 | Involves Vector Label 05 | Involves Vector Category 05 |
| PROC-0006 | Involves Vector Label 06 | Involves Vector Category 06 |
| PROC-0007 | Involves Vector Label 07 | Involves Vector Category 07 |
| PROC-0008 | Involves Vector Label 08 | Involves Vector Category 08 |

Descriptive records labeled as evidence or claim provide the documentary substrate on which quantitative facts rest: a pipeline run log paired with a validation rule set, a compliance audit trail annotated by a field condition note, a network latency trace carrying a data quality flag, or a calibration certificate bound to a chain-of-custody tag. Each such record is an entity—CLAI-0001 through CLAI-0004—whose identity persists even as multiple attributes accrue over time. Attributes are not embedded as wide-table columns; they are declared by name and typed constraint. The attr name recorded_at is constrained as xsd:dateTime and therefore lands in a datetime value store (2023-12-14T23:50:57 for one entity, 2025-04-28T22:05:41 for another), while confidence is typed xsd:decimal and stored separately (0.015 on CLAI-0001, 0.355 on CLAI-0002). String-typed attrs such as dimension_kind, method, and their counterparts resolve to varchar values—Dimension Kind 01, Encoding 02, change rationale, es—so that categorical and lexical assertions remain distinguishable from numeric and temporal ones at validation time rather than at report time.

**t_descriptive_either_evidence_or_claim**

| id | descriptive | descriptive_2 | descriptive_3 |
| --- | --- | --- | --- |
| CLAI-0001 | pipeline run log | checksum mismatch alert | validation rule set |
| CLAI-0002 | compliance audit trail | field condition note | validation rule set |
| CLAI-0003 | network latency trace | calibration certificate | chain of custody tag |
| CLAI-0004 | pipeline run log | data quality flag | sampling interval ms |
| CLAI-0005 | data ingestion manifest | retention policy label | retention expiry date |
| CLAI-0006 | compliance audit trail | data quality flag | hash algorithm ID |

**t_descriptive_either_evidence_or_claim_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CLAI-0001 | confidence | xsd:decimal |
| CLAI-0002 | dimension_kind | xsd:string |
| CLAI-0003 | method | xsd:string |
| CLAI-0004 | recorded_at | xsd:dateTime |
| CLAI-0005 | uncertainty | xsd:decimal |
| CLAI-0006 | unit | xsd:string |
| CLAI-0007 | value | xsd:decimal |
| CLAI-0008 | encoding | xsd:string |

**t_descriptive_either_evidence_or_claim_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2023-12-14T23:50:57 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2024-02-16T02:04:00 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2024-04-20T14:09:40 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2025-04-28T22:05:41 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2023-01-08T15:26:20 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2023-08-14T20:31:38 |

**t_descriptive_either_evidence_or_claim_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.015 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 195.73 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 92.51 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.355 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 482.72 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 420.42 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.827 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 514.52 |

**t_descriptive_either_evidence_or_claim_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | change rationale |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | es |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | manual |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | deg_C |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |

Category, in this architecture, is not an attribute hanging directly off every entity; it is the normalization layer that gives controlled vocabulary to dimensions referenced by facts. Conflict Mass Category 01 does not float freely beside a raw measurement—it classifies the dimension row that facts join through conflict_mass_key, just as Involves Host Category 02 classifies the host side of a dengue-process intersection. That separation keeps categories stable when fact tables churn: remeasuring conflict mass or recounting events does not require re-deriving taxonomy strings from scratch. Misc, conversely, is the workhorse value column reused across contexts—conflict-mass magnitudes, dimension labels, typed attribute payloads—whose interpretation is always delegated to the enclosing table role and, for EAV paths, to attr_type. Treating misc as semantically neutral at the column level is a deliberate trade: it maximizes storage uniformity at the cost of demanding rigorous attr_type enforcement and entity–attr pairing at ingest.

In practice, analysts and auditors move along two complementary paths. For star-schema facts, they follow identifiers from measurement to dimension to category, weighing confidence and uncertainty before accepting a value such as 197.61 or 137.18 into a consolidated risk score. For documentary entities, they traverse attr definitions to typed value tables, verifying that every entity_id and attr_id combination respects its declared type and that temporal attrs align with the evidentiary narrative implied by descriptive fields (checksum mismatch alert versus sampling interval ms). Event counts on host–vector edges supply population-scale corroboration: where conflict mass is sparse or low-confidence, repeated PROC-level events may still justify precautionary action, and where conflict mass is high-confidence yet event counts are low, investigators may infer measurement lag or definitional mismatch rather than true absence of activity. Identifier stability across MASS-, PROC-, and CLAI- namespaces is what makes those cross-domain inferences legible; without it, confidence would attach to numbers, categories would attach to labels, and entities would attach to attributes—but nothing could be proven to be the same object from one reporting period to the next.