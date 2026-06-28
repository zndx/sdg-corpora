---
chapter_id: ch_live_identifier_subclass_b427c0
topic_id: 1
family: 01_foundation
cited_terms: ['identifier_subclass', 'log_within_span_context', 'hipaa_safeguard_physical']
model: engine-refine
---

Identifiers function as the primary anchors of traceability within the system, each carrying a structured value such as HANDLE-1234/5678, SEQ-NF2024, SN-8842XJ, or ACCN-GSM7829104 that uniquely resolves to a target entity—telemetry-stream in the case of the first three, and calibration-run for the fourth. These identifiers are not merely labels; they are typed, attributed objects whose properties are governed by a schema layer that distinguishes attribute names from their semantic types. An attribute such as checksum_algo, code, format, or issued_date is declared with a precise type constraint—xsd:string for the former three, xsd:date for the latter—ensuring that every value bound to an attribute conforms to its declared domain before it enters the system. This separation of attribute definition from attribute value is what permits the same structural pattern to accommodate both textual metadata like Checksum Algo 01, B-12, Encoding 03, and JSON, and temporal metadata such as 2023-11-13, 2024-05-25, 2024-09-11, and 2025-05-27, without conflating the two.

**t_identifier_subclass**

| id | identifier | identifies |
| --- | --- | --- |
| IDEN-0001 | HANDLE-1234/5678 | telemetry-stream |
| IDEN-0002 | SEQ-NF2024 | telemetry-stream |
| IDEN-0003 | SN-8842XJ | telemetry-stream |
| IDEN-0004 | ACCN-GSM7829104 | calibration-run |
| IDEN-0005 | RUN-20231105 | wet-lab-sample |
| IDEN-0006 | GUID-f47ac10b | quality-control-report |
| IDEN-0007 | DOI-10.1234/abc | clinical-trial-arm |

**t_identifier_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| IDEN-0001 | checksum_algo | xsd:string |
| IDEN-0002 | code | xsd:string |
| IDEN-0003 | format | xsd:string |
| IDEN-0004 | issued_date | xsd:date |
| IDEN-0005 | namespace | xsd:string |
| IDEN-0006 | encoding | xsd:string |
| IDEN-0007 | label_text | xsd:string |
| IDEN-0008 | language | xsd:string |

The entity column in the value tables serves as the binding link between an identifier and its attributed properties, establishing that a particular identifier is the subject of a given attribute assignment. In practice, the entity_id field references the identifier record itself, creating a self-referential attribution pattern where IDEN-0001, for instance, is the entity to which the attributes checksum_algo (IDEN-0001), code (IDEN-0002), format (IDEN-0006), and issued_date (IDEN-0004) are bound. The value column—labeled misc in the schema—holds the actual data, whether drawn from the varchar or date value tables depending on the attribute type. This bifurcation of value storage by type is a deliberate normalization choice: it prevents null proliferation, enforces type safety at the storage layer, and allows the system to scale its attribute vocabulary without altering the core identifier structure.

**t_identifier_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| IDEN-0001 | IDEN-0001 | IDEN-0004 | 2023-11-13 |
| IDEN-0002 | IDEN-0002 | IDEN-0004 | 2024-05-25 |
| IDEN-0003 | IDEN-0003 | IDEN-0004 | 2024-09-11 |
| IDEN-0004 | IDEN-0004 | IDEN-0004 | 2025-05-27 |
| IDEN-0005 | IDEN-0005 | IDEN-0004 | 2023-08-09 |
| IDEN-0006 | IDEN-0006 | IDEN-0004 | 2023-03-27 |
| IDEN-0007 | IDEN-0007 | IDEN-0004 | 2023-01-25 |

**t_identifier_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| IDEN-0001 | IDEN-0001 | IDEN-0001 | Checksum Algo 01 |
| IDEN-0002 | IDEN-0001 | IDEN-0002 | B-12 |
| IDEN-0003 | IDEN-0001 | IDEN-0006 | Encoding 03 |
| IDEN-0004 | IDEN-0001 | IDEN-0003 | JSON |
| IDEN-0005 | IDEN-0001 | IDEN-0007 | pre-release note |
| IDEN-0006 | IDEN-0001 | IDEN-0008 | es |
| IDEN-0007 | IDEN-0001 | IDEN-0005 | Namespace 07 |
| IDEN-0008 | IDEN-0002 | IDEN-0001 | Checksum Algo 08 |

Beyond simple attribute binding, the system models relationships between distinct entities through junction tables that carry an explicit role column, transforming what would otherwise be undirected associations into directed, semantically rich links. In the log-to-span-context mapping, for example, a log entry such as cache-eviction.out or batch-scheduler.log is connected to a span context like user-session-4492 or us-east-1-cluster through a relationship record that specifies whether the log acts as a reviewer, observer, or contributor to that context. Similarly, the HIPAA physical safeguard framework links safeguard items—Alarm Siren System, Cabinet Lockdown Procedure, Access Control Log—to safeguard protocols—Media Disposal Protocol, Mantrap Entry, CCTV Monitoring—through relationship records that designate the safeguard as either owner or observer of the protocol. The subject and target columns in these junction tables are not arbitrary; they encode the directionality of the relationship, with subject denoting the originating entity and target denoting the recipient, while role provides the semantic label that explains why the connection exists.

**t_log_within_span_context__within_span_context**

| id | log_id | within_span_context_id | role |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0006 | CONT-0003 | reviewer |
| CONT-0002 | CONT-0005 | CONT-0004 | observer |
| CONT-0003 | CONT-0004 | CONT-0004 | contributor |
| CONT-0004 | CONT-0004 | CONT-0004 | contributor |
| CONT-0005 | CONT-0005 | CONT-0003 | observer |
| CONT-0006 | CONT-0004 | CONT-0006 | contributor |
| CONT-0007 | CONT-0004 | CONT-0005 | observer |
| CONT-0008 | CONT-0002 | CONT-0005 | reviewer |

**t_hipaa_safeguard_physical__hipaa_safeguard**

| id | hipaa_id | hipaa_safeguard_id | role |
| --- | --- | --- | --- |
| PHYS-0001 | PHYS-0006 | PHYS-0002 | owner |
| PHYS-0002 | PHYS-0004 | PHYS-0005 | reviewer |
| PHYS-0003 | PHYS-0002 | PHYS-0008 | observer |
| PHYS-0004 | PHYS-0001 | PHYS-0008 | owner |
| PHYS-0005 | PHYS-0004 | PHYS-0003 | observer |
| PHYS-0006 | PHYS-0006 | PHYS-0004 | owner |
| PHYS-0007 | PHYS-0001 | PHYS-0001 | reviewer |
| PHYS-0008 | PHYS-0002 | PHYS-0008 | contributor |

The role column, in particular, is the mechanism by which the system captures organizational and procedural semantics without hardcoding them into the data model. A single log file can participate in multiple span contexts with different roles—contributor in one, reviewer in another—reflecting the reality that operational artifacts serve multiple purposes depending on the analytical lens applied. The same principle applies to HIPAA safeguards: a Cabinet Lockdown Procedure can be the owner of one protocol and the observer of another, capturing the layered accountability structure that physical security frameworks require. This role-based relationship model means that the system does not merely store what exists; it stores how entities relate to one another, and with what authority or responsibility. The result is a data architecture where identifiers carry their own metadata, values are typed and segregated by domain, and relationships are explicit, directional, and semantically labeled—a structure that supports both auditability and flexibility in equal measure.

**t_log_within_span_context**

| id | log |
| --- | --- |
| CONT-0001 | cache-eviction.out |
| CONT-0002 | batch-scheduler.log |
| CONT-0003 | disk-io.trace |
| CONT-0004 | disk-io.trace |
| CONT-0005 | disk-io.trace |
| CONT-0006 | auth-service.warn |

**t_log_within_span_context_within_span_context**

| id | within_span_context |
| --- | --- |
| CONT-0001 | user-session-4492 |
| CONT-0002 | us-east-1-cluster |
| CONT-0003 | ml-inference-run |
| CONT-0004 | warehouse-replication |
| CONT-0005 | warehouse-replication |
| CONT-0006 | us-east-1-cluster |
| CONT-0007 | warehouse-replication |

**t_hipaa_safeguard_physical**

| id | hipaa |
| --- | --- |
| PHYS-0001 | Alarm Siren System |
| PHYS-0002 | Cabinet Lockdown Procedure |
| PHYS-0003 | Access Control Log |
| PHYS-0004 | Cabinet Lockdown Procedure |
| PHYS-0005 | Badge Printer |
| PHYS-0006 | Badge Printer |

**t_hipaa_safeguard_physical_hipaa_safeguard**

| id | hipaa_safeguard |
| --- | --- |
| PHYS-0001 | Media Disposal Protocol |
| PHYS-0002 | Mantrap Entry |
| PHYS-0003 | CCTV Monitoring |
| PHYS-0004 | Equipment Maintenance Schedule |
| PHYS-0005 | Visitor Badge System |
| PHYS-0006 | Power Redundancy Plan |
| PHYS-0007 | Equipment Maintenance Schedule |
| PHYS-0008 | Keycard Reader |