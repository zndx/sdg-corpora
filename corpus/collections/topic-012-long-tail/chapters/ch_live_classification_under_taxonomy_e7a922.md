---
chapter_id: ch_live_classification_under_taxonomy_e7a922
topic_id: 12
family: 03_directive_governance
cited_terms: ['classification_under_taxonomy', 'anonymous_demographic_information', 'span_with_parent']
model: engine-refine
---

Operational data governance begins with a rigorous identification and classification architecture, where every record is anchored by a unique identifier and situated within a hierarchical taxonomy. Identifiers such as TAXO-0001 or PARE-0007 serve as immutable reference points, enabling precise lineage tracking across distributed systems. Classifications like Lab Sample Category, Anomaly Detection Model, Experiment Phase Code, and Telemetry Stream Type are systematically mapped to parent taxonomy codes, establishing a controlled vocabulary that prevents semantic drift. This structural discipline ensures that downstream consumers can unambiguously resolve what a given entity represents, regardless of where it originates in the pipeline.

**t_classification_under_taxonomy**

| id | classification | under_taxonomy |
| --- | --- | --- |
| TAXO-0001 | Lab Sample Category | PARE-0007 |
| TAXO-0002 | Anomaly Detection Model | PARE-0008 |
| TAXO-0003 | Experiment Phase Code | PARE-0007 |
| TAXO-0004 | Telemetry Stream Type | PARE-0008 |
| TAXO-0005 | Compliance Framework Set | PARE-0008 |
| TAXO-0006 | Experiment Phase Code | PARE-0004 |
| TAXO-0007 | Metadata Schema Version | PARE-0007 |
| TAXO-0008 | Experiment Phase Code | PARE-0007 |

**t_classification_under_taxonomy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TAXO-0001 | duration_seconds | xsd:decimal |
| TAXO-0002 | end_time | xsd:dateTime |
| TAXO-0003 | exit_code | xsd:integer |
| TAXO-0004 | host_name | xsd:string |
| TAXO-0005 | log_level | xsd:string |
| TAXO-0006 | phase | xsd:string |
| TAXO-0007 | retry_count | xsd:integer |
| TAXO-0008 | scheduled_at | xsd:dateTime |

**t_span_with_parent**

| id | span |
| --- | --- |
| PARE-0001 | orchestrator job |
| PARE-0002 | api gateway route |
| PARE-0003 | request router |
| PARE-0004 | gateway auth check |
| PARE-0005 | kafka consumer process |
| PARE-0006 | gateway auth check |
| PARE-0007 | orchestrator job |
| PARE-0008 | service mesh proxy |

**t_span_with_parent_parent_span**

| id | parent_span |
| --- | --- |
| PARE-0001 | cache lookup session |
| PARE-0002 | service mesh proxy |
| PARE-0003 | load balancer forward |
| PARE-0004 | service mesh proxy |
| PARE-0005 | kafka consumer process |
| PARE-0006 | kafka consumer process |

Once classified, entities are described through a normalized attribute system that decouples attr definitions from their concrete values. Each attr is assigned a strict attr type constraint such as xsd:decimal, xsd:dateTime, xsd:integer, or xsd:string, preserving schema integrity while accommodating heterogeneous data. The actual values are materialized in type-specific repositories under a generic misc column, which acts as the universal value carrier without violating normalization rules. A single entity, for instance, may carry a decimal measurement of 4845.29, a temporal stamp of 2024-03-16T10:40:44, an integer exit code of 123, and a string identifier like worker-07, all linked back to the same entity key while remaining strictly typed.

**t_classification_under_taxonomy_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0002 | 2024-03-16T10:40:44 |
| TAXO-0002 | TAXO-0001 | TAXO-0008 | 2023-03-15T13:57:05 |
| TAXO-0003 | TAXO-0001 | TAXO-0009 | 2024-10-13T12:06:31 |
| TAXO-0004 | TAXO-0002 | TAXO-0002 | 2023-01-11T10:30:50 |
| TAXO-0005 | TAXO-0002 | TAXO-0008 | 2025-05-19T08:08:31 |
| TAXO-0006 | TAXO-0002 | TAXO-0009 | 2025-04-05T18:33:08 |
| TAXO-0007 | TAXO-0003 | TAXO-0002 | 2024-01-05T08:57:44 |
| TAXO-0008 | TAXO-0003 | TAXO-0008 | 2024-10-15T05:44:13 |

**t_classification_under_taxonomy_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0001 | 4845.29 |
| TAXO-0002 | TAXO-0002 | TAXO-0001 | 4012.23 |
| TAXO-0003 | TAXO-0003 | TAXO-0001 | 5805.70 |
| TAXO-0004 | TAXO-0004 | TAXO-0001 | 852.80 |
| TAXO-0005 | TAXO-0005 | TAXO-0001 | 5949.40 |
| TAXO-0006 | TAXO-0006 | TAXO-0001 | 1054.63 |
| TAXO-0007 | TAXO-0007 | TAXO-0001 | 5765.70 |
| TAXO-0008 | TAXO-0008 | TAXO-0001 | 2142.87 |

**t_classification_under_taxonomy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0003 | 123 |
| TAXO-0002 | TAXO-0001 | TAXO-0007 | 306 |
| TAXO-0003 | TAXO-0002 | TAXO-0003 | 682 |
| TAXO-0004 | TAXO-0002 | TAXO-0007 | 349 |
| TAXO-0005 | TAXO-0003 | TAXO-0003 | 409 |
| TAXO-0006 | TAXO-0003 | TAXO-0007 | 189 |
| TAXO-0007 | TAXO-0004 | TAXO-0003 | 329 |
| TAXO-0008 | TAXO-0004 | TAXO-0007 | 345 |

**t_classification_under_taxonomy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0004 | worker-07 |
| TAXO-0002 | TAXO-0001 | TAXO-0005 | Log Level 02 |
| TAXO-0003 | TAXO-0001 | TAXO-0006 | initiation |
| TAXO-0004 | TAXO-0001 | TAXO-0010 | superseded |
| TAXO-0005 | TAXO-0001 | TAXO-0011 | Triggered By 05 |
| TAXO-0006 | TAXO-0002 | TAXO-0004 | ingest-21 |
| TAXO-0007 | TAXO-0002 | TAXO-0005 | Log Level 07 |
| TAXO-0008 | TAXO-0002 | TAXO-0006 | review |

**t_anonymous_demographic_information_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INFO-0001 | INFO-0001 | INFO-0004 | 2024-08-15T06:37:30 |
| INFO-0002 | INFO-0002 | INFO-0004 | 2023-10-27T17:02:18 |
| INFO-0003 | INFO-0003 | INFO-0004 | 2023-05-03T14:37:32 |
| INFO-0004 | INFO-0004 | INFO-0004 | 2023-05-25T07:11:49 |
| INFO-0005 | INFO-0005 | INFO-0004 | 2024-09-13T22:50:49 |
| INFO-0006 | INFO-0006 | INFO-0004 | 2024-02-07T11:47:33 |

**t_anonymous_demographic_information_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INFO-0001 | INFO-0001 | INFO-0001 | 0.448 |
| INFO-0002 | INFO-0001 | INFO-0005 | 124.47 |
| INFO-0003 | INFO-0001 | INFO-0007 | 40.18 |
| INFO-0004 | INFO-0002 | INFO-0001 | 0.771 |
| INFO-0005 | INFO-0002 | INFO-0005 | 477.18 |
| INFO-0006 | INFO-0002 | INFO-0007 | 862.09 |
| INFO-0007 | INFO-0003 | INFO-0001 | 0.785 |
| INFO-0008 | INFO-0003 | INFO-0005 | 9.71 |

**t_anonymous_demographic_information_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INFO-0001 | INFO-0001 | INFO-0002 | Dimension Kind 01 |
| INFO-0002 | INFO-0001 | INFO-0008 | Encoding 02 |
| INFO-0003 | INFO-0001 | INFO-0009 | pre-release note |
| INFO-0004 | INFO-0001 | INFO-0010 | de |
| INFO-0005 | INFO-0001 | INFO-0003 | automated |
| INFO-0006 | INFO-0001 | INFO-0006 | nm |
| INFO-0007 | INFO-0002 | INFO-0002 | Dimension Kind 07 |
| INFO-0008 | INFO-0002 | INFO-0008 | Encoding 08 |

In regulated environments, this attribute-value framework extends directly into demographic and privacy-sensitive data management, where classifications are explicitly partitioned by sensitivity tier. Records are categorized as anonymousdemographicinformation, demographicinformation, or personallyidentifiableinformation, each carrying distinct handling and retention requirements. Fields such as school_district_enrollment, household_size, and geographic_region may be aggregated or anonymized, whereas health_survey_responses and age_brackets require careful contextual masking. At the highest sensitivity tier, personallyidentifiableinformation encompasses home_address, full_legal_name, and passport_number, triggering strict access controls. Every demographic record is further enriched with provenance attributes like confidence (0.448 or 0.771), dimension_kind (Dimension Kind 01), method (Encoding 02), and recorded_at timestamps (2024-08-15T06:37:30), ensuring that data quality and collection methodology are auditable.

**t_anonymous_demographic_information**

| id | anonymous_demographic_information | demographic_information | personally_identifiable_information |
| --- | --- | --- | --- |
| INFO-0001 | school_district_enrollment | health_survey_responses | home_address |
| INFO-0002 | household_size | geographic_region | home_address |
| INFO-0003 | geographic_region | age_brackets | full_legal_name |
| INFO-0004 | health_survey_responses | household_size | passport_number |
| INFO-0005 | housing_market_surveys | age_brackets | passport_number |
| INFO-0006 | marital_status | disability_status | financial_account |

**t_anonymous_demographic_information_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| INFO-0001 | confidence | xsd:decimal |
| INFO-0002 | dimension_kind | xsd:string |
| INFO-0003 | method | xsd:string |
| INFO-0004 | recorded_at | xsd:dateTime |
| INFO-0005 | uncertainty | xsd:decimal |
| INFO-0006 | unit | xsd:string |
| INFO-0007 | value | xsd:decimal |
| INFO-0008 | encoding | xsd:string |

Beyond attribute storage, the framework models operational relationships through a subject-target-role matrix that captures execution context and accountability. The subject and target columns function as foreign keys linking discrete components—such as orchestrator job, api gateway route, request router, or gateway auth check—into a directed graph of dependencies. The role column then assigns a functional designation to each linkage, distinguishing owner, observer, and reviewer relationships. For example, a span identified as PARE-0004 may be designated as the owner relative to target PARE-0002, while another linkage marks PARE-0005 in a reviewer capacity, establishing clear boundaries for responsibility and oversight during distributed processing.

**t_span_with_parent__parent_span**

| id | span_id | parent_span_id | role |
| --- | --- | --- | --- |
| PARE-0001 | PARE-0004 | PARE-0002 | owner |
| PARE-0002 | PARE-0002 | PARE-0005 | observer |
| PARE-0003 | PARE-0003 | PARE-0001 | owner |
| PARE-0004 | PARE-0005 | PARE-0005 | reviewer |
| PARE-0005 | PARE-0005 | PARE-0003 | owner |
| PARE-0006 | PARE-0005 | PARE-0002 | observer |
| PARE-0007 | PARE-0004 | PARE-0002 | observer |
| PARE-0008 | PARE-0006 | PARE-0005 | contributor |

Collectively, this architecture transforms raw operational and demographic signals into a governed, queryable asset. By separating identifiers, classifications, attribute schemas, typed values, and relational roles into distinct but tightly coupled layers, the system supports granular access policies, precise data lineage, and automated compliance validation. Auditors can trace a value like 5805.70 or a status flag such as superseded back to its originating entity, verify its type constraint, confirm its demographic classification tier, and inspect the role-based permissions that governed its ingestion. The result is a resilient data fabric where privacy, provenance, and operational clarity are enforced structurally rather than procedurally.