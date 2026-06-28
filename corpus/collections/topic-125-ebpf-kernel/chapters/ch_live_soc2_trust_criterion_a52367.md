---
chapter_id: ch_live_soc2_trust_criterion_a52367
topic_id: 125
family: 07_long_tail
cited_terms: ['soc2_trust_criterion', 'column_renamed_from', 'soc2_privacy_subclass']
model: engine-refine
---

The foundational unit of attribute-value modelling is the identifier, a stable key that anchors every row across the relational schema. In the SOC 2 trust criterion domain, identifiers such as CRIT-0001 through CRIT-0004 serve as the primary keys of the criterion table, each binding an organisation—CyberShield Ltd, DataVault Inc, CloudScale Services, HealthSys Networks—to a specific trust principle like auditLogging, Privacy, Security, or Availability. A parallel set of identifiers, FROM-0001 through FROM-0004, anchors the column-renaming lineage table, where each identifier links a current column name (node_cpu_load, measurement_timestamp, config_version, batch_run_id) to its predecessor (recorded_at, log_category, body_mass_index, specimen_number). A third namespace, PRIV-0001 through PRIV-0004, identifies privacy subclasses (SOC1-Control-Statement, SOC1-TypeII, SOC2-Processing-Integrity) and their associated domains (dataRetention, securityCriteria, availabilityCriteria). The strict separation of identifier namespaces prevents cross-domain collision and supports modular governance.

**t_soc2_trust_criterion**

| id | soc | soc2_trust_criterion |
| --- | --- | --- |
| CRIT-0001 | CyberShield Ltd | auditLogging |
| CRIT-0002 | DataVault Inc | Privacy |
| CRIT-0003 | CloudScale Services | Security |
| CRIT-0004 | HealthSys Networks | Availability |
| CRIT-0005 | RetailChain Partners | Availability |
| CRIT-0006 | FinTech Global | auditLogging |

**t_soc2_trust_criterion_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CRIT-0001 | effective_date | xsd:date |
| CRIT-0002 | enforcement | xsd:string |
| CRIT-0003 | mandatory | xsd:boolean |
| CRIT-0004 | priority | xsd:integer |
| CRIT-0005 | review_cycle_days | xsd:integer |
| CRIT-0006 | scope | xsd:string |
| CRIT-0007 | encoding | xsd:string |
| CRIT-0008 | label_text | xsd:string |

**t_soc2_trust_criterion_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0004 | 2 |
| CRIT-0002 | CRIT-0001 | CRIT-0005 | 749 |
| CRIT-0003 | CRIT-0002 | CRIT-0004 | 4 |
| CRIT-0004 | CRIT-0002 | CRIT-0005 | 767 |
| CRIT-0005 | CRIT-0003 | CRIT-0004 | 3 |
| CRIT-0006 | CRIT-0003 | CRIT-0005 | 559 |
| CRIT-0007 | CRIT-0004 | CRIT-0004 | 1 |
| CRIT-0008 | CRIT-0004 | CRIT-0005 | 187 |

**t_column_renamed_from**

| id | column | renamed_from |
| --- | --- | --- |
| FROM-0001 | node_cpu_load | recorded_at |
| FROM-0002 | measurement_timestamp | log_category |
| FROM-0003 | config_version | body_mass_index |
| FROM-0004 | batch_run_id | specimen_number |
| FROM-0005 | event_type | release_tag |
| FROM-0006 | patient_bmi | body_mass_index |

**t_column_renamed_from_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FROM-0001 | confidence | xsd:decimal |
| FROM-0002 | dimension_kind | xsd:string |
| FROM-0003 | method | xsd:string |
| FROM-0004 | recorded_at | xsd:dateTime |
| FROM-0005 | uncertainty | xsd:decimal |
| FROM-0006 | unit | xsd:string |
| FROM-0007 | value | xsd:decimal |
| FROM-0008 | encoding | xsd:string |

**t_soc2_privacy_subclass**

| id | soc |
| --- | --- |
| PRIV-0001 | SOC1-Control-Statement |
| PRIV-0002 | SOC1-TypeII |
| PRIV-0003 | SOC2-Processing-Integrity |
| PRIV-0004 | SOC1-TypeII |
| PRIV-0005 | SOC1-TypeII |
| PRIV-0006 | SOC2-Business-Critical |

**t_soc2_privacy_subclass_for_s_o_c2_domain**

| id | for_s_o_c2_domain |
| --- | --- |
| PRIV-0001 | dataRetention |
| PRIV-0002 | dataRetention |
| PRIV-0003 | securityCriteria |
| PRIV-0004 | availabilityCriteria |
| PRIV-0005 | Information Protection |
| PRIV-0006 | auditLogging |

An attribute defines the semantic dimension along which an entity is described, while the attribute type constrains the admissible value space to a precise XML Schema datatype. The attribute table records names such as effective_date, enforcement, mandatory, and priority, each paired with a type annotation—xsd:date, xsd:string, xsd:boolean, xsd:integer—that governs validation at ingestion time. In the column-renaming lineage, attributes include confidence (xsd:decimal), dimension_kind (xsd:string), method (xsd:string), and recorded_at (xsd:dateTime). The type discipline is not merely declarative; it determines which value table receives a given assignment. A boolean attribute routes to the val_boolean table, a date attribute to val_date, an integer attribute to val_int, and so forth. This type-driven dispatch ensures that the value store remains homogeneous within each partition, simplifying both query execution and schema evolution.

The entity column in each value table establishes the foreign-key relationship between a stored value and the entity to which it pertains. In the SOC 2 criterion value tables, entity_id references the same identifier namespace as the criterion table itself—CRIT-0001, for instance, appears as an entity_id in val_boolean, val_date, val_int, and val_varchar, thereby accumulating a multi-attribute profile. The same pattern holds in the column-renaming lineage: FROM-0001 surfaces as an entity_id across val_datetime, val_decimal, and val_varchar, accumulating temporal, numeric, and textual metadata. The entity column thus functions as the join key that reconstructs a complete attribute-value record for any given entity, even though the values are physically scattered across type-specific tables.

**t_soc2_trust_criterion_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0003 | false |
| CRIT-0002 | CRIT-0002 | CRIT-0003 | false |
| CRIT-0003 | CRIT-0003 | CRIT-0003 | true |
| CRIT-0004 | CRIT-0004 | CRIT-0003 | false |
| CRIT-0005 | CRIT-0005 | CRIT-0003 | false |
| CRIT-0006 | CRIT-0006 | CRIT-0003 | false |

**t_soc2_trust_criterion_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0001 | 2025-04-05 |
| CRIT-0002 | CRIT-0002 | CRIT-0001 | 2024-03-02 |
| CRIT-0003 | CRIT-0003 | CRIT-0001 | 2023-07-21 |
| CRIT-0004 | CRIT-0004 | CRIT-0001 | 2023-05-30 |
| CRIT-0005 | CRIT-0005 | CRIT-0001 | 2023-01-08 |
| CRIT-0006 | CRIT-0006 | CRIT-0001 | 2024-01-19 |

**t_soc2_trust_criterion_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0007 | Encoding 01 |
| CRIT-0002 | CRIT-0001 | CRIT-0002 | Enforcement 02 |
| CRIT-0003 | CRIT-0001 | CRIT-0008 | change rationale |
| CRIT-0004 | CRIT-0001 | CRIT-0009 | en |
| CRIT-0005 | CRIT-0001 | CRIT-0006 | Scope 05 |
| CRIT-0006 | CRIT-0002 | CRIT-0007 | Encoding 06 |
| CRIT-0007 | CRIT-0002 | CRIT-0002 | Enforcement 07 |
| CRIT-0008 | CRIT-0002 | CRIT-0008 | audit excerpt |

**t_column_renamed_from_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0001 | FROM-0004 | 2025-03-21T00:09:12 |
| FROM-0002 | FROM-0002 | FROM-0004 | 2023-10-22T03:45:48 |
| FROM-0003 | FROM-0003 | FROM-0004 | 2023-09-09T06:02:35 |
| FROM-0004 | FROM-0004 | FROM-0004 | 2024-12-05T07:04:23 |
| FROM-0005 | FROM-0005 | FROM-0004 | 2023-10-09T20:16:15 |
| FROM-0006 | FROM-0006 | FROM-0004 | 2024-04-24T12:53:41 |

**t_column_renamed_from_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0001 | FROM-0001 | 0.429 |
| FROM-0002 | FROM-0001 | FROM-0005 | 695.20 |
| FROM-0003 | FROM-0001 | FROM-0007 | 442.17 |
| FROM-0004 | FROM-0002 | FROM-0001 | 0.690 |
| FROM-0005 | FROM-0002 | FROM-0005 | 345.70 |
| FROM-0006 | FROM-0002 | FROM-0007 | 542.71 |
| FROM-0007 | FROM-0003 | FROM-0001 | 0.828 |
| FROM-0008 | FROM-0003 | FROM-0005 | 957.60 |

**t_column_renamed_from_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0001 | FROM-0002 | Dimension Kind 01 |
| FROM-0002 | FROM-0001 | FROM-0008 | Encoding 02 |
| FROM-0003 | FROM-0001 | FROM-0009 | audit excerpt |
| FROM-0004 | FROM-0001 | FROM-0010 | fr |
| FROM-0005 | FROM-0001 | FROM-0003 | manual |
| FROM-0006 | FROM-0001 | FROM-0006 | deg_C |
| FROM-0007 | FROM-0002 | FROM-0002 | Dimension Kind 07 |
| FROM-0008 | FROM-0002 | FROM-0008 | Encoding 08 |

The misc column—so named to reflect its heterogeneous, type-dependent content—holds the actual data values. Within val_boolean, misc contains literals such as false and true, encoding whether a criterion like mandatory is enforced for a given entity. The val_date table stores dates like 2025-04-05, 2024-03-02, 2023-07-21, and 2023-05-30, each representing an effective_date for a criterion. Integer values in val_int include 2, 749, 4, and 767, corresponding to priority levels assigned to entities. The varchar value tables carry strings such as Encoding 01, Enforcement 02, change rationale, and en, as well as Dimension Kind 01, audit excerpt, and fr. In the decimal partition, misc holds 0.429, 695.20, 442.17, and 0.690, while the datetime partition stores timestamps like 2025-03-21T00:09:12 and 2023-10-22T03:45:48. The misc column is the sole carrier of domain data; all other columns in value tables serve structural or referential purposes.

The subject–target–role triad governs the assignment of responsibilities across domain boundaries. The junction table t_soc2_privacy_subclass__for_s_o_c2_domain maps a subject (soc_id) to a target (for_s_o_c2_domain_id) through a role column that specifies the nature of the association. In the observed data, the role is consistently contributor, with one exception where the role is owner. The subject PRIV-0003 links to targets PRIV-0001 and PRIV-0003, while PRIV-0006 and PRIV-0002 each contribute to targets PRIV-0005 and PRIV-0006 respectively. This three-column structure decouples the identity of the responsible party (subject) from the scope of responsibility (target) and the capacity in which the party acts (role), enabling fine-grained access control and audit trails without embedding role semantics into either the subject or target tables.

**t_soc2_privacy_subclass__for_s_o_c2_domain**

| id | soc_id | for_s_o_c2_domain_id | role |
| --- | --- | --- | --- |
| PRIV-0001 | PRIV-0003 | PRIV-0001 | contributor |
| PRIV-0002 | PRIV-0006 | PRIV-0005 | contributor |
| PRIV-0003 | PRIV-0003 | PRIV-0003 | owner |
| PRIV-0004 | PRIV-0002 | PRIV-0006 | contributor |
| PRIV-0005 | PRIV-0003 | PRIV-0003 | contributor |
| PRIV-0006 | PRIV-0005 | PRIV-0006 | contributor |
| PRIV-0007 | PRIV-0006 | PRIV-0003 | observer |
| PRIV-0008 | PRIV-0002 | PRIV-0002 | observer |