---
chapter_id: ch_live_constraint_min_one_check_7d1556
topic_id: 159
family: 03_directive_governance
cited_terms: ['constraint_min_one_check', 'schemaorg_person_roleat', 'schemaorg_event_endtime']
model: engine-refine
---

Operational governance relies on a structured hierarchy of constraints, each uniquely identified by an identifier such as `CHEC-0001` or `CHEC-0002`. These constraints—ranging from "Unique Index" and "Latency Limit" to "Primary Key Rule" and "Range Validation"—are enforced through specific checks like `ROLE-0007` or `ROLE-0001`. To ensure temporal accuracy, every constraint is bound to an `effectivedate`, establishing exactly when a rule becomes active, as seen with dates like `2023-05-21` or the future-dated `2025-03-18`. Furthermore, the applicability of these rules is strictly defined by their `scope`, which delineates whether a constraint applies at the `team`, `local`, or `regional` level, ensuring that compliance boundaries align precisely with the organizational architecture.

**t_constraint_min_one_check**

| id | constraint | checks | effective_date | scope |
| --- | --- | --- | --- | --- |
| CHEC-0001 | Unique Index | ROLE-0007 | 2023-05-21 | team |
| CHEC-0002 | Latency Limit | ROLE-0007 | 2023-05-17 | team |
| CHEC-0003 | Primary Key Rule | ROLE-0005 | 2025-03-18 | local |
| CHEC-0004 | Range Validation | ROLE-0001 | 2023-05-11 | regional |
| CHEC-0005 | Referential Integrity | ROLE-0003 | 2023-08-12 | regional |
| CHEC-0006 | Format Check | ROLE-0001 | 2024-01-08 | global |

**t_schemaorg_person_roleat**

| id | schemaorg | role_at |
| --- | --- | --- |
| ROLE-0001 | SANS Institute | CHEC-0002 |
| ROLE-0002 | WHO Cyber Health | CHEC-0004 |
| ROLE-0003 | NASA Ames Research | CHEC-0003 |
| ROLE-0004 | DARPA InfoTech | CHEC-0004 |
| ROLE-0005 | Red Hat OpenShift | CHEC-0002 |
| ROLE-0006 | IEEE Standards | CHEC-0005 |
| ROLE-0007 | DARPA InfoTech | CHEC-0001 |

Within this framework, entities such as the SANS Institute, WHO Cyber Health, NASA Ames Research, and DARPA InfoTech are assigned specific roles, identified by codes like `ROLE-0001` through `ROLE-0004`. These roles are mapped to underlying constraints via a `role_at` linkage, binding an entity to a specific compliance requirement. To capture granular metadata about these roles, the system utilizes an attribute registry where each `attr` (such as `checksum`, `created_date`, `identifier`, or `license`) is paired with a strict `attr_type`. These types enforce data integrity by dictating the schema of the value, utilizing standards like `xsd:string` for text, `xsd:date` for temporal data, or `cco:DesignativeICE` for specialized designative identifiers.

**t_schemaorg_person_roleat_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ROLE-0001 | checksum | xsd:string |
| ROLE-0002 | created_date | xsd:date |
| ROLE-0003 | identifier | cco:DesignativeICE |
| ROLE-0004 | license | xsd:string |
| ROLE-0005 | mime_type | xsd:string |
| ROLE-0006 | size_bytes | xsd:long |
| ROLE-0007 | uri | xsd:string |
| ROLE-0008 | version | xsd:integer |

**t_schemaorg_person_roleat_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0001 | ROLE-0002 | 2025-01-23 |
| ROLE-0002 | ROLE-0002 | ROLE-0002 | 2024-08-11 |
| ROLE-0003 | ROLE-0003 | ROLE-0002 | 2023-01-21 |
| ROLE-0004 | ROLE-0004 | ROLE-0002 | 2023-10-22 |
| ROLE-0005 | ROLE-0005 | ROLE-0002 | 2023-09-13 |
| ROLE-0006 | ROLE-0006 | ROLE-0002 | 2023-05-29 |
| ROLE-0007 | ROLE-0007 | ROLE-0002 | 2024-03-07 |

The actual data populating these attributes is stored as `misc` values, which are intrinsically linked to a specific `entity` and a defined `attr`. Depending on the `attr_type`, these values manifest in various formats: temporal entries like `2025-01-23` or `2024-08-11`; integer metrics such as `325` or `7`; or string-based identifiers like the checksum `c0ffee42`, the URN `urn:uuid:9f2a`, the licensing term `CC-BY-4.0`, and the zone designation `zone-b`. This multi-faceted value storage ensures that every `entity` maintains a rich, type-safe profile, allowing for precise auditing of both quantitative metrics and qualitative metadata across the operational environment.

**t_schemaorg_person_roleat_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0001 | ROLE-0006 | 325 |
| ROLE-0002 | ROLE-0001 | ROLE-0008 | 7 |
| ROLE-0003 | ROLE-0002 | ROLE-0006 | 319 |
| ROLE-0004 | ROLE-0002 | ROLE-0008 | 10 |
| ROLE-0005 | ROLE-0003 | ROLE-0006 | 407 |
| ROLE-0006 | ROLE-0003 | ROLE-0008 | 6 |
| ROLE-0007 | ROLE-0004 | ROLE-0006 | 258 |
| ROLE-0008 | ROLE-0004 | ROLE-0008 | 6 |

**t_schemaorg_person_roleat_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0001 | ROLE-0001 | c0ffee42 |
| ROLE-0002 | ROLE-0001 | ROLE-0003 | urn:uuid:9f2a |
| ROLE-0003 | ROLE-0001 | ROLE-0004 | CC-BY-4.0 |
| ROLE-0004 | ROLE-0001 | ROLE-0009 | zone-b |
| ROLE-0005 | ROLE-0001 | ROLE-0005 | text/plain |
| ROLE-0006 | ROLE-0001 | ROLE-0010 | Name 06 |
| ROLE-0007 | ROLE-0001 | ROLE-0011 | platform-team |
| ROLE-0008 | ROLE-0001 | ROLE-0012 | Tags 08 |

Beyond static constraints and entity attributes, the system tracks dynamic lifecycle events through a fact-based model centered on the `event end time`. Each event is assigned a unique `identifier` (e.g., `ENDT-0001`) and is associated with a specific `event_end_time_key` to anchor it temporally. The magnitude of these events is quantified by `size_bytes`, capturing data volumes that can range significantly, from approximately 114 million bytes (`114301972`) to nearly 999 million bytes (`998785819`). Concurrently, each event record is assigned a `version` number (such as `3`, `5`, `4`, or `8`) to track iterative updates or state changes throughout the event's lifecycle.

**fact_schemaorg**

| id | event_end_time_key | size_bytes | version |
| --- | --- | --- | --- |
| ENDT-0001 | ENDT-0004 | 895265030 | 3 |
| ENDT-0002 | ENDT-0002 | 114301972 | 5 |
| ENDT-0003 | ENDT-0007 | 338701831 | 4 |
| ENDT-0004 | ENDT-0007 | 998785819 | 8 |

To provide context to these temporal events, a dimensional lookup categorizes each `event end time` using a descriptive `event_end_time_label` (e.g., `Event End Time Label 01`) and a broader `event_end_time_category` (e.g., `Event End Time Category 01`). This categorization allows operators to filter and analyze event data not just by size or version, but by their functional classification. By integrating the `identifier`, `scope`, and `effectivedate` of constraints with the `entity`-level attributes and `event end time` metrics, the framework establishes a comprehensive, auditable trail of governance, data integrity, and operational history.

**dim_event_end_time**

| id | event_end_time_label | event_end_time_category |
| --- | --- | --- |
| ENDT-0001 | Event End Time Label 01 | Event End Time Category 01 |
| ENDT-0002 | Event End Time Label 02 | Event End Time Category 02 |
| ENDT-0003 | Event End Time Label 03 | Event End Time Category 03 |
| ENDT-0004 | Event End Time Label 04 | Event End Time Category 04 |
| ENDT-0005 | Event End Time Label 05 | Event End Time Category 05 |
| ENDT-0006 | Event End Time Label 06 | Event End Time Category 06 |
| ENDT-0007 | Event End Time Label 07 | Event End Time Category 07 |