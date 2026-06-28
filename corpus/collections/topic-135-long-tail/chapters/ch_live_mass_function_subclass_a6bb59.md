---
chapter_id: ch_live_mass_function_subclass_a6bb59
topic_id: 135
family: 06_belief_structure
cited_terms: ['mass_function_subclass', 'subclass_to_independent_continuant', 'alert_governed_by_runbook']
model: engine-refine
---

Operational governance and evidence modeling rely upon a disciplined architecture of identifiers, entities, attributes, and typed relationships that collectively decouple semantic metadata from rigid schema constraints. At the foundation, an identifier serves as a stable, globally unique anchor—such as FUNC-0001 or CONT-0001—that binds a discrete entity to the broader knowledge graph. Entities represent concrete operational continuants, ranging from physical infrastructure like Firewall Appliance 7 and Server Rack 14A to logical constructs such as Audit Log Stream 5 and alert thresholds including Data Pipeline Stalled and TLS Certificate Expiry. By isolating the identifier from the entity’s descriptive properties, the framework permits heterogeneous assets to share a unified modeling layer without enforcing monolithic columnar structures. This separation is critical for scalability, as it allows new entity classes to be introduced through relational extensions rather than schema migrations.

**t_subclass_to_independent_continuant**

| id | independent |
| --- | --- |
| CONT-0001 | Audit Log Stream 5 |
| CONT-0002 | Audit Log Stream 5 |
| CONT-0003 | Firewall Appliance 7 |
| CONT-0004 | Server Rack 14A |
| CONT-0005 | Sensor Node 7B |
| CONT-0006 | Server Rack 14A |

**t_subclass_to_independent_continuant_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONT-0001 | location | xsd:string |
| CONT-0002 | name | xsd:string |
| CONT-0003 | owner | cco:Person |
| CONT-0004 | tags | xsd:string |

**t_subclass_to_independent_continuant_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0001 | on-prem-dc1 |
| CONT-0002 | CONT-0001 | CONT-0002 | Name 02 |
| CONT-0003 | CONT-0001 | CONT-0003 | sre |
| CONT-0004 | CONT-0001 | CONT-0004 | Tags 04 |
| CONT-0005 | CONT-0002 | CONT-0001 | us-east-1 |
| CONT-0006 | CONT-0002 | CONT-0002 | Name 06 |
| CONT-0007 | CONT-0002 | CONT-0003 | sre |
| CONT-0008 | CONT-0002 | CONT-0004 | Tags 08 |

**t_alert_governed_by_runbook_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RUNB-0001 | effective_date | xsd:date |
| RUNB-0002 | enforcement | xsd:string |
| RUNB-0003 | mandatory | xsd:boolean |
| RUNB-0004 | priority | xsd:integer |
| RUNB-0005 | review_cycle_days | xsd:integer |
| RUNB-0006 | scope | xsd:string |
| RUNB-0007 | encoding | xsd:string |
| RUNB-0008 | label_text | xsd:string |

**t_alert_governed_by_runbook_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0004 | 3 |
| RUNB-0002 | RUNB-0001 | RUNB-0005 | 802 |
| RUNB-0003 | RUNB-0002 | RUNB-0004 | 2 |
| RUNB-0004 | RUNB-0002 | RUNB-0005 | 702 |
| RUNB-0005 | RUNB-0003 | RUNB-0004 | 5 |
| RUNB-0006 | RUNB-0003 | RUNB-0005 | 87 |
| RUNB-0007 | RUNB-0004 | RUNB-0004 | 1 |
| RUNB-0008 | RUNB-0004 | RUNB-0005 | 47 |

**t_alert_governed_by_runbook_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0007 | Encoding 01 |
| RUNB-0002 | RUNB-0001 | RUNB-0002 | Enforcement 02 |
| RUNB-0003 | RUNB-0001 | RUNB-0008 | pre-release note |
| RUNB-0004 | RUNB-0001 | RUNB-0009 | en |
| RUNB-0005 | RUNB-0001 | RUNB-0006 | Scope 05 |
| RUNB-0006 | RUNB-0002 | RUNB-0007 | Encoding 06 |
| RUNB-0007 | RUNB-0002 | RUNB-0002 | Enforcement 07 |
| RUNB-0008 | RUNB-0002 | RUNB-0008 | change rationale |

The descriptive capacity of each entity is realized through an attribute-value paradigm, wherein an attr captures a specific property—location, name, owner, or tags—while an attr type enforces semantic integrity by declaring the expected data domain. Values, stored as misc, are routed to type-specific storage containers that preserve their intrinsic format: xsd:string for textual descriptors like on-prem-dc1 or Tags 04, cco:Person for organizational assignments such as sre, xsd:date for temporal boundaries like 2023-06-14, xsd:boolean for policy flags, and xsd:integer for quantitative thresholds. Foreign keys explicitly bind an entity_id to an attr_id, which in turn references the misc value, creating a normalized triad that supports arbitrary attribute cardinality. This design ensures that operational metadata remains both queryable and type-safe, while accommodating the inherent variability of infrastructure telemetry and compliance documentation.

Relational accountability and evidence propagation are modeled through directed associations between mass functions and frames of discernment, structured around subject, target, and role parameters. The subject column (mass_id) and target column (over_frame_of_discernment_id) function as foreign keys that establish a directed graph of analytical dependencies, linking confidence measures such as fault_detection_assignment or signal_quality_mass to evaluation domains like resource_utilization_buckets or protocol_compliance_status. The role attribute qualifies the nature of this linkage, assigning functional responsibilities such as reviewer, contributor, or owner to each directed edge. For instance, a mass function identified as FUNC-0006 may serve as the subject in a reviewer relationship targeting FUNC-0002, while FUNC-0004 operates as the owner of a target mapped to FUNC-0005. This tripartite relationship structure transforms abstract confidence metrics into auditable, role-bound workflows, enabling traceability across analytical layers.

**t_mass_function_subclass**

| id | mass |
| --- | --- |
| FUNC-0001 | fault_detection_assignment |
| FUNC-0002 | signal_quality_mass |
| FUNC-0003 | network_topology_confidence |
| FUNC-0004 | network_topology_confidence |
| FUNC-0005 | signal_quality_mass |
| FUNC-0006 | network_topology_confidence |
| FUNC-0007 | signal_quality_mass |

**t_mass_function_subclass_over_frame_of_discernment**

| id | over_frame_of_discernment |
| --- | --- |
| FUNC-0001 | resource_utilization_buckets |
| FUNC-0002 | signal_strength_levels |
| FUNC-0003 | signal_strength_levels |
| FUNC-0004 | protocol_compliance_status |
| FUNC-0005 | incident_severity_levels |
| FUNC-0006 | protocol_compliance_status |

**t_mass_function_subclass__over_frame_of_discernment**

| id | mass_id | over_frame_of_discernment_id | role |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0006 | FUNC-0002 | reviewer |
| FUNC-0002 | FUNC-0007 | FUNC-0001 | reviewer |
| FUNC-0003 | FUNC-0007 | FUNC-0001 | contributor |
| FUNC-0004 | FUNC-0004 | FUNC-0005 | owner |
| FUNC-0005 | FUNC-0003 | FUNC-0005 | owner |
| FUNC-0006 | FUNC-0003 | FUNC-0002 | reviewer |
| FUNC-0007 | FUNC-0005 | FUNC-0001 | observer |
| FUNC-0008 | FUNC-0006 | FUNC-0001 | contributor |

In practice, these structural primitives converge to govern operational response and regulatory compliance. Alert runbooks—such as those governing API Gateway Timeout or CPU Utilization Critical—are parameterized through the same attribute-value and foreign-key mechanisms, attaching effective_date, enforcement, mandatory, and priority constraints to discrete operational triggers. Boolean flags determine policy strictness, date fields establish temporal validity windows like 2025-03-21, and integer values encode escalation thresholds or numeric priorities. By unifying infrastructure inventory, analytical confidence mapping, and policy enforcement under a single relational ontology, the framework ensures that every identifier, attribute, and role-bound relationship remains consistently verifiable. This architectural coherence is essential for maintaining auditability, reducing schema drift, and enabling automated compliance validation across dynamic, multi-tiered technology environments.

**t_alert_governed_by_runbook**

| id | alert |
| --- | --- |
| RUNB-0001 | Data Pipeline Stalled |
| RUNB-0002 | API Gateway Timeout |
| RUNB-0003 | CPU Utilization Critical |
| RUNB-0004 | TLS Certificate Expiry |
| RUNB-0005 | Disk Space Warning |
| RUNB-0006 | Memory Leak Detected |

**t_alert_governed_by_runbook_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0003 | false |
| RUNB-0002 | RUNB-0002 | RUNB-0003 | false |
| RUNB-0003 | RUNB-0003 | RUNB-0003 | true |
| RUNB-0004 | RUNB-0004 | RUNB-0003 | true |
| RUNB-0005 | RUNB-0005 | RUNB-0003 | true |
| RUNB-0006 | RUNB-0006 | RUNB-0003 | true |

**t_alert_governed_by_runbook_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0001 | 2023-06-14 |
| RUNB-0002 | RUNB-0002 | RUNB-0001 | 2023-01-20 |
| RUNB-0003 | RUNB-0003 | RUNB-0001 | 2025-03-21 |
| RUNB-0004 | RUNB-0004 | RUNB-0001 | 2025-02-03 |
| RUNB-0005 | RUNB-0005 | RUNB-0001 | 2023-12-24 |
| RUNB-0006 | RUNB-0006 | RUNB-0001 | 2024-09-30 |