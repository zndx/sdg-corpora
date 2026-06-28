---
chapter_id: ch_live_ebpfprogram_verified_safe_90896f
topic_id: 4
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_verified_safe', 'schema_revision_of', 'claim_not_disconfirmed']
model: engine-refine
---

An identifier serves as the immutable anchor of any data element, a stable key that survives the transience of values and the evolution of relationships. In the verification of eBPF programs, identifiers such as SAFE-0001 through SAFE-0004 designate individual programs—lsm_file_open, sock_ops_connect, perf_event_trace, tc_police_ingress—each of which must be traced to its verification methodology. Similarly, schema revisions carry identifiers like REVI-0001 through REVI-0004, anchoring records that describe network_flow_record, product_inventory_catalog, and clinical_trial_protocol schemas. Assertions that have not been disconfirmed receive identifiers of the form DISC-0001 through DISC-0004, under which claims such as redundancy failover successful, secondary sensor aligned, firmware version outdated, and thermal monitoring active are catalogued alongside their secondary assertions—data pipeline stalled, latency under SLA bounds, threshold limits expanded. The identifier is the invariant; everything else is contingent upon it.

**t_schema_revision_of**

| id | schema |
| --- | --- |
| REVI-0001 | network_flow_record |
| REVI-0002 | product_inventory_catalog |
| REVI-0003 | network_flow_record |
| REVI-0004 | clinical_trial_protocol |
| REVI-0005 | financial_ledger_format |
| REVI-0006 | network_flow_record |
| REVI-0007 | api_gateway_routing |
| REVI-0008 | compliance_audit_log |

**t_schema_revision_of_schema_revision_of**

| id | schema_revision_of |
| --- | --- |
| REVI-0001 | legacy_compliance_log |
| REVI-0002 | legacy_compliance_log |
| REVI-0003 | legacy_compliance_log |
| REVI-0004 | legacy_network_record |
| REVI-0005 | legacy_api_gateway |
| REVI-0006 | legacy_api_gateway |

**t_claim_not_disconfirmed**

| id | claim | claim_2 |
| --- | --- | --- |
| DISC-0001 | redundancy failover successful | data pipeline stalled |
| DISC-0002 | secondary sensor aligned | latency under SLA bounds |
| DISC-0003 | firmware version outdated | threshold limits expanded |
| DISC-0004 | thermal monitoring active | secondary sensor aligned |
| DISC-0005 | firmware version outdated | network latency spike unexplained |
| DISC-0006 | temperature sensor offline | redundancy failover successful |
| DISC-0007 | latency under SLA bounds | network latency spike unexplained |

**t_claim_not_disconfirmed_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DISC-0001 | confidence | xsd:decimal |
| DISC-0002 | dimension_kind | xsd:string |
| DISC-0003 | method | xsd:string |
| DISC-0004 | recorded_at | xsd:dateTime |
| DISC-0005 | uncertainty | xsd:decimal |
| DISC-0006 | unit | xsd:string |
| DISC-0007 | value | xsd:decimal |
| DISC-0008 | encoding | xsd:string |

Attributes and their types impose a schema on the otherwise amorphous space of entity properties, distinguishing what can be measured from how it is measured. The attribute registry defines names such as confidence, dimension_kind, method, and recorded_at, each bound to a precise type: xsd:decimal for numerical precision, xsd:string for categorical labels, xsd:dateTime for temporal markers. This type discipline is not decorative—it governs which value store an attribute's data flows into. A confidence score of 0.145 or 0.678 lands in the decimal value table; a dimension_kind of Dimension Kind 01 or an encoding designation of Encoding 02 resides in the varchar store; a recorded_at timestamp of 2023-08-09T14:45:08 or 2024-07-11T23:49:48 is persisted in the datetime table. The attr type is the routing mechanism, the structural constraint that prevents a decimal from being compared against a string and ensures that temporal queries operate on properly formatted dates.

An entity is the unit of observation, the thing to which attributes attach and across which values are distributed. Entity DISC-0001, for instance, carries a confidence of 0.145, a dimension_kind of Dimension Kind 01, an encoding of Encoding 02, an intake form label, and a Japanese-language value of ja—all distinct attributes of the same entity, each resolved through its own attr_id into the appropriate typed value table. The entity_id column is the join key that collapses this distributed representation back into a coherent record. Without the entity as the unifying reference, the attribute-value pairs would be unmoored, a collection of facts with no subject to which they belong.

Subject and target, paired with role, constitute the relational fabric that connects entities into a graph of dependencies and responsibilities. In the verification of eBPF programs, the relationship table links an ebpfprogram_id (the subject) to a verified_safe_by_id (the target) through a role—contributor, reviewer, or owner. SAFE-0004, for example, appears as the subject in relationships where it is verified by SAFE-0002 and SAFE-0004, with roles of contributor and reviewer respectively; SAFE-0003 and SAFE-0002 each carry the role of owner in their respective linkages. The same pattern governs schema revisions: REVI-0001 serves as the subject in three distinct relationships, connecting to REVI-0006 as reviewer, to REVI-0001 as contributor, and to REVI-0003 as reviewer, while REVI-0007 assumes the role of owner against REVI-0003. The role column is the semantic glue—it specifies not merely that two entities are related, but how they are related.

**t_ebpfprogram_verified_safe**

| id | ebpfprogram |
| --- | --- |
| SAFE-0001 | lsm_file_open |
| SAFE-0002 | sock_ops_connect |
| SAFE-0003 | perf_event_trace |
| SAFE-0004 | tc_police_ingress |
| SAFE-0005 | xdp_router |
| SAFE-0006 | cgroup_skb_ingress |

**t_ebpfprogram_verified_safe_verified_safe_by**

| id | verified_safe_by |
| --- | --- |
| SAFE-0001 | libbpf |
| SAFE-0002 | Kani_bpf |
| SAFE-0003 | Z3_solver |
| SAFE-0004 | Kani_bpf |
| SAFE-0005 | veristat |
| SAFE-0006 | FramaC_bpf |

**t_ebpfprogram_verified_safe__verified_safe_by**

| id | ebpfprogram_id | verified_safe_by_id | role |
| --- | --- | --- | --- |
| SAFE-0001 | SAFE-0004 | SAFE-0002 | contributor |
| SAFE-0002 | SAFE-0004 | SAFE-0004 | reviewer |
| SAFE-0003 | SAFE-0003 | SAFE-0005 | owner |
| SAFE-0004 | SAFE-0002 | SAFE-0003 | owner |
| SAFE-0005 | SAFE-0001 | SAFE-0003 | contributor |
| SAFE-0006 | SAFE-0003 | SAFE-0006 | contributor |
| SAFE-0007 | SAFE-0001 | SAFE-0005 | owner |
| SAFE-0008 | SAFE-0001 | SAFE-0002 | owner |

**t_schema_revision_of__schema_revision_of**

| id | schema_id | schema_revision_of_id | role |
| --- | --- | --- | --- |
| REVI-0001 | REVI-0001 | REVI-0006 | reviewer |
| REVI-0002 | REVI-0001 | REVI-0001 | contributor |
| REVI-0003 | REVI-0001 | REVI-0003 | reviewer |
| REVI-0004 | REVI-0007 | REVI-0003 | owner |
| REVI-0005 | REVI-0006 | REVI-0001 | contributor |
| REVI-0006 | REVI-0005 | REVI-0001 | observer |
| REVI-0007 | REVI-0006 | REVI-0004 | owner |
| REVI-0008 | REVI-0007 | REVI-0004 | reviewer |

The misc column captures the terminal values of this architecture, the actual data that flows through the attr-type-entity-role pipeline. Whether it is the decimal 669.01 or 65.74 attached to entity DISC-0001, the string intake form or ja bound to the same entity, or the timestamp 2023-07-27T10:01:23 associated with entity DISC-0003, misc is the leaf node of the query path. It is where the structural discipline of identifiers, attributes, types, entities, subjects, targets, and roles converges into a retrievable datum. The architecture exists to make these values findable, comparable, and auditable—each one traceable back through its entity to its attribute, through its attribute to its type, and through its relationships to the subjects and targets that give it context.

**t_claim_not_disconfirmed_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DISC-0001 | DISC-0001 | DISC-0004 | 2023-08-09T14:45:08 |
| DISC-0002 | DISC-0002 | DISC-0004 | 2023-07-14T01:11:42 |
| DISC-0003 | DISC-0003 | DISC-0004 | 2023-07-27T10:01:23 |
| DISC-0004 | DISC-0004 | DISC-0004 | 2024-07-11T23:49:48 |
| DISC-0005 | DISC-0005 | DISC-0004 | 2024-06-18T23:43:54 |
| DISC-0006 | DISC-0006 | DISC-0004 | 2023-11-25T07:03:11 |
| DISC-0007 | DISC-0007 | DISC-0004 | 2025-06-11T19:52:01 |

**t_claim_not_disconfirmed_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DISC-0001 | DISC-0001 | DISC-0001 | 0.145 |
| DISC-0002 | DISC-0001 | DISC-0005 | 669.01 |
| DISC-0003 | DISC-0001 | DISC-0007 | 65.74 |
| DISC-0004 | DISC-0002 | DISC-0001 | 0.678 |
| DISC-0005 | DISC-0002 | DISC-0005 | 525.06 |
| DISC-0006 | DISC-0002 | DISC-0007 | 361.13 |
| DISC-0007 | DISC-0003 | DISC-0001 | 0.813 |
| DISC-0008 | DISC-0003 | DISC-0005 | 578.57 |

**t_claim_not_disconfirmed_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DISC-0001 | DISC-0001 | DISC-0002 | Dimension Kind 01 |
| DISC-0002 | DISC-0001 | DISC-0008 | Encoding 02 |
| DISC-0003 | DISC-0001 | DISC-0009 | intake form |
| DISC-0004 | DISC-0001 | DISC-0010 | ja |
| DISC-0005 | DISC-0001 | DISC-0003 | hybrid |
| DISC-0006 | DISC-0001 | DISC-0006 | mg/L |
| DISC-0007 | DISC-0002 | DISC-0002 | Dimension Kind 07 |
| DISC-0008 | DISC-0002 | DISC-0008 | Encoding 08 |