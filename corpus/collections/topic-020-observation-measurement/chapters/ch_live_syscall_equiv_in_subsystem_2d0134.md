---
chapter_id: ch_live_syscall_equiv_in_subsystem_2d0134
topic_id: 20
family: 04_ebpf_kernel
cited_terms: ['syscall_equiv_in_subsystem', 'column_nullability_state', 'policy_basic']
model: engine-refine
---

In governance and compliance information models, stable identity is the prerequisite for every auditable assertion. An identifier is not merely a surrogate key but a durable handle that survives renaming, reclassification, and cross-system federation: SUBS-0003 names a syscall-equivalence record, STAT-0002 a column nullability state, POLI-0001 a policy artifact, each prefixed and sequenced so that references remain unambiguous when the same logical fact appears in junction tables, attribute registries, and typed value stores. Without such handles, role assignments between syscalls and hosting subsystems could not be reconciled against policy enforcement, nor could nullability decisions be traced to the governing rule set. The identifier therefore anchors provenance: every downstream subject–target link, every attr binding, and every misc payload resolves back to a single authoritative row.

**t_syscall_equiv_in_subsystem**

| id | syscall |
| --- | --- |
| SUBS-0001 | Syscall 01 |
| SUBS-0002 | Syscall 02 |
| SUBS-0003 | Syscall 03 |
| SUBS-0004 | Syscall 04 |
| SUBS-0005 | Syscall 05 |
| SUBS-0006 | Syscall 06 |
| SUBS-0007 | Syscall 07 |

**t_syscall_equiv_in_subsystem_in_syscall_subsystem**

| id | in_syscall_subsystem |
| --- | --- |
| SUBS-0001 | In Syscall Subsystem 01 |
| SUBS-0002 | In Syscall Subsystem 02 |
| SUBS-0003 | In Syscall Subsystem 03 |
| SUBS-0004 | In Syscall Subsystem 04 |
| SUBS-0005 | In Syscall Subsystem 05 |
| SUBS-0006 | In Syscall Subsystem 06 |
| SUBS-0007 | In Syscall Subsystem 07 |

**t_syscall_equiv_in_subsystem__in_syscall_subsystem**

| id | syscall_id | in_syscall_subsystem_id | role |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0003 | SUBS-0007 | reviewer |
| SUBS-0002 | SUBS-0005 | SUBS-0006 | reviewer |
| SUBS-0003 | SUBS-0004 | SUBS-0007 | owner |
| SUBS-0004 | SUBS-0002 | SUBS-0006 | observer |
| SUBS-0005 | SUBS-0007 | SUBS-0004 | owner |
| SUBS-0006 | SUBS-0007 | SUBS-0002 | contributor |
| SUBS-0007 | SUBS-0004 | SUBS-0001 | reviewer |
| SUBS-0008 | SUBS-0003 | SUBS-0004 | owner |

**t_column_nullability_state**

| id | column | nullability_state |
| --- | --- | --- |
| STAT-0001 | timestamp_utc | POLI-0003 |
| STAT-0002 | checksum_sha256 | POLI-0007 |
| STAT-0003 | latency_ms | POLI-0003 |
| STAT-0004 | timestamp_utc | POLI-0005 |
| STAT-0005 | timestamp_utc | POLI-0001 |
| STAT-0006 | checksum_sha256 | POLI-0001 |

**t_column_nullability_state_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAT-0001 | confidence | xsd:decimal |
| STAT-0002 | dimension_kind | xsd:string |
| STAT-0003 | method | xsd:string |
| STAT-0004 | recorded_at | xsd:dateTime |
| STAT-0005 | uncertainty | xsd:decimal |
| STAT-0006 | unit | xsd:string |
| STAT-0007 | value | xsd:decimal |
| STAT-0008 | encoding | xsd:string |

**t_column_nullability_state_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0004 | 2024-12-29T19:38:29 |
| STAT-0002 | STAT-0002 | STAT-0004 | 2023-05-04T12:31:25 |
| STAT-0003 | STAT-0003 | STAT-0004 | 2023-11-12T04:10:53 |
| STAT-0004 | STAT-0004 | STAT-0004 | 2024-08-13T21:58:19 |
| STAT-0005 | STAT-0005 | STAT-0004 | 2023-08-07T04:27:45 |
| STAT-0006 | STAT-0006 | STAT-0004 | 2025-03-15T00:17:24 |

**t_column_nullability_state_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0001 | 0.294 |
| STAT-0002 | STAT-0001 | STAT-0005 | 568.73 |
| STAT-0003 | STAT-0001 | STAT-0007 | 519.24 |
| STAT-0004 | STAT-0002 | STAT-0001 | 0.734 |
| STAT-0005 | STAT-0002 | STAT-0005 | 854.57 |
| STAT-0006 | STAT-0002 | STAT-0007 | 958.56 |
| STAT-0007 | STAT-0003 | STAT-0001 | 0.295 |
| STAT-0008 | STAT-0003 | STAT-0005 | 90.08 |

**t_column_nullability_state_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0002 | Dimension Kind 01 |
| STAT-0002 | STAT-0001 | STAT-0008 | Encoding 02 |
| STAT-0003 | STAT-0001 | STAT-0009 | intake form |
| STAT-0004 | STAT-0001 | STAT-0010 | fr |
| STAT-0005 | STAT-0001 | STAT-0003 | automated |
| STAT-0006 | STAT-0001 | STAT-0006 | ratio |
| STAT-0007 | STAT-0002 | STAT-0002 | Dimension Kind 07 |
| STAT-0008 | STAT-0002 | STAT-0008 | Encoding 08 |

**t_policy_basic**

| id | policy |
| --- | --- |
| POLI-0001 | Privacy Compliance Policy |
| POLI-0002 | Access Control Policy |
| POLI-0003 | Acceptable Use Policy |
| POLI-0004 | Security Baseline Policy |
| POLI-0005 | Data Sharing Policy |
| POLI-0006 | Data Retention Policy |
| POLI-0007 | Security Baseline Policy |

**t_policy_basic_attr**

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

**t_policy_basic_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | false |
| POLI-0002 | POLI-0002 | POLI-0003 | true |
| POLI-0003 | POLI-0003 | POLI-0003 | false |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | true |
| POLI-0007 | POLI-0007 | POLI-0003 | false |

**t_policy_basic_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2025-05-22 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2023-08-24 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2025-01-30 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2025-06-16 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2023-11-15 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2023-07-13 |
| POLI-0007 | POLI-0007 | POLI-0001 | 2023-02-02 |

**t_policy_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 2 |
| POLI-0002 | POLI-0001 | POLI-0005 | 409 |
| POLI-0003 | POLI-0002 | POLI-0004 | 3 |
| POLI-0004 | POLI-0002 | POLI-0005 | 74 |
| POLI-0005 | POLI-0003 | POLI-0004 | 3 |
| POLI-0006 | POLI-0003 | POLI-0005 | 787 |
| POLI-0007 | POLI-0004 | POLI-0004 | 3 |
| POLI-0008 | POLI-0004 | POLI-0005 | 65 |

**t_policy_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | calibration record |
| POLI-0004 | POLI-0001 | POLI-0009 | en |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | intake form |

An entity is the governed object to which metadata and obligations attach. In operational practice, entities are the things auditors inspect—policies such as Privacy Compliance Policy (POLI-0001) or Acceptable Use Policy (POLI-0003), and operational states such as the nullability posture assigned to timestamp_utc or checksum_sha256. Entities are intentionally coarse-grained: they represent the unit of lifecycle management (effective dates, mandatory flags, enforcement posture) rather than the individual fields that describe them. A column nullability state entity STAT-0001, for example, stands for the compliance decision applied to timestamp_utc under POLI-0003, not for the timestamp value itself. This separation matters because governance frameworks must version decisions independently of the telemetry or schema elements those decisions constrain.

Attributes and attribute types constitute the typed vocabulary through which entities are described. An attr names a semantic dimension—confidence, dimension_kind, method, recorded_at on nullability states; effective_date, enforcement, mandatory, priority on policies—while attr_type declares the interpretive contract under which values must be stored and validated. Declaring attr_type as xsd:decimal, xsd:dateTime, xsd:boolean, or xsd:integer is not cosmetic labeling; it routes each assertion to the correct physical representation and prevents category errors during aggregation, reporting, and automated policy evaluation. When POLI-0003’s mandatory attribute is typed xsd:boolean and bound with value false, the type system guarantees that downstream consumers will not treat that obligation as a string token or numeric rank. Likewise, confidence scored 0.294 for STAT-0001 and 0.734 for STAT-0002 remains arithmetically meaningful only because the attr registry fixed it as xsd:decimal before any value was admitted.

The misc dimension—materialized in typed value stores—is where abstract metadata becomes evidentiary fact. Each value row ties entity_id to attr_id and records the literal payload: recorded_at timestamps such as 2024-12-29T19:38:29 and 2023-11-12T04:10:53, decimal measurements 568.73 and 519.24, varchar tokens including Dimension Kind 01 and intake form, boolean mandatory flags, effective dates from 2023-08-24 through 2025-06-16, and integer priorities 2 and 409. Misc is deliberately partitioned by attr_type so that integrity constraints, indexing, and unit semantics remain enforceable at insert time. In compliance operations, misc rows are the exhibits: they demonstrate when a nullability assessment was recorded, what confidence was assigned, which enforcement regime applies, and whether a policy was mandatory at the point of decision. Auditors read misc not as free text but as typed assertions whose admissibility depends on prior registration of attr and attr_type.

Directed relationships introduce subject, target, and role as the grammar of responsibility and scope. A subject is the originating or accountable party in a link—here, syscall identifiers such as SUBS-0003 and SUBS-0004—while target denotes the context or counterparty—in_syscall_subsystem references SUBS-0007 and SUBS-0006. Role qualifies the nature of participation without collapsing it into an undifferentiated association: reviewer, owner, and observer assign distinct duties within In Syscall Subsystem 01 through In Syscall Subsystem 04, so that access reviews, ownership attestations, and passive monitoring can be enforced under different control objectives. This triad prevents symmetric graphs from obscuring accountability; knowing that SUBS-0004 links to SUBS-0006 as owner is materially different from SUBS-0001 linking to SUBS-0007 as reviewer, even when both pairs reference the same subsystem namespace.

Taken together, identifier, entity, attr, attr_type, misc, subject, target, and role form a layered evidence chain suitable for subsystem equivalence mapping, schema nullability governance, and policy baselines. Syscall equivalence records (Syscall 01–04) and their subsystem embeddings supply the structural map; column nullability states bind schema elements to policies (POLI-0003, POLI-0005, POLI-0007); policy entities supply the normative frame (Access Control Policy, Security Baseline Policy) whose attrs and misc values encode enforcement strings, locales, and priority ordinals. Practitioners who maintain such models do not treat these dimensions as interchangeable columns—they operationalize them as contracts: identifiers for traceability, entities for scope, attrs and attr_types for semantics, misc for proof, and subject–target–role tuples for delegated authority. That discipline is what allows a single compliance handbook to cite SUBS-0002 as observer in one context, POLI-0002 as mandatory true in another, and STAT-0004’s latency_ms nullability under POLI-0005 in a third, without collapsing distinct governance stories into one undifferentiated record.