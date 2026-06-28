---
chapter_id: ch_live_census_reporting_event_835da2
topic_id: 183
family: 08_derived
cited_terms: ['census_reporting_event', 'column_type_changed_from', 'requirement_applies_to_system']
model: engine-refine
---

Within governed data architectures, every observable phenomenon is anchored to a stable identifier—a unique key such as EVEN-0001 or SYST-0001—that serves as the immutable reference point across all downstream analyses and cross-system integrations. The entity concept extends this anchoring by grouping heterogeneous attribute values under a single logical record, enabling flexible, schema-on-read modeling where the structure of metadata is deferred until query time. An entity like EVEN-0001, representing a specific census reporting event, carries multiple attribute values that are resolved through a foreign-key relationship: the entity_id column in the value tables points back to the parent record, while the attr_id column resolves to the corresponding attribute definition. This entity-attribute-value decomposition allows the same underlying mechanism to support fundamentally different domains—census metadata with attributes like encoding and language, and system requirements with attributes such as effective_date, enforcement, mandatory, and priority—without requiring separate schemas for each use case.

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

**t_requirement_applies_to_system**

| id | requirement |
| --- | --- |
| SYST-0001 | latency under 50ms |
| SYST-0002 | audit logging enabled |
| SYST-0003 | encryption at rest |
| SYST-0004 | backup frequency daily |
| SYST-0005 | network segmentation mandatory |
| SYST-0006 | network segmentation mandatory |

**t_requirement_applies_to_system_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SYST-0001 | effective_date | xsd:date |
| SYST-0002 | enforcement | xsd:string |
| SYST-0003 | mandatory | xsd:boolean |
| SYST-0004 | priority | xsd:integer |
| SYST-0005 | review_cycle_days | xsd:integer |
| SYST-0006 | scope | xsd:string |
| SYST-0007 | encoding | xsd:string |
| SYST-0008 | label_text | xsd:string |

**t_requirement_applies_to_system_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0003 | false |
| SYST-0002 | SYST-0002 | SYST-0003 | true |
| SYST-0003 | SYST-0003 | SYST-0003 | true |
| SYST-0004 | SYST-0004 | SYST-0003 | false |
| SYST-0005 | SYST-0005 | SYST-0003 | true |
| SYST-0006 | SYST-0006 | SYST-0003 | false |

**t_requirement_applies_to_system_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0001 | 2025-05-21 |
| SYST-0002 | SYST-0002 | SYST-0001 | 2024-02-21 |
| SYST-0003 | SYST-0003 | SYST-0001 | 2023-05-13 |
| SYST-0004 | SYST-0004 | SYST-0001 | 2023-08-26 |
| SYST-0005 | SYST-0005 | SYST-0001 | 2025-01-01 |
| SYST-0006 | SYST-0006 | SYST-0001 | 2023-04-22 |

**t_requirement_applies_to_system_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0004 | 1 |
| SYST-0002 | SYST-0001 | SYST-0005 | 391 |
| SYST-0003 | SYST-0002 | SYST-0004 | 5 |
| SYST-0004 | SYST-0002 | SYST-0005 | 295 |
| SYST-0005 | SYST-0003 | SYST-0004 | 2 |
| SYST-0006 | SYST-0003 | SYST-0005 | 418 |
| SYST-0007 | SYST-0004 | SYST-0004 | 4 |
| SYST-0008 | SYST-0004 | SYST-0005 | 590 |

**t_requirement_applies_to_system_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0007 | Encoding 01 |
| SYST-0002 | SYST-0001 | SYST-0002 | Enforcement 02 |
| SYST-0003 | SYST-0001 | SYST-0008 | audit excerpt |
| SYST-0004 | SYST-0001 | SYST-0009 | fr |
| SYST-0005 | SYST-0001 | SYST-0006 | Scope 05 |
| SYST-0006 | SYST-0002 | SYST-0007 | Encoding 06 |
| SYST-0007 | SYST-0002 | SYST-0002 | Enforcement 07 |
| SYST-0008 | SYST-0002 | SYST-0008 | intake form |

The attribute definition layer, which pairs an attr_name with an attr_type, establishes the semantic contract for what kind of data a given attribute can hold. Types follow the XSD namespace convention, with xsd:string accommodating free-form text like "Encoding 01" or "fr", xsd:date constraining values to ISO 8601 dates such as 2025-05-21, xsd:boolean restricting values to true or false, and xsd:integer enforcing whole-number constraints. Because relational databases cannot store heterogeneous types in a single column, the value layer is split into type-specific tables—val_varchar, val_boolean, val_date, and val_int—each carrying a value column that the schema documentation generically labels misc to reflect its role as a catch-all for the actual data payload. This typed value separation preserves type safety at query time while maintaining the flexibility of an attribute-centric model, ensuring that a requirement's mandatory flag (a boolean) is never conflated with its priority score (an integer) or its enforcement description (a string).

Census reporting events form a domain-specific entity class that captures the full lifecycle of statistical data collection. Each event is identified by a census_reporting_event name—such as Eurostat Population Census, French INSEE Census, or UK National Statistics Census—and is contextualized by when it occurs_during_period, whether that be Fiscal Year 2022-2023, Summer 2020 Collection, or Q3 2021 Fieldwork Window. The tracks_sector dimension narrows the scope to a particular social_enterprise_sector, with observed values including Youth Employment, Microfinance Services, Sustainable Ag, and Elder Care, while the published_on_date records the reportingdate when the event's results were made publicly available, ranging from 2019-08-05 for the French INSEE Census to 2024-01-22 for the Eurostat Population Census. Together, these columns form a temporal and topical index that enables cross-event comparison and auditability of when and for whom data was collected.

The type_changed_from construct and its associated category classification serve as a dimensional anchor for tracking data lineage and schema evolution. The fact table stores a type_changed_from_key that references a dimension record containing both a human-readable label—Type Changed From Label 01 through 04—and a categorical classification such as Type Changed From Category 01 through 04. This separation of label from category mirrors a standard star-schema pattern, allowing analytical queries to aggregate change events by category while preserving the descriptive label for reporting. Each fact row also carries a confidence measure, a decimal value ranging from 0.068 to 0.354 across the observed records, which quantifies the reliability of the change event, and an uncertainty value expressed as a magnitude—404.01, 560.21, 744.10, or 984.09—that bounds the potential deviation of the associated value, which itself spans from 131.27 to 571.55. This combination of confidence, uncertainty, and the measured value provides a complete probabilistic profile for each recorded change, enabling downstream systems to weight or filter change events according to their trustworthiness.

**fact_column**

| id | type_changed_from_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| FROM-0001 | FROM-0006 | 0.164 | 560.21 | 257.80 |
| FROM-0002 | FROM-0003 | 0.068 | 744.10 | 571.55 |
| FROM-0003 | FROM-0006 | 0.107 | 984.09 | 140.18 |
| FROM-0004 | FROM-0006 | 0.354 | 404.01 | 131.27 |
| FROM-0005 | FROM-0001 | 0.790 | 109.97 | 235.19 |
| FROM-0006 | FROM-0002 | 0.934 | 653.09 | 813.74 |
| FROM-0007 | FROM-0004 | 0.938 | 827.04 | 409.13 |
| FROM-0008 | FROM-0003 | 0.734 | 419.22 | 492.32 |

**dim_type_changed_from**

| id | type_changed_from_label | type_changed_from_category |
| --- | --- | --- |
| FROM-0001 | Type Changed From Label 01 | Type Changed From Category 01 |
| FROM-0002 | Type Changed From Label 02 | Type Changed From Category 02 |
| FROM-0003 | Type Changed From Label 03 | Type Changed From Category 03 |
| FROM-0004 | Type Changed From Label 04 | Type Changed From Category 04 |
| FROM-0005 | Type Changed From Label 05 | Type Changed From Category 05 |
| FROM-0006 | Type Changed From Label 06 | Type Changed From Category 06 |