---
chapter_id: ch_live_soc2_security_subclass_e96f34
topic_id: 183
family: 07_long_tail
cited_terms: ['soc2_security_subclass', 'young_adult_speaker_role', 'measurement_with_method']
model: engine-refine
---

Within a SOC 2 security governance framework, each security subclass—such as SOC2-CloudInfra, SOC3-Public, SOC2-Fintech, or SOC2-IdentityProvider—serves as a container for domain-specific controls, whether governing Virtual Networks, Microservice Mesh, or Database Clusters. The attributes attached to these subclasses define the metadata schema through which controls are parameterized. An attribute carries a name, such as effective_date, enforcement, mandatory, or priority, and a strict type constraint drawn from the XSD vocabulary: xsd:date, xsd:string, xsd:boolean, or xsd:integer. This type discipline ensures that every value assigned to an attribute is semantically coherent and machine-processable. For instance, the effective_date attribute expects xsd:date values like 2023-08-15 or 2024-04-12, while the mandatory attribute accepts only xsd:boolean values—true or false—enforcing a binary compliance posture. The priority attribute, typed as xsd:integer, accommodates numeric severity levels such as 5 or 926, and the enforcement attribute, typed as xsd:string, stores free-form descriptors like "Enforcement 02" or "audit excerpt."

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

The entity-attribute-value model distributes these typed values across a normalized set of tables, each dedicated to a single data type. Boolean values reside in a dedicated valuation table where each row links an entity—identified by a composite key such as SECU-0001—to a specific attribute and its truth value. Date values follow the same pattern, anchoring an effective_date to a particular security subclass instance. Integer and string values are similarly segregated into their own valuation tables, ensuring type safety at the storage layer. This normalization strategy means that a single security subclass, identified by a unique key like SECU-0001, can carry a rich set of heterogeneous attributes without schema bloat: one row in the boolean valuation table might record that the mandatory attribute is true, while a corresponding row in the date valuation table establishes the effective_date as 2025-05-01, and another row in the integer valuation table assigns a priority of 849.

Measurement data introduces a second dimension of governance observability, where each measurement is anchored to a via_method and accompanied by a confidence score and an uncertainty bound. The fact_measurement table records a numeric value—say, 660.64—alongside a confidence of 0.945 and an uncertainty of 279.24, indicating a high-confidence measurement with a substantial error margin. By contrast, a measurement with a value of 64.10 might carry a confidence of only 0.307 and an uncertainty of 364.07, signaling a low-confidence observation with a wide error band. These measurements are linked to a via_method dimension, which itself is classified by a category such as Via Method Category 01 or Via Method Category 04, and labeled with a human-readable identifier like Via Method Label 03. The via_method_key in the fact table references the dimension table, enabling aggregation and filtering by method type while preserving the full provenance of each measurement.

**fact_measurement**

| id | via_method_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| METH-0001 | METH-0003 | 0.496 | 306.26 | 353.34 |
| METH-0002 | METH-0002 | 0.945 | 279.24 | 660.64 |
| METH-0003 | METH-0005 | 0.506 | 120.70 | 878.99 |
| METH-0004 | METH-0005 | 0.307 | 364.07 | 64.10 |
| METH-0005 | METH-0001 | 0.923 | 642.96 | 897.70 |

**dim_via_method**

| id | via_method_label | via_method_category |
| --- | --- | --- |
| METH-0001 | Via Method Label 01 | Via Method Category 01 |
| METH-0002 | Via Method Label 02 | Via Method Category 02 |
| METH-0003 | Via Method Label 03 | Via Method Category 03 |
| METH-0004 | Via Method Label 04 | Via Method Category 04 |
| METH-0005 | Via Method Label 05 | Via Method Category 05 |
| METH-0006 | Via Method Label 06 | Via Method Category 06 |

Educational presentations and speaker roles form a parallel governance structure, tracking the dissemination of compliance knowledge through a young_adult_speaker_role dimension. Each role—Morales PolicyYouth, Ruiz OpenEdLead, Chen TEDx2023, or Tanaka YouthTech—is associated with a qualifying individual, such as Chloe Tan, Lucas Fernandez, Elena Rossi, or Zara Okonkwo, and linked to a specific educational presentation like Ethical AI Governance or Open Source Licensing. This structure captures not only who delivers what content but also the institutional role through which they are authorized to do so. The identifier ROLE-0001, for example, ties the Morales PolicyYouth role to Chloe Tan's delivery of Ethical AI Governance, creating an auditable chain from individual to role to presentation topic.

**t_young_adult_speaker_role**

| id | young_adult_speaker_role | qualifying_individual | delivers_presentation |
| --- | --- | --- | --- |
| ROLE-0001 | Morales PolicyYouth | Chloe Tan | Ethical AI Governance |
| ROLE-0002 | Ruiz OpenEdLead | Lucas Fernandez | Ethical AI Governance |
| ROLE-0003 | Chen TEDx2023 | Elena Rossi | Open Source Licensing |
| ROLE-0004 | Tanaka YouthTech | Zara Okonkwo | Ethical AI Governance |
| ROLE-0005 | Tanaka YouthTech | Zara Okonkwo | Cloud Cost Optimization |
| ROLE-0006 | Patel AIWorkshop | Zara Okonkwo | Neuroplasticity Learning |

Across all these structures, the identifier column provides a stable, machine-readable key that enables cross-table joins and referential integrity. Whether the identifier takes the form SECU-0001 for a security subclass, ROLE-0001 for a speaker role, or METH-0001 for a via method, it serves as the primary anchor for relational queries. The entity_id column in the valuation tables and the via_method_key column in the fact table both reference these primary keys, establishing foreign-key relationships that maintain consistency across the data model. This design ensures that every attribute value, measurement, and presentation can be traced back to its originating entity or method, supporting both operational reporting and compliance audit trails.

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