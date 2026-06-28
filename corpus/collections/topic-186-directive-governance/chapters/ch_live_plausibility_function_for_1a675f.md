---
chapter_id: ch_live_plausibility_function_for_1a675f
topic_id: 186
family: 07_long_tail
cited_terms: ['plausibility_function_for', 'training_partnership_development', 'labrun_observed_at_site']
model: engine-refine
---

The identifier column serves as the primary key across all entities in the system, providing a stable, human-readable reference that persists through attribute assignments and value storage. Plausibility function records carry identifiers such as FUNC-0001 through FUNC-0004, while site-level lab run observations use SITE-0001 through SITE-0004, and training partnership development records are designated DEVE-0001 through DEVE-0004. This consistent naming convention enables unambiguous cross-referencing: a plausibility function like FUNC-0001, which captures a firmware version mismatch, can be traced to its associated claim SITE-0004, and its attribute values can be resolved through the entity_id linkage in the value tables. Similarly, a lab run identified as PCR-ALPHA (SITE-0001) occurring at site FUNC-0003 carries its own set of typed attributes—duration of 3858.44 seconds, exit code 263, host name ingest-21—each resolved through the same entity_id mechanism.

**t_plausibility_function_for**

| id | plausibility | plausibility_for_claim |
| --- | --- | --- |
| FUNC-0001 | firmware_version_mismatch | SITE-0004 |
| FUNC-0002 | disputed_rating | SITE-0003 |
| FUNC-0003 | weak_indication | SITE-0003 |
| FUNC-0004 | model_convergence_failure | SITE-0007 |
| FUNC-0005 | network_latency_spike | SITE-0006 |
| FUNC-0006 | authentication_token_expired | SITE-0003 |
| FUNC-0007 | packet_loss_rate_high | SITE-0004 |

**t_plausibility_function_for_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FUNC-0001 | confidence | xsd:decimal |
| FUNC-0002 | dimension_kind | xsd:string |
| FUNC-0003 | method | xsd:string |
| FUNC-0004 | recorded_at | xsd:dateTime |
| FUNC-0005 | uncertainty | xsd:decimal |
| FUNC-0006 | unit | xsd:string |
| FUNC-0007 | value | xsd:decimal |
| FUNC-0008 | encoding | xsd:string |

**t_plausibility_function_for_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0004 | 2023-05-06T07:18:55 |
| FUNC-0002 | FUNC-0002 | FUNC-0004 | 2023-03-14T16:18:20 |
| FUNC-0003 | FUNC-0003 | FUNC-0004 | 2024-05-13T15:52:44 |
| FUNC-0004 | FUNC-0004 | FUNC-0004 | 2025-06-06T01:40:51 |
| FUNC-0005 | FUNC-0005 | FUNC-0004 | 2023-05-21T17:57:56 |
| FUNC-0006 | FUNC-0006 | FUNC-0004 | 2024-10-18T22:54:00 |
| FUNC-0007 | FUNC-0007 | FUNC-0004 | 2023-11-29T06:24:08 |

**t_plausibility_function_for_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0001 | 0.286 |
| FUNC-0002 | FUNC-0001 | FUNC-0005 | 84.30 |
| FUNC-0003 | FUNC-0001 | FUNC-0007 | 878.30 |
| FUNC-0004 | FUNC-0002 | FUNC-0001 | 0.033 |
| FUNC-0005 | FUNC-0002 | FUNC-0005 | 492.02 |
| FUNC-0006 | FUNC-0002 | FUNC-0007 | 356.58 |
| FUNC-0007 | FUNC-0003 | FUNC-0001 | 0.482 |
| FUNC-0008 | FUNC-0003 | FUNC-0005 | 926.97 |

**t_plausibility_function_for_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0002 | Dimension Kind 01 |
| FUNC-0002 | FUNC-0001 | FUNC-0008 | Encoding 02 |
| FUNC-0003 | FUNC-0001 | FUNC-0009 | pre-release note |
| FUNC-0004 | FUNC-0001 | FUNC-0010 | en |
| FUNC-0005 | FUNC-0001 | FUNC-0003 | manual |
| FUNC-0006 | FUNC-0001 | FUNC-0006 | kg |
| FUNC-0007 | FUNC-0002 | FUNC-0002 | Dimension Kind 07 |
| FUNC-0008 | FUNC-0002 | FUNC-0008 | Encoding 08 |

**t_training_partnership_development**

| id | training_partnership_development | has_participant |
| --- | --- | --- |
| DEVE-0001 | Advanced Analytics Cohort | Clinical Preceptor Team |
| DEVE-0002 | Machine Learning Track | Elena Rostova |
| DEVE-0003 | Biostatistics Collaboration | Research Associate Kim |
| DEVE-0004 | Engineering Mentorship Program | Industry Liaison Office |
| DEVE-0005 | Engineering Mentorship Program | Industry Liaison Office |
| DEVE-0006 | Data Governance Workshop | Research Associate Kim |
| DEVE-0007 | Research Methods Alliance | Elena Rostova |
| DEVE-0008 | Machine Learning Track | Elena Rostova |

**t_labrun_observed_at_site**

| id | labrun | occurs_in |
| --- | --- | --- |
| SITE-0001 | PCR-ALPHA | FUNC-0003 |
| SITE-0002 | RUN-2023-A4 | FUNC-0003 |
| SITE-0003 | WET-LAB-44 | FUNC-0004 |
| SITE-0004 | PLATE-A12 | FUNC-0003 |
| SITE-0005 | BATCH-8812 | FUNC-0002 |
| SITE-0006 | NEXTRA-GEN-03 | FUNC-0003 |
| SITE-0007 | BATCH-8812 | FUNC-0003 |

**t_labrun_observed_at_site_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SITE-0001 | duration_seconds | xsd:decimal |
| SITE-0002 | end_time | xsd:dateTime |
| SITE-0003 | exit_code | xsd:integer |
| SITE-0004 | host_name | xsd:string |
| SITE-0005 | log_level | xsd:string |
| SITE-0006 | phase | xsd:string |
| SITE-0007 | retry_count | xsd:integer |
| SITE-0008 | scheduled_at | xsd:dateTime |

**t_labrun_observed_at_site_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0002 | 2024-11-18T14:57:47 |
| SITE-0002 | SITE-0001 | SITE-0008 | 2025-06-11T00:43:59 |
| SITE-0003 | SITE-0001 | SITE-0009 | 2024-11-24T23:41:09 |
| SITE-0004 | SITE-0002 | SITE-0002 | 2024-09-03T12:28:15 |
| SITE-0005 | SITE-0002 | SITE-0008 | 2024-01-21T14:36:33 |
| SITE-0006 | SITE-0002 | SITE-0009 | 2024-08-02T20:19:39 |
| SITE-0007 | SITE-0003 | SITE-0002 | 2023-08-18T18:21:00 |
| SITE-0008 | SITE-0003 | SITE-0008 | 2023-03-15T08:25:39 |

**t_labrun_observed_at_site_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0001 | 3858.44 |
| SITE-0002 | SITE-0002 | SITE-0001 | 2622.63 |
| SITE-0003 | SITE-0003 | SITE-0001 | 5434.21 |
| SITE-0004 | SITE-0004 | SITE-0001 | 3308.67 |
| SITE-0005 | SITE-0005 | SITE-0001 | 138.03 |
| SITE-0006 | SITE-0006 | SITE-0001 | 5237.38 |
| SITE-0007 | SITE-0007 | SITE-0001 | 3257.93 |

**t_labrun_observed_at_site_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0003 | 263 |
| SITE-0002 | SITE-0001 | SITE-0007 | 199 |
| SITE-0003 | SITE-0002 | SITE-0003 | 302 |
| SITE-0004 | SITE-0002 | SITE-0007 | 29 |
| SITE-0005 | SITE-0003 | SITE-0003 | 93 |
| SITE-0006 | SITE-0003 | SITE-0007 | 209 |
| SITE-0007 | SITE-0004 | SITE-0003 | 703 |
| SITE-0008 | SITE-0004 | SITE-0007 | 313 |

**t_labrun_observed_at_site_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0004 | ingest-21 |
| SITE-0002 | SITE-0001 | SITE-0005 | Log Level 02 |
| SITE-0003 | SITE-0001 | SITE-0006 | closeout |
| SITE-0004 | SITE-0001 | SITE-0010 | failed |
| SITE-0005 | SITE-0001 | SITE-0011 | Triggered By 05 |
| SITE-0006 | SITE-0002 | SITE-0004 | gw-12 |
| SITE-0007 | SITE-0002 | SITE-0005 | Log Level 07 |
| SITE-0008 | SITE-0002 | SITE-0006 | initiation |

The attribute system decouples metadata definitions from their concrete values, allowing a single attribute schema to support multiple data types without schema migration. Each attribute is defined by a name and a type: confidence is stored as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime. This type discipline propagates into the value storage layer, where decimal attributes like confidence (FUNC-0001) hold values such as 0.286 and 0.033, string attributes like dimension_kind carry values such as Dimension Kind 01 and Encoding 02, and datetime attributes like recorded_at capture timestamps ranging from 2023-03-14T16:18:20 through 2025-06-06T01:40:51. The same pattern repeats at the site level, where lab run attributes include duration_seconds (xsd:decimal), end_time (xsd:dateTime), exit_code (xsd:integer), and host_name (xsd:string), with corresponding value tables partitioned by type to enforce schema integrity.

Entity_id acts as the foreign key binding attribute values back to their source records, creating a normalized structure where each entity can accumulate an arbitrary set of typed attributes without altering the core table. A single entity such as FUNC-0001 may appear across multiple value tables: in the decimal table with confidence values of 0.286 and a separate metric of 84.30, in the varchar table with dimension_kind set to Dimension Kind 01 and a pre-release note, and in the datetime table with recorded_at timestamped at 2023-05-06T07:18:55. The attr_id column in each value table points to the attribute definition, ensuring that the value 0.286 is interpreted as a confidence measurement rather than an arbitrary number. This design supports extensibility—new attributes can be added to the definition table without modifying any value storage table.

Training partnership development records introduce a distinct entity type that links programmatic initiatives to participating institutions and personnel. The training_partnership_development column names specific programs such as Advanced Analytics Cohort, Machine Learning Track, Biostatistics Collaboration, and Engineering Mentorship Program, while the has_participant column identifies the associated educational institution or institutional role—Clinical Preceptor Team, Elena Rostova, Research Associate Kim, and Industry Liaison Office. These partnerships operate independently of the plausibility and lab run tracking domains but share the same identifier and entity_id architecture, enabling a unified data model across operational, quality assurance, and collaborative development functions.

The plausibility function domain itself tracks data quality concerns by mapping specific failure modes to the claims or sites they affect. Functions such as disputed_rating, weak_indication, and model_convergence_failure are each associated with a target claim—SITE-0003 appears as the target for both disputed_rating (FUNC-0002) and weak_indication (FUNC-0003), while SITE-0007 is affected by model_convergence_failure (FUNC-0004). This mapping is complemented by the lab run observation domain, where runs like RUN-2023-A4 (SITE-0002) and WET-LAB-44 (SITE-0003) are recorded as occurring at specific sites, with their operational metadata—exit codes, host names, log levels such as failed and closeout—captured through the same attribute-value pattern. Together, these domains form a cohesive framework for tracking data provenance, quality indicators, and collaborative partnerships under a single identifier and entity model.