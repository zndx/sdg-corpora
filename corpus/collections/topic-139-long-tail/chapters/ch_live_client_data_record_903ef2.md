---
chapter_id: ch_live_client_data_record_903ef2
topic_id: 139
family: 08_derived
cited_terms: ['client_data_record', 'clinical_performance_evaluation', 'clinical_quality_research_role']
model: engine-refine
---

Clinical quality research governance rests on stable identifiers that let disparate operational systems agree on what is being measured, who is accountable, and under which authority obligations attach. Identifiers such as RECO-0001, EVAL-0002, and ROLE-0003 are not merely surrogate keys; they are the durable handles auditors, data stewards, and safety officers use when reconciling activity across intake, analysis, and oversight workflows. When a client record RECO-0001 is understood to contain RECO-0006, or when clinical activity EVAL-0002 both utilizes and evaluates EVAL-0002, those linkages encode definitional dependencies that downstream reporting must preserve. Event counts—225 client-side events for RECO-0001, 371 clinical events for EVAL-0002—translate those relationships into measurable workload and risk exposure, giving compliance teams a quantitative basis for prioritizing review queues, sampling plans, and escalation thresholds rather than treating every artifact as equally urgent.

**fact_client**

| id | contains_key | event_count |
| --- | --- | --- |
| RECO-0001 | RECO-0006 | 225 |
| RECO-0002 | RECO-0005 | 129 |
| RECO-0003 | RECO-0002 | 282 |
| RECO-0004 | RECO-0002 | 42 |
| RECO-0005 | RECO-0003 | 486 |
| RECO-0006 | RECO-0004 | 89 |

**fact_clinical**

| id | utilizes_key | evaluates_key | event_count |
| --- | --- | --- | --- |
| EVAL-0001 | EVAL-0002 | EVAL-0002 | 306 |
| EVAL-0002 | EVAL-0002 | EVAL-0006 | 371 |
| EVAL-0003 | EVAL-0004 | EVAL-0001 | 304 |
| EVAL-0004 | EVAL-0006 | EVAL-0001 | 206 |
| EVAL-0005 | EVAL-0006 | EVAL-0003 | 268 |
| EVAL-0006 | EVAL-0008 | EVAL-0003 | 303 |

**t_clinical_quality_research_role_holds_role_in**

| id | holds_role_in |
| --- | --- |
| ROLE-0001 | EMA Governance Office |
| ROLE-0002 | CDC Regulatory Division |
| ROLE-0003 | Joint Commission Authority |
| ROLE-0004 | DoD Clinical Trial Office |
| ROLE-0005 | NHS Research Ethics Board |
| ROLE-0006 | VA Research Authority |
| ROLE-0007 | CDC Regulatory Division |
| ROLE-0008 | VA Research Authority |

Dimensional classification supplies the semantic layer that makes raw keys interpretable in policy and training materials. Category values such as Contains Category 01, Utilizes Category 03, and Evaluates Category 04 partition the model into governed taxonomies so that “contains,” “utilizes,” and “evaluates” are not interchangeable verbs but distinct compliance predicates with different evidentiary standards. Miscellaneous descriptive attributes—Contains Label 02, Utilizes Label 01, Evaluates Label 04—carry the human-readable miscellany that investigators need when identifiers alone would be opaque in audit packets or corrective-action narratives. In practice, a steward tracing RECO-0004’s association with Contains Label 04 and Contains Category 04 can explain why that client’s comparatively low event count of 42 still warrants scrutiny: the category may denote a high-sensitivity containment context even when volume is small.

**dim_contains**

| id | contains_label | contains_category |
| --- | --- | --- |
| RECO-0001 | Contains Label 01 | Contains Category 01 |
| RECO-0002 | Contains Label 02 | Contains Category 02 |
| RECO-0003 | Contains Label 03 | Contains Category 03 |
| RECO-0004 | Contains Label 04 | Contains Category 04 |
| RECO-0005 | Contains Label 05 | Contains Category 05 |
| RECO-0006 | Contains Label 06 | Contains Category 06 |

**dim_utilizes**

| id | utilizes_label | utilizes_category |
| --- | --- | --- |
| EVAL-0001 | Utilizes Label 01 | Utilizes Category 01 |
| EVAL-0002 | Utilizes Label 02 | Utilizes Category 02 |
| EVAL-0003 | Utilizes Label 03 | Utilizes Category 03 |
| EVAL-0004 | Utilizes Label 04 | Utilizes Category 04 |
| EVAL-0005 | Utilizes Label 05 | Utilizes Category 05 |
| EVAL-0006 | Utilizes Label 06 | Utilizes Category 06 |
| EVAL-0007 | Utilizes Label 07 | Utilizes Category 07 |
| EVAL-0008 | Utilizes Label 08 | Utilizes Category 08 |

**dim_evaluates**

| id | evaluates_label | evaluates_category |
| --- | --- | --- |
| EVAL-0001 | Evaluates Label 01 | Evaluates Category 01 |
| EVAL-0002 | Evaluates Label 02 | Evaluates Category 02 |
| EVAL-0003 | Evaluates Label 03 | Evaluates Category 03 |
| EVAL-0004 | Evaluates Label 04 | Evaluates Category 04 |
| EVAL-0005 | Evaluates Label 05 | Evaluates Category 05 |
| EVAL-0006 | Evaluates Label 06 | Evaluates Category 06 |

Clinical quality research roles formalize who may act on behalf of the organization within regulated research and quality programs. A role record such as Safety Monitor, which appears for both ROLE-0002 and ROLE-0003, names a functional capacity distinct from the person or system account that might temporarily fulfill it. Roles do not float in abstraction; they are anchored to emsauthority—electronic medical services or, more broadly, external regulatory and governance authorities—through holdings such as EMA Governance Office, CDC Regulatory Division, Joint Commission Authority, and DoD Clinical Trial Office. That pairing matters because the same titled responsibility carries different submission timelines, documentation formats, and inspection rights depending on which authority jurisdiction applies. Quality Assurance Lead at ROLE-0001 under EMA Governance Office and Data Integrity Auditor at ROLE-0004 under DoD Clinical Trial Office therefore imply different evidentiary duties even when both titles sound broadly “compliance-oriented” to a lay reader.

Relationship tables express how subjects participate in governed interactions through explicit role assignments on each edge. In holds_role_in bridges, the subject clinical_id (for example ROLE-0002) is linked to a target holds_role_in_id (ROLE-0006 or ROLE-0008) with a role of reviewer or observer, distinguishing active adjudication from passive monitoring within the same authority context. The parallel applies_to pattern ties clinical quality data—Adverse Event Log, Procedure Coding Set, Electronic Health Record Extract, Imaging Metadata Archive—to subjects and targets with roles such as owner or contributor, clarifying custody versus participation. When ROLE-0002 is an owner of Adverse Event Log-related scope while ROLE-0001 contributes under a different pairing, access reviews and segregation-of-duties checks can be executed mechanically: ownership implies accountability for completeness and retention, whereas contribution implies bounded edit or submission rights without ultimate sign-off.

Cardinality notes close the gap between logical data models and enforceable governance language by documenting how many instances of one entity may relate to another without ambiguity during system design or audit. Notes labeled Cardinality Note 01 through Cardinality Note 04 attached to applies_to relationships record constraints that might otherwise be invisible in fact tables—whether a single Safety Monitor may oversee multiple imaging archives, whether each Procedure Coding Set demands exactly one owner, or whether contributor assignments may repeat across studies. These annotations prevent silent many-to-many sprawl that undermines traceability: if event counts spike on EVAL-0003 (304 events) while ROLE-0001 holds a contributor role under Cardinality Note 03, reviewers can test whether the noted cardinality still holds or whether operational drift has introduced duplicate accountable parties. Cardinality documentation is therefore not decorative metadata; it is the control that lets architects, validators, and inspectors agree on permissible relationship shapes before disputes arise.

Operational compliance weaves these elements into a single evidentiary chain. Investigators begin from event_count anomalies or role gaps, follow identifiers into dimension categories and misc labels to understand context, confirm that clinicalqualityresearchrole assignments align with the correct emsauthority, and verify that subject-target-role triples on bridge tables respect documented cardinality_note constraints against the relevant clinicalqualitydata domains. A finding that RECO-0003 shows 282 client events while linked evaluates activity on EVAL-0001 under Evaluates Category 01 triggers a different playbook than a low-volume RECO-0004 record, because the evaluates and contains predicates, not volume alone, determine which role holders must certify data integrity. Mature programs treat identifiers, categories, roles, authorities, subjects, and cardinality notes as mutually reinforcing controls: each answers a different question—what happened, how it is classified, who is responsible, under whose rules, in what capacity, and within what structural limits—so that clinical quality research governance remains demonstrable under inspection rather than inferred from informal practice.

**t_clinical_quality_research_role**

| id | clinical_quality_research_role |
| --- | --- |
| ROLE-0001 | Quality Assurance Lead |
| ROLE-0002 | Safety Monitor |
| ROLE-0003 | Safety Monitor |
| ROLE-0004 | Data Integrity Auditor |
| ROLE-0005 | Principal Investigator |
| ROLE-0006 | Regulatory Submission Specialist |

**t_clinical_quality_research_role__holds_role_in**

| id | clinical_id | holds_role_in_id | role |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0002 | ROLE-0006 | reviewer |
| ROLE-0002 | ROLE-0002 | ROLE-0008 | observer |
| ROLE-0003 | ROLE-0005 | ROLE-0008 | reviewer |
| ROLE-0004 | ROLE-0006 | ROLE-0001 | reviewer |
| ROLE-0005 | ROLE-0004 | ROLE-0005 | owner |
| ROLE-0006 | ROLE-0005 | ROLE-0006 | owner |
| ROLE-0007 | ROLE-0003 | ROLE-0007 | owner |
| ROLE-0008 | ROLE-0001 | ROLE-0004 | owner |

**t_clinical_quality_research_role_applies_to**

| id | applies_to |
| --- | --- |
| ROLE-0001 | Adverse Event Log |
| ROLE-0002 | Procedure Coding Set |
| ROLE-0003 | Electronic Health Record Extract |
| ROLE-0004 | Imaging Metadata Archive |
| ROLE-0005 | Vital Signs Stream |
| ROLE-0006 | Laboratory Results Database |

**t_clinical_quality_research_role__applies_to**

| id | clinical_id | applies_to_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| ROLE-0001 | ROLE-0005 | ROLE-0006 | owner | Cardinality Note 01 |
| ROLE-0002 | ROLE-0002 | ROLE-0001 | owner | Cardinality Note 02 |
| ROLE-0003 | ROLE-0001 | ROLE-0005 | contributor | Cardinality Note 03 |
| ROLE-0004 | ROLE-0004 | ROLE-0001 | contributor | Cardinality Note 04 |
| ROLE-0005 | ROLE-0001 | ROLE-0002 | observer | Cardinality Note 05 |
| ROLE-0006 | ROLE-0002 | ROLE-0006 | owner | Cardinality Note 06 |
| ROLE-0007 | ROLE-0003 | ROLE-0001 | observer | Cardinality Note 07 |
| ROLE-0008 | ROLE-0006 | ROLE-0004 | owner | Cardinality Note 08 |