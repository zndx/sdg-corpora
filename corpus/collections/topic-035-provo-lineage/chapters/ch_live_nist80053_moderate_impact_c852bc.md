---
chapter_id: ch_live_nist80053_moderate_impact_c852bc
topic_id: 35
family: 07_long_tail
cited_terms: ['nist80053_moderate_impact', 'schemaorg_person_affiliation', 'agent_responsible_for']
model: engine-refine
---

In compliance and data-governance architectures, stable identifiers anchor every auditable assertion: each control mapping, affiliation record, and responsibility assignment resolves to a surrogate key that survives relabeling, reclassification, and schema revision. The moderate-impact slice of the NIST control corpus illustrates the pattern—IMPA-0001 through IMPA-0004 denote distinct impact-configuration records whose meaning is not carried by the token alone but by the relationships and attributes bound to it. Identifier discipline matters because regulators, assessors, and automated policy engines must cite the same entity across assessment cycles; when SP 800-53, SP 800-171, and SP 800-218 appear as distinct publication lineages within that quartet, the identifier remains the durable handle while the bibliographic reference may change with revision or scope.

**t_nist80053_moderate_impact**

| id | nist |
| --- | --- |
| IMPA-0001 | SP 800-53 |
| IMPA-0002 | SP 800-53 |
| IMPA-0003 | SP 800-171 |
| IMPA-0004 | SP 800-218 |
| IMPA-0005 | NIST AI RMF |
| IMPA-0006 | SP 800-171 |
| IMPA-0007 | SP 800-37 |

Affiliation situates facts inside an organizational or provenance context. In schema-aligned fact stores, affiliation is not merely decorative metadata but a first-class join key: AFFI-0001 through AFFI-0004 each carry an affiliation_key that may reference another affiliation record, yielding a directed graph of institutional or custodial lineage rather than a flat label list. Category and miscellaneous descriptive fields partition that graph for human retrieval and machine routing. Affiliation Category 01 through Affiliation Category 04 supply the taxonomic stratum—coarse enough for portfolio reporting, fine enough to separate tenants, business units, or data domains—while Affiliation Label 01 through Affiliation Label 04 provide the misc layer of display names and operational aliases that may be revised without invalidating foreign-key integrity. Together, category answers “what kind of actor or custodian is this?” and misc answers “what do operators call it today?”

**dim_affiliation**

| id | affiliation_label | affiliation_category |
| --- | --- | --- |
| AFFI-0001 | Affiliation Label 01 | Affiliation Category 01 |
| AFFI-0002 | Affiliation Label 02 | Affiliation Category 02 |
| AFFI-0003 | Affiliation Label 03 | Affiliation Category 03 |
| AFFI-0004 | Affiliation Label 04 | Affiliation Category 04 |
| AFFI-0005 | Affiliation Label 05 | Affiliation Category 05 |
| AFFI-0006 | Affiliation Label 06 | Affiliation Category 06 |

Subject and target formalize directed relationships between governed entities. In control-to-impact-level bindings, the subject is the control-family or publication anchor (for example, IMPA-0002 recurs as nist_id for two distinct junction rows, and IMPA-0006 and IMPA-0007 appear as subjects for SP 800-171 and SP 800-218 mappings), while the target is the impact-level artifact to which applicability is asserted—Moderate Threshold, System Security Moderate, Impact Level Moderate, and Moderate Baseline each correspond to IMPA-0007, IMPA-0004, IMPA-0001, and IMPA-0007 respectively in the crosswalk. The same subject–target grammar governs operational accountability: KafkaSource, LabSpectrometer, AuditDaemon, and ComplianceOfficer are named agents, but responsibility is materialized only when agent_id (subject) is paired with responsible_for_id (target) over domains such as CustomerTransactions, LabSamples, PipelineMetrics, and AuditTrail. This asymmetry is deliberate: subjects initiate or hold obligation; targets receive scrutiny, data flow, or control scope.

**t_agent_responsible_for**

| id | agent |
| --- | --- |
| RESP-0001 | KafkaSource |
| RESP-0002 | LabSpectrometer |
| RESP-0003 | AuditDaemon |
| RESP-0004 | ComplianceOfficer |
| RESP-0005 | MetadataIndexer |
| RESP-0006 | MetadataIndexer |
| RESP-0007 | SampleHandler |
| RESP-0008 | PipelineOrchestrator |

**t_agent_responsible_for_responsible_for**

| id | responsible_for |
| --- | --- |
| RESP-0001 | CustomerTransactions |
| RESP-0002 | LabSamples |
| RESP-0003 | PipelineMetrics |
| RESP-0004 | AuditTrail |
| RESP-0005 | ResearchDataset |
| RESP-0006 | PipelineMetrics |

**t_agent_responsible_for__responsible_for**

| id | agent_id | responsible_for_id | role |
| --- | --- | --- | --- |
| RESP-0001 | RESP-0004 | RESP-0004 | owner |
| RESP-0002 | RESP-0008 | RESP-0003 | reviewer |
| RESP-0003 | RESP-0007 | RESP-0004 | reviewer |
| RESP-0004 | RESP-0007 | RESP-0006 | observer |
| RESP-0005 | RESP-0007 | RESP-0003 | owner |
| RESP-0006 | RESP-0005 | RESP-0003 | reviewer |
| RESP-0007 | RESP-0007 | RESP-0004 | observer |
| RESP-0008 | RESP-0007 | RESP-0004 | observer |

Role qualifies the edge, not the node. Two rows may share identical subject and target types yet diverge in governance effect because role encodes permission, duty, or visibility. Within NIST moderate-impact crosswalks, IMPA-0001 and IMPA-0002 are tied as observers to their respective impact-level targets, IMPA-0003 acts as contributor, and IMPA-0004 as owner—distinctions that map directly to RACI-style accountability without collapsing “can see” into “must implement.” The agent responsibility lattice mirrors that semantics: owners, reviewers, and observers attach to RESP-0004, RESP-0003, RESP-0004, and RESP-0006 pairings so that pipeline metrics and audit trails do not inherit the same approval burden as customer transactions or lab samples. Role therefore converts a bipartite graph into an enforceable policy surface: access reviews, segregation-of-duties checks, and evidence-collection workflows all key off the edge label rather than entity type alone.

**t_nist80053_moderate_impact__at_n_i_s_t_impact_level**

| id | nist_id | at_n_i_s_t_impact_level_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0002 | IMPA-0007 | observer |
| IMPA-0002 | IMPA-0002 | IMPA-0004 | observer |
| IMPA-0003 | IMPA-0006 | IMPA-0001 | contributor |
| IMPA-0004 | IMPA-0007 | IMPA-0007 | owner |
| IMPA-0005 | IMPA-0003 | IMPA-0002 | owner |
| IMPA-0006 | IMPA-0004 | IMPA-0005 | observer |
| IMPA-0007 | IMPA-0001 | IMPA-0006 | contributor |
| IMPA-0008 | IMPA-0003 | IMPA-0007 | owner |

Version and size_bytes belong to the evidentiary plane—the measurable state of artifacts that identifiers and affiliations describe. Version integers (3, 5, 4, and 8 across the four affiliation-bound facts) timestamp logical snapshots of schema or dataset lineage, supporting reproducibility when an assessor must reconstruct which control interpretation or metadata shape was in force during a reporting period. Size_bytes (ranging from roughly 1.1×10⁸ to 9.9×10⁸ in the recorded facts) supplies operational mass: storage planning, transfer-risk scoring, and integrity checks often treat byte count as a coarse invariant that should move only when content truly changes. In practice, version drift without a corresponding size shift may indicate immaterial annotation edits, whereas size growth under a stable version flag may signal unversioned append or corruption—patterns compliance engineers routinely instrument.

**fact_schemaorg**

| id | affiliation_key | size_bytes | version |
| --- | --- | --- | --- |
| AFFI-0001 | AFFI-0001 | 895265030 | 3 |
| AFFI-0002 | AFFI-0004 | 114301972 | 5 |
| AFFI-0003 | AFFI-0002 | 338701831 | 4 |
| AFFI-0004 | AFFI-0003 | 998785819 | 8 |

Operationally, these elements compose a closed loop from standard to steward to evidence. NIST impact configurations bind publication identifiers to impact-level targets under explicit roles; affiliation dimensions classify the custodians of schema-derived facts; agents assume responsibility targets under parallel role semantics; and each fact row carries version and byte-scale telemetry suitable for audit. A assessor tracing IMPA-0003 from SP 800-171 through contributor role to Impact Level Moderate can simultaneously resolve which affiliation category owns the underlying schema artifact, which agent reviews PipelineMetrics versus AuditTrail, and whether the stored corpus at version 4 and 338701831 bytes matches the snapshot attested in the prior quarter. That density of cross-reference is precisely why identifiers remain minimal, roles remain on edges, and versioned size metadata remains adjacent to affiliation—not as redundant description, but as the minimum structure required for claims that withstand evidentiary scrutiny.

**t_nist80053_moderate_impact_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level |
| --- | --- |
| IMPA-0001 | Moderate Threshold |
| IMPA-0002 | System Security Moderate |
| IMPA-0003 | Impact Level Moderate |
| IMPA-0004 | Moderate Baseline |
| IMPA-0005 | Moderate Threshold |
| IMPA-0006 | Moderate |
| IMPA-0007 | Availability Moderate |