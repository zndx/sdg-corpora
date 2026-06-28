---
chapter_id: ch_live_ebpf_program_governed_by_directive_ad8a5f
topic_id: 23
family: 07_long_tail
cited_terms: ['ebpf_program_governed_by_directive', 'observation_records_state', 'anonymous_demographic_information']
model: engine-refine
---

Within modern data governance architectures, the classification and stewardship of information assets demands a rigorous separation between entity identity, attribute semantics, and value storage—a tripartite structure that ensures both traceability and type safety across heterogeneous data domains. At the core of this model, each information entity receives a unique identifier, such as INFO-0001 through INFO-0004 for demographic records or DIRE-0001 through DIRE-0004 for directive assignments, which serves as the immutable anchor for all downstream references. The entity itself encapsulates the substantive subject matter: a demographic record might catalog anonymous_demographic_information fields like school_district_enrollment, household_size, geographic_region, and health_survey_responses, while simultaneously tracking demographic_information categories such as age_brackets and household_size, and flagging the presence of personally_identifiable_information including home_address, full_legal_name, and passport_number. This explicit delineation between anonymous and personally identifiable categories is not merely organizational—it establishes the compliance boundary that determines access controls, retention policies, and regulatory obligations under frameworks such as GDPR and CCPA.

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

The attribute layer operationalizes this classification by defining what properties apply to each entity and constraining their data types through a schema registry. Attribute definitions, identified by their own unique keys, specify an attr_name—such as confidence, dimension_kind, method, or recorded_at for demographic entities, and effective_date, enforcement, mandatory, or priority for directive entities—alongside an attr_type drawn from the XML Schema Definition namespace, including xsd:decimal, xsd:string, xsd:dateTime, xsd:date, xsd:boolean, and xsd:integer. This type discipline is critical: it prevents semantic drift by ensuring that a confidence score like 0.448 or 0.771 is stored as a decimal rather than a string, that a recorded_at timestamp such as 2024-08-15T06:37:30 conforms to ISO 8601 datetime format, and that a dimension_kind value like Dimension Kind 01 or Encoding 02 is treated as a categorical string. The attr_type column thus functions as a contract between the data model and the storage engine, enabling automated validation at ingestion time and eliminating the class of errors that arise from implicit type coercion.

Value storage is decoupled from attribute definitions into type-specific tables, a design choice that reflects the practical reality that not all attributes are populated for every entity, and that type-specific indexing and compression strategies yield measurable performance gains. For demographic entities, the decimal value table holds quantitative attributes such as a confidence measure of 0.448 or a dimension value of 124.47, while the varchar value table stores categorical metadata like pre-release note or de, and the datetime table records provenance timestamps including 2023-10-27T17:02:18 and 2023-05-03T14:37:32. Each value row is keyed by a composite of entity_id and attr_id, establishing a many-to-many relationship that allows a single attribute definition—say, recorded_at—to be instantiated across multiple entities, and a single entity—such as INFO-0001—to carry multiple attributes with values distributed across different type tables. This normalization eliminates null proliferation while preserving the ability to query all decimal-valued attributes across entities without scanning varchar or datetime storage.

The same architectural pattern extends beyond demographic data into operational governance domains, where the relationship between directives and the programs they govern is modeled with equivalent rigor. An ebpf program such as tracepoint_sched, xdp_fwd, or tc_egress is linked to a governing directive through an identifier-based association, and each directive carries its own set of typed attributes: an effective_date like 2024-06-04 or 2025-03-23, an enforcement status stored as a boolean (false or true), a mandatory flag, and a priority value such as 5, 280, 3, or 996. The separation of these values into type-specific tables—val_boolean, val_date, val_int, val_varchar—ensures that a priority integer is never conflated with an enforcement string, and that the audit trail for directive compliance can be reconstructed by joining entity_id references across the value tables. Observation records follow this same schema: an observation such as Network latency spike, Water quality anomaly, or Reactor pressure threshold is associated with a directive record like DIRE-0003 or DIRE-0005, and its attributes—including duration_seconds as a decimal (4243.13, 4365.77, 5274.11, 1567.00), end_time as a datetime (2023-08-02T17:44:58, 2025-03-10T03:55:42), exit_code as an integer (958, 456, 517, 41), and host_name as a string (worker-07)—are stored in their respective type tables.

**t_ebpf_program_governed_by_directive**

| id | ebpf |
| --- | --- |
| DIRE-0001 | tracepoint_sched |
| DIRE-0002 | xdp_fwd |
| DIRE-0003 | tc_egress |
| DIRE-0004 | xdp_fwd |
| DIRE-0005 | tracepoint_sched |
| DIRE-0006 | tc_egress |

**t_ebpf_program_governed_by_directive_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIRE-0001 | effective_date | xsd:date |
| DIRE-0002 | enforcement | xsd:string |
| DIRE-0003 | mandatory | xsd:boolean |
| DIRE-0004 | priority | xsd:integer |
| DIRE-0005 | review_cycle_days | xsd:integer |
| DIRE-0006 | scope | xsd:string |
| DIRE-0007 | encoding | xsd:string |
| DIRE-0008 | label_text | xsd:string |

**t_ebpf_program_governed_by_directive_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0003 | false |
| DIRE-0002 | DIRE-0002 | DIRE-0003 | true |
| DIRE-0003 | DIRE-0003 | DIRE-0003 | true |
| DIRE-0004 | DIRE-0004 | DIRE-0003 | true |
| DIRE-0005 | DIRE-0005 | DIRE-0003 | false |
| DIRE-0006 | DIRE-0006 | DIRE-0003 | false |

**t_ebpf_program_governed_by_directive_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0001 | 2024-06-04 |
| DIRE-0002 | DIRE-0002 | DIRE-0001 | 2025-03-23 |
| DIRE-0003 | DIRE-0003 | DIRE-0001 | 2025-01-20 |
| DIRE-0004 | DIRE-0004 | DIRE-0001 | 2024-06-12 |
| DIRE-0005 | DIRE-0005 | DIRE-0001 | 2025-03-15 |
| DIRE-0006 | DIRE-0006 | DIRE-0001 | 2024-12-23 |

**t_ebpf_program_governed_by_directive_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0004 | 5 |
| DIRE-0002 | DIRE-0001 | DIRE-0005 | 280 |
| DIRE-0003 | DIRE-0002 | DIRE-0004 | 3 |
| DIRE-0004 | DIRE-0002 | DIRE-0005 | 996 |
| DIRE-0005 | DIRE-0003 | DIRE-0004 | 5 |
| DIRE-0006 | DIRE-0003 | DIRE-0005 | 471 |
| DIRE-0007 | DIRE-0004 | DIRE-0004 | 1 |
| DIRE-0008 | DIRE-0004 | DIRE-0005 | 105 |

**t_ebpf_program_governed_by_directive_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0007 | Encoding 01 |
| DIRE-0002 | DIRE-0001 | DIRE-0002 | Enforcement 02 |
| DIRE-0003 | DIRE-0001 | DIRE-0008 | audit excerpt |
| DIRE-0004 | DIRE-0001 | DIRE-0009 | en |
| DIRE-0005 | DIRE-0001 | DIRE-0006 | Scope 05 |
| DIRE-0006 | DIRE-0002 | DIRE-0007 | Encoding 06 |
| DIRE-0007 | DIRE-0002 | DIRE-0002 | Enforcement 07 |
| DIRE-0008 | DIRE-0002 | DIRE-0008 | audit excerpt |

**t_observation_records_state**

| id | observation | records |
| --- | --- | --- |
| STAT-0001 | Network latency spike | DIRE-0005 |
| STAT-0002 | Water quality anomaly | DIRE-0003 |
| STAT-0003 | Reactor pressure threshold | DIRE-0003 |
| STAT-0004 | Reactor pressure threshold | DIRE-0003 |
| STAT-0005 | Network latency spike | DIRE-0004 |
| STAT-0006 | pH deviation alert | DIRE-0003 |

**t_observation_records_state_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAT-0001 | duration_seconds | xsd:decimal |
| STAT-0002 | end_time | xsd:dateTime |
| STAT-0003 | exit_code | xsd:integer |
| STAT-0004 | host_name | xsd:string |
| STAT-0005 | log_level | xsd:string |
| STAT-0006 | phase | xsd:string |
| STAT-0007 | retry_count | xsd:integer |
| STAT-0008 | scheduled_at | xsd:dateTime |

**t_observation_records_state_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0002 | 2023-08-02T17:44:58 |
| STAT-0002 | STAT-0001 | STAT-0008 | 2025-03-10T03:55:42 |
| STAT-0003 | STAT-0001 | STAT-0009 | 2024-08-16T12:27:34 |
| STAT-0004 | STAT-0002 | STAT-0002 | 2024-01-02T12:08:53 |
| STAT-0005 | STAT-0002 | STAT-0008 | 2024-04-22T02:15:44 |
| STAT-0006 | STAT-0002 | STAT-0009 | 2025-02-09T01:29:13 |
| STAT-0007 | STAT-0003 | STAT-0002 | 2023-02-01T11:57:40 |
| STAT-0008 | STAT-0003 | STAT-0008 | 2023-09-23T07:16:43 |

**t_observation_records_state_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0001 | 4243.13 |
| STAT-0002 | STAT-0002 | STAT-0001 | 4365.77 |
| STAT-0003 | STAT-0003 | STAT-0001 | 5274.11 |
| STAT-0004 | STAT-0004 | STAT-0001 | 1567.00 |
| STAT-0005 | STAT-0005 | STAT-0001 | 420.59 |
| STAT-0006 | STAT-0006 | STAT-0001 | 6894.95 |

**t_observation_records_state_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0003 | 958 |
| STAT-0002 | STAT-0001 | STAT-0007 | 456 |
| STAT-0003 | STAT-0002 | STAT-0003 | 517 |
| STAT-0004 | STAT-0002 | STAT-0007 | 41 |
| STAT-0005 | STAT-0003 | STAT-0003 | 930 |
| STAT-0006 | STAT-0003 | STAT-0007 | 257 |
| STAT-0007 | STAT-0004 | STAT-0003 | 71 |
| STAT-0008 | STAT-0004 | STAT-0007 | 485 |

**t_observation_records_state_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0004 | worker-07 |
| STAT-0002 | STAT-0001 | STAT-0005 | Log Level 02 |
| STAT-0003 | STAT-0001 | STAT-0006 | execution |
| STAT-0004 | STAT-0001 | STAT-0010 | pending |
| STAT-0005 | STAT-0001 | STAT-0011 | Triggered By 05 |
| STAT-0006 | STAT-0002 | STAT-0004 | node-a01 |
| STAT-0007 | STAT-0002 | STAT-0005 | Log Level 07 |
| STAT-0008 | STAT-0002 | STAT-0006 | closeout |

This uniform treatment of entities, attributes, and typed values across disparate domains—demographic classification, directive governance, and operational observation—creates a coherent metadata fabric that supports both regulatory compliance and operational analytics. The identifier column provides the join key that binds an entity to its attributes and values; the attr_name and attr_type columns define the semantic and type contract; and the value tables, partitioned by xsd type, enable efficient range queries on decimals, temporal queries on datetimes, and categorical lookups on strings. When personally_identifiable_information such as home_address or passport_number is flagged within a demographic entity, the same attribute-value machinery applies, but the compliance layer can intercept access at the entity level, applying differential privacy or tokenization before the data reaches analytical workloads. The result is a system in which the distinction between anonymous_demographic_information and personally_identifiable_information is not an afterthought encoded in application logic, but a structural property of the data model itself, enforced by the schema and visible in every join, every query plan, and every audit log.

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