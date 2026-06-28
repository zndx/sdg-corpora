---
chapter_id: ch_live_ice_exactly_one_subject_262cf0
topic_id: 35
family: 01_foundation
cited_terms: ['ice_exactly_one_subject', 'outlier_detection_produces_claim', 'agent_basic']
model: engine-refine
---

Autonomous agents in governed data environments are not anonymous executors; each is a versioned, measurable participant whose footprint must be reconciled against declared outputs and subject-level metadata. In operational practice, an agent is identified through a stable key that may diverge from its catalog identifier—AGEN-0004 appears twice in execution facts while referencing agent_key AGEN-0003 and AGEN-0004 respectively—so lineage depends on joining execution telemetry to dimensional records rather than assuming identifier equality. Dimensional classification assigns each agent a label and category (Agent Label 03 under Agent Category 03, for example), while fact records capture material scale and revision: size_bytes ranges from 20,883,723 to 548,859,900 across four observations, and version spans 1 through 12, signaling that compliance review must treat artifact bulk and software generation as co-equal evidence of what ran, not merely what was scheduled.

**dim_produces_category**

| id | category_name |
| --- | --- |
| CLAI-0001 | Category Name 01 |
| CLAI-0002 | Category Name 02 |
| CLAI-0003 | Category Name 03 |
| CLAI-0004 | Category Name 04 |
| CLAI-0005 | Category Name 05 |
| CLAI-0006 | Category Name 06 |

**fact_agent**

| id | agent_key | size_bytes | version |
| --- | --- | --- | --- |
| AGEN-0001 | AGEN-0005 | 211345771 | 7 |
| AGEN-0002 | AGEN-0003 | 458577289 | 1 |
| AGEN-0003 | AGEN-0004 | 548859900 | 1 |
| AGEN-0004 | AGEN-0004 | 20883723 | 12 |
| AGEN-0005 | AGEN-0006 | 490849751 | 11 |

**dim_agent**

| id | agent_label | agent_category |
| --- | --- | --- |
| AGEN-0001 | Agent Label 01 | Agent Category 01 |
| AGEN-0002 | Agent Label 02 | Agent Category 02 |
| AGEN-0003 | Agent Label 03 | Agent Category 03 |
| AGEN-0004 | Agent Label 04 | Agent Category 04 |
| AGEN-0005 | Agent Label 05 | Agent Category 05 |
| AGEN-0006 | Agent Label 06 | Agent Category 06 |

What an agent produces is equally contractual. The produces dimension names each output (Produces Label 01 through Produces Label 04) and binds it to a category both by name and by foreign key—CLAI-0001 carries category_id CLAI-0004 while its produces_category string reads Produces Category 01, a deliberate separation that allows taxonomy refinement without rewriting historical labels. Category names in the reference dimension (Category Name 01–04) supply the controlled vocabulary against which downstream anomaly detection and access policy are applied. Outlier facts then attach runtime behavior to specific produces keys: CLAI-0001 is associated with durations of 5,282.09 s and 1,182.39 s, exit codes 490 and 124, and retry counts of 101 and 308, whereas CLAI-0004 records 3,360.34 s, exit 760, and 293 retries—patterns that matter because duration_seconds quantifies wall-clock cost, exit encodes termination semantics beyond simple success/failure, and retry_count exposes instability that size_bytes alone cannot explain.

**fact_outlier**

| id | produces_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| CLAI-0001 | CLAI-0004 | 3360.34 | 760 | 293 |
| CLAI-0002 | CLAI-0006 | 6466.78 | 4 | 225 |
| CLAI-0003 | CLAI-0001 | 5282.09 | 490 | 101 |
| CLAI-0004 | CLAI-0001 | 1182.39 | 124 | 308 |
| CLAI-0005 | CLAI-0002 | 3041.72 | 808 | 59 |
| CLAI-0006 | CLAI-0001 | 3852.38 | 619 | 489 |
| CLAI-0007 | CLAI-0004 | 1453.07 | 682 | 1 |

Subject governance sits upstream of agent execution and is anchored on identifiers that enforce exactly-one-subject constraints. SUBJ-0001 through SUBJ-0004 denote ice subjects—Calibration Manifest, Provenance Graph Export (listed twice at the subject level), and Raw Observation Feed—each related to a definitional counterpart such as Measurement Timeframe, Message Type Definition, Quality Check Script, or Primary Data Source. Attributes on those subjects are not free text; they are declared by name and typed. encoding, label_text, and language are all attr records constrained to xsd:string, which obligates validators to reject numerics, booleans, or locale-ambiguous blobs at ingress. The entity identifier on value rows ties miscellaneous literals back to the subject instance that owns them: SUBJ-0001 holds Encoding 01 for encoding, nightly summary for label_text, and fr for language, while SUBJ-0002 contributes Encoding 04 under the same encoding attribute id—demonstrating that entity scopes attribute values and that shared attribute definitions can serve multiple entities without collapsing their evidentiary separation.

**t_ice_exactly_one_subject**

| id | ice | related |
| --- | --- | --- |
| SUBJ-0001 | Calibration Manifest | Measurement Timeframe |
| SUBJ-0002 | Provenance Graph Export | Message Type Definition |
| SUBJ-0003 | Raw Observation Feed | Quality Check Script |
| SUBJ-0004 | Provenance Graph Export | Primary Data Source |
| SUBJ-0005 | Schema Registry Entry | Primary Data Source |
| SUBJ-0006 | Audit Trail Report | Primary Data Source |
| SUBJ-0007 | Schema Registry Entry | Field Survey Zone |
| SUBJ-0008 | Sensor Configuration File | Data Governance Board |

**t_ice_exactly_one_subject_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUBJ-0001 | encoding | xsd:string |
| SUBJ-0002 | label_text | xsd:string |
| SUBJ-0003 | language | xsd:string |

**t_ice_exactly_one_subject_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0001 | Encoding 01 |
| SUBJ-0002 | SUBJ-0001 | SUBJ-0002 | nightly summary |
| SUBJ-0003 | SUBJ-0001 | SUBJ-0003 | fr |
| SUBJ-0004 | SUBJ-0002 | SUBJ-0001 | Encoding 04 |
| SUBJ-0005 | SUBJ-0002 | SUBJ-0002 | intake form |
| SUBJ-0006 | SUBJ-0002 | SUBJ-0003 | de |
| SUBJ-0007 | SUBJ-0003 | SUBJ-0001 | Encoding 07 |
| SUBJ-0008 | SUBJ-0003 | SUBJ-0002 | intake form |

Miscellaneous fields—misc in the schema sense—are therefore not semantically vacant; they carry the human-interpretable payload that identifiers and types alone cannot supply. Produces labels, agent labels, and varchar values are the audit-facing surface: an examiner reads nightly summary or fr alongside machine keys. Identifier discipline across tables (SUBJ-*, CLAI-*, AGEN-*) is what makes those misc strings admissible in a chain of custody; without keyed joins, Encoding 01 and Encoding 04 would be indistinguishable prose. In review workflows, attr_type governs permissible transformations—string-typed language values may be normalized to ISO codes but must not be coerced into enumerations absent a migration—and entity_id ensures that a value change on SUBJ-0002 cannot be attributed to SUBJ-0001’s calibration manifest.

**dim_produces**

| id | produces_label | produces_category | category_id |
| --- | --- | --- | --- |
| CLAI-0001 | Produces Label 01 | Produces Category 01 | CLAI-0004 |
| CLAI-0002 | Produces Label 02 | Produces Category 02 | CLAI-0002 |
| CLAI-0003 | Produces Label 03 | Produces Category 03 | CLAI-0006 |
| CLAI-0004 | Produces Label 04 | Produces Category 04 | CLAI-0002 |
| CLAI-0005 | Produces Label 05 | Produces Category 05 | CLAI-0005 |
| CLAI-0006 | Produces Label 06 | Produces Category 06 | CLAI-0001 |

Operational assurance closes the loop when agent facts, produces dimensions, and subject attributes are evaluated together. High retry_count paired with non-zero exit codes (225 retries with exit 4 on CLAI-0006; 308 retries with exit 124 on a CLAI-0001 run) indicates processes that eventually terminated but consumed retry budget, a condition distinct from a single long run at 6,466.78 s with exit 4. Large size_bytes on an agent execution (458,577,289 or 548,859,900) demands correlation with produces category: CLAI-0002 and CLAI-0006 both map to category_id CLAI-0002, suggesting shared handling rules even when labels differ. Category, in this architecture, is thus the bridge from descriptive misc fields to enforceable policy classes—agents and outputs classified alike—while duration_seconds, exit, retry_count, and size_bytes furnish the quantitative basis on which stewards decide whether observed behavior conforms to the attributed, typed, entity-scoped subjects the pipeline claims to honor.