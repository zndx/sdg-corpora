---
chapter_id: ch_live_schemaorg_creativework_date_af2eff
topic_id: 72
family: 07_long_tail
cited_terms: ['schemaorg_creativework_date', 'requirement_under_standard', 'attestation_about_compliance_claim']
model: engine-refine
---

Attestation functions as the formal mechanism by which claims about entities are recorded, quantified, and assessed for reliability. Each attestation fact carries a unique identifier—CLAI-0001 through CLAI-0004, for instance—and is anchored to a specific attestation key that ties the claim to its originating source. The confidence metric, expressed as a decimal between zero and one, quantifies the degree of certainty in the claim: CLAI-0002 registers a confidence of 0.840, indicating substantial assurance, whereas CLAI-0001 sits at 0.051, reflecting near-negligible confidence. These confidence values are paired with an uncertainty measure, expressed in absolute units—CLAI-0002 exhibits an uncertainty of 986.76 against its confidence of 0.840, while CLAI-0004 achieves both the highest confidence (0.987) and a comparatively lower uncertainty of 859.08—forming a dual-axis assessment that captures both the strength and the residual ambiguity of each assertion. The attestation dimension table further classifies each claim through a label and a category, grouping attestations such as Attestation Label 01 under Attestation Category 01, thereby enabling aggregation and filtering by type.

**fact_attestation**

| id | attestation_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CLAI-0001 | CLAI-0004 | 0.051 | 91.51 | 571.54 |
| CLAI-0002 | CLAI-0001 | 0.840 | 986.76 | 362.06 |
| CLAI-0003 | CLAI-0003 | 0.482 | 606.80 | 96.81 |
| CLAI-0004 | CLAI-0004 | 0.987 | 859.08 | 16.44 |
| CLAI-0005 | CLAI-0003 | 0.738 | 864.19 | 799.64 |

**dim_attestation**

| id | attestation_label | attestation_category |
| --- | --- | --- |
| CLAI-0001 | Attestation Label 01 | Attestation Category 01 |
| CLAI-0002 | Attestation Label 02 | Attestation Category 02 |
| CLAI-0003 | Attestation Label 03 | Attestation Category 03 |
| CLAI-0004 | Attestation Label 04 | Attestation Category 04 |
| CLAI-0005 | Attestation Label 05 | Attestation Category 05 |
| CLAI-0006 | Attestation Label 06 | Attestation Category 06 |

Attributes serve as the named properties through which entities are described and evaluated. Each attribute possesses a name—effective_date, enforcement, mandatory, priority—and a type that constrains the permissible values: xsd:date, xsd:string, xsd:boolean, and xsd:integer respectively. This type discipline ensures that the values stored for a given attribute are semantically coherent. For the attribute identified as STAN-0001 (effective_date), the stored values are dates such as 2024-02-08 and 2024-03-15; for STAN-0003 (mandatory), the values are boolean true or false; and for STAN-0004 (priority), integer values such as 3 and 4 are recorded. The attribute type acts as a schema-level guarantee, preventing the conflation of a date like 2024-09-13 with a string like "Enforcement 02" or an integer like 622, each of which belongs to its own value table and is associated with the same entity-attribute pair through a common identifier.

**t_schemaorg_creativework_date**

| id | schemaorg |
| --- | --- |
| DATE-0001 | Quantum Error Correction |
| DATE-0002 | Human Genome Release |
| DATE-0003 | OAuth 2.0 Guidelines |
| DATE-0004 | Human Genome Release |
| DATE-0005 | Human Genome Release |
| DATE-0006 | OpenTelemetry Specification |

**t_schemaorg_creativework_date_date_published**

| id | date_published |
| --- | --- |
| DATE-0001 | 2024-05-11 |
| DATE-0002 | 2022-11-05 |
| DATE-0003 | 2023-12-01 |
| DATE-0004 | 2023-04-12 |
| DATE-0005 | 2023-12-01 |
| DATE-0006 | 2024-01-18 |

The entity-attribute-value triad constitutes the fundamental unit of structured knowledge representation. An entity—identified by codes such as STAN-0001 or STAN-0002—carries multiple attributes, each of which may hold one or more values depending on its type. Entity STAN-0001, for example, has a boolean value of true for attribute STAN-0003 (mandatory), a date value of 2024-02-08 for attribute STAN-0001 (effective_date), and multiple varchar values including "Encoding 01" and "audit excerpt" for attributes STAN-0007 and STAN-0008. Entity STAN-0002 holds a boolean value of false for the same mandatory attribute, a date of 2024-03-15, and integer priority values of 4 and 622 across attributes STAN-0004 and STAN-0005. This separation of values by type into distinct tables—boolean, date, integer, varchar—preserves type integrity while allowing a single entity to carry a heterogeneous set of properties without schema rigidity.

Requirements are bound to standards through a relationship that specifies not only which standard governs a given requirement but also the nature of that governance. The requirement "Minimum sampling rate" (STAN-0001) falls under standard DATE-0004, while "Quality threshold" (STAN-0002) is governed by DATE-0002; "Provenance tracking" (STAN-0003) and "Access control policy" (STAN-0004) are likewise mapped to DATE-0004 and DATE-0002 respectively. The creative works that serve as these standards—labeled Quantum Error Correction, Human Genome Release, and OAuth 2.0 Guidelines—are themselves associated with publication dates such as 2024-05-11 and 2022-11-05, and the relationship between a creative work and its publication date is mediated by a role: owner, contributor, or observer. This role designation clarifies the nature of the association, distinguishing between the primary entity responsible for a standard and those who have contributed to or merely observed its development.

**t_requirement_under_standard**

| id | requirement | under_standard |
| --- | --- | --- |
| STAN-0001 | Minimum sampling rate | DATE-0004 |
| STAN-0002 | Quality threshold | DATE-0002 |
| STAN-0003 | Provenance tracking | DATE-0004 |
| STAN-0004 | Access control policy | DATE-0002 |
| STAN-0005 | Provenance tracking | DATE-0002 |
| STAN-0006 | Access control policy | DATE-0001 |

The interplay between attestation, attributes, and entity-value relationships forms a coherent framework for governance and compliance. Attestations provide the claims about entities; attributes define the properties by which those entities are characterized; and the entity-attribute-value structure captures the actual data. Confidence and uncertainty quantify the reliability of each attestation, while categories and roles provide the organizational scaffolding that enables filtering, aggregation, and audit. A requirement such as "Provenance tracking" under standard DATE-0004 carries its own set of attributes—mandatory set to true, effective_date of 2024-09-13, priority of 3—and may be the subject of an attestation whose confidence and uncertainty reflect the assessor's judgment. In this manner, the system supports not only the storage of structured compliance data but also the evaluation of its trustworthiness, enabling auditors and operators to distinguish between well-substantiated claims and those warranting further scrutiny.

**t_schemaorg_creativework_date__date_published**

| id | schemaorg_id | date_published_id | role |
| --- | --- | --- | --- |
| DATE-0001 | DATE-0006 | DATE-0004 | owner |
| DATE-0002 | DATE-0006 | DATE-0001 | contributor |
| DATE-0003 | DATE-0005 | DATE-0001 | contributor |
| DATE-0004 | DATE-0005 | DATE-0002 | observer |
| DATE-0005 | DATE-0005 | DATE-0005 | owner |
| DATE-0006 | DATE-0003 | DATE-0005 | owner |
| DATE-0007 | DATE-0004 | DATE-0004 | observer |
| DATE-0008 | DATE-0004 | DATE-0004 | owner |

**t_requirement_under_standard_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAN-0001 | effective_date | xsd:date |
| STAN-0002 | enforcement | xsd:string |
| STAN-0003 | mandatory | xsd:boolean |
| STAN-0004 | priority | xsd:integer |
| STAN-0005 | review_cycle_days | xsd:integer |
| STAN-0006 | scope | xsd:string |
| STAN-0007 | encoding | xsd:string |
| STAN-0008 | label_text | xsd:string |

**t_requirement_under_standard_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0003 | true |
| STAN-0002 | STAN-0002 | STAN-0003 | true |
| STAN-0003 | STAN-0003 | STAN-0003 | true |
| STAN-0004 | STAN-0004 | STAN-0003 | false |
| STAN-0005 | STAN-0005 | STAN-0003 | false |
| STAN-0006 | STAN-0006 | STAN-0003 | true |

**t_requirement_under_standard_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0001 | 2024-02-08 |
| STAN-0002 | STAN-0002 | STAN-0001 | 2024-03-15 |
| STAN-0003 | STAN-0003 | STAN-0001 | 2024-09-13 |
| STAN-0004 | STAN-0004 | STAN-0001 | 2023-09-30 |
| STAN-0005 | STAN-0005 | STAN-0001 | 2025-02-13 |
| STAN-0006 | STAN-0006 | STAN-0001 | 2025-01-10 |

**t_requirement_under_standard_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0004 | 3 |
| STAN-0002 | STAN-0001 | STAN-0005 | 224 |
| STAN-0003 | STAN-0002 | STAN-0004 | 4 |
| STAN-0004 | STAN-0002 | STAN-0005 | 622 |
| STAN-0005 | STAN-0003 | STAN-0004 | 1 |
| STAN-0006 | STAN-0003 | STAN-0005 | 177 |
| STAN-0007 | STAN-0004 | STAN-0004 | 5 |
| STAN-0008 | STAN-0004 | STAN-0005 | 817 |

**t_requirement_under_standard_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0007 | Encoding 01 |
| STAN-0002 | STAN-0001 | STAN-0002 | Enforcement 02 |
| STAN-0003 | STAN-0001 | STAN-0008 | audit excerpt |
| STAN-0004 | STAN-0001 | STAN-0009 | de |
| STAN-0005 | STAN-0001 | STAN-0006 | Scope 05 |
| STAN-0006 | STAN-0002 | STAN-0007 | Encoding 06 |
| STAN-0007 | STAN-0002 | STAN-0002 | Enforcement 07 |
| STAN-0008 | STAN-0002 | STAN-0008 | nightly summary |