---
chapter_id: ch_live_hipaa_safeguard_physical_c583c5
topic_id: 1
family: 07_long_tail
cited_terms: ['hipaa_safeguard_physical', 'process_produces_ice', 'policy_supersedes']
model: engine-refine
---

Within compliance and operational data models, identifiers serve as the immutable anchors of every record, ensuring that each safeguard, process, or policy can be unambiguously referenced across the entire system. Physical safeguards are distinguished by codes such as PHYS-0001 through PHYS-0004, while ice-producing processes carry identifiers like ICE-0001 through ICE-0004, and policy supersession records are labeled SUPE-0001 through SUPE-0004. These identifiers are not merely labels; they are the primary keys that enable relational integrity across tables, allowing a single safeguard such as the Cabinet Lockdown Procedure (PHYS-0004) to be referenced consistently whether it appears as a standalone physical control or as the subject of a supersession relationship pointing to the Incident Response Protocol.

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

**t_process_produces_ice**

| id | process |
| --- | --- |
| ICE-0001 | Plate freezing |
| ICE-0002 | Cryogenic freezing |
| ICE-0003 | Spray cooling |
| ICE-0004 | Direct expansion freezing |
| ICE-0005 | Directional solidification |
| ICE-0006 | Spiral freezing |

Attributes and their associated types define the dimensional structure of every entity, establishing both the semantics and the data discipline of measured or recorded properties. A process that produces ice may carry a duration_seconds attribute typed as xsd:decimal, an end_time attribute typed as xsd:dateTime, an exit_code typed as xsd:integer, and a host_name typed as xsd:string. The type system enforces value constraints: decimal values such as 5646.64 or 6078.60 populate the duration_seconds column, datetime values such as 2024-12-21T05:38:52 or 2023-10-15T09:29:56 populate the end_time column, integer values such as 140, 235, 217, or 99 populate the exit_code column, and string values such as ingest-21, Log Level 02, initiation, or running populate the host_name column. This separation of attribute definition from value storage—where attr_name and attr_type are declared once in the attribute catalog and values are distributed across type-specific tables keyed by entity_id and attr_id—preserves schema stability while accommodating the heterogeneity of real-world measurements.

**t_process_produces_ice_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ICE-0001 | duration_seconds | xsd:decimal |
| ICE-0002 | end_time | xsd:dateTime |
| ICE-0003 | exit_code | xsd:integer |
| ICE-0004 | host_name | xsd:string |
| ICE-0005 | log_level | xsd:string |
| ICE-0006 | phase | xsd:string |
| ICE-0007 | retry_count | xsd:integer |
| ICE-0008 | scheduled_at | xsd:dateTime |

**t_process_produces_ice_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0002 | 2024-12-21T05:38:52 |
| ICE-0002 | ICE-0001 | ICE-0008 | 2023-10-15T09:29:56 |
| ICE-0003 | ICE-0001 | ICE-0009 | 2023-08-06T18:23:28 |
| ICE-0004 | ICE-0002 | ICE-0002 | 2023-05-16T09:39:52 |
| ICE-0005 | ICE-0002 | ICE-0008 | 2023-09-23T10:34:19 |
| ICE-0006 | ICE-0002 | ICE-0009 | 2025-02-04T21:26:44 |
| ICE-0007 | ICE-0003 | ICE-0002 | 2023-02-04T12:13:18 |
| ICE-0008 | ICE-0003 | ICE-0008 | 2024-02-01T06:54:56 |

**t_process_produces_ice_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0001 | 5646.64 |
| ICE-0002 | ICE-0002 | ICE-0001 | 6078.60 |
| ICE-0003 | ICE-0003 | ICE-0001 | 2298.30 |
| ICE-0004 | ICE-0004 | ICE-0001 | 3884.97 |
| ICE-0005 | ICE-0005 | ICE-0001 | 5116.46 |
| ICE-0006 | ICE-0006 | ICE-0001 | 5090.16 |

**t_process_produces_ice_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0003 | 140 |
| ICE-0002 | ICE-0001 | ICE-0007 | 235 |
| ICE-0003 | ICE-0002 | ICE-0003 | 217 |
| ICE-0004 | ICE-0002 | ICE-0007 | 99 |
| ICE-0005 | ICE-0003 | ICE-0003 | 880 |
| ICE-0006 | ICE-0003 | ICE-0007 | 326 |
| ICE-0007 | ICE-0004 | ICE-0003 | 176 |
| ICE-0008 | ICE-0004 | ICE-0007 | 291 |

**t_process_produces_ice_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0004 | ingest-21 |
| ICE-0002 | ICE-0001 | ICE-0005 | Log Level 02 |
| ICE-0003 | ICE-0001 | ICE-0006 | initiation |
| ICE-0004 | ICE-0001 | ICE-0010 | running |
| ICE-0005 | ICE-0001 | ICE-0011 | Triggered By 05 |
| ICE-0006 | ICE-0002 | ICE-0004 | edge-03 |
| ICE-0007 | ICE-0002 | ICE-0005 | Log Level 07 |
| ICE-0008 | ICE-0002 | ICE-0006 | closeout |

Entities are the concrete instances to which attributes are bound, and they exist independently of any single attribute value. The entity_id column in each value table establishes this binding: entity ICE-0001, for example, carries a duration of 5646.64 seconds, an end_time of 2024-12-21T05:38:52, an exit_code of 140, and a host_name of ingest-21, while entity ICE-0002 carries a duration of 6078.60 seconds, an end_time of 2023-05-16T09:39:52, an exit_code of 217, and a host_name of Log Level 02. The misc column in these value tables is the generic container for the actual measurement, its meaning entirely dependent on the attr_id it is paired with and the attr_type that governs its interpretation. This design permits a single entity to accumulate a rich, multi-dimensional profile without requiring a monolithic row structure.

Subject, target, and role constitute the relational fabric that connects entities into meaningful operational relationships. In the junction table linking physical safeguards to specific HIPAA safeguards, the subject column (hipaa_id) identifies the originating safeguard—PHYS-0006, PHYS-0004, PHYS-0002, or PHYS-0001—while the target column (hipaa_safeguard_id) identifies the dependent safeguard—PHYS-0002, PHYS-0005, or PHYS-0008—and the role column assigns the functional relationship between them, taking values such as owner, reviewer, or observer. The same pattern recurs in the policy supersession table, where the subject (policy) such as Privacy Impact Assessment or Incident Response Protocol points to the supersedes target such as PHYS-0006 or PHYS-0005, establishing a chain of regulatory precedence.

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

Review cycle days and language complete the governance metadata attached to policy relationships. The review_cycle_days column encodes the frequency with which a supersession relationship must be re-evaluated, ranging from 131 days for the Incident Response Protocol (SUPE-0002) to 716 days for the Data Residency Rule (SUPE-0003), with intermediate values of 262 and 336 days governing other entries. The language column, uniformly es across the observed records, specifies the linguistic jurisdiction of the policy documentation, ensuring that compliance artifacts are traceable to their authoritative textual form. Together, these fields transform a simple pointer between two policy identifiers into a fully governed relationship with temporal and linguistic constraints.

**t_policy_supersedes**

| id | policy | supersedes | review_cycle_days | language |
| --- | --- | --- | --- | --- |
| SUPE-0001 | Privacy Impact Assessment | PHYS-0006 | 262 | es |
| SUPE-0002 | Incident Response Protocol | PHYS-0005 | 131 | es |
| SUPE-0003 | Data Residency Rule | PHYS-0004 | 716 | es |
| SUPE-0004 | Incident Response Protocol | PHYS-0006 | 336 | es |