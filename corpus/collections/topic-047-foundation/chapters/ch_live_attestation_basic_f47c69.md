---
chapter_id: ch_live_attestation_basic_f47c69
topic_id: 47
family: 03_directive_governance
cited_terms: ['attestation_basic', 'syscall_governed_by_directive', 'ice_exactly_one_subject']
model: engine-refine
---

An identifier is the stable, referential spine on which compliance and governance records are assembled, exchanged, and audited across otherwise heterogeneous domains. Whether the governed object is an attestation of regulatory posture, a syscall placed under directive, or an integrity-check envelope (ICE) subject, each record receives a durable key—ATTE-0001 for a vendor risk assessment, DIRE-0003 for epoll_wait governance, SUBJ-0002 for a provenance graph export—that survives renaming of display labels, reclassification of control families, and migration between operational stores. Identifiers are not merely surrogate keys for storage convenience; they are the contractual handles by which downstream enforcement, lineage tracing, and cross-artifact linkage resolve ambiguity. When SUBJ-0003 is tied to ATTE-0001 through a related reference, or when multiple value rows cite entity_id ATTE-0001 while pointing at distinct attr_id values, the identifier permits auditors to reconstruct which evidentiary object received which measured property without collapsing distinct facts into a single undifferentiated document.

**t_attestation_basic**

| id | attestation |
| --- | --- |
| ATTE-0001 | Vendor risk assessment |
| ATTE-0002 | HIPAA compliance review |
| ATTE-0003 | ML model fairness audit |
| ATTE-0004 | HIPAA compliance review |
| ATTE-0005 | SOC 2 Type II audit |
| ATTE-0006 | Vendor risk assessment |

**t_syscall_governed_by_directive**

| id | syscall |
| --- | --- |
| DIRE-0001 | mmap |
| DIRE-0002 | connect |
| DIRE-0003 | epoll_wait |
| DIRE-0004 | listen |
| DIRE-0005 | socket |
| DIRE-0006 | bind |

**t_syscall_governed_by_directive_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIRE-0001 | effective_date | xsd:date |
| DIRE-0002 | enforcement | xsd:string |
| DIRE-0003 | mandatory | xsd:boolean |
| DIRE-0004 | priority | xsd:integer |
| DIRE-0005 | review_cycle_days | xsd:integer |
| DIRE-0006 | scope | xsd:string |
| DIRE-0007 | encoding | xsd:string |
| DIRE-0008 | label_text | xsd:string |

**t_syscall_governed_by_directive_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0003 | true |
| DIRE-0002 | DIRE-0002 | DIRE-0003 | false |
| DIRE-0003 | DIRE-0003 | DIRE-0003 | true |
| DIRE-0004 | DIRE-0004 | DIRE-0003 | true |
| DIRE-0005 | DIRE-0005 | DIRE-0003 | false |
| DIRE-0006 | DIRE-0006 | DIRE-0003 | false |

**t_syscall_governed_by_directive_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0004 | 4 |
| DIRE-0002 | DIRE-0001 | DIRE-0005 | 80 |
| DIRE-0003 | DIRE-0002 | DIRE-0004 | 4 |
| DIRE-0004 | DIRE-0002 | DIRE-0005 | 443 |
| DIRE-0005 | DIRE-0003 | DIRE-0004 | 5 |
| DIRE-0006 | DIRE-0003 | DIRE-0005 | 564 |
| DIRE-0007 | DIRE-0004 | DIRE-0004 | 1 |
| DIRE-0008 | DIRE-0004 | DIRE-0005 | 613 |

**t_syscall_governed_by_directive_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0007 | Encoding 01 |
| DIRE-0002 | DIRE-0001 | DIRE-0002 | Enforcement 02 |
| DIRE-0003 | DIRE-0001 | DIRE-0008 | audit excerpt |
| DIRE-0004 | DIRE-0001 | DIRE-0009 | fr |
| DIRE-0005 | DIRE-0001 | DIRE-0006 | Scope 05 |
| DIRE-0006 | DIRE-0002 | DIRE-0007 | Encoding 06 |
| DIRE-0007 | DIRE-0002 | DIRE-0002 | Enforcement 07 |
| DIRE-0008 | DIRE-0002 | DIRE-0008 | nightly summary |

**t_ice_exactly_one_subject**

| id | ice | related |
| --- | --- | --- |
| SUBJ-0001 | Calibration Manifest | ATTE-0003 |
| SUBJ-0002 | Provenance Graph Export | ATTE-0004 |
| SUBJ-0003 | Raw Observation Feed | ATTE-0001 |
| SUBJ-0004 | Provenance Graph Export | ATTE-0006 |
| SUBJ-0005 | Schema Registry Entry | ATTE-0005 |
| SUBJ-0006 | Audit Trail Report | ATTE-0002 |
| SUBJ-0007 | Schema Registry Entry | ATTE-0004 |
| SUBJ-0008 | Sensor Configuration File | ATTE-0003 |

The entity, in this architecture, is the governed object itself—the attestation, directive, or ICE subject whose identity persists independently of the particular attributes currently asserted about it. Entity semantics are carried by the base record (the attestation “HIPAA compliance review,” the syscall “connect,” the ICE “Calibration Manifest”), while all contingent, revisable, or type-heterogeneous properties are externalized rather than embedded as a wide, nullable column set. This separation matters because governance data is inherently sparse and evolutionary: a vendor risk assessment may require duration_seconds and host_name, whereas a fairness audit may require overlapping but not identical observables, and a syscall directive may require effective_date and mandatory without ever touching host-level telemetry. Holding entity_id constant while varying attr_id across value stores therefore expresses a uniform rule—attributes describe entities, never the reverse—while still accommodating domain-specific extension without schema churn.

An attr is the named, typed slot in which a measurable or declarative fact about an entity may be recorded. Attribute definitions are first-class records: duration_seconds, end_time, exit_code, and host_name for attestations; effective_date, enforcement, mandatory, and priority for syscall directives; encoding, label_text, and language for ICE subjects. Naming is deliberately lexical rather than positional so that policy authors, automated collectors, and human reviewers share a single vocabulary when interpreting evidence. Because the same attr_id may appear on many entities—ATTE-0001 for duration_seconds recurs across four distinct attestation runs, and DIRE-0003 for mandatory recurs across four directives—the attribute layer functions as a reusable schema contract: it states what may be said, while remaining silent about the particular utterance until paired with an entity and a value.

Attr type completes the contract by fixing the interpretation, validation, and storage pathway for each attr. Types are expressed in an externally legible datatype vocabulary—xsd:decimal for durations such as 7132.97 seconds on ATTE-0001, xsd:dateTime for temporal boundaries like 2024-11-18T12:26:52, xsd:integer for discrete outcomes including exit_code 898 and priority 4, xsd:string for symbolic tokens ranging from ingest-21 to Enforcement 02, xsd:boolean for binary obligations such as mandatory true on DIRE-0001 and false on DIRE-0002, and xsd:date for calendar-effective controls like 2023-07-14. Type discipline is not cosmetic typing; it is the mechanism that prevents category errors in compliance reasoning—treating a host label as a number, or a mandatory flag as free text—and it motivates physically partitioned value stores (decimal, datetime, integer, varchar, boolean, date) so that constraints, indexing, and unit semantics can be enforced at insertion rather than repaired at report time.

Misc, in operational usage, denotes the instantiated value—the miscellany of factual content that satisfies an attr for a given entity at a point in evidence capture. Values are always carried as entity–attr pairs: entity_id ATTE-0001 with attr_id ATTE-0002 yields end_time 2024-11-18T12:26:52; the same entity with attr_id ATTE-0004 yields host_name ingest-21; entity_id ATTE-0002 with attr_id ATTE-0001 yields a distinct duration_seconds of 6429.54. The pattern generalizes across governance planes—DIRE-0002 records mandatory false alongside effective_date 2025-03-29 and priority 443; SUBJ-0001 carries encoding Encoding 01 and label_text nightly summary on SUBJ-0002 with language fr—demonstrating that misc is where audit narratives become queryable fact. Reuse of attr_id across entities (multiple rows referencing ATTE-0002 for end_time, or DIRE-0003 for mandatory) further shows that misc rows are assertions, not definitions: they may disagree, supersede one another (as with varchar value superseded on an attestation context), or accumulate as parallel measurements without redefining the underlying attribute.

**t_attestation_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0004 | ingest-21 |
| ATTE-0002 | ATTE-0001 | ATTE-0005 | Log Level 02 |
| ATTE-0003 | ATTE-0001 | ATTE-0006 | initiation |
| ATTE-0004 | ATTE-0001 | ATTE-0010 | superseded |
| ATTE-0005 | ATTE-0001 | ATTE-0011 | Triggered By 05 |
| ATTE-0006 | ATTE-0002 | ATTE-0004 | gw-12 |
| ATTE-0007 | ATTE-0002 | ATTE-0005 | Log Level 07 |
| ATTE-0008 | ATTE-0002 | ATTE-0006 | execution |

Taken together, identifier, entity, attr, attr type, and misc implement a typed entity–attribute–value discipline suited to compliance handbook rigor: identifiers anchor identity; entities bear governance meaning; attrs declare what may be measured or declared; attr types govern lawful representation; and misc supplies the evidentiary payload auditors must reconcile. The architecture’s practical force appears precisely where heterogeneous controls intersect—an ICE subject related to ATTE-0003’s ML model fairness audit can be evaluated against decimal durations, integer exit codes, and string encodings without forcing a single monolithic record shape, while syscall directives dated 2024-05-27 and 2024-04-25 can be compared on mandatory true and enforcement strings under a common attr vocabulary. Dense, evidence-anchored prose of this kind is warranted because governance failures often originate not in missing policies but in ambiguous data: conflating entity with attribute, or value with type. Separating these layers makes attestations, directives, and subjects independently verifiable, composable, and durable across the operational lifecycle they are meant to govern.

**t_attestation_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTE-0001 | duration_seconds | xsd:decimal |
| ATTE-0002 | end_time | xsd:dateTime |
| ATTE-0003 | exit_code | xsd:integer |
| ATTE-0004 | host_name | xsd:string |
| ATTE-0005 | log_level | xsd:string |
| ATTE-0006 | phase | xsd:string |
| ATTE-0007 | retry_count | xsd:integer |
| ATTE-0008 | scheduled_at | xsd:dateTime |

**t_attestation_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0002 | 2024-11-18T12:26:52 |
| ATTE-0002 | ATTE-0001 | ATTE-0008 | 2023-12-15T15:31:35 |
| ATTE-0003 | ATTE-0001 | ATTE-0009 | 2023-03-05T20:41:52 |
| ATTE-0004 | ATTE-0002 | ATTE-0002 | 2023-09-08T13:00:56 |
| ATTE-0005 | ATTE-0002 | ATTE-0008 | 2024-07-29T18:29:50 |
| ATTE-0006 | ATTE-0002 | ATTE-0009 | 2024-08-01T11:14:05 |
| ATTE-0007 | ATTE-0003 | ATTE-0002 | 2023-01-08T06:41:42 |
| ATTE-0008 | ATTE-0003 | ATTE-0008 | 2025-06-10T02:28:19 |

**t_attestation_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0001 | 7132.97 |
| ATTE-0002 | ATTE-0002 | ATTE-0001 | 6429.54 |
| ATTE-0003 | ATTE-0003 | ATTE-0001 | 3894.03 |
| ATTE-0004 | ATTE-0004 | ATTE-0001 | 6507.32 |
| ATTE-0005 | ATTE-0005 | ATTE-0001 | 5722.64 |
| ATTE-0006 | ATTE-0006 | ATTE-0001 | 4627.41 |

**t_attestation_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0003 | 898 |
| ATTE-0002 | ATTE-0001 | ATTE-0007 | 487 |
| ATTE-0003 | ATTE-0002 | ATTE-0003 | 71 |
| ATTE-0004 | ATTE-0002 | ATTE-0007 | 180 |
| ATTE-0005 | ATTE-0003 | ATTE-0003 | 107 |
| ATTE-0006 | ATTE-0003 | ATTE-0007 | 326 |
| ATTE-0007 | ATTE-0004 | ATTE-0003 | 620 |
| ATTE-0008 | ATTE-0004 | ATTE-0007 | 392 |

**t_syscall_governed_by_directive_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0001 | 2023-07-14 |
| DIRE-0002 | DIRE-0002 | DIRE-0001 | 2025-03-29 |
| DIRE-0003 | DIRE-0003 | DIRE-0001 | 2024-05-27 |
| DIRE-0004 | DIRE-0004 | DIRE-0001 | 2024-04-25 |
| DIRE-0005 | DIRE-0005 | DIRE-0001 | 2025-03-30 |
| DIRE-0006 | DIRE-0006 | DIRE-0001 | 2024-07-29 |

**t_ice_exactly_one_subject_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUBJ-0001 | encoding | xsd:string |
| SUBJ-0002 | label_text | xsd:string |
| SUBJ-0003 | language | xsd:string |

**t_ice_exactly_one_subject_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0001 | Encoding 01 |
| SUBJ-0002 | SUBJ-0001 | SUBJ-0002 | nightly summary |
| SUBJ-0003 | SUBJ-0001 | SUBJ-0003 | fr |
| SUBJ-0004 | SUBJ-0002 | SUBJ-0001 | Encoding 04 |
| SUBJ-0005 | SUBJ-0002 | SUBJ-0002 | intake form |
| SUBJ-0006 | SUBJ-0002 | SUBJ-0003 | de |
| SUBJ-0007 | SUBJ-0003 | SUBJ-0001 | Encoding 07 |
| SUBJ-0008 | SUBJ-0003 | SUBJ-0002 | intake form |