---
chapter_id: ch_live_lineage_edge_within_dataset_only_66c556
topic_id: 60
family: 05_provo_lineage
cited_terms: ['lineage_edge_within_dataset_only', 'flood_asset_vulnerability_assessment', 'legal_advocate_role']
model: engine-refine
---

Flood asset vulnerability assessments constitute a structured registry of infrastructure risk evaluations, each anchored by a unique identifier such as ASSE-0001 through ASSE-0004 and characterized by a flood asset vulnerability assessment designation—2022 Pakistan Monsoon, Partial System Failure, Levee Seepage, Bridge Foundation Scour—alongside an assesses asset condition value that records the physical state under review, ranging from High Erosion Risk to Critical Structural Failure to Complete Bypass Failure. Each assessment entry further identifies a vulnerability state, exemplified by Water Treatment Inundation, Thames Spring Overflow, and Hurricane Ida Surge, while carrying a label text field that may hold calibration record or nightly summary, and a language attribute indicating the assessment's linguistic context, with observed values including de, fr, and ja. This multi-dimensional schema enables cross-lingual traceability of flood risk documentation and supports downstream aggregation by condition type or vulnerability classification.

**t_flood_asset_vulnerability_assessment**

| id | flood_asset_vulnerability_assessment | assesses_asset_condition | identifies_vulnerability_state | label_text | language |
| --- | --- | --- | --- | --- | --- |
| ASSE-0001 | 2022 Pakistan Monsoon | 2022 Pakistan Monsoon | Water Treatment Inundation | calibration record | de |
| ASSE-0002 | Partial System Failure | High Erosion Risk | Thames Spring Overflow | nightly summary | fr |
| ASSE-0003 | Levee Seepage | Critical Structural Failure | Thames Spring Overflow | nightly summary | fr |
| ASSE-0004 | Bridge Foundation Scour | Complete Bypass Failure | Hurricane Ida Surge | nightly summary | ja |
| ASSE-0005 | Moderate Siltation | Complete Bypass Failure | Elevated Seepage Rate | intake form | es |
| ASSE-0006 | Low Drainage Capacity | Total Inundation | Moderate Siltation | audit excerpt | fr |
| ASSE-0007 | Severe Foundation Compromise | Water Treatment Inundation | Gulf Coast Storm Flood | intake form | es |
| ASSE-0008 | Critical Structural Failure | Critical Structural Failure | Pump Station Submersion | pre-release note | en |

Within dataset dimensioning operates through a parallel taxonomy: the dimension table assigns each within_dataset identifier a within_dataset_label—Within Dataset Label 01 through Within Dataset Label 04—and a corresponding within_dataset_category, such as Within Dataset Category 01 through Within Dataset Category 04. These categorical assignments provide the semantic scaffolding against which fact records are measured. The fact lineage table, keyed by identifiers ONLY-0001 through ONLY-0004, references a within_dataset_key value and carries a confidence score—0.645, 0.071, 0.404, 0.779—alongside an uncertainty magnitude expressed as a floating-point value (612.22, 133.03, 76.69, 708.23) and a misc value (903.86, 832.18, 862.00, 259.55). The confidence field quantifies the degree of assurance in the lineage assertion, while uncertainty captures the dispersion or error bound associated with the measurement; together they form a dual metric that distinguishes high-certainty, low-variance records from those requiring further validation.

**fact_lineage**

| id | within_dataset_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| ONLY-0001 | ONLY-0003 | 0.645 | 612.22 | 903.86 |
| ONLY-0002 | ONLY-0004 | 0.071 | 133.03 | 832.18 |
| ONLY-0003 | ONLY-0005 | 0.404 | 76.69 | 862.00 |
| ONLY-0004 | ONLY-0006 | 0.779 | 708.23 | 259.55 |
| ONLY-0005 | ONLY-0001 | 0.376 | 801.99 | 986.33 |
| ONLY-0006 | ONLY-0004 | 0.744 | 956.79 | 34.40 |

**dim_within_dataset**

| id | within_dataset_label | within_dataset_category |
| --- | --- | --- |
| ONLY-0001 | Within Dataset Label 01 | Within Dataset Category 01 |
| ONLY-0002 | Within Dataset Label 02 | Within Dataset Category 02 |
| ONLY-0003 | Within Dataset Label 03 | Within Dataset Category 03 |
| ONLY-0004 | Within Dataset Label 04 | Within Dataset Category 04 |
| ONLY-0005 | Within Dataset Label 05 | Within Dataset Category 05 |
| ONLY-0006 | Within Dataset Label 06 | Within Dataset Category 06 |

The legal advocate role domain models the allocation of advocacy responsibilities through a tripartite structure. The role definition table, t_legal_advocate_role, enumerates identifiers such as ROLE-0001 through ROLE-0004 and assigns each a legal_advocate_role value—LegalAid-Case33, CourtAdvoc-15B, SurvivorAdvoc-118, CourtAdvoc-15B—where the recurrence of CourtAdvoc-15B across distinct identifiers signals that a single role designation may be instantiated multiple times. The role bearer table, t_legal_advocate_role_role_bearer, maps each role identifier to a person, with observed bearers including Priya Nair, Robert Kim, Aisha B. Williams, and Marcus Chen, thereby grounding abstract role definitions in named individuals. The junction table t_legal_advocate_role__role_bearer resolves the many-to-many relationship between roles and persons, introducing a role attribute (reviewer, contributor) and a cardinality_note field—Cardinality Note 01 through Cardinality Note 04—that documents the multiplicity constraints governing each linkage.

**t_legal_advocate_role**

| id | legal_advocate_role |
| --- | --- |
| ROLE-0001 | LegalAid-Case33 |
| ROLE-0002 | CourtAdvoc-15B |
| ROLE-0003 | SurvivorAdvoc-118 |
| ROLE-0004 | CourtAdvoc-15B |
| ROLE-0005 | LegalShield-Intake |
| ROLE-0006 | LegalAid-Case33 |
| ROLE-0007 | LegalShield-Intake |
| ROLE-0008 | LegalAid-Case33 |

**t_legal_advocate_role_role_bearer**

| id | role_bearer |
| --- | --- |
| ROLE-0001 | Priya Nair |
| ROLE-0002 | Robert Kim |
| ROLE-0003 | Aisha B. Williams |
| ROLE-0004 | Marcus Chen |
| ROLE-0005 | James T. Vance |
| ROLE-0006 | Maria G. Delgado |
| ROLE-0007 | David Okafor |

**t_legal_advocate_role__role_bearer**

| id | legal_id | role_bearer_id | role |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0006 | ROLE-0007 | reviewer |
| ROLE-0002 | ROLE-0008 | ROLE-0007 | reviewer |
| ROLE-0003 | ROLE-0005 | ROLE-0007 | reviewer |
| ROLE-0004 | ROLE-0007 | ROLE-0005 | contributor |
| ROLE-0005 | ROLE-0007 | ROLE-0007 | reviewer |
| ROLE-0006 | ROLE-0005 | ROLE-0001 | owner |
| ROLE-0007 | ROLE-0001 | ROLE-0006 | reviewer |
| ROLE-0008 | ROLE-0002 | ROLE-0007 | reviewer |

A parallel junction structure, t_legal_advocate_role__assists, connects legal advocate roles to domestic violence survivors through the assists_id foreign key, while the t_legal_advocate_role_assists table provides the survivor-level context with identifiers such as Case-Client-004, DV-Record-338, and Ref-Survivor-091. The junction table again carries a role attribute (observer, contributor, owner) and a cardinality_note field, ensuring that the nature and scope of each advocate-to-survivor relationship are explicitly recorded. This separation of the survivor entity from the relationship metadata permits flexible reassignment of advocates to survivors without duplicating survivor records, and the cardinality notes serve as an audit trail for compliance review, documenting whether a given linkage represents a primary assignment, a secondary observation, or an ownership claim.

**t_legal_advocate_role_assists**

| id | assists |
| --- | --- |
| ROLE-0001 | Case-Client-004 |
| ROLE-0002 | DV-Record-338 |
| ROLE-0003 | Case-Client-004 |
| ROLE-0004 | Ref-Survivor-091 |
| ROLE-0005 | Survivor-Ref-115 |
| ROLE-0006 | Client-Code-773 |
| ROLE-0007 | DV-Client-8842 |

**t_legal_advocate_role__assists**

| id | legal_id | assists_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| ROLE-0001 | ROLE-0007 | ROLE-0004 | observer | Cardinality Note 01 |
| ROLE-0002 | ROLE-0002 | ROLE-0003 | contributor | Cardinality Note 02 |
| ROLE-0003 | ROLE-0003 | ROLE-0004 | observer | Cardinality Note 03 |
| ROLE-0004 | ROLE-0006 | ROLE-0005 | owner | Cardinality Note 04 |
| ROLE-0005 | ROLE-0004 | ROLE-0007 | observer | Cardinality Note 05 |
| ROLE-0006 | ROLE-0007 | ROLE-0002 | observer | Cardinality Note 06 |
| ROLE-0007 | ROLE-0002 | ROLE-0004 | contributor | Cardinality Note 07 |
| ROLE-0008 | ROLE-0003 | ROLE-0001 | reviewer | Cardinality Note 08 |