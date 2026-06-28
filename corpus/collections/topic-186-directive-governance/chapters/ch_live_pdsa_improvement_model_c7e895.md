---
chapter_id: ch_live_pdsa_improvement_model_c7e895
topic_id: 186
family: 08_derived
cited_terms: ['pdsa_improvement_model', 'perf_buffer_map_subclass', 'perf_event_subclass']
model: engine-refine
---

Identifiers anchor every auditable artifact in a governed improvement and operations environment: they are stable, human- and machine-readable keys that survive renaming, version churn, and cross-system exchange. A PDSA improvement model such as Opioid-Taper-Init or Sepsis-Protocol-V2 is registered once under MODE-0001 or MODE-0003 and thereafter referenced exclusively by that identifier in downstream linkage, attribution, and reporting. The same principle applies outside clinical quality work. Performance buffer mappings and event subclasses likewise persist as MAP-0001 through MAP-0004 or EVEN-0001 through EVEN-0004. An identifier is not merely a surrogate primary key; in compliance terms it is the durable handle on which accountability, lineage, and reconciliation depend. Without it, two reviewers cannot agree whether they are discussing the same initiative, configuration, or measurement substrate.

**t_pdsa_improvement_model**

| id | p_d_s_a_improvement_model |
| --- | --- |
| MODE-0001 | Opioid-Taper-Init |
| MODE-0002 | Insulin-Protocol-Opt |
| MODE-0003 | Sepsis-Protocol-V2 |
| MODE-0004 | Bedside-Handoff-Rev |
| MODE-0005 | Fall-Prevention-Q4 |
| MODE-0006 | Bedside-Handoff-Rev |

**t_pdsa_improvement_model_improves**

| id | improves |
| --- | --- |
| MODE-0001 | Wound-Care-Standard |
| MODE-0002 | Wound-Care-Standard |
| MODE-0003 | Hand-Hygiene-Protocol |
| MODE-0004 | Wound-Care-Standard |
| MODE-0005 | Medication-Reconciliation |
| MODE-0006 | Ventilator-Management |
| MODE-0007 | Ventilator-Management |
| MODE-0008 | Wound-Care-Standard |

**t_pdsa_improvement_model_optimizes**

| id | optimizes |
| --- | --- |
| MODE-0001 | Pain-Management-Score |
| MODE-0002 | Complication-Rate |
| MODE-0003 | Adverse-Event-Frequency |
| MODE-0004 | Functional-Recovery-Time |
| MODE-0005 | LOS-Reduction |
| MODE-0006 | Complication-Rate |

**t_perf_buffer_map_subclass**

| id | perf | perf_buffer_config |
| --- | --- | --- |
| MAP-0001 | cassandra-perf | 256mb_ring_buffer |
| MAP-0002 | netperf-tcp | pagecount-1024 |
| MAP-0003 | iperf3-stream | 256mb_ring_buffer |
| MAP-0004 | tpch-10gb | align-64byte |
| MAP-0005 | spec-jbb2015 | hardware_counter_select |
| MAP-0006 | pgbench-default | pagecount-1024 |
| MAP-0007 | spark-stress | flush-threshold-256 |

**t_perf_event_subclass**

| id | perf | perf_event_config |
| --- | --- | --- |
| EVEN-0001 | thread_contention | pagecount-1024 |
| EVEN-0002 | disk_io_ops | eBPF_program_attach |
| EVEN-0003 | disk_io_ops | drop-oldest |
| EVEN-0004 | network_bytes | cpu_affinity_filter |
| EVEN-0005 | network_bytes | polling-sync |
| EVEN-0006 | jvm_heap_used | sampling_interval_10ms |

**t_perf_event_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | checksum | xsd:string |
| EVEN-0002 | created_date | xsd:date |
| EVEN-0003 | identifier | cco:DesignativeICE |
| EVEN-0004 | license | xsd:string |
| EVEN-0005 | mime_type | xsd:string |
| EVEN-0006 | size_bytes | xsd:long |
| EVEN-0007 | uri | xsd:string |
| EVEN-0008 | version | xsd:integer |

**t_perf_event_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0006 | 193 |
| EVEN-0002 | EVEN-0001 | EVEN-0008 | 8 |
| EVEN-0003 | EVEN-0002 | EVEN-0006 | 332 |
| EVEN-0004 | EVEN-0002 | EVEN-0008 | 11 |
| EVEN-0005 | EVEN-0003 | EVEN-0006 | 351 |
| EVEN-0006 | EVEN-0003 | EVEN-0008 | 10 |
| EVEN-0007 | EVEN-0004 | EVEN-0006 | 314 |
| EVEN-0008 | EVEN-0004 | EVEN-0008 | 12 |

PDSA improvement models name structured Plan-Do-Study-Act cycles that organizations deploy to change practice deliberately rather than by anecdote. Each model—Insulin-Protocol-Opt, Bedside-Handoff-Rev, and peers—expresses an intentional intervention hypothesis: what will be tried, how effect will be observed, and how learning will feed the next cycle. Those models do not float in isolation. They connect to clinical care, the concrete care processes and standards they are meant to strengthen. Wound-Care-Standard appears repeatedly as the clinical care target of multiple improvement efforts, while Hand-Hygiene-Protocol illustrates how a single model may align with a distinct infection-prevention standard. Separately, patient outcome captures the measurable end states improvement is obligated to move: Pain-Management-Score, Complication-Rate, Adverse-Event-Frequency, and Functional-Recovery-Time each define a legitimate optimization objective against which cycle data must be interpreted. Governance therefore treats pdsaimprovementmodel, clinicalcare, and patientoutcome as three distinct semantic classes—intervention, practice domain, and result—whose separation prevents conflating activity with impact.

Directed associations between these classes are expressed through subject and target, not as symmetric links but as governed assertions of influence or dependency. In an improves relationship, the subject is the improvement model asserting change and the target is the clinical care element it is claimed to affect; MODE-0001 may subject-link to a wound-care target while MODE-0004 subject-links to a hand-hygiene target. Optimizes relationships parallel that structure with patient outcomes as targets: a sepsis protocol model may optimize Adverse-Event-Frequency, while a handoff revision may optimize Functional-Recovery-Time. Role qualifies who or what capacity holds responsibility within each assertion—reviewer, contributor, or owner—so that approval chains, data stewardship, and escalation paths are explicit rather than inferred from org charts. A contributor on an improves edge is not interchangeable with an owner on an optimizes edge; the role field encodes duty of care over the relationship itself.

**t_pdsa_improvement_model__improves**

| id | pdsa_id | improves_id | role |
| --- | --- | --- | --- |
| MODE-0001 | MODE-0001 | MODE-0005 | reviewer |
| MODE-0002 | MODE-0001 | MODE-0006 | contributor |
| MODE-0003 | MODE-0004 | MODE-0003 | contributor |
| MODE-0004 | MODE-0005 | MODE-0004 | owner |
| MODE-0005 | MODE-0003 | MODE-0005 | contributor |
| MODE-0006 | MODE-0003 | MODE-0002 | owner |
| MODE-0007 | MODE-0001 | MODE-0008 | owner |
| MODE-0008 | MODE-0001 | MODE-0008 | observer |

Cardinality note exists because many-to-many and conditional relationships cannot be left implicit when auditors, analysts, or integrators must know whether duplication is permitted, expected, or forbidden. Notes such as Cardinality Note 01 through Cardinality Note 04 document constraints that pure foreign-key wiring would obscure: whether one model may optimize multiple outcomes, whether multiple models may claim the same outcome under different roles, or whether a reviewer assignment implies exclusivity. In operational practice, cardinality notes travel with the relationship row so that validation rules, interface contracts, and dashboard aggregations can enforce the intended multiplicity without hard-coding business logic that drifts from documented policy.

The attribute layer generalizes metadata description for entities whose shape varies by subclass or evolves over time. An attr names what is being described—checksum, created_date, identifier, license—while attr_type declares how that name must be interpreted and validated. Types drawn from XSD (`xsd:string`, `xsd:date`) enforce lexical and temporal formats; ontology-anchored types such as `cco:DesignativeICE` signal that the value participates in a designated identity or classification scheme, not free text. This separation matters in compliance handbooks because it allows a single entity—say cassandra-perf mapped to a 256mb_ring_buffer configuration—to carry a checksum string, a created_date, a designative identifier like `gid://svc/77`, and a license token CC-BY-4.0 without forcing a wide, sparse table that invites type errors and undocumented nulls.

**t_perf_buffer_map_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| MAP-0001 | checksum | xsd:string |
| MAP-0002 | created_date | xsd:date |
| MAP-0003 | identifier | cco:DesignativeICE |
| MAP-0004 | license | xsd:string |
| MAP-0005 | mime_type | xsd:string |
| MAP-0006 | size_bytes | xsd:long |
| MAP-0007 | uri | xsd:string |
| MAP-0008 | version | xsd:integer |

**t_perf_buffer_map_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0002 | 2023-01-21 |
| MAP-0002 | MAP-0002 | MAP-0002 | 2023-09-17 |
| MAP-0003 | MAP-0003 | MAP-0002 | 2023-07-22 |
| MAP-0004 | MAP-0004 | MAP-0002 | 2024-09-18 |
| MAP-0005 | MAP-0005 | MAP-0002 | 2025-02-25 |
| MAP-0006 | MAP-0006 | MAP-0002 | 2024-02-08 |
| MAP-0007 | MAP-0007 | MAP-0002 | 2024-05-18 |

**t_perf_buffer_map_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0006 | 60 |
| MAP-0002 | MAP-0001 | MAP-0008 | 11 |
| MAP-0003 | MAP-0002 | MAP-0006 | 123 |
| MAP-0004 | MAP-0002 | MAP-0008 | 12 |
| MAP-0005 | MAP-0003 | MAP-0006 | 190 |
| MAP-0006 | MAP-0003 | MAP-0008 | 10 |
| MAP-0007 | MAP-0004 | MAP-0006 | 100 |
| MAP-0008 | MAP-0004 | MAP-0008 | 1 |

**t_perf_buffer_map_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0001 | a3f9c21e |
| MAP-0002 | MAP-0001 | MAP-0003 | gid://svc/77 |
| MAP-0003 | MAP-0001 | MAP-0004 | CC-BY-4.0 |
| MAP-0004 | MAP-0001 | MAP-0009 | ap-south-2 |
| MAP-0005 | MAP-0001 | MAP-0005 | application/xml |
| MAP-0006 | MAP-0001 | MAP-0010 | Name 06 |
| MAP-0007 | MAP-0001 | MAP-0011 | governance |
| MAP-0008 | MAP-0001 | MAP-0012 | Tags 08 |

**t_perf_event_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0002 | 2024-03-08 |
| EVEN-0002 | EVEN-0002 | EVEN-0002 | 2023-08-29 |
| EVEN-0003 | EVEN-0003 | EVEN-0002 | 2025-04-08 |
| EVEN-0004 | EVEN-0004 | EVEN-0002 | 2024-10-09 |
| EVEN-0005 | EVEN-0005 | EVEN-0002 | 2024-06-29 |
| EVEN-0006 | EVEN-0006 | EVEN-0002 | 2025-04-11 |

Entity instances materialize those attribute definitions in the field: each MAP or EVEN record is an entity to which typed values attach. The misc designation marks the stored payload itself—the fact recorded—while physical storage splits by type so validators and retention policies can differ. Created dates land in date-valued stores (`2023-01-21`, `2024-03-08`); integer counters and thresholds in int stores (`60`, `193`); strings, URIs, licenses, and region codes in varchar stores (`a3f9c21e`, `oid:1.3.6.1`, `MPL-2.0`, `ap-south-2`). Operators and auditors therefore read misc not as miscellaneous clutter but as the evidentiary value bound to a specific entity–attribute pair. Together, identifier and entity establish what exists; attr and attr_type establish what may be said about it; subject, target, role, and cardinality_note establish how improvement models relate to clinical care and patient outcomes under explicit governance; and misc supplies the typed facts on which certification, performance benchmarking, and clinical quality reporting ultimately rest.

**t_pdsa_improvement_model__optimizes**

| id | pdsa_id | optimizes_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| MODE-0001 | MODE-0005 | MODE-0005 | reviewer | Cardinality Note 01 |
| MODE-0002 | MODE-0001 | MODE-0004 | owner | Cardinality Note 02 |
| MODE-0003 | MODE-0003 | MODE-0001 | contributor | Cardinality Note 03 |
| MODE-0004 | MODE-0005 | MODE-0004 | owner | Cardinality Note 04 |
| MODE-0005 | MODE-0005 | MODE-0003 | contributor | Cardinality Note 05 |
| MODE-0006 | MODE-0005 | MODE-0004 | observer | Cardinality Note 06 |
| MODE-0007 | MODE-0005 | MODE-0006 | owner | Cardinality Note 07 |
| MODE-0008 | MODE-0006 | MODE-0004 | reviewer | Cardinality Note 08 |

**t_perf_event_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | 9d2b7a16 |
| EVEN-0002 | EVEN-0001 | EVEN-0003 | oid:1.3.6.1 |
| EVEN-0003 | EVEN-0001 | EVEN-0004 | MPL-2.0 |
| EVEN-0004 | EVEN-0001 | EVEN-0009 | ap-south-2 |
| EVEN-0005 | EVEN-0001 | EVEN-0005 | application/json |
| EVEN-0006 | EVEN-0001 | EVEN-0010 | Name 06 |
| EVEN-0007 | EVEN-0001 | EVEN-0011 | data-engineering |
| EVEN-0008 | EVEN-0001 | EVEN-0012 | Tags 08 |