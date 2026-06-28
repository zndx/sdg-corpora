---
chapter_id: ch_live_state_observed_at_time_17a26b
topic_id: 183
family: 02_observation_measurement
cited_terms: ['state_observed_at_time', 'universal_combined_with_existential', 'subclass_to_independent_continuant']
model: engine-refine
---

In structured data architectures, the disciplined separation of identifier, entity, attr, attr type, and misc values establishes a scalable foundation for observational and regulatory record-keeping. An identifier functions as a stable, globally unique anchor that persists across relational boundaries, enabling precise cross-referencing without relying on mutable business keys. Identifiers such as `TIME-0001` or `CONT-0001` serve as the primary linkage mechanism, ensuring that telemetry snapshots, ontological classifications, and typed values remain traceable regardless of how the underlying data is partitioned. An entity represents the concrete or abstract subject under observation, ranging from physical infrastructure like `Firewall Appliance 7` and `Server Rack 14A` to procedural constructs like `GDPR_Consent_Record` or `Supply_Chain_Shipment`. By decoupling the entity from its properties, systems can accommodate sparse, evolving, or highly granular datasets without requiring rigid schema migrations.

**t_state_observed_at_time**

| id | state | observed_at |
| --- | --- | --- |
| TIME-0001 | offline | 2024-03-16T07:00:05Z |
| TIME-0002 | calibrated | 2024-03-17T09:33:40Z |
| TIME-0003 | idle | 2024-03-18T08:05:19Z |
| TIME-0004 | calibrated | 2024-03-16T11:22:30Z |
| TIME-0005 | idle | 2024-03-17T13:50:02Z |
| TIME-0006 | draining | 2024-03-15T10:45:11Z |
| TIME-0007 | idle | 2024-03-16T07:00:05Z |
| TIME-0008 | locked | 2024-03-15T08:30:00Z |

**t_state_observed_at_time_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIME-0001 | confidence | xsd:decimal |
| TIME-0002 | dimension_kind | xsd:string |
| TIME-0003 | method | xsd:string |
| TIME-0004 | recorded_at | xsd:dateTime |
| TIME-0005 | uncertainty | xsd:decimal |
| TIME-0006 | unit | xsd:string |
| TIME-0007 | value | xsd:decimal |
| TIME-0008 | encoding | xsd:string |

**t_state_observed_at_time_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIME-0001 | TIME-0001 | TIME-0002 | Dimension Kind 01 |
| TIME-0002 | TIME-0001 | TIME-0008 | Encoding 02 |
| TIME-0003 | TIME-0001 | TIME-0009 | nightly summary |
| TIME-0004 | TIME-0001 | TIME-0010 | fr |
| TIME-0005 | TIME-0001 | TIME-0003 | automated |
| TIME-0006 | TIME-0001 | TIME-0006 | ms |
| TIME-0007 | TIME-0002 | TIME-0002 | Dimension Kind 07 |
| TIME-0008 | TIME-0002 | TIME-0008 | Encoding 08 |

The attr column captures the specific dimensions of an entity, while the attr type column enforces semantic and technical constraints on how those dimensions are persisted. Attribute names such as `confidence`, `location`, `owner`, and `recorded_at` are paired with type declarations that dictate expected data formats and validation rules. Standard XML Schema types like `xsd:decimal`, `xsd:string`, and `xsd:dateTime` guarantee interoperability with downstream analytics pipelines, while domain-specific types such as `cco:Person` introduce ontological precision. This separation of naming and typing allows organizations to maintain a centralized attribute registry that can be reused across multiple entity classes, reducing redundancy and ensuring that every measurement or descriptor conforms to a consistent governance framework.

Actual data points, stored under the misc designation, are materialized in type-specific value tables to optimize query performance and preserve data integrity. Rather than forcing heterogeneous properties into a single generic column, the architecture routes decimal measurements like `0.673` or `138.13` into numeric storage, temporal markers such as `2023-08-28T00:49:09` into datetime buckets, and textual descriptors like `Dimension Kind 01` or `on-prem-dc1` into variable-character fields. Each misc record is bound to an entity_id and an attr_id, creating a flexible entity-attribute-value matrix that supports dynamic property expansion. This design proves particularly valuable in time-series or state-tracking contexts, where observations like `calibrated` or `idle` are logged alongside their associated metadata without disrupting the core entity structure.

**t_state_observed_at_time_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIME-0001 | TIME-0001 | TIME-0004 | 2023-08-28T00:49:09 |
| TIME-0002 | TIME-0002 | TIME-0004 | 2023-01-12T06:19:16 |
| TIME-0003 | TIME-0003 | TIME-0004 | 2023-12-07T18:51:38 |
| TIME-0004 | TIME-0004 | TIME-0004 | 2024-05-06T22:48:11 |
| TIME-0005 | TIME-0005 | TIME-0004 | 2023-11-07T19:04:18 |
| TIME-0006 | TIME-0006 | TIME-0004 | 2024-03-08T08:57:30 |
| TIME-0007 | TIME-0007 | TIME-0004 | 2023-04-13T11:54:48 |
| TIME-0008 | TIME-0008 | TIME-0004 | 2024-08-24T14:36:17 |

**t_state_observed_at_time_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIME-0001 | TIME-0001 | TIME-0001 | 0.673 |
| TIME-0002 | TIME-0001 | TIME-0005 | 138.13 |
| TIME-0003 | TIME-0001 | TIME-0007 | 126.00 |
| TIME-0004 | TIME-0002 | TIME-0001 | 0.137 |
| TIME-0005 | TIME-0002 | TIME-0005 | 428.04 |
| TIME-0006 | TIME-0002 | TIME-0007 | 24.81 |
| TIME-0007 | TIME-0003 | TIME-0001 | 0.753 |
| TIME-0008 | TIME-0003 | TIME-0005 | 875.90 |

Beyond basic attribute-value mapping, the system incorporates higher-order classification structures that relate entities to broader ontological categories and dependency patterns. Tables mapping subclasses to independent continuants group operational resources like `Audit Log Stream 5` under shared categorical frameworks, while universal-existential relationship tables capture structural dependencies—such as how a `Database_Backup_Volume` relates to `Personal_Information` or how a `Tissue_Sample` connects to `Atmospheric_Moisture`. These structural layers transform raw attribute collections into a governed knowledge graph, enabling complex querying, compliance auditing, and semantic reasoning. Together, identifiers, entities, attributes, types, and typed values constitute a modular data fabric that balances flexibility with rigorous governance, ensuring that both operational telemetry and regulatory records remain accurate, queryable, and auditable over time.

**t_universal_combined_with_existential**

| id | universal | related |
| --- | --- | --- |
| EXIS-0001 | Lab_Centrifuge_Rotor | Atmospheric_Moisture |
| EXIS-0002 | Supply_Chain_Shipment | Personal_Information |
| EXIS-0003 | GDPR_Consent_Record | Tissue_Sample |
| EXIS-0004 | Database_Backup_Volume | Personal_Information |
| EXIS-0005 | GDPR_Consent_Record | Serum_Glucose |
| EXIS-0006 | Spectral_Analyzer_Module | Light_Wavelength |
| EXIS-0007 | GDPR_Consent_Record | Light_Wavelength |
| EXIS-0008 | Blood_Glucose_Assay | Tissue_Sample |

**t_subclass_to_independent_continuant**

| id | independent |
| --- | --- |
| CONT-0001 | Audit Log Stream 5 |
| CONT-0002 | Audit Log Stream 5 |
| CONT-0003 | Firewall Appliance 7 |
| CONT-0004 | Server Rack 14A |
| CONT-0005 | Sensor Node 7B |
| CONT-0006 | Server Rack 14A |

**t_subclass_to_independent_continuant_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONT-0001 | location | xsd:string |
| CONT-0002 | name | xsd:string |
| CONT-0003 | owner | cco:Person |
| CONT-0004 | tags | xsd:string |

**t_subclass_to_independent_continuant_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0001 | on-prem-dc1 |
| CONT-0002 | CONT-0001 | CONT-0002 | Name 02 |
| CONT-0003 | CONT-0001 | CONT-0003 | sre |
| CONT-0004 | CONT-0001 | CONT-0004 | Tags 04 |
| CONT-0005 | CONT-0002 | CONT-0001 | us-east-1 |
| CONT-0006 | CONT-0002 | CONT-0002 | Name 06 |
| CONT-0007 | CONT-0002 | CONT-0003 | sre |
| CONT-0008 | CONT-0002 | CONT-0004 | Tags 08 |