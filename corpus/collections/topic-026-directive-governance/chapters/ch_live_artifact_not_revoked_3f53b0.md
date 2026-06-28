---
chapter_id: ch_live_artifact_not_revoked_3f53b0
topic_id: 26
family: 07_long_tail
cited_terms: ['artifact_not_revoked', 'census_reporting_event', 'attribute_set_min_one']
model: engine-refine
---

In artifact lifecycle management, every auditable object is anchored by a unique identifier—REVO-0001 through REVO-0004 in the reference implementation—that persists across revocation states and serves as the primary key for downstream provenance queries. These identifiers bind to concrete artifacts such as `audit-log-sept`, `compliance-report-x`, `schema-def-current`, and `dataset-sanitized`, each of which may carry supplementary references (for instance, `backup-manifest-9` or `inference-pipeline-3`) that establish cross-referential dependencies. The identifier column is the immutable spine of the artifact registry; all attribute assignments, value bindings, and reporting events ultimately resolve back to it.

**t_artifact_not_revoked**

| id | artifact | artifact_2 |
| --- | --- | --- |
| REVO-0001 | audit-log-sept | backup-manifest-9 |
| REVO-0002 | compliance-report-x | inference-pipeline-3 |
| REVO-0003 | schema-def-current | backup-manifest-9 |
| REVO-0004 | dataset-sanitized | runtime-env-prod |
| REVO-0005 | audit-log-sept | backup-manifest-9 |
| REVO-0006 | compliance-report-x | staging-logs-v2 |

**dim_attribute**

| id | attribute_label | attribute_category |
| --- | --- | --- |
| ONE-0001 | Attribute Label 01 | Attribute Category 01 |
| ONE-0002 | Attribute Label 02 | Attribute Category 02 |
| ONE-0003 | Attribute Label 03 | Attribute Category 03 |
| ONE-0004 | Attribute Label 04 | Attribute Category 04 |
| ONE-0005 | Attribute Label 05 | Attribute Category 05 |
| ONE-0006 | Attribute Label 06 | Attribute Category 06 |

Attributes are described in a schema layer that pairs a human-readable name with a machine-consumable type. The attribute dictionary records entries such as `checksum`, `created_date`, `identifier`, and `license`, each annotated with a type from a namespace of schema definitions—`xsd:string`, `xsd:date`, and `cco:DesignativeICE` among them. This separation of attribute metadata from attribute values enables the system to store heterogeneous data without schema migration: date values like `2024-01-18`, `2023-09-26`, `2023-01-26`, and `2024-08-03` live in a dedicated date-value table; string values such as `c0ffee42`, `ref-8842`, `Apache-2.0`, and `rack-7` reside in a varchar store; and integer measurements including `140`, `115`, and `2` are held in an integer store. Each value row is linked to its entity (the artifact or reporting event it describes) and to its attribute definition, forming an entity-attribute-value pattern that scales without requiring DDL changes.

**t_artifact_not_revoked_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REVO-0001 | checksum | xsd:string |
| REVO-0002 | created_date | xsd:date |
| REVO-0003 | identifier | cco:DesignativeICE |
| REVO-0004 | license | xsd:string |
| REVO-0005 | mime_type | xsd:string |
| REVO-0006 | size_bytes | xsd:long |
| REVO-0007 | uri | xsd:string |
| REVO-0008 | version | xsd:integer |

**t_artifact_not_revoked_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REVO-0001 | REVO-0001 | REVO-0002 | 2024-01-18 |
| REVO-0002 | REVO-0002 | REVO-0002 | 2023-09-26 |
| REVO-0003 | REVO-0003 | REVO-0002 | 2023-01-26 |
| REVO-0004 | REVO-0004 | REVO-0002 | 2024-08-03 |
| REVO-0005 | REVO-0005 | REVO-0002 | 2024-04-14 |
| REVO-0006 | REVO-0006 | REVO-0002 | 2023-07-20 |

**t_artifact_not_revoked_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REVO-0001 | REVO-0001 | REVO-0006 | 140 |
| REVO-0002 | REVO-0001 | REVO-0008 | 2 |
| REVO-0003 | REVO-0002 | REVO-0006 | 115 |
| REVO-0004 | REVO-0002 | REVO-0008 | 2 |
| REVO-0005 | REVO-0003 | REVO-0006 | 293 |
| REVO-0006 | REVO-0003 | REVO-0008 | 12 |
| REVO-0007 | REVO-0004 | REVO-0006 | 361 |
| REVO-0008 | REVO-0004 | REVO-0008 | 1 |

**t_artifact_not_revoked_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REVO-0001 | REVO-0001 | REVO-0001 | c0ffee42 |
| REVO-0002 | REVO-0001 | REVO-0003 | ref-8842 |
| REVO-0003 | REVO-0001 | REVO-0004 | Apache-2.0 |
| REVO-0004 | REVO-0001 | REVO-0009 | rack-7 |
| REVO-0005 | REVO-0001 | REVO-0005 | text/plain |
| REVO-0006 | REVO-0001 | REVO-0010 | Name 06 |
| REVO-0007 | REVO-0001 | REVO-0011 | analytics |
| REVO-0008 | REVO-0001 | REVO-0012 | Tags 08 |

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

The census reporting subsystem extends this attribute model to statistical and regulatory events. A census reporting event—such as the Eurostat Population Census, the French INSEE Census, or the UK National Statistics Census—is characterized by when it occurs (Fiscal Year 2022-2023, Summer 2020 Collection, Q3 2021 Fieldwork Window), which social enterprise sector it tracks (Youth Employment, Microfinance Services, Sustainable Ag, Elder Care), and the date it was published (2024-01-22, 2019-08-05, 2021-12-18, 2021-04-15). These events also carry their own attribute definitions—`encoding`, `label_text`, `language`—all typed as `xsd:string`, with values like `Encoding 01`, `Encoding 04`, `pre-release note`, and `fr` stored in a varchar value table. The `censusperiod` and `reportingdate` columns provide temporal anchors that allow downstream analytics to join reporting events to fiscal calendars and publication timelines.

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

At the analytical layer, a fact-dimension model captures measured attribute values alongside quality indicators. The fact table records each measurement as a row with an `attribute_key` pointing to a dimension record, a numeric `value`, a `confidence` score ranging from 0.123 to 0.926, and an `uncertainty` magnitude spanning hundreds of units (455.70 to 957.49 in the sample). The dimension table provides the human-readable `attribute_label` and an `attribute_category` that groups related measures into taxonomies. This separation allows reporting engines to aggregate values by category, weight them by confidence, and surface uncertainty bounds without conflating measurement data with metadata.

**fact_attribute**

| id | attribute_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| ONE-0001 | ONE-0005 | 0.926 | 957.49 | 482.01 |
| ONE-0002 | ONE-0003 | 0.786 | 274.08 | 742.87 |
| ONE-0003 | ONE-0005 | 0.123 | 455.70 | 100.75 |
| ONE-0004 | ONE-0003 | 0.178 | 516.20 | 779.52 |