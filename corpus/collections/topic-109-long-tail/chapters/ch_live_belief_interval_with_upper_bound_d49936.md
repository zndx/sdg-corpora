---
chapter_id: ch_live_belief_interval_with_upper_bound_d49936
topic_id: 109
family: 06_belief_structure
cited_terms: ['belief_interval_with_upper_bound', 'measurement_max_one_value', 'evidence_basic']
model: engine-refine
---

Belief intervals and their associated metadata are modelled through a decomposition that separates the core assertion from its descriptive attributes. Each belief interval carries an identifier—`BOUN-0001` through `BOUN-0004`—and a human-readable description of the anomaly under consideration, such as "Model feature shift", "Batch ingestion failure", "Sensor calibration drift", and "Storage quota warning". The plausibility upper bound is expressed in domain-specific terms: "Alpha level 0.05", "Ninety percent cap", "Three sigma bound", and "Extreme outlier bound". Rather than embedding attribute values directly into the interval record, the schema extracts attributes into a dedicated definition table, `t_belief_interval_with_upper_bound_attr`, where each attribute is identified by name—`confidence`, `dimension_kind`, `method`, `recorded_at`—and typed with an XML Schema datatype such as `xsd:decimal`, `xsd:string`, or `xsd:dateTime`. This separation of attribute schema from attribute value is the structural mechanism that permits a single belief interval to carry heterogeneous data without schema modification.

**t_belief_interval_with_upper_bound**

| id | belief | plausibility_upper_bound |
| --- | --- | --- |
| BOUN-0001 | Model feature shift | Alpha level 0.05 |
| BOUN-0002 | Batch ingestion failure | Ninety percent cap |
| BOUN-0003 | Sensor calibration drift | Three sigma bound |
| BOUN-0004 | Storage quota warning | Extreme outlier bound |
| BOUN-0005 | Latency SLA breach | 0.95 confidence |
| BOUN-0006 | Model feature shift | Upper confidence limit |

**t_belief_interval_with_upper_bound_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BOUN-0001 | confidence | xsd:decimal |
| BOUN-0002 | dimension_kind | xsd:string |
| BOUN-0003 | method | xsd:string |
| BOUN-0004 | recorded_at | xsd:dateTime |
| BOUN-0005 | uncertainty | xsd:decimal |
| BOUN-0006 | unit | xsd:string |
| BOUN-0007 | value | xsd:decimal |
| BOUN-0008 | encoding | xsd:string |

The attribute values themselves are stored in three type-dispatch tables, each corresponding to a distinct value domain. Decimal-valued attributes reside in `t_belief_interval_with_upper_bound_val_decimal`, where entity identifiers such as `BOUN-0001` and `BOUN-0002` are linked to attribute identifiers like `BOUN-0001`, `BOUN-0005`, and `BOUN-0007`, and the actual values—`0.680`, `473.67`, `703.38`, `0.590`—are recorded. String-valued attributes are stored in `t_belief_interval_with_upper_bound_val_varchar`, with entity `BOUN-0001` carrying values such as "Dimension Kind 01", "Encoding 02", "change rationale", and "de" across attribute identifiers `BOUN-0002`, `BOUN-0008`, `BOUN-0009`, and `BOUN-0010`. Timestamp attributes are held in `t_belief_interval_with_upper_bound_val_datetime`, where the same entity identifiers are associated with attribute `BOUN-0004` and values including `2024-12-10T20:43:33`, `2024-02-10T17:59:05`, `2024-06-16T13:27:28`, and `2025-04-06T06:40:08`. The entity identifier in each value table serves as the foreign key back to the belief interval, while the attribute identifier points into the attribute definition table, forming a classic entity-attribute-value pattern that is type-partitioned for storage efficiency and type safety.

**t_belief_interval_with_upper_bound_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0001 | BOUN-0004 | 2024-12-10T20:43:33 |
| BOUN-0002 | BOUN-0002 | BOUN-0004 | 2024-02-10T17:59:05 |
| BOUN-0003 | BOUN-0003 | BOUN-0004 | 2024-06-16T13:27:28 |
| BOUN-0004 | BOUN-0004 | BOUN-0004 | 2025-04-06T06:40:08 |
| BOUN-0005 | BOUN-0005 | BOUN-0004 | 2025-03-13T22:14:49 |
| BOUN-0006 | BOUN-0006 | BOUN-0004 | 2024-01-19T21:51:57 |

**t_belief_interval_with_upper_bound_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0001 | BOUN-0001 | 0.680 |
| BOUN-0002 | BOUN-0001 | BOUN-0005 | 473.67 |
| BOUN-0003 | BOUN-0001 | BOUN-0007 | 703.38 |
| BOUN-0004 | BOUN-0002 | BOUN-0001 | 0.590 |
| BOUN-0005 | BOUN-0002 | BOUN-0005 | 382.46 |
| BOUN-0006 | BOUN-0002 | BOUN-0007 | 678.08 |
| BOUN-0007 | BOUN-0003 | BOUN-0001 | 0.348 |
| BOUN-0008 | BOUN-0003 | BOUN-0005 | 462.48 |

**t_belief_interval_with_upper_bound_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0001 | BOUN-0002 | Dimension Kind 01 |
| BOUN-0002 | BOUN-0001 | BOUN-0008 | Encoding 02 |
| BOUN-0003 | BOUN-0001 | BOUN-0009 | change rationale |
| BOUN-0004 | BOUN-0001 | BOUN-0010 | de |
| BOUN-0005 | BOUN-0001 | BOUN-0003 | automated |
| BOUN-0006 | BOUN-0001 | BOUN-0006 | m/s |
| BOUN-0007 | BOUN-0002 | BOUN-0002 | Dimension Kind 07 |
| BOUN-0008 | BOUN-0002 | BOUN-0008 | Encoding 08 |

Measurement data follows a parallel decomposition. The `t_measurement_max_one_value` table defines measurement concepts by identifier—`VALU-0001` through `VALU-0004`—and by name, including "Soil pH", "Water turbidity", "Air particulate", and "CPU load". Numeric values are stored separately in `t_measurement_max_one_value_numeric_value`, with entries such as `98.6`, `120.5`, `98.6`, and `0.042`. The linkage between a measurement and its numeric value is mediated by the junction table `t_measurement_max_one_value__numeric_value`, which carries three columns: `measurement_id` (the subject), `numeric_value_id` (the target), and `role`. The role column distinguishes the nature of the association—`reviewer`, `observer`, `contributor`, `observer`—allowing a single measurement to be associated with multiple numeric values, each playing a different semantic role. For instance, measurement `VALU-0005` is linked to numeric value `VALU-0001` with the role `reviewer` and to numeric value `VALU-0005` with the role `contributor`, demonstrating that the role column is the semantic glue that disambiguates otherwise identical foreign-key relationships.

**t_measurement_max_one_value**

| id | measurement |
| --- | --- |
| VALU-0001 | Soil pH |
| VALU-0002 | Water turbidity |
| VALU-0003 | Air particulate |
| VALU-0004 | CPU load |
| VALU-0005 | Battery voltage |
| VALU-0006 | Air particulate |
| VALU-0007 | Core temperature |

**t_measurement_max_one_value_numeric_value**

| id | numeric_value |
| --- | --- |
| VALU-0001 | 98.6 |
| VALU-0002 | 120.5 |
| VALU-0003 | 98.6 |
| VALU-0004 | 0.042 |
| VALU-0005 | 0.042 |
| VALU-0006 | 0.85 |

**t_measurement_max_one_value__numeric_value**

| id | measurement_id | numeric_value_id | role |
| --- | --- | --- | --- |
| VALU-0001 | VALU-0005 | VALU-0001 | reviewer |
| VALU-0002 | VALU-0002 | VALU-0003 | observer |
| VALU-0003 | VALU-0005 | VALU-0005 | contributor |
| VALU-0004 | VALU-0003 | VALU-0001 | observer |
| VALU-0005 | VALU-0007 | VALU-0005 | owner |
| VALU-0006 | VALU-0004 | VALU-0005 | observer |
| VALU-0007 | VALU-0003 | VALU-0006 | contributor |
| VALU-0008 | VALU-0002 | VALU-0006 | owner |

Evidence records, captured in `t_evidence_basic`, introduce two additional classification dimensions: `dimension_kind` and `encoding`. Each evidence entry is identified by a code such as `EVID-0001` and carries a description of the evidence type—"Compliance checklist", "Latency benchmark result", "Incident postmortem"—alongside a dimension kind drawn from physical quantities like `temperature`, `count`, and `pressure`, and an encoding designation such as `ascii`, `latin1`, or `utf8`. The dimension kind here functions as a categorical label that constrains the kind of measurement or observation the evidence pertains to, while the encoding specifies the character encoding of the evidence content, a practical concern for data interchange and archival integrity. These two columns operate as orthogonal axes of classification: the same evidence type ("Compliance checklist") may appear with different dimension kinds (`temperature` for `EVID-0001` and `pressure` for `EVID-0004`), and the same dimension kind may be paired with different encodings (`utf8` for both `EVID-0003` and `EVID-0004`, but `ascii` and `latin1` for other entries).

**t_evidence_basic**

| id | evidence | dimension_kind | encoding |
| --- | --- | --- | --- |
| EVID-0001 | Compliance checklist | temperature | ascii |
| EVID-0002 | Latency benchmark result | count | latin1 |
| EVID-0003 | Incident postmortem | temperature | utf8 |
| EVID-0004 | Compliance checklist | pressure | utf8 |
| EVID-0005 | Temperature spike alert | length | utf8 |

Taken together, the schema employs a consistent pattern across all three domains—belief intervals, measurements, and evidence. The identifier column provides a stable, opaque key that is referenced by foreign keys in value tables and junction tables. The entity column in value tables and the subject and target columns in junction tables form the relational backbone, connecting definitions to their instantiations and to each other. The attr and attr_type columns in the attribute definition table establish a typed attribute vocabulary that is then instantiated across type-specific value tables. The dimension_kind and encoding columns in the evidence table, and the role column in the measurement junction table, add semantic layers that allow the same structural pattern to express different kinds of classification and association. This design permits the system to accommodate heterogeneous data—numeric, textual, temporal—within a uniform relational framework, while preserving type discipline through table partitioning and enabling rich, role-based associations through explicit junction tables.