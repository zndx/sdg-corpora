---
chapter_id: ch_live_policy_only_governs_artifacts_675b3a
topic_id: 140
family: 03_directive_governance
cited_terms: ['policy_only_governs_artifacts', 'mass_function_subclass', 'requirement_refines']
model: engine-refine
---

Policy enforcement operates as a tiered mechanism calibrated by priority and mode, where directives are classified as blocking, advisory, deprecated, or advisory depending on their operational urgency and lifecycle stage. The Data Retention Policy (ARTI-0001) carries priority 2 and employs blocking enforcement, ensuring that retention obligations are mechanically enforced rather than left to discretion, whereas the Immutable Audit Policy (ARTI-0004), assigned the lowest priority of 5, similarly mandates blocking enforcement to guarantee audit trail integrity regardless of competing operational pressures. At the opposite end of the enforcement spectrum, the Privacy Compliance Policy (ARTI-0003) holds priority 1—the highest precedence—yet deploys advisory enforcement, reflecting a governance posture in which privacy requirements carry maximum authority but are communicated as guidance rather than hard controls. The Access Control Policy (ARTI-0002), by contrast, bears priority 4 and also uses advisory enforcement, suggesting that access governance is treated as a recommended practice rather than a mandatory gate.

**t_policy_only_governs_artifacts**

| id | policy | enforcement | priority |
| --- | --- | --- | --- |
| ARTI-0001 | Data Retention Policy | blocking | 2 |
| ARTI-0002 | Access Control Policy | advisory | 4 |
| ARTI-0003 | Privacy Compliance Policy | deprecated | 1 |
| ARTI-0004 | Immutable Audit Policy | advisory | 5 |
| ARTI-0005 | Provenance Tracking Policy | deprecated | 5 |
| ARTI-0006 | Access Control Policy | mandatory | 1 |

Within this enforcement architecture, identifiers serve as the immutable keys that bind policies, mass functions, frames of discernment, and refinement requirements into a coherent traceability graph. Artifact identifiers such as ARTI-0001 through ARTI-0004 anchor each policy to its enforcement posture, while function identifiers—FUNC-0001 through FUNC-0007—uniquely tag mass function subclasses including fault_detection_assignment, signal_quality_mass, and network_topology_confidence, each of which is evaluated against a frame of discernment such as resource_utilization_buckets, signal_strength_levels, or protocol_compliance_status. Refinement identifiers (REFI-0001 through REFI-0004) then connect concrete requirements like the Access Control Matrix and Data Retention Policy to the mass functions they refine, establishing a bidirectional audit trail from governance intent through analytical implementation.

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

The relationship between mass functions and frames of discernment is mediated by role assignments that distinguish ownership from review and contribution. In the mapping table, the same mass function FUNC-0007 appears twice: once paired with frame FUNC-0002 under the role of reviewer, and again paired with frame FUNC-0001 under the role of contributor, demonstrating that a single analytical construct can occupy multiple governance positions depending on the frame of discernment under consideration. The owner role, held by FUNC-0004 in its mapping to frame FUNC-0005, confers full accountability for the network_topology_confidence mass function against the protocol_compliance_status frame, while reviewer roles on FUNC-0006 and FUNC-0007 indicate oversight without direct ownership.

Scope and language parameters further constrain how refinement requirements are applied across organizational boundaries. The Data Retention Policy is refined through three distinct requirement entries—REFI-0002, REFI-0003, and REFI-0004—each targeting a different mass function (FUNC-0002, FUNC-0006, FUNC-0007) and each scoped to a different operational horizon: team, local, and global respectively. These same requirements are expressed in different languages—Spanish (es), English (en), and French (fr)—indicating that the governance framework supports multilingual requirement expression while maintaining a single policy artifact. The Access Control Matrix requirement (REFI-0001), scoped at the team level and expressed in Spanish, refines mass function FUNC-0005, illustrating how localized, language-specific requirements can refine analytical constructs without requiring separate policy artifacts.

**t_requirement_refines**

| id | requirement | refines | scope | language |
| --- | --- | --- | --- | --- |
| REFI-0001 | Access Control Matrix | FUNC-0005 | team | es |
| REFI-0002 | Data Retention Policy | FUNC-0002 | regional | en |
| REFI-0003 | Data Retention Policy | FUNC-0006 | local | en |
| REFI-0004 | Data Retention Policy | FUNC-0007 | global | fr |