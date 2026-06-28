---
chapter_id: ch_live_requirement_equiv_specifies_target_6e5ea5
topic_id: 11
family: 03_directive_governance
cited_terms: ['requirement_equiv_specifies_target', 'schemaorg_label_alignment', 'ebpf_event_for_syscall']
model: engine-refine
---

In governed data environments, every auditable assertion must be anchored to a stable **entity** and an unambiguous **identifier** so that obligations, alignments, and runtime observations can be correlated across time, systems, and review cycles without collapsing distinct records into a single narrative. Identifiers such as TARG-0001 through TARG-0004 designate requirement-equivalence targets whose semantics persist even when the descriptive labels attached to them—LatencyThreshold, DataLineageTrace, AuditLogFormat—are reused or reclassified; the same principle holds for alignment records ALIG-0001–ALIG-0004 and syscall-observation entities SYSC-0001–SYSC-0004, each of which remains addressable as an independent evidentiary object regardless of how many attributes or outbound links accumulate around it. Entity identity is therefore not merely a storage convenience but the contractual spine of traceability: when a confidence score of 0.916 is attributed to ALIG-0001, or when duration_seconds of 5668.45 is recorded against SYSC-0001, auditors can return to the same entity instance rather than inferring equivalence from coincident text.

**t_schemaorg_label_alignment**

| id | schemaorg | aligned_to_schema_org_label |
| --- | --- | --- |
| ALIG-0001 | sku_code | SYSC-0006 |
| ALIG-0002 | org_id | SYSC-0005 |
| ALIG-0003 | data_asset_name | SYSC-0006 |
| ALIG-0004 | data_asset_name | SYSC-0002 |
| ALIG-0005 | sku_code | SYSC-0003 |
| ALIG-0006 | work_title | SYSC-0004 |
| ALIG-0007 | subject_person | SYSC-0003 |
| ALIG-0008 | course_title | SYSC-0004 |

**t_schemaorg_label_alignment_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ALIG-0001 | confidence | xsd:decimal |
| ALIG-0002 | dimension_kind | xsd:string |
| ALIG-0003 | method | xsd:string |
| ALIG-0004 | recorded_at | xsd:dateTime |
| ALIG-0005 | uncertainty | xsd:decimal |
| ALIG-0006 | unit | xsd:string |
| ALIG-0007 | value | xsd:decimal |
| ALIG-0008 | encoding | xsd:string |

**Attr** and **attr type** constitute the typed vocabulary through which entities acquire machine-checkable meaning. An attribute names what is being said—confidence, dimension_kind, method, recorded_at in label-alignment governance, or duration_seconds, end_time, exit_code, host_name in eBPF syscall instrumentation—while attr type declares the interpretive contract under which values must be parsed, compared, and validated. Declaring xsd:decimal for confidence constrains subsequent assertions to numeric comparability; binding recorded_at to xsd:dateTime permits temporal ordering of alignment events such as 2024-11-29T12:22:57 on ALIG-0001 and 2024-04-08T02:25:07 on ALIG-0004; assigning xsd:integer to exit_code ensures that syscall outcomes like 7, 420, 186, and 281 are not coerced into free text. Separating attribute definition from attribute value is what allows a single entity to carry heterogeneous facts—ALIG-0001 simultaneously holds a decimal confidence, a varchar dimension_kind (“Dimension Kind 01”), and a datetime stamp—without forcing a single wide record shape that would obscure type discipline and complicate schema evolution.

**t_ebpf_event_for_syscall**

| id | ebpf | for_syscall |
| --- | --- | --- |
| SYSC-0001 | node-exporter | ALIG-0005 |
| SYSC-0002 | node-exporter | ALIG-0005 |
| SYSC-0003 | systemd | ALIG-0007 |
| SYSC-0004 | promtail | ALIG-0003 |
| SYSC-0005 | sshd | ALIG-0003 |
| SYSC-0006 | nginx | ALIG-0001 |

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

The **misc** designation marks the payload layer: the concrete value instance stored once entity and attribute have been resolved. Misc is not a semantic free-for-all; it is typed miscellany routed through purpose-built value relations so that decimals (0.916, 747.18, 963.37), datetimes (2025-06-18T16:09:11, 2023-11-08T17:00:45), integers, and varchar literals (“node-a01”, “failed”, “nightly summary”) each land in a channel governed by the corresponding attr type. This pattern matters in practice because compliance and operations teams routinely need to quote exact evidentiary values—whether a label-alignment confidence or a promtail-observed host_name—while retaining the ability to re-validate those values against XSD constraints during audits or automated policy checks. When schema.org-facing alignments tie sku_code and data_asset_name to SYSC-0006 and SYSC-0002, the misc layer becomes the bridge between external vocabulary and internally recorded measurements, preserving both human-readable labels and machine-verifiable literals.

**t_schemaorg_label_alignment_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0004 | 2024-11-29T12:22:57 |
| ALIG-0002 | ALIG-0002 | ALIG-0004 | 2024-10-21T02:32:32 |
| ALIG-0003 | ALIG-0003 | ALIG-0004 | 2024-04-16T22:29:51 |
| ALIG-0004 | ALIG-0004 | ALIG-0004 | 2024-04-08T02:25:07 |
| ALIG-0005 | ALIG-0005 | ALIG-0004 | 2024-04-01T00:20:16 |
| ALIG-0006 | ALIG-0006 | ALIG-0004 | 2024-06-23T20:04:43 |
| ALIG-0007 | ALIG-0007 | ALIG-0004 | 2025-03-29T09:58:30 |
| ALIG-0008 | ALIG-0008 | ALIG-0004 | 2024-10-23T02:04:00 |

**t_schemaorg_label_alignment_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0001 | 0.916 |
| ALIG-0002 | ALIG-0001 | ALIG-0005 | 747.18 |
| ALIG-0003 | ALIG-0001 | ALIG-0007 | 963.37 |
| ALIG-0004 | ALIG-0002 | ALIG-0001 | 0.264 |
| ALIG-0005 | ALIG-0002 | ALIG-0005 | 721.79 |
| ALIG-0006 | ALIG-0002 | ALIG-0007 | 736.70 |
| ALIG-0007 | ALIG-0003 | ALIG-0001 | 0.758 |
| ALIG-0008 | ALIG-0003 | ALIG-0005 | 440.87 |

**t_schemaorg_label_alignment_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0002 | Dimension Kind 01 |
| ALIG-0002 | ALIG-0001 | ALIG-0008 | Encoding 02 |
| ALIG-0003 | ALIG-0001 | ALIG-0009 | nightly summary |
| ALIG-0004 | ALIG-0001 | ALIG-0010 | fr |
| ALIG-0005 | ALIG-0001 | ALIG-0003 | automated |
| ALIG-0006 | ALIG-0001 | ALIG-0006 | count |
| ALIG-0007 | ALIG-0002 | ALIG-0002 | Dimension Kind 07 |
| ALIG-0008 | ALIG-0002 | ALIG-0008 | Encoding 08 |

Directed relationships are expressed through **subject** and **target**, which orient edges so that governance logic can distinguish who bears an obligation from what that obligation concerns. In requirement-equivalence modeling, a subject requirement_id such as TARG-0004 may specify a target specifies_id of TARG-0002 (KafkaProtocol) under one asserted link, while another subject TARG-0002 may point to TARG-0007, showing that identical textual requirements can participate in different semantic graphs depending on which record is treated as the originating party. The applies_to pattern extends this orientation into deployment scope: subject TARG-0001 links to target TARG-0001 with applies_to CloudStorage, whereas subject TARG-0005 reaches target TARG-0002 for EUDataCenter, demonstrating that subjects need not share identifiers with their targets and that many-to-many governance graphs are navigated by explicit directionality rather than implicit join keys. Without subject–target discipline, reviewers cannot reliably answer whether LatencyThreshold governs KafkaProtocol or whether KafkaProtocol constrains LatencyThreshold—a distinction material to accountability.

**t_requirement_equiv_specifies_target**

| id | requirement |
| --- | --- |
| TARG-0001 | LatencyThreshold |
| TARG-0002 | DataLineageTrace |
| TARG-0003 | LatencyThreshold |
| TARG-0004 | AuditLogFormat |
| TARG-0005 | TelemetrySamplingRate |
| TARG-0006 | LatencyThreshold |

**t_requirement_equiv_specifies_target_specifies**

| id | specifies |
| --- | --- |
| TARG-0001 | KafkaProtocol |
| TARG-0002 | GDPRArticle |
| TARG-0003 | KafkaProtocol |
| TARG-0004 | JSONSchema |
| TARG-0005 | JSONSchema |
| TARG-0006 | OpenTelemetry |
| TARG-0007 | JSONSchema |

**t_requirement_equiv_specifies_target__specifies**

| id | requirement_id | specifies_id | role |
| --- | --- | --- | --- |
| TARG-0001 | TARG-0004 | TARG-0002 | reviewer |
| TARG-0002 | TARG-0002 | TARG-0002 | owner |
| TARG-0003 | TARG-0004 | TARG-0007 | contributor |
| TARG-0004 | TARG-0002 | TARG-0004 | owner |
| TARG-0005 | TARG-0002 | TARG-0004 | observer |
| TARG-0006 | TARG-0006 | TARG-0007 | contributor |
| TARG-0007 | TARG-0005 | TARG-0006 | reviewer |
| TARG-0008 | TARG-0001 | TARG-0007 | reviewer |

**t_requirement_equiv_specifies_target_applies_to**

| id | applies_to |
| --- | --- |
| TARG-0001 | CloudStorage |
| TARG-0002 | EUDataCenter |
| TARG-0003 | DataLake |
| TARG-0004 | DataLake |
| TARG-0005 | EUDataCenter |
| TARG-0006 | CustomerTable |

**Role** qualifies each subject–target edge with the stakeholder or functional capacity in which the linkage holds, transforming a bare graph into an assignable responsibility model. Roles such as owner, reviewer, contributor, and observer appear on both specifies and applies_to associations: TARG-0004 as owner of a specifies edge to TARG-0002 contrasts with TARG-0001 as reviewer on a different specifies pairing, while applies_to edges cast TARG-0006 as observer toward DataLake and TARG-0002 as reviewer toward the same applies_to target in another context. Role is therefore not decorative metadata; it governs who may attest, who must approve, and who may read without mutating the underlying requirement graph. **Cardinality note** complements role by documenting multiplicity expectations that pure foreign-key structure under-specifies: Cardinality Note 01 through Cardinality Note 04 attach to distinct applies_to assertions, signaling whether a requirement may bind once or many times, whether duplicate application is permitted, or whether reviewers should treat apparent collisions—such as repeated DataLake application across TARG-0003 and TARG-0004—as intentional overlap rather than data defect. Together, role and cardinality note convert relational facts into operable governance prose that downstream tooling, access-control matrices, and audit playbooks can execute without reinterpretation.

Taken as an integrated practice, these constructs enable cross-domain evidentiary chains that remain legible under scrutiny. A LatencyThreshold requirement (TARG-0001) that specifies KafkaProtocol and applies_to CloudStorage with contributor role and Cardinality Note 01 can be read alongside schema.org alignment entities whose recorded_at misc values timestamp when confidence in sku_code mapping was measured, while eBPF entities aligned to those syscall records supply runtime corroboration—node-exporter and promtail observations with duration_seconds in the thousands of seconds and exit_code integers documenting operational behavior. Identifiers stabilize the chain; entities delimit what is being described; attr and attr_type enforce what may be said; misc carries what was observed; subject and target orient how requirements bind to protocols and infrastructures; role and cardinality note specify who acts and how often links may legitimately recur. Organizations that treat these elements as first-class governance primitives rather than incidental column names gain a reference model capable of surviving regulator inquiry, internal reorganization, and toolchain migration without sacrificing the specificity that makes compliance claims defensible.

**t_requirement_equiv_specifies_target__applies_to**

| id | requirement_id | applies_to_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| TARG-0001 | TARG-0001 | TARG-0001 | contributor | Cardinality Note 01 |
| TARG-0002 | TARG-0005 | TARG-0002 | contributor | Cardinality Note 02 |
| TARG-0003 | TARG-0006 | TARG-0003 | observer | Cardinality Note 03 |
| TARG-0004 | TARG-0002 | TARG-0004 | reviewer | Cardinality Note 04 |
| TARG-0005 | TARG-0001 | TARG-0006 | reviewer | Cardinality Note 05 |
| TARG-0006 | TARG-0004 | TARG-0003 | observer | Cardinality Note 06 |
| TARG-0007 | TARG-0003 | TARG-0001 | observer | Cardinality Note 07 |
| TARG-0008 | TARG-0005 | TARG-0002 | reviewer | Cardinality Note 08 |