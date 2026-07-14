## Clinical Research Operations: Records, Relationships, and Reporting

Clinical research organizations manage a complex ecosystem of studies, investigators, funding streams, and clinical endpoints. Each study is a discrete operational unit with a lifecycle that spans planning through completion, and every unit carries a bundle of associated records: the researchers who design and execute it, the awards that finance it, the medical conditions it targets, the interventions it deploys, and the outcomes it measures. The following chapter describes the core records and the joined views that practitioners use to answer operational questions—what studies are active, which investigators are assigned, how much funding is committed, and how conditions map to interventions.

**Table `clinical_studies`**

| clinical_study_id | study_id | title | status | start_date | end_date | funding_agency | primary_objective | researcher_id | funding_award_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Karyawan | Compact Initiative | planning | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | Alaska Air Group Inc | primary-primary-58 | 1 | 1000 |
| 2 | 392491 | Legacy Model | recruiting | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | General Foods | adaptive-primary-59 | 2 | 1001 |
| 3 | 9568466 | Regional Cluster A | active | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | Oscar Health Inc. | distributed-primary-60 | 3 | 1002 |
| 4 | 4985166 | Seasonal Review | completed | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | Mastercard International | baseline-primary-61 | 4 | 1003 |

The `clinical_studies` table is the central ledger of the domain. Each row represents a single study identified by a surrogate `clinical_study_id` and a human-readable `study_id`. The `title` column carries a project label such as *Compact Initiative* or *Regional Cluster A*, while the `status` column tracks the study's position in its lifecycle: `planning`, `recruiting`, `active`, or `completed`. Dates are recorded in ISO 8601 format; for example, study 3 (*Regional Cluster A*) began on 2024-07-27 and is scheduled to conclude on 2024-07-23. The `funding_agency` column stores a free-text name of the sponsoring organization—Alaska Air Group Inc., General Foods, Oscar Health Inc., and Mastercard International appear in the current dataset. The `primary_objective` field encodes the study's methodological approach, with values like `primary-primary-58` and `distributed-primary-60`. Each study row also carries a `researcher_id` pointing to the lead investigator and a `funding_award_id` linking to the financial award that supports the work.

**Table `researchers`**

| id | researcher_id | full_name | role | affiliation | credentials | clinical_study_id | collaborates_with_researcher_id |
|---|---|---|---|---|---|---|---|
| 1 | 89419 | Theodore Mcgrath | principal_investigator | baseline-affiliat-55 | composite-credenti-87 | 1 | 1 |
| 2 | 2618557 | Account Name | co_investigator | pilot-affiliat-56 | primary-credenti-88 | 2 | 2 |
| 3 | 9736892 | Saipan International Airport | patient_partner | extended-affiliat-57 | adaptive-credenti-89 | 3 | 3 |
| 4 | 1450639 | Norma Fisher | stakeholder_partner | integrated-affiliat-58 | distributed-credenti-90 | 4 | 4 |

The `researchers` table captures the people and roles behind each study. The surrogate `id` distinguishes rows, while `researcher_id` holds a domain-level identifier such as `89419` or `2618557`. The `full_name` column provides the investigator's name—Theodore Mcgrath, Account Name, Saipan International Airport, and Norma Fisher are the four entries in the current data. The `role` column classifies participation: `principal_investigator`, `co_investigator`, `patient_partner`, and `stakeholder_partner`. Affiliation information is stored in `affiliation` (e.g., `baseline-affiliat-55`, `pilot-affiliat-56`), and `credentials` encodes a credential type such as `composite-credenti-87` or `adaptive-credenti-89`. The `clinical_study_id` column ties each researcher to a specific study, and `collaborates_with_researcher_id` records an internal collaboration link, which in the current data points to the same row's `id`, indicating self-referential collaboration records.

**Table `funding_awards`**

| funding_award_id | award_id | award_date | total_amount | duration_months | status | clinical_study_id | funding_agency_id |
|---|---|---|---|---|---|---|---|
| 1000 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | 2025-12-01 | 112.11 | 44 | approved | 1 | 100 |
| 1001 | 3012811 | 2022-05-12 | 1,979 | 54 | active | 2 | 101 |
| 1002 | 15493350 | 2023-10-23 | 15,418 | 64 | closed | 3 | 102 |
| 1003 | state_uk_17 | 2024-03-07 | 12,579 | 74 | approved | 4 | 103 |

Financial support for studies is captured in the `funding_awards` table. Each award has a surrogate `funding_award_id` (1000–1003) and a domain-level `award_id` that may be a UUID (`e02275d4-8fd1-11eb-924d-9cd76263cbd0`) or a numeric string (`3012811`). The `award_date` records when the award was issued, `total_amount` stores the monetary value (ranging from 112.11 to 15,418), and `duration_months` indicates the award period (44 to 74 months). The `status` column tracks the award lifecycle with values `approved`, `active`, and `closed`. The `clinical_study_id` column links the award to its study, and `funding_agency_id` connects it to the sponsoring agency.

**Table `funding_agencies`**

| id | agency_id | agency_name | website | funding_award_id |
|---|---|---|---|---|
| 100 | U.S. Steel | FSG Social Impact Advisors | https://bugs.launchpad.net/murano/+bug/1294080 | 1000 |
| 101 | Nikola Corporation | Whirlpool Corporation | https://bugs.launchpad.net/murano/+bug/1294080 | 1001 |
| 102 | Oberthur Technologies | Education Writers Association | https://www.nature.com/articles/nphoton.2008.245 | 1002 |
| 103 | General Telephone & Electronics | Switch Card Services Ltd. | https://bugs.launchpad.net/trove/+bug/1347114 | 1003 |

The `funding_agencies` table catalogs the organizations that provide financial support. Each row has a surrogate `id` (100–103), a domain `agency_id` that may be a UUID or a name, and an `agency_name` such as *U.S. Steel* or *Nikola Corporation*. The `website` column stores a URL for the agency, and `funding_award_id` links back to the award record. The current dataset includes agencies like Oberthur Technologies and General Telephone & Electronics, each associated with a distinct funding award.

**Table `medical_conditions`**

| id | condition_id | condition_name | category | clinical_study_id |
|---|---|---|---|---|
| 100 | a9624ee2-9bad-11eb-a8a2-19ed5c03f8d3 | Compact Standard | trauma_injury | 1 |
| 101 | 9568469 | Legacy Framework | cancer | 2 |
| 102 | 4716413 | Regional Protocol A | cardiovascular | 3 |
| 103 | dce72594-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Programme | musculoskeletal | 4 |

Medical conditions targeted by studies are recorded in the `medical_conditions` table. Each row has a surrogate `id`, a domain `condition_id` (often a UUID), and a `condition_name` such as *Compact Standard* or *Legacy Framework*. The `category` column classifies the condition into domains like `trauma_injury`, `cancer`, `cardiovascular`, and `musculoskeletal`. The `clinical_study_id` column associates the condition with a specific study, enabling practitioners to query which conditions a study addresses.

**Table `interventions`**

| intervention_id | intervention_name | type | dosage | clinical_study_id |
|---|---|---|---|---|
| d64c33f2-8fc1-11eb-924d-9cd76263cbd0 | Integrated Protocol A | drug | seasonal-dosage-83 | 1 |
| L408 | Extended Programme | surgery | regional-dosage-84 | 2 |
| eff2857c-8fcb-11eb-924d-9cd76263cbd0 | Pilot Standard | radiation | legacy-dosage-85 | 3 |
| 2618554 | Baseline Framework D | screening | compact-dosage-86 | 4 |

The `interventions` table describes the treatments or procedures deployed in each study. Each row carries an `intervention_id` (which may be a UUID or a short code like `L408`), an `intervention_name` such as *Integrated Protocol A* or *Extended Programme*, a `type` column indicating the modality (`drug`, `surgery`, `radiation`, `screening`), a `dosage` field with values like `seasonal-dosage-83` or `regional-dosage-84`, and a `clinical_study_id` linking the intervention to its study.

**Table `clinical_outcomes`**

| id | outcome_id | outcome_name | measurement_type | unit | clinical_study_id |
|---|---|---|---|---|---|
| 1 | 2618555 | Primary Corridor A | binary | distributed-unit-18 | 1 |
| 2 | lu_tax_code_template_m46 | Composite Series | continuous | baseline-unit-19 | 2 |
| 3 | 168561 | Compact Assessment | ordinal | pilot-unit-20 | 3 |
| 4 | 1210-0007-M | Legacy Survey D | time_to_event | extended-unit-21 | 4 |

Clinical outcomes measured by studies are stored in the `clinical_outcomes` table. Each row has a surrogate `id`, a domain `outcome_id`, an `outcome_name` describing the measured endpoint, an `outcome_type` classifying the measurement category, and a `clinical_study_id` associating the outcome with its study. This table enables practitioners to track what each study measures and to aggregate outcomes across studies.

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

The `studies_conditions` table implements the many-to-many relationship between studies and medical conditions. Each row links a `clinical_study_id` to a `condition_id`, allowing a single study to address multiple conditions and a single condition to be studied across multiple trials. This junction table is the operational bridge that practitioners query when they need to know which conditions a study targets or which studies investigate a particular condition.

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

Similarly, the `studies_interventions` table connects studies to their deployed interventions. A row pairs a `clinical_study_id` with an `intervention_id`, supporting the scenario where a study employs multiple interventions or an intervention is tested across multiple studies. This table is essential for answering questions about which treatments are being evaluated in which trials.

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

The `studies_outcomes` table links studies to their measured outcomes. Each row associates a `clinical_study_id` with an `outcome_id`, enabling the tracking of which endpoints a study measures. This junction table supports queries about outcome coverage across the study portfolio and helps practitioners identify studies that measure specific endpoints.

### Joined Views for Operational Reporting

Practitioners rely on a set of pre-joined views to answer common operational questions without writing ad-hoc joins. Each view combines the central study record with related entities, producing a denormalized result that is immediately interpretable.

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

The `v_clinical_study_researcher` view joins `clinical_studies` with `researchers` to answer the question: which researchers are associated with which studies? A representative row shows study 1 (*Compact Initiative*) linked to Theodore Mcgrath, who holds the role of `principal_investigator` at `baseline-affiliat-55`. Another row shows study 2 (*Legacy Model*) paired with Account Name as `co_investigator`. This view is the primary tool for investigator assignment tracking and workload analysis.

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

The `v_clinical_study_funding_award` view combines study records with their funding awards, answering: what financial support is tied to each study? Row 1 shows study 1 (*Compact Initiative*) with award 1000, dated 2025-12-01, for an amount of 112.11 over 44 months in `approved` status. Row 3 shows study 3 (*Regional Cluster A*) with award 1002, dated 2023-10-23, for 15,418 over 64 months in `closed` status. This view supports budget tracking and award lifecycle monitoring.

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

The `v_clinical_study_medical_condition_detail` view joins studies with their targeted medical conditions, answering: which conditions does each study address? A row from this view shows study 1 (*Compact Initiative*) targeting the condition *Compact Standard* in the `trauma_injury` category. Another row shows study 2 (*Legacy Model*) addressing *Legacy Framework*, categorized as `cancer`. This view is essential for condition-focused portfolio analysis and for ensuring adequate coverage across therapeutic areas.

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

The `v_clinical_study_intervention_detail` view links studies to their interventions, answering: what treatments is each study deploying? Row 1 shows study 1 (*Compact Initiative*) using *Integrated Protocol A*, a `drug` type intervention with `seasonal-dosage-83`. Row 2 shows study 2 (*Legacy Model*) deploying *Extended Programme*, a `surgery` type intervention with `regional-dosage-84`. This view supports modality distribution analysis and intervention portfolio management.

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

The `v_clinical_study_clinical_outcome_detail` view connects studies to their measured outcomes, answering: what endpoints does each study track? This view enables practitioners to assess outcome coverage across the study portfolio and to identify studies that share common measurement targets.

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

The `v_researcher_clinical_study` view presents the researcher-centric perspective, answering: which studies is each researcher involved in? This is the inverse of the study-to-researcher view and is useful for investigator workload assessment and collaboration mapping. A row shows Theodore Mcgrath (researcher_id `89419`) associated with study 1 (*Compact Initiative*), while Norma Fisher (researcher_id `1450639`) is linked to study 4 (*Seasonal Review*).

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

The `v_researcher_researcher` view surfaces collaboration relationships among researchers, answering: which researchers collaborate with whom? The current data shows self-referential collaboration links, where each researcher's `collaborates_with_researcher_id` points to their own identifier. This view supports the analysis of collaboration networks and can be extended to capture cross-investigator partnerships as the data evolves.

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

The `v_funding_award_clinical_study` view presents the funding-centric perspective, answering: which studies does each funding award support? Row 1 shows award 1000 (UUID `e02275d4-8fd1-11eb-924d-9cd76263cbd0`) supporting study 1 (*Compact Initiative*). Row 4 shows award 1003 (identifier `state_uk_17`) supporting study 4 (*Seasonal Review*). This view is valuable for financial reporting and award utilization analysis.

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

The `v_funding_award_funding_agency` view joins funding awards with their sponsoring agencies, answering: which agency funds which award? Row 1 shows award 1000 funded by agency 100 (*U.S. Steel*), with the agency name listed as *FSG Social Impact Advisors* and a website pointing to a Launchpad bug tracker. Row 3 shows award 1002 funded by agency 102 (*Oberthur Technologies*), with the agency name *Education Writers Association* and a Nature journal URL. This view supports sponsor relationship management and agency-level financial aggregation.

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

The `v_funding_agency_funding_award` view presents the agency-centric perspective, answering: which awards does each funding agency support? This is the inverse of the award-to-agency view and is useful for agency portfolio analysis. A row shows agency 100 (*U.S. Steel*) associated with award 1000, while agency 103 (*General Telephone & Electronics*) is linked to award 1003.

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

The `v_medical_condition_clinical_study` view joins medical conditions with their associated studies, answering: which studies investigate each condition? Row 1 shows condition 100 (*Compact Standard*, category `trauma_injury`) linked to study 1 (*Compact Initiative*). Row 2 shows condition 101 (*Legacy Framework*, category `cancer`) linked to study 2 (*Legacy Model*). This view supports condition-focused research planning and therapeutic area coverage analysis.

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

The `v_intervention_clinical_study` view links interventions to their studies, answering: which studies use each intervention? Row 1 shows intervention `d64c33f2-8fc1-11eb-924d-9cd76263cbd0` (*Integrated Protocol A*, type `drug`) deployed in study 1 (*Compact Initiative*). Row 2 shows intervention `L408` (*Extended Programme*, type `surgery`) deployed in study 2 (*Legacy Model*). This view supports modality distribution analysis and intervention reuse tracking.

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

The `v_clinical_outcome_clinical_study` view connects outcomes to their studies, answering: which studies measure each outcome? This view enables practitioners to identify studies that share common endpoints and to assess outcome coverage across the research portfolio.

### Synthesis

The clinical research domain is structured around a central study entity that anchors a network of researchers, funding awards, medical conditions, interventions, and clinical outcomes. The base tables capture each entity type with its own identifiers and attributes, while the junction tables (`studies_conditions`, `studies_interventions`, `studies_outcomes`) model the many-to-many relationships that are inherent in research design. The twelve views provide pre-joined perspectives that answer the most common operational questions: which researchers work on which studies, which awards fund which studies, which conditions and interventions are associated with each study, and how these relationships invert when viewed from the researcher, agency, condition, intervention, or outcome side. Together, these records and views form the operational backbone of clinical research management, enabling practitioners to track study lifecycles, monitor funding, and analyze the relationships between conditions, interventions, and outcomes across the entire portfolio.