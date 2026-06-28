---
chapter_id: ch_live_ebpfprogram_min_one_hook_664dbb
topic_id: 158
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_min_one_hook', 'policy_applies_to', 'schemaorg_place_longitude']
model: engine-refine
---

The architecture of programmatic observability and policy governance rests upon a disciplined separation of concerns between runtime behavior, classification metadata, and temporal enforcement. eBPF programs, the fundamental units of kernel-level instrumentation, are characterized by their attachment points—hooks into the operating system's execution paths—and by their physical footprint and revision state. A program identified as HOOK-0001, for instance, attaches to hook HOOK-0006 and occupies 784,335,640 bytes of memory at version 12, while its counterpart HOOK-0003, also at version 12, targets hook HOOK-0001 with a considerably smaller footprint of 113,209,263 bytes. These programs do not exist in isolation; each attaches_to_hook relationship is enriched by a dimension table that supplies human-readable labels and categorical classifications. The label Attaches To Hook Label 01 and the category Attaches To Hook Category 01 together provide the descriptive and taxonomic context necessary for operators to distinguish between, say, network ingress hooks and filesystem tracepoints without consulting raw identifiers.

Policy application introduces a temporal dimension that governs when organizational directives become operative. The policy registry records not only which policies apply to which assets—Cloud Security Baseline to API Gateway Endpoints, Zero Trust Architecture Guideline to HR Personnel Files—but also the effective_date that anchors each directive in time. The GDPR Compliance Directive, for example, carries an effective_date of 2024-06-14, while the Data Retention Standard took effect earlier, on 2024-05-03. Each policy entry is further annotated with a label_text that serves as a contextual marker within audit workflows: audit excerpt, nightly summary, and pre-release note appear as distinct annotations, enabling compliance officers to trace which policy statements were active during specific review cycles or deployment windows. The identifier APPL-0001 through APPL-0004 provides the stable key that links these policy records to downstream enforcement logs and reporting artifacts.

Geospatial and semantic relationships between entities follow a similar pattern of subject-target-role decomposition. The schema.org place registry maps named locations—HooverDam, MaunaLoaObservatory, GoldenGateBridge, ISSOrbitModule—to their longitudinal coordinates, with the junction table t_schemaorg_place_longitude__longitude encoding the relationship between a subject (the place entity) and a target (the longitude entity) through an explicit role attribute. A place identified as LONG-0003 assumes the role of owner over its own longitude LONG-0001, while LONG-0005 assumes the role of reviewer over longitude LONG-0002, and LONG-0007 serves as contributor to longitude LONG-0004. This tripartite structure—subject, target, role—allows the same coordinate to participate in multiple relationship contexts, each with a distinct governance or provenance meaning.

**t_schemaorg_place_longitude**

| id | schemaorg |
| --- | --- |
| LONG-0001 | HooverDam |
| LONG-0002 | MaunaLoaObservatory |
| LONG-0003 | GoldenGateBridge |
| LONG-0004 | ISSOrbitModule |
| LONG-0005 | CERNControlCenter |
| LONG-0006 | PaloAltoResearchCenter |
| LONG-0007 | BlackRockForest |

**t_schemaorg_place_longitude_longitude**

| id | longitude |
| --- | --- |
| LONG-0001 | -27.9692 |
| LONG-0002 | 2.2945 |
| LONG-0003 | -3.3869 |
| LONG-0004 | 2.2945 |
| LONG-0005 | -27.0366 |
| LONG-0006 | -27.0366 |

**t_schemaorg_place_longitude__longitude**

| id | schemaorg_id | longitude_id | role |
| --- | --- | --- | --- |
| LONG-0001 | LONG-0005 | LONG-0002 | reviewer |
| LONG-0002 | LONG-0007 | LONG-0004 | contributor |
| LONG-0003 | LONG-0003 | LONG-0001 | owner |
| LONG-0004 | LONG-0003 | LONG-0003 | owner |
| LONG-0005 | LONG-0002 | LONG-0003 | reviewer |
| LONG-0006 | LONG-0001 | LONG-0003 | contributor |
| LONG-0007 | LONG-0004 | LONG-0002 | reviewer |
| LONG-0008 | LONG-0007 | LONG-0006 | contributor |

Across all these domains, the identifier column serves as the universal binding mechanism, appearing in every table as the primary key that enables cross-referencing without ambiguity. Whether the identifier takes the form HOOK-0001 for an eBPF program, APPL-0001 for a policy, or LONG-0001 for a geospatial entity, it provides the stable reference point that makes relational integrity possible. The version column in the program fact table and the effective_date in the policy table both serve as temporal markers, though at different granularities: version 9, 11, and 12 denote discrete software revisions, while dates like 2023-03-13 and 2025-01-11 anchor policy enforcement to calendar time. Together, these fields—attaches_to_hook, category, effectivedate, identifier, labeltext, misc, role, size_bytes, subject, target, version—constitute the minimal vocabulary required to describe, classify, and govern the behavior of software systems, the policies that constrain them, and the spatial and semantic relationships that give them context.

**fact_ebpfprogram**

| id | attaches_to_hook_key | size_bytes | version |
| --- | --- | --- | --- |
| HOOK-0001 | HOOK-0006 | 784335640 | 12 |
| HOOK-0002 | HOOK-0006 | 641704069 | 9 |
| HOOK-0003 | HOOK-0001 | 113209263 | 11 |
| HOOK-0004 | HOOK-0002 | 161013093 | 12 |
| HOOK-0005 | HOOK-0002 | 352203820 | 12 |
| HOOK-0006 | HOOK-0006 | 167519051 | 1 |

**dim_attaches_to_hook**

| id | attaches_to_hook_label | attaches_to_hook_category |
| --- | --- | --- |
| HOOK-0001 | Attaches To Hook Label 01 | Attaches To Hook Category 01 |
| HOOK-0002 | Attaches To Hook Label 02 | Attaches To Hook Category 02 |
| HOOK-0003 | Attaches To Hook Label 03 | Attaches To Hook Category 03 |
| HOOK-0004 | Attaches To Hook Label 04 | Attaches To Hook Category 04 |
| HOOK-0005 | Attaches To Hook Label 05 | Attaches To Hook Category 05 |
| HOOK-0006 | Attaches To Hook Label 06 | Attaches To Hook Category 06 |

**t_policy_applies_to**

| id | policy | applies_to | effective_date | label_text |
| --- | --- | --- | --- | --- |
| APPL-0001 | Cloud Security Baseline | API Gateway Endpoints | 2025-01-11 | audit excerpt |
| APPL-0002 | Zero Trust Architecture Guideline | HR Personnel Files | 2023-03-13 | nightly summary |
| APPL-0003 | GDPR Compliance Directive | Kubernetes Clusters | 2024-06-14 | nightly summary |
| APPL-0004 | Data Retention Standard | Customer PII Datasets | 2024-05-03 | pre-release note |
| APPL-0005 | Cloud Security Baseline | Financial Reporting Systems | 2024-11-13 | nightly summary |
| APPL-0006 | Incident Response Procedure | Kubernetes Clusters | 2023-05-19 | change rationale |
| APPL-0007 | Zero Trust Architecture Guideline | Kubernetes Clusters | 2024-07-03 | nightly summary |