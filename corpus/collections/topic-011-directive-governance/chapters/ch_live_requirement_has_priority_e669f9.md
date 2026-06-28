---
chapter_id: ch_live_requirement_has_priority_e669f9
topic_id: 11
family: 03_directive_governance
cited_terms: ['requirement_has_priority', 'equiv_intersect_basic', 'cardinality_exactly_one_generic']
model: engine-refine
---

Attributes, their types, and the entities they describe constitute the foundational vocabulary of any structured governance framework, where identifiers serve as the stable keys enabling traceability across requirement definitions, attribute schemas, and their concrete instantiations. A requirement such as the Latency threshold or the Backup interval is not merely a textual assertion but a structured entity—PRIO-0001, PRIO-0002, PRIO-0003, PRIO-0004—each carrying a priority designation like INTE-0007 or INTE-0003 that anchors it within a broader taxonomy of compliance obligations. The attribute layer then decomposes each requirement into definable dimensions: effective_date, enforcement, mandatory, and priority itself, each typed according to XML Schema primitives—xsd:date, xsd:string, xsd:boolean, xsd:integer—ensuring that downstream systems can validate, compare, and enforce these attributes without ambiguity. This typed attribute model is what separates a policy document from an enforceable specification, because the schema of an attribute determines not only its semantics but also the operations that may be applied to it.

**t_requirement_has_priority**

| id | requirement | priority |
| --- | --- | --- |
| PRIO-0001 | Latency threshold | INTE-0007 |
| PRIO-0002 | Backup interval | INTE-0003 |
| PRIO-0003 | Throughput minimum | INTE-0006 |
| PRIO-0004 | Audit log frequency | INTE-0006 |
| PRIO-0005 | Throughput minimum | INTE-0002 |
| PRIO-0006 | Encryption standard | INTE-0004 |
| PRIO-0007 | Throughput minimum | INTE-0002 |
| PRIO-0008 | Fault tolerance level | INTE-0005 |

**t_requirement_has_priority_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PRIO-0001 | effective_date | xsd:date |
| PRIO-0002 | enforcement | xsd:string |
| PRIO-0003 | mandatory | xsd:boolean |
| PRIO-0004 | priority | xsd:integer |
| PRIO-0005 | review_cycle_days | xsd:integer |
| PRIO-0006 | scope | xsd:string |
| PRIO-0007 | encoding | xsd:string |
| PRIO-0008 | label_text | xsd:string |

**t_requirement_has_priority_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0003 | false |
| PRIO-0002 | PRIO-0002 | PRIO-0003 | false |
| PRIO-0003 | PRIO-0003 | PRIO-0003 | false |
| PRIO-0004 | PRIO-0004 | PRIO-0003 | false |
| PRIO-0005 | PRIO-0005 | PRIO-0003 | true |
| PRIO-0006 | PRIO-0006 | PRIO-0003 | false |
| PRIO-0007 | PRIO-0007 | PRIO-0003 | false |
| PRIO-0008 | PRIO-0008 | PRIO-0003 | true |

**t_requirement_has_priority_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0001 | 2023-09-07 |
| PRIO-0002 | PRIO-0002 | PRIO-0001 | 2024-08-03 |
| PRIO-0003 | PRIO-0003 | PRIO-0001 | 2024-06-06 |
| PRIO-0004 | PRIO-0004 | PRIO-0001 | 2023-04-21 |
| PRIO-0005 | PRIO-0005 | PRIO-0001 | 2025-04-04 |
| PRIO-0006 | PRIO-0006 | PRIO-0001 | 2024-12-07 |
| PRIO-0007 | PRIO-0007 | PRIO-0001 | 2025-04-01 |
| PRIO-0008 | PRIO-0008 | PRIO-0001 | 2024-09-28 |

**t_requirement_has_priority_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0004 | 3 |
| PRIO-0002 | PRIO-0001 | PRIO-0005 | 56 |
| PRIO-0003 | PRIO-0002 | PRIO-0004 | 2 |
| PRIO-0004 | PRIO-0002 | PRIO-0005 | 806 |
| PRIO-0005 | PRIO-0003 | PRIO-0004 | 5 |
| PRIO-0006 | PRIO-0003 | PRIO-0005 | 944 |
| PRIO-0007 | PRIO-0004 | PRIO-0004 | 4 |
| PRIO-0008 | PRIO-0004 | PRIO-0005 | 343 |

**t_requirement_has_priority_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0007 | Encoding 01 |
| PRIO-0002 | PRIO-0001 | PRIO-0002 | Enforcement 02 |
| PRIO-0003 | PRIO-0001 | PRIO-0008 | intake form |
| PRIO-0004 | PRIO-0001 | PRIO-0009 | ja |
| PRIO-0005 | PRIO-0001 | PRIO-0006 | Scope 05 |
| PRIO-0006 | PRIO-0002 | PRIO-0007 | Encoding 06 |
| PRIO-0007 | PRIO-0002 | PRIO-0002 | Enforcement 07 |
| PRIO-0008 | PRIO-0002 | PRIO-0008 | intake form |

The instantiation of attributes across entities follows a value-type specialization pattern, where boolean, date, integer, and string values are stored in distinct tables to preserve type integrity while maintaining referential coherence through shared entity and attribute identifiers. For the mandatory attribute (PRIO-0003), the boolean value table records a uniform false across all four priority entities, signaling that none of the requirements—Latency threshold, Backup interval, Throughput minimum, Audit log frequency—carry a mandatory flag in their current configuration. By contrast, the effective_date attribute (PRIO-0001) exhibits temporal variation: 2023-09-07, 2024-08-03, 2024-06-06, and 2023-04-21 respectively, reflecting the staggered rollout or revision history of each requirement. Integer-valued attributes such as PRIO-0004 and PRIO-0005 carry values ranging from 2 to 806, with PRIO-0001 holding 3 and 56 across two entity associations, while PRIO-0002 holds 2 and 806, suggesting quantitative thresholds or scoring metrics whose magnitude may correlate with compliance severity. String-valued attributes (PRIO-0007, PRIO-0002, PRIO-0008, PRIO-0009) introduce free-form or enumerated content—Encoding 01, Enforcement 02, intake form, ja—demonstrating how the same attribute infrastructure accommodates both machine-readable codes and human-readable descriptors within a unified entity-attribute-value model.

Beyond the attribute-value layer, equivalence and intersection relationships define how components relate to one another across functional domains, establishing a graph of dependencies that governs system behavior and compliance scope. The equivalence intersection table captures triadic relationships among components such as telemetry-baseline-set, fault-tolerance-layer, policy-compliance-set, delta-sync-channel, core-ingest-pipeline, and validation-snapshot, each paired with contextual qualifiers like throughput-threshold, replication-factor, and validation-matrix. These relationships are not merely descriptive; they encode the structural invariants that determine which components must coexist, which may substitute for one another, and which form the boundary conditions for a given compliance regime. Cardinality constraints further refine this graph by enforcing exactly-one semantics on specific relationships: ExclusiveOwner constraints bind PRIO-0005 to a single owner, while StrictParent constraints enforce hierarchical containment between PRIO-0002 and PRIO-0003, ensuring that the requirement hierarchy remains acyclic and unambiguous.

**t_cardinality_exactly_one_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | ExclusiveOwner | PRIO-0005 |
| GENE-0002 | ExclusiveOwner | PRIO-0005 |
| GENE-0003 | StrictParent | PRIO-0002 |
| GENE-0004 | StrictParent | PRIO-0003 |
| GENE-0005 | ExclusiveOwner | PRIO-0007 |

The practical significance of this architecture lies in its ability to separate concern layers without sacrificing traceability. Identifiers provide the stable keys that link a requirement's definition to its attributes, its attributes to their typed values, and its values to the entities that instantiate them. Attribute types constrain the domain of valid values, enabling automated validation at ingestion time. Entity-attribute-value associations, partitioned by type, allow the system to scale to thousands of attributes without degrading query performance, since each value table can be indexed independently on its entity and attribute keys. Equivalence and cardinality relationships then overlay a semantic graph on top of this structured data, enabling reasoning about compliance scope, component dependencies, and policy intersections. In operational practice, this means that a compliance auditor can trace a single requirement—PRIO-0001, the Latency threshold—through its priority assignment (INTE-0007), its effective date (2023-09-07), its integer-valued thresholds (3 and 56), its string-valued descriptors (Encoding 01), and its position within the equivalence graph (telemetry-baseline-set, throughput-threshold), all without leaving the identifier namespace.

**t_equiv_intersect_basic**

| id | equiv | equiv_2 | equiv_3 |
| --- | --- | --- | --- |
| INTE-0001 | telemetry-baseline-set | fault-tolerance-layer | throughput-threshold |
| INTE-0002 | telemetry-baseline-set | policy-compliance-set | replication-factor |
| INTE-0003 | telemetry-baseline-set | delta-sync-channel | validation-matrix |
| INTE-0004 | core-ingest-pipeline | validation-snapshot | throughput-threshold |
| INTE-0005 | sensor-fusion-node | partition-rebalance | error-rate-baseline |
| INTE-0006 | lineage-tracker | delta-sync-channel | circuit-breaker-state |
| INTE-0007 | query-optimizer-cache | checkpoint-manager | archival-mirror-set |