---
chapter_id: ch_live_schemaorg_person_email_3b8cec
topic_id: 46
family: 07_long_tail
cited_terms: ['schemaorg_person_email', 'schemaorg_person_named', 'schemaorg_person_roleat']
model: engine-refine
---

Schemaorg Person Role-At Attr

The attribute registry establishes a typed vocabulary for describing entity properties, where each attribute definition pairs a human-readable name with a machine-consumable type annotation. The `attr_name` column enumerates semantic descriptors such as `checksum`, `created_date`, `identifier`, and `license`, while the companion `attr_type` column assigns an XSD or custom namespace type—`xsd:string`, `xsd:date`, or `cco:DesignativeICE`—to govern validation and serialization. This two-column schema decouples the conceptual identity of a property from its concrete representation, enabling the same attribute definition to be referenced across multiple entity instances without duplication. In practice, the attribute table `t_schemaorg_person_roleat_attr` serves as the canonical dictionary for all key-value pairs attached to role-at entities, ensuring that downstream consumers can resolve `ROLE-0001` through `ROLE-0004` to their respective type constraints before interpreting stored values.

**t_schemaorg_person_roleat**

| id | schemaorg | role_at |
| --- | --- | --- |
| ROLE-0001 | person/ada_lovelace | Atmospheric Sampling Lab |
| ROLE-0002 | person/alan_kay | Remote Telemetry Node |
| ROLE-0003 | person/elon_musk | Cloud Governance Tier |
| ROLE-0004 | IEEE Standards | Emergency Ops Center |
| ROLE-0005 | MIT Lincoln Lab | Network Security Zone |
| ROLE-0006 | Global Telemetry Network | Clinical Observation Wing |
| ROLE-0007 | IEEE Standards | Field Sensor Array |

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

Entity-attribute-value (EAV) materialization occurs through three parallel value tables, each specialized for a distinct data domain. The `t_schemaorg_person_roleat_val_date` table stores temporal values such as `2025-01-23`, `2024-08-11`, `2023-01-21`, and `2023-10-22`, linked to their attribute definitions via the `attr_id` foreign key and to their owning entity through `entity_id`. Integer-valued attributes—`325`, `7`, `319`, `10`—reside in `t_schemaorg_person_roleat_val_int`, while free-form strings including the checksum `c0ffee42`, the URN `urn:uuid:9f2a`, the license identifier `CC-BY-4.0`, and the zone designation `zone-b` are held in `t_schemaorg_person_roleat_val_varchar`. The `value` column across all three tables is typed as `misc` to reflect this heterogeneity, and the `entity_id` column anchors each value to a specific role-at record, creating a sparse, normalized property store that scales without schema migration.

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

The email dimension and its associated fact table form a separate analytical axis, where `dim_email` classifies email identifiers by a human-readable `email_label` (e.g., `Email Label 01` through `Email Label 04`) and a structural `email_category` (e.g., `Email Category 01` through `Email Category 04`). The fact table `fact_schemaorg` joins to this dimension via the `email_key` column, which references the `id` of `dim_email`, and simultaneously records quantitative metadata in `size_bytes` (values ranging from `114301972` to `998785819`) and a `version` number (integers `3` through `8`). Each fact row carries its own `id`—`EMAI-0001` through `EMAI-0004`—which serves as the primary key and the subject of any downstream relationships, while the `email_key` acts as the foreign key that binds the fact to its categorical classification.

**fact_schemaorg**

| id | email_key | size_bytes | version |
| --- | --- | --- | --- |
| EMAI-0001 | EMAI-0004 | 895265030 | 3 |
| EMAI-0002 | EMAI-0002 | 114301972 | 5 |
| EMAI-0003 | EMAI-0005 | 338701831 | 4 |
| EMAI-0004 | EMAI-0005 | 998785819 | 8 |

**dim_email**

| id | email_label | email_category |
| --- | --- | --- |
| EMAI-0001 | Email Label 01 | Email Category 01 |
| EMAI-0002 | Email Label 02 | Email Category 02 |
| EMAI-0003 | Email Label 03 | Email Category 03 |
| EMAI-0004 | Email Label 04 | Email Category 04 |
| EMAI-0005 | Email Label 05 | Email Category 05 |
| EMAI-0006 | Email Label 06 | Email Category 06 |

Named-person records and their role-at counterparts are connected through a junction table that encodes directional relationships between schemaorg entities and full-name entries. The table `t_schemaorg_person_named__full_name` holds a `schemaorg_id` (the `subject`), a `full_name_id` (the `target`), and a `role` that describes the nature of the association—`owner`, `observer`, or `reviewer`. For instance, the schemaorg entry `NAME-0003` is linked to the full-name entry `NAME-0002` with the role `reviewer`, while `NAME-0004` is linked to `NAME-0002` as `owner`. This subject-target-role triple pattern generalizes the relationship model beyond simple foreign-key joins, allowing a single entity to participate in multiple relationships with different semantics and different targets.

**t_schemaorg_person_named_full_name**

| id | full_name |
| --- | --- |
| NAME-0001 | Grace Hopper |
| NAME-0002 | Donald Knuth |
| NAME-0003 | John von Neumann |
| NAME-0004 | Grace Hopper |
| NAME-0005 | Ada Lovelace |
| NAME-0006 | Alan Kay |

**t_schemaorg_person_named__full_name**

| id | schemaorg_id | full_name_id | role |
| --- | --- | --- | --- |
| NAME-0001 | NAME-0003 | NAME-0002 | owner |
| NAME-0002 | NAME-0004 | NAME-0003 | observer |
| NAME-0003 | NAME-0003 | NAME-0002 | reviewer |
| NAME-0004 | NAME-0005 | NAME-0002 | owner |
| NAME-0005 | NAME-0003 | NAME-0001 | contributor |
| NAME-0006 | NAME-0007 | NAME-0005 | observer |
| NAME-0007 | NAME-0006 | NAME-0002 | observer |
| NAME-0008 | NAME-0006 | NAME-0005 | owner |

The identifier column appears consistently across all tables as the primary key, providing a stable reference point for joins and lookups. In `fact_schemaorg` and `dim_email`, identifiers follow the pattern `EMAI-0001` through `EMAI-0004`; in the person-related tables, they use the prefix `NAME-0001` through `NAME-0005` or `ROLE-0001` through `ROLE-0004`. The `schemaorg` column in `t_schemaorg_person_named` and `t_schemaorg_person_roleat` carries a parallel naming convention—`person/rosalind_franklin`, `person/ada_lovelace`, `person/alan_kay`, `person/elon_musk`—that encodes the entity type and its human-readable label in a single string, enabling both programmatic filtering and human inspection without requiring a separate join.

**t_schemaorg_person_named**

| id | schemaorg |
| --- | --- |
| NAME-0001 | person/rosalind_franklin |
| NAME-0002 | NOAA Climate Center |
| NAME-0003 | NASA Ames Research |
| NAME-0004 | person/alan_kay |
| NAME-0005 | person/alan_turing |
| NAME-0006 | CERN Data Division |
| NAME-0007 | SANS Institute |