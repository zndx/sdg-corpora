---
chapter_id: ch_live_subclass_basic_c0ef84
topic_id: 47
family: 01_foundation
cited_terms: ['subclass_basic', 'ice_exactly_one_subject', 'dengue_transmission_process']
model: engine-refine
---

The subject classification framework is anchored in a two-tier hierarchy that distinguishes between primary subjects and their subordinate subclasses. The table t_subclass_basic establishes these relationships through a triad of columns: a unique identifier (id), a primary subject designation, and a secondary subject (subject_2) that denotes the subclass association. Records such as TSUB-0001 through TSUB-0004 each pair a subject—drawn from domains including ISO 8601 timestamp, Parquet row group, Remote sensing platform, and Query execution engine—with a corresponding subclass entity like Query execution engine, Kestrel telemetry probe, Atmospheric instrument, or Edge gateway node. This structure permits a single subject to participate in multiple subclass relationships, thereby supporting a many-to-many classification model that is essential for systems where entities must be simultaneously categorized across orthogonal taxonomies.

**t_subclass_basic**

| id | subject | subject_2 |
| --- | --- | --- |
| TSUB-0001 | ISO 8601 timestamp | Query execution engine |
| TSUB-0002 | Parquet row group | Kestrel telemetry probe |
| TSUB-0003 | Remote sensing platform | Atmospheric instrument |
| TSUB-0004 | Query execution engine | Edge gateway node |
| TSUB-0005 | Edge gateway node | Data serialization method |
| TSUB-0006 | Argo float array | ISO 8601 timestamp |
| TSUB-0007 | Measurement apparatus | Environmental monitoring device |

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

Complementing this classification layer, the subject attribute system is organized across three interrelated tables that together implement an entity-attribute-value (EAV) pattern for flexible metadata storage. The table t_ice_exactly_one_subject defines the subjects themselves, each identified by a code such as SUBJ-0001 through SUBJ-0004 and characterized by an ice descriptor (e.g., Calibration Manifest, Provenance Graph Export, Raw Observation Feed) alongside a related entity (e.g., Measurement Timeframe, Message Type Definition, Quality Check Script, Primary Data Source). The table t_ice_exactly_one_subject_attr enumerates the permissible attributes for these subjects, recording each attribute's name (attr_name)—such as encoding, label_text, or language—and its type (attr_type), which in the observed data is uniformly xsd:string. The table t_ice_exactly_one_subject_val_varchar then materializes the actual attribute assignments, linking an entity (entity_id) to an attribute (attr_id) and storing the attribute's value (value). For instance, entity SUBJ-0001 is assigned the value Encoding 01 for attribute SUBJ-0001 (encoding), nightly summary for attribute SUBJ-0002 (label_text), and fr for attribute SUBJ-0003 (language), while entity SUBJ-0002 receives the value Encoding 04 for attribute SUBJ-0001. The foreign key constraints—entity_id referencing t_ice_exactly_one_subject.id and attr_id referencing t_ice_exactly_one_subject_attr.id—ensure referential integrity across this three-table structure.

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

The analytical core of the schema is the fact table fact_dengue, which records event-level observations involving hosts and vectors. Each record is identified by a unique code (id), such as PROC-0001 through PROC-0004, and carries two foreign keys: involves_host_key, which references the host dimension, and involves_vector_key, which references the vector dimension. The fact table also includes an event_count column that quantifies the number of events associated with each host-vector pairing. Observed event counts range from 56 (PROC-0003) to 444 (PROC-0002), illustrating the variable intensity of interactions captured by the fact table. The design permits a single host or vector to participate in multiple fact records, enabling aggregation across dimensions for reporting and analysis.

**fact_dengue**

| id | involves_host_key | involves_vector_key | event_count |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0002 | PROC-0004 | 251 |
| PROC-0002 | PROC-0001 | PROC-0002 | 444 |
| PROC-0003 | PROC-0005 | PROC-0007 | 56 |
| PROC-0004 | PROC-0002 | PROC-0003 | 167 |
| PROC-0005 | PROC-0002 | PROC-0008 | 168 |

The host and vector dimensions provide the categorical and descriptive context necessary to interpret the fact table's quantitative measures. The table dim_involves_host stores dimension members identified by id (PROC-0001 through PROC-0004), each annotated with an involves_host_label (e.g., Involves Host Label 01 through Involves Host Label 04) and an involves_host_category (e.g., Involves Host Category 01 through Involves Host Category 04). Similarly, dim_involves_vector stores vector dimension members with corresponding involves_vector_label and involves_vector_category attributes. The fact_dengue table's involves_host_key and involves_vector_key columns reference these dimension tables, forming the classic star-schema join pattern that allows analysts to filter, group, and aggregate event counts by host category, vector category, or any combination thereof. This separation of fact and dimension is a foundational design principle in dimensional modeling, ensuring that descriptive attributes can be modified independently of quantitative records without introducing update anomalies.

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