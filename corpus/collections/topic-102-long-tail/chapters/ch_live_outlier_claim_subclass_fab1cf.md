---
chapter_id: ch_live_outlier_claim_subclass_fab1cf
topic_id: 102
family: 02_observation_measurement
cited_terms: ['outlier_claim_subclass', 'schemaorg_creativework_publisher', 'tc_classifier_subclass']
model: engine-refine
---

An identifier functions as the immutable anchor of any governed entity, a stable reference that survives the churn of attribute updates and cross-referencing. In the corpus, identifiers such as CLAI-0001 through CLAI-0004 designate outlier claims, while PUBL-0001 through PUBL-0004 anchor publisher-side creative-work records, and CLAS-0001 through CLAS-0004 identify classifier facts. The prefix convention—CLAI for claims, PUBL for publishers, CLAS for classifiers—encodes provenance at a glance, and the numeric suffix provides a monotonically increasing sequence that supports range scans and audit trails. Because every attribute, value, and relationship table resolves back to one of these identifiers, the integrity of the entire graph depends on their uniqueness and immutability.

**t_outlier_claim_subclass**

| id | outlier |
| --- | --- |
| CLAI-0001 | Network_Bandwidth_Spike |
| CLAI-0002 | Patient_Vital_Anomaly |
| CLAI-0003 | Network_Bandwidth_Spike |
| CLAI-0004 | Log_Flood_Event |
| CLAI-0005 | Patient_Vital_Anomaly |
| CLAI-0006 | Elevator_Vibration_Spike |
| CLAI-0007 | Reactor_Core_Temp_Peak |

**t_outlier_claim_subclass_explains_anomaly_in**

| id | explains_anomaly_in |
| --- | --- |
| CLAI-0001 | Automotive_Test_Drive |
| CLAI-0002 | Automotive_Test_Drive |
| CLAI-0003 | Power_Grid_Substation |
| CLAI-0004 | Financial_Trading_Queue |
| CLAI-0005 | US_East_Data_Center |
| CLAI-0006 | Financial_Trading_Queue |

**t_schemaorg_creativework_publisher**

| id | schemaorg | publisher |
| --- | --- | --- |
| PUBL-0001 | API Gateway Config | CLAI-0007 |
| PUBL-0002 | API Gateway Config | CLAI-0007 |
| PUBL-0003 | Cloud Migration Playbook | CLAI-0007 |
| PUBL-0004 | Cloud Migration Playbook | CLAI-0007 |
| PUBL-0005 | Incident Postmortem | CLAI-0001 |
| PUBL-0006 | Telemetry Schema Draft | CLAI-0005 |
| PUBL-0007 | Firmware Release Notes | CLAI-0003 |
| PUBL-0008 | Cloud Migration Playbook | CLAI-0001 |

**t_schemaorg_creativework_publisher_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PUBL-0001 | checksum | xsd:string |
| PUBL-0002 | created_date | xsd:date |
| PUBL-0003 | identifier | cco:DesignativeICE |
| PUBL-0004 | license | xsd:string |
| PUBL-0005 | mime_type | xsd:string |
| PUBL-0006 | size_bytes | xsd:long |
| PUBL-0007 | uri | xsd:string |
| PUBL-0008 | version | xsd:integer |

**t_schemaorg_creativework_publisher_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PUBL-0001 | PUBL-0001 | PUBL-0002 | 2023-06-28 |
| PUBL-0002 | PUBL-0002 | PUBL-0002 | 2024-12-26 |
| PUBL-0003 | PUBL-0003 | PUBL-0002 | 2025-04-12 |
| PUBL-0004 | PUBL-0004 | PUBL-0002 | 2023-05-08 |
| PUBL-0005 | PUBL-0005 | PUBL-0002 | 2023-02-08 |
| PUBL-0006 | PUBL-0006 | PUBL-0002 | 2023-06-27 |
| PUBL-0007 | PUBL-0007 | PUBL-0002 | 2024-12-14 |
| PUBL-0008 | PUBL-0008 | PUBL-0002 | 2024-06-20 |

**t_schemaorg_creativework_publisher_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PUBL-0001 | PUBL-0001 | PUBL-0006 | 72 |
| PUBL-0002 | PUBL-0001 | PUBL-0008 | 1 |
| PUBL-0003 | PUBL-0002 | PUBL-0006 | 54 |
| PUBL-0004 | PUBL-0002 | PUBL-0008 | 3 |
| PUBL-0005 | PUBL-0003 | PUBL-0006 | 456 |
| PUBL-0006 | PUBL-0003 | PUBL-0008 | 6 |
| PUBL-0007 | PUBL-0004 | PUBL-0006 | 341 |
| PUBL-0008 | PUBL-0004 | PUBL-0008 | 9 |

**t_schemaorg_creativework_publisher_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PUBL-0001 | PUBL-0001 | PUBL-0001 | 9d2b7a16 |
| PUBL-0002 | PUBL-0001 | PUBL-0003 | ARN:res/41 |
| PUBL-0003 | PUBL-0001 | PUBL-0004 | proprietary |
| PUBL-0004 | PUBL-0001 | PUBL-0009 | zone-b |
| PUBL-0005 | PUBL-0001 | PUBL-0005 | application/xml |
| PUBL-0006 | PUBL-0001 | PUBL-0010 | Name 06 |
| PUBL-0007 | PUBL-0001 | PUBL-0011 | sre |
| PUBL-0008 | PUBL-0001 | PUBL-0012 | Tags 08 |

Attributes and their types form the schema layer that gives meaning to otherwise opaque values. An attribute name such as checksum, created_date, identifier, or license is paired with an attr_type—xsd:string, xsd:date, cco:DesignativeICE—that dictates both storage semantics and validation rules. This separation of name and type from value is deliberate: the same attribute definition can be reused across multiple entities, and the type system ensures that a date like 2023-06-28 or 2024-12-26 is never confused with a string such as 9d2b7a16 or an ARN like ARN:res/41. The type registry also supports extensibility; the presence of cco:DesignativeICE alongside standard XSD types signals that the framework accommodates custom ontologies without sacrificing type safety.

Values are materialized in type-specific tables—val_date, val_int, val_varchar—each carrying an entity_id that points back to the owning record, an attr_id that resolves to the attribute definition, and the value itself. This vertical partitioning by type avoids the null-waste problem of a single wide value column and allows the database engine to exploit type-specific indexing and compression. Integer values such as 72, 1, 54, and 3 coexist cleanly with date literals and opaque strings, each in its natural storage format. The entity_id column is the foreign key that binds a value to its parent, while attr_id binds it to its schema; together they form a two-hop resolution path that is both queryable and auditable.

Categories and directional relationships provide the analytical axes along which facts are sliced and diced. A classifier fact carries a t_c_direction_key—CLAS-0001, CLAS-0004, CLAS-0006—that references a dimension table where each direction is labeled (T C Direction Label 01 through 04) and categorized (T C Direction Category 01 through 04). The direction key is not merely a label; it encodes a semantic orientation—perhaps inbound versus outbound, source versus sink, or producer versus consumer—that determines how the associated size_bytes (643947353, 883422563, 772730446, 623892633) should be interpreted in downstream aggregations. The version column on the classifier fact (values 1 through 9) tracks evolution: as the direction semantics or the measured payload change, a new version is emitted rather than an in-place update, preserving the full history of classification decisions.

**fact_classifier**

| id | t_c_direction_key | size_bytes | version |
| --- | --- | --- | --- |
| CLAS-0001 | CLAS-0001 | 643947353 | 2 |
| CLAS-0002 | CLAS-0004 | 883422563 | 1 |
| CLAS-0003 | CLAS-0001 | 772730446 | 1 |
| CLAS-0004 | CLAS-0006 | 623892633 | 9 |
| CLAS-0005 | CLAS-0002 | 61512113 | 4 |
| CLAS-0006 | CLAS-0007 | 798328963 | 5 |
| CLAS-0007 | CLAS-0002 | 968248258 | 9 |

**dim_t_c_direction**

| id | t_c_direction_label | t_c_direction_category |
| --- | --- | --- |
| CLAS-0001 | T C Direction Label 01 | T C Direction Category 01 |
| CLAS-0002 | T C Direction Label 02 | T C Direction Category 02 |
| CLAS-0003 | T C Direction Label 03 | T C Direction Category 03 |
| CLAS-0004 | T C Direction Label 04 | T C Direction Category 04 |
| CLAS-0005 | T C Direction Label 05 | T C Direction Category 05 |
| CLAS-0006 | T C Direction Label 06 | T C Direction Category 06 |
| CLAS-0007 | T C Direction Label 07 | T C Direction Category 07 |

Subject, target, and role complete the relationship model by specifying who does what to whom. In the outlier-explanation junction, an outlier_id (the subject, e.g., CLAI-0005 or CLAI-0001) is linked to an explains_anomaly_in_id (the target, e.g., CLAI-0002 or CLAI-0006) through a role—reviewer, owner, or observer—that qualifies the nature of the explanation. This triad allows the same pair of entities to participate in multiple relationships with different semantics: CLAI-0001 may be a reviewer of CLAI-0005 in one row and an observer of CLAI-0006 in another. The role column is the differentiator, and its enumeration is constrained to a controlled vocabulary that prevents ad hoc interpretations.

**t_outlier_claim_subclass__explains_anomaly_in**

| id | outlier_id | explains_anomaly_in_id | role |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0005 | CLAI-0002 | reviewer |
| CLAI-0002 | CLAI-0006 | CLAI-0002 | owner |
| CLAI-0003 | CLAI-0001 | CLAI-0005 | reviewer |
| CLAI-0004 | CLAI-0001 | CLAI-0006 | observer |
| CLAI-0005 | CLAI-0007 | CLAI-0002 | owner |
| CLAI-0006 | CLAI-0005 | CLAI-0004 | observer |
| CLAI-0007 | CLAI-0003 | CLAI-0005 | owner |
| CLAI-0008 | CLAI-0002 | CLAI-0001 | owner |

Across all these constructs, the design principle is consistent: identifiers are stable, attributes are typed, values are type-partitioned, directions are categorized, and relationships are role-qualified. This architecture supports both the rigidity required for compliance auditing—every value traceable to its attribute definition and entity—and the flexibility required for operational analysis—directions can be re-categorized, versions can accumulate, and roles can be reassigned without restructuring the underlying schema. The result is a graph that is simultaneously a ledger and a model, where the semantics of a Network_Bandwidth_Spike in an Automotive_Test_Drive context are as precisely encoded as the checksum 9d2b7a16 of a Cloud Migration Playbook published under CLAI-0007.