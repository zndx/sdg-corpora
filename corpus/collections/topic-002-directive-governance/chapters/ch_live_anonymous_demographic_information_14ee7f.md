---
chapter_id: ch_live_anonymous_demographic_information_14ee7f
topic_id: 2
family: 08_derived
cited_terms: ['anonymous_demographic_information', 'policy_with_jurisdiction', 'evidence_basic']
model: engine-refine
---

Anonymous demographic information is captured through a normalized attribute-value architecture that separates conceptual definitions from their concrete instantiations, thereby enabling granular control over data classification and retention. The principal entity table anchors each record with a unique identifier—INFO-0001 through INFO-0004—and carries three parallel data columns: anonymous_demographic_information, demographic_information, and personally_identifiable_information. Within the anonymous tier, values such as school_district_enrollment, household_size, geographic_region, and health_survey_responses are stored alongside demographic_information entries that include health_survey_responses, geographic_region, age_brackets, and household_size, reflecting the deliberate overlap between anonymized and semi-anonymized categories. The personally_identifiable_information column holds home_address, full_legal_name, and passport_number, establishing a clear demarcation between data that may be shared broadly and data subject to stricter regulatory constraints.

**t_anonymous_demographic_information**

| id | anonymous_demographic_information | demographic_information | personally_identifiable_information |
| --- | --- | --- | --- |
| INFO-0001 | school_district_enrollment | health_survey_responses | home_address |
| INFO-0002 | household_size | geographic_region | home_address |
| INFO-0003 | geographic_region | age_brackets | full_legal_name |
| INFO-0004 | health_survey_responses | household_size | passport_number |
| INFO-0005 | housing_market_surveys | age_brackets | passport_number |
| INFO-0006 | marital_status | disability_status | financial_account |

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

Attribute metadata is defined independently of the values they describe, a design choice that supports schema evolution without requiring structural changes to the entity table. The attribute definition table records attr_name values including confidence, dimension_kind, method, and recorded_at, each bound to an XSD type—xsd:decimal, xsd:string, or xsd:dateTime—that governs validation and serialization. This separation permits a single entity to carry multiple attributes of heterogeneous types, with the actual values dispatched into type-specific value tables. Decimal attributes such as confidence are materialized as floating-point numbers (0.448, 0.771, 124.47, 40.18), string attributes like dimension_kind and method resolve to categorical labels (Dimension Kind 01, Encoding 02, pre-release note, de), and temporal attributes such as recorded_at store ISO 8601 timestamps (2024-08-15T06:37:30, 2023-10-27T17:02:18, 2023-05-03T14:37:32, 2023-05-25T07:11:49). The entity_id column in each value table links the concrete value back to its parent entity, while attr_id resolves to the attribute definition, forming a tripartite relationship that supports arbitrary attribute cardinality.

Policy governance is modeled through a parallel structure that associates regulatory frameworks with jurisdictional evidence identifiers. The policy_with_jurisdiction table maps policies—Financial Conduct Authority, European Union, and FISMA—to jurisdiction records (EVID-0001 through EVID-0006), creating a many-to-many relationship that accommodates overlapping regulatory domains. Attribute definitions for policies include effective_date (xsd:date), enforcement (xsd:string), mandatory (xsd:boolean), and priority (xsd:integer), each stored in its own typed value table. Boolean enforcement flags take values of true or false across records, effective dates span from 2023-05-18 through 2025-06-18, and integer priority levels range from 1 to 326, providing a quantitative basis for conflict resolution when multiple policies apply to the same jurisdiction. String attributes capture enforcement mechanisms (Enforcement 02, Encoding 01) and procedural references (intake form, ja).

**t_policy_with_jurisdiction**

| id | policy | jurisdiction |
| --- | --- | --- |
| JURI-0001 | Financial Conduct Authority | EVID-0006 |
| JURI-0002 | European Union | EVID-0003 |
| JURI-0003 | European Union | EVID-0001 |
| JURI-0004 | FISMA | EVID-0002 |
| JURI-0005 | California Attorney General | EVID-0005 |
| JURI-0006 | Federal Trade Commission | EVID-0001 |

**t_policy_with_jurisdiction_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| JURI-0001 | effective_date | xsd:date |
| JURI-0002 | enforcement | xsd:string |
| JURI-0003 | mandatory | xsd:boolean |
| JURI-0004 | priority | xsd:integer |
| JURI-0005 | review_cycle_days | xsd:integer |
| JURI-0006 | scope | xsd:string |
| JURI-0007 | encoding | xsd:string |
| JURI-0008 | label_text | xsd:string |

**t_policy_with_jurisdiction_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0003 | false |
| JURI-0002 | JURI-0002 | JURI-0003 | false |
| JURI-0003 | JURI-0003 | JURI-0003 | true |
| JURI-0004 | JURI-0004 | JURI-0003 | false |
| JURI-0005 | JURI-0005 | JURI-0003 | false |
| JURI-0006 | JURI-0006 | JURI-0003 | true |

**t_policy_with_jurisdiction_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0001 | 2023-11-22 |
| JURI-0002 | JURI-0002 | JURI-0001 | 2024-05-18 |
| JURI-0003 | JURI-0003 | JURI-0001 | 2025-06-18 |
| JURI-0004 | JURI-0004 | JURI-0001 | 2023-05-18 |
| JURI-0005 | JURI-0005 | JURI-0001 | 2025-03-17 |
| JURI-0006 | JURI-0006 | JURI-0001 | 2024-10-08 |

**t_policy_with_jurisdiction_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0004 | 4 |
| JURI-0002 | JURI-0001 | JURI-0005 | 326 |
| JURI-0003 | JURI-0002 | JURI-0004 | 1 |
| JURI-0004 | JURI-0002 | JURI-0005 | 210 |
| JURI-0005 | JURI-0003 | JURI-0004 | 2 |
| JURI-0006 | JURI-0003 | JURI-0005 | 496 |
| JURI-0007 | JURI-0004 | JURI-0004 | 2 |
| JURI-0008 | JURI-0004 | JURI-0005 | 607 |

**t_policy_with_jurisdiction_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0007 | Encoding 01 |
| JURI-0002 | JURI-0001 | JURI-0002 | Enforcement 02 |
| JURI-0003 | JURI-0001 | JURI-0008 | intake form |
| JURI-0004 | JURI-0001 | JURI-0009 | ja |
| JURI-0005 | JURI-0001 | JURI-0006 | Scope 05 |
| JURI-0006 | JURI-0002 | JURI-0007 | Encoding 06 |
| JURI-0007 | JURI-0002 | JURI-0002 | Enforcement 07 |
| JURI-0008 | JURI-0002 | JURI-0008 | change rationale |

Evidence records serve as the foundational layer to which both demographic data and policy jurisdictions are anchored. The evidence_basic table stores evidence descriptions—Compliance checklist, Latency benchmark result, Incident postmortem—alongside dimension_kind values (temperature, count, pressure) and encoding specifications (ascii, latin1, utf8). These encoding values determine how byte sequences are interpreted when evidence is serialized or exchanged between systems, while dimension_kind provides a semantic classification that supports filtering and aggregation. The evidence identifier (EVID-0001 through EVID-0004) appears as a foreign key in the policy_with_jurisdiction table, establishing a referential chain from regulatory policy through jurisdictional scope to the underlying evidence that justifies compliance assertions.

**t_evidence_basic**

| id | evidence | dimension_kind | encoding |
| --- | --- | --- | --- |
| EVID-0001 | Compliance checklist | temperature | ascii |
| EVID-0002 | Latency benchmark result | count | latin1 |
| EVID-0003 | Incident postmortem | temperature | utf8 |
| EVID-0004 | Compliance checklist | pressure | utf8 |
| EVID-0005 | Temperature spike alert | length | utf8 |
| EVID-0006 | Metric threshold breach | temperature | ascii |

The overall architecture enforces a clear separation between data classification, attribute semantics, and value instantiation. Identifiers provide stable references across all tables, enabling joins that reconstruct a complete picture of any entity's attributes without denormalization. Type-specific value tables ensure that decimal arithmetic, string comparison, and date operations are performed on correctly typed data, while the attribute definition table acts as a registry that can be extended with new attributes without schema migration. This design supports compliance workflows where the same demographic entity may be evaluated against multiple policies (European Union, FISMA), each with its own effective dates, enforcement flags, and priority levels, while the underlying evidence records provide an auditable trail of the data sources that informed those evaluations.