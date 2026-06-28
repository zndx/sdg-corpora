---
chapter_id: ch_live_radicalization_process_96f7f7
topic_id: 7
family: 08_derived
cited_terms: ['radicalization_process', 'reference_subclass', 'reference_within_dataset']
model: engine-refine
---

Radicalization process records name discrete phases in which extremist mobilization unfolds and bind each phase to the affiliated organizations that materially participate in it. A Militia Formation Phase (PROC-0001) may draw Sympathizer Network Alpha as a participant, while a Network Recruit Wave (PROC-0002, PROC-0004) may implicate Al-Shabaab Recruitment Cell or recur under the same sympathizer network; a Radicalization Vector Delta (PROC-0003) may instead associate Regional Coordination Cell. The radicalizationprocess label is therefore not decorative taxonomy but an operational descriptor that analysts, auditors, and compliance officers use to distinguish formation dynamics from recruitment surges and vector shifts. Affiliatedorganization linkage makes accountability transitive: when PROC-0004 repeats Network Recruit Wave under Sympathizer Network Alpha, investigators can see pattern recurrence across processes rather than treating each identifier as an isolated event.

**t_radicalization_process**

| id | radicalization_process | has_participant |
| --- | --- | --- |
| PROC-0001 | Militia Formation Phase | Sympathizer Network Alpha |
| PROC-0002 | Network Recruit Wave | Al-Shabaab Recruitment Cell |
| PROC-0003 | Radicalization Vector Delta | Regional Coordination Cell |
| PROC-0004 | Network Recruit Wave | Sympathizer Network Alpha |
| PROC-0005 | Ideological Shift Cycle | Militia Training Outpost |
| PROC-0006 | Radicalization Vector Delta | Ideological Mentorship Program |

Identifier discipline underpins that traceability. Stable keys—PROC-0001 through PROC-0004 for processes, REFE-0001 through REFE-0004 for reference subclasses, DATA-0001 through DATA-0004 for in-dataset references—allow the same logical object to be cited across submissions, lineage reports, and quality reviews without ambiguity. Entity identifiers in the valuation layer (entity_id DATA-0001, DATA-0002, and so on) tie concrete attribute assertions back to those reference records, so a governance review of PROVENANCE-MAP-V4 or QC-PROTOCOL-V2 always resolves to a single canonical row regardless of how many attributes or value tables contribute detail.

**t_reference_within_dataset_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0001 | Checksum Algo 01 |
| DATA-0002 | DATA-0001 | DATA-0002 | A-01 |
| DATA-0003 | DATA-0001 | DATA-0006 | Encoding 03 |
| DATA-0004 | DATA-0001 | DATA-0003 | RFC-3339 |
| DATA-0005 | DATA-0001 | DATA-0007 | intake form |
| DATA-0006 | DATA-0001 | DATA-0008 | en |
| DATA-0007 | DATA-0001 | DATA-0005 | Namespace 07 |
| DATA-0008 | DATA-0002 | DATA-0001 | Checksum Algo 08 |

Reference governance extends beyond process tracking into how datasets justify themselves. Subclass references carry issueddate stamps—2024-02-21, 2024-12-07, 2025-05-30, 2023-09-26—and namespace assignments that classify intent: provenance, lineage, or governance. That namespace partitions otherwise similar “points_to” edges so that Reference 01 under provenance is read differently from Reference 03 under lineage, even when both participate in the same audit cycle. Within-dataset references then anchor operational artifacts: PROVENANCE-MAP-V4 points to feature_store_metrics and sits inside ml_training_run; SCHEMA-REF-ALPHA points to production_schema within regulatory_submission; duplicate PROVENANCE-MAP-V4 and QC-PROTOCOL-V2 both resolve to model_artifact_x7 but under cloud_storage_bucket and enterprise_data_catalog respectively—demonstrating how one logical map can participate in multiple containment contexts without identifier collision.

**t_reference_subclass**

| id | reference | points_to | issued_date | namespace |
| --- | --- | --- | --- | --- |
| REFE-0001 | Reference 01 | Points To 01 | 2024-02-21 | provenance |
| REFE-0002 | Reference 02 | Points To 02 | 2024-12-07 | lineage |
| REFE-0003 | Reference 03 | Points To 03 | 2025-05-30 | governance |
| REFE-0004 | Reference 04 | Points To 04 | 2023-09-26 | lineage |
| REFE-0005 | Reference 05 | Points To 05 | 2024-10-25 | provenance |
| REFE-0006 | Reference 06 | Points To 06 | 2023-04-21 | catalog |

**t_reference_within_dataset**

| id | reference | points_to | part_of |
| --- | --- | --- | --- |
| DATA-0001 | PROVENANCE-MAP-V4 | feature_store_metrics | ml_training_run |
| DATA-0002 | SCHEMA-REF-ALPHA | production_schema | regulatory_submission |
| DATA-0003 | PROVENANCE-MAP-V4 | model_artifact_x7 | cloud_storage_bucket |
| DATA-0004 | QC-PROTOCOL-V2 | model_artifact_x7 | enterprise_data_catalog |
| DATA-0005 | DOC-2023-04A | feature_store_metrics | compliance_audit_cycle |
| DATA-0006 | DATA-DICT-PROD | compliance_register | regulatory_submission |

Attributes and attr_type specifications formalize what may be said about each entity and how validators must interpret it. Registered attr names—checksum_algo, code, format, issued_date—are not free text; each is bound to an attr_type such as xsd:string or xsd:date, which governs parsing, comparison, and cross-system exchange. The issued_date attribute typed as xsd:date is distinct from issueddate metadata on subclass references: the former is a claim stored against a dataset entity, the latter is issuance provenance on the reference edge itself. Separating declaration (attr plus attr_type) from assertion (entity plus attr plus misc) prevents type errors when the same attribute name appears in multiple valuation channels.

**t_reference_within_dataset_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0004 | 2024-10-25 |
| DATA-0002 | DATA-0002 | DATA-0004 | 2024-06-06 |
| DATA-0003 | DATA-0003 | DATA-0004 | 2023-04-24 |
| DATA-0004 | DATA-0004 | DATA-0004 | 2023-10-13 |
| DATA-0005 | DATA-0005 | DATA-0004 | 2023-04-15 |
| DATA-0006 | DATA-0006 | DATA-0004 | 2024-06-08 |

The misc field materializes those assertions as evidence. Varchar valuations attach Checksum Algo 01, A-01, Encoding 03, and RFC-3339 to DATA-0001 under checksum_algo, code, and format attributes—showing how a single entity can accumulate heterogeneous descriptive facts while each value remains keyed to a specific attr_id. Date valuations concentrate on issued_date (attr_id DATA-0004) with misc values 2024-10-25, 2024-06-06, 2023-04-24, and 2023-10-13 across DATA-0001 through DATA-0004, yielding a parallel temporal record independent of subclass issueddate fields. Compliance reviewers treat misc as the auditable fact and attr_type as the admissibility rule: a misc value is valid only when its lexical form satisfies the declared XSD type.

In practice, radicalizationprocess and affiliatedorganization data inform threat and conduct assessments, while identifier-linked reference, attr, and misc structures supply the evidential chain that makes those assessments defensible in regulatory_submission or enterprise_data_catalog contexts. A complete read traverses process identifiers to participating organizations, crosses into dataset references and their part_of containers, validates each misc value against attr_type, and reconciles issueddate on references with issued_date assertions on entities. That integration is why these elements matter jointly: without namespace-scoped references and typed attributes, process narratives lack reproducible provenance; without stable identifiers and partitioned valuations, the same radicalization label could not be shown to recur under the same affiliated organization across time and artifact boundaries.

**t_reference_within_dataset_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DATA-0001 | checksum_algo | xsd:string |
| DATA-0002 | code | xsd:string |
| DATA-0003 | format | xsd:string |
| DATA-0004 | issued_date | xsd:date |
| DATA-0005 | namespace | xsd:string |
| DATA-0006 | encoding | xsd:string |
| DATA-0007 | label_text | xsd:string |
| DATA-0008 | language | xsd:string |