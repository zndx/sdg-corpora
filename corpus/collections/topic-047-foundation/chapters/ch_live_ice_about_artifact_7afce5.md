---
chapter_id: ch_live_ice_about_artifact_7afce5
topic_id: 47
family: 01_foundation
cited_terms: ['ice_about_artifact', 'ice_exactly_one_subject', 'ice_subclass_with_part']
model: engine-refine
---

In governed information-exchange environments, stable identifiers anchor every assertion that must survive audit, reconciliation, and cross-system handoff. An identifier such as ARTI-0001 or SUBJ-0002 is not merely a surrogate key for storage convenience; it is the durable handle by which an entity is cited in lineage graphs, policy checks, and downstream transforms long after the human-readable surface form of the record has changed. Entities—Compliance-Audit-Log, Provenance Graph Export, sensor_calibration_record—therefore exist as first-class participants in the model: each is a bounded object of discourse whose properties may be asserted, compared, and validated independently of the container in which those properties happen to be serialized. When ARTI-0001 carries language es and label_text calibration record while ARTI-0002 carries Encoding 04 under the same attribute family, the identifier pair preserves the distinction even though both artifacts may later be grouped under shared operational classes.

**t_ice_about_artifact**

| id | ice |
| --- | --- |
| ARTI-0001 | Compliance-Audit-Log |
| ARTI-0002 | Supply-Chain-Declaration |
| ARTI-0003 | Calibration-Certificate-2024 |
| ARTI-0004 | Calibration-Certificate-2024 |
| ARTI-0005 | Design-Specification-Draft |
| ARTI-0006 | Validation-Protocol-7B |

Attributes name the dimensions along which entity state is expressed, and attr type constrains how those dimensions may legally be populated. The recurrence of encoding, label_text, and language across artifact and subject registries signals a deliberate separation between schema declaration and instance data: encoding and label_text are not ad hoc columns invented per message type but reusable semantic slots whose interpretation is fixed by governance. Declaring each as xsd:string does not trivialize the typing decision; it commits validators to lexical comparison, pattern matching, and controlled-vocabulary substitution rather than to numeric or temporal algebra. In practice, attr functions as the contract surface—what may be said—while attr type records the interpretive machinery—how what is said must be read.

The misc dimension, realized as stored lexical values, is where governance meets operational fact. Values such as Encoding 01, Encoding 04, fr, and nightly summary are evidence tokens: they are small on disk but heavy in compliance meaning because they bind an entity to a specific encoding regime, locale, or human-facing caption at a point in time. The pattern in which entity_id ARTI-0001 references attr_id ARTI-0001, ARTI-0002, and ARTI-0003 with distinct misc payloads illustrates normalized attribution—one entity, many named properties, each value keyed for independent amendment and audit. Conversely, when observatory_metadata is given inline as unicode with label_text pre-release note, the same conceptual triple appears without the indirection layer, which is appropriate where cardinality is fixed and the cost of join-resolved provenance outweighs the flexibility of extensible attribute rows.

Encoding and labeltext deserve distinct treatment because they answer different enforcement questions even when both serialize as strings. Encoding, whether recorded as ascii, unicode, or a coded token such as Encoding 01, governs byte-level and character-set fidelity across pipelines that must not silently transliterate identifiers, checksums, or legally significant punctuation. Labeltext—intake form, calibration record, nightly summary—governs human comprehension and UI consistency; it is the sanctioned caption under which an operator or auditor recognizes the entity without parsing its internal ice designation. A single business object may therefore carry both a machine encoding key and a labeltext that diverges from its technical name, as when event_stream_format is labeled calibration record while remaining distinct from sensor_calibration_record at the identifier level.

The coexistence of parallel representation styles in one corpus is itself instructive. Artifact and subject families that externalize attributes through attr registries and misc value tables support evolution: new attributes can be introduced, typed, and backfilled without rewriting entity headers. Subclass-with-part records that embed encoding and labeltext directly optimize retrieval for stable, low-cardinality part definitions such as model_feature_catalog with ascii encoding and nightly summary labeling. Mature operations typically migrate along that spectrum as cardinality and audit granularity increase. Duplicate ice labels—Calibration-Certificate-2024 appearing under distinct identifiers, or Provenance Graph Export paired with different related anchors—do not collapse the model precisely because identifiers, not display strings, remain authoritative; related fields such as Primary Data Source and Message Type Definition disambiguate what a shared ice name would otherwise obscure.

**t_ice_about_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | encoding | xsd:string |
| ARTI-0002 | label_text | xsd:string |
| ARTI-0003 | language | xsd:string |

**t_ice_about_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | Encoding 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0002 | calibration record |
| ARTI-0003 | ARTI-0001 | ARTI-0003 | es |
| ARTI-0004 | ARTI-0002 | ARTI-0001 | Encoding 04 |
| ARTI-0005 | ARTI-0002 | ARTI-0002 | calibration record |
| ARTI-0006 | ARTI-0002 | ARTI-0003 | de |
| ARTI-0007 | ARTI-0003 | ARTI-0001 | Encoding 07 |
| ARTI-0008 | ARTI-0003 | ARTI-0002 | nightly summary |

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

**t_ice_subclass_with_part**

| id | ice | encoding | label_text |
| --- | --- | --- | --- |
| PART-0001 | sensor_calibration_record | ascii | intake form |
| PART-0002 | observatory_metadata | unicode | pre-release note |
| PART-0003 | event_stream_format | unicode | calibration record |
| PART-0004 | model_feature_catalog | ascii | nightly summary |
| PART-0005 | compliance_audit_report | utf8 | pre-release note |
| PART-0006 | customer_transaction_log | latin1 | audit excerpt |

Taken together, identifier, entity, attr, attr type, encoding, labeltext, and misc form a layered evidentiary grammar. Identifiers stabilize reference; entities delimit what is being described; attrs and attr types declare which statements are admissible and how they must be interpreted; encoding and labeltext partition machine legibility from human legibility; misc supplies the grounded literals that make abstract slots auditable. Systems that honor this separation can replay decisions, detect drift between coded encodings and declared charsets, and prove that a Supply-Chain-Declaration or Raw Observation Feed was labeled, localized, and serialized under the same typed assertions at submission time as at review—without collapsing heterogeneous records into a single undifferentiated string bag.