## The Clinical Study Entity

The domain under examination is the administration and tracking of clinical research studies, where each study is a first-class entity carrying its own lifecycle, financial backing, and scientific scope. A clinical study is identified by a surrogate primary key (`clinical_study_id`) and a business-level `study_id` that may take the form of a short label such as `Karyawan` or a numeric string like `392491`. The `title` column stores a human-readable project name—`Compact Initiative`, `Legacy Model`, `Regional Cluster A`, `Seasonal Review`—while the `status` column constrains the study to one of four lifecycle states: `planning`, `recruiting`, `active`, or `completed`. Temporal boundaries are captured by `start_date` and `end_date`, both stored as ISO-8601 timestamps; for instance, study 1 (`Compact Initiative`) began on `2022-09-05T20:24:00` and ended on `2022-09-01T08:00:00`, a date ordering that signals a data-entry anomaly rather than a logical impossibility. The `funding_agency` column holds a free-text name of the sponsoring organization—`Alaska Air Group Inc`, `General Foods`, `Oscar Health Inc.`, `Mastercard International`—while `primary_objective` encodes the study's scientific aim using a coded string such as `primary-primary-58` or `adaptive-primary-59`. Two foreign keys anchor the study to its human and financial context: `researcher_id` points into the `researchers` table, and `funding_award_id` points into the `funding_awards` table.

**Table `clinical_studies`**

| clinical_study_id | study_id | title | status | start_date | end_date | funding_agency | primary_objective | researcher_id | funding_award_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Karyawan | Compact Initiative | planning | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | Alaska Air Group Inc | primary-primary-58 | 1 | 1000 |
| 2 | 392491 | Legacy Model | recruiting | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | General Foods | adaptive-primary-59 | 2 | 1001 |
| 3 | 9568466 | Regional Cluster A | active | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | Oscar Health Inc. | distributed-primary-60 | 3 | 1002 |
| 4 | 4985166 | Seasonal Review | completed | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | Mastercard International | baseline-primary-61 | 4 | 1003 |

The `clinical_studies` table is the central hub of the schema. Every other base table either references it directly through a `clinical_study_id` foreign key or reaches it indirectly through a junction table. This star-like topology means that a single query against `clinical_studies` can be enriched with researcher names, funding amounts, medical condition categories, and intervention types by joining outward along these foreign-key edges.

## Researchers and Collaborative Networks

The `researchers` table stores individual people involved in clinical research, each row carrying a surrogate `id`, a business `researcher_id` (e.g., `89419`, `2618557`), a `full_name` such as `Theodore Mcgrath` or `Norma Fisher`, and a `role` drawn from a controlled vocabulary: `principal_investigator`, `co_investigator`, `patient_partner`, `stakeholder_partner`. The `affiliation` column records the researcher's institutional home—`baseline-affiliat-55`, `pilot-affiliat-56`, `extended-affiliat-57`, `integrated-affiliat-58`—while `credentials` stores a coded credential string like `composite-credenti-87`. The `clinical_study_id` column is a foreign key back to `clinical_studies`, establishing that each researcher row belongs to exactly one study. A self-referencing column, `collaborates_with_researcher_id`, allows researchers to declare a peer collaboration link; in the sample data every researcher's `collaborates_with_researcher_id` matches their own `id`, indicating a one-to-one self-reference that could be replaced by a many-to-many junction in a production system.

**Table `researchers`**

| id | researcher_id | full_name | role | affiliation | credentials | clinical_study_id | collaborates_with_researcher_id |
|---|---|---|---|---|---|---|---|
| 1 | 89419 | Theodore Mcgrath | principal_investigator | baseline-affiliat-55 | composite-credenti-87 | 1 | 1 |
| 2 | 2618557 | Account Name | co_investigator | pilot-affiliat-56 | primary-credenti-88 | 2 | 2 |
| 3 | 9736892 | Saipan International Airport | patient_partner | extended-affiliat-57 | adaptive-credenti-89 | 3 | 3 |
| 4 | 1450639 | Norma Fisher | stakeholder_partner | integrated-affiliat-58 | distributed-credenti-90 | 4 | 4 |

The cardinality between `clinical_studies` and `researchers` is one-to-many: a single study such as `Regional Cluster A` (study 3) is associated with researcher id 3 (`Saipan International Airport`, role `patient_partner`), while a single researcher row belongs to exactly one study. The `researcher_id` business key is unique within the table, enabling lookups by researcher identity without relying on the surrogate `id`.

## Funding and Agency Relationships

Financial support for clinical studies is modelled through two tables: `funding_awards` and `funding_agencies`. The `funding_awards` table is the bridge between a study and its sponsor. Each row carries a surrogate `funding_award_id` (e.g., `1000`, `1001`), a business `award_id` that may be a UUID (`e02275d4-8fd1-11eb-924d-9cd76263cbd0`) or a plain string (`3012811`, `state_uk_17`), an `award_date` such as `2025-12-01`, a `total_amount` stored as a numeric value ranging from `112.11` to `15,418`, a `duration_months` integer (44 through 74), and a `status` of `approved`, `active`, or `closed`. The `clinical_study_id` foreign key ties the award to its study, while `funding_agency_id` points into `funding_agencies`.

**Table `funding_awards`**

| funding_award_id | award_id | award_date | total_amount | duration_months | status | clinical_study_id | funding_agency_id |
|---|---|---|---|---|---|---|---|
| 1000 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | 2025-12-01 | 112.11 | 44 | approved | 1 | 100 |
| 1001 | 3012811 | 2022-05-12 | 1,979 | 54 | active | 2 | 101 |
| 1002 | 15493350 | 2023-10-23 | 15,418 | 64 | closed | 3 | 102 |
| 1003 | state_uk_17 | 2024-03-07 | 12,579 | 74 | approved | 4 | 103 |

The `funding_agencies` table holds the sponsor organizations themselves. Each row has a surrogate `id` (100–103), a business `agency_id` that coincidentally matches the surrogate in this dataset (e.g., `100` for `U.S. Steel`), an `agency_name` such as `FSG Social Impact Advisors` or `Whirlpool Corporation`, a `website` URL, and a `funding_award_id` foreign key back to `funding_awards`. This creates a one-to-one relationship between `funding_agencies` and `funding_awards` in the current schema: each award is linked to exactly one agency, and each agency row references exactly one award. The `funding_agency` free-text column in `clinical_studies` is a denormalized copy of the agency name, retained for convenience but not enforced by a foreign key.

**Table `funding_agencies`**

| id | agency_id | agency_name | website | funding_award_id |
|---|---|---|---|---|
| 100 | U.S. Steel | FSG Social Impact Advisors | https://bugs.launchpad.net/murano/+bug/1294080 | 1000 |
| 101 | Nikola Corporation | Whirlpool Corporation | https://bugs.launchpad.net/murano/+bug/1294080 | 1001 |
| 102 | Oberthur Technologies | Education Writers Association | https://www.nature.com/articles/nphoton.2008.245 | 1002 |
| 103 | General Telephone & Electronics | Switch Card Services Ltd. | https://bugs.launchpad.net/trove/+bug/1347114 | 1003 |

The cardinality from `clinical_studies` to `funding_awards` is one-to-one in the sample data—study 1 (`Compact Initiative`) has award `1000` with amount `112.11` and duration `44` months, while study 4 (`Seasonal Review`) has award `1003` with amount `12,579` and duration `74` months. A production extension could relax this to one-to-many, allowing a study to carry multiple awards.

## Medical Conditions and Interventions

Medical conditions targeted by a study are stored in the `medical_conditions` table. Each row has a surrogate `id`, a business `condition_id` (which may be a UUID like `a9624ee2-9bad-11eb-a8a2-19ed5c03f8d3` or a short string like `9568469`), a `condition_name` such as `Compact Standard` or `Seasonal Programme`, a `category` drawn from a controlled list (`trauma_injury`, `cancer`, `cardiovascular`, `musculoskeletal`), and a `clinical_study_id` foreign key. The cardinality is one-to-many: each condition belongs to exactly one study, and a study may target multiple conditions.

**Table `medical_conditions`**

| id | condition_id | condition_name | category | clinical_study_id |
|---|---|---|---|---|
| 100 | a9624ee2-9bad-11eb-a8a2-19ed5c03f8d3 | Compact Standard | trauma_injury | 1 |
| 101 | 9568469 | Legacy Framework | cancer | 2 |
| 102 | 4716413 | Regional Protocol A | cardiovascular | 3 |
| 103 | dce72594-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Programme | musculoskeletal | 4 |

The `interventions` table describes the treatments or procedures applied within a study. Its columns are `intervention_id` (UUID or string), `intervention_name` (e.g., `Integrated Protocol A`, `Extended Programme`), `type` (one of `drug`, `surgery`, `radiation`, `screening`), `dosage` (a coded string such as `seasonal-dosage-83` or `regional-dosage-84`), and `clinical_study_id`. Like conditions, interventions are one-to-many with studies.

**Table `interventions`**

| intervention_id | intervention_name | type | dosage | clinical_study_id |
|---|---|---|---|---|
| d64c33f2-8fc1-11eb-924d-9cd76263cbd0 | Integrated Protocol A | drug | seasonal-dosage-83 | 1 |
| L408 | Extended Programme | surgery | regional-dosage-84 | 2 |
| eff2857c-8fcb-11eb-924d-9cd76263cbd0 | Pilot Standard | radiation | legacy-dosage-85 | 3 |
| 2618554 | Baseline Framework D | screening | compact-dosage-86 | 4 |

In the sample data, study 1 (`Compact Initiative`) uses intervention `d64c33f2-8fc1-11eb-924d-9cd76263cbd0` named `Integrated Protocol A` of type `drug` with dosage `seasonal-dosage-83`, while study 2 (`Legacy Model`) applies intervention `L408` named `Extended Programme` of type `surgery` with dosage `regional-dosage-84`.

## Clinical Outcomes

Clinical outcomes are captured in the `clinical_outcomes` table, which follows the same structural pattern as `medical_conditions` and `interventions`: a surrogate key, a business identifier, descriptive columns, and a `clinical_study_id` foreign key. The table is linked to `clinical_studies` through the junction table `studies_outcomes`, which enables a many-to-many relationship between studies and outcomes. The `studies_outcomes` junction table contains at least two columns—`clinical_study_id` and `clinical_outcome_id`—forming a composite primary key and two foreign keys, one to each parent table. This design allows a single outcome measure to be reported across multiple studies and a single study to report multiple outcomes.

**Table `clinical_outcomes`**

| id | outcome_id | outcome_name | measurement_type | unit | clinical_study_id |
|---|---|---|---|---|---|
| 1 | 2618555 | Primary Corridor A | binary | distributed-unit-18 | 1 |
| 2 | lu_tax_code_template_m46 | Composite Series | continuous | baseline-unit-19 | 2 |
| 3 | 168561 | Compact Assessment | ordinal | pilot-unit-20 | 3 |
| 4 | 1210-0007-M | Legacy Survey D | time_to_event | extended-unit-21 | 4 |

**Table `studies_conditions`**

| clinical_study_id | medical_condition_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `studies_interventions`**

| clinical_study_id | intervention_id |
|---|---|
| 1 | d64c33f2-8fc1-11eb-924d-9cd76263cbd0 |
| 1 | L408 |
| 2 | L408 |
| 2 | eff2857c-8fcb-11eb-924d-9cd76263cbd0 |
| 3 | eff2857c-8fcb-11eb-924d-9cd76263cbd0 |
| 3 | 2618554 |
| 4 | 2618554 |
| 4 | d64c33f2-8fc1-11eb-924d-9cd76263cbd0 |

**Table `studies_outcomes`**

| clinical_study_id | clinical_outcome_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The junction tables (`studies_conditions`, `studies_interventions`, `studies_outcomes`) are the canonical relational mechanism for expressing many-to-many relationships. Each junction table has a composite primary key formed by the pair of foreign keys, and each foreign key references the corresponding entity table. In the current schema, the one-to-many columns `clinical_study_id` in `medical_conditions`, `interventions`, and `clinical_outcomes` provide a denormalized shortcut, but the junction tables remain the authoritative source for the many-to-many mapping.

## Denormalized Views for Query Patterns

The schema provides a set of materialized or virtual views that pre-join the normalized tables into query-friendly shapes. Each view answers a specific analytical question by assembling columns from two or more base tables.

The view `v_clinical_study_researcher` joins `clinical_studies` to `researchers` on `clinical_study_id`, producing one row per researcher-study pairing. It surfaces the study's `title` and `status` alongside the researcher's `full_name`, `role`, and `affiliation`. For example, the row for study 1 (`Compact Initiative`, status `planning`) paired with researcher `Theodore Mcgrath` (role `principal_investigator`, affiliation `baseline-affiliat-55`) lets a data consumer answer "Which principal investigator is assigned to the planning-stage Compact Initiative study?" in a single read.

**View `v_clinical_study_researcher`**

```sql
CREATE VIEW v_clinical_study_researcher AS
SELECT a.clinical_study_id, a.study_id, a.title, a.status, b.id AS researcher_id, b.researcher_id AS researcher_researcher_id, b.full_name AS researcher_full_name
FROM clinical_studies a JOIN researchers b ON a.researcher_id = b.id;
```

| clinical_study_id | study_id | title | status | researcher_id | researcher_researcher_id | researcher_full_name |
|---|---|---|---|---|---|---|
| 1 | Karyawan | Compact Initiative | planning | 1 | 89419 | Theodore Mcgrath |
| 2 | 392491 | Legacy Model | recruiting | 2 | 2618557 | Account Name |
| 3 | 9568466 | Regional Cluster A | active | 3 | 9736892 | Saipan International Airport |
| 4 | 4985166 | Seasonal Review | completed | 4 | 1450639 | Norma Fisher |

The view `v_clinical_study_funding_award` joins `clinical_studies` to `funding_awards` on `clinical_study_id`, exposing the study title and status alongside the award's `award_id`, `award_date`, `total_amount`, `duration_months`, and `status`. Study 3 (`Regional Cluster A`, status `active`) is linked to award `1002` with `total_amount` `15,418`, `duration_months` `64`, and status `closed`; this row answers "What is the total funding and duration for the active Regional Cluster A study?"

**View `v_clinical_study_funding_award`**

```sql
CREATE VIEW v_clinical_study_funding_award AS
SELECT a.clinical_study_id, a.study_id, a.title, a.status, b.funding_award_id AS award_funding_award_id, b.award_id AS award_award_id, b.award_date AS award_award_date
FROM clinical_studies a JOIN funding_awards b ON a.funding_award_id = b.funding_award_id;
```

| clinical_study_id | study_id | title | status | award_funding_award_id | award_award_id | award_award_date |
|---|---|---|---|---|---|---|
| 1 | Karyawan | Compact Initiative | planning | 1000 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | 2025-12-01 |
| 2 | 392491 | Legacy Model | recruiting | 1001 | 3012811 | 2022-05-12 |
| 3 | 9568466 | Regional Cluster A | active | 1002 | 15493350 | 2023-10-23 |
| 4 | 4985166 | Seasonal Review | completed | 1003 | state_uk_17 | 2024-03-07 |

The view `v_clinical_study_medical_condition_detail` joins `clinical_studies` to `medical_conditions` on `clinical_study_id`, returning the study title and status together with the condition's `condition_name` and `category`. Study 2 (`Legacy Model`, status `recruiting`) is associated with condition `9568469` named `Legacy Framework` in category `cancer`; this row answers "Which cancer-focused conditions are being studied in the recruiting Legacy Model trial?"

**View `v_clinical_study_medical_condition_detail`**

```sql
CREATE VIEW v_clinical_study_medical_condition_detail AS
SELECT a.clinical_study_id, a.study_id, a.title, b.id AS condition_id, b.condition_id AS condition_condition_id, b.condition_name AS condition_condition_name
FROM clinical_studies a
  JOIN studies_conditions j ON j.clinical_study_id = a.clinical_study_id
  JOIN medical_conditions b ON b.id = j.medical_condition_id;
```

| clinical_study_id | study_id | title | condition_id | condition_condition_id | condition_condition_name |
|---|---|---|---|---|---|
| 1 | Karyawan | Compact Initiative | 100 | a9624ee2-9bad-11eb-a8a2-19ed5c03f8d3 | Compact Standard |
| 1 | Karyawan | Compact Initiative | 101 | 9568469 | Legacy Framework |
| 2 | 392491 | Legacy Model | 101 | 9568469 | Legacy Framework |
| 2 | 392491 | Legacy Model | 102 | 4716413 | Regional Protocol A |
| 3 | 9568466 | Regional Cluster A | 102 | 4716413 | Regional Protocol A |
| 3 | 9568466 | Regional Cluster A | 103 | dce72594-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Programme |
| 4 | 4985166 | Seasonal Review | 103 | dce72594-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Programme |
| 4 | 4985166 | Seasonal Review | 100 | a9624ee2-9bad-11eb-a8a2-19ed5c03f8d3 | Compact Standard |

The view `v_clinical_study_intervention_detail` joins `clinical_studies` to `interventions` on `clinical_study_id`, surfacing the study title and status alongside the intervention's `intervention_name`, `type`, and `dosage`. Study 4 (`Seasonal Review`, status `completed`) uses intervention `2618554` named `Baseline Framework D` of type `screening` with dosage `compact-dosage-86`; this row answers "What screening intervention was applied in the completed Seasonal Review study?"

**View `v_clinical_study_intervention_detail`**

```sql
CREATE VIEW v_clinical_study_intervention_detail AS
SELECT a.clinical_study_id, a.study_id, a.title, b.intervention_id AS intervention_intervention_id, b.intervention_name AS intervention_intervention_name, b.type AS intervention_type
FROM clinical_studies a
  JOIN studies_interventions j ON j.clinical_study_id = a.clinical_study_id
  JOIN interventions b ON b.intervention_id = j.intervention_id;
```

| clinical_study_id | study_id | title | intervention_intervention_id | intervention_intervention_name | intervention_type |
|---|---|---|---|---|---|
| 1 | Karyawan | Compact Initiative | d64c33f2-8fc1-11eb-924d-9cd76263cbd0 | Integrated Protocol A | drug |
| 1 | Karyawan | Compact Initiative | L408 | Extended Programme | surgery |
| 2 | 392491 | Legacy Model | L408 | Extended Programme | surgery |
| 2 | 392491 | Legacy Model | eff2857c-8fcb-11eb-924d-9cd76263cbd0 | Pilot Standard | radiation |
| 3 | 9568466 | Regional Cluster A | eff2857c-8fcb-11eb-924d-9cd76263cbd0 | Pilot Standard | radiation |
| 3 | 9568466 | Regional Cluster A | 2618554 | Baseline Framework D | screening |
| 4 | 4985166 | Seasonal Review | 2618554 | Baseline Framework D | screening |
| 4 | 4985166 | Seasonal Review | d64c33f2-8fc1-11eb-924d-9cd76263cbd0 | Integrated Protocol A | drug |

The view `v_clinical_study_clinical_outcome_detail` joins `clinical_studies` to `clinical_outcomes` (via `studies_outcomes`), returning the study title and status alongside the outcome's identifier and descriptive columns. This view answers "Which clinical outcomes were measured in a given study?" by presenting one row per outcome-study pairing.

**View `v_clinical_study_clinical_outcome_detail`**

```sql
CREATE VIEW v_clinical_study_clinical_outcome_detail AS
SELECT a.clinical_study_id, a.study_id, a.title, b.id AS outcome_id, b.outcome_id AS outcome_outcome_id, b.outcome_name AS outcome_outcome_name
FROM clinical_studies a
  JOIN studies_outcomes j ON j.clinical_study_id = a.clinical_study_id
  JOIN clinical_outcomes b ON b.id = j.clinical_outcome_id;
```

| clinical_study_id | study_id | title | outcome_id | outcome_outcome_id | outcome_outcome_name |
|---|---|---|---|---|---|
| 1 | Karyawan | Compact Initiative | 1 | 2618555 | Primary Corridor A |
| 1 | Karyawan | Compact Initiative | 2 | lu_tax_code_template_m46 | Composite Series |
| 2 | 392491 | Legacy Model | 2 | lu_tax_code_template_m46 | Composite Series |
| 2 | 392491 | Legacy Model | 3 | 168561 | Compact Assessment |
| 3 | 9568466 | Regional Cluster A | 3 | 168561 | Compact Assessment |
| 3 | 9568466 | Regional Cluster A | 4 | 1210-0007-M | Legacy Survey D |
| 4 | 4985166 | Seasonal Review | 4 | 1210-0007-M | Legacy Survey D |
| 4 | 4985166 | Seasonal Review | 1 | 2618555 | Primary Corridor A |

The view `v_researcher_clinical_study` reverses the join direction, starting from `researchers` and joining to `clinical_studies`. It answers "What study is this researcher assigned to?" by presenting the researcher's `full_name`, `role`, and `affiliation` alongside the study's `title` and `status`. Researcher id 4 (`Norma Fisher`, role `stakeholder_partner`, affiliation `integrated-affiliat-58`) is linked to study 4 (`Seasonal Review`, status `completed`).

**View `v_researcher_clinical_study`**

```sql
CREATE VIEW v_researcher_clinical_study AS
SELECT a.id, a.researcher_id, a.full_name, a.role, b.clinical_study_id AS study_clinical_study_id, b.study_id AS study_study_id, b.title AS study_title
FROM researchers a JOIN clinical_studies b ON a.clinical_study_id = b.clinical_study_id;
```

| id | researcher_id | full_name | role | study_clinical_study_id | study_study_id | study_title |
|---|---|---|---|---|---|---|
| 1 | 89419 | Theodore Mcgrath | principal_investigator | 1 | Karyawan | Compact Initiative |
| 2 | 2618557 | Account Name | co_investigator | 2 | 392491 | Legacy Model |
| 3 | 9736892 | Saipan International Airport | patient_partner | 3 | 9568466 | Regional Cluster A |
| 4 | 1450639 | Norma Fisher | stakeholder_partner | 4 | 4985166 | Seasonal Review |

The view `v_researcher_researcher` performs a self-join on the `researchers` table, matching each researcher to their `collaborates_with_researcher_id` peer. In the sample data, every researcher's collaboration link points to themselves, so each row pairs a researcher with their own `full_name` and `role`. This view is useful for auditing collaboration structures and for future expansion where cross-researcher links would be non-trivial.

**View `v_researcher_researcher`**

```sql
CREATE VIEW v_researcher_researcher AS
SELECT a.id, a.researcher_id, a.full_name, a.role, b.id AS researcher_id, b.researcher_id AS researcher_researcher_id, b.full_name AS researcher_full_name
FROM researchers a JOIN researchers b ON a.collaborates_with_researcher_id = b.id;
```

| id | researcher_id | full_name | role | researcher_id | researcher_researcher_id | researcher_full_name |
|---|---|---|---|---|---|---|
| 1 | 89419 | Theodore Mcgrath | principal_investigator | 1 | 89419 | Theodore Mcgrath |
| 2 | 2618557 | Account Name | co_investigator | 2 | 2618557 | Account Name |
| 3 | 9736892 | Saipan International Airport | patient_partner | 3 | 9736892 | Saipan International Airport |
| 4 | 1450639 | Norma Fisher | stakeholder_partner | 4 | 1450639 | Norma Fisher |

The view `v_funding_award_clinical_study` joins `funding_awards` to `clinical_studies` on `clinical_study_id`, presenting the award's `award_id`, `award_date`, `total_amount`, and `status` alongside the study's `title` and `status`. Award `1001` (date `2022-05-12`, amount `1,979`, status `active`) is linked to study 2 (`Legacy Model`, status `recruiting`), answering "Which recruiting study does this active award fund?"

**View `v_funding_award_clinical_study`**

```sql
CREATE VIEW v_funding_award_clinical_study AS
SELECT a.funding_award_id, a.award_id, a.award_date, a.total_amount, b.clinical_study_id AS study_clinical_study_id, b.study_id AS study_study_id, b.title AS study_title
FROM funding_awards a JOIN clinical_studies b ON a.clinical_study_id = b.clinical_study_id;
```

| funding_award_id | award_id | award_date | total_amount | study_clinical_study_id | study_study_id | study_title |
|---|---|---|---|---|---|---|
| 1000 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | 2025-12-01 | 112.11 | 1 | Karyawan | Compact Initiative |
| 1001 | 3012811 | 2022-05-12 | 1,979 | 2 | 392491 | Legacy Model |
| 1002 | 15493350 | 2023-10-23 | 15,418 | 3 | 9568466 | Regional Cluster A |
| 1003 | state_uk_17 | 2024-03-07 | 12,579 | 4 | 4985166 | Seasonal Review |

The view `v_funding_award_funding_agency` joins `funding_awards` to `funding_agencies` on `funding_agency_id`, surfacing the award's `award_id`, `award_date`, and `total_amount` alongside the agency's `agency_name` and `website`. Award `1000` (amount `112.11`) is linked to agency `U.S. Steel` (name `FSG Social Impact Advisors`, website `https://bugs.launchpad.net/murano/+bug/1294080`), answering "Which agency sponsors this award?"

**View `v_funding_award_funding_agency`**

```sql
CREATE VIEW v_funding_award_funding_agency AS
SELECT a.funding_award_id, a.award_id, a.award_date, a.total_amount, b.id AS agency_id, b.agency_id AS agency_agency_id, b.agency_name AS agency_agency_name
FROM funding_awards a JOIN funding_agencies b ON a.funding_agency_id = b.id;
```

| funding_award_id | award_id | award_date | total_amount | agency_id | agency_agency_id | agency_agency_name |
|---|---|---|---|---|---|---|
| 1000 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | 2025-12-01 | 112.11 | 100 | U.S. Steel | FSG Social Impact Advisors |
| 1001 | 3012811 | 2022-05-12 | 1,979 | 101 | Nikola Corporation | Whirlpool Corporation |
| 1002 | 15493350 | 2023-10-23 | 15,418 | 102 | Oberthur Technologies | Education Writers Association |
| 1003 | state_uk_17 | 2024-03-07 | 12,579 | 103 | General Telephone & Electronics | Switch Card Services Ltd. |

The view `v_funding_agency_funding_award` reverses the join, starting from `funding_agencies` and joining to `funding_awards`. It answers "What awards does this agency sponsor?" by presenting the agency's `agency_name` and `website` alongside the award's `award_id`, `award_date`, and `total_amount`. Agency id 102 (`Oberthur Technologies`, name `Education Writers Association`) sponsors award `1002` (amount `15,418`, date `2023-10-23`).

**View `v_funding_agency_funding_award`**

```sql
CREATE VIEW v_funding_agency_funding_award AS
SELECT a.id, a.agency_id, a.agency_name, a.website, b.funding_award_id AS award_funding_award_id, b.award_id AS award_award_id, b.award_date AS award_award_date
FROM funding_agencies a JOIN funding_awards b ON a.funding_award_id = b.funding_award_id;
```

| id | agency_id | agency_name | website | award_funding_award_id | award_award_id | award_award_date |
|---|---|---|---|---|---|---|
| 100 | U.S. Steel | FSG Social Impact Advisors | https://bugs.launchpad.net/murano/+bug/1294080 | 1000 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | 2025-12-01 |
| 101 | Nikola Corporation | Whirlpool Corporation | https://bugs.launchpad.net/murano/+bug/1294080 | 1001 | 3012811 | 2022-05-12 |
| 102 | Oberthur Technologies | Education Writers Association | https://www.nature.com/articles/nphoton.2008.245 | 1002 | 15493350 | 2023-10-23 |
| 103 | General Telephone & Electronics | Switch Card Services Ltd. | https://bugs.launchpad.net/trove/+bug/1347114 | 1003 | state_uk_17 | 2024-03-07 |

The view `v_medical_condition_clinical_study` joins `medical_conditions` to `clinical_studies` on `clinical_study_id`, presenting the condition's `condition_name` and `category` alongside the study's `title` and `status`. Condition `a9624ee2-9bad-11eb-a8a2-19ed5c03f8d3` named `Compact Standard` in category `trauma_injury` is linked to study 1 (`Compact Initiative`, status `planning`), answering "Which planning-stage study targets this trauma injury condition?"

**View `v_medical_condition_clinical_study`**

```sql
CREATE VIEW v_medical_condition_clinical_study AS
SELECT a.id, a.condition_id, a.condition_name, a.category, b.clinical_study_id AS study_clinical_study_id, b.study_id AS study_study_id, b.title AS study_title
FROM medical_conditions a JOIN clinical_studies b ON a.clinical_study_id = b.clinical_study_id;
```

| id | condition_id | condition_name | category | study_clinical_study_id | study_study_id | study_title |
|---|---|---|---|---|---|---|
| 100 | a9624ee2-9bad-11eb-a8a2-19ed5c03f8d3 | Compact Standard | trauma_injury | 1 | Karyawan | Compact Initiative |
| 101 | 9568469 | Legacy Framework | cancer | 2 | 392491 | Legacy Model |
| 102 | 4716413 | Regional Protocol A | cardiovascular | 3 | 9568466 | Regional Cluster A |
| 103 | dce72594-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Programme | musculoskeletal | 4 | 4985166 | Seasonal Review |

The view `v_intervention_clinical_study` joins `interventions` to `clinical_studies` on `clinical_study_id`, presenting the intervention's `intervention_name`, `type`, and `dosage` alongside the study's `title` and `status`. Intervention `eff2857c-8fcb-11eb-924d-9cd76263cbd0` named `Pilot Standard` of type `radiation` with dosage `legacy-dosage-85` is linked to study 3 (`Regional Cluster A`, status `active`), answering "Which active study applies this radiation intervention?"

**View `v_intervention_clinical_study`**

```sql
CREATE VIEW v_intervention_clinical_study AS
SELECT a.intervention_id, a.intervention_name, a.type, a.dosage, b.clinical_study_id AS study_clinical_study_id, b.study_id AS study_study_id, b.title AS study_title
FROM interventions a JOIN clinical_studies b ON a.clinical_study_id = b.clinical_study_id;
```

| intervention_id | intervention_name | type | dosage | study_clinical_study_id | study_study_id | study_title |
|---|---|---|---|---|---|---|
| d64c33f2-8fc1-11eb-924d-9cd76263cbd0 | Integrated Protocol A | drug | seasonal-dosage-83 | 1 | Karyawan | Compact Initiative |
| L408 | Extended Programme | surgery | regional-dosage-84 | 2 | 392491 | Legacy Model |
| eff2857c-8fcb-11eb-924d-9cd76263cbd0 | Pilot Standard | radiation | legacy-dosage-85 | 3 | 9568466 | Regional Cluster A |
| 2618554 | Baseline Framework D | screening | compact-dosage-86 | 4 | 4985166 | Seasonal Review |

The view `v_clinical_outcome_clinical_study` joins `clinical_outcomes` to `clinical_studies` (via `studies_outcomes`) on `clinical_study_id`, presenting the outcome's identifier and descriptive columns alongside the study's `title` and `status`. This view answers "Which study reports this clinical outcome?" by assembling the outcome-study pairing into a single denormalized row.

**View `v_clinical_outcome_clinical_study`**

```sql
CREATE VIEW v_clinical_outcome_clinical_study AS
SELECT a.id, a.outcome_id, a.outcome_name, a.measurement_type, b.clinical_study_id AS study_clinical_study_id, b.study_id AS study_study_id, b.title AS study_title
FROM clinical_outcomes a JOIN clinical_studies b ON a.clinical_study_id = b.clinical_study_id;
```

| id | outcome_id | outcome_name | measurement_type | study_clinical_study_id | study_study_id | study_title |
|---|---|---|---|---|---|---|
| 1 | 2618555 | Primary Corridor A | binary | 1 | Karyawan | Compact Initiative |
| 2 | lu_tax_code_template_m46 | Composite Series | continuous | 2 | 392491 | Legacy Model |
| 3 | 168561 | Compact Assessment | ordinal | 3 | 9568466 | Regional Cluster A |
| 4 | 1210-0007-M | Legacy Survey D | time_to_event | 4 | 4985166 | Seasonal Review |

## Synthesis

The schema models clinical research as a central `clinical_studies` entity enriched by five orthogonal dimensions: human resources (`researchers`), financial backing (`funding_awards` and `funding_agencies`), medical scope (`medical_conditions`), therapeutic methods (`interventions`), and measured results (`clinical_outcomes`). The junction tables (`studies_conditions`, `studies_interventions`, `studies_outcomes`) provide the canonical many-to-many mapping, while the one-to-many columns in the entity tables offer denormalized shortcuts. The thirteen views materialize every pairwise join between the central study entity and each dimension, plus the researcher self-join and the funding agency–award join, ensuring that every common analytical question—"Which researcher works on this study?", "What is the total funding for this award?", "Which conditions does this study target?"—can be answered with a single table scan rather than a multi-step join. The design balances normalization (avoiding update anomalies in researcher names, agency details, and condition categories) with query convenience (pre-joined views that eliminate runtime join cost).