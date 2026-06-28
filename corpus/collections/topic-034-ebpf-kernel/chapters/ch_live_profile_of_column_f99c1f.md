---
chapter_id: ch_live_profile_of_column_f99c1f
topic_id: 34
family: 02_observation_measurement
cited_terms: ['profile_of_column', 'school_security_policy', 'attribute_set_supports_outlier_claim']
model: engine-refine
---

School security policies are captured as structured governance records that bind each institution's operational posture to its regulatory obligations. A policy such as the one governing Cedar Ridge Preparatory targets network intrusion detection and must satisfy OSHA workplace safety requirements, while Westfield Middle School's policy focuses on unauthorized access prevention under a no-lethal-force rule. Lincoln High School and Sunrise International School both direct their efforts toward cyber threat intelligence, yet they are bound by different constitutional constraints—ADA accessibility standards and state education statutes, respectively. The policy identifier (POLI-0001 through POLI-0004) anchors each record, and the triad of school name, security objective, and compliance constraint forms the core governance contract that auditors and administrators reference when evaluating institutional readiness.

**t_school_security_policy**

| id | school_security_policy | targets | must_satisfy |
| --- | --- | --- | --- |
| POLI-0001 | Cedar Ridge Preparatory | Network intrusion detection | OSHA workplace safety |
| POLI-0002 | Westfield Middle School | Unauthorized access prevention | No lethal force rule |
| POLI-0003 | Lincoln High School | Cyber threat intelligence | ADA accessibility standards |
| POLI-0004 | Sunrise International School | Cyber threat intelligence | State education statutes |
| POLI-0005 | Northview Technical Institute | Emergency evacuation protocols | State education statutes |
| POLI-0006 | Cedar Ridge Preparatory | Visitor management compliance | ISO 27001 framework |
| POLI-0007 | Sunrise International School | Structural integrity monitoring | ADA accessibility standards |
| POLI-0008 | Jefferson STEM Academy | Network intrusion detection | No lethal force rule |

**t_school_security_policy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | effective_date | xsd:date |
| POLI-0002 | enforcement | xsd:string |
| POLI-0003 | mandatory | xsd:boolean |
| POLI-0004 | priority | xsd:integer |
| POLI-0005 | review_cycle_days | xsd:integer |
| POLI-0006 | scope | xsd:string |
| POLI-0007 | encoding | xsd:string |
| POLI-0008 | label_text | xsd:string |

**t_school_security_policy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 2 |
| POLI-0002 | POLI-0001 | POLI-0005 | 982 |
| POLI-0003 | POLI-0002 | POLI-0004 | 2 |
| POLI-0004 | POLI-0002 | POLI-0005 | 312 |
| POLI-0005 | POLI-0003 | POLI-0004 | 2 |
| POLI-0006 | POLI-0003 | POLI-0005 | 809 |
| POLI-0007 | POLI-0004 | POLI-0004 | 4 |
| POLI-0008 | POLI-0004 | POLI-0005 | 270 |

Because security policies carry heterogeneous metadata, the schema employs an entity-attribute-value pattern that separates attribute definitions from their typed values. The attribute catalog defines properties such as effective_date, enforcement, mandatory, and priority, each annotated with an XSD type—xsd:date, xsd:string, xsd:boolean, or xsd:integer. Values are then materialized in dedicated type-specific tables: boolean flags like mandatory appear in the boolean value store, dates such as 2023-05-09 or 2024-07-27 reside in the date value table, integers like priority levels of 2 or 982 are stored in the integer value table, and free-form strings including enforcement labels and intake form descriptors occupy the varchar value table. This type-disaggregated design ensures that every policy attribute is stored with its correct semantic type, enabling precise validation and query semantics without sacrificing the flexibility to add new attributes without schema migrations.

**t_school_security_policy_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | true |
| POLI-0002 | POLI-0002 | POLI-0003 | false |
| POLI-0003 | POLI-0003 | POLI-0003 | false |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | true |
| POLI-0007 | POLI-0007 | POLI-0003 | true |
| POLI-0008 | POLI-0008 | POLI-0003 | false |

**t_school_security_policy_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2023-05-09 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2024-07-27 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2023-12-11 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2024-08-29 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2024-05-03 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2024-09-29 |
| POLI-0007 | POLI-0007 | POLI-0001 | 2024-11-04 |
| POLI-0008 | POLI-0008 | POLI-0001 | 2024-06-30 |

**t_school_security_policy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | intake form |
| POLI-0004 | POLI-0001 | POLI-0009 | ja |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | pre-release note |

Beyond the structural metadata of individual policies, the framework tracks confidence and uncertainty around factual claims through a fact-profile dimension. Each fact carries a unique identifier (COLU-0001 through COLU-0004), an about_key linking it to a labeled category from the about dimension, a confidence score ranging from 0.226 to 0.994, an uncertainty magnitude between 284.36 and 622.09, and a numeric value. The about dimension itself organizes these facts into categories—About Category 01 through About Category 04—each associated with a human-readable label such as About Label 01. This layered structure allows analysts to trace a numerical measurement back to its categorical context and to assess how reliably it reflects the underlying reality, which is critical when security posture decisions depend on probabilistic evidence rather than deterministic facts.

**fact_profile**

| id | about_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| COLU-0001 | COLU-0002 | 0.299 | 284.36 | 728.94 |
| COLU-0002 | COLU-0002 | 0.994 | 557.92 | 380.57 |
| COLU-0003 | COLU-0001 | 0.773 | 622.09 | 607.36 |
| COLU-0004 | COLU-0006 | 0.226 | 488.10 | 448.09 |

**dim_about**

| id | about_label | about_category |
| --- | --- | --- |
| COLU-0001 | About Label 01 | About Category 01 |
| COLU-0002 | About Label 02 | About Category 02 |
| COLU-0003 | About Label 03 | About Category 03 |
| COLU-0004 | About Label 04 | About Category 04 |
| COLU-0005 | About Label 05 | About Category 05 |
| COLU-0006 | About Label 06 | About Category 06 |

Data provenance and quality assertions are formalized through a claim-support graph that attributes each outlier claim to the infrastructure components that substantiate it. Claims such as "source system ID," "validation rule," "geolocation accuracy," and "sensor calibration" are recorded as discrete assertions, and each claim is linked to one or more supporting entities—an API gateway, a PostgreSQL instance, or an Ontology registry—through a junction table that also records the nature of the relationship via a role field. In the observed data, the role is predominantly "contributor," with one instance of "owner," indicating that most support relationships are collaborative rather than singularly accountable. This graph structure makes it possible to audit which systems underpin which claims, to identify single points of failure when a claim depends on a single support, and to demonstrate compliance by showing that every assertion is traceable to a verifiable infrastructure component.

**t_attribute_set_supports_outlier_claim**

| id | attribute |
| --- | --- |
| CLAI-0001 | source system ID |
| CLAI-0002 | validation rule |
| CLAI-0003 | geolocation accuracy |
| CLAI-0004 | sensor calibration |
| CLAI-0005 | source system ID |
| CLAI-0006 | validation rule |

**t_attribute_set_supports_outlier_claim_supports**

| id | supports |
| --- | --- |
| CLAI-0001 | API gateway |
| CLAI-0002 | PostgreSQL instance |
| CLAI-0003 | Ontology registry |
| CLAI-0004 | Ontology registry |
| CLAI-0005 | Storage volume |
| CLAI-0006 | Storage volume |

**t_attribute_set_supports_outlier_claim__supports**

| id | attribute_id | supports_id | role |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | contributor |
| CLAI-0002 | CLAI-0005 | CLAI-0002 | contributor |
| CLAI-0003 | CLAI-0003 | CLAI-0005 | owner |
| CLAI-0004 | CLAI-0005 | CLAI-0005 | contributor |
| CLAI-0005 | CLAI-0006 | CLAI-0001 | owner |
| CLAI-0006 | CLAI-0004 | CLAI-0002 | contributor |
| CLAI-0007 | CLAI-0001 | CLAI-0004 | reviewer |
| CLAI-0008 | CLAI-0001 | CLAI-0002 | contributor |