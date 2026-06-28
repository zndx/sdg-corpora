---
chapter_id: ch_live_apolitical_islam_c7f8ac
topic_id: 83
family: 08_derived
cited_terms: ['apolitical_islam', 'column_pair_subject', 'dempster_conflict_mass']
model: engine-refine
---

Apolitical Islam, as operationalized in doctrinal governance and compliance analytics, denotes institutional postures through which Muslim authority structures disavow direct political capture while retaining normative religious function. The Turkish Diyanet model—registered under ISLA-0001, ISLA-0002, and ISLA-0003—exemplifies state-sponsored religious administration that preserves bureaucratic distance from partisan contestation; Iranian Hawza quietism (ISLA-0004) represents a contrasting lineage in which seminary authority counsels withdrawal from worldly power. These designations are not interchangeable labels: each record couples an apolitical archetype to a doctrinal narrative that supplies its theological rationale. Hadith preservation focus anchors two Diyanet-linked entries; ascetic withdrawal practice and worldly detachment concept articulate, respectively, renunciatory and detachment-based justifications for non-engagement. Against this baseline, political Islam stance fields record the mobilized alternatives that compliance review must distinguish from genuinely apolitical classification—Theocratic state proposal, Militant jihadism, Political enjoinment doctrine, and Islamist governance theory—so that analysts do not conflate quietist administration with latent Islamist program.

Stable identifiers—ISLA-0001 through ISLA-0004 for doctrinal records, SUBJ-0001 through SUBJ-0004 for subject-linkage entities, MASS-0001 through MASS-0005 for evidentiary mass keys—constitute the audit spine of the framework. Identifier discipline matters because downstream attribution, appeal, and cross-corpus reconciliation depend on immutable keys rather than display strings. Entity–attribute–value decomposition extends that spine: each entity (for example ISLA-0001) carries typed attributes whose semantics are declared once and reused. Attribute names such as encoding, label_text, and language are bound to attr_type declarations of xsd:string, ensuring that varchar-stored misc values—Encoding 01, change rationale, fr, Encoding 04—validate against declared types before they enter analytic pipelines. Where ISLA-0001 accumulates multiple attribute bindings (encoding, label text, and French language code fr), the model captures localized and procedural metadata without collapsing heterogeneous facts into a single denormalized row.

Column-pair subject linkage addresses a separate but equally consequential compliance problem: which operational telemetry columns semantically subject which governance fields. Mappings such as log_level to asset_tag, batch_token to asset_tag, transaction_id to control_id, and timestamp_utc to record_id establish traceable joins between ingestion logs and governed assets. Each pair (SUBJ-0001 through SUBJ-0004) may itself be annotated—confidence as xsd:decimal, dimension_kind and method as xsd:string, recorded_at as xsd:dateTime—so that provenance of the mapping is as auditable as the mapping itself. Observed varchar miscellany (Dimension Kind 01, Encoding 02, audit excerpt, language code ja) and decimal readings (0.167, 866.89, 939.39, 0.312) populate entity-specific attribute slots; recorded_at timestamps spanning 2023-03-08T01:00:53 through 2025-01-28T08:00:28 document when subject-linkage assertions entered the corpus, supporting temporal defensibility in regulatory inquiry.

**t_column_pair_subject_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0004 | 2023-03-08T01:00:53 |
| SUBJ-0002 | SUBJ-0002 | SUBJ-0004 | 2023-09-25T09:20:34 |
| SUBJ-0003 | SUBJ-0003 | SUBJ-0004 | 2025-01-28T08:00:28 |
| SUBJ-0004 | SUBJ-0004 | SUBJ-0004 | 2023-08-23T03:35:02 |
| SUBJ-0005 | SUBJ-0005 | SUBJ-0004 | 2024-12-26T07:43:51 |
| SUBJ-0006 | SUBJ-0006 | SUBJ-0004 | 2025-02-08T03:11:44 |
| SUBJ-0007 | SUBJ-0007 | SUBJ-0004 | 2024-12-23T16:25:42 |

**t_column_pair_subject_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0001 | 0.167 |
| SUBJ-0002 | SUBJ-0001 | SUBJ-0005 | 866.89 |
| SUBJ-0003 | SUBJ-0001 | SUBJ-0007 | 939.39 |
| SUBJ-0004 | SUBJ-0002 | SUBJ-0001 | 0.312 |
| SUBJ-0005 | SUBJ-0002 | SUBJ-0005 | 788.04 |
| SUBJ-0006 | SUBJ-0002 | SUBJ-0007 | 1.19 |
| SUBJ-0007 | SUBJ-0003 | SUBJ-0001 | 0.974 |
| SUBJ-0008 | SUBJ-0003 | SUBJ-0005 | 706.00 |

Confidence and uncertainty, stored in fact_dempster and threaded through subject-linkage annotations, quantify evidentiary weight under Dempster–Shafer aggregation rather than classical probability alone. Confidence values of 0.153, 0.014, 0.025, and 0.728 on mass-linked facts express graded belief in assigned classifications; paired uncertainty magnitudes (9.49, 392.06, 687.80, 479.57) and misc-valued mass contributions (520.46, 137.18, 197.61, 846.10) capture residual ignorance and conflict among sources. Conflict mass keys (MASS-0001 through MASS-0005) resolve to dimensional categories—Conflict Mass Category 01 through Conflict Mass Category 04—so that analysts can report not only what was concluded but how strongly competing hypotheses remained unresolved. A high-confidence assignment (0.728) does not eliminate elevated uncertainty (479.57); the framework treats both measures as mandatory disclosure fields because governance consumers must judge whether classification warrants automated action or human escalation.

Category assignment closes the loop between raw evidentiary mass and actionable policy tiers. Conflict mass labels (Conflict Mass Label 01 through Conflict Mass Label 04) provide human-readable handles atop categorical bins, enabling compliance dashboards to filter records by dispute intensity without exposing internal key structures. In practice, an apolitical Islam classification workflow proceeds as follows: doctrinal entities are registered with narrative and stance differentials; encoding and language attributes localize presentation; column-pair subjects bind audit trails to asset and control identifiers; Dempster facts accumulate confidence, uncertainty, and mass values against categorized conflict dimensions. Misc fields throughout—whether varchar rationales, audit excerpts, or numeric mass residuals—hold values that resist rigid typing yet remain essential for examiner review. The architecture’s operative principle is evidentiary layering: theological substance (apoliticalislam, doctrinalnarrative, politicalislamstance), structural identity (identifier, entity, attr, attr_type), operational traceability (subject linkage, recorded_at), and belief-theoretic qualification (confidence, uncertainty, conflict mass, category) must cohere before a classification is released for downstream enforcement or publication.

**t_apolitical_islam**

| id | apolitical_islam | doctrinal_narrative | political_islam_stance |
| --- | --- | --- | --- |
| ISLA-0001 | Turkish Diyanet model | Hadith preservation focus | Theocratic state proposal |
| ISLA-0002 | Turkish Diyanet model | Ascetic withdrawal practice | Militant jihadism |
| ISLA-0003 | Turkish Diyanet model | Hadith preservation focus | Political enjoinment doctrine |
| ISLA-0004 | Iranian Hawza quietism | Worldly detachment concept | Islamist governance theory |
| ISLA-0005 | Sunni quietism | Hadith preservation focus | Theocratic state proposal |
| ISLA-0006 | Ahl-e Hadith | Community stability tenet | Islamist constitutionalism |
| ISLA-0007 | Deobandi quietism | Taqlid adherence tradition | Revolutionary vanguard model |

**t_apolitical_islam_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ISLA-0001 | encoding | xsd:string |
| ISLA-0002 | label_text | xsd:string |
| ISLA-0003 | language | xsd:string |

**t_apolitical_islam_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ISLA-0001 | ISLA-0001 | ISLA-0001 | Encoding 01 |
| ISLA-0002 | ISLA-0001 | ISLA-0002 | change rationale |
| ISLA-0003 | ISLA-0001 | ISLA-0003 | fr |
| ISLA-0004 | ISLA-0002 | ISLA-0001 | Encoding 04 |
| ISLA-0005 | ISLA-0002 | ISLA-0002 | audit excerpt |
| ISLA-0006 | ISLA-0002 | ISLA-0003 | fr |
| ISLA-0007 | ISLA-0003 | ISLA-0001 | Encoding 07 |
| ISLA-0008 | ISLA-0003 | ISLA-0002 | pre-release note |

**t_column_pair_subject**

| id | column | subject_column |
| --- | --- | --- |
| SUBJ-0001 | log_level | asset_tag |
| SUBJ-0002 | batch_token | asset_tag |
| SUBJ-0003 | transaction_id | control_id |
| SUBJ-0004 | timestamp_utc | record_id |
| SUBJ-0005 | patient_id | dataset_uid |
| SUBJ-0006 | transaction_id | dataset_uid |
| SUBJ-0007 | batch_token | record_id |

**t_column_pair_subject_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUBJ-0001 | confidence | xsd:decimal |
| SUBJ-0002 | dimension_kind | xsd:string |
| SUBJ-0003 | method | xsd:string |
| SUBJ-0004 | recorded_at | xsd:dateTime |
| SUBJ-0005 | uncertainty | xsd:decimal |
| SUBJ-0006 | unit | xsd:string |
| SUBJ-0007 | value | xsd:decimal |
| SUBJ-0008 | encoding | xsd:string |

**t_column_pair_subject_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0002 | Dimension Kind 01 |
| SUBJ-0002 | SUBJ-0001 | SUBJ-0008 | Encoding 02 |
| SUBJ-0003 | SUBJ-0001 | SUBJ-0009 | audit excerpt |
| SUBJ-0004 | SUBJ-0001 | SUBJ-0010 | ja |
| SUBJ-0005 | SUBJ-0001 | SUBJ-0003 | manual |
| SUBJ-0006 | SUBJ-0001 | SUBJ-0006 | ms |
| SUBJ-0007 | SUBJ-0002 | SUBJ-0002 | Dimension Kind 07 |
| SUBJ-0008 | SUBJ-0002 | SUBJ-0008 | Encoding 08 |

**fact_dempster**

| id | conflict_mass_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MASS-0001 | MASS-0003 | 0.153 | 9.49 | 520.46 |
| MASS-0002 | MASS-0002 | 0.014 | 392.06 | 137.18 |
| MASS-0003 | MASS-0005 | 0.025 | 687.80 | 197.61 |
| MASS-0004 | MASS-0001 | 0.728 | 479.57 | 846.10 |
| MASS-0005 | MASS-0006 | 0.918 | 172.36 | 296.96 |
| MASS-0006 | MASS-0001 | 0.755 | 608.06 | 341.51 |

**dim_conflict_mass**

| id | conflict_mass_label | conflict_mass_category |
| --- | --- | --- |
| MASS-0001 | Conflict Mass Label 01 | Conflict Mass Category 01 |
| MASS-0002 | Conflict Mass Label 02 | Conflict Mass Category 02 |
| MASS-0003 | Conflict Mass Label 03 | Conflict Mass Category 03 |
| MASS-0004 | Conflict Mass Label 04 | Conflict Mass Category 04 |
| MASS-0005 | Conflict Mass Label 05 | Conflict Mass Category 05 |
| MASS-0006 | Conflict Mass Label 06 | Conflict Mass Category 06 |