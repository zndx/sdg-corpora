---
chapter_id: ch_live_instrument_subclass_d1f420
topic_id: 83
family: 01_foundation
cited_terms: ['instrument_subclass', 'requirement_basic', 'dempster_conflict_mass']
model: engine-refine
---

The governance of evidence-bearing records rests on a disciplined separation between identity, classification, and the quantitative assessment of belief. Every instrument, requirement, and mass assignment is anchored by a unique identifier—INST-0001 through INST-0004 for physical apparatus such as the X-Ray Diffractometer Bruker D8 or the Flow Cytometer BD FACSCanto; REQU-0001 through REQU-0004 for policy constraints like Privacy Constraint or Encryption Standard; and MASS-0001 through MASS-0004 for conflict-mass entities that carry both a label and a category. These identifiers are not merely keys; they are the immutable handles by which downstream queries, audit trails, and provenance chains resolve to a single row. An instrument's identifier, for instance, simultaneously anchors its descriptive metadata, the measurement requirements it produces, and the tags—archived, internal, verified—that govern its lifecycle state.

**t_instrument_subclass**

| id | instrument | produces_measurement | created_date | tags |
| --- | --- | --- | --- | --- |
| INST-0001 | X-Ray Diffractometer Bruker D8 | REQU-0006 | 2023-09-27 | archived |
| INST-0002 | Flow Cytometer BD FACSCanto | REQU-0004 | 2023-08-26 | internal |
| INST-0003 | Seismometer CMG-3ESP | REQU-0007 | 2023-03-12 | verified |
| INST-0004 | Spectrophotometer XPS-500 | REQU-0006 | 2023-09-07 | verified |
| INST-0005 | Flow Cytometer BD FACSCanto | REQU-0006 | 2023-03-06 | pii |
| INST-0006 | Thermal Imager FLIR T640 | REQU-0006 | 2024-03-26 | archived |

**t_requirement_basic**

| id | requirement |
| --- | --- |
| REQU-0001 | Privacy Constraint |
| REQU-0002 | Encryption Standard |
| REQU-0003 | Encryption Standard |
| REQU-0004 | Privacy Constraint |
| REQU-0005 | Latency Threshold |
| REQU-0006 | Performance SLA |
| REQU-0007 | Encryption Standard |
| REQU-0008 | Data Quality Check |

**t_requirement_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | 5 |
| REQU-0002 | REQU-0001 | REQU-0005 | 962 |
| REQU-0003 | REQU-0002 | REQU-0004 | 5 |
| REQU-0004 | REQU-0002 | REQU-0005 | 675 |
| REQU-0005 | REQU-0003 | REQU-0004 | 5 |
| REQU-0006 | REQU-0003 | REQU-0005 | 160 |
| REQU-0007 | REQU-0004 | REQU-0004 | 5 |
| REQU-0008 | REQU-0004 | REQU-0005 | 57 |

**t_requirement_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0007 | Encoding 01 |
| REQU-0002 | REQU-0001 | REQU-0002 | Enforcement 02 |
| REQU-0003 | REQU-0001 | REQU-0008 | calibration record |
| REQU-0004 | REQU-0001 | REQU-0009 | en |
| REQU-0005 | REQU-0001 | REQU-0006 | Scope 05 |
| REQU-0006 | REQU-0002 | REQU-0007 | Encoding 06 |
| REQU-0007 | REQU-0002 | REQU-0002 | Enforcement 07 |
| REQU-0008 | REQU-0002 | REQU-0008 | calibration record |

**dim_conflict_mass**

| id | conflict_mass_label | conflict_mass_category |
| --- | --- | --- |
| MASS-0001 | Conflict Mass Label 01 | Conflict Mass Category 01 |
| MASS-0002 | Conflict Mass Label 02 | Conflict Mass Category 02 |
| MASS-0003 | Conflict Mass Label 03 | Conflict Mass Category 03 |
| MASS-0004 | Conflict Mass Label 04 | Conflict Mass Category 04 |
| MASS-0005 | Conflict Mass Label 05 | Conflict Mass Category 05 |
| MASS-0006 | Conflict Mass Label 06 | Conflict Mass Category 06 |

Attributes and their types constitute the schema of property assignment, decoupling what is measured from how it is stored. The attribute registry enumerates names such as effective_date, enforcement, mandatory, and priority, each bound to a strict type: xsd:date, xsd:string, xsd:boolean, or xsd:integer. This type discipline ensures that the value assigned to an entity—whether the boolean mandatory flag set to true for one requirement and false for others, the integer priority value of 5 or 962, the date 2025-06-11 or 2023-09-17, or the free-form string calibration record or en—is validated at ingestion and remains semantically consistent across all joins. The entity column in each value table serves as the foreign key back to the requirement row, so that a single requirement such as REQU-0001 can carry a heterogeneous set of properties without schema proliferation.

**t_requirement_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REQU-0001 | effective_date | xsd:date |
| REQU-0002 | enforcement | xsd:string |
| REQU-0003 | mandatory | xsd:boolean |
| REQU-0004 | priority | xsd:integer |
| REQU-0005 | review_cycle_days | xsd:integer |
| REQU-0006 | scope | xsd:string |
| REQU-0007 | encoding | xsd:string |
| REQU-0008 | label_text | xsd:string |

**t_requirement_basic_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0003 | true |
| REQU-0002 | REQU-0002 | REQU-0003 | false |
| REQU-0003 | REQU-0003 | REQU-0003 | false |
| REQU-0004 | REQU-0004 | REQU-0003 | false |
| REQU-0005 | REQU-0005 | REQU-0003 | true |
| REQU-0006 | REQU-0006 | REQU-0003 | false |
| REQU-0007 | REQU-0007 | REQU-0003 | false |
| REQU-0008 | REQU-0008 | REQU-0003 | false |

**t_requirement_basic_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 2025-06-11 |
| REQU-0002 | REQU-0002 | REQU-0001 | 2024-12-28 |
| REQU-0003 | REQU-0003 | REQU-0001 | 2023-09-17 |
| REQU-0004 | REQU-0004 | REQU-0001 | 2024-08-31 |
| REQU-0005 | REQU-0005 | REQU-0001 | 2024-05-25 |
| REQU-0006 | REQU-0006 | REQU-0001 | 2024-05-27 |
| REQU-0007 | REQU-0007 | REQU-0001 | 2023-07-24 |
| REQU-0008 | REQU-0008 | REQU-0001 | 2023-09-16 |

Conflict mass occupies a distinct evidential tier, drawing on Dempster-Shafer theory to quantify the degree of contradiction and belief allocation among competing hypotheses. Each conflict-mass record carries a confidence value—0.728 for one assignment, 0.014 for another—alongside an uncertainty measure that ranges from 9.49 to 687.80, reflecting the spread of unallocated belief. The value column records the computed mass itself, with entries such as 846.10 or 137.18, while the conflict_mass_key column links the fact table to the dimension table where the label and category are resolved. A conflict-mass category might read Conflict Mass Category 01, and its corresponding label Conflict Mass Label 01, providing a human-readable classification that sits alongside the raw numerical evidence.

**fact_dempster**

| id | conflict_mass_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MASS-0001 | MASS-0003 | 0.153 | 9.49 | 520.46 |
| MASS-0002 | MASS-0002 | 0.014 | 392.06 | 137.18 |
| MASS-0003 | MASS-0005 | 0.025 | 687.80 | 197.61 |
| MASS-0004 | MASS-0001 | 0.728 | 479.57 | 846.10 |
| MASS-0005 | MASS-0006 | 0.918 | 172.36 | 296.96 |
| MASS-0006 | MASS-0001 | 0.755 | 608.06 | 341.51 |

Temporal provenance and administrative tags complete the governance picture. The created_date column on instrument records—2023-03-12 for the Seismometer CMG-3ESP, 2023-08-26 for the Flow Cytometer BD FACSCanto—establishes a chronological baseline for audit and retention policies. Tags such as verified, internal, and archived function as lightweight state flags that can be queried independently of the core identifiers, enabling operational workflows to filter, suppress, or promote records without altering their fundamental attributes. Together, the identifier, attribute type system, conflict-mass confidence and uncertainty metrics, category classification, and temporal and administrative metadata form an integrated framework in which every piece of evidence is both precisely located and quantitatively assessed.