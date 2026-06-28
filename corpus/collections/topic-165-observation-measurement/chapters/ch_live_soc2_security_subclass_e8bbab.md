---
chapter_id: ch_live_soc2_security_subclass_e8bbab
topic_id: 165
family: 07_long_tail
cited_terms: ['soc2_security_subclass', 'mass_function_equiv_frame_and_assignment', 'schemaorg_product_brand']
model: engine-refine
---

Security classification frameworks rely upon a disciplined separation between the definition of attributes and the assignment of their values to concrete entities. The attribute registry establishes a controlled vocabulary through paired name–type declarations: an attribute such as `effective_date` is bound to the type `xsd:date`, while `enforcement` carries `xsd:string`, `mandatory` is typed as `xsd:boolean`, and `priority` as `xsd:integer`. A parallel registry for mass-function assignments defines attributes like `confidence` (`xsd:decimal`), `dimension_kind` (`xsd:string`), `method` (`xsd:string`), and `recorded_at` (`xsd:dateTime`). This schema-level discipline ensures that every value committed to storage conforms to a single, unambiguous datatype, eliminating the ambiguity that arises when heterogeneous literals are stored in generic text columns.

**t_mass_function_equiv_frame_and_assignment**

| id | mass | over_frame_of_discernment | assigns_mass_to |
| --- | --- | --- | --- |
| ASSI-0001 | corrosion_rate_measurement | SECU-0004 | fault_or_failure |
| ASSI-0002 | optical_transmittance_run | SECU-0007 | land_or_sea_only |
| ASSI-0003 | magnetic_offset_calibration | SECU-0006 | degraded_state_only |
| ASSI-0004 | vibration_profile_test | SECU-0006 | degraded_state_only |
| ASSI-0005 | pressure_deviation_check | SECU-0005 | high_or_extreme_only |
| ASSI-0006 | vibration_profile_test | SECU-0007 | degraded_state_only |

**t_mass_function_equiv_frame_and_assignment_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ASSI-0001 | confidence | xsd:decimal |
| ASSI-0002 | dimension_kind | xsd:string |
| ASSI-0003 | method | xsd:string |
| ASSI-0004 | recorded_at | xsd:dateTime |
| ASSI-0005 | uncertainty | xsd:decimal |
| ASSI-0006 | unit | xsd:string |
| ASSI-0007 | value | xsd:decimal |
| ASSI-0008 | encoding | xsd:string |

**t_mass_function_equiv_frame_and_assignment_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0004 | 2025-06-10T14:56:29 |
| ASSI-0002 | ASSI-0002 | ASSI-0004 | 2024-06-25T12:59:02 |
| ASSI-0003 | ASSI-0003 | ASSI-0004 | 2024-03-24T16:20:19 |
| ASSI-0004 | ASSI-0004 | ASSI-0004 | 2025-03-04T17:25:44 |
| ASSI-0005 | ASSI-0005 | ASSI-0004 | 2024-07-15T05:15:18 |
| ASSI-0006 | ASSI-0006 | ASSI-0004 | 2023-09-16T23:06:46 |

**t_mass_function_equiv_frame_and_assignment_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0001 | 0.002 |
| ASSI-0002 | ASSI-0001 | ASSI-0005 | 724.48 |
| ASSI-0003 | ASSI-0001 | ASSI-0007 | 469.73 |
| ASSI-0004 | ASSI-0002 | ASSI-0001 | 0.018 |
| ASSI-0005 | ASSI-0002 | ASSI-0005 | 449.10 |
| ASSI-0006 | ASSI-0002 | ASSI-0007 | 350.09 |
| ASSI-0007 | ASSI-0003 | ASSI-0001 | 0.405 |
| ASSI-0008 | ASSI-0003 | ASSI-0005 | 839.88 |

Value storage is partitioned by type into dedicated tables, each enforcing the constraint that an attribute's value must match its declared type. Boolean attributes are persisted in a value table where rows carry an entity identifier, an attribute reference, and a literal of `true` or `false` — for instance, entity `SECU-0001` receives `true` for attribute `SECU-0003`, while entity `SECU-0002` receives `false` for the same attribute. Date attributes reside in a separate value table, where entity `SECU-0001` is associated with `2023-08-15` and entity `SECU-0004` with `2025-05-01`, both referencing attribute `SECU-0001`. Integer attributes are stored in their own table, yielding values such as `5` and `926` for entity `SECU-0001` under attributes `SECU-0004` and `SECU-0005` respectively. String attributes are held in a varchar value table, producing values like `Encoding 01`, `audit excerpt`, and `de` for entity `SECU-0001` across attributes `SECU-0007`, `SECU-0008`, and `SECU-0009`. The mass-function registries follow the same pattern: decimal values such as `0.002` and `724.48` are stored for entity `ASSI-0001` under attribute `ASSI-0001`, while datetime values like `2025-06-10T14:56:29` and `2024-03-24T16:20:19` are recorded for entities `ASSI-0001` through `ASSI-0004` under attribute `ASSI-0004`.

**t_soc2_security_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0007 | Encoding 01 |
| SECU-0002 | SECU-0001 | SECU-0002 | Enforcement 02 |
| SECU-0003 | SECU-0001 | SECU-0008 | audit excerpt |
| SECU-0004 | SECU-0001 | SECU-0009 | de |
| SECU-0005 | SECU-0001 | SECU-0006 | Scope 05 |
| SECU-0006 | SECU-0002 | SECU-0007 | Encoding 06 |
| SECU-0007 | SECU-0002 | SECU-0002 | Enforcement 07 |
| SECU-0008 | SECU-0002 | SECU-0008 | audit excerpt |

**t_mass_function_equiv_frame_and_assignment_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0002 | Dimension Kind 01 |
| ASSI-0002 | ASSI-0001 | ASSI-0008 | Encoding 02 |
| ASSI-0003 | ASSI-0001 | ASSI-0009 | pre-release note |
| ASSI-0004 | ASSI-0001 | ASSI-0010 | fr |
| ASSI-0005 | ASSI-0001 | ASSI-0003 | manual |
| ASSI-0006 | ASSI-0001 | ASSI-0006 | kg |
| ASSI-0007 | ASSI-0002 | ASSI-0002 | Dimension Kind 07 |
| ASSI-0008 | ASSI-0002 | ASSI-0008 | Encoding 08 |

The entity-to-attribute linkage is mediated through a composite foreign-key structure. Each value row carries an `entity_id` that identifies the subject of the measurement or classification, and an `attr_id` that identifies the attribute being measured. In the security subclass domain, entity `SECU-0001` — which corresponds to the SOC2-CloudInfra classification under domain `ASSI-0001` — accumulates values across multiple attribute types: a date (`2023-08-15`), a boolean (`true`), integers (`5` and `926`), and strings (`Encoding 01`). This multi-typed attribute profile is characteristic of compliance entities, which must carry heterogeneous metadata: effective dates, enforcement flags, priority levels, and free-text annotations. The mass-function domain mirrors this structure: entity `ASSI-0001`, representing the `corrosion_rate_measurement` mass over frame `SECU-0004` and assigned to `fault_or_failure`, carries a decimal confidence of `0.002`, a dimension kind of `Dimension Kind 01`, and a recorded-at timestamp of `2025-06-10T14:56:29`.

**t_soc2_security_subclass**

| id | soc | for_s_o_c2_domain |
| --- | --- | --- |
| SECU-0001 | SOC2-CloudInfra | ASSI-0001 |
| SECU-0002 | SOC3-Public | ASSI-0004 |
| SECU-0003 | SOC2-Fintech | ASSI-0004 |
| SECU-0004 | SOC2-IdentityProvider | ASSI-0001 |
| SECU-0005 | SOC2-SaaS | ASSI-0004 |
| SECU-0006 | SOC2-TypeII | ASSI-0006 |
| SECU-0007 | SOC2-SaaS | ASSI-0001 |

**t_soc2_security_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SECU-0001 | effective_date | xsd:date |
| SECU-0002 | enforcement | xsd:string |
| SECU-0003 | mandatory | xsd:boolean |
| SECU-0004 | priority | xsd:integer |
| SECU-0005 | review_cycle_days | xsd:integer |
| SECU-0006 | scope | xsd:string |
| SECU-0007 | encoding | xsd:string |
| SECU-0008 | label_text | xsd:string |

**t_soc2_security_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0003 | true |
| SECU-0002 | SECU-0002 | SECU-0003 | false |
| SECU-0003 | SECU-0003 | SECU-0003 | true |
| SECU-0004 | SECU-0004 | SECU-0003 | false |
| SECU-0005 | SECU-0005 | SECU-0003 | false |
| SECU-0006 | SECU-0006 | SECU-0003 | false |
| SECU-0007 | SECU-0007 | SECU-0003 | false |

**t_soc2_security_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0001 | 2023-08-15 |
| SECU-0002 | SECU-0002 | SECU-0001 | 2024-04-12 |
| SECU-0003 | SECU-0003 | SECU-0001 | 2024-01-26 |
| SECU-0004 | SECU-0004 | SECU-0001 | 2025-05-01 |
| SECU-0005 | SECU-0005 | SECU-0001 | 2023-05-03 |
| SECU-0006 | SECU-0006 | SECU-0001 | 2025-05-11 |
| SECU-0007 | SECU-0007 | SECU-0001 | 2024-10-21 |

**t_soc2_security_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0004 | 5 |
| SECU-0002 | SECU-0001 | SECU-0005 | 926 |
| SECU-0003 | SECU-0002 | SECU-0004 | 1 |
| SECU-0004 | SECU-0002 | SECU-0005 | 849 |
| SECU-0005 | SECU-0003 | SECU-0004 | 2 |
| SECU-0006 | SECU-0003 | SECU-0005 | 409 |
| SECU-0007 | SECU-0004 | SECU-0004 | 5 |
| SECU-0008 | SECU-0004 | SECU-0005 | 551 |

Brand and category dimensions operate as a parallel classification layer, decoupled from the security and mass-function registries but accessible through a foreign-key relationship. The brand dimension table assigns each brand a human-readable label and a categorical classification: `BRAN-0001` carries label `Brand Label 01` and category `Brand Category 01`, while `BRAN-0004` carries `Brand Label 04` and `Brand Category 04`. The fact table for Schema.org references brands by their identifier — `BRAN-0003`, `BRAN-0005`, `BRAN-0004`, `BRAN-0002` — and attaches two additional measures: a size in bytes and a version number. Size values range from `114301972` bytes (approximately 109 MB) for `BRAN-0002` to `998785819` bytes (approximately 952 MB) for `BRAN-0002`'s counterpart, while version numbers span from `3` to `8`. This separation of brand identity from brand metadata enables independent evolution of the classification taxonomy and the factual records that reference it.

**fact_schemaorg**

| id | brand_key | size_bytes | version |
| --- | --- | --- | --- |
| BRAN-0001 | BRAN-0003 | 895265030 | 3 |
| BRAN-0002 | BRAN-0005 | 114301972 | 5 |
| BRAN-0003 | BRAN-0004 | 338701831 | 4 |
| BRAN-0004 | BRAN-0002 | 998785819 | 8 |

**dim_brand**

| id | brand_label | brand_category |
| --- | --- | --- |
| BRAN-0001 | Brand Label 01 | Brand Category 01 |
| BRAN-0002 | Brand Label 02 | Brand Category 02 |
| BRAN-0003 | Brand Label 03 | Brand Category 03 |
| BRAN-0004 | Brand Label 04 | Brand Category 04 |
| BRAN-0005 | Brand Label 05 | Brand Category 05 |
| BRAN-0006 | Brand Label 06 | Brand Category 06 |