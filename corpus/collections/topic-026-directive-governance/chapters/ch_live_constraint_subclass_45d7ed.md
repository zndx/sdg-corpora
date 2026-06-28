---
chapter_id: ch_live_constraint_subclass_45d7ed
topic_id: 26
family: 01_foundation
cited_terms: ['constraint_subclass', 'anonymous_demographic_information', 'cardinality_max_one_generic']
model: engine-refine
---

Within data governance frameworks, the classification and protection of demographic information hinges on maintaining clear boundaries between anonymous aggregates, identifiable demographic fields, and personally identifiable information. The system distinguishes three tiers of sensitivity: anonymous demographic information such as `school_district_enrollment`, `household_size`, `geographic_region`, and `health_survey_responses` sits at the lowest sensitivity tier; demographic information like `age_brackets` and `household_size` occupies a middle tier where re-identification risk increases; and personally identifiable information—including `home_address`, `full_legal_name`, and `passport_number`—represents the highest sensitivity class requiring the strongest controls. This three-tier taxonomy ensures that data handling policies scale appropriately with risk, and that any attribute carrying PII triggers the most stringent access controls and audit requirements.

**t_anonymous_demographic_information**

| id | anonymous_demographic_information | demographic_information | personally_identifiable_information |
| --- | --- | --- | --- |
| INFO-0001 | school_district_enrollment | health_survey_responses | home_address |
| INFO-0002 | household_size | geographic_region | home_address |
| INFO-0003 | geographic_region | age_brackets | full_legal_name |
| INFO-0004 | health_survey_responses | household_size | passport_number |
| INFO-0005 | housing_market_surveys | age_brackets | passport_number |
| INFO-0006 | marital_status | disability_status | financial_account |

Each data element is described through an attribute metadata layer that captures not only the semantic meaning of a field but also its technical type. Attributes such as `confidence`, `dimension_kind`, `method`, and `recorded_at` are typed using XML Schema Datatypes—`xsd:decimal` for numeric confidence scores, `xsd:string` for categorical labels like `Dimension Kind 01` or `Encoding 02`, and `xsd:dateTime` for temporal stamps such as `2024-08-15T06:37:30`. This type discipline enables the system to enforce value constraints at ingestion, validate data quality rules, and route values to the appropriate storage table based on their semantic type. The entity-attribute-value pattern distributes these typed values across three specialized tables—`t_anonymous_demographic_information_val_decimal` for numeric measures like `0.448` or `124.47`, `t_anonymous_demographic_information_val_varchar` for string payloads, and `t_anonymous_demographic_information_val_datetime` for temporal records—ensuring type-safe storage while preserving a unified entity-level view through the shared `entity_id` and `attr_id` foreign keys.

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

Governance over these data assets is enforced through a constraint management layer that binds policy rules to specific infrastructure components. Each constraint—such as `Geofence boundary`, `Audit log retention`, `Data retention policy`, or `Encryption standard`—is assigned a `priority` level ranging from 2 to 4, where higher numbers indicate greater operational urgency, and a `review_cycle_days` interval that dictates how frequently the constraint must be re-evaluated, spanning from 185 days for data retention policies to 467 days for audit log retention. These constraints apply to concrete targets including `Database cluster`, `Compute node`, `Network interface`, and `Sensor array`, creating a traceable chain from abstract policy to physical asset. The cardinality layer further constrains how entities relate to one another, enforcing rules such as `mandatory_one` for required references to `device_metrics`, `strict_unique` for `asset_registry` entries, `singular_ref` for `audit_logs`, and `first_match` for `config_params`, thereby preventing ambiguous or duplicate associations that could undermine auditability.

**t_constraint_subclass**

| id | constraint | constrains | priority | review_cycle_days |
| --- | --- | --- | --- | --- |
| CONS-0001 | Geofence boundary | Database cluster | 3 | 311 |
| CONS-0002 | Audit log retention | Compute node | 3 | 467 |
| CONS-0003 | Data retention policy | Network interface | 4 | 185 |
| CONS-0004 | Encryption standard | Sensor array | 2 | 391 |

**t_cardinality_max_one_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | mandatory_one | device_metrics |
| GENE-0002 | strict_unique | asset_registry |
| GENE-0003 | singular_ref | audit_logs |
| GENE-0004 | first_match | config_params |