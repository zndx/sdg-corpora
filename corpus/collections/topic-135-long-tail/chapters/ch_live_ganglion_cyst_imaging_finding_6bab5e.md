---
chapter_id: ch_live_ganglion_cyst_imaging_finding_6bab5e
topic_id: 135
family: 08_derived
cited_terms: ['ganglion_cyst_imaging_finding', 'allocation_with_input_facets', 'xdp_action_pass']
model: engine-refine
---

In metadata governance frameworks, the encoding of relational data assets requires a disciplined approach to identification, contextualization, and relationship modeling. At the foundation of such systems lies the identifier—a stable, machine-readable key that anchors every entity to a deterministic reference point. Consider how imaging findings for ganglion cysts are assigned identifiers such as FIND-0001 through FIND-0004, each corresponding to a distinct clinical observation like "Dorsal right ankle" or "Bilateral distal radius." Similarly, allocation records carry identifiers like FACE-0001 and data pipeline passes use identifiers such as PASS-0001. These identifiers are not arbitrary; they serve as the primary keys that enable referential integrity across the entire metadata graph, ensuring that every downstream relationship can be traced back to a single authoritative source record.

**t_ganglion_cyst_imaging_finding**

| id | ganglion_cyst_imaging_finding | visualizes | encoding | language |
| --- | --- | --- | --- | --- |
| FIND-0001 | Dorsal right ankle | MIP reconstruction | ascii | ja |
| FIND-0002 | Left medial malleolus | Sagittal PD FS | ascii | ja |
| FIND-0003 | Bilateral distal radius | Gadolinium enhanced T1 | latin1 | en |
| FIND-0004 | Right dorsal metatarsal | T2 weighted fat sat | unicode | ja |
| FIND-0005 | Palmar left thumb | Sagittal PD FS | unicode | de |
| FIND-0006 | Left scapholunate ligament | STIR sequence | unicode | en |
| FIND-0007 | Palmar left thumb | PD weighted fat sat | unicode | en |

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

Beyond identification, the encoding and language attributes provide the semantic context necessary for cross-system interoperability. When a ganglion cyst imaging finding is recorded, it carries an encoding specification—ascii, latin1, or unicode—that dictates how the textual content of the finding is serialized for storage and transmission. The language attribute further disambiguates the human-readable content, with values such as "ja" for Japanese or "en" for English appearing alongside clinical descriptions. This dual-layer of encoding and language metadata is critical in multi-tenant, multi-regional environments where the same imaging modality—whether a MIP reconstruction, a Sagittal PD FS sequence, or a Gadolinium enhanced T1 scan—must be rendered correctly across diverse client applications and regional data centers. Without explicit encoding and language declarations, textual data becomes ambiguous, risking misinterpretation in downstream analytics, reporting, or clinical decision support systems.

The relational backbone of the governance model is expressed through the subject-target-role triad, a pattern that appears consistently across different entity types. In the allocation domain, an allocation record such as "Quota Project Alpha" or "Model Training Run" is linked to an input facet—like "PostgreSQL Snapshot," "GraphQL Query Results," or "Raw JSON Logs"—through a role assignment that designates whether the allocation acts as owner, reviewer, or contributor to that facet. The same structural pattern governs data pipeline passes: an XDP action pass identified as "prod-ingest-xdp" or "compliance-xdp" is connected to specific actions such as "route-to-lake," "validate-schema," "sync-replica," or "tag-PII" via role designations of observer, owner, or contributor. This uniformity is intentional; it allows governance policies to be expressed once and applied across heterogeneous entity types, whether the subject is a resource allocation, a data pipeline, or an imaging finding.

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

The practical significance of this design becomes apparent when considering auditability and access control. Because every relationship between a subject and a target is mediated by an explicit role, governance frameworks can enforce fine-grained permissions based on the nature of the connection. An allocation that serves as the owner of an input facet may have write access, while a reviewer role might be restricted to read-only inspection, and a contributor role could permit modifications within defined boundaries. Similarly, in the pipeline domain, an observer role on an action like "tag-PII" might grant visibility without the ability to alter the tagging logic, whereas an owner role on "validate-schema" would carry full control. This role-based mediation ensures that the metadata graph is not merely a static catalog but an active governance substrate where permissions, responsibilities, and data lineage are all expressible through the same relational vocabulary.

**t_allocation_with_input_facets**

| id | allocation |
| --- | --- |
| FACE-0001 | Quota Project Alpha |
| FACE-0002 | Cluster Alpha Node |
| FACE-0003 | Model Training Run |
| FACE-0004 | Quota Project Alpha |
| FACE-0005 | Quota Project Alpha |
| FACE-0006 | Quota Project Alpha |
| FACE-0007 | Cluster Alpha Node |
| FACE-0008 | Quota Project Alpha |

**t_allocation_with_input_facets_input_facet**

| id | input_facet |
| --- | --- |
| FACE-0001 | PostgreSQL Snapshot |
| FACE-0002 | GraphQL Query Results |
| FACE-0003 | PostgreSQL Snapshot |
| FACE-0004 | Raw JSON Logs |
| FACE-0005 | GraphQL Query Results |
| FACE-0006 | User Event Stream |
| FACE-0007 | User Event Stream |

**t_allocation_with_input_facets__input_facet**

| id | allocation_id | input_facet_id | role |
| --- | --- | --- | --- |
| FACE-0001 | FACE-0007 | FACE-0005 | owner |
| FACE-0002 | FACE-0005 | FACE-0003 | reviewer |
| FACE-0003 | FACE-0003 | FACE-0002 | contributor |
| FACE-0004 | FACE-0001 | FACE-0007 | reviewer |
| FACE-0005 | FACE-0002 | FACE-0003 | reviewer |
| FACE-0006 | FACE-0001 | FACE-0001 | observer |
| FACE-0007 | FACE-0002 | FACE-0006 | observer |
| FACE-0008 | FACE-0007 | FACE-0006 | observer |