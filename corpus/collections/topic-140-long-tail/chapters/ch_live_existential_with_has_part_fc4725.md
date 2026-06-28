---
chapter_id: ch_live_existential_with_has_part_fc4725
topic_id: 140
family: 01_foundation
cited_terms: ['existential_with_has_part', 'mass_function_subclass', 'soc2_confidentiality_subclass']
model: engine-refine
---

The governance of SOC2 compliance domains rests on a structured taxonomy that classifies each domain by category and assigns it a human-readable label, a priority tier, and a review cadence measured in days. The dimension table `dim_for_s_o_c2_domain` anchors this taxonomy with identifiers such as `CONF-0001` through `CONF-0004`, each carrying a category designation like `For S O C2 Domain Category 01` and a corresponding label such as `For S O C2 Domain Label 01`. These categorical assignments are not merely descriptive; they drive the operational rhythm of compliance by determining how frequently each domain must be re-evaluated. The fact table `fact_soc` materializes this governance posture by linking each domain identifier to a priority level and a review cycle duration. A domain flagged with priority `1` and a review cycle of `890` days reflects a high-stakes, long-interval assessment, whereas a domain at priority `5` with a review cycle of `372` days signals a lower-priority but more frequently audited control. The `for_s_o_c2_domain_key` column in `fact_soc` further cross-references domains, enabling a single domain identifier like `CONF-0005` to appear across multiple compliance facts with distinct priorities and review intervals, thereby capturing the multi-dimensional nature of SOC2 obligations.

**fact_soc**

| id | for_s_o_c2_domain_key | priority | review_cycle_days |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0002 | 3 | 494 |
| CONF-0002 | CONF-0005 | 2 | 767 |
| CONF-0003 | CONF-0003 | 1 | 890 |
| CONF-0004 | CONF-0005 | 5 | 372 |

**dim_for_s_o_c2_domain**

| id | for_s_o_c2_domain_label | for_s_o_c2_domain_category |
| --- | --- | --- |
| CONF-0001 | For S O C2 Domain Label 01 | For S O C2 Domain Category 01 |
| CONF-0002 | For S O C2 Domain Label 02 | For S O C2 Domain Category 02 |
| CONF-0003 | For S O C2 Domain Label 03 | For S O C2 Domain Category 03 |
| CONF-0004 | For S O C2 Domain Label 04 | For S O C2 Domain Category 04 |
| CONF-0005 | For S O C2 Domain Label 05 | For S O C2 Domain Category 05 |
| CONF-0006 | For S O C2 Domain Label 06 | For S O C2 Domain Category 06 |

Beyond categorization and scheduling, the framework employs a mass function model to quantify and assign accountability for each compliance function. The table `t_mass_function_subclass` enumerates functions such as `FUNC-0001` through `FUNC-0004`, each associated with a mass value that represents a measurable attribute of the function's operational state. Values like `fault_detection_assignment`, `signal_quality_mass`, and `network_topology_confidence` serve as the quantitative anchors against which compliance posture is assessed. These mass values are not evaluated in isolation; they are contextualized through the frame-of-discernment mapping in `t_mass_function_subclass_over_frame_of_discernment`, which assigns each function to a discernment frame such as `resource_utilization_buckets`, `signal_strength_levels`, or `protocol_compliance_status`. This two-layer mapping—mass value to function, function to frame—creates a structured evaluation matrix where compliance is measured against defined operational boundaries rather than abstract criteria.

The relational bridge between mass functions and frames of discernment is materialized in `t_mass_function_subclass__over_frame_of_discernment`, a junction table that couples a mass identifier with a frame identifier and assigns a governance role to the pairing. Here, the role column takes values of `reviewer`, `contributor`, or `owner`, establishing a clear chain of accountability for each function-frame intersection. For instance, the pairing of `FUNC-0006` with `FUNC-0002` carries the role `reviewer`, indicating that the individual or team responsible for this intersection performs an oversight function rather than direct ownership. The same frame `FUNC-0001` appears in multiple pairings with roles of `reviewer` and `contributor`, demonstrating that a single frame of discernment can support multiple functions under different accountability structures. This role-based assignment ensures that every compliance assessment has a designated owner, a reviewer, and potentially a contributor, mirroring the segregation of duties required under SOC2 trust service criteria.

**t_mass_function_subclass**

| id | mass |
| --- | --- |
| FUNC-0001 | fault_detection_assignment |
| FUNC-0002 | signal_quality_mass |
| FUNC-0003 | network_topology_confidence |
| FUNC-0004 | network_topology_confidence |
| FUNC-0005 | signal_quality_mass |
| FUNC-0006 | network_topology_confidence |
| FUNC-0007 | signal_quality_mass |

**t_mass_function_subclass_over_frame_of_discernment**

| id | over_frame_of_discernment |
| --- | --- |
| FUNC-0001 | resource_utilization_buckets |
| FUNC-0002 | signal_strength_levels |
| FUNC-0003 | signal_strength_levels |
| FUNC-0004 | protocol_compliance_status |
| FUNC-0005 | incident_severity_levels |
| FUNC-0006 | protocol_compliance_status |

**t_mass_function_subclass__over_frame_of_discernment**

| id | mass_id | over_frame_of_discernment_id | role |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0006 | FUNC-0002 | reviewer |
| FUNC-0002 | FUNC-0007 | FUNC-0001 | reviewer |
| FUNC-0003 | FUNC-0007 | FUNC-0001 | contributor |
| FUNC-0004 | FUNC-0004 | FUNC-0005 | owner |
| FUNC-0005 | FUNC-0003 | FUNC-0005 | owner |
| FUNC-0006 | FUNC-0003 | FUNC-0002 | reviewer |
| FUNC-0007 | FUNC-0005 | FUNC-0001 | observer |
| FUNC-0008 | FUNC-0006 | FUNC-0001 | contributor |

The existential architecture of the compliance framework is captured in `t_existential_with_has_part`, which maps high-level system entities to their constituent functions. Entities such as `BatchIngestionPipeline`, `GlobalMetadataCatalog`, `AuditLogArchive`, and `CoreControlSubsystem` are decomposed into functional components identified as `FUNC-0006`, `FUNC-0002`, `FUNC-0004`, and `FUNC-0001` respectively. This decomposition is critical for traceability: it allows auditors to navigate from a system-level artifact down to the specific mass functions and frames of discernment that govern its compliance posture. The `BatchIngestionPipeline`, for example, contains `FUNC-0006`, which in turn is evaluated against discernment frames through the role-annotated junction table, creating an end-to-end audit trail from system component to compliance assessment. This hierarchical mapping ensures that SOC2 controls are not assessed in a vacuum but are grounded in the actual operational components that produce the evidence required for certification.

**t_existential_with_has_part**

| id | existential | has_part |
| --- | --- | --- |
| PART-0001 | BatchIngestionPipeline | FUNC-0006 |
| PART-0002 | GlobalMetadataCatalog | FUNC-0002 |
| PART-0003 | AuditLogArchive | FUNC-0004 |
| PART-0004 | CoreControlSubsystem | FUNC-0001 |
| PART-0005 | ComputeNodePool | FUNC-0003 |
| PART-0006 | GlobalMetadataCatalog | FUNC-0005 |