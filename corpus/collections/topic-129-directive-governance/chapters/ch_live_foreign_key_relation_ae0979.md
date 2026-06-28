---
chapter_id: ch_live_foreign_key_relation_ae0979
topic_id: 129
family: 07_long_tail
cited_terms: ['foreign_key_relation', 'verification_min_one_evidence', 'directive_not_superseded']
model: engine-refine
---

The foundational architecture of the governance framework rests upon a disciplined separation of entity, attribute, and value, wherein each entity functions as a discrete subject of compliance or operational concern, and attributes serve as the named dimensions along which those entities are measured and assessed. An entity—whether a verification procedure such as the ISO27001 Compliance Audit, the Data Lineage Trace, or the Schema Migration Validation, or a regulatory directive such as the WHO Manufacturing Guide, the EPA Emission Standard, or the OSHA Lockout Protocol—constitutes the primary unit of accountability. Each entity is assigned a unique identifier, encoded as a prefixed code such as EVID-0001 or SUPE-0001, which serves as the stable reference point across all subsequent attribute-value associations. Attributes themselves are declared with explicit names and typed schemas: duration_seconds and end_time, exit_code and host_name, effective_date, enforcement, mandatory, and priority, each bound to a precise data type—xsd:decimal, xsd:dateTime, xsd:integer, xsd:string, or xsd:boolean—ensuring that every value recorded against an attribute is semantically coherent and machine-verifiable.

**t_verification_min_one_evidence**

| id | verification | produces_evidence |
| --- | --- | --- |
| EVID-0001 | ISO27001 Compliance Audit | RELA-0008 |
| EVID-0002 | Data Lineage Trace | RELA-0001 |
| EVID-0003 | Cryptographic Signature Check | RELA-0001 |
| EVID-0004 | Schema Migration Validation | RELA-0005 |
| EVID-0005 | Data Lineage Trace | RELA-0008 |
| EVID-0006 | Schema Migration Validation | RELA-0005 |

**t_verification_min_one_evidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVID-0001 | duration_seconds | xsd:decimal |
| EVID-0002 | end_time | xsd:dateTime |
| EVID-0003 | exit_code | xsd:integer |
| EVID-0004 | host_name | xsd:string |
| EVID-0005 | log_level | xsd:string |
| EVID-0006 | phase | xsd:string |
| EVID-0007 | retry_count | xsd:integer |
| EVID-0008 | scheduled_at | xsd:dateTime |

**t_verification_min_one_evidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0002 | 2023-07-04T07:08:55 |
| EVID-0002 | EVID-0001 | EVID-0008 | 2025-01-31T12:45:17 |
| EVID-0003 | EVID-0001 | EVID-0009 | 2025-03-23T07:51:24 |
| EVID-0004 | EVID-0002 | EVID-0002 | 2023-01-29T08:52:43 |
| EVID-0005 | EVID-0002 | EVID-0008 | 2025-02-10T17:00:11 |
| EVID-0006 | EVID-0002 | EVID-0009 | 2023-01-05T10:52:26 |
| EVID-0007 | EVID-0003 | EVID-0002 | 2023-12-08T22:39:20 |
| EVID-0008 | EVID-0003 | EVID-0008 | 2023-06-23T05:07:56 |

**t_verification_min_one_evidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0001 | 2280.75 |
| EVID-0002 | EVID-0002 | EVID-0001 | 2844.65 |
| EVID-0003 | EVID-0003 | EVID-0001 | 2804.04 |
| EVID-0004 | EVID-0004 | EVID-0001 | 5144.39 |
| EVID-0005 | EVID-0005 | EVID-0001 | 1607.16 |
| EVID-0006 | EVID-0006 | EVID-0001 | 959.65 |

**t_verification_min_one_evidence_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0003 | 414 |
| EVID-0002 | EVID-0001 | EVID-0007 | 360 |
| EVID-0003 | EVID-0002 | EVID-0003 | 47 |
| EVID-0004 | EVID-0002 | EVID-0007 | 492 |
| EVID-0005 | EVID-0003 | EVID-0003 | 443 |
| EVID-0006 | EVID-0003 | EVID-0007 | 122 |
| EVID-0007 | EVID-0004 | EVID-0003 | 839 |
| EVID-0008 | EVID-0004 | EVID-0007 | 199 |

**t_verification_min_one_evidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0004 | node-a01 |
| EVID-0002 | EVID-0001 | EVID-0005 | Log Level 02 |
| EVID-0003 | EVID-0001 | EVID-0006 | review |
| EVID-0004 | EVID-0001 | EVID-0010 | failed |
| EVID-0005 | EVID-0001 | EVID-0011 | Triggered By 05 |
| EVID-0006 | EVID-0002 | EVID-0004 | edge-03 |
| EVID-0007 | EVID-0002 | EVID-0005 | Log Level 07 |
| EVID-0008 | EVID-0002 | EVID-0006 | closeout |

**t_directive_not_superseded**

| id | directive | directive_2 |
| --- | --- | --- |
| SUPE-0001 | WHO Manufacturing Guide | ISO Quality Management |
| SUPE-0002 | WHO Manufacturing Guide | ISO Information Standard |
| SUPE-0003 | EPA Emission Standard | ISO Information Standard |
| SUPE-0004 | OSHA Lockout Protocol | CISA Operational Order |
| SUPE-0005 | GLP Laboratory Practice | CISA Operational Order |
| SUPE-0006 | FDA Electronic Records | SOC Audit Standard |

**t_directive_not_superseded_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUPE-0001 | effective_date | xsd:date |
| SUPE-0002 | enforcement | xsd:string |
| SUPE-0003 | mandatory | xsd:boolean |
| SUPE-0004 | priority | xsd:integer |
| SUPE-0005 | review_cycle_days | xsd:integer |
| SUPE-0006 | scope | xsd:string |
| SUPE-0007 | encoding | xsd:string |
| SUPE-0008 | label_text | xsd:string |

**t_directive_not_superseded_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUPE-0001 | SUPE-0001 | SUPE-0003 | false |
| SUPE-0002 | SUPE-0002 | SUPE-0003 | true |
| SUPE-0003 | SUPE-0003 | SUPE-0003 | false |
| SUPE-0004 | SUPE-0004 | SUPE-0003 | false |
| SUPE-0005 | SUPE-0005 | SUPE-0003 | true |
| SUPE-0006 | SUPE-0006 | SUPE-0003 | true |

**t_directive_not_superseded_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUPE-0001 | SUPE-0001 | SUPE-0001 | 2023-02-05 |
| SUPE-0002 | SUPE-0002 | SUPE-0001 | 2025-04-26 |
| SUPE-0003 | SUPE-0003 | SUPE-0001 | 2023-02-14 |
| SUPE-0004 | SUPE-0004 | SUPE-0001 | 2025-06-15 |
| SUPE-0005 | SUPE-0005 | SUPE-0001 | 2023-09-27 |
| SUPE-0006 | SUPE-0006 | SUPE-0001 | 2024-06-22 |

**t_directive_not_superseded_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUPE-0001 | SUPE-0001 | SUPE-0004 | 4 |
| SUPE-0002 | SUPE-0001 | SUPE-0005 | 434 |
| SUPE-0003 | SUPE-0002 | SUPE-0004 | 3 |
| SUPE-0004 | SUPE-0002 | SUPE-0005 | 471 |
| SUPE-0005 | SUPE-0003 | SUPE-0004 | 4 |
| SUPE-0006 | SUPE-0003 | SUPE-0005 | 762 |
| SUPE-0007 | SUPE-0004 | SUPE-0004 | 3 |
| SUPE-0008 | SUPE-0004 | SUPE-0005 | 766 |

**t_directive_not_superseded_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUPE-0001 | SUPE-0001 | SUPE-0007 | Encoding 01 |
| SUPE-0002 | SUPE-0001 | SUPE-0002 | Enforcement 02 |
| SUPE-0003 | SUPE-0001 | SUPE-0008 | pre-release note |
| SUPE-0004 | SUPE-0001 | SUPE-0009 | ja |
| SUPE-0005 | SUPE-0001 | SUPE-0006 | Scope 05 |
| SUPE-0006 | SUPE-0002 | SUPE-0007 | Encoding 06 |
| SUPE-0007 | SUPE-0002 | SUPE-0002 | Enforcement 07 |
| SUPE-0008 | SUPE-0002 | SUPE-0008 | change rationale |

The value storage mechanism employs a type-dispatched normalization strategy, wherein attribute values are partitioned into dedicated tables according to their declared type, thereby preserving type integrity while maintaining a unified logical model. Decimal-valued attributes such as duration_seconds carry magnitudes ranging from 2280.75 to 5144.39, reflecting the quantitative span of verification processes; datetime-valued attributes such as end_time record temporal boundaries with precision to the second, as in 2023-07-04T07:08:55 and 2025-01-31T12:45:17; integer-valued attributes capture discrete counts and codes, including 414, 360, 47, and 492; and varchar-valued attributes store free-form descriptors such as node-a01, Log Level 02, review, and failed, alongside directive metadata including Encoding 01, Enforcement 02, pre-release note, and ja. This typed partitioning ensures that validation rules can be enforced at the storage layer, preventing type coercion errors and enabling efficient indexing by value domain.

Foreign key relationships within the framework are modeled through a tripartite structure that explicitly distinguishes the source entity, the target entity, and the semantic role of the association. Relations such as RELA-0001 through RELA-0004 connect source tables—including batch_workflows, config_snapshots, metric_snapshots, and schema_versions—to target tables such as system_clocks, schema_definitions, data_lake_catalog, and core_products. The role attribute, taking values of owner or contributor, clarifies the nature of the dependency: an owner relationship denotes a structural or authoritative linkage, whereas a contributor relationship indicates a participatory or supplementary dependency. This explicit role annotation transforms what would otherwise be an opaque referential constraint into a governed semantic assertion, enabling downstream tools to reason about dependency directionality and impact propagation.

**t_foreign_key_relation**

| id | foreign |
| --- | --- |
| RELA-0001 | batch_workflows |
| RELA-0002 | config_snapshots |
| RELA-0003 | metric_snapshots |
| RELA-0004 | schema_versions |
| RELA-0005 | query_executions |
| RELA-0006 | batch_workflows |
| RELA-0007 | data_ingestion_jobs |
| RELA-0008 | metric_snapshots |

**t_foreign_key_relation_foreign_key_to**

| id | foreign_key_to |
| --- | --- |
| RELA-0001 | system_clocks |
| RELA-0002 | schema_definitions |
| RELA-0003 | data_lake_catalog |
| RELA-0004 | core_products |
| RELA-0005 | identity_provider |
| RELA-0006 | data_lake_catalog |

**t_foreign_key_relation__foreign_key_to**

| id | foreign_id | foreign_key_to_id | role |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0003 | RELA-0005 | owner |
| RELA-0002 | RELA-0003 | RELA-0006 | owner |
| RELA-0003 | RELA-0007 | RELA-0006 | contributor |
| RELA-0004 | RELA-0006 | RELA-0002 | contributor |
| RELA-0005 | RELA-0008 | RELA-0004 | owner |
| RELA-0006 | RELA-0007 | RELA-0003 | owner |
| RELA-0007 | RELA-0004 | RELA-0002 | owner |
| RELA-0008 | RELA-0005 | RELA-0001 | owner |

The directive hierarchy further demonstrates the framework's capacity to model inter-regulatory relationships, wherein directives such as the WHO Manufacturing Guide and the EPA Emission Standard are linked to their subordinate or superseding counterparts—ISO Quality Management, ISO Information Standard, and CISA Operational Order—through the directive_2 column. Boolean attributes such as mandatory, with values of true and false, encode the enforceability of each linkage; integer attributes such as priority, with values ranging from 3 to 471, establish a ranking mechanism for conflict resolution; and date attributes such as effective_date, recording values from 2023-02-05 to 2025-06-15, anchor each directive in a temporal governance timeline. The evidence produced by verification procedures is itself traceable to specific relations: the ISO27001 Compliance Audit produces evidence identified as RELA-0008 and RELA-0001, the Data Lineage Trace produces RELA-0001, and the Cryptographic Signature Check likewise produces RELA-0001, creating a closed audit trail from verification action through relational evidence to attribute-level detail.