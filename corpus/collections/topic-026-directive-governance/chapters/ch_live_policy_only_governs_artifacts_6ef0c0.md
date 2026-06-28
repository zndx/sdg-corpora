---
chapter_id: ch_live_policy_only_governs_artifacts_6ef0c0
topic_id: 26
family: 03_directive_governance
cited_terms: ['policy_only_governs_artifacts', 'annotation_governed_by_classification_policy', 'agent_with_role']
model: engine-refine
---

In governed agent systems, every entity that participates in compliance workflows must be addressable, classifiable, and auditable across time. Stable identifiers—such as ARTI-0004 for an immutable-audit artifact, POLI-0001 for a policy annotation, or ROLE-0003 for an agent-role dimension—serve as the join keys that let enforcement engines, annotation pipelines, and operational telemetry refer to the same object unambiguously. Without durable identifiers, a blocking enforcement decision on one record cannot be traced to the advisory annotation that informed it, nor to the agent role that produced the underlying behavior. Identifier design is therefore not merely naming convenience; it is the substrate on which cross-table governance, incident reconstruction, and policy lineage depend.

Agent roles describe who—or what—acts within the system and under which operational profile. Dimension tables supply human-readable labels and coarse categories (for example, Agent Role Category 03 paired with Agent Role Label 03), while fact tables bind concrete deployments to role keys, footprint, and revision. The same role key may appear on multiple fact rows: ROLE-0006 is associated with two deployments whose size_bytes differ sharply (roughly 459 MB versus 549 MB), illustrating that role taxonomy is stable even as runtime instances diverge in resource consumption. Version numbers further distinguish lifecycle state—ROLE-0001 at version 7 versus sibling records still at version 1—so compliance reviewers can determine whether a governed behavior reflects a mature, iterated configuration or an early rollout still subject to heightened scrutiny.

**fact_agent**

| id | agent_role_key | size_bytes | version |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0005 | 211345771 | 7 |
| ROLE-0002 | ROLE-0006 | 458577289 | 1 |
| ROLE-0003 | ROLE-0006 | 548859900 | 1 |
| ROLE-0004 | ROLE-0005 | 20883723 | 12 |
| ROLE-0005 | ROLE-0003 | 490849751 | 11 |

Annotations attach interpretive metadata to governed objects, typically policies or artifacts, and are themselves organized through category and miscellaneous descriptive fields. A dimension row might place POLI-0002 in Annotation Category 02 with Annotation Label 02, while a corresponding fact row records what was asserted, how strongly, and with what residual doubt. Confidence scores express belief on a bounded scale: POLI-0001 carries confidence 0.845, a level suitable for automated downstream use, whereas POLI-0002 at 0.236 signals that human review should precede any consequential action. Uncertainty complements confidence numerically but is not interchangeable with it—POLI-0001 pairs high confidence with uncertainty 690.59, while POLI-0004 shows lower confidence (0.303) yet far lower uncertainty (22.02), a pattern that often arises when models are calibrated differently across categories or when misc-valued measurements (here, numeric values in the 280–980 range) encode domain-specific magnitudes rather than normalized probabilities. Operators must treat confidence, uncertainty, and misc-valued payloads as a coherent evidentiary bundle, not isolated columns.

**fact_annotation**

| id | annotation_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| POLI-0001 | POLI-0005 | 0.845 | 690.59 | 979.94 |
| POLI-0002 | POLI-0003 | 0.236 | 593.98 | 370.63 |
| POLI-0003 | POLI-0004 | 0.271 | 104.01 | 360.27 |
| POLI-0004 | POLI-0001 | 0.303 | 22.02 | 284.47 |
| POLI-0005 | POLI-0003 | 0.002 | 328.54 | 25.47 |

Category fields provide the taxonomic scaffolding that makes large annotation and role populations manageable. Categories partition the namespace so retrieval, reporting, and policy mapping can occur at the right granularity: agent_role_category separates operational personas, while annotation_category groups assertions by subject matter or evidentiary type. Miscellaneous attributes—labels, free-form values, and other non-key descriptors—carry semantics that do not warrant their own dimension but still matter operationally, such as distinguishing Annotation Label 04 from Label 01 when two records share superficially similar confidence profiles. In practice, category plus misc metadata is how practitioners answer questions like “which annotations are privacy-related?” without hard-coding every identifier.

**dim_annotation**

| id | annotation_label | annotation_category |
| --- | --- | --- |
| POLI-0001 | Annotation Label 01 | Annotation Category 01 |
| POLI-0002 | Annotation Label 02 | Annotation Category 02 |
| POLI-0003 | Annotation Label 03 | Annotation Category 03 |
| POLI-0004 | Annotation Label 04 | Annotation Category 04 |
| POLI-0005 | Annotation Label 05 | Annotation Category 05 |
| POLI-0006 | Annotation Label 06 | Annotation Category 06 |

**dim_agent_role**

| id | agent_role_label | agent_role_category |
| --- | --- | --- |
| ROLE-0001 | Agent Role Label 01 | Agent Role Category 01 |
| ROLE-0002 | Agent Role Label 02 | Agent Role Category 02 |
| ROLE-0003 | Agent Role Label 03 | Agent Role Category 03 |
| ROLE-0004 | Agent Role Label 04 | Agent Role Category 04 |
| ROLE-0005 | Agent Role Label 05 | Agent Role Category 05 |
| ROLE-0006 | Agent Role Label 06 | Agent Role Category 06 |
| ROLE-0007 | Agent Role Label 07 | Agent Role Category 07 |

Enforcement and priority translate governance intent into runtime behavior on artifacts. Policies such as Privacy Compliance Policy (priority 1) and Immutable Audit Policy (priority 5) do not merely exist as documents; they declare how the platform must respond when matched conditions arise. Enforcement mode is the decisive lever: blocking on Data Retention Policy means noncompliant paths halt rather than proceed with a warning, advisory treatment on Access Control and Privacy policies permits operation while surfacing violations for remediation, and deprecated enforcement on Immutable Audit Policy signals that the control remains cataloged for traceability but must not be relied upon for active prevention. Priority resolves conflicts when multiple policies apply—lower numbers conventionally denote higher precedence, so a priority-1 privacy control can override a priority-4 access advisory when both fire on the same artifact. Together, enforcement and priority define the operational grammar through which identifier-linked artifacts become enforceable obligations rather than static references.

**t_policy_only_governs_artifacts**

| id | policy | enforcement | priority |
| --- | --- | --- | --- |
| ARTI-0001 | Data Retention Policy | blocking | 2 |
| ARTI-0002 | Access Control Policy | advisory | 4 |
| ARTI-0003 | Privacy Compliance Policy | deprecated | 1 |
| ARTI-0004 | Immutable Audit Policy | advisory | 5 |
| ARTI-0005 | Provenance Tracking Policy | deprecated | 5 |
| ARTI-0006 | Access Control Policy | mandatory | 1 |

Size_bytes and version close the loop between governance metadata and deployable reality. An agent role’s byte footprint—whether roughly 21 MB or exceeding 500 MB—affects data-retention windows, export controls, and capacity planning tied to retention and access policies. Version stamps make those footprints interpretable: a 12th-revision deployment and a 7th-revision deployment of the same role family may carry different model weights, tool permissions, or logging hooks, each with distinct compliance implications. When investigators correlate ARTI-0001 under blocking retention enforcement with a high-confidence annotation on POLI-0001 and a heavyweight ROLE-0002 instance, they are exercising the full model—identifier for traceability, category and misc fields for context, confidence and uncertainty for evidentiary weight, enforcement and priority for mandatory outcomes, and size_bytes plus version for operational provenance. That integration is the practical purpose of the domain: not to catalog fields, but to make automated agents legible, governable, and accountable under enterprise policy.