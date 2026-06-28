---
chapter_id: ch_live_census_reporting_event_1d46b1
topic_id: 65
family: 08_derived
cited_terms: ['census_reporting_event', 'process_with_min_one_artifact', 'ebpfevent_observes_syscall_xref']
model: engine-refine
---

Census reporting events constitute the primary temporal anchors of the data governance framework, each identified by a stable surrogate key such as EVEN-0001 or EVEN-0002 and associated with a specific reporting event type—Eurostat Population Census, French INSEE Census, UK National Statistics Census—alongside the period during which data collection occurs, whether Fiscal Year 2022-2023, Summer 2020 Collection, or Q3 2021 Fieldwork Window. These events are further scoped to a social enterprise sector, ranging from Youth Employment and Microfinance Services to Sustainable Ag and Elder Care, and carry a publication date that records when the census output was made available, as with 2024-01-22 for the first Eurostat event or 2019-08-05 for the INSEE collection. The identifier column provides the immutable reference by which all downstream attribute assignments and value bindings are resolved, ensuring that every metadata annotation can be traced back to its originating reporting event without ambiguity.

**t_census_reporting_event**

| id | census_reporting_event | occurs_during_period | tracks_sector | published_on_date |
| --- | --- | --- | --- | --- |
| EVEN-0001 | Eurostat Population Census | Fiscal Year 2022-2023 | Youth Employment | 2024-01-22 |
| EVEN-0002 | French INSEE Census | Summer 2020 Collection | Microfinance Services | 2019-08-05 |
| EVEN-0003 | Eurostat Population Census | Fiscal Year 2022-2023 | Sustainable Ag | 2021-12-18 |
| EVEN-0004 | UK National Statistics Census | Q3 2021 Fieldwork Window | Elder Care | 2021-04-15 |
| EVEN-0005 | 2020 US Decennial Census | Q1 2023 Validation Period | Public Transit | 2023-10-01 |
| EVEN-0006 | Brazil IBGE Census | April 2020 Counting Period | Digital Literacy | 2023-06-28 |
| EVEN-0007 | Australian Bureau Census | Autumn 2021 Household Survey | Healthcare Access | 2024-01-22 |
| EVEN-0008 | Japan Statistics Census | Biennial 2018-2020 Cycle | Healthcare Access | 2023-10-01 |

**t_census_reporting_event_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | encoding | xsd:string |
| EVEN-0002 | label_text | xsd:string |
| EVEN-0003 | language | xsd:string |

The attribute system operates through a two-level decomposition: attribute definitions reside in a dedicated registry where each entry carries an attr_name—encoding, label_text, language for census events, and duration_seconds, end_time, exit_code, host_name for process artifacts—paired with an attr_type that enforces schema discipline through XML Schema datatypes such as xsd:string, xsd:decimal, xsd:dateTime, and xsd:integer. This separation of attribute schema from attribute values enables the framework to accommodate heterogeneous metadata without schema migration. A census reporting event may carry an encoding attribute valued at Encoding 01 or Encoding 04, a language attribute set to fr, or a label_text attribute containing a pre-release note, while a process artifact such as the Schema migration job (ARTI-0001) or Data quality validation (ARTI-0002) may record a duration_seconds of 148.27 or 6895.59, an exit_code of 973 or 750, a host_name of node-a01, or an end_time of 2025-04-14T02:53:50. The attr_type column guarantees that values are cast and validated against the correct datatype before persistence, preventing type drift across the provenance chain.

**t_process_with_min_one_artifact**

| id | process |
| --- | --- |
| ARTI-0001 | Schema migration job |
| ARTI-0002 | Data quality validation |
| ARTI-0003 | Provenance capture run |
| ARTI-0004 | Batch ingestion run |
| ARTI-0005 | Stream processing cycle |
| ARTI-0006 | Metadata extraction run |
| ARTI-0007 | Model retraining pass |

**t_process_with_min_one_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | duration_seconds | xsd:decimal |
| ARTI-0002 | end_time | xsd:dateTime |
| ARTI-0003 | exit_code | xsd:integer |
| ARTI-0004 | host_name | xsd:string |
| ARTI-0005 | log_level | xsd:string |
| ARTI-0006 | phase | xsd:string |
| ARTI-0007 | retry_count | xsd:integer |
| ARTI-0008 | scheduled_at | xsd:dateTime |

Value storage follows an entity-attribute-value pattern that partitions by datatype to preserve precision: varchar values such as initiation or failed are stored in the character table, decimal values like 3687.07 or 1136.57 in the decimal table, integer values including 28 or 47 in the integer table, and datetime values such as 2024-05-27T05:53:32 or 2023-10-14T03:08:29 in the datetime table. Each value row binds an entity_id to an attr_id through a foreign-key relationship, where the entity_id references either a census reporting event or a process artifact, and the attr_id references the corresponding attribute definition. This design permits a single entity to carry an arbitrary number of typed attributes without denormalization, and the misc column serves as the generic value container across all type-specific tables, abstracting the datatype distinction from application logic.

**t_census_reporting_event_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | Encoding 01 |
| EVEN-0002 | EVEN-0001 | EVEN-0002 | pre-release note |
| EVEN-0003 | EVEN-0001 | EVEN-0003 | fr |
| EVEN-0004 | EVEN-0002 | EVEN-0001 | Encoding 04 |
| EVEN-0005 | EVEN-0002 | EVEN-0002 | audit excerpt |
| EVEN-0006 | EVEN-0002 | EVEN-0003 | de |
| EVEN-0007 | EVEN-0003 | EVEN-0001 | Encoding 07 |
| EVEN-0008 | EVEN-0003 | EVEN-0002 | nightly summary |

**t_process_with_min_one_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | 2025-04-14T02:53:50 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | 2024-05-27T05:53:32 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | 2023-10-14T03:08:29 |
| ARTI-0004 | ARTI-0002 | ARTI-0002 | 2024-12-11T09:34:24 |
| ARTI-0005 | ARTI-0002 | ARTI-0008 | 2025-03-21T21:19:18 |
| ARTI-0006 | ARTI-0002 | ARTI-0009 | 2023-01-02T13:07:40 |
| ARTI-0007 | ARTI-0003 | ARTI-0002 | 2024-10-24T03:35:48 |
| ARTI-0008 | ARTI-0003 | ARTI-0008 | 2023-04-04T03:39:03 |

**t_process_with_min_one_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 148.27 |
| ARTI-0002 | ARTI-0002 | ARTI-0001 | 6895.59 |
| ARTI-0003 | ARTI-0003 | ARTI-0001 | 3687.07 |
| ARTI-0004 | ARTI-0004 | ARTI-0001 | 1136.57 |
| ARTI-0005 | ARTI-0005 | ARTI-0001 | 4210.38 |
| ARTI-0006 | ARTI-0006 | ARTI-0001 | 5529.13 |
| ARTI-0007 | ARTI-0007 | ARTI-0001 | 4109.43 |

**t_process_with_min_one_artifact_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0003 | 973 |
| ARTI-0002 | ARTI-0001 | ARTI-0007 | 28 |
| ARTI-0003 | ARTI-0002 | ARTI-0003 | 750 |
| ARTI-0004 | ARTI-0002 | ARTI-0007 | 47 |
| ARTI-0005 | ARTI-0003 | ARTI-0003 | 118 |
| ARTI-0006 | ARTI-0003 | ARTI-0007 | 269 |
| ARTI-0007 | ARTI-0004 | ARTI-0003 | 506 |
| ARTI-0008 | ARTI-0004 | ARTI-0007 | 132 |

**t_process_with_min_one_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | node-a01 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | Log Level 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0006 | initiation |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | failed |
| ARTI-0005 | ARTI-0001 | ARTI-0011 | Triggered By 05 |
| ARTI-0006 | ARTI-0002 | ARTI-0004 | edge-03 |
| ARTI-0007 | ARTI-0002 | ARTI-0005 | Log Level 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0006 | execution |

The ebpfevent dimension and fact pair extends the framework into system-level performance monitoring, where dim_ebpfevent provides categorical labels—Ebpfevent Label 01 through Ebpfevent Label 04—organized by ebpfevent_category such as Ebpfevent Category 01 through Ebpfevent Category 04, while fact_ebpfevent records the operational telemetry: duration_seconds ranging from 889.87 to 5696.76, exit codes including 988, 313, 278, and 158, and retry counts from 38 to 427. The ebpfevent_key column in the fact table links each performance record to its dimensional counterpart, enabling aggregation by category and temporal analysis of execution duration and failure patterns. The exit column captures the termination status of each event, serving as the primary signal for downstream alerting and remediation workflows.

**fact_ebpfevent**

| id | ebpfevent_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| XREF-0001 | XREF-0003 | 889.87 | 988 | 278 |
| XREF-0002 | XREF-0005 | 1832.41 | 313 | 427 |
| XREF-0003 | XREF-0001 | 3410.73 | 278 | 133 |
| XREF-0004 | XREF-0005 | 5696.76 | 158 | 38 |
| XREF-0005 | XREF-0005 | 4846.66 | 7 | 455 |
| XREF-0006 | XREF-0004 | 4215.38 | 52 | 460 |
| XREF-0007 | XREF-0006 | 653.90 | 100 | 108 |
| XREF-0008 | XREF-0005 | 2673.38 | 169 | 73 |

**dim_ebpfevent**

| id | ebpfevent_label | ebpfevent_category |
| --- | --- | --- |
| XREF-0001 | Ebpfevent Label 01 | Ebpfevent Category 01 |
| XREF-0002 | Ebpfevent Label 02 | Ebpfevent Category 02 |
| XREF-0003 | Ebpfevent Label 03 | Ebpfevent Category 03 |
| XREF-0004 | Ebpfevent Label 04 | Ebpfevent Category 04 |
| XREF-0005 | Ebpfevent Label 05 | Ebpfevent Category 05 |
| XREF-0006 | Ebpfevent Label 06 | Ebpfevent Category 06 |

Reporting date and census period together establish the temporal provenance of each census reporting event, with published_on_date values such as 2024-01-22, 2021-12-18, and 2021-04-15 indicating when outputs became available, while occurs_during_period values like Fiscal Year 2022-2023 and Summer 2020 Collection define the data collection window. This dual-temporal model supports both retrospective analysis of publication latency and prospective scheduling of future reporting cycles. The framework's reliance on stable identifiers across all tables—EVEN-0001, ARTI-0001, XREF-0001—ensures that every attribute assignment, value binding, and performance measurement can be reconstructed into a coherent provenance graph, making the system suitable for audit trails, compliance reporting, and operational diagnostics across heterogeneous data domains.