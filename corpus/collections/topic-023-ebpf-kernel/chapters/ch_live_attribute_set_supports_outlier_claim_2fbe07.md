---
chapter_id: ch_live_attribute_set_supports_outlier_claim_2fbe07
topic_id: 23
family: 02_observation_measurement
cited_terms: ['attribute_set_supports_outlier_claim', 'policy_attests_artifact', 'outlier_claim_supported_by']
model: engine-refine
---

Within compliance and governance architectures, the provenance of an assertion depends on a disciplined separation between what is claimed, how it is characterized, and what substantiates it. An identifier—such as CLAI-0001 or ARTI-0001—serves as the immutable handle for any artifact in the system, whether that artifact is an attribute like "source system ID" or "validation rule," a policy such as "FedRAMP Storage Mandate" or "Zero Trust Access Policy," or a support entity including an "API gateway," "PostgreSQL instance," or "Ontology registry." The attribute itself carries a type that constrains its permissible values: `xsd:date` governs temporal fields like `effective_date` (2023-10-01, 2024-11-14, 2024-03-16, 2025-04-17), `xsd:boolean` constrains enforcement flags to `true` or `false`, `xsd:integer` bounds numeric properties such as priority levels (2, 49, 915), and `xsd:string` accommodates free-form descriptors including "Encoding 01," "Enforcement 02," "intake form," and locale codes like "en." This type discipline ensures that every value—whether stored in a dedicated type-specific valuation table or recorded as miscellaneous text—adheres to a schema that auditors can verify programmatically.

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

**t_policy_attests_artifact**

| id | policy |
| --- | --- |
| ARTI-0001 | FedRAMP Storage Mandate |
| ARTI-0002 | Zero Trust Access Policy |
| ARTI-0003 | NIST Encryption Protocol |
| ARTI-0004 | HIPAA Data Minimization Rule |
| ARTI-0005 | ISO Privacy Guideline |
| ARTI-0006 | Zero Trust Access Policy |

**t_policy_attests_artifact_attr**

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

**t_policy_attests_artifact_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0003 | true |
| ARTI-0002 | ARTI-0002 | ARTI-0003 | true |
| ARTI-0003 | ARTI-0003 | ARTI-0003 | true |
| ARTI-0004 | ARTI-0004 | ARTI-0003 | false |
| ARTI-0005 | ARTI-0005 | ARTI-0003 | true |
| ARTI-0006 | ARTI-0006 | ARTI-0003 | false |

**t_policy_attests_artifact_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 2023-10-01 |
| ARTI-0002 | ARTI-0002 | ARTI-0001 | 2024-11-14 |
| ARTI-0003 | ARTI-0003 | ARTI-0001 | 2024-03-16 |
| ARTI-0004 | ARTI-0004 | ARTI-0001 | 2025-04-17 |
| ARTI-0005 | ARTI-0005 | ARTI-0001 | 2025-02-23 |
| ARTI-0006 | ARTI-0006 | ARTI-0001 | 2024-06-05 |

**t_policy_attests_artifact_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 49 |
| ARTI-0003 | ARTI-0002 | ARTI-0004 | 2 |
| ARTI-0004 | ARTI-0002 | ARTI-0005 | 915 |
| ARTI-0005 | ARTI-0003 | ARTI-0004 | 3 |
| ARTI-0006 | ARTI-0003 | ARTI-0005 | 439 |
| ARTI-0007 | ARTI-0004 | ARTI-0004 | 5 |
| ARTI-0008 | ARTI-0004 | ARTI-0005 | 254 |

**t_policy_attests_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0007 | Encoding 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0002 | Enforcement 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0008 | intake form |
| ARTI-0004 | ARTI-0001 | ARTI-0009 | en |
| ARTI-0005 | ARTI-0001 | ARTI-0006 | Scope 05 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | Encoding 06 |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Enforcement 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | calibration record |

The relationship between attributes and their supporting infrastructure is expressed through a triadic linkage: a subject attribute is connected to a target support entity via a role that specifies the nature of the dependency. When CLAI-0001 ("source system ID") is linked to CLAI-0001 ("API gateway") with the role "contributor," the system records not merely that a dependency exists, but that the API gateway contributes to the provenance of the source system identifier. Similarly, CLAI-0005 ("sensor calibration") appears as a subject in two distinct relationships—once paired with CLAI-0002 ("PostgreSQL instance") as a contributor, and again with CLAI-0005 ("Ontology registry") also as a contributor—demonstrating that a single attribute may draw support from multiple infrastructure components, each playing a defined role in the evidence chain. The category field on the support dimension further classifies these backing entities (Supported By Category 01 through 04), enabling aggregation and policy-level reasoning about which classes of infrastructure underpin which compliance assertions.

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

**dim_supported_by**

| id | supported_by_label | supported_by_category |
| --- | --- | --- |
| SUPP-0001 | Supported By Label 01 | Supported By Category 01 |
| SUPP-0002 | Supported By Label 02 | Supported By Category 02 |
| SUPP-0003 | Supported By Label 03 | Supported By Category 03 |
| SUPP-0004 | Supported By Label 04 | Supported By Category 04 |
| SUPP-0005 | Supported By Label 05 | Supported By Category 05 |
| SUPP-0006 | Supported By Label 06 | Supported By Category 06 |

Outlier detection and confidence scoring introduce a probabilistic layer atop this deterministic provenance graph. Each fact in the outlier dimension carries a value—453.93, 510.05, 369.89, 757.32—alongside a confidence score ranging from 0.147 to 0.877 and an uncertainty measure spanning 10.24 to 719.33. The supported_by_key field (SUPP-0001 through SUPP-0006) anchors each outlier to its supporting infrastructure, while the confidence and uncertainty fields quantify the degree of assurance that the observed value deviates from expected behavior. A fact with confidence 0.877 and uncertainty 516.58 represents a high-certainty, high-variance deviation, whereas a fact with confidence 0.147 and uncertainty 368.22 signals low confidence despite moderate variance—information that compliance officers must weigh when determining whether an anomaly warrants remediation or can be attributed to known operational noise.

**fact_outlier**

| id | supported_by_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| SUPP-0001 | SUPP-0006 | 0.877 | 516.58 | 453.93 |
| SUPP-0002 | SUPP-0002 | 0.147 | 368.22 | 510.05 |
| SUPP-0003 | SUPP-0001 | 0.792 | 10.24 | 369.89 |
| SUPP-0004 | SUPP-0003 | 0.479 | 719.33 | 757.32 |
| SUPP-0005 | SUPP-0003 | 0.986 | 245.64 | 972.07 |
| SUPP-0006 | SUPP-0004 | 0.386 | 5.02 | 16.62 |
| SUPP-0007 | SUPP-0003 | 0.047 | 979.09 | 828.93 |

Entity-level valuation tables complete the picture by materializing attribute values against specific policy artifacts. The entity identifier (ARTI-0001 through ARTI-0004) ties each valuation to a concrete policy—FedRAMP Storage Mandate, Zero Trust Access Policy, NIST Encryption Protocol, or HIPAA Data Minimization Rule—while the attribute identifier specifies which property is being valued. Boolean enforcement flags, effective dates, integer priorities, and string descriptors are stored in type-specific tables to preserve data integrity, yet they all resolve to the same entity-attribute pair. This normalization means that a compliance query can join across type boundaries to reconstruct the full attribute profile of any artifact: ARTI-0001, for instance, carries an effective date of 2023-10-01, an enforcement flag of `true`, a priority of 2, and a descriptor "Encoding 01," each drawn from a different valuation table but unified under a single entity identifier. The misc column, appearing across multiple tables, captures unstructured or semi-structured annotations that resist strict typing—labels, categories, and free-form values that supplement the structured data without violating its constraints.