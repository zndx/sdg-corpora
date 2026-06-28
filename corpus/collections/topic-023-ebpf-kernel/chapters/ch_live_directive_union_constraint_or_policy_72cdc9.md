---
chapter_id: ch_live_directive_union_constraint_or_policy_72cdc9
topic_id: 23
family: 03_directive_governance
cited_terms: ['directive_union_constraint_or_policy', 'frozen_artifact_governed_by', 'ice_exactly_one_subject']
model: engine-refine
---

Governed compliance artifacts acquire operational meaning only when they can be named unambiguously, classified by the kind of metadata they carry, and bound to concrete values that auditors and automation can interpret without inferring intent from free text. In enterprise governance registries, an **identifier** serves as the durable handle that survives renaming of human-readable labels and cross-links records across validation, retention, and access-control workflows. A policy such as the Access Control Policy is not referenced by its prose title alone but by **POLI-0004**, while frozen artifacts under governance—**Log-Archive-23Q4**, **Model-Prod-v4**, **Q3-2023-Snapshot**—receive parallel handles (**GOVE-0001** through **GOVE-0004**) that allow the same attribute machinery to attach to directives and to immutable snapshots alike. Subject records in integrity-constraint enforcement (**SUBJ-0001**–**SUBJ-0004**) extend the pattern: a Calibration Manifest or Provenance Graph Export is keyed for machine lookup and tied to governing policy identifiers (**POLI-0004**, **POLI-0001**), so lineage from rule to evidence object remains traceable even when display names repeat, as with two Provenance Graph Export entries distinguished only by their identifiers and related policy bindings.

**t_directive_union_constraint_or_policy**

| id | directive | directive_2 | directive_3 |
| --- | --- | --- | --- |
| POLI-0001 | Compliance Validation Spec | Retention Duration Rule | Sensor Calibration Directive |
| POLI-0002 | Refresh Cycle Rule | Retention Duration Rule | Batch Size Constraint |
| POLI-0003 | Lab Assay Protocol | pH Range Specification | Telemetry Sampling Rule |
| POLI-0004 | Access Control Policy | Logging Level Directive | Calibration Frequency Spec |
| POLI-0005 | Access Control Policy | Retention Duration Rule | Integrity Check Requirement |
| POLI-0006 | Calibration Frequency Spec | Access Control Policy | Sampling Interval Rule |
| POLI-0007 | Data Quality Standard | Validation Check | Audit Log Requirement |

**t_directive_union_constraint_or_policy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | effective_date | xsd:date |
| POLI-0002 | enforcement | xsd:string |
| POLI-0003 | mandatory | xsd:boolean |
| POLI-0004 | priority | xsd:integer |
| POLI-0005 | review_cycle_days | xsd:integer |
| POLI-0006 | scope | xsd:string |
| POLI-0007 | encoding | xsd:string |
| POLI-0008 | label_text | xsd:string |

**t_directive_union_constraint_or_policy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 3 |
| POLI-0002 | POLI-0001 | POLI-0005 | 17 |
| POLI-0003 | POLI-0002 | POLI-0004 | 5 |
| POLI-0004 | POLI-0002 | POLI-0005 | 854 |
| POLI-0005 | POLI-0003 | POLI-0004 | 1 |
| POLI-0006 | POLI-0003 | POLI-0005 | 61 |
| POLI-0007 | POLI-0004 | POLI-0004 | 4 |
| POLI-0008 | POLI-0004 | POLI-0005 | 65 |

**t_frozen_artifact_governed_by**

| id | frozen |
| --- | --- |
| GOVE-0001 | Log-Archive-23Q4 |
| GOVE-0002 | Model-Prod-v4 |
| GOVE-0003 | Q3-2023-Snapshot |
| GOVE-0004 | Compliance-09 |
| GOVE-0005 | Audit-Baseline-2024 |
| GOVE-0006 | Log-Archive-23Q4 |

**t_ice_exactly_one_subject**

| id | ice | related |
| --- | --- | --- |
| SUBJ-0001 | Calibration Manifest | POLI-0004 |
| SUBJ-0002 | Provenance Graph Export | POLI-0001 |
| SUBJ-0003 | Raw Observation Feed | POLI-0005 |
| SUBJ-0004 | Provenance Graph Export | POLI-0004 |
| SUBJ-0005 | Schema Registry Entry | POLI-0006 |
| SUBJ-0006 | Audit Trail Report | POLI-0007 |
| SUBJ-0007 | Schema Registry Entry | POLI-0001 |
| SUBJ-0008 | Sensor Configuration File | POLI-0003 |

An **entity** is the governed object to which metadata applies—the policy, frozen artifact, or subject—not the metadata row itself. Entity identity is expressed through **entity_id** in value stores and aligns with the primary identifier of the parent record: **POLI-0001** (Compliance Validation Spec) and **POLI-0002** (Refresh Cycle Rule) each accumulate multiple attribute bindings under the same entity key, while **GOVE-0001** and **GOVE-0002** illustrate that distinct frozen artifacts maintain separate entity scopes even when they share attribute definitions. The separation matters in practice because enforcement engines evaluate obligations per entity instance: mandatory flags, effective dates, and priority ranks do not float at the registry level but attach to **POLI-0003** (Lab Assay Protocol) independently of **POLI-0004**, and **GOVE-0003** (Q3-2023-Snapshot) can be non-mandatory (**false**) while **GOVE-0002** (Model-Prod-v4) is mandatory (**true**) without implying a global default. Multiplicity within one entity is visible where **POLI-0001** carries both integer priorities (**3** and **17**) and varchar miscellany (**Encoding 01**, **Enforcement 02**, **change rationale**, **fr**), demonstrating that a single governed object may satisfy several orthogonal compliance dimensions simultaneously.

**t_directive_union_constraint_or_policy_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2024-10-31 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2024-11-24 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2023-02-17 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2024-05-10 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2025-01-01 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2024-10-28 |
| POLI-0007 | POLI-0007 | POLI-0001 | 2023-09-29 |

**t_directive_union_constraint_or_policy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | change rationale |
| POLI-0004 | POLI-0001 | POLI-0009 | fr |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | calibration record |

**t_frozen_artifact_governed_by_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0003 | false |
| GOVE-0002 | GOVE-0002 | GOVE-0003 | true |
| GOVE-0003 | GOVE-0003 | GOVE-0003 | false |
| GOVE-0004 | GOVE-0004 | GOVE-0003 | true |
| GOVE-0005 | GOVE-0005 | GOVE-0003 | false |
| GOVE-0006 | GOVE-0006 | GOVE-0003 | false |

**t_frozen_artifact_governed_by_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0001 | 2025-04-28 |
| GOVE-0002 | GOVE-0002 | GOVE-0001 | 2024-02-08 |
| GOVE-0003 | GOVE-0003 | GOVE-0001 | 2024-10-20 |
| GOVE-0004 | GOVE-0004 | GOVE-0001 | 2024-01-16 |
| GOVE-0005 | GOVE-0005 | GOVE-0001 | 2024-06-17 |
| GOVE-0006 | GOVE-0006 | GOVE-0001 | 2024-04-05 |

**t_frozen_artifact_governed_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0004 | 1 |
| GOVE-0002 | GOVE-0001 | GOVE-0005 | 718 |
| GOVE-0003 | GOVE-0002 | GOVE-0004 | 5 |
| GOVE-0004 | GOVE-0002 | GOVE-0005 | 330 |
| GOVE-0005 | GOVE-0003 | GOVE-0004 | 4 |
| GOVE-0006 | GOVE-0003 | GOVE-0005 | 316 |
| GOVE-0007 | GOVE-0004 | GOVE-0004 | 5 |
| GOVE-0008 | GOVE-0004 | GOVE-0005 | 796 |

**t_frozen_artifact_governed_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0007 | Encoding 01 |
| GOVE-0002 | GOVE-0001 | GOVE-0002 | Enforcement 02 |
| GOVE-0003 | GOVE-0001 | GOVE-0008 | calibration record |
| GOVE-0004 | GOVE-0001 | GOVE-0009 | es |
| GOVE-0005 | GOVE-0001 | GOVE-0006 | Scope 05 |
| GOVE-0006 | GOVE-0002 | GOVE-0007 | Encoding 06 |
| GOVE-0007 | GOVE-0002 | GOVE-0002 | Enforcement 07 |
| GOVE-0008 | GOVE-0002 | GOVE-0008 | nightly summary |

**t_ice_exactly_one_subject_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0001 | Encoding 01 |
| SUBJ-0002 | SUBJ-0001 | SUBJ-0002 | nightly summary |
| SUBJ-0003 | SUBJ-0001 | SUBJ-0003 | fr |
| SUBJ-0004 | SUBJ-0002 | SUBJ-0001 | Encoding 04 |
| SUBJ-0005 | SUBJ-0002 | SUBJ-0002 | intake form |
| SUBJ-0006 | SUBJ-0002 | SUBJ-0003 | de |
| SUBJ-0007 | SUBJ-0003 | SUBJ-0001 | Encoding 07 |
| SUBJ-0008 | SUBJ-0003 | SUBJ-0002 | intake form |

**Attr** names the semantic slot—**effective_date**, **enforcement**, **mandatory**, **priority** on policies and frozen artifacts; **encoding**, **label_text**, **language** on ICE subjects—and **attr_id** resolves that slot to a stable key when values are persisted. Attribute catalogs are declared separately from values so that the same vocabulary can be reused across entity families: both directive-union policies and frozen-artifact governance expose identical attr_name sets (**effective_date**, **enforcement**, **mandatory**, **priority**), while subject records narrow the catalog to string-typed presentation metadata. In operation, attr definitions function as a contract: automation knows that **mandatory** will always be evaluated as a boolean obligation, that **effective_date** governs temporal applicability, and that **priority** participates in conflict resolution among co-applicable rules. Referential pairing of **entity_id** with **attr_id**—for example **POLI-0003** bound to **POLI-0003** for mandatory (**true**) and to **POLI-0001** for effective_date (**2023-02-17**)—is how registries avoid conflating “which object” with “which facet of that object,” a distinction auditors rely on when reconstructing why a Lab Assay Protocol was in force on a given date while a sibling Access Control Policy carried mandatory **false**.

**t_directive_union_constraint_or_policy_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | true |
| POLI-0002 | POLI-0002 | POLI-0003 | true |
| POLI-0003 | POLI-0003 | POLI-0003 | true |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | true |
| POLI-0007 | POLI-0007 | POLI-0003 | false |

**Attr type** constrains the legal shape of misc values and routes persistence to the correct typed store. Declarations follow XSD-aligned labels—**xsd:date**, **xsd:string**, **xsd:boolean**, **xsd:integer**—so validators can reject ill-typed assignments before they enter operational paths. Effective dates for **POLI-0001** (**2024-10-31**), **POLI-0002** (**2024-11-24**), **GOVE-0001** (**2025-04-28**), and **GOVE-0004** (**2024-01-16**) land exclusively in date-valued tables; mandatory flags materialize as booleans (**true** for **POLI-0001**–**POLI-0003**, **false** for **POLI-0004**; **GOVE-0001** and **GOVE-0003** false, **GOVE-0002** and **GOVE-0004** true); priorities and related integers (**5**, **854**, **718**, **330**) reside in integer stores; enforcement strings, encodings, rationales, and locale codes (**Enforcement 02**, **Encoding 01**, **calibration record**, **es**, **fr**, **nightly summary**) occupy varchar stores. Type discipline is not cosmetic: it prevents a priority of **854** from being stored as an unparsed string on **POLI-0004**, and it ensures subject language (**fr** on **SUBJ-0001**, **Encoding 04** on **SUBJ-0002**) is handled with the same string semantics as policy-level enforcement metadata.

**Misc**, realized as the **value** field in typed value relations, is the payload—the instantiated fact that completes the entity–attribute–type triple. Misc is deliberately heterogeneous in meaning though uniform in role: it may encode temporal onset (**2024-05-10** for **POLI-0004**), operational severity (**priority** **17** on **POLI-0001** versus **5** on **POLI-0002**), human or machine labels (**change rationale**, **Encoding 01**), locale (**fr**, **es**), or binary compliance posture (**true**/**false**). Because misc is partitioned by attr type rather than commingled in a single untyped column, downstream systems can index, compare, and aggregate without runtime casting; date misc supports interval queries across refresh and retention rules, boolean misc drives gate checks on mandatory artifacts, and integer misc orders competing directives when multiple policies—Compliance Validation Spec, Refresh Cycle Rule with Retention Duration Rule, Lab Assay Protocol with pH Range Specification—apply concurrently. The varchar misc on subjects (**nightly summary** as label_text, **Encoding 01** as encoding) shows the same pattern applied to presentation and serialization concerns rather than enforcement proper.

Taken together, identifier, entity, attr, attr type, and misc form a layered evidentiary grammar for compliance registries: identifiers stabilize reference; entities anchor obligation to specific policies, frozen snapshots, and evidentiary subjects; attrs name the dimensions along which governance is expressed; attr types enforce interpretability; and misc supplies the auditable facts that transform declarative rules—Sensor Calibration Directive on **POLI-0001**, Telemetry Sampling Rule on **POLI-0003**, Logging Level Directive on **POLI-0004**—into machine-actionable state. Registries that preserve this separation withstand schema evolution and cross-domain reuse: new attr slots can be introduced with explicit types without rewriting entity cores, and the same misc machinery that records **GOVE-0002**’s **2024-02-08** effective_date and priority **718** can attest, years later, that a frozen Model-Prod-v4 artifact was governed under known enforcement (**Enforcement 02**) and mandatory **true** at the time compliance was assessed. That compositional rigor is why these five constructs matter not as incidental column labels but as the structural vocabulary through which governance data remains legible to humans, validators, and retention systems alike.

**t_frozen_artifact_governed_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| GOVE-0001 | effective_date | xsd:date |
| GOVE-0002 | enforcement | xsd:string |
| GOVE-0003 | mandatory | xsd:boolean |
| GOVE-0004 | priority | xsd:integer |
| GOVE-0005 | review_cycle_days | xsd:integer |
| GOVE-0006 | scope | xsd:string |
| GOVE-0007 | encoding | xsd:string |
| GOVE-0008 | label_text | xsd:string |

**t_ice_exactly_one_subject_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUBJ-0001 | encoding | xsd:string |
| SUBJ-0002 | label_text | xsd:string |
| SUBJ-0003 | language | xsd:string |