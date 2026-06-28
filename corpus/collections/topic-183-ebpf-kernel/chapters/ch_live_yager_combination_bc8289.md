---
chapter_id: ch_live_yager_combination_bc8289
topic_id: 183
family: 07_long_tail
cited_terms: ['yager_combination', 'qualifications_framework', 'schema_evolution_under_directive']
model: engine-refine
---

In relational data modeling, the identifier serves as the immutable anchor for every entity, whether it is a fusion gateway like `FusionGateway-Nine` or a qualification framework entry such as `FRAM-0001`. These identifiers propagate through the model as foreign keys, establishing referential integrity across tables that capture distinct aspects of the domain. When relationships are many-to-many, a junction table mediates between a subject and a target, each referenced by its identifier. The `t_yager_combination__yager_combines` table, for instance, links a Yager combination identified by `COMB-0003` to a combined element identified by `COMB-0006`, while the `t_qualifications_framework__articulates` table connects a qualifications framework entry `FRAM-0004` to a learning outcome `FRAM-0001`. The role column on these junction tables qualifies the nature of the relationship itself—entries carry values such as `owner`, `contributor`, or `observer`—ensuring that the semantic context of each association is preserved alongside the structural linkage.

**t_yager_combination**

| id | yager |
| --- | --- |
| COMB-0001 | FusionGateway-Nine |
| COMB-0002 | FusionNode-Alpha |
| COMB-0003 | FusionGateway-Nine |
| COMB-0004 | ProvenanceEngine-Three |
| COMB-0005 | FusionNode-Alpha |
| COMB-0006 | TelemetryOrchestrator |

**t_yager_combination_yager_combines**

| id | yager_combines |
| --- | --- |
| COMB-0001 | RadarPulse-Data |
| COMB-0002 | SpectralData-Set |
| COMB-0003 | VibrationSensor-Nine |
| COMB-0004 | RadarPulse-Data |
| COMB-0005 | LidarScan-2023 |
| COMB-0006 | TelemetryStream-Alpha |
| COMB-0007 | AcousticArray-Alpha |

**t_yager_combination__yager_combines**

| id | yager_id | yager_combines_id | role |
| --- | --- | --- | --- |
| COMB-0001 | COMB-0003 | COMB-0006 | observer |
| COMB-0002 | COMB-0006 | COMB-0004 | contributor |
| COMB-0003 | COMB-0006 | COMB-0007 | contributor |
| COMB-0004 | COMB-0001 | COMB-0003 | owner |
| COMB-0005 | COMB-0002 | COMB-0002 | reviewer |
| COMB-0006 | COMB-0006 | COMB-0005 | observer |
| COMB-0007 | COMB-0002 | COMB-0004 | contributor |
| COMB-0008 | COMB-0004 | COMB-0005 | observer |

**t_qualifications_framework**

| id | qualifications |
| --- | --- |
| FRAM-0001 | Master of Science Data |
| FRAM-0002 | National Vocational Qualification |
| FRAM-0003 | European Qualifications Framework |
| FRAM-0004 | Certified Public Accountant |
| FRAM-0005 | Professional Engineer License |
| FRAM-0006 | Graduate Certificate Cyber |

**t_qualifications_framework_articulates**

| id | articulates |
| --- | --- |
| FRAM-0001 | Cloud Infrastructure Deployment |
| FRAM-0002 | Agile Project Management |
| FRAM-0003 | Natural Language Processing |
| FRAM-0004 | Natural Language Processing |
| FRAM-0005 | Machine Learning Model Training |
| FRAM-0006 | Cybersecurity Threat Modeling |

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

Cardinality notes provide an additional layer of constraint documentation on relationship tables, recording metadata about multiplicity expectations that the database schema alone may not enforce. In the `t_qualifications_framework__specifies` junction table, each row carries a cardinality note such as `Cardinality Note 01` through `Cardinality Note 04`, documenting the expected one-to-many or many-to-many bounds between qualification frameworks and their specified qualification levels. These notes are particularly valuable in governance contexts where data stewards need to validate that the volume of related records aligns with business rules—for example, ensuring that a framework like `FRAM-0006` does not unexpectedly accumulate an excessive number of specification links to qualification levels like `FRAM-0006` or `FRAM-0007`.

The dimensional architecture separates factual measurements from their descriptive context, a pattern exemplified by the `fact_schema` and `dim_schema` tables. The fact table records quantitative observations with a schema key pointing to the relevant dimension, alongside a confidence value—ranging from `0.128` to `0.559` across sample records—and an uncertainty metric expressed as a numeric value such as `496.72` or `36.42`. The corresponding misc column captures the measured value itself, with entries like `934.63` or `628.85`. The dimension table enriches these facts with human-readable labels like `Schema Label 01` and categorical classifications such as `Schema Category 01`, enabling filtering and aggregation by meaningful groupings rather than opaque identifiers alone.

**fact_schema**

| id | schema_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| DIRE-0001 | DIRE-0007 | 0.346 | 496.72 | 934.63 |
| DIRE-0002 | DIRE-0004 | 0.128 | 36.42 | 722.91 |
| DIRE-0003 | DIRE-0007 | 0.279 | 132.28 | 890.32 |
| DIRE-0004 | DIRE-0007 | 0.559 | 435.16 | 628.85 |
| DIRE-0005 | DIRE-0002 | 0.314 | 996.56 | 660.34 |
| DIRE-0006 | DIRE-0003 | 0.661 | 71.96 | 765.11 |
| DIRE-0007 | DIRE-0005 | 0.981 | 108.29 | 904.01 |

**dim_schema**

| id | schema_label | schema_category |
| --- | --- | --- |
| DIRE-0001 | Schema Label 01 | Schema Category 01 |
| DIRE-0002 | Schema Label 02 | Schema Category 02 |
| DIRE-0003 | Schema Label 03 | Schema Category 03 |
| DIRE-0004 | Schema Label 04 | Schema Category 04 |
| DIRE-0005 | Schema Label 05 | Schema Category 05 |
| DIRE-0006 | Schema Label 06 | Schema Category 06 |
| DIRE-0007 | Schema Label 07 | Schema Category 07 |

The qualifications framework domain demonstrates how learning outcomes and qualification levels are articulated and specified through structured relationships. A learning outcome such as `Cloud Infrastructure Deployment` or `Natural Language Processing` is linked to a qualification framework like `FRAM-0001` (which holds the qualification `Master of Science Data`) through the articulates junction table, where the role column distinguishes whether the framework acts as `owner` or `observer` of that learning outcome. Similarly, the specifies relationship connects frameworks to qualification levels—`Advanced Practitioner`, `EQF Level Three`, or `NFQ Level Six`—with the junction table recording both the role (e.g., `contributor`, `owner`, `reviewer`) and the cardinality note that constrains the relationship. This dual-layer approach ensures that both the structural linkage and its governance metadata are captured in a single, queryable record.