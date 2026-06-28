---
chapter_id: ch_live_policy_subclass_644304
topic_id: 186
family: 01_foundation
cited_terms: ['policy_subclass', 'allocation_with_input_facets', 'measurement_aggregated_into']
model: engine-refine
---

Policy governance in this framework begins with an identifier that uniquely names each directive—POLI-0001 through POLI-0004—and associates it with a named policy such as the Telemetry Privacy Standard, Provenance Directive, Data Retention Policy, or Metadata Governance, each of which governs a specific domain like Data Lakes, Research Archives, Sensor Networks, or API Gateways. The attributes of these policies are defined separately, allowing the schema to distinguish between what an attribute is called and what kind of data it holds. An attribute named effective_date carries the type xsd:date, enforcement is typed as xsd:string, mandatory uses xsd:boolean, and priority is stored as xsd:integer. This separation of attribute metadata from attribute values enables type-safe storage and validation across a heterogeneous set of policy properties.

**t_policy_subclass**

| id | policy | governs |
| --- | --- | --- |
| POLI-0001 | Telemetry Privacy Standard | Data Lakes |
| POLI-0002 | Provenance Directive | Research Archives |
| POLI-0003 | Data Retention Policy | Sensor Networks |
| POLI-0004 | Metadata Governance | API Gateways |
| POLI-0005 | Telemetry Privacy Standard | Telemetry Streams |
| POLI-0006 | Provenance Directive | Sensor Networks |

**t_policy_subclass_attr**

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

Attribute values are materialized in type-specific tables that link an entity—the policy instance identified by its identifier—to an attribute and a concrete value. Boolean attributes such as mandatory resolve to true or false, as seen when POLI-0002 and POLI-0003 are marked mandatory while POLI-0001 and POLI-0004 are not. Date attributes like effective_date store values such as 2023-01-31, 2024-06-17, 2023-06-01, and 2024-01-12, anchoring each policy to a point in time. Integer attributes capture numeric priorities, with POLI-0001 holding values of 1 and 740 across two distinct attributes, and POLI-0002 carrying 3 and 958. String attributes store free-form text, including entries like Encoding 01, Enforcement 02, nightly summary, and the locale code fr. Together, these value tables form the entity-attribute-value pattern that underpins the policy model, where each row represents a single misc value attached to a specific entity and attribute combination.

**t_policy_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | false |
| POLI-0002 | POLI-0002 | POLI-0003 | true |
| POLI-0003 | POLI-0003 | POLI-0003 | true |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | false |

**t_policy_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2023-01-31 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2024-06-17 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2023-06-01 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2024-01-12 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2024-07-01 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2023-07-28 |

**t_policy_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 1 |
| POLI-0002 | POLI-0001 | POLI-0005 | 740 |
| POLI-0003 | POLI-0002 | POLI-0004 | 3 |
| POLI-0004 | POLI-0002 | POLI-0005 | 958 |
| POLI-0005 | POLI-0003 | POLI-0004 | 5 |
| POLI-0006 | POLI-0003 | POLI-0005 | 462 |
| POLI-0007 | POLI-0004 | POLI-0004 | 5 |
| POLI-0008 | POLI-0004 | POLI-0005 | 496 |

**t_policy_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | nightly summary |
| POLI-0004 | POLI-0001 | POLI-0009 | fr |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | audit excerpt |

Resource allocation follows a parallel structure, where an allocation such as Quota Project Alpha, Cluster Alpha Node, or Model Training Run is linked to one or more input facets—PostgreSQL Snapshot, GraphQL Query Results, Raw JSON Logs—through a junction table that assigns a role to each pairing. The role column captures the nature of the relationship: an allocation may act as owner of an input facet, serve as reviewer, or function as contributor. This subject-to-target relationship, mediated by the role attribute, makes explicit how different allocations interact with different data sources, enabling fine-grained governance over which entities are permitted to consume or produce which inputs.

**t_allocation_with_input_facets**

| id | allocation |
| --- | --- |
| FACE-0001 | Quota Project Alpha |
| FACE-0002 | Cluster Alpha Node |
| FACE-0003 | Model Training Run |
| FACE-0004 | Quota Project Alpha |
| FACE-0005 | Quota Project Alpha |
| FACE-0006 | Quota Project Alpha |
| FACE-0007 | Cluster Alpha Node |
| FACE-0008 | Quota Project Alpha |

**t_allocation_with_input_facets_input_facet**

| id | input_facet |
| --- | --- |
| FACE-0001 | PostgreSQL Snapshot |
| FACE-0002 | GraphQL Query Results |
| FACE-0003 | PostgreSQL Snapshot |
| FACE-0004 | Raw JSON Logs |
| FACE-0005 | GraphQL Query Results |
| FACE-0006 | User Event Stream |
| FACE-0007 | User Event Stream |

**t_allocation_with_input_facets__input_facet**

| id | allocation_id | input_facet_id | role |
| --- | --- | --- | --- |
| FACE-0001 | FACE-0007 | FACE-0005 | owner |
| FACE-0002 | FACE-0005 | FACE-0003 | reviewer |
| FACE-0003 | FACE-0003 | FACE-0002 | contributor |
| FACE-0004 | FACE-0001 | FACE-0007 | reviewer |
| FACE-0005 | FACE-0002 | FACE-0003 | reviewer |
| FACE-0006 | FACE-0001 | FACE-0001 | observer |
| FACE-0007 | FACE-0002 | FACE-0006 | observer |
| FACE-0008 | FACE-0007 | FACE-0006 | observer |

Measurement data introduces the concepts of aggregation, confidence, and uncertainty. Each measurement carries an identifier, a numeric value, and a reference to an aggregated_into dimension that groups related observations. The aggregated_into dimension itself is labeled—for instance, Aggregated Into Label 01 through 04—and classified into a category such as Aggregated Into Category 01 through 04, providing a categorical taxonomy for how measurements roll up into higher-level summaries. Confidence values range from 0.307 to 0.945, quantifying the reliability of each measurement, while uncertainty values span from 120.70 to 364.07, expressing the margin of error or variance associated with the observation. A measurement with a confidence of 0.945 and an uncertainty of 279.24, for example, signals a high-reliability reading within a known error band, whereas a confidence of 0.307 paired with an uncertainty of 364.07 indicates a weak signal with substantial imprecision. This dual metric of confidence and uncertainty allows downstream consumers to weight measurements appropriately when aggregating or comparing results across categories.

**fact_measurement**

| id | aggregated_into_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| INTO-0001 | INTO-0005 | 0.496 | 306.26 | 353.34 |
| INTO-0002 | INTO-0005 | 0.945 | 279.24 | 660.64 |
| INTO-0003 | INTO-0004 | 0.506 | 120.70 | 878.99 |
| INTO-0004 | INTO-0006 | 0.307 | 364.07 | 64.10 |
| INTO-0005 | INTO-0006 | 0.923 | 642.96 | 897.70 |

**dim_aggregated_into**

| id | aggregated_into_label | aggregated_into_category |
| --- | --- | --- |
| INTO-0001 | Aggregated Into Label 01 | Aggregated Into Category 01 |
| INTO-0002 | Aggregated Into Label 02 | Aggregated Into Category 02 |
| INTO-0003 | Aggregated Into Label 03 | Aggregated Into Category 03 |
| INTO-0004 | Aggregated Into Label 04 | Aggregated Into Category 04 |
| INTO-0005 | Aggregated Into Label 05 | Aggregated Into Category 05 |
| INTO-0006 | Aggregated Into Label 06 | Aggregated Into Category 06 |