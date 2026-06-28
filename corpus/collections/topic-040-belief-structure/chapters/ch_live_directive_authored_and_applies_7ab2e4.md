---
chapter_id: ch_live_directive_authored_and_applies_7ab2e4
topic_id: 40
family: 01_foundation
cited_terms: ['directive_authored_and_applies', 'directive_not_obsolete', 'directive_not_superseded']
model: engine-refine
---

Within regulatory technology architectures, directives serve as the primary governance artifacts, each uniquely identified by a scoped alphanumeric key and carrying metadata about provenance and scope. A directive such as APPL-0001, designated HIPAA Audit Logging and authored by OBSO-0006, applies to ISO Certified Facilities; APPL-0002, EPA Air Quality from OBSO-0004, targets Edge Gateway Nodes; APPL-0003, FHIR R4 Interoperability from OBSO-0002, governs Cloud Storage Buckets; and APPL-0004, EPA Air Quality from OBSO-0005, extends to Customer PII Datasets. Parallel directive sets exist under distinct lifecycle classifications: the not-obsolete cohort includes identifiers such as OBSO-0001 (NIST Security Framework paired with FDA Electronic Records) and OBSO-0004 (IHE Patient Identity Cross referencing HIPAA Privacy Rule), while the not-superseded cohort encompasses SUPE-0001 (HIPAA Audit Logging alongside GDPR Compliance Framework) and SUPE-0004 (ISO 27001 Annex A with IHE Technical Framework Plus). Each directive identifier functions as a stable anchor across the schema, enabling referential integrity between the directive's core record and its associated attribute definitions and typed values.

**t_directive_authored_and_applies**

| id | directive | authored_by | applies_to |
| --- | --- | --- | --- |
| APPL-0001 | HIPAA Audit Logging | OBSO-0006 | ISO Certified Facilities |
| APPL-0002 | EPA Air Quality | OBSO-0004 | Edge Gateway Nodes |
| APPL-0003 | FHIR R4 Interoperability | OBSO-0002 | Cloud Storage Buckets |
| APPL-0004 | EPA Air Quality | OBSO-0005 | Customer PII Datasets |
| APPL-0005 | FDA Electronic Records | OBSO-0007 | Financial Ledger Tables |
| APPL-0006 | CIS Critical Security Controls | OBSO-0002 | HIPAA Covered Entities |

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

**t_directive_not_obsolete**

| id | directive | directive_2 |
| --- | --- | --- |
| OBSO-0001 | NIST Security Framework | FDA Electronic Records |
| OBSO-0002 | OGC API Features Standard | MITRE ATT&CK Framework |
| OBSO-0003 | OWASP Testing Guide v4 | CISA Vulnerability Catalog |
| OBSO-0004 | IHE Patient Identity Cross | HIPAA Privacy Rule |
| OBSO-0005 | ISO Quality Management | OGC API Features Standard |
| OBSO-0006 | EPA Emission Standard | DOE Research Safety |
| OBSO-0007 | NIST CM-7 Baseline | HIPAA Privacy Rule |

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

**t_directive_not_superseded**

| id | directive | directive_2 |
| --- | --- | --- |
| SUPE-0001 | HIPAA Audit Logging | GDPR Compliance Framework |
| SUPE-0002 | IEEE 802.15.4 Radio Spec | FDA Electronic Records |
| SUPE-0003 | NIST CSF v2 Profile | FDA Electronic Records |
| SUPE-0004 | ISO 27001 Annex A | IHE Technical Framework Plus |
| SUPE-0005 | FDA 21 CFR Compliance | OWASP Application Security Guide |
| SUPE-0006 | EPA Air Quality | OWASP Testing Guide v4 |

**t_directive_not_superseded_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUPE-0001 | effective_date | xsd:date |
| SUPE-0002 | enforcement | xsd:string |
| SUPE-0003 | mandatory | xsd:boolean |
| SUPE-0004 | priority | xsd:integer |
| SUPE-0005 | review_cycle_days | xsd:integer |
| SUPE-0006 | scope | xsd:string |
| SUPE-0007 | encoding | xsd:string |
| SUPE-0008 | label_text | xsd:string |

**t_directive_not_superseded_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUPE-0001 | SUPE-0001 | SUPE-0003 | false |
| SUPE-0002 | SUPE-0002 | SUPE-0003 | true |
| SUPE-0003 | SUPE-0003 | SUPE-0003 | false |
| SUPE-0004 | SUPE-0004 | SUPE-0003 | false |
| SUPE-0005 | SUPE-0005 | SUPE-0003 | true |
| SUPE-0006 | SUPE-0006 | SUPE-0003 | true |

**t_directive_not_superseded_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUPE-0001 | SUPE-0001 | SUPE-0004 | 4 |
| SUPE-0002 | SUPE-0001 | SUPE-0005 | 434 |
| SUPE-0003 | SUPE-0002 | SUPE-0004 | 3 |
| SUPE-0004 | SUPE-0002 | SUPE-0005 | 471 |
| SUPE-0005 | SUPE-0003 | SUPE-0004 | 4 |
| SUPE-0006 | SUPE-0003 | SUPE-0005 | 762 |
| SUPE-0007 | SUPE-0004 | SUPE-0004 | 3 |
| SUPE-0008 | SUPE-0004 | SUPE-0005 | 766 |

Attributes define the dimensional properties of a directive, and their types are strictly constrained to XML Schema Datatypes to ensure machine-readable validation. Across all three directive classifications—authored_and_applies, not_obsolete, and not_superseded—the attribute namespace is uniform: effective_date (xsd:date), enforcement (xsd:string), mandatory (xsd:boolean), and priority (xsd:integer), supplemented by additional varchar attributes indexed as attr_id values 0007 through 0009. This type discipline is not merely declarative; it dictates the physical storage layout, with boolean, date, integer, and varchar values materialized in separate value tables. The separation of typed value stores enforces schema-level constraints at the storage engine, preventing type coercion errors and enabling efficient range queries on dates and integers without runtime casting.

The entity column in each value table establishes the foreign-key linkage between a directive's core identifier and its attribute values, creating a normalized entity-attribute-value pattern that preserves type safety. For the authored_and_applies cohort, entity_id APPL-0001 links to effective_date value 2023-01-05, enforcement value Encoding 01, mandatory value true, and priority value 5; entity_id APPL-0002 carries effective_date 2024-10-27, enforcement Enforcement 02, mandatory true, and priority 5; entity_id APPL-0003 records effective_date 2025-04-09, mandatory true, and priority 5; and entity_id APPL-0004 stores effective_date 2024-01-05, mandatory true, and priority 5. The not_obsolete set mirrors this structure with entity_id OBSO-0001 mapping to effective_date 2024-10-21, enforcement Encoding 01, mandatory true, and priority 5, while the not_superseded set assigns entity_id SUPE-0001 to effective_date 2023-02-05, enforcement Encoding 01, mandatory false, and priority 4. The varchar attribute values introduce additional semantic layers: pre-release note and ja appear in the authored_and_applies and not_superseded cohorts respectively, while intake form and en populate the not_obsolete cohort, suggesting locale or status annotations attached to directives.

**t_directive_authored_and_applies_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| APPL-0001 | APPL-0001 | APPL-0001 | 2023-01-05 |
| APPL-0002 | APPL-0002 | APPL-0001 | 2024-10-27 |
| APPL-0003 | APPL-0003 | APPL-0001 | 2025-04-09 |
| APPL-0004 | APPL-0004 | APPL-0001 | 2024-01-05 |
| APPL-0005 | APPL-0005 | APPL-0001 | 2023-12-27 |
| APPL-0006 | APPL-0006 | APPL-0001 | 2023-04-20 |

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

**t_directive_not_superseded_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUPE-0001 | SUPE-0001 | SUPE-0001 | 2023-02-05 |
| SUPE-0002 | SUPE-0002 | SUPE-0001 | 2025-04-26 |
| SUPE-0003 | SUPE-0003 | SUPE-0001 | 2023-02-14 |
| SUPE-0004 | SUPE-0004 | SUPE-0001 | 2025-06-15 |
| SUPE-0005 | SUPE-0005 | SUPE-0001 | 2023-09-27 |
| SUPE-0006 | SUPE-0006 | SUPE-0001 | 2024-06-22 |

**t_directive_not_superseded_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUPE-0001 | SUPE-0001 | SUPE-0007 | Encoding 01 |
| SUPE-0002 | SUPE-0001 | SUPE-0002 | Enforcement 02 |
| SUPE-0003 | SUPE-0001 | SUPE-0008 | pre-release note |
| SUPE-0004 | SUPE-0001 | SUPE-0009 | ja |
| SUPE-0005 | SUPE-0001 | SUPE-0006 | Scope 05 |
| SUPE-0006 | SUPE-0002 | SUPE-0007 | Encoding 06 |
| SUPE-0007 | SUPE-0002 | SUPE-0002 | Enforcement 07 |
| SUPE-0008 | SUPE-0002 | SUPE-0008 | change rationale |

The attr_id column within each value table resolves to the corresponding attribute definition, completing the three-way join between directive, attribute, and value. In the authored_and_applies set, attr_id APPL-0001 references effective_date across all four entities; attr_id APPL-0003 references mandatory, uniformly true for all entities; attr_id APPL-0004 and APPL-0005 reference distinct priority attributes with values 5 and 736 for entity APPL-0001, and 5 and 165 for entity APPL-0002. This multiplicity of integer attributes per entity—two priority columns per directive—indicates that directives carry layered priority scores, perhaps distinguishing operational urgency from regulatory severity. The not_obsolete cohort assigns priority values of 5 and 703 to OBSO-0001, and 4 and 418 to OBSO-0002; the not_superseded cohort assigns 4 and 434 to SUPE-0001, and 3 and 471 to SUPE-0002. The consistent presence of two integer attributes per entity across all cohorts suggests a standardized dual-priority model embedded in the governance framework.

Identifier scoping across the three directive classifications—APPL-, OBSO-, and SUPE- prefixes—provides an immediate operational signal about each directive's lifecycle state without requiring a join to a status lookup table. The APPL- prefix denotes directives actively authored and applied to specific operational targets; the OBSO- prefix identifies directives that remain in force but are flagged for eventual retirement; the SUPE- prefix marks directives that have not been superseded by newer versions, implying an active maintenance window. This prefix-based classification, combined with the paired directive fields (directive and directive_2) that link related standards—such as HIPAA Audit Logging with GDPR Compliance Framework in SUPE-0001, or NIST Security Framework with FDA Electronic Records in OBSO-0001—creates a relational map of regulatory interdependencies. Compliance officers can trace how a directive like HIPAA Audit Logging appears across multiple lifecycle states and is cross-referenced with GDPR, enabling impact analysis when either regulation undergoes amendment.