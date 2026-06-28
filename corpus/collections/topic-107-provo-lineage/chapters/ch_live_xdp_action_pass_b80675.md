---
chapter_id: ch_live_xdp_action_pass_b80675
topic_id: 107
family: 07_long_tail
cited_terms: ['xdp_action_pass', 'schemaorg_person_birthplace', 'control_implements']
model: engine-refine
---

Data lineage and governance in distributed processing environments rest on a layered architecture of identifiers, versioned assets, and role-based access controls. At the core of the ingestion layer, XDP action passes—identified by codes such as PASS-0001 through PASS-0004—represent discrete processing pipelines, each associated with a named stream like prod-ingest-xdp, edge-telemetry-xdp, or compliance-xdp. These passes are not monolithic; they decompose into granular actions including route-to-lake, validate-schema, sync-replica, and tag-PII, each assigned to a pass through a junction structure that simultaneously records the participant's role. Within this relational matrix, a single pass may carry multiple action assignments, with roles ranging from observer to owner to contributor, thereby establishing an auditable chain of responsibility across the processing topology.

**t_xdp_action_pass**

| id | xdp |
| --- | --- |
| PASS-0001 | prod-ingest-xdp |
| PASS-0002 | edge-telemetry-xdp |
| PASS-0003 | compliance-xdp |
| PASS-0004 | prod-ingest-xdp |
| PASS-0005 | streaming-fabric-xdp |
| PASS-0006 | cloud-sync-xdp |

**t_xdp_action_pass_x_d_p_action**

| id | x_d_p_action |
| --- | --- |
| PASS-0001 | route-to-lake |
| PASS-0002 | validate-schema |
| PASS-0003 | sync-replica |
| PASS-0004 | tag-PII |
| PASS-0005 | drop-invalid |
| PASS-0006 | encrypt-payload |

**t_xdp_action_pass__x_d_p_action**

| id | xdp_id | x_d_p_action_id | role |
| --- | --- | --- | --- |
| PASS-0001 | PASS-0001 | PASS-0005 | observer |
| PASS-0002 | PASS-0002 | PASS-0004 | owner |
| PASS-0003 | PASS-0005 | PASS-0003 | observer |
| PASS-0004 | PASS-0005 | PASS-0005 | contributor |
| PASS-0005 | PASS-0003 | PASS-0006 | observer |
| PASS-0006 | PASS-0005 | PASS-0006 | contributor |
| PASS-0007 | PASS-0005 | PASS-0001 | observer |
| PASS-0008 | PASS-0002 | PASS-0001 | contributor |

Governance controls overlay this operational fabric by binding policy mandates to specific passes through an implementation registry. Controls such as the Change Advisory Board, Data Retention Schedule, and Access Review Cycle are mapped to passes with explicit priority ratings and scope designations. A control implementing PASS-0003 carries priority 1 with team-level scope, whereas the same Data Retention Schedule applied to PASS-0003 in a different context may carry priority 3 and team scope, demonstrating that priority and scope are contextual attributes rather than intrinsic properties of the control itself. The priority scale spans from 1 to 5, enabling risk-based triage, while scope distinguishes between regional, global, and team boundaries—critical for organizations operating across jurisdictions.

Versioned data assets are tracked through a fact table that records size in bytes and semantic version numbers alongside a birthplace key that anchors each asset to its origin. Assets range from approximately 114 million bytes to nearly 900 million bytes, with versions spanning from 3 through 8, reflecting iterative refinement over time. The birthplace key functions as a foreign key reference to a dimension table that classifies origins by label and category. Labels such as Birthplace Label 01 through Birthplace Label 04 pair with categories like Birthplace Category 01 through Birthplace Category 04, providing a two-tier taxonomy for origin classification that supports filtering, aggregation, and compliance reporting.

**fact_schemaorg**

| id | birthplace_key | size_bytes | version |
| --- | --- | --- | --- |
| BIRT-0001 | BIRT-0006 | 895265030 | 3 |
| BIRT-0002 | BIRT-0002 | 114301972 | 5 |
| BIRT-0003 | BIRT-0001 | 338701831 | 4 |
| BIRT-0004 | BIRT-0005 | 998785819 | 8 |

The interplay between these structures enables traceability from high-level governance mandates down to individual processing actions and their underlying data assets. A compliance-xdp pass tagged with the tag-PII action falls under the purview of a priority-1 control with team scope, while the data it processes carries a version number, a byte size, and a birthplace classification that together establish provenance. This multi-dimensional linking—where identifiers serve as keys across passes, actions, controls, and assets—ensures that every data element can be traced to its processing context, its governing control, and its origin category, forming the backbone of an auditable data governance framework.

**dim_birthplace**

| id | birthplace_label | birthplace_category |
| --- | --- | --- |
| BIRT-0001 | Birthplace Label 01 | Birthplace Category 01 |
| BIRT-0002 | Birthplace Label 02 | Birthplace Category 02 |
| BIRT-0003 | Birthplace Label 03 | Birthplace Category 03 |
| BIRT-0004 | Birthplace Label 04 | Birthplace Category 04 |
| BIRT-0005 | Birthplace Label 05 | Birthplace Category 05 |
| BIRT-0006 | Birthplace Label 06 | Birthplace Category 06 |

**t_control_implements**

| id | control | implements | priority | scope |
| --- | --- | --- | --- | --- |
| IMPL-0001 | Change Advisory Board | PASS-0006 | 5 | regional |
| IMPL-0002 | Data Retention Schedule | PASS-0005 | 3 | global |
| IMPL-0003 | Access Review Cycle | PASS-0003 | 1 | team |
| IMPL-0004 | Data Retention Schedule | PASS-0003 | 3 | team |
| IMPL-0005 | GDPR Data Minimization | PASS-0005 | 1 | global |
| IMPL-0006 | Incident Response Protocol | PASS-0006 | 1 | global |
| IMPL-0007 | NIST SP 800-53 | PASS-0005 | 2 | local |