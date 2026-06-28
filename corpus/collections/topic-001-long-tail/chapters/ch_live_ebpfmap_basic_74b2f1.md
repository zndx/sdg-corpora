---
chapter_id: ch_live_ebpfmap_basic_74b2f1
topic_id: 1
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_basic', 'nist80053_low_impact', 'hipaa_safeguard_admin']
model: engine-refine
---

An identifier is the durable handle by which every governed object is addressed, reconciled, and cited across operational and compliance planes. In kernel instrumentation inventories, records such as EBPF-0001 through EBPF-0004 denote distinct eBPF map instances whose operational posture is captured separately from their descriptive classification; the identifier therefore anchors both the measured fact—size_bytes of 208979093 on EBPF-0001, version 3—and the dimensional label "Ebpfmap Label 01" under "Ebpfmap Category 01." Where identifiers diverge from secondary keys, as when EBPF-0001 carries ebpfmap_key EBPF-0002 while EBPF-0004 resolves to EBPF-0001, the registry encodes lineage or aliasing rather than naive one-to-one naming, a distinction material to change control because version 12 on EBPF-0003 and version 5 on EBPF-0004 must be evaluated against the correct logical map, not merely the row key displayed in a given extract.

**fact_ebpfmap**

| id | ebpfmap_key | size_bytes | version |
| --- | --- | --- | --- |
| EBPF-0001 | EBPF-0002 | 208979093 | 3 |
| EBPF-0002 | EBPF-0005 | 156714508 | 6 |
| EBPF-0003 | EBPF-0003 | 31105012 | 12 |
| EBPF-0004 | EBPF-0001 | 354373995 | 5 |
| EBPF-0005 | EBPF-0002 | 866267293 | 2 |

The ebpfmap construct names a kernel-resident map whose governance significance lies in bounded memory consumption and revision discipline. size_bytes quantifies resident footprint across a wide operational band—from 31105012 on EBPF-0003 to 354373995 on EBPF-0004—so capacity planning, audit sampling, and incident triage can prioritize maps that dominate address space or exhibit drift between reporting cycles. version records the artifact generation under review; coexistence of version 3, 6, 12, and 5 across the EBPF-0001–EBPF-0004 population signals heterogeneous rollout states that compliance officers must not collapse into a single "current" designation without cross-walking ebpfmap_key and identifier. category supplies the taxonomic frame—here, four distinct Ebpfmap Category labels paired one-to-one with identifiers—so policy filters (production versus diagnostic, per-namespace versus host-global) can be applied before numeric thresholds trigger escalation.

Entity–attribute modeling extends the same identifier discipline to regulatory objects whose obligations are typed, valued, and partitioned by data shape. An entity, such as ADMI-0001 through ADMI-0004 under HIPAA administrative safeguards, is the thing subject to control: Privacy Rule with Audit Controls, Security Rule with Omnibus Modification, Transactions Rule with e-Signature Rule, Contingency Plan with Security Policy. attr declares which facet of that entity is being asserted—effective_date, enforcement, mandatory, priority—while attr_type fixes the validation and storage contract: xsd:date, xsd:string, xsd:boolean, xsd:integer. Typed value relations then bind entity_id and attr_id so that mandatory resolves to true on ADMI-0001 and false on ADMI-0002, effective_date resolves to 2024-01-07 and 2023-01-18 on the same attribute across different entities, and priority on ADMI-0002 records 309 where ADMI-0001 records 1. misc carries the literal payload that attr_type alone cannot express—boolean truth values, calendar dates, integer ranks, and varchar text such as "Encoding 01," "Enforcement 02," "change rationale," and "fr"—so auditors inspect meaning at the value layer while architects retain schema regularity at the definition layer.

**t_hipaa_safeguard_admin**

| id | hipaa | hipaa_safeguard |
| --- | --- | --- |
| ADMI-0001 | Privacy Rule | Audit Controls |
| ADMI-0002 | Security Rule | Omnibus Modification |
| ADMI-0003 | Transactions Rule | e-Signature Rule |
| ADMI-0004 | Contingency Plan | Security Policy |
| ADMI-0005 | Audit Controls | Access Control |
| ADMI-0006 | Unique ID Rule | Unique ID Rule |
| ADMI-0007 | HITECH Amendment | Incident Response |

**t_hipaa_safeguard_admin_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ADMI-0001 | effective_date | xsd:date |
| ADMI-0002 | enforcement | xsd:string |
| ADMI-0003 | mandatory | xsd:boolean |
| ADMI-0004 | priority | xsd:integer |
| ADMI-0005 | review_cycle_days | xsd:integer |
| ADMI-0006 | scope | xsd:string |
| ADMI-0007 | encoding | xsd:string |
| ADMI-0008 | label_text | xsd:string |

**t_hipaa_safeguard_admin_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ADMI-0001 | ADMI-0001 | ADMI-0003 | true |
| ADMI-0002 | ADMI-0002 | ADMI-0003 | false |
| ADMI-0003 | ADMI-0003 | ADMI-0003 | true |
| ADMI-0004 | ADMI-0004 | ADMI-0003 | false |
| ADMI-0005 | ADMI-0005 | ADMI-0003 | true |
| ADMI-0006 | ADMI-0006 | ADMI-0003 | false |
| ADMI-0007 | ADMI-0007 | ADMI-0003 | false |

**t_hipaa_safeguard_admin_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ADMI-0001 | ADMI-0001 | ADMI-0001 | 2024-01-07 |
| ADMI-0002 | ADMI-0002 | ADMI-0001 | 2023-01-18 |
| ADMI-0003 | ADMI-0003 | ADMI-0001 | 2025-04-08 |
| ADMI-0004 | ADMI-0004 | ADMI-0001 | 2024-08-23 |
| ADMI-0005 | ADMI-0005 | ADMI-0001 | 2023-10-19 |
| ADMI-0006 | ADMI-0006 | ADMI-0001 | 2024-11-12 |
| ADMI-0007 | ADMI-0007 | ADMI-0001 | 2023-08-20 |

**t_hipaa_safeguard_admin_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ADMI-0001 | ADMI-0001 | ADMI-0004 | 1 |
| ADMI-0002 | ADMI-0001 | ADMI-0005 | 309 |
| ADMI-0003 | ADMI-0002 | ADMI-0004 | 1 |
| ADMI-0004 | ADMI-0002 | ADMI-0005 | 623 |
| ADMI-0005 | ADMI-0003 | ADMI-0004 | 3 |
| ADMI-0006 | ADMI-0003 | ADMI-0005 | 849 |
| ADMI-0007 | ADMI-0004 | ADMI-0004 | 5 |
| ADMI-0008 | ADMI-0004 | ADMI-0005 | 665 |

**t_hipaa_safeguard_admin_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ADMI-0001 | ADMI-0001 | ADMI-0007 | Encoding 01 |
| ADMI-0002 | ADMI-0001 | ADMI-0002 | Enforcement 02 |
| ADMI-0003 | ADMI-0001 | ADMI-0008 | change rationale |
| ADMI-0004 | ADMI-0001 | ADMI-0009 | fr |
| ADMI-0005 | ADMI-0001 | ADMI-0006 | Scope 05 |
| ADMI-0006 | ADMI-0002 | ADMI-0007 | Encoding 06 |
| ADMI-0007 | ADMI-0002 | ADMI-0002 | Enforcement 07 |
| ADMI-0008 | ADMI-0002 | ADMI-0008 | audit excerpt |

Subject–target–role triples formalize directed relationships among framework artifacts where neither endpoint is reducible to a flat attribute. In the NIST low-impact corpus, IMPA-0001 is associated with SP 800-171 Rev 2 at baseline while IMPA-0003 maps to CSF 1.1 at minimal impact; a separate association plane links nist_id as subject to at_n_i_s_t_impact_level_id as target, yielding, for example, IMPA-0001 related to IMPA-0004 with role reviewer, IMPA-0002 to IMPA-0008 as observer, and IMPA-0001 again to IMPA-0006 as contributor. role therefore governs participation semantics—review authority versus observational accountability versus contributory input—so access reviews, evidence collection, and separation-of-duties checks reference the relationship record, not the bare existence of either identifier. The same IMPA- prefix family spans x and y coordinates (nist framework designation and at_n_i_s_t_impact_level placement), which is why subject and target are modeled as foreign identifiers rather than inlined strings: SP 800-37 Rev 2 and category 1 can evolve independently while the junction row preserves who acted in what capacity.

**t_nist80053_low_impact**

| id | nist |
| --- | --- |
| IMPA-0001 | SP 800-171 Rev 2 |
| IMPA-0002 | SP 800-37 Rev 2 |
| IMPA-0003 | CSF 1.1 |
| IMPA-0004 | RMF Guide |
| IMPA-0005 | CSF 1.1 |
| IMPA-0006 | SP 800-218 |
| IMPA-0007 | SP 800-37 Rev 2 |
| IMPA-0008 | CSF 1.1 |

**t_nist80053_low_impact_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level |
| --- | --- |
| IMPA-0001 | baseline |
| IMPA-0002 | category 1 |
| IMPA-0003 | minimal |
| IMPA-0004 | category 1 |
| IMPA-0005 | minimal |
| IMPA-0006 | minimal |
| IMPA-0007 | baseline |
| IMPA-0008 | low impact |

**t_nist80053_low_impact__at_n_i_s_t_impact_level**

| id | nist_id | at_n_i_s_t_impact_level_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0001 | IMPA-0004 | reviewer |
| IMPA-0002 | IMPA-0003 | IMPA-0008 | observer |
| IMPA-0003 | IMPA-0002 | IMPA-0006 | observer |
| IMPA-0004 | IMPA-0001 | IMPA-0006 | contributor |
| IMPA-0005 | IMPA-0007 | IMPA-0003 | owner |
| IMPA-0006 | IMPA-0001 | IMPA-0002 | reviewer |
| IMPA-0007 | IMPA-0007 | IMPA-0001 | contributor |
| IMPA-0008 | IMPA-0008 | IMPA-0008 | reviewer |

In practice, these constructs interlock during assessments and continuous monitoring. An operator reconciles ebpfmap footprint and version against category-scoped baselines; a compliance analyst traces HIPAA entities through attr_type into the correct typed value store to confirm that mandatory=false on ADMI-0002 is intentional rather than a serialization error; a risk officer traverses NIST subjects and targets to verify that observer assignments on IMPA-0002 and IMPA-0003 do not coincide with contributor privileges on overlapping control paths. identifier stability is the spine; category, version, and size_bytes supply operational context; entity, attr, and attr_type supply definitional rigor; misc supplies evidentiary specificity; subject, target, and role supply relational accountability. Taken together, they implement a reference architecture in which every citation—EBPF-0003 at 31105012 bytes, ADMI-0004 effective 2024-08-23, IMPA-0004 at category 1—remains traceable to a governed object, a typed assertion, or a directed duty, without collapsing distinct governance dimensions into a single undifferentiated field.

**dim_ebpfmap**

| id | ebpfmap_label | ebpfmap_category |
| --- | --- | --- |
| EBPF-0001 | Ebpfmap Label 01 | Ebpfmap Category 01 |
| EBPF-0002 | Ebpfmap Label 02 | Ebpfmap Category 02 |
| EBPF-0003 | Ebpfmap Label 03 | Ebpfmap Category 03 |
| EBPF-0004 | Ebpfmap Label 04 | Ebpfmap Category 04 |
| EBPF-0005 | Ebpfmap Label 05 | Ebpfmap Category 05 |
| EBPF-0006 | Ebpfmap Label 06 | Ebpfmap Category 06 |