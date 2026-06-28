---
chapter_id: ch_live_soc2_trust_criterion_1939ed
topic_id: 125
family: 07_long_tail
cited_terms: ['soc2_trust_criterion', 'requirement_basic', 'mental_health_education_program']
model: engine-refine
---

In compliance and governance architectures, the systematic classification of trust criteria and programmatic requirements demands a schema that separates definition from instantiation. The SOC 2 trust criterion framework achieves this through a core registry—`t_soc2_trust_criterion`—where each criterion is assigned a unique identifier such as `CRIT-0001` through `CRIT-0004`, mapped to organizational entities including CyberShield Ltd, DataVault Inc, CloudScale Services, and HealthSys Networks, and cross-referenced against requirement codes like `REQU-0005`, `REQU-0006`, `REQU-0002`, and `REQU-0007`. This registry establishes the primary entity-to-criterion linkage, but the actual evaluative properties of each criterion are not embedded inline; rather, they are externalized into an attribute definition layer. The table `t_soc2_trust_criterion_attr` enumerates attribute names—`effective_date`, `enforcement`, `mandatory`, `priority`—alongside their corresponding `attr_type` declarations (`xsd:date`, `xsd:string`, `xsd:boolean`, `xsd:integer`), thereby enforcing type discipline across all subsequent value assignments. This separation of attribute schema from value storage is a deliberate design choice that permits heterogeneous data types to coexist without schema migration, a necessity when compliance criteria evolve across audit cycles.

**t_soc2_trust_criterion**

| id | soc | soc2_trust_criterion |
| --- | --- | --- |
| CRIT-0001 | CyberShield Ltd | REQU-0005 |
| CRIT-0002 | DataVault Inc | REQU-0006 |
| CRIT-0003 | CloudScale Services | REQU-0002 |
| CRIT-0004 | HealthSys Networks | REQU-0007 |
| CRIT-0005 | RetailChain Partners | REQU-0008 |
| CRIT-0006 | FinTech Global | REQU-0002 |

**t_soc2_trust_criterion_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CRIT-0001 | effective_date | xsd:date |
| CRIT-0002 | enforcement | xsd:string |
| CRIT-0003 | mandatory | xsd:boolean |
| CRIT-0004 | priority | xsd:integer |
| CRIT-0005 | review_cycle_days | xsd:integer |
| CRIT-0006 | scope | xsd:string |
| CRIT-0007 | encoding | xsd:string |
| CRIT-0008 | label_text | xsd:string |

**t_soc2_trust_criterion_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0003 | false |
| CRIT-0002 | CRIT-0002 | CRIT-0003 | false |
| CRIT-0003 | CRIT-0003 | CRIT-0003 | true |
| CRIT-0004 | CRIT-0004 | CRIT-0003 | false |
| CRIT-0005 | CRIT-0005 | CRIT-0003 | false |
| CRIT-0006 | CRIT-0006 | CRIT-0003 | false |

**t_soc2_trust_criterion_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0001 | 2025-04-05 |
| CRIT-0002 | CRIT-0002 | CRIT-0001 | 2024-03-02 |
| CRIT-0003 | CRIT-0003 | CRIT-0001 | 2023-07-21 |
| CRIT-0004 | CRIT-0004 | CRIT-0001 | 2023-05-30 |
| CRIT-0005 | CRIT-0005 | CRIT-0001 | 2023-01-08 |
| CRIT-0006 | CRIT-0006 | CRIT-0001 | 2024-01-19 |

**t_soc2_trust_criterion_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0004 | 2 |
| CRIT-0002 | CRIT-0001 | CRIT-0005 | 749 |
| CRIT-0003 | CRIT-0002 | CRIT-0004 | 4 |
| CRIT-0004 | CRIT-0002 | CRIT-0005 | 767 |
| CRIT-0005 | CRIT-0003 | CRIT-0004 | 3 |
| CRIT-0006 | CRIT-0003 | CRIT-0005 | 559 |
| CRIT-0007 | CRIT-0004 | CRIT-0004 | 1 |
| CRIT-0008 | CRIT-0004 | CRIT-0005 | 187 |

**t_requirement_basic_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0003 | true |
| REQU-0002 | REQU-0002 | REQU-0003 | false |
| REQU-0003 | REQU-0003 | REQU-0003 | false |
| REQU-0004 | REQU-0004 | REQU-0003 | false |
| REQU-0005 | REQU-0005 | REQU-0003 | true |
| REQU-0006 | REQU-0006 | REQU-0003 | false |
| REQU-0007 | REQU-0007 | REQU-0003 | false |
| REQU-0008 | REQU-0008 | REQU-0003 | false |

**t_requirement_basic_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 2025-06-11 |
| REQU-0002 | REQU-0002 | REQU-0001 | 2024-12-28 |
| REQU-0003 | REQU-0003 | REQU-0001 | 2023-09-17 |
| REQU-0004 | REQU-0004 | REQU-0001 | 2024-08-31 |
| REQU-0005 | REQU-0005 | REQU-0001 | 2024-05-25 |
| REQU-0006 | REQU-0006 | REQU-0001 | 2024-05-27 |
| REQU-0007 | REQU-0007 | REQU-0001 | 2023-07-24 |
| REQU-0008 | REQU-0008 | REQU-0001 | 2023-09-16 |

**t_requirement_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | 5 |
| REQU-0002 | REQU-0001 | REQU-0005 | 962 |
| REQU-0003 | REQU-0002 | REQU-0004 | 5 |
| REQU-0004 | REQU-0002 | REQU-0005 | 675 |
| REQU-0005 | REQU-0003 | REQU-0004 | 5 |
| REQU-0006 | REQU-0003 | REQU-0005 | 160 |
| REQU-0007 | REQU-0004 | REQU-0004 | 5 |
| REQU-0008 | REQU-0004 | REQU-0005 | 57 |

The instantiation of these typed attributes follows an Entity-Attribute-Value (EAV) pattern distributed across four value tables, each specialized for a single `attr_type`. Boolean attributes such as `mandatory` are persisted in `t_soc2_trust_criterion_val_boolean`, where the `entity_id` column references the criterion being evaluated and the `attr_id` column points to the attribute definition; for instance, criterion `CRIT-0003` registers a `true` value for its mandatory flag, while `CRIT-0001`, `CRIT-0002`, and `CRIT-0004` all resolve to `false`. Date-valued attributes like `effective_date` reside in `t_soc2_trust_criterion_val_date`, anchoring criteria to temporal governance windows—`2025-04-05` for `CRIT-0001`, `2024-03-02` for `CRIT-0002`, `2023-07-21` for `CRIT-0003`, and `2023-05-30` for `CRIT-0004`—enabling auditors to verify that each criterion was active during the relevant assessment period. Integer attributes such as `priority` and an additional numeric dimension are stored in `t_soc2_trust_criterion_val_int`, where `CRIT-0001` carries values of `2` and `749` across two distinct attributes (`CRIT-0004` and `CRIT-0005`), and `CRIT-0002` holds `4` and `767`, suggesting a multi-axis scoring or weighting mechanism. String-valued attributes populate `t_soc2_trust_criterion_val_varchar`, capturing free-form metadata such as `Encoding 01`, `Enforcement 02`, `change rationale`, and the locale code `en`, all linked to `CRIT-0001` through attribute identifiers `CRIT-0007`, `CRIT-0002`, `CRIT-0008`, and `CRIT-0009` respectively.

**t_soc2_trust_criterion_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0007 | Encoding 01 |
| CRIT-0002 | CRIT-0001 | CRIT-0002 | Enforcement 02 |
| CRIT-0003 | CRIT-0001 | CRIT-0008 | change rationale |
| CRIT-0004 | CRIT-0001 | CRIT-0009 | en |
| CRIT-0005 | CRIT-0001 | CRIT-0006 | Scope 05 |
| CRIT-0006 | CRIT-0002 | CRIT-0007 | Encoding 06 |
| CRIT-0007 | CRIT-0002 | CRIT-0002 | Enforcement 07 |
| CRIT-0008 | CRIT-0002 | CRIT-0008 | audit excerpt |

A parallel EAV architecture governs the `t_requirement_basic` table, which catalogs foundational compliance requirements such as `Privacy Constraint` and `Encryption Standard` under identifiers `REQU-0001` through `REQU-0004`. The attribute schema in `t_requirement_basic_attr` mirrors the trust criterion pattern with identical `attr_name` and `attr_type` columns—`effective_date` as `xsd:date`, `enforcement` as `xsd:string`, `mandatory` as `xsd:boolean`, and `priority` as `xsd:integer`—demonstrating a reusable attribute vocabulary across compliance domains. Value instantiation follows the same type-dispatched EAV discipline: boolean values in `t_requirement_basic_val_boolean` show `REQU-0001` as mandatory (`true`) while `REQU-0002`, `REQU-0003`, and `REQU-0004` are not (`false`); date values in `t_requirement_basic_val_date` assign effective dates of `2025-06-11`, `2024-12-28`, `2023-09-17`, and `2024-08-31`; integer priorities in `t_requirement_basic_val_int` yield values of `5` and `962` for `REQU-0001`, and `5` and `675` for `REQU-0002`; and varchar attributes in `t_requirement_basic_val_varchar` store `Encoding 01`, `Enforcement 02`, `calibration record`, and `en`. The structural symmetry between the trust criterion and requirement basic domains confirms that the attribute type system is a cross-cutting concern, not a domain-specific implementation detail.

**t_requirement_basic**

| id | requirement |
| --- | --- |
| REQU-0001 | Privacy Constraint |
| REQU-0002 | Encryption Standard |
| REQU-0003 | Encryption Standard |
| REQU-0004 | Privacy Constraint |
| REQU-0005 | Latency Threshold |
| REQU-0006 | Performance SLA |
| REQU-0007 | Encryption Standard |
| REQU-0008 | Data Quality Check |

**t_requirement_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REQU-0001 | effective_date | xsd:date |
| REQU-0002 | enforcement | xsd:string |
| REQU-0003 | mandatory | xsd:boolean |
| REQU-0004 | priority | xsd:integer |
| REQU-0005 | review_cycle_days | xsd:integer |
| REQU-0006 | scope | xsd:string |
| REQU-0007 | encoding | xsd:string |
| REQU-0008 | label_text | xsd:string |

**t_requirement_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0007 | Encoding 01 |
| REQU-0002 | REQU-0001 | REQU-0002 | Enforcement 02 |
| REQU-0003 | REQU-0001 | REQU-0008 | calibration record |
| REQU-0004 | REQU-0001 | REQU-0009 | en |
| REQU-0005 | REQU-0001 | REQU-0006 | Scope 05 |
| REQU-0006 | REQU-0002 | REQU-0007 | Encoding 06 |
| REQU-0007 | REQU-0002 | REQU-0002 | Enforcement 07 |
| REQU-0008 | REQU-0002 | REQU-0008 | calibration record |

Beyond compliance criteria, the schema accommodates programmatic entities through `t_mental_health_education_program`, which operates under a denormalized relational model rather than the EAV pattern. Each row identifies a `mental_health_education_program`—such as `Youth Wellness Initiative` (appearing three times) and `Sources of Strength`—paired with a `delivered_presentation` like `Coping Skills Session`, `Understanding Anxiety Workshop`, `Recognizing Depression Workshop`, and `Emotional Intelligence Talk`, and a `targets_demographic` field capturing `Immigrant Adolescents`, `Foster Care Youths`, `Athlete Communities`, and `College Freshmen`. This table's flat structure reflects a different data characteristic: program-presentation-demographic tuples are discrete, non-extensible records that do not require the attribute-level polymorphism demanded by compliance criteria. The `id` column (`PROG-0001` through `PROG-0004`) serves as the primary key, and the three foreign columns—`mental_health_education_program`, `delivered_presentation`, and `targets_demographic`—form a composite semantic unit that is queried as a whole rather than decomposed into typed attribute values.

The nomenclature across these tables reveals a consistent taxonomy: `identifier` columns (`id`) provide stable, machine-readable keys; `entity_id` columns in value tables establish the foreign-key linkage back to the entity being attributed; `attr_name` and `attr_type` columns in definition tables govern the schema of permissible values; `value` columns in instantiation tables hold the actual data, typed according to their parent attribute; and domain-specific columns such as `mental_health_education_program`, `delivered_presentation`, and `targets_demographic` serve as both foreign-key targets and semantic anchors. The `misc` designation applied to value columns in the EAV tables signals that these columns are heterogeneous containers whose meaning is derived entirely from the `attr_id` foreign key and the type-specific table in which they reside. This architecture ensures that adding a new compliance attribute—say, a `risk_score` of type `xsd:decimal`—requires only a row in the attribute definition table and a new value table, with no modification to existing entity records or application logic.

**t_mental_health_education_program**

| id | mental_health_education_program | delivered_presentation | targets_demographic |
| --- | --- | --- | --- |
| PROG-0001 | Youth Wellness Initiative | Coping Skills Session | Immigrant Adolescents |
| PROG-0002 | Youth Wellness Initiative | Understanding Anxiety Workshop | Foster Care Youths |
| PROG-0003 | Sources of Strength | Recognizing Depression Workshop | Athlete Communities |
| PROG-0004 | Youth Wellness Initiative | Emotional Intelligence Talk | College Freshmen |
| PROG-0005 | Sources of Strength | Understanding Anxiety Workshop | College Freshmen |
| PROG-0006 | Sources of Strength | Mental Health Awareness Brief | High School Students |
| PROG-0007 | Teen Resilience Project | Stress Management Seminar | First Nations Youth |