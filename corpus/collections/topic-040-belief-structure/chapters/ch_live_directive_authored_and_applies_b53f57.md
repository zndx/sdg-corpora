---
chapter_id: ch_live_directive_authored_and_applies_b53f57
topic_id: 40
family: 01_foundation
cited_terms: ['directive_authored_and_applies', 'directive_only_governs_artifact', 'conjunctive_combination']
model: engine-refine
---

Regulatory directives are anchored by unique identifiers—APPL-0001 through APPL-0004 in the authored-and-applies dimension, ARTI-0001 through ARTI-0004 in the artifact-governance dimension—that serve as the primary keys for all downstream attribute resolution and conjunctive combination. Each directive carries a human-readable label, such as HIPAA Audit Logging, FISMA Moderate Baseline, EPA Telemetry Protocol, or HIPAA Data Privacy Rule, and is attributed to an authoring body: the FDA Compliance Office, HSA Regulatory Board, NIST Cyber Division, CISA National Director, or analogous authorities. The scope of applicability is equally explicit—ISO Certified Facilities, Edge Gateway Nodes, Cloud Storage Buckets, Customer PII Datasets, Sensor Data Streams, Network Access Control Lists, and Data Lake Metadata Catalogs—ensuring that every governance instrument can be traced to the precise operational targets it constrains.

**t_directive_authored_and_applies**

| id | directive | authored_by | applies_to |
| --- | --- | --- | --- |
| APPL-0001 | HIPAA Audit Logging | FDA Compliance Office | ISO Certified Facilities |
| APPL-0002 | FISMA Moderate Baseline | HSA Regulatory Board | Edge Gateway Nodes |
| APPL-0003 | EPA Telemetry Protocol | NIST Cyber Division | Cloud Storage Buckets |
| APPL-0004 | FISMA Moderate Baseline | CISA National Director | Customer PII Datasets |
| APPL-0005 | HIPAA Data Privacy Rule | FDA Compliance Office | Financial Ledger Tables |
| APPL-0006 | NIST CM-7 Baseline | European Commission | HIPAA Covered Entities |

**t_directive_only_governs_artifact**

| id | directive | governs |
| --- | --- | --- |
| ARTI-0001 | HIPAA Data Privacy Rule | Sensor Data Streams |
| ARTI-0002 | SOC 2 Type II Standard | Network Access Control Lists |
| ARTI-0003 | OSHA Lab Safety | Data Lake Metadata Catalog |
| ARTI-0004 | FAIR Data Principles Directive | Data Lake Metadata Catalog |
| ARTI-0005 | GDPR Data Retention | Laboratory Reagent Inventory |
| ARTI-0006 | AWS Encryption Mandate | Access Control Matrices |
| ARTI-0007 | ISO 27001 Access Control | Sensor Data Streams |

Attributes are defined separately from their values, establishing a schema of attr_name and attr_type pairs that decouple the ontology of governance metadata from its instance data. The attribute types span xsd:date, xsd:string, xsd:boolean, and xsd:integer, each governing the shape of the values that populate them. An effective_date attribute carries xsd:date values such as 2023-01-05, 2024-10-27, 2025-04-09, or 2024-01-05 depending on the directive context; an enforcement attribute holds xsd:string values like Enforcement 01 or Enforcement 02; a mandatory attribute is typed xsd:boolean and takes true or false; and a priority attribute is xsd:integer, accepting values ranging from 4 to 979 across the artifact-governance scope, or 5 to 736 within the authored-and-applies scope. This separation of attribute definition from value storage permits the same attr_name to be resolved against different entity_ids without schema mutation, and it allows the system to enforce type discipline at query time rather than at ingestion.

The value tables—partitioned by type into boolean, date, integer, and varchar variants—store the actual attribute instances. Each row is keyed by a composite of id, entity_id, and attr_id, where entity_id references the directive or artifact identifier and attr_id references the attribute definition. For example, the mandatory attribute (attr_id APPL-0003) is set to true across all four entities APPL-0001 through APPL-0004 in the authored-and-applies dimension, while in the artifact-governance dimension the same attribute (attr_id ARTI-0003) is true for ARTI-0001, ARTI-0002, and ARTI-0003 but false for ARTI-0004, reflecting a deliberate divergence in enforcement posture. Varchar values include Encoding 01, pre-release note, ja, and en, demonstrating that the misc category encompasses both structured codes and free-form annotations. The integer values—5, 736, 165 in one context and 5, 959, 4, 97 in another—illustrate how priority or severity scales can differ meaningfully between governance domains.

**t_directive_authored_and_applies_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| APPL-0001 | effective_date | xsd:date |
| APPL-0002 | enforcement | xsd:string |
| APPL-0003 | mandatory | xsd:boolean |
| APPL-0004 | priority | xsd:integer |
| APPL-0005 | review_cycle_days | xsd:integer |
| APPL-0006 | scope | xsd:string |
| APPL-0007 | encoding | xsd:string |
| APPL-0008 | label_text | xsd:string |

**t_directive_authored_and_applies_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| APPL-0001 | APPL-0001 | APPL-0003 | true |
| APPL-0002 | APPL-0002 | APPL-0003 | true |
| APPL-0003 | APPL-0003 | APPL-0003 | true |
| APPL-0004 | APPL-0004 | APPL-0003 | true |
| APPL-0005 | APPL-0005 | APPL-0003 | false |
| APPL-0006 | APPL-0006 | APPL-0003 | false |

**t_directive_authored_and_applies_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| APPL-0001 | APPL-0001 | APPL-0001 | 2023-01-05 |
| APPL-0002 | APPL-0002 | APPL-0001 | 2024-10-27 |
| APPL-0003 | APPL-0003 | APPL-0001 | 2025-04-09 |
| APPL-0004 | APPL-0004 | APPL-0001 | 2024-01-05 |
| APPL-0005 | APPL-0005 | APPL-0001 | 2023-12-27 |
| APPL-0006 | APPL-0006 | APPL-0001 | 2023-04-20 |

**t_directive_authored_and_applies_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| APPL-0001 | APPL-0001 | APPL-0004 | 5 |
| APPL-0002 | APPL-0001 | APPL-0005 | 736 |
| APPL-0003 | APPL-0002 | APPL-0004 | 5 |
| APPL-0004 | APPL-0002 | APPL-0005 | 165 |
| APPL-0005 | APPL-0003 | APPL-0004 | 3 |
| APPL-0006 | APPL-0003 | APPL-0005 | 417 |
| APPL-0007 | APPL-0004 | APPL-0004 | 1 |
| APPL-0008 | APPL-0004 | APPL-0005 | 521 |

**t_directive_authored_and_applies_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| APPL-0001 | APPL-0001 | APPL-0007 | Encoding 01 |
| APPL-0002 | APPL-0001 | APPL-0002 | Enforcement 02 |
| APPL-0003 | APPL-0001 | APPL-0008 | pre-release note |
| APPL-0004 | APPL-0001 | APPL-0009 | ja |
| APPL-0005 | APPL-0001 | APPL-0006 | Scope 05 |
| APPL-0006 | APPL-0002 | APPL-0007 | Encoding 06 |
| APPL-0007 | APPL-0002 | APPL-0002 | Enforcement 07 |
| APPL-0008 | APPL-0002 | APPL-0008 | pre-release note |

**t_directive_only_governs_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | effective_date | xsd:date |
| ARTI-0002 | enforcement | xsd:string |
| ARTI-0003 | mandatory | xsd:boolean |
| ARTI-0004 | priority | xsd:integer |
| ARTI-0005 | review_cycle_days | xsd:integer |
| ARTI-0006 | scope | xsd:string |
| ARTI-0007 | encoding | xsd:string |
| ARTI-0008 | label_text | xsd:string |

**t_directive_only_governs_artifact_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0003 | true |
| ARTI-0002 | ARTI-0002 | ARTI-0003 | true |
| ARTI-0003 | ARTI-0003 | ARTI-0003 | true |
| ARTI-0004 | ARTI-0004 | ARTI-0003 | false |
| ARTI-0005 | ARTI-0005 | ARTI-0003 | false |
| ARTI-0006 | ARTI-0006 | ARTI-0003 | true |
| ARTI-0007 | ARTI-0007 | ARTI-0003 | false |

**t_directive_only_governs_artifact_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 2023-09-27 |
| ARTI-0002 | ARTI-0002 | ARTI-0001 | 2025-04-15 |
| ARTI-0003 | ARTI-0003 | ARTI-0001 | 2024-03-21 |
| ARTI-0004 | ARTI-0004 | ARTI-0001 | 2024-02-09 |
| ARTI-0005 | ARTI-0005 | ARTI-0001 | 2023-02-02 |
| ARTI-0006 | ARTI-0006 | ARTI-0001 | 2024-08-24 |
| ARTI-0007 | ARTI-0007 | ARTI-0001 | 2023-05-03 |

**t_directive_only_governs_artifact_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 5 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 959 |
| ARTI-0003 | ARTI-0002 | ARTI-0004 | 4 |
| ARTI-0004 | ARTI-0002 | ARTI-0005 | 97 |
| ARTI-0005 | ARTI-0003 | ARTI-0004 | 5 |
| ARTI-0006 | ARTI-0003 | ARTI-0005 | 179 |
| ARTI-0007 | ARTI-0004 | ARTI-0004 | 4 |
| ARTI-0008 | ARTI-0004 | ARTI-0005 | 356 |

**t_directive_only_governs_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0007 | Encoding 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0002 | Enforcement 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0008 | nightly summary |
| ARTI-0004 | ARTI-0001 | ARTI-0009 | en |
| ARTI-0005 | ARTI-0001 | ARTI-0006 | Scope 05 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | Encoding 06 |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Enforcement 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | pre-release note |

Conjunctive combination operates as a higher-order reasoning layer that synthesizes multiple directive relationships into a single evaluated proposition. The dim_conjunctively_combines table provides the categorical scaffolding: each combination is labeled (Conjunctively Combines Label 01 through 04) and classified into a category (Conjunctively Combines Category 01 through 04), establishing the semantic grouping of which directives are being combined. The fact_conjunctive table then records the quantitative assessment of each combination. The conjunctively_combines_key column links a fact row to its parent combination identifier—COMB-0004 appears as a key in two fact rows (COMB-0001 and COMB-0002), indicating that a single combination can decompose into multiple evidentiary contributions. Each fact carries a confidence value between 0 and 1 (0.738, 0.045, 0.764, 0.799) and an uncertainty measure (736.08, 898.42, 666.33, 785.73), alongside a numeric value (793.45, 791.51, 598.69, 980.45) that represents the aggregated signal. The inverse relationship between confidence and uncertainty is not strict—COMB-0002 has the lowest confidence (0.045) but the highest uncertainty (898.42), while COMB-0003 has high confidence (0.764) and moderate uncertainty (666.33)—reflecting the multidimensional nature of evidentiary quality.

**fact_conjunctive**

| id | conjunctively_combines_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| COMB-0001 | COMB-0004 | 0.738 | 736.08 | 793.45 |
| COMB-0002 | COMB-0004 | 0.045 | 898.42 | 791.51 |
| COMB-0003 | COMB-0006 | 0.764 | 666.33 | 598.69 |
| COMB-0004 | COMB-0003 | 0.799 | 785.73 | 980.44 |
| COMB-0005 | COMB-0006 | 0.312 | 470.05 | 427.17 |
| COMB-0006 | COMB-0003 | 0.643 | 227.57 | 137.91 |
| COMB-0007 | COMB-0004 | 0.630 | 30.12 | 467.22 |

**dim_conjunctively_combines**

| id | conjunctively_combines_label | conjunctively_combines_category |
| --- | --- | --- |
| COMB-0001 | Conjunctively Combines Label 01 | Conjunctively Combines Category 01 |
| COMB-0002 | Conjunctively Combines Label 02 | Conjunctively Combines Category 02 |
| COMB-0003 | Conjunctively Combines Label 03 | Conjunctively Combines Category 03 |
| COMB-0004 | Conjunctively Combines Label 04 | Conjunctively Combines Category 04 |
| COMB-0005 | Conjunctively Combines Label 05 | Conjunctively Combines Category 05 |
| COMB-0006 | Conjunctively Combines Label 06 | Conjunctively Combines Category 06 |

The interplay between these layers—identifiers anchoring directives, attributes defining the metadata schema, values populating instances, and conjunctive combinations synthesizing relationships with quantified confidence and uncertainty—forms a governance data model that is both extensible and auditable. The same attr_name can appear across multiple entity_ids with different values, enabling fine-grained policy variation without schema proliferation. The separation of attr_type from attr_name ensures that type constraints are declarative rather than implicit. And the conjunctive combination layer, with its dual measures of confidence and uncertainty, provides a mechanism for aggregating directive relationships while preserving the epistemic quality of each contributing signal. This architecture supports compliance frameworks where directives must be evaluated not in isolation but as part of a conjunctively combined evidence base, each component weighted by its confidence and tempered by its uncertainty.