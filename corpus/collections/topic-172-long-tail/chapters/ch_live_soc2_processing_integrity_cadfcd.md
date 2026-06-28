---
chapter_id: ch_live_soc2_processing_integrity_cadfcd
topic_id: 172
family: 07_long_tail
cited_terms: ['soc2_processing_integrity', 'host_connection_process', 'audit_basic']
model: engine-refine
---

In governed information systems, durable identity is the precondition for every other control. An identifier is not merely a surrogate key in storage; it is the stable handle by which auditors, integrators, and policy engines refer to the same real-world object across time, systems, and revisions. When Quantum Retail Group and Nexus Cloud Services are both tied to processing-integrity obligations, each obligation carries its own identifier so that scope statements—user provisioning versus customer onboarding—can be attached, compared, and revoked without conflating distinct controls. The same principle holds whether the governed object is a SOC 2 processing-integrity assertion or a host-connection process such as Zea mays B73: once identity is fixed, downstream evidence, relationships, and attribute values can be joined with defensible provenance.

**t_soc2_processing_integrity**

| id | soc |
| --- | --- |
| INTE-0001 | Quantum Retail Group |
| INTE-0002 | GlobalPay Systems |
| INTE-0003 | Pinnacle SaaS Platform |
| INTE-0004 | Nexus Cloud Services |
| INTE-0005 | Vertex Analytics Ltd |
| INTE-0006 | Quantum Retail Group |

**t_soc2_processing_integrity_for_s_o_c2_domain**

| id | for_s_o_c2_domain |
| --- | --- |
| INTE-0001 | user provisioning |
| INTE-0002 | customer onboarding |
| INTE-0003 | report generation |
| INTE-0004 | customer onboarding |
| INTE-0005 | inventory management |
| INTE-0006 | supply chain tracking |

**t_host_connection_process**

| id | host_connection_process |
| --- | --- |
| PROC-0001 | Zea mays B73 |
| PROC-0002 | Helianthus annuus |
| PROC-0003 | Hordeum vulgare |
| PROC-0004 | Quercus robur |
| PROC-0005 | Helianthus annuus |
| PROC-0006 | Populus trichocarpa |
| PROC-0007 | Gossypium hirsutum |

**t_audit_basic**

| id | audit |
| --- | --- |
| AUDI-0001 | Telemetry Integrity Check |
| AUDI-0002 | Logging Compliance Review |
| AUDI-0003 | Logging Compliance Review |
| AUDI-0004 | Model Drift Validation |
| AUDI-0005 | Model Drift Validation |
| AUDI-0006 | Pipeline Latency Review |

Entities are the things that identifiers name: organizations under audit, biological hosts, or operational artifacts such as a Telemetry Integrity Check or a Logging Compliance Review. An entity exists in the model because it must be described, related, and evaluated as a unit. Entities rarely stand alone; they participate in directed associations in which one side acts as subject and the other as target, with role qualifying how the participation should be interpreted for governance purposes. GlobalPay Systems may appear as subject linked to customer onboarding as target with reviewer authority, while the same onboarding domain can reappear under a different subject with a different role—illustrating why subject and target are relational positions, not intrinsic types. In the host-connection domain, a single host identifier can recur across multiple process linkages while parasitic participants—Haustorium or cortical cells—assume observer, owner, or reviewer roles depending on the biological interaction being documented.

**t_soc2_processing_integrity__for_s_o_c2_domain**

| id | soc_id | for_s_o_c2_domain_id | role |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0006 | INTE-0005 | owner |
| INTE-0002 | INTE-0003 | INTE-0006 | reviewer |
| INTE-0003 | INTE-0004 | INTE-0005 | observer |
| INTE-0004 | INTE-0006 | INTE-0003 | reviewer |
| INTE-0005 | INTE-0002 | INTE-0003 | owner |
| INTE-0006 | INTE-0003 | INTE-0002 | reviewer |
| INTE-0007 | INTE-0005 | INTE-0004 | contributor |
| INTE-0008 | INTE-0004 | INTE-0003 | observer |

**t_host_connection_process_has_participant**

| id | has_participant |
| --- | --- |
| PROC-0001 | Haustorium |
| PROC-0002 | Cortical cells |
| PROC-0003 | Haustorium |
| PROC-0004 | Cortical cells |
| PROC-0005 | Parasite root tip |
| PROC-0006 | Sieve tube element |
| PROC-0007 | Vascular cambium |
| PROC-0008 | Root xylem |

**t_host_connection_process__has_participant**

| id | host_id | has_participant_id | role |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0007 | PROC-0003 | observer |
| PROC-0002 | PROC-0007 | PROC-0007 | observer |
| PROC-0003 | PROC-0007 | PROC-0004 | owner |
| PROC-0004 | PROC-0007 | PROC-0003 | reviewer |
| PROC-0005 | PROC-0005 | PROC-0005 | contributor |
| PROC-0006 | PROC-0001 | PROC-0008 | contributor |
| PROC-0007 | PROC-0003 | PROC-0002 | contributor |
| PROC-0008 | PROC-0004 | PROC-0004 | owner |

Role is the semantic modifier that prevents naive graph traversal from misreading accountability. Owner, reviewer, and observer are not decorative labels; they encode who may assert truth, who must validate it, and who may witness without decision rights. When report generation is tied to Pinnacle SaaS Platform under observer role while another linkage assigns reviewer to the same class of process, compliance workflows can route attestations and exceptions correctly. Parallel structure appears where Haustorium participates as owner in one host-connection context and as observer in another, showing that role is always evaluated on the edge between subject and target, not on the entity in isolation.

Attributes describe measurable or reportable facets of entities under explicit type discipline. An attr is the named dimension—duration_seconds, end_time, exit_code, host_name—while attr_type declares the interpretive contract: xsd:decimal for durations, xsd:dateTime for instants, xsd:integer for discrete codes, xsd:string for symbolic labels. Separating attribute definition from attribute value is a processing-integrity practice in its own right: it prevents a datetime from being stored where a decimal is expected and allows schema evolution without rewriting historical facts. Typed value stores then hold the misc—the concrete payload—bound back to both entity and attr, so that 2391.38 seconds, exit code 765, end_time 2024-05-14T01:27:39, and host_name node-a01 are all unambiguous readings of the same audit entity rather than orphaned literals.

**t_audit_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0002 | 2024-05-14T01:27:39 |
| AUDI-0002 | AUDI-0001 | AUDI-0008 | 2024-03-24T17:57:06 |
| AUDI-0003 | AUDI-0001 | AUDI-0009 | 2023-07-30T11:39:04 |
| AUDI-0004 | AUDI-0002 | AUDI-0002 | 2024-03-11T10:39:38 |
| AUDI-0005 | AUDI-0002 | AUDI-0008 | 2025-01-11T17:40:44 |
| AUDI-0006 | AUDI-0002 | AUDI-0009 | 2024-09-25T22:35:18 |
| AUDI-0007 | AUDI-0003 | AUDI-0002 | 2025-04-27T05:17:32 |
| AUDI-0008 | AUDI-0003 | AUDI-0008 | 2023-12-11T03:24:19 |

**t_audit_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0001 | 2391.38 |
| AUDI-0002 | AUDI-0002 | AUDI-0001 | 1955.36 |
| AUDI-0003 | AUDI-0003 | AUDI-0001 | 919.71 |
| AUDI-0004 | AUDI-0004 | AUDI-0001 | 338.61 |
| AUDI-0005 | AUDI-0005 | AUDI-0001 | 1120.15 |
| AUDI-0006 | AUDI-0006 | AUDI-0001 | 6419.06 |

Hostconnectionprocess and parasiticplant name domain-specific entity classes whose relationships must be captured with the same subject–target–role machinery used elsewhere. A host-connection process identifies how a host organism engages its environment—Hordeum vulgare or Quercus robur—while parasiticplant denotes the participating structure or agent involved in that connection, such as a haustorium penetrating tissue or cortical cells at the interface. Recording has_participant associations with explicit roles allows comparative analysis across hosts and parasites without collapsing distinct biological mechanisms into a single undifferentiated link. The modeling choice mirrors compliance practice: neither “customer onboarding” nor “haustorium” is meaningful governance data until it is anchored to identifiable subjects, linked to identifiable targets, and qualified by role.

Operationally, these constructs converge into an evidence chain suitable for attestation. Identifiers stabilize references; entities supply the objects of control; subject–target–role triples express scoped responsibility; attrs and attr_types enforce interpretable measurements; misc carries the observed values that auditors reconcile against policy. A reviewer examining Logging Compliance Review can trace exit_code 123 and end_time 2024-03-11T10:39:38 to the same entity that owns duration_seconds 1955.36, while a separate integrity review can verify that Nexus Cloud Services’ reviewer relationship to customer onboarding matches the organization’s stated SOC 2 boundary. Dense, cross-linked representation is what allows processing integrity to be demonstrated not as narrative assertion but as typed, relational, and identically reproducible fact.

**t_audit_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUDI-0001 | duration_seconds | xsd:decimal |
| AUDI-0002 | end_time | xsd:dateTime |
| AUDI-0003 | exit_code | xsd:integer |
| AUDI-0004 | host_name | xsd:string |
| AUDI-0005 | log_level | xsd:string |
| AUDI-0006 | phase | xsd:string |
| AUDI-0007 | retry_count | xsd:integer |
| AUDI-0008 | scheduled_at | xsd:dateTime |

**t_audit_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0003 | 765 |
| AUDI-0002 | AUDI-0001 | AUDI-0007 | 217 |
| AUDI-0003 | AUDI-0002 | AUDI-0003 | 123 |
| AUDI-0004 | AUDI-0002 | AUDI-0007 | 33 |
| AUDI-0005 | AUDI-0003 | AUDI-0003 | 601 |
| AUDI-0006 | AUDI-0003 | AUDI-0007 | 361 |
| AUDI-0007 | AUDI-0004 | AUDI-0003 | 79 |
| AUDI-0008 | AUDI-0004 | AUDI-0007 | 456 |

**t_audit_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0004 | node-a01 |
| AUDI-0002 | AUDI-0001 | AUDI-0005 | Log Level 02 |
| AUDI-0003 | AUDI-0001 | AUDI-0006 | initiation |
| AUDI-0004 | AUDI-0001 | AUDI-0010 | pending |
| AUDI-0005 | AUDI-0001 | AUDI-0011 | Triggered By 05 |
| AUDI-0006 | AUDI-0002 | AUDI-0004 | ingest-21 |
| AUDI-0007 | AUDI-0002 | AUDI-0005 | Log Level 07 |
| AUDI-0008 | AUDI-0002 | AUDI-0006 | closeout |