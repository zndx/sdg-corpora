---
chapter_id: ch_live_qualifications_framework_919c26
topic_id: 51
family: 08_derived
cited_terms: ['qualifications_framework', 'mass_function_assigns_to_subset', 'ebpfmap_with_key_type']
model: engine-refine
---

Within a relational data architecture, every entity and relationship is anchored by a unique identifier that serves as the primary key across all tables, from the qualifications framework to the eBPF map catalog. In the qualifications domain, identifiers such as FRAM-0001 through FRAM-0004 distinguish individual qualifications like the Master of Science Data and the National Vocational Qualification, while SUBS-0001 through SUBS-0004 identify mass functions including FlightMass_Empty and TestMass_Aluminum. Similarly, the eBPF map dimension uses TYPE-0001 through TYPE-0004 to reference key types, each carrying a label and a category classification. These identifiers form the backbone of referential integrity, enabling precise joins across fact and dimension tables without ambiguity.

**t_qualifications_framework**

| id | qualifications |
| --- | --- |
| FRAM-0001 | Master of Science Data |
| FRAM-0002 | National Vocational Qualification |
| FRAM-0003 | European Qualifications Framework |
| FRAM-0004 | Certified Public Accountant |
| FRAM-0005 | Professional Engineer License |
| FRAM-0006 | Graduate Certificate Cyber |

**dim_key_type**

| id | key_type_label | key_type_category |
| --- | --- | --- |
| TYPE-0001 | Key Type Label 01 | Key Type Category 01 |
| TYPE-0002 | Key Type Label 02 | Key Type Category 02 |
| TYPE-0003 | Key Type Label 03 | Key Type Category 03 |
| TYPE-0004 | Key Type Label 04 | Key Type Category 04 |
| TYPE-0005 | Key Type Label 05 | Key Type Category 05 |
| TYPE-0006 | Key Type Label 06 | Key Type Category 06 |

The relationships between entities are not merely binary links but are enriched with metadata that governs their semantics and constraints. Junction tables such as `t_qualifications_framework__articulates` and `t_qualifications_framework__specifies` introduce columns like role and cardinality_note to qualify how one entity participates in a relationship. In the former, a qualification might assume the role of observer or owner when articulating a learning outcome such as Cloud Infrastructure Deployment or Natural Language Processing. In the latter, the role shifts to contributor or reviewer when a qualification is linked to a qualification level like EQF Level Three or NFQ Level Six, and each association carries a cardinality note—Cardinality Note 01 through Cardinality Note 04—that documents multiplicity constraints or business rules governing the relationship. This pattern repeats in the mass function domain, where the junction table `t_mass_function_assigns_to_subset__assigns_mass_to` assigns the role of observer to every pairing between a mass function and its target, whether that target is an ObservationRecord, a SensorNode, or a CalibrationEvent.

**t_qualifications_framework__articulates**

| id | qualifications_id | articulates_id | role |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0004 | FRAM-0001 | observer |
| FRAM-0002 | FRAM-0004 | FRAM-0001 | reviewer |
| FRAM-0003 | FRAM-0001 | FRAM-0003 | owner |
| FRAM-0004 | FRAM-0002 | FRAM-0005 | observer |
| FRAM-0005 | FRAM-0006 | FRAM-0004 | reviewer |
| FRAM-0006 | FRAM-0003 | FRAM-0004 | owner |
| FRAM-0007 | FRAM-0004 | FRAM-0005 | reviewer |
| FRAM-0008 | FRAM-0004 | FRAM-0005 | reviewer |

**t_qualifications_framework__specifies**

| id | qualifications_id | specifies_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| FRAM-0001 | FRAM-0006 | FRAM-0006 | contributor | Cardinality Note 01 |
| FRAM-0002 | FRAM-0006 | FRAM-0007 | owner | Cardinality Note 02 |
| FRAM-0003 | FRAM-0002 | FRAM-0001 | owner | Cardinality Note 03 |
| FRAM-0004 | FRAM-0004 | FRAM-0005 | reviewer | Cardinality Note 04 |
| FRAM-0005 | FRAM-0003 | FRAM-0007 | contributor | Cardinality Note 05 |
| FRAM-0006 | FRAM-0002 | FRAM-0001 | reviewer | Cardinality Note 06 |
| FRAM-0007 | FRAM-0005 | FRAM-0007 | reviewer | Cardinality Note 07 |
| FRAM-0008 | FRAM-0002 | FRAM-0007 | contributor | Cardinality Note 08 |

**t_mass_function_assigns_to_subset**

| id | mass |
| --- | --- |
| SUBS-0001 | FlightMass_Empty |
| SUBS-0002 | TestMass_Aluminum |
| SUBS-0003 | FlightMass_Empty |
| SUBS-0004 | DroneMass_Complete |
| SUBS-0005 | CargoMass_Max |
| SUBS-0006 | DroneMass_Complete |

**t_mass_function_assigns_to_subset_assigns_mass_to**

| id | assigns_mass_to |
| --- | --- |
| SUBS-0001 | ObservationRecord |
| SUBS-0002 | SensorNode |
| SUBS-0003 | CalibrationEvent |
| SUBS-0004 | DataQualityMetric |
| SUBS-0005 | TelemetryStream |
| SUBS-0006 | GovernanceRule |

**t_mass_function_assigns_to_subset__assigns_mass_to**

| id | mass_id | assigns_mass_to_id | role |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0006 | SUBS-0002 | observer |
| SUBS-0002 | SUBS-0006 | SUBS-0004 | observer |
| SUBS-0003 | SUBS-0001 | SUBS-0003 | observer |
| SUBS-0004 | SUBS-0006 | SUBS-0003 | observer |
| SUBS-0005 | SUBS-0002 | SUBS-0004 | owner |
| SUBS-0006 | SUBS-0002 | SUBS-0003 | reviewer |
| SUBS-0007 | SUBS-0005 | SUBS-0004 | reviewer |
| SUBS-0008 | SUBS-0006 | SUBS-0003 | observer |

The type and version columns capture the classification and revision state of technical entities, particularly within the eBPF map fact table. Here, the key_type_key column references a type identifier that points into the dimension table `dim_key_type`, where each type is further described by a key_type_label and a key_type_category. The version column records the revision number of each map entry—values ranging from 3 to 12—allowing the system to track evolutionary changes across the lifecycle of eBPF map definitions. This separation of type classification from version tracking follows a star-schema pattern, where the fact table holds measurable attributes and the dimension table provides descriptive context.

**fact_ebpfmap**

| id | key_type_key | size_bytes | version |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0005 | 208979093 | 3 |
| TYPE-0002 | TYPE-0006 | 156714508 | 6 |
| TYPE-0003 | TYPE-0006 | 31105012 | 12 |
| TYPE-0004 | TYPE-0002 | 354373995 | 5 |
| TYPE-0005 | TYPE-0004 | 866267293 | 2 |

Size measurements, stored in the size_bytes column of the eBPF map fact table, provide quantitative attributes that distinguish one map from another. Values such as 208979093 bytes and 354373995 bytes represent the memory footprint of individual map instances, enabling capacity planning and performance analysis. These numeric measures coexist with categorical and referential columns within the same fact table, illustrating how relational models blend quantitative metrics with qualitative descriptors to support multidimensional analysis.

The misc column in the key type dimension table serves as a catch-all for additional descriptive metadata that does not fit into the structured label or category fields, while the learningoutcome column in the articulates table captures the specific competencies or skills that a qualification is designed to deliver. The qualificationlevel column in the specifies table records the formal tier or band of a qualification, such as Advanced Practitioner or EQF Level Three, providing a standardized reference for comparing credentials across different frameworks. Together, these columns form a comprehensive model that captures not only what qualifications exist and what outcomes they produce, but also how they relate to one another, what roles each entity plays in those relationships, and what constraints govern the associations.

**t_qualifications_framework_articulates**

| id | articulates |
| --- | --- |
| FRAM-0001 | Cloud Infrastructure Deployment |
| FRAM-0002 | Agile Project Management |
| FRAM-0003 | Natural Language Processing |
| FRAM-0004 | Natural Language Processing |
| FRAM-0005 | Machine Learning Model Training |
| FRAM-0006 | Cybersecurity Threat Modeling |

**t_qualifications_framework_specifies**

| id | specifies |
| --- | --- |
| FRAM-0001 | Advanced Practitioner |
| FRAM-0002 | EQF Level Three |
| FRAM-0003 | Advanced Practitioner |
| FRAM-0004 | NFQ Level Six |
| FRAM-0005 | Associate Degree |
| FRAM-0006 | Postgraduate Master |
| FRAM-0007 | Entry Level Technician |