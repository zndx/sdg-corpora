---
chapter_id: ch_live_metric_with_unit_897fd0
topic_id: 20
family: 07_long_tail
cited_terms: ['metric_with_unit', 'settlement_financing_activity', 'quantum_computer']
model: engine-refine
---

Operational telemetry relies on a rigorous taxonomy of metrics and their corresponding units, establishing a standardized vocabulary for system performance. A metric such as network bandwidth is explicitly quantified against a metric_unit like megabytes per second, while thermal or frequency-based measurements are anchored to units such as degrees Celsius or hertz. To govern the metadata surrounding these measurements, the system employs a strict attribute typing mechanism where each attr is assigned a precise attr_type. For instance, a checksum or a license designation is enforced as an xsd:string, whereas temporal data, such as a created_date, is strictly bound to the xsd:date format, and specific designative identifiers adhere to the cco:DesignativeICE standard.

**t_metric_with_unit**

| id | metric | metric_unit |
| --- | --- | --- |
| UNIT-0001 | megabytes per second | records per second |
| UNIT-0002 | network bandwidth | megabytes per second |
| UNIT-0003 | degrees Celsius | megabytes per second |
| UNIT-0004 | hertz | hertz |
| UNIT-0005 | temperature | pressure |
| UNIT-0006 | megabytes per second | latency |

**t_metric_with_unit_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| UNIT-0001 | checksum | xsd:string |
| UNIT-0002 | created_date | xsd:date |
| UNIT-0003 | identifier | cco:DesignativeICE |
| UNIT-0004 | license | xsd:string |
| UNIT-0005 | mime_type | xsd:string |
| UNIT-0006 | size_bytes | xsd:long |
| UNIT-0007 | uri | xsd:string |
| UNIT-0008 | version | xsd:integer |

These abstract definitions are instantiated within discrete entities, identified by unique identifiers such as UNIT-0001 or UNIT-0002, which serve as the primary keys for value resolution. The system accommodates heterogeneous data storage by segregating attribute values into specialized repositories based on their misc type. Temporal attributes are resolved through date-valued records, capturing precise milestones like 2023-09-28 or 2024-02-22. Numerical telemetry is preserved in integer-valued stores, recording operational thresholds such as 477 or 97, while alphanumeric metadata—ranging from cryptographic checksums like c0ffee42 to regional deployment tags such as eu-west-3—is maintained within varchar-based value stores.

**t_metric_with_unit_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0002 | 2023-09-28 |
| UNIT-0002 | UNIT-0002 | UNIT-0002 | 2024-02-22 |
| UNIT-0003 | UNIT-0003 | UNIT-0002 | 2023-12-02 |
| UNIT-0004 | UNIT-0004 | UNIT-0002 | 2024-09-28 |
| UNIT-0005 | UNIT-0005 | UNIT-0002 | 2024-02-26 |
| UNIT-0006 | UNIT-0006 | UNIT-0002 | 2024-12-06 |

**t_metric_with_unit_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0006 | 97 |
| UNIT-0002 | UNIT-0001 | UNIT-0008 | 2 |
| UNIT-0003 | UNIT-0002 | UNIT-0006 | 477 |
| UNIT-0004 | UNIT-0002 | UNIT-0008 | 11 |
| UNIT-0005 | UNIT-0003 | UNIT-0006 | 499 |
| UNIT-0006 | UNIT-0003 | UNIT-0008 | 7 |
| UNIT-0007 | UNIT-0004 | UNIT-0006 | 214 |
| UNIT-0008 | UNIT-0004 | UNIT-0008 | 1 |

**t_metric_with_unit_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0001 | c0ffee42 |
| UNIT-0002 | UNIT-0001 | UNIT-0003 | oid:1.3.6.1 |
| UNIT-0003 | UNIT-0001 | UNIT-0004 | GPL-3.0 |
| UNIT-0004 | UNIT-0001 | UNIT-0009 | eu-west-3 |
| UNIT-0005 | UNIT-0001 | UNIT-0005 | application/parquet |
| UNIT-0006 | UNIT-0001 | UNIT-0010 | Name 06 |
| UNIT-0007 | UNIT-0001 | UNIT-0011 | data-engineering |
| UNIT-0008 | UNIT-0001 | UNIT-0012 | Tags 08 |

**dim_part_of**

| id | part_of_label | part_of_category |
| --- | --- | --- |
| COMP-0001 | Part Of Label 01 | Part Of Category 01 |
| COMP-0002 | Part Of Label 02 | Part Of Category 02 |
| COMP-0003 | Part Of Label 03 | Part Of Category 03 |
| COMP-0004 | Part Of Label 04 | Part Of Category 04 |
| COMP-0005 | Part Of Label 05 | Part Of Category 05 |
| COMP-0006 | Part Of Label 06 | Part Of Category 06 |

Beyond technical telemetry, the framework extends into financial governance through the tracking of settlement_financing_activity. These discrete financial operations, identified by keys such as ACTI-0001, encompass complex clearing mechanisms including T-PLUS-ONE-CLEAR and INTERBANK-SETTLE. Each activity is intrinsically linked to a financialinstitution providing the necessary liquidity, such as HSBC Holdings or Goldman Sachs, and is mapped to a settlementproject that defines the strategic benefit, whether it be a SWIFT GPI Rollout or a Cross-Border Rail initiative. This relational structure ensures that every financial transaction, from CASH-SETTLE-99 to SEC-SETTLE-8812, is auditable against its funding source and its intended project outcome.

**t_settlement_financing_activity**

| id | settlement_financing_activity | funds | benefits |
| --- | --- | --- | --- |
| ACTI-0001 | T-PLUS-ONE-CLEAR | HSBC Holdings | SWIFT GPI Rollout |
| ACTI-0002 | INTERBANK-SETTLE | Goldman Sachs | Regional Clearing Hub |
| ACTI-0003 | CASH-SETTLE-99 | Deutsche Bank AG | SWIFT GPI Rollout |
| ACTI-0004 | SEC-SETTLE-8812 | Deutsche Bank AG | Cross-Border Rail |
| ACTI-0005 | CASH-SETTLE-99 | Deutsche Bank AG | Cross-Border Rail |

The aggregation of operational and financial data is managed through a dimensional model that quantifies activity through event_count. Within the fact_quantum structure, individual records—such as those keyed by COMP-0001—are associated with a part_of hierarchy, denoted by part_of_key, allowing for the roll-up of metrics across organizational boundaries. For example, a specific quantum record might register an event_count of 446 or 467, reflecting the volume of transactions within a defined scope. These hierarchical relationships are contextualized by the dim_part_of dimension, which assigns descriptive part_of_label entries like Part Of Label 01 and categorizes them under part_of_category designations such as Part Of Category 02, thereby providing the necessary semantic framework for analyzing aggregated event data.

**fact_quantum**

| id | part_of_key | event_count |
| --- | --- | --- |
| COMP-0001 | COMP-0001 | 446 |
| COMP-0002 | COMP-0004 | 75 |
| COMP-0003 | COMP-0005 | 224 |
| COMP-0004 | COMP-0001 | 467 |
| COMP-0005 | COMP-0002 | 463 |
| COMP-0006 | COMP-0001 | 52 |
| COMP-0007 | COMP-0001 | 434 |
| COMP-0008 | COMP-0002 | 284 |