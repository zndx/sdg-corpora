---
chapter_id: ch_live_lineage_edge_max_one_target_f298ab
topic_id: 183
family: 05_provo_lineage
cited_terms: ['lineage_edge_max_one_target', 'soc2_security_subclass', 'control_implements']
model: engine-refine
---

In compliance and security governance frameworks, the ability to model relationships between controls, targets, and their attributes is foundational to demonstrating adherence to standards such as SOC 2. At the core of this modeling approach is the concept of an entity—any discrete object within the governance domain, whether it is a security subclass like SOC2-CloudInfra or SOC2-Fintech, or a control such as Change Advisory Board or Data Retention Schedule. Each entity receives a unique identifier, for example SECU-0001 or IMPL-0001, which serves as the stable reference point across all relational structures. These identifiers enable the framework to track not only what exists within the governance landscape but also how individual components connect to one another through structured relationships.

**t_soc2_security_subclass**

| id | soc | for_s_o_c2_domain |
| --- | --- | --- |
| SECU-0001 | SOC2-CloudInfra | IMPL-0007 |
| SECU-0002 | SOC3-Public | IMPL-0007 |
| SECU-0003 | SOC2-Fintech | IMPL-0005 |
| SECU-0004 | SOC2-IdentityProvider | IMPL-0007 |
| SECU-0005 | SOC2-SaaS | IMPL-0001 |
| SECU-0006 | SOC2-TypeII | IMPL-0007 |
| SECU-0007 | SOC2-SaaS | IMPL-0007 |

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

Attributes provide the mechanism by which entities carry descriptive and evaluative metadata. Rather than embedding fixed columns within each entity table, the framework employs an entity-attribute-value pattern that separates attribute definitions from their concrete values. The attribute definition table specifies both the name of an attribute—such as effective_date, enforcement, mandatory, or priority—and its type, drawn from a schema namespace including xsd:date, xsd:string, xsd:boolean, and xsd:integer. This separation allows the governance model to evolve without schema migrations: new attributes can be introduced simply by adding rows to the definition table. The actual values are stored in type-specific tables, so boolean attributes like mandatory hold values of true or false, date attributes like effective_date record dates such as 2023-08-15 or 2025-05-01, and integer attributes like priority capture numeric scores ranging from 1 to 926. String attributes accommodate free-form content, from encoded identifiers like Encoding 01 to descriptive fragments like audit excerpt.

The relationship between controls and the security requirements they satisfy is captured through a implements association that carries its own metadata. A control such as Access Review Cycle may implement a security subclass like SECU-0002, and this relationship is annotated with a priority level—values like 1, 3, or 5 indicate relative importance—and a scope that delineates the boundary of applicability, whether regional, global, or team. This dual annotation ensures that governance assessments can answer not merely which controls map to which requirements, but how critical each mapping is and to what organizational extent it applies. The priority field, for instance, distinguishes a control with priority 1 from one rated at 5, enabling risk-based prioritization during audits and remediation planning.

**t_control_implements**

| id | control | implements | priority | scope |
| --- | --- | --- | --- | --- |
| IMPL-0001 | Change Advisory Board | SECU-0005 | 5 | regional |
| IMPL-0002 | Data Retention Schedule | SECU-0001 | 3 | global |
| IMPL-0003 | Access Review Cycle | SECU-0002 | 1 | team |
| IMPL-0004 | Data Retention Schedule | SECU-0003 | 3 | team |
| IMPL-0005 | GDPR Data Minimization | SECU-0003 | 1 | global |
| IMPL-0006 | Incident Response Protocol | SECU-0007 | 1 | global |
| IMPL-0007 | NIST SP 800-53 | SECU-0001 | 2 | local |

Lineage tracking extends the relational model beyond simple associations into directed dependency chains. The lineage edge tables model how one target depends on another, with each edge carrying a descriptive lineage label such as Sensor calibration chain or Feature store refresh. The join table between targets and their downstream dependents introduces a role attribute that specifies the nature of the relationship—whether a source target acts as a contributor or an owner to its target. For example, the target referenced by TARG-0001 serves as an owner to TARG-0003, while TARG-0003 itself functions as a contributor to TARG-0006. This role-based lineage enables auditors to trace data and control dependencies through complex chains, identifying which components are authoritative sources versus supporting contributors.

**t_lineage_edge_max_one_target**

| id | lineage |
| --- | --- |
| TARG-0001 | Sensor calibration chain |
| TARG-0002 | Sensor calibration chain |
| TARG-0003 | Feature store refresh |
| TARG-0004 | Sensor calibration chain |
| TARG-0005 | Feature store refresh |
| TARG-0006 | Model training pipeline |

**t_lineage_edge_max_one_target_to_target**

| id | to_target |
| --- | --- |
| TARG-0001 | Compliance audit log |
| TARG-0002 | Risk scoring model |
| TARG-0003 | Feature vector store |
| TARG-0004 | Executive dashboard |
| TARG-0005 | Executive summary report |
| TARG-0006 | Data lake staging area |
| TARG-0007 | Executive summary report |
| TARG-0008 | ML inference endpoint |

**t_lineage_edge_max_one_target__to_target**

| id | lineage_id | to_target_id | role |
| --- | --- | --- | --- |
| TARG-0001 | TARG-0006 | TARG-0001 | contributor |
| TARG-0002 | TARG-0001 | TARG-0003 | owner |
| TARG-0003 | TARG-0003 | TARG-0005 | owner |
| TARG-0004 | TARG-0003 | TARG-0006 | contributor |
| TARG-0005 | TARG-0002 | TARG-0008 | owner |
| TARG-0006 | TARG-0006 | TARG-0004 | contributor |
| TARG-0007 | TARG-0006 | TARG-0006 | observer |
| TARG-0008 | TARG-0002 | TARG-0008 | reviewer |

Together, these structures form a cohesive governance data model where identifiers anchor every entity, attributes capture its properties in a type-safe manner, relationships encode both structural dependencies and functional roles, and metadata fields like priority and scope provide the evaluative context necessary for compliance reporting. The model supports the full lifecycle of a control—from its definition and classification through its implementation against security requirements, its valuation with concrete attribute data, and its placement within dependency chains that connect it to downstream targets. This comprehensive approach ensures that every assertion made in a compliance assessment can be traced back to a specific entity, a specific attribute value, and a specific relationship within the governance graph.