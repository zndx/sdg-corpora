---
chapter_id: ch_live_board_membership_5d066b
topic_id: 186
family: 08_derived
cited_terms: ['board_membership', 'measurement_with_op_artifact', 'strategic_planning_process']
model: engine-refine
---

Within this data model, every measurable object is anchored by a unique identifier that serves as the primary key across fact and dimension tables. Measurement artifacts carry identifiers such as ARTI-0001 through ARTI-0004, each representing a distinct operational entity—for instance, the Seismic Calibration Unit or the Turbidity Index—while strategic processes are identified by codes like PROC-0001 through PROC-0004. These identifiers form the backbone of referential integrity, enabling fact tables to link back to their corresponding dimension records through foreign-key columns that carry the same naming convention with a `_key` suffix. The entity column in the value tables explicitly references these artifact identifiers, ensuring that every attribute measurement can be traced to the specific object it describes.

**t_measurement_with_op_artifact**

| id | measurement | about |
| --- | --- | --- |
| ARTI-0001 | Seismic Calibration Unit | Network Switch Port |
| ARTI-0002 | Seismic Calibration Unit | Reactor Fuel Rod |
| ARTI-0003 | Turbidity Index | Network Switch Port |
| ARTI-0004 | Seismic Calibration Unit | Drone Battery Pack |
| ARTI-0005 | pH Batch Alpha Assay | Soil Core B |
| ARTI-0006 | Soil Moisture Profile | Drone Battery Pack |

Attributes are modeled using an entity-attribute-value pattern that separates metadata from data. The attribute definition table records each attribute's name—such as confidence, dimension_kind, method, or recorded_at—alongside its type, which is expressed in XSD vocabulary: xsd:decimal for numeric precision, xsd:string for categorical labels, and xsd:dateTime for temporal stamps. This type information dictates which value table holds the actual measurement. Decimal attributes like confidence scores (0.340, 0.434) or dimensional readings (723.57, 106.04) reside in the decimal value table, string attributes such as encoding designations (Encoding 02) and change rationales are stored in the varchar table, and timestamped values like 2024-07-05T11:56:13 occupy the datetime table. Each value row carries both an entity identifier pointing to the artifact and an attribute identifier pointing to the definition, creating a normalized structure that supports extensibility without schema modification.

**t_measurement_with_op_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | confidence | xsd:decimal |
| ARTI-0002 | dimension_kind | xsd:string |
| ARTI-0003 | method | xsd:string |
| ARTI-0004 | recorded_at | xsd:dateTime |
| ARTI-0005 | uncertainty | xsd:decimal |
| ARTI-0006 | unit | xsd:string |
| ARTI-0007 | value | xsd:decimal |
| ARTI-0008 | encoding | xsd:string |

**t_measurement_with_op_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2024-07-05T11:56:13 |
| ARTI-0002 | ARTI-0002 | ARTI-0004 | 2024-04-19T15:36:13 |
| ARTI-0003 | ARTI-0003 | ARTI-0004 | 2023-08-09T17:12:55 |
| ARTI-0004 | ARTI-0004 | ARTI-0004 | 2023-08-07T05:21:09 |
| ARTI-0005 | ARTI-0005 | ARTI-0004 | 2024-01-27T15:32:18 |
| ARTI-0006 | ARTI-0006 | ARTI-0004 | 2024-09-24T04:37:52 |

**t_measurement_with_op_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 0.340 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 723.57 |
| ARTI-0003 | ARTI-0001 | ARTI-0007 | 106.04 |
| ARTI-0004 | ARTI-0002 | ARTI-0001 | 0.434 |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | 258.77 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | 846.45 |
| ARTI-0007 | ARTI-0003 | ARTI-0001 | 0.917 |
| ARTI-0008 | ARTI-0003 | ARTI-0005 | 397.02 |

**t_measurement_with_op_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | Dimension Kind 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | Encoding 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | change rationale |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | fr |
| ARTI-0005 | ARTI-0001 | ARTI-0003 | manual |
| ARTI-0006 | ARTI-0001 | ARTI-0006 | m/s |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Dimension Kind 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | Encoding 08 |

Dimension tables provide the categorical and descriptive context that fact tables lack. The participant dimension associates each participant identifier with a human-readable label—Has Participant Label 01 through Has Participant Label 04—and a category classification such as Has Participant Category 01 or Has Participant Category 03. Similarly, the strategic planning dimensions classify business divisions and planning artifacts with parallel label and category columns: Targets Business Division Label 01 paired with Targets Business Division Category 02, or Produces Planning Artifact Label 03 alongside Produces Planning Artifact Category 01. These label columns serve as the misc or descriptive fields that populate reports and user interfaces, while the category columns enable aggregation and filtering at a coarser granularity. The fact tables reference these dimensions through foreign keys—has_participant_key, targets_business_division_key, and produces_planning_artifact_key—that resolve to the dimension identifiers, allowing a single fact row to carry both a quantitative measure and rich contextual metadata.

**dim_has_participant**

| id | has_participant_label | has_participant_category |
| --- | --- | --- |
| MEMB-0001 | Has Participant Label 01 | Has Participant Category 01 |
| MEMB-0002 | Has Participant Label 02 | Has Participant Category 02 |
| MEMB-0003 | Has Participant Label 03 | Has Participant Category 03 |
| MEMB-0004 | Has Participant Label 04 | Has Participant Category 04 |
| MEMB-0005 | Has Participant Label 05 | Has Participant Category 05 |
| MEMB-0006 | Has Participant Label 06 | Has Participant Category 06 |

**fact_strategic**

| id | targets_business_division_key | produces_planning_artifact_key | event_count |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0005 | PROC-0005 | 388 |
| PROC-0002 | PROC-0001 | PROC-0002 | 352 |
| PROC-0003 | PROC-0005 | PROC-0002 | 320 |
| PROC-0004 | PROC-0001 | PROC-0001 | 123 |
| PROC-0005 | PROC-0003 | PROC-0003 | 268 |
| PROC-0006 | PROC-0005 | PROC-0004 | 27 |
| PROC-0007 | PROC-0001 | PROC-0004 | 70 |

**dim_targets_business_division**

| id | targets_business_division_label | targets_business_division_category |
| --- | --- | --- |
| PROC-0001 | Targets Business Division Label 01 | Targets Business Division Category 01 |
| PROC-0002 | Targets Business Division Label 02 | Targets Business Division Category 02 |
| PROC-0003 | Targets Business Division Label 03 | Targets Business Division Category 03 |
| PROC-0004 | Targets Business Division Label 04 | Targets Business Division Category 04 |
| PROC-0005 | Targets Business Division Label 05 | Targets Business Division Category 05 |
| PROC-0006 | Targets Business Division Label 06 | Targets Business Division Category 06 |
| PROC-0007 | Targets Business Division Label 07 | Targets Business Division Category 07 |
| PROC-0008 | Targets Business Division Label 08 | Targets Business Division Category 08 |

**dim_produces_planning_artifact**

| id | produces_planning_artifact_label | produces_planning_artifact_category |
| --- | --- | --- |
| PROC-0001 | Produces Planning Artifact Label 01 | Produces Planning Artifact Category 01 |
| PROC-0002 | Produces Planning Artifact Label 02 | Produces Planning Artifact Category 02 |
| PROC-0003 | Produces Planning Artifact Label 03 | Produces Planning Artifact Category 03 |
| PROC-0004 | Produces Planning Artifact Label 04 | Produces Planning Artifact Category 04 |
| PROC-0005 | Produces Planning Artifact Label 05 | Produces Planning Artifact Category 05 |
| PROC-0006 | Produces Planning Artifact Label 06 | Produces Planning Artifact Category 06 |

Event count functions as the principal quantitative measure across the fact tables, capturing the volume of activity associated with each fact record. In the board fact table, event counts range from 26 for one participant association to 403 for another, reflecting the disparity in engagement levels across the MEMB-0001 through MEMB-0005 participant set. The strategic fact table shows event counts of 388, 352, 320, and 123 across process records, correlating with which business division is targeted and which planning artifact is produced. These counts are not derived from the attribute-value tables; they are independently recorded measures that summarize operational throughput or transaction volume at the grain of the fact table's dimension keys. Together, the identifiers, attributes, categories, and event counts form a multidimensional structure that supports both granular inspection of individual measurements and aggregated analysis across participant, division, and artifact dimensions.

**fact_board**

| id | has_participant_key | event_count |
| --- | --- | --- |
| MEMB-0001 | MEMB-0005 | 236 |
| MEMB-0002 | MEMB-0004 | 403 |
| MEMB-0003 | MEMB-0002 | 359 |
| MEMB-0004 | MEMB-0005 | 26 |
| MEMB-0005 | MEMB-0004 | 209 |
| MEMB-0006 | MEMB-0005 | 369 |
| MEMB-0007 | MEMB-0004 | 133 |