---
chapter_id: ch_live_lineage_governed_by_directive_77eb50
topic_id: 129
family: 05_provo_lineage
cited_terms: ['lineage_governed_by_directive', 'policy_with_review_cycle', 'soc2_security_subclass']
model: engine-refine
---

Governance frameworks require a structured mechanism for associating attributes with entities, where each attribute carries a defined type and each entity is identified by a stable identifier. The attribute registry establishes the schema of permissible properties—effective_date as an xsd:date, enforcement as an xsd:string, mandatory as an xsd:boolean, and priority as an xsd:integer—thereby constraining the domain of values that any entity may express. This type discipline ensures that downstream consumers of governance metadata can interpret attribute values without ambiguity, whether they are evaluating whether a security control is mandatory (true or false) or assessing the priority level assigned to a particular requirement (values such as 5 or 926). The entity itself serves as the anchor point: a security subclass such as SOC2-CloudInfra, SOC3-Public, SOC2-Fintech, or SOC2-IdentityProvider is the subject to which these typed attributes attach, and each entity is referenced by a unique identifier like SECU-0001 or SECU-0002.

**t_soc2_security_subclass**

| id | soc | for_s_o_c2_domain |
| --- | --- | --- |
| SECU-0001 | SOC2-CloudInfra | CYCL-0003 |
| SECU-0002 | SOC3-Public | CYCL-0004 |
| SECU-0003 | SOC2-Fintech | CYCL-0008 |
| SECU-0004 | SOC2-IdentityProvider | CYCL-0005 |
| SECU-0005 | SOC2-SaaS | CYCL-0002 |
| SECU-0006 | SOC2-TypeII | CYCL-0002 |
| SECU-0007 | SOC2-SaaS | CYCL-0001 |

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

The value storage layer implements a type-partitioned design, routing attribute values into separate tables according to their declared type. Boolean attributes resolve to true or false entries in the value table for booleans; date attributes such as effective_date carry concrete dates like 2023-08-15, 2024-04-12, 2024-01-26, and 2025-05-01 in the date table; integer attributes capture numeric priorities such as 5, 926, 1, and 849; and string attributes hold free-form values including Encoding 01, Enforcement 02, audit excerpt, and de. This partitioning is not merely an implementation detail—it enforces type safety at the storage level and allows each value table to be optimized for its specific data shape. The entity_id column in each value table ties the stored value back to the owning entity, while the attr_id column resolves to the attribute definition, creating a clear path from raw data to semantic meaning.

Scope and language provide the contextual dimensions that determine where and in what linguistic register a governance artifact applies. The scope attribute distinguishes between local, team, and regional applicability, signaling whether a policy such as FedRAMP, NIST SP 800-53, CCPA, or SOC 2 Type II governs a single deployment, a development team, or a broader regional jurisdiction. Language codes—ja, de, en, fr—indicate the human language in which the governing document or its associated metadata is rendered, ensuring that multilingual organizations can maintain parallel versions of the same governance artifact without conflating them. These contextual attributes are not attached to individual security subclass values but rather to the policy and review cycle layer, where they govern the interpretation and enforcement boundaries of the entire artifact.

Unit of measure operates at the lineage layer, where data provenance and system telemetry are tracked. Directives such as DIRE-0001 through DIRE-0004 govern specific data lineages—the Model Training Registry, Patient Cohort Dataset, and Sensor Telemetry Stream—and each lineage is associated with a unit of measure: milliseconds (ms) for timing-sensitive registries, meters per second (m/s) for telemetry streams, and count for aggregated dataset metrics. This unit annotation ensures that downstream consumers of lineage metadata can correctly interpret the magnitude and semantics of the tracked quantities, preventing misalignment between data producers and data consumers who may operate in different measurement conventions.

**t_lineage_governed_by_directive**

| id | lineage | unit | language |
| --- | --- | --- | --- |
| DIRE-0001 | Model Training Registry | ms | ja |
| DIRE-0002 | Patient Cohort Dataset | m/s | de |
| DIRE-0003 | Sensor Telemetry Stream | count | en |
| DIRE-0004 | Patient Cohort Dataset | m/s | en |
| DIRE-0005 | API Request Trace | ratio | es |
| DIRE-0006 | Laboratory Batch Records | nm | de |
| DIRE-0007 | Patient Cohort Dataset | kg | en |
| DIRE-0008 | Inventory Sync Job | nm | ja |

The foreign-key architecture binds these layers into a coherent governance graph. Security subclasses reference review cycles through the for_s_o_c2_domain column, linking SOC2-CloudInfra to CYCL-0003 and SOC3-Public to CYCL-0004, thereby connecting the attribute-value layer to the policy review cadence. Review cycles, in turn, are associated with policies and scoped by jurisdiction and language, creating a chain from the most granular attribute value up through the policy and directive layers. The identifier columns—DIRE- prefixed for directives, CYCL- prefixed for review cycles, and SECU- prefixed for security subclasses—serve as the join keys that traverse this chain, enabling queries that resolve from a specific attribute value such as mandatory = true on entity SECU-0003 back to the governing policy, its review cycle, and the applicable scope and language.

**t_policy_with_review_cycle**

| id | policy | review_cycle | scope | language |
| --- | --- | --- | --- | --- |
| CYCL-0001 | FedRAMP | SECU-0006 | local | ja |
| CYCL-0002 | NIST SP 800-53 | SECU-0001 | team | ja |
| CYCL-0003 | CCPA | SECU-0004 | regional | fr |
| CYCL-0004 | SOC 2 Type II | SECU-0002 | regional | ja |
| CYCL-0005 | GDPR | SECU-0002 | global | ja |
| CYCL-0006 | FedRAMP | SECU-0007 | global | fr |
| CYCL-0007 | SOC 2 Type II | SECU-0001 | global | ja |
| CYCL-0008 | CCPA | SECU-0006 | local | ja |