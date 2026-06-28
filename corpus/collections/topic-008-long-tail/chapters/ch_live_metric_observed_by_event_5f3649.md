---
chapter_id: ch_live_metric_observed_by_event_5f3649
topic_id: 8
family: 07_long_tail
cited_terms: ['metric_observed_by_event', 'iso27001_annexa_subclass', 'requirement_under_standard']
model: engine-refine
---

In information governance frameworks, the foundational challenge is representing heterogeneous data—numeric measurements, temporal stamps, textual annotations, and boolean flags—within a unified schema that preserves type safety while remaining extensible. The entity-attribute-value (EAV) pattern addresses this by decoupling what is measured from how it is measured. An identifier serves as the unique key for each entity, whether that entity is a performance observation such as EVEN-0001, which records Memory latency, or EVEN-0002, which captures Disk IOPS, or EVEN-0003 and EVEN-0004, which track Cache hit ratio and CPU utilization respectively. Each identifier anchors a set of attributes—confidence, dimension_kind, method, recorded_at—that describe the measurement context, and each attribute carries a declared type: xsd:decimal for numeric precision, xsd:string for categorical labels, and xsd:dateTime for temporal anchoring. This separation of attribute definition from attribute value enables the same structural skeleton to accommodate metrics of any domain without schema migration.

**t_metric_observed_by_event**

| id | metric |
| --- | --- |
| EVEN-0001 | Memory latency |
| EVEN-0002 | Disk IOPS |
| EVEN-0003 | Cache hit ratio |
| EVEN-0004 | CPU utilization |
| EVEN-0005 | Queue depth |
| EVEN-0006 | Cache hit ratio |

**t_metric_observed_by_event_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | confidence | xsd:decimal |
| EVEN-0002 | dimension_kind | xsd:string |
| EVEN-0003 | method | xsd:string |
| EVEN-0004 | recorded_at | xsd:dateTime |
| EVEN-0005 | uncertainty | xsd:decimal |
| EVEN-0006 | unit | xsd:string |
| EVEN-0007 | value | xsd:decimal |
| EVEN-0008 | encoding | xsd:string |

**t_metric_observed_by_event_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0004 | 2023-03-01T06:18:02 |
| EVEN-0002 | EVEN-0002 | EVEN-0004 | 2025-03-12T18:54:27 |
| EVEN-0003 | EVEN-0003 | EVEN-0004 | 2023-04-23T18:00:40 |
| EVEN-0004 | EVEN-0004 | EVEN-0004 | 2023-07-24T13:02:38 |
| EVEN-0005 | EVEN-0005 | EVEN-0004 | 2025-03-15T05:43:19 |
| EVEN-0006 | EVEN-0006 | EVEN-0004 | 2024-11-18T14:01:50 |

**t_metric_observed_by_event_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | 0.221 |
| EVEN-0002 | EVEN-0001 | EVEN-0005 | 966.79 |
| EVEN-0003 | EVEN-0001 | EVEN-0007 | 495.10 |
| EVEN-0004 | EVEN-0002 | EVEN-0001 | 0.669 |
| EVEN-0005 | EVEN-0002 | EVEN-0005 | 143.93 |
| EVEN-0006 | EVEN-0002 | EVEN-0007 | 270.10 |
| EVEN-0007 | EVEN-0003 | EVEN-0001 | 0.103 |
| EVEN-0008 | EVEN-0003 | EVEN-0005 | 271.02 |

**t_metric_observed_by_event_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0002 | Dimension Kind 01 |
| EVEN-0002 | EVEN-0001 | EVEN-0008 | Encoding 02 |
| EVEN-0003 | EVEN-0001 | EVEN-0009 | calibration record |
| EVEN-0004 | EVEN-0001 | EVEN-0010 | es |
| EVEN-0005 | EVEN-0001 | EVEN-0003 | manual |
| EVEN-0006 | EVEN-0001 | EVEN-0006 | mg/L |
| EVEN-0007 | EVEN-0002 | EVEN-0002 | Dimension Kind 07 |
| EVEN-0008 | EVEN-0002 | EVEN-0008 | Encoding 08 |

The attribute type declaration is not merely metadata; it governs which value store a given observation must inhabit. When an attribute is typed as xsd:decimal, its value—such as 0.221 or 966.79 or 495.10—resides in the decimal value table, linked to its entity through a foreign key on entity_id and to its attribute definition through attr_id. String-valued attributes like dimension_kind or method carry values such as Dimension Kind 01, Encoding 02, calibration record, or es into the varchar value table, while temporal attributes like recorded_at store timestamps such as 2023-03-01T06:18:02 or 2025-03-12T18:54:27 in the datetime value table. The entity_id column in each value table establishes the many-to-many relationship between entities and their typed attribute values, and the attr_id column resolves to the attribute definition, ensuring that every value is semantically anchored to a known attribute with a known type. This tripartite linkage—entity, attribute, typed value—forms the core referential integrity of the measurement model.

Beyond performance metrics, the same EAV architecture scales to regulatory and compliance artifacts. Standards such as ISO/IEC 27001, ISO/IEC 27701, and ISO 20000-1 are represented as entities in the annex subclass table, each identified by a code like ANNE-0001 or ANNE-0003. These standards are associated with specific controls—A.5.22 Cloud security, A.5.7 Threat intelligence, A.6.3 Remote working, A.8.12 Data masking—through a junction table that introduces the concept of role. A role, whether observer, reviewer, or owner, qualifies the relationship between a subject (the standard entity, referenced by iso_id) and a target (the control entity, referenced by iso27001_annex_a_id). This role-bearing association table—t_iso27001_annexa_subclass__iso27001_annex_a—transforms a simple many-to-many mapping into a semantically rich relationship where the nature of the connection is itself a first-class datum. For instance, ANNE-0003 (ISO/IEC 27701) holds the role of owner over ANNE-0007, while ANNE-0001 (ISO/IEC 27001) assumes the role of observer over both ANNE-0004 and ANNE-0003.

**t_iso27001_annexa_subclass**

| id | iso |
| --- | --- |
| ANNE-0001 | ISO/IEC 27001 |
| ANNE-0002 | ISO/IEC 27001 |
| ANNE-0003 | ISO/IEC 27701 |
| ANNE-0004 | ISO 20000-1 |
| ANNE-0005 | ISO/IEC 27701 |
| ANNE-0006 | ISO 20000-1 |

**t_iso27001_annexa_subclass_iso27001_annex_a**

| id | iso27001_annex_a |
| --- | --- |
| ANNE-0001 | A.5.22 Cloud security |
| ANNE-0002 | A.5.7 Threat intelligence |
| ANNE-0003 | A.6.3 Remote working |
| ANNE-0004 | A.8.12 Data masking |
| ANNE-0005 | A.7.4 Physical security monitoring |
| ANNE-0006 | A.5.30 Incident response |
| ANNE-0007 | A.8.22 Data leakage prevention |

**t_iso27001_annexa_subclass__iso27001_annex_a**

| id | iso_id | iso27001_annex_a_id | role |
| --- | --- | --- | --- |
| ANNE-0001 | ANNE-0003 | ANNE-0001 | observer |
| ANNE-0002 | ANNE-0001 | ANNE-0004 | reviewer |
| ANNE-0003 | ANNE-0002 | ANNE-0007 | owner |
| ANNE-0004 | ANNE-0001 | ANNE-0003 | observer |
| ANNE-0005 | ANNE-0003 | ANNE-0007 | observer |
| ANNE-0006 | ANNE-0004 | ANNE-0005 | contributor |
| ANNE-0007 | ANNE-0003 | ANNE-0001 | reviewer |
| ANNE-0008 | ANNE-0006 | ANNE-0006 | reviewer |

Requirements inherit this same structural discipline. A requirement such as Minimum sampling rate or Quality threshold or Provenance tracking or Access control policy is identified by a code like STAN-0001 through STAN-0004 and is declared to fall under a particular standard via the under_standard foreign key. The requirement's attributes—effective_date, enforcement, mandatory, priority—are defined with types xsd:date, xsd:string, xsd:boolean, and xsd:integer, and their values are distributed across five dedicated value tables. Boolean flags such as true or false indicate whether a requirement is mandatory; date values like 2024-02-08 or 2024-03-15 or 2024-09-13 or 2023-09-30 establish temporal applicability; integer values such as 3, 4, 224, or 622 encode priority levels; and varchar values like Encoding 01, Enforcement 02, audit excerpt, or de provide supplementary textual context. The entity_id in each value table again ties the value to its parent requirement, and the attr_id resolves to the attribute definition, maintaining the same referential chain that governs metric observations.

**t_requirement_under_standard_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0003 | true |
| STAN-0002 | STAN-0002 | STAN-0003 | true |
| STAN-0003 | STAN-0003 | STAN-0003 | true |
| STAN-0004 | STAN-0004 | STAN-0003 | false |
| STAN-0005 | STAN-0005 | STAN-0003 | false |
| STAN-0006 | STAN-0006 | STAN-0003 | true |

**t_requirement_under_standard_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0007 | Encoding 01 |
| STAN-0002 | STAN-0001 | STAN-0002 | Enforcement 02 |
| STAN-0003 | STAN-0001 | STAN-0008 | audit excerpt |
| STAN-0004 | STAN-0001 | STAN-0009 | de |
| STAN-0005 | STAN-0001 | STAN-0006 | Scope 05 |
| STAN-0006 | STAN-0002 | STAN-0007 | Encoding 06 |
| STAN-0007 | STAN-0002 | STAN-0002 | Enforcement 07 |
| STAN-0008 | STAN-0002 | STAN-0008 | nightly summary |

The practical significance of this architecture lies in its ability to represent both operational telemetry and governance artifacts within a single, consistent model. An auditor examining CPU utilization (EVEN-0004) can trace its recorded_at timestamp through the datetime value table, while simultaneously verifying that the underlying measurement satisfies the Quality threshold requirement (STAN-0002) under ISO/IEC 27001 (ANNE-0002), which itself carries the role of reviewer over the relevant control. The identifier, attribute, type, entity, value, role, subject, and target constructs are not abstract schema elements; they are the operational vocabulary through which an organization records what it measures, how it measures it, which standards govern those measurements, and who bears responsibility for compliance. Every value—whether 0.669, 2025-03-12T18:54:27, or audit excerpt—is a leaf node in a graph whose edges are defined by foreign keys and whose semantics are encoded in types and roles.

**t_requirement_under_standard**

| id | requirement | under_standard |
| --- | --- | --- |
| STAN-0001 | Minimum sampling rate | ANNE-0004 |
| STAN-0002 | Quality threshold | ANNE-0002 |
| STAN-0003 | Provenance tracking | ANNE-0004 |
| STAN-0004 | Access control policy | ANNE-0002 |
| STAN-0005 | Provenance tracking | ANNE-0002 |
| STAN-0006 | Access control policy | ANNE-0001 |

**t_requirement_under_standard_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAN-0001 | effective_date | xsd:date |
| STAN-0002 | enforcement | xsd:string |
| STAN-0003 | mandatory | xsd:boolean |
| STAN-0004 | priority | xsd:integer |
| STAN-0005 | review_cycle_days | xsd:integer |
| STAN-0006 | scope | xsd:string |
| STAN-0007 | encoding | xsd:string |
| STAN-0008 | label_text | xsd:string |

**t_requirement_under_standard_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0001 | 2024-02-08 |
| STAN-0002 | STAN-0002 | STAN-0001 | 2024-03-15 |
| STAN-0003 | STAN-0003 | STAN-0001 | 2024-09-13 |
| STAN-0004 | STAN-0004 | STAN-0001 | 2023-09-30 |
| STAN-0005 | STAN-0005 | STAN-0001 | 2025-02-13 |
| STAN-0006 | STAN-0006 | STAN-0001 | 2025-01-10 |

**t_requirement_under_standard_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0004 | 3 |
| STAN-0002 | STAN-0001 | STAN-0005 | 224 |
| STAN-0003 | STAN-0002 | STAN-0004 | 4 |
| STAN-0004 | STAN-0002 | STAN-0005 | 622 |
| STAN-0005 | STAN-0003 | STAN-0004 | 1 |
| STAN-0006 | STAN-0003 | STAN-0005 | 177 |
| STAN-0007 | STAN-0004 | STAN-0004 | 5 |
| STAN-0008 | STAN-0004 | STAN-0005 | 817 |