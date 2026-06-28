---
chapter_id: ch_live_schemaorg_product_price_5aabb1
topic_id: 186
family: 07_long_tail
cited_terms: ['schemaorg_product_price', 'profiling_produces_profile', 'soc2_security_subclass']
model: engine-refine
---

In data governance frameworks, the identifier serves as the immutable anchor for every entity, whether that entity is a commercial product, a security control, or a profiling run. Product identifiers such as PRIC-0001 and PRIC-0002 map to concrete items like Apple AirPods Pro and Dyson V15, while security identifiers like SECU-0001 and SECU-0003 tag distinct SOC2 security subclasses spanning domains from Virtual Networks to Database Clusters. Profiling runs carry their own identifiers—PROF-0001 through PROF-0004—each representing a discrete execution event. The identifier is never reused; it is the single point of reference that allows disparate tables to be joined without ambiguity, whether the join is a direct foreign key or a many-to-many relationship mediated by a junction table.

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

Attributes and their types form the backbone of entity description. An attribute—recorded as attr_name in the security subclass metadata—captures a specific property of an entity, such as effective_date, enforcement, mandatory, or priority. Each attribute carries a declared type: xsd:date for temporal values, xsd:string for free-form text, xsd:boolean for binary flags, and xsd:integer for numeric measures. This type discipline is enforced through value tables that are partitioned by type. Boolean values like true and false are stored in a dedicated boolean table, date values such as 2023-08-15 and 2025-05-01 in a date table, and integers like 5, 926, 1, and 849 in an integer table. The entity_id column in each value table points back to the entity being described, while attr_id references the attribute definition, creating a clean separation between schema (what attributes exist and what types they have) and data (what values those attributes hold for each entity).

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

The produces dimension and its associated category provide a classification layer for operational outputs. A profiling fact records which produce it generated via the produces_key column—PROF-0001, PROF-0004, or PROF-0006—linking the execution to a named output. The dimension table resolves these keys into human-readable labels such as Produces Label 01 through Produces Label 04 and assigns each to a category like Produces Category 01 through Produces Category 04. This two-level naming scheme—label for display, category for grouping—enables both operational dashboards and governance reports to aggregate and filter outputs consistently. The misc column in the dimension table holds the label value, while the category column provides the higher-level grouping key.

**dim_produces**

| id | produces_label | produces_category |
| --- | --- | --- |
| PROF-0001 | Produces Label 01 | Produces Category 01 |
| PROF-0002 | Produces Label 02 | Produces Category 02 |
| PROF-0003 | Produces Label 03 | Produces Category 03 |
| PROF-0004 | Produces Label 04 | Produces Category 04 |
| PROF-0005 | Produces Label 05 | Produces Category 05 |
| PROF-0006 | Produces Label 06 | Produces Category 06 |

Execution metrics—duration_seconds, exit_code, and retry_count—quantify the performance and reliability of each profiling run. A single run, identified as PROF-0001, may consume 6716.87 seconds and terminate with exit code 725 after 209 retries, while another run, PROF-0003, completes in 2546.61 seconds with exit code 348 and 303 retries. These metrics are not merely diagnostic; they feed into service-level agreements and compliance audits by providing an auditable trail of how long operations took, whether they succeeded or failed, and how many recovery attempts were required. The exit_code itself is a domain-specific signal—values like 725, 809, 348, and 827 each encode a distinct outcome that downstream systems can interpret without human intervention.

**fact_profiling**

| id | produces_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| PROF-0001 | PROF-0001 | 6716.87 | 725 | 209 |
| PROF-0002 | PROF-0004 | 1113.38 | 809 | 186 |
| PROF-0003 | PROF-0004 | 2546.61 | 348 | 303 |
| PROF-0004 | PROF-0006 | 2074.93 | 827 | 264 |

Relationships between entities are expressed through role-typed associations. In the product-price junction table, a schemaorg_id acts as the subject of the relationship and a price_id as the target, while the role column distinguishes whether the entity is acting as a reviewer or a contributor. For example, PRIC-0001 appears as a subject linked to price PRIC-0001 with the role reviewer, and also linked to price PRIC-0007 with the role contributor. This pattern—subject, target, role—allows a single pair of entities to participate in multiple relationships with different semantics, avoiding the need for separate tables for each relationship type. The same structural principle underlies the attribute-value tables, where entity_id and attr_id together define the relationship between an entity and a particular attribute, and the value column (labeled misc in the schema) holds the actual data.

**t_schemaorg_product_price**

| id | schemaorg |
| --- | --- |
| PRIC-0001 | Apple AirPods Pro |
| PRIC-0002 | Dyson V15 |
| PRIC-0003 | Bose QC Ultra |
| PRIC-0004 | Samsung Galaxy S24 |
| PRIC-0005 | Dyson V15 |
| PRIC-0006 | Apple AirPods Pro |

**t_schemaorg_product_price_price**

| id | price |
| --- | --- |
| PRIC-0001 | 1599 GBP |
| PRIC-0002 | 199.99 CAD |
| PRIC-0003 | $449.95 |
| PRIC-0004 | $349.00 |
| PRIC-0005 | $349.00 |
| PRIC-0006 | $349.00 |
| PRIC-0007 | 1599 GBP |

**t_schemaorg_product_price__price**

| id | schemaorg_id | price_id | role |
| --- | --- | --- | --- |
| PRIC-0001 | PRIC-0001 | PRIC-0001 | reviewer |
| PRIC-0002 | PRIC-0003 | PRIC-0007 | reviewer |
| PRIC-0003 | PRIC-0003 | PRIC-0003 | contributor |
| PRIC-0004 | PRIC-0001 | PRIC-0007 | contributor |
| PRIC-0005 | PRIC-0006 | PRIC-0002 | contributor |
| PRIC-0006 | PRIC-0002 | PRIC-0003 | contributor |
| PRIC-0007 | PRIC-0001 | PRIC-0006 | reviewer |
| PRIC-0008 | PRIC-0004 | PRIC-0006 | owner |