---
chapter_id: ch_live_classification_subclass_67d4a3
topic_id: 105
family: 03_directive_governance
cited_terms: ['classification_subclass', 'ebpfmap_equiv_kv_typed', 'patient_insurance_record']
model: engine-refine
---

The governance of heterogeneous data assets demands a disciplined separation between entity definitions, attribute specifications, and the relationships that bind them—three layers that together enforce traceability, accountability, and operational clarity across disparate domains. At the foundation, classification taxonomies such as the OWASP Risk Rating, GDPR Data Category, and CIS Benchmark are each assigned a unique identifier (CLAS-0001 through CLAS-0004), an exit code (493, 301, 581, 197), and a lifecycle status (failed, pending, complete), establishing a controlled vocabulary against which all downstream data elements are measured. These classifications do not merely label; they encode regulatory posture and risk tolerance, and their status values signal whether a given classification has been validated, remains under review, or has been rejected—information that downstream consumers rely upon when determining the applicability of a classification to a particular data asset.

**t_classification_subclass**

| id | classification | exit_code | status |
| --- | --- | --- | --- |
| CLAS-0001 | OWASP Risk Rating | 493 | failed |
| CLAS-0002 | GDPR Data Category | 301 | pending |
| CLAS-0003 | GDPR Data Category | 581 | complete |
| CLAS-0004 | CIS Benchmark | 197 | complete |
| CLAS-0005 | OWASP Risk Rating | 912 | complete |

The eBPF map equivalence framework illustrates how this taxonomy extends into systems-level metadata. Each map type—interface_stats, rate_limit, socket_stats—is registered under a stable identifier (TYPE-0001 through TYPE-0004) and paired with a key type (bpf_cookie, uint32_t, dev_index) and a value type map (dev_entry, task_struct, flow_key, perf_event). The relationships between map types and their key and value type specifications are not implicit; they are mediated through explicit junction tables that assign a role—contributor, owner, reviewer—to each association. For instance, the mapping between ebpfmap TYPE-0002 and key_type TYPE-0002 carries the role owner, while the association of ebpfmap TYPE-0007 with key_type TYPE-0001 designates contributor, making it possible to audit not only what types are associated but who is responsible for each linkage. This role-based mediation transforms what could be an opaque graph of type dependencies into an accountable, auditable structure.

**t_ebpfmap_equiv_kv_typed**

| id | ebpfmap |
| --- | --- |
| TYPE-0001 | interface_stats |
| TYPE-0002 | rate_limit |
| TYPE-0003 | rate_limit |
| TYPE-0004 | socket_stats |
| TYPE-0005 | interface_stats |
| TYPE-0006 | interface_stats |
| TYPE-0007 | rate_limit |
| TYPE-0008 | rate_limit |

**t_ebpfmap_equiv_kv_typed_key_type**

| id | key_type |
| --- | --- |
| TYPE-0001 | bpf_cookie |
| TYPE-0002 | uint32_t |
| TYPE-0003 | uint32_t |
| TYPE-0004 | dev_index |
| TYPE-0005 | pid_t |
| TYPE-0006 | inode_key |

**t_ebpfmap_equiv_kv_typed__key_type**

| id | ebpfmap_id | key_type_id | role |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0007 | TYPE-0001 | contributor |
| TYPE-0002 | TYPE-0002 | TYPE-0002 | owner |
| TYPE-0003 | TYPE-0005 | TYPE-0002 | owner |
| TYPE-0004 | TYPE-0005 | TYPE-0004 | reviewer |
| TYPE-0005 | TYPE-0004 | TYPE-0005 | reviewer |
| TYPE-0006 | TYPE-0002 | TYPE-0003 | owner |
| TYPE-0007 | TYPE-0006 | TYPE-0006 | owner |
| TYPE-0008 | TYPE-0004 | TYPE-0003 | owner |

**t_ebpfmap_equiv_kv_typed_value_type_map**

| id | value_type_map |
| --- | --- |
| TYPE-0001 | dev_entry |
| TYPE-0002 | task_struct |
| TYPE-0003 | flow_key |
| TYPE-0004 | perf_event |
| TYPE-0005 | stack_trace |
| TYPE-0006 | perf_event |
| TYPE-0007 | stack_trace |

**t_ebpfmap_equiv_kv_typed__value_type_map**

| id | ebpfmap_id | value_type_map_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| TYPE-0001 | TYPE-0005 | TYPE-0002 | contributor | Cardinality Note 01 |
| TYPE-0002 | TYPE-0002 | TYPE-0006 | contributor | Cardinality Note 02 |
| TYPE-0003 | TYPE-0003 | TYPE-0003 | observer | Cardinality Note 03 |
| TYPE-0004 | TYPE-0006 | TYPE-0001 | owner | Cardinality Note 04 |
| TYPE-0005 | TYPE-0007 | TYPE-0005 | owner | Cardinality Note 05 |
| TYPE-0006 | TYPE-0002 | TYPE-0002 | reviewer | Cardinality Note 06 |
| TYPE-0007 | TYPE-0005 | TYPE-0004 | observer | Cardinality Note 07 |
| TYPE-0008 | TYPE-0007 | TYPE-0001 | reviewer | Cardinality Note 08 |

The value-type associations are further qualified by cardinality notes—Cardinality Note 01 through Cardinality Note 04—attached to each ebpfmap-to-value_type_map relationship. These notes do not merely describe multiplicity in the abstract; they serve as operational constraints that govern how many value type instances may be bound to a given map type, and by extension, how the kernel's eBPF subsystem may allocate and manage memory for those maps. The cardinality note is not a column in the entity table itself but a property of the relationship, which is the correct design: cardinality is a characteristic of the association, not of the map or the value type in isolation. The role field on the same junction table—contributor, observer, owner—adds a second dimension of governance, distinguishing between entities that define the mapping, those that merely reference it, and those that own its lifecycle.

A parallel structure governs patient insurance records, where the same three-layer pattern—entity, attribute, relationship—reappears under a different domain. Insurance records such as ENROLL-7742, POL-8821-AX, SSN-4821, and DOB-19850312 are registered under identifiers RECO-0001 through RECO-0004, while data elements like coverage_start_date, provider_npi, deductible_limit, and premium_amount are cataloged separately. The association between a patient insurance record and its constituent data elements is mediated through a junction table that assigns roles—contributor, owner, observer—to each linkage. Notably, the subject of a relationship (patient_id) and its target (contains_data_element_id) are not always drawn from the same record's own identifier; RECO-0005 appears as a patient_id even though it is not present in the primary record table, indicating that the junction table captures relationships that extend beyond the immediate entity set and that referential integrity is enforced at the relationship layer rather than at the entity definition layer.

**t_patient_insurance_record**

| id | patient_insurance_record |
| --- | --- |
| RECO-0001 | ENROLL-7742 |
| RECO-0002 | POL-8821-AX |
| RECO-0003 | SSN-4821 |
| RECO-0004 | DOB-19850312 |
| RECO-0005 | MRN-4829103 |
| RECO-0006 | SSN-4821 |
| RECO-0007 | POL-8821-AX |
| RECO-0008 | ENROLL-7742 |

**t_patient_insurance_record_contains_data_element**

| id | contains_data_element |
| --- | --- |
| RECO-0001 | coverage_start_date |
| RECO-0002 | provider_npi |
| RECO-0003 | deductible_limit |
| RECO-0004 | premium_amount |
| RECO-0005 | copay_rate |
| RECO-0006 | coverage_start_date |

**t_patient_insurance_record__contains_data_element**

| id | patient_id | contains_data_element_id | role |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0005 | RECO-0003 | contributor |
| RECO-0002 | RECO-0003 | RECO-0006 | contributor |
| RECO-0003 | RECO-0008 | RECO-0006 | owner |
| RECO-0004 | RECO-0007 | RECO-0002 | observer |
| RECO-0005 | RECO-0001 | RECO-0002 | owner |
| RECO-0006 | RECO-0005 | RECO-0002 | observer |
| RECO-0007 | RECO-0003 | RECO-0002 | contributor |
| RECO-0008 | RECO-0008 | RECO-0001 | owner |

The convergence of these two domains—systems-level eBPF map metadata and healthcare insurance records—under a common relational pattern is not coincidental. Both employ the same tripartite architecture: a primary entity table that assigns stable identifiers and domain-specific attributes, a secondary attribute table that catalogs the components or classifications applicable to those entities, and a junction table that encodes the relationships between them with role and, where applicable, cardinality constraints. The exit codes in the classification table (493, 301, 581, 197) and the cardinality notes in the eBPF value-type junction (Cardinality Note 01 through 04) serve the same function as the role assignments in the patient insurance junction table: they make explicit the governance semantics that would otherwise be implicit in the data model. This explicitness is what enables automated compliance checking, audit trail generation, and policy enforcement across domains that, on the surface, share nothing in common.