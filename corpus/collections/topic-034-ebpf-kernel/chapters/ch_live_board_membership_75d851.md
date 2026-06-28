---
chapter_id: ch_live_board_membership_75d851
topic_id: 34
family: 08_derived
cited_terms: ['board_membership', 'equiv_union_ice_branches', 'soc2_security_subclass']
model: engine-refine
---

The compliance framework organizes security posture around SOC2 security subclasses, each representing a distinct operational domain such as cloud infrastructure, fintech systems, or identity providers. A subclass like SOC2-CloudInfra governs Virtual Networks, while SOC2-IdentityProvider applies to Microservice Mesh environments, and SOC2-Fintech covers Database Clusters. This mapping ensures that security controls are scoped to the specific technology stack and regulatory context they serve, allowing auditors and operators to trace requirements from high-level compliance assertions down to the infrastructure layer.

**t_soc2_security_subclass**

| id | soc | for_s_o_c2_domain |
| --- | --- | --- |
| SECU-0001 | SOC2-CloudInfra | Virtual Networks |
| SECU-0002 | SOC3-Public | Microservice Mesh |
| SECU-0003 | SOC2-Fintech | Database Clusters |
| SECU-0004 | SOC2-IdentityProvider | Microservice Mesh |
| SECU-0005 | SOC2-SaaS | Data Warehouses |
| SECU-0006 | SOC2-TypeII | Database Clusters |
| SECU-0007 | SOC2-SaaS | Database Clusters |

Each security subclass carries typed attributes that define its control parameters, with attribute metadata stored separately from their actual values. Attribute definitions include a name—such as effective_date, enforcement, mandatory, or priority—and a corresponding data type drawn from the XSD schema vocabulary: xsd:date, xsd:string, xsd:boolean, and xsd:integer. This type discipline is enforced through a value partitioning strategy where each attribute type has its own dedicated value table. Boolean attributes like mandatory resolve to true or false across entities; date attributes such as effective_date hold values like 2023-08-15 or 2025-05-01; integer attributes capture numeric thresholds ranging from 1 to 926; and varchar attributes store free-form strings including audit excerpts and language codes like de. The entity_id column in each value table links back to the security subclass, while attr_id references the attribute definition, creating a clean entity-attribute-value pattern that preserves type safety without requiring schema migrations when new attributes are introduced.

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

Participant relationships are tracked through a dimension table that assigns each participant a categorical label and a human-readable identifier. Participants are classified under categories such as Has Participant Category 01 through 04, each associated with a descriptive label like Has Participant Label 01. These participants are then referenced in a fact table that records event counts—quantitative measures of activity or exposure. For instance, participant MEMB-0002 appears in the fact table with an event count of 359, while MEMB-0005 is referenced by two separate fact records with event counts of 236 and 26, suggesting that a single participant can be associated with multiple events or contexts. This structure supports aggregation and trend analysis across participant groups, enabling compliance teams to monitor engagement levels and identify outliers.

**fact_board**

| id | has_participant_key | event_count |
| --- | --- | --- |
| MEMB-0001 | MEMB-0005 | 236 |
| MEMB-0002 | MEMB-0004 | 403 |
| MEMB-0003 | MEMB-0002 | 359 |
| MEMB-0004 | MEMB-0005 | 26 |
| MEMB-0005 | MEMB-0004 | 209 |
| MEMB-0006 | MEMB-0005 | 369 |
| MEMB-0007 | MEMB-0004 | 133 |

**dim_has_participant**

| id | has_participant_label | has_participant_category |
| --- | --- | --- |
| MEMB-0001 | Has Participant Label 01 | Has Participant Category 01 |
| MEMB-0002 | Has Participant Label 02 | Has Participant Category 02 |
| MEMB-0003 | Has Participant Label 03 | Has Participant Category 03 |
| MEMB-0004 | Has Participant Label 04 | Has Participant Category 04 |
| MEMB-0005 | Has Participant Label 05 | Has Participant Category 05 |
| MEMB-0006 | Has Participant Label 06 | Has Participant Category 06 |

Branch-level metadata extends the framework with multilingual support and equivalence mappings. Branch records carry identifiers such as BRAN-0001 through BRAN-0004, each associated with an equivalence concept like Calibration_Offset, Equipment_Model, or Data_Retention_Policy, alongside a label_text describing the branch's purpose—calibration record, change rationale, or intake form. The language column specifies the locale for each label, with values including fr, es, and de, ensuring that compliance documentation can be presented in the appropriate regional language. This multilingual capability is essential for organizations operating across jurisdictions, where regulatory artifacts must be accessible to stakeholders in their native language while maintaining a single canonical data model.

**t_equiv_union_ice_branches**

| id | equiv | label_text | language |
| --- | --- | --- | --- |
| BRAN-0001 | Calibration_Offset | calibration record | fr |
| BRAN-0002 | Equipment_Model | change rationale | es |
| BRAN-0003 | Data_Retention_Policy | calibration record | es |
| BRAN-0004 | Quality_Score | intake form | de |
| BRAN-0005 | Quality_Score | change rationale | de |
| BRAN-0006 | Observation_Code | nightly summary | es |
| BRAN-0007 | Safety_Protocol | nightly summary | es |
| BRAN-0008 | Quality_Score | pre-release note | fr |