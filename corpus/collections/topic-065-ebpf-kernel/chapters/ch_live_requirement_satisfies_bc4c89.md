---
chapter_id: ch_live_requirement_satisfies_bc4c89
topic_id: 65
family: 03_directive_governance
cited_terms: ['requirement_satisfies', 'ebpf_event_for_syscall', 'schemaorg_org_legalname']
model: engine-refine
---

Identifiers serve as the primary anchoring mechanism across the relational schema, providing stable, human-readable keys that bind heterogeneous data into a coherent reference framework. In the requirement-satisfaction mapping, identifiers such as SATI-0001 through SATI-0004 uniquely tag each linkage between a compliance requirement and its satisfying legal entity, while the eBPF event-to-syscall relationship uses SYSC-0001 through SYSC-0004 to correlate observability events with system calls. Legal entity references follow the same convention, with LEGA-0001 through LEGA-0004 identifying organizations like NexusLabs, BioSynth, GlobalDataInc, and AeroSpaceX, and their corresponding legal names—TerraForma Holdings Ltd., CloudNative Solutions LLC, Global Data Systems LLC, and Acme Corporation—each carrying their own identifier in the legal_name table. This uniform identification strategy ensures that cross-table joins remain unambiguous and that every data point can be traced to its authoritative source.

**t_ebpf_event_for_syscall**

| id | ebpf | for_syscall |
| --- | --- | --- |
| SYSC-0001 | node-exporter | LEGA-0002 |
| SYSC-0002 | node-exporter | LEGA-0002 |
| SYSC-0003 | systemd | LEGA-0001 |
| SYSC-0004 | promtail | LEGA-0003 |
| SYSC-0005 | sshd | LEGA-0002 |
| SYSC-0006 | nginx | LEGA-0004 |

**t_ebpf_event_for_syscall_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SYSC-0001 | duration_seconds | xsd:decimal |
| SYSC-0002 | end_time | xsd:dateTime |
| SYSC-0003 | exit_code | xsd:integer |
| SYSC-0004 | host_name | xsd:string |
| SYSC-0005 | log_level | xsd:string |
| SYSC-0006 | phase | xsd:string |
| SYSC-0007 | retry_count | xsd:integer |
| SYSC-0008 | scheduled_at | xsd:dateTime |

**t_ebpf_event_for_syscall_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0002 | 2025-06-18T16:09:11 |
| SYSC-0002 | SYSC-0001 | SYSC-0008 | 2023-11-08T17:00:45 |
| SYSC-0003 | SYSC-0001 | SYSC-0009 | 2025-04-25T11:16:48 |
| SYSC-0004 | SYSC-0002 | SYSC-0002 | 2024-10-09T21:27:52 |
| SYSC-0005 | SYSC-0002 | SYSC-0008 | 2024-01-10T15:25:08 |
| SYSC-0006 | SYSC-0002 | SYSC-0009 | 2024-10-06T14:16:05 |
| SYSC-0007 | SYSC-0003 | SYSC-0002 | 2023-05-30T09:11:09 |
| SYSC-0008 | SYSC-0003 | SYSC-0008 | 2023-01-31T01:26:46 |

**t_ebpf_event_for_syscall_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0001 | 5668.45 |
| SYSC-0002 | SYSC-0002 | SYSC-0001 | 1373.81 |
| SYSC-0003 | SYSC-0003 | SYSC-0001 | 293.20 |
| SYSC-0004 | SYSC-0004 | SYSC-0001 | 2278.72 |
| SYSC-0005 | SYSC-0005 | SYSC-0001 | 1782.39 |
| SYSC-0006 | SYSC-0006 | SYSC-0001 | 358.71 |

**t_ebpf_event_for_syscall_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0003 | 7 |
| SYSC-0002 | SYSC-0001 | SYSC-0007 | 420 |
| SYSC-0003 | SYSC-0002 | SYSC-0003 | 186 |
| SYSC-0004 | SYSC-0002 | SYSC-0007 | 281 |
| SYSC-0005 | SYSC-0003 | SYSC-0003 | 156 |
| SYSC-0006 | SYSC-0003 | SYSC-0007 | 35 |
| SYSC-0007 | SYSC-0004 | SYSC-0003 | 875 |
| SYSC-0008 | SYSC-0004 | SYSC-0007 | 95 |

**t_ebpf_event_for_syscall_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0004 | node-a01 |
| SYSC-0002 | SYSC-0001 | SYSC-0005 | Log Level 02 |
| SYSC-0003 | SYSC-0001 | SYSC-0006 | closeout |
| SYSC-0004 | SYSC-0001 | SYSC-0010 | failed |
| SYSC-0005 | SYSC-0001 | SYSC-0011 | Triggered By 05 |
| SYSC-0006 | SYSC-0002 | SYSC-0004 | worker-07 |
| SYSC-0007 | SYSC-0002 | SYSC-0005 | Log Level 07 |
| SYSC-0008 | SYSC-0002 | SYSC-0006 | review |

**t_schemaorg_org_legalname**

| id | schemaorg |
| --- | --- |
| LEGA-0001 | NexusLabs |
| LEGA-0002 | BioSynth |
| LEGA-0003 | GlobalDataInc |
| LEGA-0004 | AeroSpaceX |
| LEGA-0005 | QuantumEdge |
| LEGA-0006 | AcmeCorp |
| LEGA-0007 | GlobalDataInc |

**t_schemaorg_org_legalname_legal_name**

| id | legal_name |
| --- | --- |
| LEGA-0001 | TerraForma Holdings Ltd. |
| LEGA-0002 | CloudNative Solutions LLC |
| LEGA-0003 | Global Data Systems LLC |
| LEGA-0004 | Acme Corporation |
| LEGA-0005 | CloudNative Solutions LLC |
| LEGA-0006 | DataBridge Analytics Corp. |
| LEGA-0007 | TerraForma Holdings Ltd. |
| LEGA-0008 | Nexus Laboratories Inc. |

Attributes and their types form the descriptive backbone of the schema, specifying what properties are measured and in what format. The attribute definition table declares names such as duration_seconds, end_time, exit_code, and host_name, each paired with an XSD type—xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string respectively—that governs how values are stored and validated. This separation of attribute metadata from actual values enables a flexible, type-dispatched storage pattern: decimal measurements like 5668.45, 1373.81, 293.20, and 2278.72 reside in the decimal value table; timestamped observations such as 2025-06-18T16:09:11, 2023-11-08T17:00:45, and 2025-04-25T11:16:48 occupy the datetime table; integer readings including 7, 420, 186, and 281 are stored in the integer table; and free-form strings like node-a01, Log Level 02, closeout, and failed populate the varchar table. The type discipline enforced at the attribute level prevents cross-contamination of value domains and supports efficient query routing.

Entities function as the conceptual subjects to which attribute values are affixed, creating a property-value graph that can be queried by entity identity. Each entity identifier—SYSC-0001, for instance—serves as a foreign key into all four value tables, allowing a single entity to carry a heterogeneous set of attributes simultaneously: its duration_seconds value of 5668.45, its end_time of 2025-06-18T16:09:11, its exit_code of 7, and its host_name of node-a01. This entity-centric model mirrors the EAV (entity-attribute-value) pattern while gaining structural rigor from the explicit attribute type declarations and the separation of value tables by XSD type, a design choice that balances normalization with query performance in a schema where attribute sets vary widely across entities.

Priority and scope introduce governance dimensions that govern the ordering and applicability of requirement-satisfaction relationships. Priority values range from 1 to 5, with the Encryption Standard AES-256 and the ISO 27001 Annex A requirement both carrying the maximum priority of 5, while the Data Retention Policy sits at priority 2, establishing a clear hierarchy for compliance remediation efforts. Scope constrains the organizational boundary within which a satisfaction relationship holds—team-level mappings cover the Audit Trail Mandate, Data Retention Policy, and Encryption Standard AES-256, whereas the ISO 27001 Annex A requirement operates at the regional scope, indicating a broader jurisdictional reach. These two dimensions together enable auditors to filter, rank, and attribute compliance obligations to the correct organizational tier.

**t_requirement_satisfies**

| id | requirement | satisfies | priority | scope |
| --- | --- | --- | --- | --- |
| SATI-0001 | Audit Trail Mandate | LEGA-0001 | 5 | team |
| SATI-0002 | Data Retention Policy | LEGA-0006 | 2 | team |
| SATI-0003 | Encryption Standard AES-256 | LEGA-0001 | 1 | regional |
| SATI-0004 | ISO 27001 Annex A | LEGA-0005 | 5 | team |
| SATI-0005 | Protocol TLS 1.3 | LEGA-0001 | 2 | team |
| SATI-0006 | Data Retention Policy | LEGA-0006 | 1 | local |

Role, subject, and target complete the relationship layer by describing how entities connect to one another with semantic intent. The schemaorg-to-legal-name linkage table uses subject and target columns to designate the source and destination of each relationship—LEGA-0002 links to LEGA-0007, LEGA-0004 links to both LEGA-0005 and LEGA-0008—while the role column assigns a functional characterization to each connection, such as reviewer, observer, or contributor. This tripartite structure (subject–role–target) transforms simple foreign-key joins into semantically rich assertions, enabling the schema to express not merely that two entities are related, but the nature of that relationship. In practice, this means that the legal name Acme Corporation (LEGA-0004) can simultaneously serve as a reviewer of TerraForma Holdings Ltd. (LEGA-0005) and a contributor to another entity (LEGA-0008), with each role carrying distinct governance implications.

**t_schemaorg_org_legalname__legal_name**

| id | schemaorg_id | legal_name_id | role |
| --- | --- | --- | --- |
| LEGA-0001 | LEGA-0002 | LEGA-0005 | reviewer |
| LEGA-0002 | LEGA-0004 | LEGA-0007 | observer |
| LEGA-0003 | LEGA-0004 | LEGA-0004 | reviewer |
| LEGA-0004 | LEGA-0006 | LEGA-0008 | contributor |
| LEGA-0005 | LEGA-0003 | LEGA-0001 | reviewer |
| LEGA-0006 | LEGA-0007 | LEGA-0007 | reviewer |
| LEGA-0007 | LEGA-0005 | LEGA-0006 | owner |
| LEGA-0008 | LEGA-0003 | LEGA-0001 | contributor |