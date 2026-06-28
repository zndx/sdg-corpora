---
chapter_id: ch_live_attribute_set_max_attrs_c4db5c
topic_id: 4
family: 02_observation_measurement
cited_terms: ['attribute_set_max_attrs', 'soc2_privacy_subclass', 'claim_observed_by_event']
model: engine-refine
---

Within a structured governance framework, attribute sets serve as the foundational mechanism for capturing and constraining the measurable properties of monitored entities. Each attribute set—identified by a unique code such as ATTR-0001 through ATTR-0004—defines a category of physical or operational characteristics, including voltage_dc, flow_rate_lpm, humidity_percent, and particulate_um. These sets are decomposed into individual attributes, each with a defined name and data type. For instance, the attribute confidence is typed as xsd:decimal, dimension_kind as xsd:string, method as xsd:string, and recorded_at as xsd:dateTime. This type discipline ensures that every recorded value adheres to a strict schema, whether it is a numeric measurement, a categorical label, or a timestamp. The actual values are stored in type-specific tables: decimal values such as 0.687, 125.69, and 391.05 reside in the decimal store; string values like Dimension Kind 01, Encoding 02, and audit excerpt are held in the varchar store; and timestamps such as 2024-07-05T18:39:47 and 2025-03-29T09:43:13 are persisted in the datetime store. Each value record is linked to both an entity and an attribute, creating a traceable chain from raw observation to governed data asset.

**t_attribute_set_max_attrs**

| id | attribute |
| --- | --- |
| ATTR-0001 | voltage_dc |
| ATTR-0002 | flow_rate_lpm |
| ATTR-0003 | humidity_percent |
| ATTR-0004 | particulate_um |
| ATTR-0005 | particulate_um |
| ATTR-0006 | humidity_percent |

**t_attribute_set_max_attrs_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTR-0001 | confidence | xsd:decimal |
| ATTR-0002 | dimension_kind | xsd:string |
| ATTR-0003 | method | xsd:string |
| ATTR-0004 | recorded_at | xsd:dateTime |
| ATTR-0005 | uncertainty | xsd:decimal |
| ATTR-0006 | unit | xsd:string |
| ATTR-0007 | value | xsd:decimal |
| ATTR-0008 | encoding | xsd:string |

**t_attribute_set_max_attrs_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | 2024-07-05T18:39:47 |
| ATTR-0002 | ATTR-0002 | ATTR-0004 | 2024-04-21T13:05:05 |
| ATTR-0003 | ATTR-0003 | ATTR-0004 | 2023-05-25T09:01:45 |
| ATTR-0004 | ATTR-0004 | ATTR-0004 | 2025-03-29T09:43:13 |
| ATTR-0005 | ATTR-0005 | ATTR-0004 | 2024-03-07T20:41:06 |
| ATTR-0006 | ATTR-0006 | ATTR-0004 | 2024-01-09T06:52:17 |

**t_attribute_set_max_attrs_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 0.687 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | 125.69 |
| ATTR-0003 | ATTR-0001 | ATTR-0007 | 391.05 |
| ATTR-0004 | ATTR-0002 | ATTR-0001 | 0.041 |
| ATTR-0005 | ATTR-0002 | ATTR-0005 | 165.49 |
| ATTR-0006 | ATTR-0002 | ATTR-0007 | 169.37 |
| ATTR-0007 | ATTR-0003 | ATTR-0001 | 0.232 |
| ATTR-0008 | ATTR-0003 | ATTR-0005 | 309.64 |

**t_attribute_set_max_attrs_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | Dimension Kind 01 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | Encoding 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | audit excerpt |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | de |
| ATTR-0005 | ATTR-0001 | ATTR-0003 | hybrid |
| ATTR-0006 | ATTR-0001 | ATTR-0006 | kg |
| ATTR-0007 | ATTR-0002 | ATTR-0002 | Dimension Kind 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0008 | Encoding 08 |

Claims represent the assertions or findings derived from these attribute measurements, and they are the primary unit of compliance evidence. Each claim is identified by a unique key—EVEN-0001 through EVEN-0004 in the observed data—and is enriched with a label and a category that classify its nature and domain. Claim Label 01 through Claim Label 04, paired with Claim Category 01 through Claim Category 04, provide the semantic context needed to route claims to the appropriate review workflow. The factual substance of a claim is captured in the fact table, where each record carries a numeric value—164.54, 173.58, 166.95, 152.06—alongside a confidence score and an uncertainty metric. Confidence values such as 0.621, 0.596, 0.338, and 0.364 quantify the degree of assurance in the claim, while uncertainty figures like 571.46, 43.01, 142.53, and 296.86 express the magnitude of potential deviation. Together, these metrics enable risk-weighted decision-making: a claim with high confidence and low uncertainty carries substantially more weight in an audit finding than one with the inverse profile.

**fact_claim**

| id | claim_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| EVEN-0001 | EVEN-0002 | 0.621 | 571.46 | 164.54 |
| EVEN-0002 | EVEN-0002 | 0.596 | 43.01 | 173.58 |
| EVEN-0003 | EVEN-0006 | 0.338 | 142.53 | 166.95 |
| EVEN-0004 | EVEN-0002 | 0.364 | 296.86 | 152.06 |
| EVEN-0005 | EVEN-0001 | 0.316 | 715.93 | 997.16 |
| EVEN-0006 | EVEN-0006 | 0.410 | 701.36 | 614.41 |
| EVEN-0007 | EVEN-0003 | 0.162 | 133.33 | 142.05 |

**dim_claim**

| id | claim_label | claim_category |
| --- | --- | --- |
| EVEN-0001 | Claim Label 01 | Claim Category 01 |
| EVEN-0002 | Claim Label 02 | Claim Category 02 |
| EVEN-0003 | Claim Label 03 | Claim Category 03 |
| EVEN-0004 | Claim Label 04 | Claim Category 04 |
| EVEN-0005 | Claim Label 05 | Claim Category 05 |
| EVEN-0006 | Claim Label 06 | Claim Category 06 |

The SOC2 privacy and security framework is modeled through a layered taxonomy of subclasses and domains that govern how claims and attributes are organized and assigned accountability. SOC2 privacy subclasses—identified by codes such as PRIV-0001 through PRIV-0004—map to specific control statements and assurance types, including SOC1-Control-Statement, SOC1-TypeII, and SOC2-Processing-Integrity. These subclasses are further associated with operational domains such as incidentResponse, securityCriteria, and dataRetention. The relationship between a SOC2 subclass and a domain is not merely associative; it carries a role designation that defines the nature of accountability. In the observed data, the role field takes values of contributor and owner, indicating whether an entity or process participates in fulfilling a domain requirement or bears primary responsibility for it. For example, PRIV-0003 is linked to the securityCriteria domain with the role of owner, while PRIV-0002 connects to the dataRetention domain as a contributor. This role-based assignment ensures that every compliance obligation has a clear line of ownership and a defined set of supporting participants.

**t_soc2_privacy_subclass**

| id | soc |
| --- | --- |
| PRIV-0001 | SOC1-Control-Statement |
| PRIV-0002 | SOC1-TypeII |
| PRIV-0003 | SOC2-Processing-Integrity |
| PRIV-0004 | SOC1-TypeII |
| PRIV-0005 | SOC1-TypeII |
| PRIV-0006 | SOC2-Business-Critical |

**t_soc2_privacy_subclass_for_s_o_c2_domain**

| id | for_s_o_c2_domain |
| --- | --- |
| PRIV-0001 | incidentResponse |
| PRIV-0002 | incidentResponse |
| PRIV-0003 | securityCriteria |
| PRIV-0004 | dataRetention |
| PRIV-0005 | encryptionStandards |
| PRIV-0006 | securityCriteria |

**t_soc2_privacy_subclass__for_s_o_c2_domain**

| id | soc_id | for_s_o_c2_domain_id | role |
| --- | --- | --- | --- |
| PRIV-0001 | PRIV-0003 | PRIV-0001 | contributor |
| PRIV-0002 | PRIV-0006 | PRIV-0005 | contributor |
| PRIV-0003 | PRIV-0003 | PRIV-0003 | owner |
| PRIV-0004 | PRIV-0002 | PRIV-0006 | contributor |
| PRIV-0005 | PRIV-0003 | PRIV-0003 | contributor |
| PRIV-0006 | PRIV-0005 | PRIV-0006 | contributor |
| PRIV-0007 | PRIV-0006 | PRIV-0003 | observer |
| PRIV-0008 | PRIV-0002 | PRIV-0002 | observer |

The interplay between attributes, claims, and SOC2 governance structures creates a closed loop of evidence collection, assertion, and accountability. Attribute values—whether decimal measurements, string classifications, or datetime stamps—are the raw material from which claims are constructed. Each claim inherits its evidentiary weight from the confidence and uncertainty metrics attached to it, and its relevance is determined by its category and the SOC2 domain to which it is mapped. The role field in the junction table between SOC2 subclasses and domains specifies who is responsible for maintaining the integrity of that mapping, ensuring that the governance model is not merely descriptive but enforceable. In practice, this means that an auditor reviewing a claim about data retention can trace the claim back through its category to the relevant SOC2 subclass, then to the specific domain, and finally to the owner or contributor responsible for the underlying attribute data. This end-to-end traceability is what transforms a collection of isolated measurements into a defensible compliance posture.