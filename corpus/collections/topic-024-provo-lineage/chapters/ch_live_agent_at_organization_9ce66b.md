---
chapter_id: ch_live_agent_at_organization_9ce66b
topic_id: 24
family: 05_provo_lineage
cited_terms: ['agent_at_organization', 'frame_refinement', 'client_data_record']
model: engine-refine
---

The governance of institutional agents is meticulously cataloged within the organizational registry, where each entry—such as the identifier `ORGA-0001`—anchors a specific operational mandate to its respective domain. Here, the `agent` column delineates the functional role of the entity, whether it be a `backup-scheduler` operating within `data-governance` or a `cert-manager` embedded in `security-ops`. The temporal provenance of these assignments is preserved through the `createddate` field, marking the inception of the relationship, as seen in the transition from the earlier establishment of `2023-09-23` to the more recent `2025-01-23` entry for the `risk-assessor` in `quality-assurance`. Crucially, the `owner` attribute assigns ultimate accountability, designating groups such as `ml-infra`, `analytics`, or `sre` as the stewards of these operational assets, thereby ensuring a clear chain of custody and administrative responsibility.

**t_agent_at_organization**

| id | agent | at_organization | created_date | owner |
| --- | --- | --- | --- | --- |
| ORGA-0001 | backup-scheduler | data-governance | 2025-01-04 | ml-infra |
| ORGA-0002 | cert-manager | security-ops | 2023-09-23 | analytics |
| ORGA-0003 | risk-assessor | cloud-infrastructure | 2024-03-21 | ml-infra |
| ORGA-0004 | risk-assessor | quality-assurance | 2025-01-23 | sre |
| ORGA-0005 | risk-assessor | network-operations | 2024-08-08 | analytics |
| ORGA-0006 | pipeline-runner | infrastructure-security | 2024-08-22 | platform-team |

Parallel to organizational structuring, the taxonomy of frame refinements establishes a rigorous hierarchy of conceptual specificity. The refinement registry serves as the locus for these definitions, where identifiers like `REFI-0001` correspond to precise constructs such as the `Regulatory Audit Trail` or the `Data Lake Partition Schema`. These refined frames do not exist in isolation; rather, they are explicitly linked to their parent concepts through the `refines_frame` column, which maps the `Regulatory Audit Trail` to the broader `Ground Station Uplink`, or the `Lab Sample Container Type` to the `Sterile Container Variant`. This structural mapping ensures that granular operational standards are traceable back to their foundational architectural or procedural origins, such as the `IPv4 Header Format` or the `Ku Band Downlink`.

**t_frame_refinement**

| id | frame |
| --- | --- |
| REFI-0001 | Regulatory Audit Trail |
| REFI-0002 | Lab Sample Container Type |
| REFI-0003 | Data Lake Partition Schema |
| REFI-0004 | Regulatory Audit Trail |
| REFI-0005 | Data Lake Partition Schema |
| REFI-0006 | ISO 9001 Quality Framework |

**t_frame_refinement_refines_frame**

| id | refines_frame |
| --- | --- |
| REFI-0001 | Ground Station Uplink |
| REFI-0002 | Sterile Container Variant |
| REFI-0003 | IPv4 Header Format |
| REFI-0004 | Ku Band Downlink |
| REFI-0005 | Sterile Container Variant |
| REFI-0006 | Ground Station Uplink |

The intricate web of relationships between these frames is further elucidated by the cross-referencing mechanisms within the relational matrix, where the `subject` and `target` columns define the directional flow of influence. In this schema, an identifier such as `REFI-0001` may act as a subject refining `REFI-0004`, while simultaneously assuming the role of `observer` in relation to other entities. The `role` column is paramount here, distinguishing between the `owner` who dictates the frame's evolution, the `contributor` who provides substantive input, and the `reviewer` who validates compliance. For instance, the interplay between `REFI-0005` and `REFI-0006` is governed by these assigned roles, ensuring that every refinement is subjected to appropriate oversight and that the lineage of each conceptual artifact is fully auditable.

**t_frame_refinement__refines_frame**

| id | frame_id | refines_frame_id | role |
| --- | --- | --- | --- |
| REFI-0001 | REFI-0005 | REFI-0004 | observer |
| REFI-0002 | REFI-0006 | REFI-0005 | owner |
| REFI-0003 | REFI-0003 | REFI-0006 | contributor |
| REFI-0004 | REFI-0002 | REFI-0005 | reviewer |
| REFI-0005 | REFI-0003 | REFI-0006 | contributor |
| REFI-0006 | REFI-0004 | REFI-0004 | owner |
| REFI-0007 | REFI-0005 | REFI-0003 | owner |
| REFI-0008 | REFI-0002 | REFI-0006 | contributor |

Finally, the operational reality of these structures is quantified through the client fact tables, which aggregate activity and categorize content with precision. The client fact registry tracks the volume of interactions via the `event_count` column, capturing the intensity of activity for identifiers like `RECO-0003`, which registers a substantial `282` events, contrasted against the more subdued `42` events recorded for `RECO-0004`. These facts are inextricably bound to their constituent parts via the `contains` key, linking a parent record to its children, such as `RECO-0006` or `RECO-0005`. The semantic context of these contained elements is provided by the dimension table, which assigns descriptive `misc` labels—such as `Contains Label 01`—and classifies them into distinct `category` buckets like `Contains Category 01`, thereby transforming raw event data into a structured, analyzable repository of institutional knowledge.

**fact_client**

| id | contains_key | event_count |
| --- | --- | --- |
| RECO-0001 | RECO-0006 | 225 |
| RECO-0002 | RECO-0005 | 129 |
| RECO-0003 | RECO-0002 | 282 |
| RECO-0004 | RECO-0002 | 42 |
| RECO-0005 | RECO-0003 | 486 |
| RECO-0006 | RECO-0004 | 89 |

**dim_contains**

| id | contains_label | contains_category |
| --- | --- | --- |
| RECO-0001 | Contains Label 01 | Contains Category 01 |
| RECO-0002 | Contains Label 02 | Contains Category 02 |
| RECO-0003 | Contains Label 03 | Contains Category 03 |
| RECO-0004 | Contains Label 04 | Contains Category 04 |
| RECO-0005 | Contains Label 05 | Contains Category 05 |
| RECO-0006 | Contains Label 06 | Contains Category 06 |