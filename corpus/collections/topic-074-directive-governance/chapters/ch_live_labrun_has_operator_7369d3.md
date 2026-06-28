---
chapter_id: ch_live_labrun_has_operator_7369d3
topic_id: 74
family: 02_observation_measurement
cited_terms: ['labrun_has_operator', 'anonymous_demographic_information', 'directory_query_service']
model: engine-refine
---

Anonymous demographic information serves as the foundational construct for managing population-level data while maintaining strict privacy boundaries. The core demographic information table distinguishes between truly anonymous attributes—such as school_district_enrollment, household_size, geographic_region, and health_survey_responses—and sensitive demographic_information fields like age_brackets that, while not individually identifying, still warrant careful handling. Critically, the schema enforces separation by maintaining a dedicated column for personally_identifiable_information, which captures data such as home_address, full_legal_name, and passport_number, ensuring that any linkage between anonymous demographic records and identifiable entities is explicitly tracked and auditable. This architectural separation supports compliance frameworks that require demonstrable controls over PII exposure.

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

The attribute system provides a typed, extensible mechanism for enriching demographic records with metadata. Each attribute carries a name—confidence, dimension_kind, method, recorded_at—and a strict type definition drawn from the XML Schema namespace, including xsd:decimal for numeric confidence scores, xsd:string for categorical descriptors like Dimension Kind 01 or Encoding 02, and xsd:dateTime for temporal stamps such as 2024-08-15T06:37:30. Values are stored across three specialized value tables keyed by type: decimal values like 0.448 and 124.47 for confidence and measurement data, varchar values for textual attributes, and datetime values for recording timestamps. This type-disaggregated design ensures that queries against demographic attributes can leverage appropriate type semantics while preventing type coercion vulnerabilities. The entity_id column in each value table links back to the demographic information record, establishing a normalized many-to-one relationship between attributes and their parent records.

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

Operational execution of data processing workflows is captured through the lab run fact table, which records the lifecycle of each operator invocation. Each run carries a unique identifier—OPER-0001 through OPER-0004—and references its operator through a foreign key, enabling aggregation by operator category such as Operator Category 01 or Operator Category 02. Duration_seconds measures execution time with precision, ranging from approximately 4,308 seconds (4308.22 for OPER-0002) to 5,155 seconds (5155.73 for OPER-0004), providing the basis for performance benchmarking and SLA compliance. Exit codes—122, 691, 566, and 3—encode the termination state of each run, while retry_count quantifies resilience, with values spanning from 12 retries (OPER-0004) to 265 retries (OPER-0001), indicating varying degrees of operational instability that may correlate with specific operator categories or workload characteristics.

**fact_labrun**

| id | operator_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| OPER-0001 | OPER-0007 | 4856.18 | 122 | 265 |
| OPER-0002 | OPER-0005 | 4308.22 | 691 | 244 |
| OPER-0003 | OPER-0002 | 4764.89 | 566 | 106 |
| OPER-0004 | OPER-0007 | 5155.73 | 3 | 12 |
| OPER-0005 | OPER-0001 | 385.91 | 81 | 197 |

**dim_operator**

| id | operator_label | operator_category |
| --- | --- | --- |
| OPER-0001 | Operator Label 01 | Operator Category 01 |
| OPER-0002 | Operator Label 02 | Operator Category 02 |
| OPER-0003 | Operator Label 03 | Operator Category 03 |
| OPER-0004 | Operator Label 04 | Operator Category 04 |
| OPER-0005 | Operator Label 05 | Operator Category 05 |
| OPER-0006 | Operator Label 06 | Operator Category 06 |
| OPER-0007 | Operator Label 07 | Operator Category 07 |

Directory event tracking establishes a dual-axis view of service interactions by correlating target users with response generation. The fact_directory table records each service event with an event_count—ranging from 81 to 397 occurrences—and links to both a targets_user dimension (such as Targets User Category 01 through 04) and a generates_response dimension (such as Generates Response Category 01 through 04). This structure enables cross-tabulated analysis of which user segments trigger which response types, supporting governance requirements around response attribution and user impact assessment. The dimension tables for both targets_user and generates_response provide categorical labels—Targets User Label 01, Generates Response Label 02, and so forth—that serve as the human-readable identifiers for audit reports and compliance documentation. Together, these tables form a complete traceability chain from demographic data collection through attribute enrichment, operator execution, and service response generation.

**fact_directory**

| id | targets_user_key | generates_response_key | event_count |
| --- | --- | --- | --- |
| SERV-0001 | SERV-0006 | SERV-0007 | 315 |
| SERV-0002 | SERV-0002 | SERV-0002 | 259 |
| SERV-0003 | SERV-0001 | SERV-0006 | 81 |
| SERV-0004 | SERV-0002 | SERV-0005 | 397 |

**dim_targets_user**

| id | targets_user_label | targets_user_category |
| --- | --- | --- |
| SERV-0001 | Targets User Label 01 | Targets User Category 01 |
| SERV-0002 | Targets User Label 02 | Targets User Category 02 |
| SERV-0003 | Targets User Label 03 | Targets User Category 03 |
| SERV-0004 | Targets User Label 04 | Targets User Category 04 |
| SERV-0005 | Targets User Label 05 | Targets User Category 05 |
| SERV-0006 | Targets User Label 06 | Targets User Category 06 |

**dim_generates_response**

| id | generates_response_label | generates_response_category |
| --- | --- | --- |
| SERV-0001 | Generates Response Label 01 | Generates Response Category 01 |
| SERV-0002 | Generates Response Label 02 | Generates Response Category 02 |
| SERV-0003 | Generates Response Label 03 | Generates Response Category 03 |
| SERV-0004 | Generates Response Label 04 | Generates Response Category 04 |
| SERV-0005 | Generates Response Label 05 | Generates Response Category 05 |
| SERV-0006 | Generates Response Label 06 | Generates Response Category 06 |
| SERV-0007 | Generates Response Label 07 | Generates Response Category 07 |
| SERV-0008 | Generates Response Label 08 | Generates Response Category 08 |