---
chapter_id: ch_live_subclass_basic_4f7485
topic_id: 35
family: 01_foundation
cited_terms: ['subclass_basic', 'dataset_was_generated_by', 'institutional_vision_statement']
model: engine-refine
---

In metadata governance and institutional compliance frameworks, stable identifiers anchor every assertion that must survive audit, migration, and cross-system reconciliation. An identifier such as STAT-0001 or GENE-0003 is not merely a surrogate key but a durable handle by which policies, provenance chains, and classification taxonomies remain addressable when display labels change or when the same conceptual object is referenced from multiple registries. Subclass records illustrate the pattern at the terminological layer: TSUB-0001 denotes ISO 8601 timestamp as a primary subject while pairing it with Query execution engine as a secondary axis, whereas TSUB-0002 links Parquet row group to Kestrel telemetry probe—demonstrating that subject fields encode the governed concept itself, not the row that stores it, and that paired subject dimensions support orthogonal typing when a single category must be situated within both a data-format lineage and an operational instrument context.

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

Entities constitute the governed objects to which attributes attach and from which compliance obligations propagate. An institutional vision statement—Community Impact Vision, Future-First Learning, Global Excellence Framework, Campus 2030 Blueprint—functions as an entity in this sense: each is a first-class policy artifact that can accumulate typed metadata, bind to measurable educational goals such as Student Retention Improvement or Curriculum Modernization, and declare which stakeholdergroup it addresses, whether Research Faculty, Accrediting Bodies, Alumni Network, or Local Community. The separation between the entity (the statement as a whole) and its attr declarations (effective_date, enforcement, mandatory, priority) permits schema designers to define attribute semantics once while permitting many entities to inherit the same constraint vocabulary; attr_type then governs validation and storage routing, so that xsd:date values land in date-valued stores, xsd:boolean in boolean stores, xsd:integer in integer stores, and xsd:string in varchar stores, with misc holding the literal payload—true for mandatory on STAT-0001 and STAT-0002 but false on STAT-0003 and STAT-0004, effective dates ranging from 2023-06-25 through 2023-10-19, priority integers from 2 to 753, and enforcement strings such as Encoding 01 or nightly summary. This typed decomposition prevents silent coercion errors during reporting and ensures that enforcement metadata (ja, Enforcement 02) remains queryable under the same attr contract as calendar-bound activation rules.

**t_institutional_vision_statement_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAT-0001 | effective_date | xsd:date |
| STAT-0002 | enforcement | xsd:string |
| STAT-0003 | mandatory | xsd:boolean |
| STAT-0004 | priority | xsd:integer |
| STAT-0005 | review_cycle_days | xsd:integer |
| STAT-0006 | scope | xsd:string |
| STAT-0007 | encoding | xsd:string |
| STAT-0008 | label_text | xsd:string |

**t_institutional_vision_statement_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0003 | true |
| STAT-0002 | STAT-0002 | STAT-0003 | true |
| STAT-0003 | STAT-0003 | STAT-0003 | false |
| STAT-0004 | STAT-0004 | STAT-0003 | false |
| STAT-0005 | STAT-0005 | STAT-0003 | true |
| STAT-0006 | STAT-0006 | STAT-0003 | false |
| STAT-0007 | STAT-0007 | STAT-0003 | false |

**t_institutional_vision_statement_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0001 | 2023-09-09 |
| STAT-0002 | STAT-0002 | STAT-0001 | 2023-09-20 |
| STAT-0003 | STAT-0003 | STAT-0001 | 2023-06-25 |
| STAT-0004 | STAT-0004 | STAT-0001 | 2023-10-19 |
| STAT-0005 | STAT-0005 | STAT-0001 | 2024-08-06 |
| STAT-0006 | STAT-0006 | STAT-0001 | 2024-01-23 |
| STAT-0007 | STAT-0007 | STAT-0001 | 2025-03-30 |

**t_institutional_vision_statement_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0004 | 5 |
| STAT-0002 | STAT-0001 | STAT-0005 | 753 |
| STAT-0003 | STAT-0002 | STAT-0004 | 2 |
| STAT-0004 | STAT-0002 | STAT-0005 | 439 |
| STAT-0005 | STAT-0003 | STAT-0004 | 5 |
| STAT-0006 | STAT-0003 | STAT-0005 | 277 |
| STAT-0007 | STAT-0004 | STAT-0004 | 5 |
| STAT-0008 | STAT-0004 | STAT-0005 | 639 |

**t_institutional_vision_statement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0007 | Encoding 01 |
| STAT-0002 | STAT-0001 | STAT-0002 | Enforcement 02 |
| STAT-0003 | STAT-0001 | STAT-0008 | nightly summary |
| STAT-0004 | STAT-0001 | STAT-0009 | ja |
| STAT-0005 | STAT-0001 | STAT-0006 | Scope 05 |
| STAT-0006 | STAT-0002 | STAT-0007 | Encoding 06 |
| STAT-0007 | STAT-0002 | STAT-0002 | Enforcement 07 |
| STAT-0008 | STAT-0002 | STAT-0008 | nightly summary |

Educationalgoal and stakeholdergroup fields translate abstract vision language into accountable scope. When Future-First Learning targets Faculty Development Program and addresses Accrediting Bodies, the framework makes explicit both the outcome the institution intends to measure and the audience whose expectations the statement must satisfy; Global Excellence Framework’s pairing with Curriculum Modernization and Alumni Network likewise ties curricular reform to an external constituency whose engagement metrics may gate accreditation or advancement narratives. Such bindings matter in practice because auditors and portfolio reviewers do not evaluate vision prose in isolation—they trace whether each statement’s goals are populated, whether stakeholder coverage is complete, and whether attribute values (priority 5 versus 439, mandatory true versus false) align with the stated goal’s risk tier. Identifier cross-referencing across value tables further shows that a single entity may carry multiple attributes simultaneously: STAT-0001 holds both a priority integer and varchar enforcement tokens, illustrating that entity–attr cardinality is many-to-many and that misc values are always interpreted in the context of their attr_id and attr_type, not as free text.

**t_institutional_vision_statement**

| id | institutional_vision_statement | targets_goal | addresses_stakeholder |
| --- | --- | --- | --- |
| STAT-0001 | Community Impact Vision | Student Retention Improvement | Research Faculty |
| STAT-0002 | Future-First Learning | Faculty Development Program | Accrediting Bodies |
| STAT-0003 | Global Excellence Framework | Curriculum Modernization | Alumni Network |
| STAT-0004 | Campus 2030 Blueprint | Alumni Engagement Metric | Local Community |
| STAT-0005 | Open Access Roadmap | Research Output Expansion | Undergraduate Cohort |
| STAT-0006 | Global Excellence Framework | Curriculum Modernization | Administrative Staff |
| STAT-0007 | Next-Gen Research Mandate | Inclusive Access Expansion | K-12 Pipeline |

Subject and target complete the relational vocabulary for lineage and junction semantics outside the institutional policy core. In provenance modeling, a dataset such as supply-chain-manifest or genomic-variant-call is situated as a subject linked to a target representing the generating agent—edge-compute-node, telemetry-collector, or ml-training-runner—with role qualifying the nature of participation: observer for one GENE pairing, contributor for others where the same telemetry-collector or ml-training-runner recurs across distinct generation events. The pattern mirrors governance joins in which entity_id and attr_id bind misc values, except that here subject and target orient a directional dependency (dataset was generated by agent) rather than a property assertion. Remote sensing platform paired with Atmospheric instrument under TSUB-0003, and Edge gateway node under TSUB-0004, extend the same subject vocabulary into instrument and platform taxonomies that provenance records may later cite when satellite-imagery-stack or lab-culture-growth datasets enter a catalog.

**t_dataset_was_generated_by**

| id | dataset |
| --- | --- |
| GENE-0001 | supply-chain-manifest |
| GENE-0002 | satellite-imagery-stack |
| GENE-0003 | lab-culture-growth |
| GENE-0004 | genomic-variant-call |
| GENE-0005 | lab-culture-growth |
| GENE-0006 | genomic-variant-call |
| GENE-0007 | patient-vitals-csv |
| GENE-0008 | telemetry-sensor-readings |

**t_dataset_was_generated_by_was_generated_by**

| id | was_generated_by |
| --- | --- |
| GENE-0001 | edge-compute-node |
| GENE-0002 | telemetry-collector |
| GENE-0003 | ml-training-runner |
| GENE-0004 | telemetry-collector |
| GENE-0005 | kafka-ingestion-job |
| GENE-0006 | batch-cleanup-script |

**t_dataset_was_generated_by__was_generated_by**

| id | dataset_id | was_generated_by_id | role |
| --- | --- | --- | --- |
| GENE-0001 | GENE-0003 | GENE-0002 | observer |
| GENE-0002 | GENE-0001 | GENE-0002 | contributor |
| GENE-0003 | GENE-0003 | GENE-0003 | contributor |
| GENE-0004 | GENE-0005 | GENE-0001 | contributor |
| GENE-0005 | GENE-0004 | GENE-0003 | observer |
| GENE-0006 | GENE-0005 | GENE-0004 | reviewer |
| GENE-0007 | GENE-0002 | GENE-0002 | reviewer |
| GENE-0008 | GENE-0007 | GENE-0006 | observer |

Operationally, these constructs interlock so that classification (subject), accountability (entity, educationalgoal, stakeholdergroup), typed extensibility (attr, attr_type, misc), and operational attribution (subject, target, role) can be validated, versioned, and reported within a single compliance posture. Identifiers thread the layers: GENE-0003 appears as both a dataset identifier and a participant in contributor relationships, while STAT identifiers unify vision statements with their effective_date and mandatory flags. Practitioners rely on this structure to enforce that boolean mandatory attributes cannot be omitted for statements claiming Accrediting Bodies scope, that date-typed effective_date values establish temporal jurisdiction before enforcement strings take effect, and that contributor roles distinguish passive observation from active generation in telemetry and ML pipelines. Dense, evidence-anchored registries of this kind do not merely document schema—they constitute the operational grammar by which institutions and data platforms alike express what they govern, for whom, under what types, and through which agents.