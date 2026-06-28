---
chapter_id: ch_live_requirement_verified_by_b269cb
topic_id: 180
family: 03_directive_governance
cited_terms: ['requirement_verified_by', 'responsive_optic_nerve_dysfunction', 'ringbuf_map_subclass']
model: engine-refine
---

Identifiers function as the immutable addressing mechanism across heterogeneous registries, anchoring discrete records to deterministic keys that survive schema evolution and cross-domain migration. Within clinical condition taxonomies, these keys index structured diagnostic axes such as optic nerve dysfunction and leber optic atrophy, which operate not as free-text descriptors but as controlled vocabulary nodes. A focal response classification, for instance, maps to specific etiological markers including MT-ND6 strain and secondary atrophy, while leber optic atrophy entries resolve to hereditary degeneration, nutritional deficit, bilateral atrophy, or focal atrophy. Each identifier—whether designated DYSF-0001 through DYSF-0004 or its operational counterpart—carries an implicit lineage, ensuring that downstream routing, regulatory reporting, and telemetry correlation reference a single source of truth.

**t_requirement_verified_by**

| id | requirement |
| --- | --- |
| VERI-0001 | Data retention policy |
| VERI-0002 | Compliance baseline |
| VERI-0003 | Data retention policy |
| VERI-0004 | Data retention policy |
| VERI-0005 | Audit logging mandate |
| VERI-0006 | Provenance tracking spec |

**t_requirement_verified_by_verified_by**

| id | verified_by |
| --- | --- |
| VERI-0001 | Automated scanner |
| VERI-0002 | Lab director |
| VERI-0003 | Internal audit team |
| VERI-0004 | System validator |
| VERI-0005 | Automated scanner |
| VERI-0006 | Automated scanner |

**t_responsive_optic_nerve_dysfunction**

| id | responsive | optic_nerve_dysfunction | leber_optic_atrophy |
| --- | --- | --- | --- |
| DYSF-0001 | Focal Response | MT-ND6 Strain | Hereditary Degeneration |
| DYSF-0002 | Focal Response | Secondary Atrophy | Nutritional Deficit |
| DYSF-0003 | Diffuse Response | Nutritional Deficit | Bilateral Atrophy |
| DYSF-0004 | Focal Response | Hereditary Degeneration | Focal Atrophy |
| DYSF-0005 | Bilateral Response | Primary Atrophy | Papilledema |
| DYSF-0006 | Left Optic Response | Hereditary Degeneration | MT-ND6 Strain |
| DYSF-0007 | Left Optic Response | Compressive Lesion | Ischemic Optic Neuropathy |

**t_ringbuf_map_subclass**

| id | ringbuf |
| --- | --- |
| MAP-0001 | metrics capture ring |
| MAP-0002 | diagnostic trace buffer |
| MAP-0003 | audit log ring |
| MAP-0004 | sensor stream buffer |
| MAP-0005 | diagnostic trace buffer |
| MAP-0006 | event queue ring |
| MAP-0007 | telemetry fifo ring |

The linkage between discrete entities is governed by explicit subject-target mappings, which establish directional provenance and enforce dependency boundaries. In compliance registries, a subject requirement such as a data retention policy or compliance baseline is bound to a target verification mechanism, creating an auditable chain of custody for regulatory attestation. Similarly, in operational telemetry architectures, a subject ring buffer—whether configured as a metrics capture ring, diagnostic trace buffer, audit log ring, or sensor stream buffer—is bound to a target configuration profile encompassing sync mode specifications, compression profiles, or buffer depth parameters. The subject-target construct eliminates circular dependencies by fixing the origin and destination of every assignment, thereby enabling deterministic traversal during incident response or policy enforcement.

**t_ringbuf_map_subclass_ring_buffer_config**

| id | ring_buffer_config |
| --- | --- |
| MAP-0001 | sync mode spec |
| MAP-0002 | sync mode spec |
| MAP-0003 | compression profile |
| MAP-0004 | buffer depth spec |
| MAP-0005 | compression profile |
| MAP-0006 | sample rate config |
| MAP-0007 | overflow handling spec |
| MAP-0008 | compression profile |

**t_ringbuf_map_subclass__ring_buffer_config**

| id | ringbuf_id | ring_buffer_config_id | role |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0006 | observer |
| MAP-0002 | MAP-0003 | MAP-0004 | reviewer |
| MAP-0003 | MAP-0005 | MAP-0004 | contributor |
| MAP-0004 | MAP-0001 | MAP-0007 | owner |
| MAP-0005 | MAP-0002 | MAP-0006 | contributor |
| MAP-0006 | MAP-0006 | MAP-0003 | contributor |
| MAP-0007 | MAP-0005 | MAP-0002 | owner |
| MAP-0008 | MAP-0002 | MAP-0003 | owner |

Assignment within these mappings is mediated by role designations that crystallize functional authority and workflow state. Roles such as owner, observer, reviewer, and contributor are not administrative labels but operational constraints that dictate approval thresholds, access boundaries, and audit visibility. When a target verifier like an automated scanner, lab director, internal audit team, or system validator is attached to a compliance requirement, the role column specifies whether the entity retains full ownership, maintains passive observation, or exercises conditional review. This triad of subject, target, and role forms the structural backbone of zero-trust governance models, ensuring that separation of duties is enforced at the data linkage level rather than deferred to external policy engines.

**t_requirement_verified_by__verified_by**

| id | requirement_id | verified_by_id | role |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0006 | VERI-0006 | owner |
| VERI-0002 | VERI-0002 | VERI-0003 | observer |
| VERI-0003 | VERI-0004 | VERI-0006 | reviewer |
| VERI-0004 | VERI-0003 | VERI-0005 | observer |
| VERI-0005 | VERI-0004 | VERI-0001 | owner |
| VERI-0006 | VERI-0004 | VERI-0002 | owner |
| VERI-0007 | VERI-0001 | VERI-0002 | reviewer |
| VERI-0008 | VERI-0004 | VERI-0001 | observer |

In practice, this relational architecture operates as a unified control plane across clinical, compliance, and infrastructure domains. Identifiers like VERI-0001 or MAP-0003 serve as persistent anchors, while the subject-target-role matrix ensures that every linkage carries explicit accountability and versioned provenance. High-assurance environments leverage this structure to eliminate ambiguity in cross-functional workflows, where a diagnostic trace buffer bound to a sync mode specification follows the same governance logic as a hereditary degeneration classification bound to a compliance baseline. By encoding authority, dependency, and classification into a single deterministic framework, organizations achieve continuous auditability, enforceable separation of duties, and resilient traceability from raw telemetry or clinical observation through to final regulatory attestation.