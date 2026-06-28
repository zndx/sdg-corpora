---
chapter_id: ch_live_dengue_transmission_process_b26c0a
topic_id: 66
family: 08_derived
cited_terms: ['dengue_transmission_process', 'column_renamed_from', 'agent_software_or_human']
model: engine-refine
---

In the architecture of operational telemetry, every discrete observation is anchored by a unique identifier, such as `PROC-0001` or `FROM-0001`, which serves as the immutable primary key for downstream aggregation. These identifiers do not exist in isolation; rather, they resolve to specific entities whose characteristics are captured through a schemaless attribute model. An entity is defined not by a rigid row structure, but by a collection of attribute-value pairs, where the attr itself—such as `confidence` or `recorded_at`—is formally defined by its attr type. For instance, the attr `recorded_at` is strictly bound to the `xsd:dateTime` type, ensuring that temporal metadata like `2025-03-21T00:09:12` is preserved with semantic precision, while numeric attributes like `confidence` are cast as `xsd:decimal` to maintain mathematical integrity. Conversely, unstructured or free-text data is relegated to the misc classification, allowing for arbitrary values such as `Dimension Kind 01` or `audit excerpt` to coexist with rigid schemas without compromising type safety.

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

Quantitative measurement is centralized within fact tables, where the event_count column aggregates the frequency of specific occurrences. In the context of epidemiological tracking, for example, a single record might register an event_count of 444, representing a distinct volume of transmission events tied to a particular observation window. These counts are not merely tallies; they are the fundamental units of analytical weight, allowing governance frameworks to prioritize high-volume incidents. The structural integrity of these facts relies on the precise linkage of their primary keys, ensuring that a count of 167 or 56 is always traceable back to the originating entity and its associated metadata.

The relational depth of the system is realized through its dimensional lookups, specifically the involves_host and involves_vector mappings. These foreign keys bridge the gap between raw event data and contextual taxonomy. When a fact record references an involves_host_key of `PROC-0002`, it resolves to a dimension entry that provides both a human-readable label—such as `Involves Host Label 02`—and a formal classification under involves_host_category, such as `Involves Host Category 02`. This dual-layer approach allows operators to filter by granular labels while simultaneously enforcing broad categorical governance, ensuring that every host or vector interaction is classified consistently across the entire dataset.

**fact_dengue**

| id | involves_host_key | involves_vector_key | event_count |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0002 | PROC-0004 | 251 |
| PROC-0002 | PROC-0001 | PROC-0002 | 444 |
| PROC-0003 | PROC-0005 | PROC-0007 | 56 |
| PROC-0004 | PROC-0002 | PROC-0003 | 167 |
| PROC-0005 | PROC-0002 | PROC-0008 | 168 |

**dim_involves_host**

| id | involves_host_label | involves_host_category |
| --- | --- | --- |
| PROC-0001 | Involves Host Label 01 | Involves Host Category 01 |
| PROC-0002 | Involves Host Label 02 | Involves Host Category 02 |
| PROC-0003 | Involves Host Label 03 | Involves Host Category 03 |
| PROC-0004 | Involves Host Label 04 | Involves Host Category 04 |
| PROC-0005 | Involves Host Label 05 | Involves Host Category 05 |
| PROC-0006 | Involves Host Label 06 | Involves Host Category 06 |

**dim_involves_vector**

| id | involves_vector_label | involves_vector_category |
| --- | --- | --- |
| PROC-0001 | Involves Vector Label 01 | Involves Vector Category 01 |
| PROC-0002 | Involves Vector Label 02 | Involves Vector Category 02 |
| PROC-0003 | Involves Vector Label 03 | Involves Vector Category 03 |
| PROC-0004 | Involves Vector Label 04 | Involves Vector Category 04 |
| PROC-0005 | Involves Vector Label 05 | Involves Vector Category 05 |
| PROC-0006 | Involves Vector Label 06 | Involves Vector Category 06 |
| PROC-0007 | Involves Vector Label 07 | Involves Vector Category 07 |
| PROC-0008 | Involves Vector Label 08 | Involves Vector Category 08 |

Finally, the governance of these data assets is explicitly tied to the agents and software responsible for their generation. The system maintains a registry of operational actors, ranging from human roles like `SecurityAnalyst` to automated services such as `PrometheusCollector`, each bound by a specific license. Compliance is enforced through the license column, which mandates that tools like `ComplianceChecker` adhere to `GPL-3.0` or `Apache-2.0` standards. By coupling the identity of the data source with its licensing terms, the framework ensures that every piece of telemetry, whether it originates from a `LegacySystemBridge` or an `MLopsSpecialist`, is fully auditable and legally compliant within the organization's software inventory.

**t_agent_software_or_human**

| id | agent | agent_2 | agent_3 | license | name |
| --- | --- | --- | --- | --- | --- |
| HUMA-0001 | LegacySystemBridge | PlatformEngineer | PrometheusCollector | GPL-3.0 | ComplianceChecker |
| HUMA-0002 | SecurityAnalyst | IncidentResponder | LegalHoldService | Apache-2.0 | IncidentTriage |
| HUMA-0003 | MLopsSpecialist | PrometheusCollector | SentinelAuditBot | MPL-2.0 | LogAggregator |
| HUMA-0004 | AirflowDAGRunner | PagerOnCallDispatcher | DevOpsCoordinator | MIT | ModelValidator |
| HUMA-0005 | ShiftSupervisor | AirflowDAGRunner | KafkaStreamProcessor | Apache-2.0 | ModelValidator |
| HUMA-0006 | MLopsSpecialist | VaultSecretRotator | LegalHoldService | Apache-2.0 | LogAggregator |
| HUMA-0007 | IncidentResponder | PrometheusCollector | GlacierRecoveryJob | Apache-2.0 | AccessAuditor |
| HUMA-0008 | QualityAssuranceLead | MLopsSpecialist | PrometheusCollector | MPL-2.0 | IncidentTriage |