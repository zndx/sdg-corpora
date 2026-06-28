---
chapter_id: ch_live_dataset_was_derived_from_1874ea
topic_id: 24
family: 05_provo_lineage
cited_terms: ['dataset_was_derived_from', 'constraint_with_severity_classification', 'syscall_basic']
model: engine-refine
---

In governed data environments, stable identifiers constitute the non-negotiable substrate upon which auditability, reconciliation, and policy enforcement rest. An identifier is not merely a surrogate key for storage convenience; it is the durable handle that permits the same logical entity to be referenced across heterogeneous registries without collapsing distinct records into ambiguous aggregates. When a derivation registry assigns FROM-0001 through FROM-0004 to datasets spanning iot_edge_logs, patient_demographics_clean, and market_index_history, those tokens do not describe the semantic content of the assets—they establish identity boundaries that downstream joins, lineage traversals, and constraint bindings can rely upon even when human-readable names repeat or drift. The appearance of patient_demographics_clean under both FROM-0002 and FROM-0004 illustrates why identifier discipline matters: lexical equality of dataset names cannot substitute for keyed identity when provenance, ownership, and compliance posture may differ across nominally similar artifacts.

**t_dataset_was_derived_from**

| id | dataset |
| --- | --- |
| FROM-0001 | iot_edge_logs |
| FROM-0002 | patient_demographics_clean |
| FROM-0003 | market_index_history |
| FROM-0004 | patient_demographics_clean |
| FROM-0005 | sensor_readings_2023 |
| FROM-0006 | sensor_readings_2023 |

**t_dataset_was_derived_from_was_derived_from**

| id | was_derived_from |
| --- | --- |
| FROM-0001 | raw_sensor_stream |
| FROM-0002 | warehouse_staging_area |
| FROM-0003 | regulatory_filing_pdf |
| FROM-0004 | archival_tape_restore |
| FROM-0005 | external_credit_bureau |
| FROM-0006 | archival_tape_restore |
| FROM-0007 | external_credit_bureau |
| FROM-0008 | external_credit_bureau |

Subject and target articulate directed semantics within relationship records, converting flat association tables into interpretable graphs of dependency and accountability. The subject names the entity whose status is being asserted—the dataset whose lineage is under description—while the target names the upstream or referenced entity to which that assertion attaches. A binding that places dataset_id FROM-0002 in subject position against was_derived_from_id FROM-0004 in target position states, in machine-checkable form, that a particular curated demographic extract stands in derivation relation to an archival_tape_restore source; conversely, when FROM-0001 occupies the subject role pointed at FROM-0002, the graph encodes a different edge altogether, one in which an iot_edge_logs asset draws provenance from another registry entry rather than from tape restoration. Governance frameworks treat subject–target polarity as contractual: reversing the pair is not a cosmetic error but a semantic inversion that can misallocate retention obligations, misroute access reviews, or misstate regulatory lineage in submissions derived from warehouse_staging_area or regulatory_filing_pdf upstreams.

**t_dataset_was_derived_from__was_derived_from**

| id | dataset_id | was_derived_from_id | role |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0002 | FROM-0004 | contributor |
| FROM-0002 | FROM-0001 | FROM-0001 | contributor |
| FROM-0003 | FROM-0005 | FROM-0006 | contributor |
| FROM-0004 | FROM-0001 | FROM-0002 | owner |
| FROM-0005 | FROM-0006 | FROM-0006 | owner |
| FROM-0006 | FROM-0003 | FROM-0008 | owner |
| FROM-0007 | FROM-0006 | FROM-0005 | reviewer |
| FROM-0008 | FROM-0004 | FROM-0005 | contributor |

Role qualifies how a subject participates in a typed relationship without redefining the entities themselves. Where contributor and owner both appear across otherwise parallel edges—FROM-0005 linked as contributor to FROM-0006, FROM-0001 linked as owner to FROM-0002—the distinction is operational rather than nominal. Ownership typically confers accountability for fitness, disclosure, and remediation; contribution signals material input without vesting final authority over release or attestation. In practice, role metadata drives differentiated workflows: owners receive breach notifications and sign-off queues; contributors may supply evidentiary attachments or transformation logs but cannot unilaterally downgrade severity classifications attached to their inputs. Treating role as first-class metadata prevents lineage graphs from collapsing into undifferentiated “related-to” webs that satisfy diagram aesthetics while failing duty-of-care inquiries.

Priority and language extend constraint registries from static rule lists into operable, locale-aware control planes. Priority encodes ordinal urgency among otherwise coexisting obligations: a PII encryption mandate carrying priority 5 outranks Access control policy, Sensor calibration interval, and Log retention period entries held at 3, instructing enforcement engines to allocate remediation bandwidth, escalation paths, and exception-approval hierarchies accordingly. Severity labels—Low exposure, Warning threshold, Tolerable variance—supply qualitative bands that priority alone cannot capture; together they allow a Sensor calibration interval classified as Tolerable variance at priority 3 to be triaged differently from a Log retention period sharing Warning threshold severity at the same numeric rank. Language metadata (es, en, fr across the classification set) ensures that constraint expressions remain intelligible to accountable parties in jurisdictional context: an Access control policy rendered in Spanish and a Log retention period in French are not duplicate rules in translation drift but localized articulations of obligations whose identifiers (CLAS-0001 through CLAS-0004) remain stable for cross-system correlation.

**t_constraint_with_severity_classification**

| id | constraint | severity | priority | language |
| --- | --- | --- | --- | --- |
| CLAS-0001 | Access control policy | Low exposure | 3 | es |
| CLAS-0002 | PII encryption mandate | Warning threshold | 5 | en |
| CLAS-0003 | Sensor calibration interval | Tolerable variance | 3 | es |
| CLAS-0004 | Log retention period | Warning threshold | 3 | fr |
| CLAS-0005 | Lab containment level | Tolerable variance | 3 | ja |
| CLAS-0006 | Lab containment level | Standard baseline | 2 | fr |

Labeltext and miscellaneous auxiliary codes anchor operational telemetry to human meaning and internal taxonomies without overloading primary identifiers. In syscall audit surfaces, execve, mmap, and stat events acquire label_text values such as pre-release note, nightly summary, and calibration record—phrases that orient investigators toward intent and lifecycle phase rather than toward raw kernel opcode alone. The repetition of pre-release note across distinct stat and execve records demonstrates labeltext’s function as a semantic overlay: identical labels may classify different syscall families when contextual metadata (timestamps, actors, environments) disambiguates them, yet the shared label still supports cohort queries across release-candidate activity. Miscellaneous codes (D-33, B-12, E-21) provide compact, system-internal classifications that interoperate with ticketing, retention schedules, or evidence lockers; when two stat invocations share E-21, analysts infer a common evidentiary bucket even before reading labeltext, while divergent codes on mmap (B-12) signal a separate handling track. Taken together, identifier, subject, target, role, priority, language, labeltext, and misc form an interlocking metadata grammar: identifiers stabilize identity; subject–target–role triads encode directed, qualified relationships; priority and language operationalize constraints across urgency and locale; labeltext and misc translate low-level events into governable, narratable objects suitable for compliance handbooks and operational guides alike.

**t_syscall_basic**

| id | syscall | code | label_text |
| --- | --- | --- | --- |
| SYSC-0001 | execve | D-33 | pre-release note |
| SYSC-0002 | mmap | B-12 | nightly summary |
| SYSC-0003 | stat | E-21 | calibration record |
| SYSC-0004 | stat | E-21 | pre-release note |
| SYSC-0005 | socket | B-12 | audit excerpt |
| SYSC-0006 | ioctl | C-07 | pre-release note |
| SYSC-0007 | stat | C-07 | audit excerpt |
| SYSC-0008 | unlink | B-12 | calibration record |