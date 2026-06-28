---
chapter_id: ch_live_descriptive_not_retracted_31c393
topic_id: 138
family: 07_long_tail
cited_terms: ['descriptive_not_retracted', 'descriptive_only_about_artifact', 'designative_for_specific_role']
model: engine-refine
---

In governed descriptive and designative registries, stable identifiers anchor every assertion to a durable referent that survives relabeling, reclassification, and downstream integration. A record keyed as RETR-0001 denotes a particular descriptive artifact—here, a Sensor Drift Note—whose identity persists even when subsidiary labels such as Metadata Extension Record or Calibration Reference Sheet attach to sibling records RETR-0002 through RETR-0004. The same principle extends to analytic and role-oriented namespaces: ARTI-0001 through ARTI-0004 name dimension members and fact rows, while ROLE-0001 through ROLE-0004 name designative bindings between operational names (Sensor-Array-Beta, Batch-Alpha-99) and the standards or partitions they identify (Calibration-Standard-ISO, Quality-Control-Log). Identifier discipline matters because compliance, audit, and reconciliation all depend on joining observations across time without collapsing distinct objects or reusing keys for different meanings.

**t_descriptive_not_retracted**

| id | descriptive | descriptive_2 |
| --- | --- | --- |
| RETR-0001 | Sensor Drift Note | Metadata Extension Record |
| RETR-0002 | Anomaly Flag Sheet | Batch Processing Note |
| RETR-0003 | Sensor Drift Note | Calibration Reference Sheet |
| RETR-0004 | Metadata Index Card | Anomaly Classification Code |
| RETR-0005 | Data Quality Memo | Data Quality Metric Card |
| RETR-0006 | Observation Summary | Anomaly Classification Code |

An entity is the object of description—the unit to which attributes are asserted—while an attr names the property being recorded and attr type declares how that property must be interpreted, stored, and validated. For the RETR corpus, attr registrations pair confidence with xsd:decimal, dimension_kind and method with xsd:string, and recorded_at with xsd:dateTime, establishing a typed contract before any value is accepted. Typed value stores then honor that contract: decimals hold quantities such as 0.736 and 273.61, varchar rows carry lexical material including Dimension Kind 01 and Encoding 02, and datetime rows preserve instants like 2024-02-12T07:34:36 and 2025-01-21T18:04:20. Separating entity, attr, and attr type prevents silent coercion—dates parsed as strings, categories mistaken for measurements—and keeps lineage explicit when the same entity_id (for example RETR-0001) accumulates heterogeneous assertions across multiple attr_id references.

The misc designation marks payload fields whose semantics are context-dependent rather than fixed by the governing schema: human-readable labels (About Label 02), short codes (D-33, B-12), free-text descriptors (intake form), locale tags (es), and measured or computed numerics parked outside a dedicated confidence or uncertainty column. Misc is not an absence of governance; it signals that interpretation requires accompanying metadata—category, encoding, role, or attr type—to disambiguate. Encoding makes that dependence concrete for designative records: ROLE-0001 and ROLE-0004 specify ascii, whereas ROLE-0002 and ROLE-0003 specify unicode, determining how code values and identifying strings are serialized, compared, and exchanged without normalization errors at system boundaries.

**fact_descriptive**

| id | about_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| ARTI-0001 | ARTI-0005 | 0.854 | 452.69 | 646.43 |
| ARTI-0002 | ARTI-0002 | 0.209 | 846.52 | 408.39 |
| ARTI-0003 | ARTI-0002 | 0.761 | 532.60 | 850.50 |
| ARTI-0004 | ARTI-0004 | 0.480 | 663.65 | 110.19 |
| ARTI-0005 | ARTI-0006 | 0.697 | 535.73 | 322.53 |
| ARTI-0006 | ARTI-0003 | 0.238 | 734.71 | 457.41 |

**dim_about**

| id | about_label | about_category |
| --- | --- | --- |
| ARTI-0001 | About Label 01 | About Category 01 |
| ARTI-0002 | About Label 02 | About Category 02 |
| ARTI-0003 | About Label 03 | About Category 03 |
| ARTI-0004 | About Label 04 | About Category 04 |
| ARTI-0005 | About Label 05 | About Category 05 |
| ARTI-0006 | About Label 06 | About Category 06 |

**t_designative_for_specific_role**

| id | designative | identifies | code | encoding |
| --- | --- | --- | --- | --- |
| ROLE-0001 | Sensor-Array-Beta | Calibration-Standard-ISO | D-33 | ascii |
| ROLE-0002 | Unit-Shift-Log | Network-Edge-Router | B-12 | unicode |
| ROLE-0003 | CoreSample-X22 | Data-Lake-Partition | E-21 | unicode |
| ROLE-0004 | Batch-Alpha-99 | Quality-Control-Log | A-01 | ascii |
| ROLE-0005 | CoreSample-X22 | Bioreactor-Module-B | D-33 | latin1 |
| ROLE-0006 | LIDAR-Array-7 | Data-Lake-Partition | C-07 | ascii |
| ROLE-0007 | LIDAR-Array-7 | Quality-Control-Log | D-33 | ascii |
| ROLE-0008 | LIDAR-Array-7 | Geolocation-Map-Grid | A-01 | latin1 |

Category supplies the taxonomic frame within which about references become operationally meaningful. In dim_about, each about key (ARTI-0001–ARTI-0004) pairs an about_label with an about_category (About Category 01 through About Category 04), turning a bare identifier into a governed class that controls permissible attributes, retention rules, and reporting rollups. Category therefore mediates between identifier-level precision and portfolio-level compliance: two facts may share identical numeric shapes yet diverge in treatment because their about keys resolve to different categories. About itself is the directed subject of a fact—what the assertion is “about”—as seen where fact_descriptive rows point about_key to ARTI-0005, ARTI-0002, or ARTI-0004 rather than to themselves, decoupling the stating record (ARTI-0001–ARTI-0004) from the described entity.

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

Confidence and uncertainty articulate complementary views of epistemic and metrological status and should be read together, not as redundant scalars. Attribute-level confidence on RETR-0001 is recorded as 0.736, while a separate fact row may carry confidence 0.854 with uncertainty 452.69 about ARTI-0005; elsewhere, confidence 0.209 pairs with uncertainty 846.52, and confidence 0.761 with 532.60, illustrating that high confidence does not imply low uncertainty, nor vice versa. In practice, confidence typically encodes adjudicated belief in a classification, match, or inference, whereas uncertainty quantifies dispersion, tolerance, or unresolved variance in the underlying measurement or model; governance frameworks require both because risk decisions depend on knowing whether a value is trusted and how wide the defensible bounds remain. Publishing them on facts tied to about keys ensures that downstream consumers inherit not only value 646.43 or 850.50 but also the qualified reliability posture needed for thresholding, escalation, and evidentiary weighting in operational guides and audit trails.