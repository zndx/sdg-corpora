---
chapter_id: ch_live_audit_produces_evidence_4c80d2
topic_id: 12
family: 07_long_tail
cited_terms: ['audit_produces_evidence', 'kernelhook_basic', 'myxoid_degeneration_process']
model: engine-refine
---

In governed information systems, an identifier is the durable handle by which a record remains addressable across ingestion, validation, linkage, and audit without conflating identity with any single descriptive field. Whether the subject is compliance evidence, kernel instrumentation metadata, or a documented pathological cascade, the identifier anchors referential integrity: EVID-0001 through EVID-0004 name distinct audit-derived evidence artifacts; KERN-0001 through KERN-0004 name kernel-hook registrations; PROC-0001 through PROC-0004 name enumerated myxoid degeneration processes. An entity, in operational terms, is the thing those identifiers denote—the evidence item produced by a named audit, the hook configuration bound to a tracepoint or probe class, or the biological process instance whose downstream effects must be traced. Practice depends on treating entity as the stable node and identifier as its canonical key, so that attributes may be added, retyped, or stored in heterogeneous representations without rewriting the entity’s identity.

**t_audit_produces_evidence**

| id | audit |
| --- | --- |
| EVID-0001 | Data Retention Policy Audit |
| EVID-0002 | ISO27001 Certification |
| EVID-0003 | Cloud Infrastructure Scan |
| EVID-0004 | Cloud Infrastructure Scan |
| EVID-0005 | Data Retention Policy Audit |
| EVID-0006 | Data Retention Policy Audit |

**t_audit_produces_evidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVID-0001 | confidence | xsd:decimal |
| EVID-0002 | dimension_kind | xsd:string |
| EVID-0003 | method | xsd:string |
| EVID-0004 | recorded_at | xsd:dateTime |
| EVID-0005 | uncertainty | xsd:decimal |
| EVID-0006 | unit | xsd:string |
| EVID-0007 | value | xsd:decimal |
| EVID-0008 | encoding | xsd:string |

**t_kernelhook_basic**

| id | kernelhook |
| --- | --- |
| KERN-0001 | Tracepoint-block-io |
| KERN-0002 | BPF-co-re-syscall |
| KERN-0003 | Kprobes-schedule |
| KERN-0004 | Fentry-kernel-init |
| KERN-0005 | Kprobes-schedule |
| KERN-0006 | Kretprobe-exit |

**t_kernelhook_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| KERN-0001 | checksum | xsd:string |
| KERN-0002 | created_date | xsd:date |
| KERN-0003 | identifier | cco:DesignativeICE |
| KERN-0004 | license | xsd:string |
| KERN-0005 | mime_type | xsd:string |
| KERN-0006 | size_bytes | xsd:long |
| KERN-0007 | uri | xsd:string |
| KERN-0008 | version | xsd:integer |

An attr is a named, typed property declared against an entity class rather than embedded as a wide, schema-fragile column set. In audit-evidence modeling, attrs such as confidence, dimension_kind, method, and recorded_at specify what may be asserted about each evidence record; in kernel-hook catalogs, attrs such as checksum, created_date, identifier, and license perform the same contract for instrumentation objects. The attr does not carry the value itself—it defines the semantic slot. attr_type completes that contract by binding each slot to a validation and persistence regime: xsd:decimal for numeric scores, xsd:string for lexical descriptors, xsd:dateTime for instants, xsd:date for calendar dates, and domain-specific types such as cco:DesignativeICE where designation semantics exceed plain strings. Typed declaration matters because it routes writes and reads to the correct representation layer, prevents category errors at ingest, and preserves interpretability when records are exchanged across systems that never shared an originating physical schema.

**t_audit_produces_evidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0004 | 2025-03-28T10:19:21 |
| EVID-0002 | EVID-0002 | EVID-0004 | 2023-02-07T18:23:26 |
| EVID-0003 | EVID-0003 | EVID-0004 | 2025-03-19T12:10:16 |
| EVID-0004 | EVID-0004 | EVID-0004 | 2023-11-17T00:14:22 |
| EVID-0005 | EVID-0005 | EVID-0004 | 2023-04-23T17:18:39 |
| EVID-0006 | EVID-0006 | EVID-0004 | 2024-01-14T13:39:09 |

**t_audit_produces_evidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0001 | 0.658 |
| EVID-0002 | EVID-0001 | EVID-0005 | 291.89 |
| EVID-0003 | EVID-0001 | EVID-0007 | 838.98 |
| EVID-0004 | EVID-0002 | EVID-0001 | 0.814 |
| EVID-0005 | EVID-0002 | EVID-0005 | 409.44 |
| EVID-0006 | EVID-0002 | EVID-0007 | 534.69 |
| EVID-0007 | EVID-0003 | EVID-0001 | 0.935 |
| EVID-0008 | EVID-0003 | EVID-0005 | 954.22 |

The misc dimension—materialized as the stored value payload once entity, attr, and attr_type are resolved—is where assertion meets evidence. A confidence of 0.658 on EVID-0001 and 0.814 on EVID-0002 illustrates decimal attrs evaluated per entity; recorded_at values such as 2025-03-28T10:19:21 and 2023-02-07T18:23:26 show datetime attrs attached uniformly to attr_id EVID-0004 across four entities, demonstrating that one attr definition can fan out to many entity instances. Varchar misc entries—Dimension Kind 01, Encoding 02, calibration record, en—show categorical and documentary attrs coexisting on a single entity without forcing a single table width. Kernel-hook misc exhibits the same pattern at different granularities: checksum a3f9c21e, license Apache-2.0, region eu-west-3, created_date 2024-05-21, and integer counters 323 and 12 all attach to KERN-0001 and KERN-0002 through entity_id–attr_id pairing. In practice, misc is not miscellaneous in the colloquial sense; it is the typed fact layer whose discipline makes multi-domain catalogs queryable, versionable, and auditable.

**t_audit_produces_evidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0002 | Dimension Kind 01 |
| EVID-0002 | EVID-0001 | EVID-0008 | Encoding 02 |
| EVID-0003 | EVID-0001 | EVID-0009 | calibration record |
| EVID-0004 | EVID-0001 | EVID-0010 | en |
| EVID-0005 | EVID-0001 | EVID-0003 | manual |
| EVID-0006 | EVID-0001 | EVID-0006 | deg_C |
| EVID-0007 | EVID-0002 | EVID-0002 | Dimension Kind 07 |
| EVID-0008 | EVID-0002 | EVID-0008 | Encoding 08 |

connectivetissueregion names the anatomical substrate that undergoes structural change within a documented degeneration pathway. In the myxoid degeneration domain, each myxoiddegenerationprocess instance—Knee Synovium, Elbow Tendon Myxoid, MCL Ligament Myxoid, Knee Synovial Myxoid—maps through a degrades relation to a specific connective tissue region: Ankle Ligament Capsule, Wrist Flexor Sheath Myxoid, Hip Acetabular Labrum, Elbow Medial Tendon. That pairing matters clinically and operationally because “myxoid change” is not a single diagnosis but a process localized by tissue compartment; conflating region with process loses the ability to reason about site-specific progression, surgical approach, or epidemiologic clustering. ganglioncystformation, recorded as the results_in outcome, closes the causal chain from degenerative process through affected region to a recognizable cyst phenotype—Patellar Retinaculum Cyst, Achilles Paratenon Cyst, Elbow Lateral Epicondyle Cyst. Two distinct processes (PROC-0002 and PROC-0003) may converge on the same cyst class (Achilles Paratenon Cyst), which is precisely why the model separates process, region, and formation rather than collapsing them into one label.

**t_myxoid_degeneration_process**

| id | myxoid_degeneration_process | degrades | results_in |
| --- | --- | --- | --- |
| PROC-0001 | Knee Synovium | Ankle Ligament Capsule | Patellar Retinaculum Cyst |
| PROC-0002 | Elbow Tendon Myxoid | Wrist Flexor Sheath Myxoid | Achilles Paratenon Cyst |
| PROC-0003 | MCL Ligament Myxoid | Hip Acetabular Labrum | Achilles Paratenon Cyst |
| PROC-0004 | Knee Synovial Myxoid | Elbow Medial Tendon | Elbow Lateral Epicondyle Cyst |

Across audit, instrumentation, and pathology registers, the same design principle recurs: identifier fixes identity, entity hosts the identity, attr and attr_type declare what may be said and how it must be encoded, and misc holds the evidentiary or clinical fact. Audit evidence tied to Data Retention Policy Audit, ISO27001 Certification, and Cloud Infrastructure Scan inherits that structure so that confidence scores, dimensional classifications, methods, and timestamps remain comparable even when underlying scans differ. Kernel hooks from Tracepoint-block-io through Fentry-kernel-init inherit it so that checksums, license terms, designative identifiers such as gid://svc/77, and creation dates remain attachable without bespoke tables per hook family. Myxoid degeneration inherits it at the relational level—process, connectivetissueregion, ganglioncystformation—so that etiologic narrative, anatomic locus, and macroscopic outcome stay separable for reporting and inference.

**t_kernelhook_basic_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0001 | KERN-0002 | 2023-02-05 |
| KERN-0002 | KERN-0002 | KERN-0002 | 2024-05-21 |
| KERN-0003 | KERN-0003 | KERN-0002 | 2024-01-08 |
| KERN-0004 | KERN-0004 | KERN-0002 | 2025-01-30 |
| KERN-0005 | KERN-0005 | KERN-0002 | 2023-03-23 |
| KERN-0006 | KERN-0006 | KERN-0002 | 2024-01-11 |

**t_kernelhook_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0001 | KERN-0006 | 323 |
| KERN-0002 | KERN-0001 | KERN-0008 | 12 |
| KERN-0003 | KERN-0002 | KERN-0006 | 186 |
| KERN-0004 | KERN-0002 | KERN-0008 | 2 |
| KERN-0005 | KERN-0003 | KERN-0006 | 276 |
| KERN-0006 | KERN-0003 | KERN-0008 | 4 |
| KERN-0007 | KERN-0004 | KERN-0006 | 346 |
| KERN-0008 | KERN-0004 | KERN-0008 | 11 |

Operators and modelers should therefore treat these constructs as governance primitives, not incidental column names. Weak identifier discipline breaks cross-table joins and audit replay; treating attr as an untyped bag of keys invites silent coercion errors; ignoring attr_type fractures validation pipelines; collapsing entity and misc blurs “what exists” with “what was measured.” Conversely, when EVID-0001 carries both a decimal confidence and a varchar dimension_kind, when KERN-0003’s created_date 2024-01-08 sits beside integer attr KERN-0008 value 186, and when PROC-0004 links Knee Synovial Myxoid degradation of Elbow Medial Tendon to Elbow Lateral Epicondyle Cyst, the system exhibits what well-formed reference data must do: preserve identity, enforce type, localize assertion, and make downstream outcomes traceable to upstream process and place. That traceability—not table layout—is the operational purpose these terms serve.

**t_kernelhook_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0001 | KERN-0001 | a3f9c21e |
| KERN-0002 | KERN-0001 | KERN-0003 | gid://svc/77 |
| KERN-0003 | KERN-0001 | KERN-0004 | Apache-2.0 |
| KERN-0004 | KERN-0001 | KERN-0009 | eu-west-3 |
| KERN-0005 | KERN-0001 | KERN-0005 | text/plain |
| KERN-0006 | KERN-0001 | KERN-0010 | Name 06 |
| KERN-0007 | KERN-0001 | KERN-0011 | governance |
| KERN-0008 | KERN-0001 | KERN-0012 | Tags 08 |