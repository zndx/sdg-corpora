---
chapter_id: ch_live_directive_not_obsolete_3ca7ad
topic_id: 186
family: 03_directive_governance
cited_terms: ['directive_not_obsolete', 'equiv_union_ice_branches', 'trace_originates_from']
model: engine-refine
---

Within the governance framework, every directive and operational artifact is anchored by a unique identifier—such as `OBSO-0001` through `OBSO-0004`—that serves as the immutable key across all related metadata tables. These identifiers bind together the directive definitions themselves, which include standards like the CIS Critical Security Controls, the HIPAA Security Rule, and the OWASP Testing Guide v4, with their associated attribute definitions and typed values. An entity, referenced by the same identifier space, represents the concrete instance to which attributes are applied, enabling a normalized model where attribute metadata is decoupled from the values assigned to specific entities. This separation ensures that the schema governing what can be measured remains stable even as new entities are onboarded and new attribute values are recorded.

**t_directive_not_obsolete**

| id | directive | directive_2 |
| --- | --- | --- |
| OBSO-0001 | CIS Critical Security Controls | IHE Patient Identity Cross |
| OBSO-0002 | OGC API Features Standard | HL7 FHIR Implementation Guide |
| OBSO-0003 | IEEE 802.11ax Standard | HIPAA Security Rule |
| OBSO-0004 | CIS Benchmark Distribution 8 | OWASP Testing Guide v4 |
| OBSO-0005 | OWASP Application Security Guide | NIST CSF v2 Profile |
| OBSO-0006 | OWASP Application Security Guide | CIS Critical Security Controls |
| OBSO-0007 | MITRE ATT&CK Framework | OWASP Testing Guide v4 |

**t_directive_not_obsolete_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OBSO-0001 | effective_date | xsd:date |
| OBSO-0002 | enforcement | xsd:string |
| OBSO-0003 | mandatory | xsd:boolean |
| OBSO-0004 | priority | xsd:integer |
| OBSO-0005 | review_cycle_days | xsd:integer |
| OBSO-0006 | scope | xsd:string |
| OBSO-0007 | encoding | xsd:string |
| OBSO-0008 | label_text | xsd:string |

**t_directive_not_obsolete_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSO-0001 | OBSO-0001 | OBSO-0003 | true |
| OBSO-0002 | OBSO-0002 | OBSO-0003 | false |
| OBSO-0003 | OBSO-0003 | OBSO-0003 | false |
| OBSO-0004 | OBSO-0004 | OBSO-0003 | false |
| OBSO-0005 | OBSO-0005 | OBSO-0003 | true |
| OBSO-0006 | OBSO-0006 | OBSO-0003 | true |
| OBSO-0007 | OBSO-0007 | OBSO-0003 | true |

**t_directive_not_obsolete_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSO-0001 | OBSO-0001 | OBSO-0001 | 2024-10-21 |
| OBSO-0002 | OBSO-0002 | OBSO-0001 | 2024-03-22 |
| OBSO-0003 | OBSO-0003 | OBSO-0001 | 2024-07-16 |
| OBSO-0004 | OBSO-0004 | OBSO-0001 | 2024-10-21 |
| OBSO-0005 | OBSO-0005 | OBSO-0001 | 2023-05-26 |
| OBSO-0006 | OBSO-0006 | OBSO-0001 | 2023-06-12 |
| OBSO-0007 | OBSO-0007 | OBSO-0001 | 2025-06-10 |

**t_directive_not_obsolete_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSO-0001 | OBSO-0001 | OBSO-0004 | 5 |
| OBSO-0002 | OBSO-0001 | OBSO-0005 | 703 |
| OBSO-0003 | OBSO-0002 | OBSO-0004 | 4 |
| OBSO-0004 | OBSO-0002 | OBSO-0005 | 418 |
| OBSO-0005 | OBSO-0003 | OBSO-0004 | 2 |
| OBSO-0006 | OBSO-0003 | OBSO-0005 | 865 |
| OBSO-0007 | OBSO-0004 | OBSO-0004 | 5 |
| OBSO-0008 | OBSO-0004 | OBSO-0005 | 415 |

**t_directive_not_obsolete_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSO-0001 | OBSO-0001 | OBSO-0007 | Encoding 01 |
| OBSO-0002 | OBSO-0001 | OBSO-0002 | Enforcement 02 |
| OBSO-0003 | OBSO-0001 | OBSO-0008 | intake form |
| OBSO-0004 | OBSO-0001 | OBSO-0009 | en |
| OBSO-0005 | OBSO-0001 | OBSO-0006 | Scope 05 |
| OBSO-0006 | OBSO-0002 | OBSO-0007 | Encoding 06 |
| OBSO-0007 | OBSO-0002 | OBSO-0002 | Enforcement 07 |
| OBSO-0008 | OBSO-0002 | OBSO-0008 | nightly summary |

Attributes are classified by type to enforce data integrity and enable type-safe querying across the compliance store. The attribute registry defines names such as `effective_date`, `enforcement`, `mandatory`, and `priority`, each mapped to an XSD type—`xsd:date`, `xsd:string`, `xsd:boolean`, and `xsd:integer` respectively. Typed value tables enforce this contract: boolean attributes like `mandatory` store values of `true` or `false` against entity-attribute pairs, date attributes like `effective_date` hold ISO-formatted dates such as `2024-10-21` or `2024-03-22`, integer attributes like `priority` capture numeric thresholds ranging from `4` to `703`, and string attributes accommodate free-form text including `intake form`, `Enforcement 02`, and locale codes like `en`. This typed value architecture prevents type coercion errors and supports precise filtering—for instance, isolating all entities where a mandatory compliance attribute evaluates to `true` or where a priority score exceeds a defined threshold.

The origin of each operational record is captured through a dedicated dimension that pairs a label with a category, enabling both human-readable traceability and programmatic classification. An origin record carries a label such as `Originates From Label 01` alongside a category designation like `Originates From Category 01`, and these dimension members are referenced by foreign key from the trace fact table. This two-level classification—label for display, category for grouping—supports drill-down reporting where compliance officers can aggregate trace events by origin category while retaining the ability to surface the specific originating source for any individual record.

**dim_originates_from**

| id | originates_from_label | originates_from_category |
| --- | --- | --- |
| FROM-0001 | Originates From Label 01 | Originates From Category 01 |
| FROM-0002 | Originates From Label 02 | Originates From Category 02 |
| FROM-0003 | Originates From Label 03 | Originates From Category 03 |
| FROM-0004 | Originates From Label 04 | Originates From Category 04 |
| FROM-0005 | Originates From Label 05 | Originates From Category 05 |
| FROM-0006 | Originates From Label 06 | Originates From Category 06 |
| FROM-0007 | Originates From Label 07 | Originates From Category 07 |

Trace facts record the operational characteristics of each compliance event, capturing three quantitative dimensions: the duration of the operation in seconds, the exit code indicating the outcome, and the number of retry attempts before final resolution. A trace entry might record a duration of `1874.27` seconds with an exit code of `491` and `399` retries, while another might show `3336.66` seconds, exit code `60`, and `459` retries. The `originates_from_key` column links each trace back to its source in the origin dimension, creating a bridge between operational telemetry and the governance taxonomy. These metrics enable SLA monitoring, failure pattern analysis, and the identification of sources that consistently require excessive retries or produce non-zero exit codes.

**fact_trace**

| id | originates_from_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| FROM-0001 | FROM-0002 | 1874.27 | 491 | 399 |
| FROM-0002 | FROM-0001 | 2092.44 | 900 | 179 |
| FROM-0003 | FROM-0005 | 3940.66 | 420 | 396 |
| FROM-0004 | FROM-0004 | 3336.66 | 60 | 459 |

Multilingual support is provided through the equivalence union branches table, which associates each branch identifier with a label text and a language code. Branches such as `BRAN-0001` carry the label `calibration record` in French (`fr`), while `BRAN-0002` stores `change rationale` in Spanish (`es`), and `BRAN-0004` holds `intake form` in German (`de`). This structure allows the same conceptual branch to be presented in multiple languages without duplicating the underlying identifier, supporting compliance documentation for multilingual regulatory environments where the same directive or control may need to be referenced in the local language of each jurisdiction.

**t_equiv_union_ice_branches**

| id | equiv | label_text | language |
| --- | --- | --- | --- |
| BRAN-0001 | Calibration_Offset | calibration record | fr |
| BRAN-0002 | Equipment_Model | change rationale | es |
| BRAN-0003 | Data_Retention_Policy | calibration record | es |
| BRAN-0004 | Quality_Score | intake form | de |
| BRAN-0005 | Quality_Score | change rationale | de |
| BRAN-0006 | Observation_Code | nightly summary | es |
| BRAN-0007 | Safety_Protocol | nightly summary | es |
| BRAN-0008 | Quality_Score | pre-release note | fr |