---
chapter_id: ch_live_frame_refinement_f87af3
topic_id: 140
family: 07_long_tail
cited_terms: ['frame_refinement', 'mass_function_subclass', 'nist80053_moderate_impact']
model: engine-refine
---

In formal knowledge representation and data governance, the subject-role-target triple constitutes the fundamental unit of relational meaning, where an identifier anchors a proposition, a role specifies the nature of the relationship, and subject and target designate the entities being related. This pattern recurs across disparate domains — from regulatory compliance frameworks to signal processing taxonomies — because it decouples the topology of relationships from the semantics of the entities themselves. An identifier such as REFI-0001 or FUNC-0003 serves not merely as a primary key but as a stable reference point for a relationship instance that can be queried, audited, and versioned independently of either endpoint. The role column, populated with values like observer, owner, contributor, or reviewer, encodes the directional semantics of the link: it answers not simply that two entities are connected, but how they are connected, and by what authority or capacity.

Consider the refinement hierarchy governing system frames. A frame labeled Regulatory Audit Trail, identified as REFI-0001, refines the frame Ground Station Uplink, establishing a parent-child specialization relationship. The same frame, when re-examined through the lens of the relationship table t_frame_refinement__refines_frame, reveals that REFI-0001 does not directly refine REFI-0004; rather, the relationship instance REFI-0001 connects frame_id REFI-0005 to refines_frame_id REFI-0004 with the role of observer. This indirection — the separation of the relationship's own identifier from the identifiers of its subject and target — permits a single frame to participate in multiple relationships simultaneously, each with its own role assignment. Frame REFI-0002, for instance, appears as both a subject and a target across different relationship instances, functioning as owner in one context and as a refined entity in another, demonstrating that roles are not intrinsic properties of entities but attributes of the connections between them.

**t_frame_refinement**

| id | frame |
| --- | --- |
| REFI-0001 | Regulatory Audit Trail |
| REFI-0002 | Lab Sample Container Type |
| REFI-0003 | Data Lake Partition Schema |
| REFI-0004 | Regulatory Audit Trail |
| REFI-0005 | Data Lake Partition Schema |
| REFI-0006 | ISO 9001 Quality Framework |

**t_frame_refinement_refines_frame**

| id | refines_frame |
| --- | --- |
| REFI-0001 | Ground Station Uplink |
| REFI-0002 | Sterile Container Variant |
| REFI-0003 | IPv4 Header Format |
| REFI-0004 | Ku Band Downlink |
| REFI-0005 | Sterile Container Variant |
| REFI-0006 | Ground Station Uplink |

**t_frame_refinement__refines_frame**

| id | frame_id | refines_frame_id | role |
| --- | --- | --- | --- |
| REFI-0001 | REFI-0005 | REFI-0004 | observer |
| REFI-0002 | REFI-0006 | REFI-0005 | owner |
| REFI-0003 | REFI-0003 | REFI-0006 | contributor |
| REFI-0004 | REFI-0002 | REFI-0005 | reviewer |
| REFI-0005 | REFI-0003 | REFI-0006 | contributor |
| REFI-0006 | REFI-0004 | REFI-0004 | owner |
| REFI-0007 | REFI-0005 | REFI-0003 | owner |
| REFI-0008 | REFI-0002 | REFI-0006 | contributor |

The mass function subclass domain illustrates the same structural discipline applied to uncertainty quantification. A mass function identified as FUNC-0001, carrying the semantic label fault_detection_assignment, operates over the frame of discernment resource_utilization_buckets. Yet the relationship table t_mass_function_subclass__over_frame_of_discernment does not pair FUNC-0001 with FUNC-0002 directly; instead, the relationship instance FUNC-0001 links mass_id FUNC-0006 to over_frame_of_discernment_id FUNC-0002 with the role of reviewer. The mass function signal_quality_mass (FUNC-0002) and the mass function network_topology_confidence (FUNC-0003, FUNC-0004) each traverse their own relationship instances, with roles shifting from reviewer to contributor to owner depending on the specific subject-target pairing. This role multiplicity ensures that the same mass function can be simultaneously a reviewer of one frame of discernment and a contributor to another, without contradiction, because the role is bound to the relationship instance, not to the mass function entity.

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

The NIST 800-53 moderate impact classification follows an identical architectural pattern, mapping regulatory standards to impact levels through role-annotated relationships. The standard SP 800-53, recorded under identifiers IMPA-0001 and IMPA-0002, associates with impact designations including Moderate Threshold, System Security Moderate, and Impact Level Moderate. The relationship table t_nist80053_moderate_impact__at_n_i_s_t_impact_level reveals that IMPA-0002 serves as the subject in two distinct relationship instances: IMPA-0001 links IMPA-0002 to IMPA-0007 as an observer, while IMPA-0002 links IMPA-0002 to IMPA-0004, also as an observer. Meanwhile, IMPA-0006 connects to IMPA-0001 as a contributor, and IMPA-0007 connects to IMPA-0007 as an owner. The standard SP 800-171 (IMPA-0003) and SP 800-218 (IMPA-0004) participate in their own relationship instances, each with role assignments that reflect their compliance posture — contributor for the former, owner for the latter.

**t_nist80053_moderate_impact**

| id | nist |
| --- | --- |
| IMPA-0001 | SP 800-53 |
| IMPA-0002 | SP 800-53 |
| IMPA-0003 | SP 800-171 |
| IMPA-0004 | SP 800-218 |
| IMPA-0005 | NIST AI RMF |
| IMPA-0006 | SP 800-171 |
| IMPA-0007 | SP 800-37 |

**t_nist80053_moderate_impact_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level |
| --- | --- |
| IMPA-0001 | Moderate Threshold |
| IMPA-0002 | System Security Moderate |
| IMPA-0003 | Impact Level Moderate |
| IMPA-0004 | Moderate Baseline |
| IMPA-0005 | Moderate Threshold |
| IMPA-0006 | Moderate |
| IMPA-0007 | Availability Moderate |

**t_nist80053_moderate_impact__at_n_i_s_t_impact_level**

| id | nist_id | at_n_i_s_t_impact_level_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0002 | IMPA-0007 | observer |
| IMPA-0002 | IMPA-0002 | IMPA-0004 | observer |
| IMPA-0003 | IMPA-0006 | IMPA-0001 | contributor |
| IMPA-0004 | IMPA-0007 | IMPA-0007 | owner |
| IMPA-0005 | IMPA-0003 | IMPA-0002 | owner |
| IMPA-0006 | IMPA-0004 | IMPA-0005 | observer |
| IMPA-0007 | IMPA-0001 | IMPA-0006 | contributor |
| IMPA-0008 | IMPA-0003 | IMPA-0007 | owner |

Across all three domains, the invariant structure is deliberate and consequential. The identifier column on every relationship table provides a stable, queryable key for the relationship instance itself, enabling operations such as role-based access control, relationship-level auditing, and temporal versioning of connections without touching the entity tables. The subject and target columns are foreign keys that reference the primary keys of the entity tables, establishing referential integrity while keeping the relationship topology orthogonal to entity attributes. The role column — consistently populated with the same four values across all three domains — functions as a typed edge label, transforming what would otherwise be an undifferentiated graph into a semantically rich knowledge structure. This design permits the same entity to hold different roles in different relationships, to appear as both subject and target across the relationship graph, and to participate in multiple relationships simultaneously, each with its own role annotation. The result is a data model that scales in expressiveness without sacrificing queryability or referential integrity.