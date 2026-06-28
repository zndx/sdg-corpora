---
chapter_id: ch_live_ganglion_cyst_tissue_origin_97ab85
topic_id: 6
family: 08_derived
cited_terms: ['ganglion_cyst_tissue_origin', 'marketing_director_role', 'verification_produces_evidence']
model: engine-refine
---

The governance of anatomical evidence and marketing accountability rests upon a unified identifier architecture that binds disparate data domains into a coherent reference framework. Each entity—whether a ganglion cyst tissue origin, a role holder, or a verification event—receives a persistent identifier such as ORIG-0001, ROLE-0001, or EVID-0001, establishing a stable key across all relational boundaries. These identifiers anchor the tissue origin records that classify cysts by their anatomical source: sacroiliac joint, metacarpophalangeal joint, subacromial bursa, and first dorsal compartment. The same identifier discipline extends to role holders, designated as Role Holder Label 01 through Role Holder Label 04, and to activities in which those roles are realized, labeled Realized In Activity Label 01 through Realized In Activity Label 04. This consistent identification scheme ensures that every piece of evidence, every accountable party, and every operational event can be traced, cross-referenced, and audited without ambiguity.

**t_ganglion_cyst_tissue_origin**

| id | ganglion_cyst_tissue_origin |
| --- | --- |
| ORIG-0001 | sacroiliac joint |
| ORIG-0002 | metacarpophalangeal joint |
| ORIG-0003 | subacromial bursa |
| ORIG-0004 | first dorsal compartment |
| ORIG-0005 | sacroiliac joint |
| ORIG-0006 | distal radioulnar joint |
| ORIG-0007 | popliteal fossa |
| ORIG-0008 | distal radioulnar joint |

**t_ganglion_cyst_tissue_origin_part_of**

| id | part_of |
| --- | --- |
| ORIG-0001 | periosteal layer |
| ORIG-0002 | joint capsule |
| ORIG-0003 | deep fascia |
| ORIG-0004 | fibrous adventitia |
| ORIG-0005 | periosteal layer |
| ORIG-0006 | periosteal layer |

**t_ganglion_cyst_tissue_origin__part_of**

| id | ganglion_id | part_of_id | role |
| --- | --- | --- | --- |
| ORIG-0001 | ORIG-0007 | ORIG-0001 | reviewer |
| ORIG-0002 | ORIG-0008 | ORIG-0001 | contributor |
| ORIG-0003 | ORIG-0007 | ORIG-0005 | owner |
| ORIG-0004 | ORIG-0002 | ORIG-0006 | owner |
| ORIG-0005 | ORIG-0003 | ORIG-0005 | reviewer |
| ORIG-0006 | ORIG-0008 | ORIG-0006 | observer |
| ORIG-0007 | ORIG-0003 | ORIG-0005 | contributor |
| ORIG-0008 | ORIG-0005 | ORIG-0005 | observer |

The connective tissue structure taxonomy provides the anatomical scaffolding through which tissue origins are contextualized within broader structural hierarchies. Each ganglion cyst tissue origin is classified by the connective tissue structure from which it derives—periosteal layer, joint capsule, deep fascia, or fibrous adventitia—and these relationships are themselves mediated by a junction table that assigns a role to the association. In this relational layer, a ganglion identified as ORIG-0007 may be linked to ORIG-0001 with the role of reviewer, while ORIG-0002 connects to ORIG-0006 as owner. The role field in this junction table—taking values such as reviewer, contributor, and owner—introduces a semantic dimension to the structural relationship, distinguishing between parties who validate, those who generate, and those who hold custodial responsibility for the anatomical classification. This tripartite role structure mirrors the accountability model found throughout the governance framework.

Marketing accountability is captured through a fact table that records event counts for each combination of role holder and realized activity, with observed event counts ranging from 18 to 421 across the recorded instances. The fact table references role holders and activities by their respective identifiers, enabling aggregation and drill-down analysis across both dimensions. A role holder designated ROLE-0002 may be associated with realized activity ROLE-0006 and account for 204 events, while ROLE-0001, linked to realized activity ROLE-0001, records 153 events. The category and misc columns in the dimension tables provide categorical classification and free-form descriptive labels for both role holders and activities, supporting filtering, grouping, and human-readable reporting without compromising the integrity of the identifier-based join keys.

**fact_marketing**

| id | role_holder_key | realized_in_activity_key | event_count |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0002 | ROLE-0002 | 18 |
| ROLE-0002 | ROLE-0005 | ROLE-0006 | 204 |
| ROLE-0003 | ROLE-0001 | ROLE-0006 | 421 |
| ROLE-0004 | ROLE-0003 | ROLE-0001 | 153 |
| ROLE-0005 | ROLE-0006 | ROLE-0003 | 434 |
| ROLE-0006 | ROLE-0003 | ROLE-0004 | 256 |
| ROLE-0007 | ROLE-0005 | ROLE-0005 | 457 |

**dim_role_holder**

| id | role_holder_label | role_holder_category |
| --- | --- | --- |
| ROLE-0001 | Role Holder Label 01 | Role Holder Category 01 |
| ROLE-0002 | Role Holder Label 02 | Role Holder Category 02 |
| ROLE-0003 | Role Holder Label 03 | Role Holder Category 03 |
| ROLE-0004 | Role Holder Label 04 | Role Holder Category 04 |
| ROLE-0005 | Role Holder Label 05 | Role Holder Category 05 |
| ROLE-0006 | Role Holder Label 06 | Role Holder Category 06 |

**dim_realized_in_activity**

| id | realized_in_activity_label | realized_in_activity_category |
| --- | --- | --- |
| ROLE-0001 | Realized In Activity Label 01 | Realized In Activity Category 01 |
| ROLE-0002 | Realized In Activity Label 02 | Realized In Activity Category 02 |
| ROLE-0003 | Realized In Activity Label 03 | Realized In Activity Category 03 |
| ROLE-0004 | Realized In Activity Label 04 | Realized In Activity Category 04 |
| ROLE-0005 | Realized In Activity Label 05 | Realized In Activity Category 05 |
| ROLE-0006 | Realized In Activity Label 06 | Realized In Activity Category 06 |

Evidence production and verification outcomes are tracked through a separate evidence table that records the verification process, the type of evidence produced, an exit code, and the current status of the verification. All four recorded instances correspond to Compliance audit Q3, yet they diverge in their outcomes: some produce Validation result while others yield TLS certificate, exit codes range from 88 to 938, and statuses span complete, failed, and pending. The exit code serves as a machine-readable diagnostic indicator of the verification outcome, while the status field provides a human-readable summary of the verification lifecycle stage. This dual representation—numeric exit code alongside categorical status—enables both programmatic routing of verification workflows and manual oversight by governance personnel.

The integration of these domains—tissue origin classification, role-based accountability, event tracking, and evidence verification—demonstrates a governance architecture in which identifiers serve as the connective tissue binding anatomical taxonomy to operational accountability. The same role semantics that classify relationships between ganglion cyst tissue origins and their parent connective structures also appear in the evidence verification layer, where reviewer, contributor, and owner roles define the chain of custody for compliance artifacts. Event counts in the marketing fact table quantify the operational footprint of each role-holder and activity pairing, while exit codes and statuses in the evidence table provide the audit trail necessary for regulatory compliance. Together, these tables form a unified reference model in which category, status, and role are not isolated attributes but interlocking dimensions of a single governance framework.

**t_verification_produces_evidence**

| id | verification | produces_evidence | exit_code | status |
| --- | --- | --- | --- | --- |
| EVID-0001 | Compliance audit Q3 | Validation result | 568 | complete |
| EVID-0002 | Compliance audit Q3 | TLS certificate | 821 | failed |
| EVID-0003 | Compliance audit Q3 | Validation result | 938 | failed |
| EVID-0004 | Compliance audit Q3 | TLS certificate | 88 | pending |
| EVID-0005 | Compliance audit Q3 | Risk score | 761 | pending |