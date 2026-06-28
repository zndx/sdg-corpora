---
chapter_id: ch_live_annotation_classifies_class_95448b
topic_id: 186
family: 02_observation_measurement
cited_terms: ['annotation_classifies_class', 'descriptive_not_retracted', 'measurement_with_precision']
model: engine-refine
---

In governed data environments, every assertion must be anchored to a durable identifier that survives reprocessing, reconciliation, and audit. Identifiers such as CLAS-0001 or RETR-0001 are not display labels; they are the stable handles through which facts, dimensions, and descriptive records remain joinable across time and across systems. When a sensor drift note and an anomaly flag sheet each carry distinct identifiers, downstream controls can cite exactly which artifact supported a decision, retract or supersede a single record without collateral damage, and prove lineage without relying on fragile text matching. The identifier is therefore the first compliance primitive: without it, confidence scores, categories, and roles float free of accountable provenance.

**t_descriptive_not_retracted**

| id | descriptive | descriptive_2 |
| --- | --- | --- |
| RETR-0001 | Sensor Drift Note | Metadata Extension Record |
| RETR-0002 | Anomaly Flag Sheet | Batch Processing Note |
| RETR-0003 | Sensor Drift Note | Calibration Reference Sheet |
| RETR-0004 | Metadata Index Card | Anomaly Classification Code |
| RETR-0005 | Data Quality Memo | Data Quality Metric Card |
| RETR-0006 | Observation Summary | Anomaly Classification Code |

Entities are the subjects those identifiers name—the operational objects whose state the registry is meant to capture. A descriptive record identified as RETR-0001 may simultaneously function as the entity to which typed attributes attach, so that confidence, dimension kind, method, and recorded_at are properties of one governed thing rather than anonymous cells in a flat table. Attributes name what is being said about an entity, while attr type constrains how it may legally be represented and validated. Declaring confidence as xsd:decimal and recorded_at as xsd:dateTime is not cosmetic typing; it routes each assertion into the correct value store, enforces parseability at ingestion, and prevents category errors that would otherwise corrupt analytics and control testing. In practice, the same entity may hold a decimal confidence of 0.736, a varchar dimension kind of “Dimension Kind 01,” and a datetime stamp of 2024-02-12T07:34:36—each value meaningful only because its attr and attr_type were declared before the fact.

**t_descriptive_not_retracted_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RETR-0001 | confidence | xsd:decimal |
| RETR-0002 | dimension_kind | xsd:string |
| RETR-0003 | method | xsd:string |
| RETR-0004 | recorded_at | xsd:dateTime |
| RETR-0005 | uncertainty | xsd:decimal |
| RETR-0006 | unit | xsd:string |
| RETR-0007 | value | xsd:decimal |
| RETR-0008 | encoding | xsd:string |

**t_descriptive_not_retracted_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0004 | 2024-02-12T07:34:36 |
| RETR-0002 | RETR-0002 | RETR-0004 | 2024-08-04T13:26:29 |
| RETR-0003 | RETR-0003 | RETR-0004 | 2024-08-02T08:30:25 |
| RETR-0004 | RETR-0004 | RETR-0004 | 2025-01-21T18:04:20 |
| RETR-0005 | RETR-0005 | RETR-0004 | 2024-03-11T23:18:32 |
| RETR-0006 | RETR-0006 | RETR-0004 | 2024-12-14T04:10:36 |

**t_descriptive_not_retracted_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0001 | 0.736 |
| RETR-0002 | RETR-0001 | RETR-0005 | 273.61 |
| RETR-0003 | RETR-0001 | RETR-0007 | 449.86 |
| RETR-0004 | RETR-0002 | RETR-0001 | 0.217 |
| RETR-0005 | RETR-0002 | RETR-0005 | 724.88 |
| RETR-0006 | RETR-0002 | RETR-0007 | 500.73 |
| RETR-0007 | RETR-0003 | RETR-0001 | 0.920 |
| RETR-0008 | RETR-0003 | RETR-0005 | 966.69 |

**t_descriptive_not_retracted_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0002 | Dimension Kind 01 |
| RETR-0002 | RETR-0001 | RETR-0008 | Encoding 02 |
| RETR-0003 | RETR-0001 | RETR-0009 | intake form |
| RETR-0004 | RETR-0001 | RETR-0010 | es |
| RETR-0005 | RETR-0001 | RETR-0003 | manual |
| RETR-0006 | RETR-0001 | RETR-0006 | ratio |
| RETR-0007 | RETR-0002 | RETR-0002 | Dimension Kind 07 |
| RETR-0008 | RETR-0002 | RETR-0008 | Encoding 08 |

Classification extends description into judgment: to classify is to assert that something falls under a defined concept, usually materialized as a dimension entry with a human-readable label and a coarser category for policy roll-up. A classifies relationship keyed to CLAS-0001 binds an annotation to the dimension row whose label reads “Classifies Label 01” and whose category rolls up to “Classifies Category 01,” giving operators both operational specificity and executive grouping. Category matters because governance rules rarely fire on individual labels; retention schedules, access tiers, and escalation paths are written against categories. Meanwhile, fields that resist neat dimensional keys—numeric magnitudes, free text, timestamps—persist as miscellaneous values whose interpretation depends on surrounding metadata rather than on the value alone. The annotation carrying value 979.94 is legible to compliance only when read beside its classifies target and its quality measures.

**dim_classifies**

| id | classifies_label | classifies_category |
| --- | --- | --- |
| CLAS-0001 | Classifies Label 01 | Classifies Category 01 |
| CLAS-0002 | Classifies Label 02 | Classifies Category 02 |
| CLAS-0003 | Classifies Label 03 | Classifies Category 03 |
| CLAS-0004 | Classifies Label 04 | Classifies Category 04 |
| CLAS-0005 | Classifies Label 05 | Classifies Category 05 |
| CLAS-0006 | Classifies Label 06 | Classifies Category 06 |

Confidence and uncertainty articulate complementary views of assertion quality and must be read together rather than collapsed into a single score. High confidence on a classification—0.845 on a self-referential CLAS-0001 link—signals that the system or curator stands behind the assignment, while a confidence of 0.236 on a link to CLAS-0006 warns reviewers to treat the classification as provisional. Uncertainty, recorded on a different scale (690.59 versus 22.02 on other rows), captures residual doubt or measurement spread that confidence alone may understate; governance workflows should treat low confidence or high uncertainty as triggers for human review, not as reasons to discard the record silently. Storing both fields on the fact layer preserves auditability: a later investigator can see not only what was concluded but how firmly and how noisily that conclusion was held at capture time.

Relational assertions add subject, target, and role when a fact is inherently about a directed association rather than a scalar property. In measurement governance, seismic amplitude and acoustic decibels are subjects of precision linkage, while precision specifications such as ±10 ppm or 1 sigma serve as targets that qualify how those measurements may be interpreted. The role names the capacity in which the target participates relative to the subject—contributor, reviewer, or owner—so that responsibility and authority are explicit rather than inferred from job titles or informal convention. A reviewer role on a precision link is materially different from an owner role: one certifies fitness for use within tolerance, the other carries ongoing accountability for definition and change. Encoding subject, target, and role as first-class fields makes segregation-of-duties tests machine-checkable and gives incident response a precise graph to traverse when a precision standard or measurement definition is later retracted.

**t_measurement_with_precision**

| id | measurement |
| --- | --- |
| PREC-0001 | seismic amplitude |
| PREC-0002 | seismic amplitude |
| PREC-0003 | acoustic decibels |
| PREC-0004 | seismic amplitude |
| PREC-0005 | voltage drop |
| PREC-0006 | GPS accuracy |
| PREC-0007 | barometric pressure |
| PREC-0008 | particulate count |

**t_measurement_with_precision_precision**

| id | precision |
| --- | --- |
| PREC-0001 | ±10 ppm |
| PREC-0002 | 1 sigma |
| PREC-0003 | 10 µs |
| PREC-0004 | 0.001 K |
| PREC-0005 | ±0.2% FS |
| PREC-0006 | 0.1 dB |
| PREC-0007 | 32-bit |
| PREC-0008 | 0.001 K |

**t_measurement_with_precision__precision**

| id | measurement_id | precision_id | role |
| --- | --- | --- | --- |
| PREC-0001 | PREC-0003 | PREC-0008 | contributor |
| PREC-0002 | PREC-0008 | PREC-0007 | reviewer |
| PREC-0003 | PREC-0004 | PREC-0007 | owner |
| PREC-0004 | PREC-0007 | PREC-0001 | reviewer |
| PREC-0005 | PREC-0005 | PREC-0006 | observer |
| PREC-0006 | PREC-0007 | PREC-0007 | reviewer |
| PREC-0007 | PREC-0001 | PREC-0008 | contributor |
| PREC-0008 | PREC-0008 | PREC-0002 | reviewer |

Taken together, these constructs form a layered compliance grammar. Identifiers bind entities; entities carry typed attributes whose values may be numeric, textual, or temporal; classifies edges place entities and facts into categorized concepts; confidence and uncertainty qualify belief; and subject–target–role triples govern relational facts such as measurement precision and stewardship. Operational guides should require each new assertion to populate the minimal set of these fields at creation time, because retrofitting identifiers, types, or roles after an event has already been actioned is precisely when audit trails fracture and regulatory defensibility erodes.

**fact_annotation**

| id | classifies_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CLAS-0001 | CLAS-0001 | 0.845 | 690.59 | 979.94 |
| CLAS-0002 | CLAS-0006 | 0.236 | 593.98 | 370.63 |
| CLAS-0003 | CLAS-0001 | 0.271 | 104.01 | 360.27 |
| CLAS-0004 | CLAS-0002 | 0.303 | 22.02 | 284.47 |
| CLAS-0005 | CLAS-0005 | 0.002 | 328.54 | 25.47 |