## Domain Modelling and Relational Materialisation

Nutrition programme management sits at the intersection of public health logistics, human resource coordination, and evidence-based policy. An organisation delivering nutrition services must track where it operates, which populations it serves, what training it provides to staff, what research it conducts, and how its findings translate into policy recommendations for government bodies. The relational model captures this ecosystem through eight base tables and twenty-five materialised views, each view representing a single join that reconstructs a domain fact from the normalised schema. The model follows a hub-and-spoke pattern: `nutrition_units` and `geographic_areas` act as primary hubs, with foreign-key columns in every other table pointing back to them, while secondary relationships between beneficiary groups, training programmes, staff members, research studies, policy recommendations, and government bodies are expressed through additional foreign keys embedded in the same tables.

**Table `nutrition_units`**

| id | unit_id | established_date | annual_budget | currency_code | service_status | operational_scope | target_population | management_quality | geographic_area_id | beneficiary_group_id | research_study_id | staff_member_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 39800614 | 2024-03-27 | 44,248 | gd_fp_eu_acc3 | active | inpatient | urban_poor | high | 1000 | 1 | 1 | 1000 |
| 2 | 611523 | 2025-08-11 | 76,784 | managing-resources | inactive | outpatient | hard_core_poor | medium | 1001 | 2 | 2 | 1001 |
| 3 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | 2022-01-22 | 41,373 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | suspended | daycare | slum_residents | low | 1002 | 3 | 3 | 1002 |
| 4 | account_pymes_1040 | 2023-06-06 | 175,434 | 10445649 | active | community | urban_poor | high | 1003 | 4 | 4 | 1003 |

The `nutrition_units` table is the central organisational entity. Each row represents a distinct nutrition service point — an inpatient clinic, an outpatient centre, a daycare facility, or a community programme. The surrogate primary key `id` is a sequential integer, while `unit_id` carries a business identifier that varies in format: numeric codes like `39800614` and `611523`, UUIDs such as `57dbb53c-8fcc-11eb-924d-9cd76263cbd0`, and alphanumeric strings like `account_pymes_1040`. The `established_date` column anchors the unit in time (e.g. `2024-03-27`), and `annual_budget` records the fiscal envelope in a currency identified by `currency_code` — values range from `gd_fp_eu_acc3` to `managing-resources` to `f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3`. The `service_status` enum (`active`, `inactive`, `suspended`) governs operational visibility, while `operational_scope` distinguishes inpatient, outpatient, daycare, and community delivery modes. The `target_population` column (`urban_poor`, `hard_core_poor`, `slum_residents`) and `management_quality` rating (`high`, `medium`, `low`) provide stratification for equity analysis. Crucially, four foreign-key columns — `geographic_area_id`, `beneficiary_group_id`, `research_study_id`, and `staff_member_id` — link each nutrition unit to its geographic context, served population, research lineage, and responsible staff member.

**Table `geographic_areas`**

| id | area_id | area_name | population_density | mortality_rate | morbidity_rate | administrative_zone | socioeconomic_status | infrastructure_level | nutrition_unit_id | beneficiary_group_id | geographic_area_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | default_chart_a_tax_19 | Primary Programme A | 18 | 3.70 | 7.95 | compact-administ-38 | extreme_poverty | basic | 1 | 1 | 1000 |
| 1001 | fro | Composite Standard | 24 | 7.40 | 9.90 | composite-administ-39 | poverty | adequate | 2 | 2 | 1001 |
| 1002 | account_pymes_296 | Compact Framework | 30 | 11.10 | 11.85 | primary-administ-40 | moderate_poverty | advanced | 3 | 3 | 1002 |
| 1003 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Legacy Protocol D | 36 | 14.80 | 13.80 | adaptive-administ-41 | extreme_poverty | basic | 4 | 4 | 1003 |

`geographic_areas` defines the spatial dimension of programme delivery. The surrogate `id` (e.g. `1000`, `1001`) is distinct from the business `area_id`, which carries names like `default_chart_a_tax_19`, `fro`, `account_pymes_296`, and `57e52fbc-8fcd-11eb-924d-9cd76263cbd0`. The `area_name` column provides human-readable labels such as `Primary Programme A`, `Composite Standard`, `Compact Framework`, and `Legacy Protocol D`. Epidemiological indicators — `population_density` (integers from 18 to 36), `mortality_rate` (3.70 to 14.80), and `morbidity_rate` (7.95 to 13.80) — quantify the health burden of each zone. Administrative classification uses `administrative_zone` (e.g. `compact-administ-38`, `composite-administ-39`), while `socioeconomic_status` (`extreme_poverty`, `poverty`, `moderate_poverty`) and `infrastructure_level` (`basic`, `adequate`, `advanced`) describe the operating environment. The table also carries foreign keys `nutrition_unit_id`, `beneficiary_group_id`, and `geographic_area_id`, enabling bidirectional navigation from area back to the nutrition unit operating within it and to the beneficiary group resident there.

**Table `beneficiary_groups`**

| beneficiary_group_id | group_id | group_name | age_range | gender | enrollment_date | discharge_date | recovery_status | participation_level | nutrition_unit_id | training_program_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 10449530 | Baseline Corridor D | adaptive-age-65 | female | 2022-05-11 | 2022-09-02 | recovered | inpatient | 1 | 1 |
| 2 | 8189483 | Distributed Series | distributed-age-66 | male | 2023-10-22 | 2023-02-13 | ongoing | outpatient | 2 | 2 |
| 3 | 3718658437 | Adaptive Assessment | baseline-age-67 | both | 2024-03-06 | 2024-07-24 | failed | community | 3 | 3 |
| 4 | IVC0 | Primary Survey A | pilot-age-68 | female | 2025-08-17 | 2025-12-08 | transferred | none | 4 | 4 |

Beneficiary groups capture the population segments receiving nutrition services. The surrogate `beneficiary_group_id` (1–4) is separate from the business `group_id` (`10449530`, `8189483`, `3718658437`, `IVC0`) and the descriptive `group_name` (`Baseline Corridor D`, `Distributed Series`, `Adaptive Assessment`, `Primary Survey A`). Demographic attributes include `age_range` (`adaptive-age-65`, `distributed-age-66`, `baseline-age-67`, `pilot-age-68`) and `gender` (`female`, `male`, `both`). Programme lifecycle dates (`enrollment_date`, `discharge_date`) and clinical outcomes (`recovery_status`: `recovered`, `ongoing`, `failed`, `transferred`) track individual trajectories. The `participation_level` column (`inpatient`, `outpatient`, `community`, `none`) mirrors the operational scope of the nutrition unit. Foreign keys `nutrition_unit_id` and `training_program_id` connect each group to its service provider and its associated training curriculum.

**Table `training_programs`**

| id | program_id | program_name | start_date | end_date | duration_hours | target_audience | completion_rate | effectiveness_rating | nutrition_unit_id | staff_member_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | 2022-09-05 | 2022-09-01 | 29 | government_staff | 19.70 | high | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 2986219 | Pilot Initiative A | 2023-02-16 | 2023-02-12 | 38 | ngo_staff | 22.40 | medium | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 1186079 | Baseline Model | 2024-07-27 | 2024-07-23 | 47 | community_workers | 25.10 | low | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 1562855 | Distributed Cluster | 2025-12-11 | 2025-12-07 | 56 | government_staff | 27.80 | high | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Training programmes structure the capacity-building activities delivered to staff and community workers. The surrogate `id` (1–4) differs from the business `program_id` (`103176`, `2986219`, `1186079`, `1562855`) and the descriptive `program_name` (`Extended Review`, `Pilot Initiative A`, `Baseline Model`, `Distributed Cluster`). Temporal attributes include `start_date`, `end_date`, and `duration_hours` (29 to 56 hours). The `target_audience` column distinguishes `government_staff`, `ngo_staff`, and `community_workers`. Performance metrics — `completion_rate` (19.70 to 27.80) and `effectiveness_rating` (`high`, `medium`, `low`) — evaluate programme quality. Audit timestamps `created_at` and `updated_at` record modification history. Foreign keys `nutrition_unit_id` and `staff_member_id` tie each programme to the delivering unit and the responsible staff member.

**Table `staff_members`**

| staff_member_id | staff_id | full_name | role | employer | training_completion_date | performance_rating | motivation_level | years_of_experience | training_program_id | beneficiary_group_id | research_study_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 937735 | Theodore Mcgrath | nurse | government | 2024-11-27 | excellent | high | 7 | 1 | 1 | 1 |
| 1001 | 3158139 | Account Name | nutritionist | ngo | 2025-04-11 | good | medium | 10 | 2 | 2 | 2 |
| 1002 | 8189502 | Saipan International Airport | community_health_worker | international_agency | 2022-09-22 | average | low | 13 | 3 | 3 | 3 |
| 1003 | 69438 | Norma Fisher | administrator | government | 2023-02-06 | poor | high | 16 | 4 | 4 | 4 |

Staff members represent the human capital delivering nutrition services. The surrogate `staff_member_id` (1000–1003) is distinct from the business `staff_id` (`937735`, `3158139`, `8189502`, `69438`) and the `full_name` column (`Theodore Mcgrath`, `Account Name`, `Saipan International Airport`, `Norma Fisher`). The `role` column (`nurse`, `nutritionist`, `community_health_worker`, `administrator`) and `employer` type (`government`, `ngo`, `international_agency`) classify professional profiles. The `training_completion_date` (e.g. `2024-11-27`) records certification, while `performance_rating` (`excellent`, `good`, `average`, `poor`) and `motivation_level` (`high`, `medium`, `low`) capture human-resource metrics. `years_of_experience` ranges from 7 to 16. Foreign keys `training_program_id`, `beneficiary_group_id`, and `research_study_id` link each staff member to their training curriculum, the beneficiary group they serve, and the research study they participate in.

**Table `research_studies`**

| research_study_id | study_id | study_title | start_date | end_date | study_type | sample_size | primary_outcome | publication_status | nutrition_unit_id | staff_member_id | beneficiary_group_id | policy_recommendation_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Karyawan | Composite Programme | 2022-09-05 | 2022-09-01 | operational_research | 31 | extended-primary-63 | published | 1 | 1000 | 1 | 1000 |
| 2 | 392491 | Compact Standard A | 2023-02-16 | 2023-02-12 | impact_assessment | 38 | integrated-primary-64 | in_review | 2 | 1001 | 2 | 1001 |
| 3 | 9568466 | Legacy Framework | 2024-07-27 | 2024-07-23 | process_evaluation | 45 | seasonal-primary-65 | unpublished | 3 | 1002 | 3 | 1002 |
| 4 | 4985166 | Regional Protocol | 2025-12-11 | 2025-12-07 | operational_research | 52 | regional-primary-66 | published | 4 | 1003 | 4 | 1003 |

Research studies document the evidence-generation activities underpinning programme decisions. The surrogate `research_study_id` (1–4) differs from the business `study_id` (`Karyawan`, `392491`, `9568466`, `4985166`) and the descriptive `study_title` (`Composite Programme`, `Compact Standard A`, `Legacy Framework`, `Regional Protocol`). Temporal bounds (`start_date`, `end_date`) and `study_type` (`operational_research`, `impact_assessment`, `process_evaluation`) classify the research. The `sample_size` (31 to 52) and `primary_outcome` (`extended-primary-63`, `integrated-primary-64`, `seasonal-primary-65`, `regional-primary-66`) describe study design. `publication_status` (`published`, `in_review`, `unpublished`) tracks dissemination. Foreign keys `nutrition_unit_id`, `staff_member_id`, `beneficiary_group_id`, and `policy_recommendation_id` connect each study to its operational context, research team, target population, and resulting policy output.

**Table `policy_recommendations`**

| id | policy_id | policy_title | issue_date | target_policy_area | adoption_status | influence_level | source_study | research_study_id | government_body_id | beneficiary_group_id | nutrition_unit_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 5844252 | Baseline Initiative D | 2023-02-01 | malnutrition_treatment | adopted | high | integrated-source-22 | 1 | 1 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 10207142 | Distributed Model | 2024-07-12 | community_health | rejected | medium | seasonal-source-23 | 2 | 2 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 1562847 | Adaptive Cluster | 2025-12-23 | training_standards | pending | low | regional-source-24 | 3 | 3 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Primary Review A | 2022-05-07 | resource_allocation | partially_adopted | high | legacy-source-25 | 4 | 4 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Policy recommendations capture the translation of research evidence into actionable guidance for governance. The surrogate `policy_recommendation_id` (1–4) is separate from the business `recommendation_id` (`10449530`, `8189483`, `3718658437`, `IVC0`) and the descriptive `recommendation_title` (`Baseline Corridor D`, `Distributed Series`, `Adaptive Assessment`, `Primary Survey A`). The `recommendation_text` field holds the substantive guidance, while `priority_level` (`high`, `medium`, `low`) and `implementation_status` (`implemented`, `in_progress`, `planned`, `cancelled`) track execution. Foreign keys `nutrition_unit_id`, `government_body_id`, and `beneficiary_group_id` link each recommendation to the delivering unit, the receiving government authority, and the affected population.

**Table `government_bodies`**

| government_body_id | body_id | body_name | country_code | policy_status | budget_allocation | coordination_level | last_policy_review | policy_recommendation_id | nutrition_unit_id | staff_member_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 6564383 | Regional Corridor | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | clearly_stated | 446.22 | high | 2025-08-09 | 1000 | 1 | 1000 | 2025-01-01 00:14:00 |
| 2 | 168556 | Seasonal Series D | lu_tax_code_template_m_I_2 | vague | 763.46 | medium | 2022-01-20 | 1001 | 2 | 1001 | 2025-02-06 03:14:00 |
| 3 | strategic | Integrated Assessment | default_chart_a_account_57 | non_existent | 12.34 | low | 2023-06-04 | 1002 | 3 | 1002 | 2025-03-11 06:14:00 |
| 4 | 195361 | Extended Survey | 727045 | clearly_stated | 1,737 | high | 2024-11-15 | 1003 | 4 | 1003 | 2025-04-16 09:14:00 |

Government bodies represent the public authorities receiving and implementing policy recommendations. The surrogate `government_body_id` (1000–1003) differs from the business `body_id` (`937735`, `3158139`, `8189502`, `69438`) and the descriptive `body_name` (`Theodore Mcgrath`, `Account Name`, `Saipan International Airport`, `Norma Fisher`). The `jurisdiction_level` column (`national`, `provincial`, `district`, `local`) classifies the authority's scope, while `budget_allocation` and `staff_count` quantify capacity. Foreign keys `nutrition_unit_id` and `staff_member_id` connect each body to the nutrition unit it engages with and the staff liaison responsible for coordination.

The foreign-key architecture creates a dense web of relationships. Every base table except `government_bodies` carries a `nutrition_unit_id` foreign key, making `nutrition_units` the universal anchor. Similarly, `geographic_areas` and `beneficiary_groups` appear as foreign keys across multiple tables, reflecting their role as cross-cutting dimensions. The model avoids explicit junction tables for many-to-many relationships; instead, it embeds foreign keys directly, which constrains cardinality to one-to-many from the perspective of each referencing table. This design choice simplifies queries at the cost of flexibility — a single nutrition unit can be associated with only one geographic area, one beneficiary group, one research study, and one staff member in the current schema.

The materialised views reconstruct domain facts by joining `nutrition_units` or `geographic_areas` or `beneficiary_groups` to their related tables. Each view answers a specific analytical question by denormalising a single relationship into a flat, queryable result set.

**View `v_nutrition_unit_geographic_area`**

```sql
CREATE VIEW v_nutrition_unit_geographic_area AS
SELECT a.id, a.unit_id, a.established_date, a.annual_budget, b.id AS area_id, b.area_id AS area_area_id, b.area_name AS area_area_name
FROM nutrition_units a JOIN geographic_areas b ON a.geographic_area_id = b.id;
```

| id | unit_id | established_date | annual_budget | area_id | area_area_id | area_area_name |
|---|---|---|---|---|---|---|
| 1 | 39800614 | 2024-03-27 | 44,248 | 1000 | default_chart_a_tax_19 | Primary Programme A |
| 2 | 611523 | 2025-08-11 | 76,784 | 1001 | fro | Composite Standard |
| 3 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | 2022-01-22 | 41,373 | 1002 | account_pymes_296 | Compact Framework |
| 4 | account_pymes_1040 | 2023-06-06 | 175,434 | 1003 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Legacy Protocol D |

The view `v_nutrition_unit_geographic_area` joins `nutrition_units` to `geographic_areas` on `nutrition_unit_id = geographic_area_id`, answering the question: which geographic area does each nutrition unit operate in? A row with `unit_id` `39800614` joined to `area_name` `Primary Programme A` and `socioeconomic_status` `extreme_poverty` tells a programme manager that this unit serves an area of extreme deprivation, informing resource allocation decisions.

**View `v_nutrition_unit_beneficiary_group`**

```sql
CREATE VIEW v_nutrition_unit_beneficiary_group AS
SELECT a.id, a.unit_id, a.established_date, a.annual_budget, b.beneficiary_group_id AS group_beneficiary_group_id, b.group_id AS group_group_id, b.group_name AS group_group_name
FROM nutrition_units a JOIN beneficiary_groups b ON a.beneficiary_group_id = b.beneficiary_group_id;
```

| id | unit_id | established_date | annual_budget | group_beneficiary_group_id | group_group_id | group_group_name |
|---|---|---|---|---|---|---|
| 1 | 39800614 | 2024-03-27 | 44,248 | 1 | 10449530 | Baseline Corridor D |
| 2 | 611523 | 2025-08-11 | 76,784 | 2 | 8189483 | Distributed Series |
| 3 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | 2022-01-22 | 41,373 | 3 | 3718658437 | Adaptive Assessment |
| 4 | account_pymes_1040 | 2023-06-06 | 175,434 | 4 | IVC0 | Primary Survey A |

`v_nutrition_unit_beneficiary_group` joins `nutrition_units` to `beneficiary_groups` on `nutrition_unit_id = beneficiary_group_id`, answering: which beneficiary group does each nutrition unit serve? The row pairing `unit_id` `611523` with `group_name` `Distributed Series` and `recovery_status` `ongoing` indicates an active outpatient programme serving a population still in treatment, useful for monitoring service continuity.

**View `v_nutrition_unit_research_study`**

```sql
CREATE VIEW v_nutrition_unit_research_study AS
SELECT a.id, a.unit_id, a.established_date, a.annual_budget, b.research_study_id AS study_research_study_id, b.study_id AS study_study_id, b.study_title AS study_study_title
FROM nutrition_units a JOIN research_studies b ON a.research_study_id = b.research_study_id;
```

| id | unit_id | established_date | annual_budget | study_research_study_id | study_study_id | study_study_title |
|---|---|---|---|---|---|---|
| 1 | 39800614 | 2024-03-27 | 44,248 | 1 | Karyawan | Composite Programme |
| 2 | 611523 | 2025-08-11 | 76,784 | 2 | 392491 | Compact Standard A |
| 3 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | 2022-01-22 | 41,373 | 3 | 9568466 | Legacy Framework |
| 4 | account_pymes_1040 | 2023-06-06 | 175,434 | 4 | 4985166 | Regional Protocol |

`v_nutrition_unit_research_study` joins `nutrition_units` to `research_studies` on `nutrition_unit_id = research_study_id`, answering: which research study is associated with each nutrition unit? The row linking `unit_id` `57dbb53c-8fcc-11eb-924d-9cd76263cbd0` to `study_title` `Legacy Framework` with `publication_status` `unpublished` signals that this unit's evidence base is not yet disseminated, flagging a gap in knowledge transfer.

**View `v_nutrition_unit_staff_member`**

```sql
CREATE VIEW v_nutrition_unit_staff_member AS
SELECT a.id, a.unit_id, a.established_date, a.annual_budget, b.staff_member_id AS member_staff_member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM nutrition_units a JOIN staff_members b ON a.staff_member_id = b.staff_member_id;
```

| id | unit_id | established_date | annual_budget | member_staff_member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|---|
| 1 | 39800614 | 2024-03-27 | 44,248 | 1000 | 937735 | Theodore Mcgrath |
| 2 | 611523 | 2025-08-11 | 76,784 | 1001 | 3158139 | Account Name |
| 3 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | 2022-01-22 | 41,373 | 1002 | 8189502 | Saipan International Airport |
| 4 | account_pymes_1040 | 2023-06-06 | 175,434 | 1003 | 69438 | Norma Fisher |

`v_nutrition_unit_staff_member` joins `nutrition_units` to `staff_members` on `nutrition_unit_id = staff_member_id`, answering: which staff member is responsible for each nutrition unit? The row connecting `unit_id` `account_pymes_1040` to `full_name` `Norma Fisher` with `role` `administrator` and `performance_rating` `poor` raises a staffing concern that may warrant performance review or reassignment.

**View `v_geographic_area_nutrition_unit`**

```sql
CREATE VIEW v_geographic_area_nutrition_unit AS
SELECT a.id, a.area_id, a.area_name, a.population_density, b.id AS unit_id, b.unit_id AS unit_unit_id, b.established_date AS unit_established_date
FROM geographic_areas a JOIN nutrition_units b ON a.nutrition_unit_id = b.id;
```

| id | area_id | area_name | population_density | unit_id | unit_unit_id | unit_established_date |
|---|---|---|---|---|---|---|
| 1000 | default_chart_a_tax_19 | Primary Programme A | 18 | 1 | 39800614 | 2024-03-27 |
| 1001 | fro | Composite Standard | 24 | 2 | 611523 | 2025-08-11 |
| 1002 | account_pymes_296 | Compact Framework | 30 | 3 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | 2022-01-22 |
| 1003 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Legacy Protocol D | 36 | 4 | account_pymes_1040 | 2023-06-06 |

`v_geographic_area_nutrition_unit` performs the inverse join, linking `geographic_areas` to `nutrition_units` on `geographic_area_id = nutrition_unit_id`, answering: which nutrition unit operates in each geographic area? A row with `area_name` `Primary Programme A` joined to `unit_id` `39800614` and `service_status` `active` confirms that the programme area has an active service point, useful for coverage mapping.

**View `v_geographic_area_beneficiary_group`**

```sql
CREATE VIEW v_geographic_area_beneficiary_group AS
SELECT a.id, a.area_id, a.area_name, a.population_density, b.beneficiary_group_id AS group_beneficiary_group_id, b.group_id AS group_group_id, b.group_name AS group_group_name
FROM geographic_areas a JOIN beneficiary_groups b ON a.beneficiary_group_id = b.beneficiary_group_id;
```

| id | area_id | area_name | population_density | group_beneficiary_group_id | group_group_id | group_group_name |
|---|---|---|---|---|---|---|
| 1000 | default_chart_a_tax_19 | Primary Programme A | 18 | 1 | 10449530 | Baseline Corridor D |
| 1001 | fro | Composite Standard | 24 | 2 | 8189483 | Distributed Series |
| 1002 | account_pymes_296 | Compact Framework | 30 | 3 | 3718658437 | Adaptive Assessment |
| 1003 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Legacy Protocol D | 36 | 4 | IVC0 | Primary Survey A |

`v_geographic_area_beneficiary_group` joins `geographic_areas` to `beneficiary_groups` on `geographic_area_id = beneficiary_group_id`, answering: which beneficiary group resides in each geographic area? The row pairing `area_name` `Compact Framework` with `group_name` `Adaptive Assessment` and `age_range` `baseline-age-67` helps planners understand the demographic composition of the served population within that zone.

**View `v_geographic_area_geographic_area`**

```sql
CREATE VIEW v_geographic_area_geographic_area AS
SELECT a.id, a.area_id, a.area_name, a.population_density, b.id AS area_id, b.area_id AS area_area_id, b.area_name AS area_area_name
FROM geographic_areas a JOIN geographic_areas b ON a.geographic_area_id = b.id;
```

| id | area_id | area_name | population_density | area_id | area_area_id | area_area_name |
|---|---|---|---|---|---|---|
| 1000 | default_chart_a_tax_19 | Primary Programme A | 18 | 1000 | default_chart_a_tax_19 | Primary Programme A |
| 1001 | fro | Composite Standard | 24 | 1001 | fro | Composite Standard |
| 1002 | account_pymes_296 | Compact Framework | 30 | 1002 | account_pymes_296 | Compact Framework |
| 1003 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Legacy Protocol D | 36 | 1003 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Legacy Protocol D |

`v_geographic_area_geographic_area` is a self-join on `geographic_area_id = geographic_area_id`, producing a reflexive view of each area paired with itself. This view serves as a structural integrity check, confirming that every geographic area has a valid self-reference and can be used as a baseline for spatial proximity or adjacency analyses when extended with additional columns.

**View `v_beneficiary_group_nutrition_unit`**

```sql
CREATE VIEW v_beneficiary_group_nutrition_unit AS
SELECT a.beneficiary_group_id, a.group_id, a.group_name, a.age_range, b.id AS unit_id, b.unit_id AS unit_unit_id, b.established_date AS unit_established_date
FROM beneficiary_groups a JOIN nutrition_units b ON a.nutrition_unit_id = b.id;
```

| beneficiary_group_id | group_id | group_name | age_range | unit_id | unit_unit_id | unit_established_date |
|---|---|---|---|---|---|---|
| 1 | 10449530 | Baseline Corridor D | adaptive-age-65 | 1 | 39800614 | 2024-03-27 |
| 2 | 8189483 | Distributed Series | distributed-age-66 | 2 | 611523 | 2025-08-11 |
| 3 | 3718658437 | Adaptive Assessment | baseline-age-67 | 3 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | 2022-01-22 |
| 4 | IVC0 | Primary Survey A | pilot-age-68 | 4 | account_pymes_1040 | 2023-06-06 |

`v_beneficiary_group_nutrition_unit` joins `beneficiary_groups` to `nutrition_units` on `beneficiary_group_id = nutrition_unit_id`, answering: which nutrition unit serves each beneficiary group? The row linking `group_name` `Baseline Corridor D` to `unit_id` `39800614` with `operational_scope` `inpatient` clarifies the service modality for this population segment.

**View `v_beneficiary_group_training_program`**

```sql
CREATE VIEW v_beneficiary_group_training_program AS
SELECT a.beneficiary_group_id, a.group_id, a.group_name, a.age_range, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM beneficiary_groups a JOIN training_programs b ON a.training_program_id = b.id;
```

| beneficiary_group_id | group_id | group_name | age_range | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 1 | 10449530 | Baseline Corridor D | adaptive-age-65 | 1 | 103176 | Extended Review |
| 2 | 8189483 | Distributed Series | distributed-age-66 | 2 | 2986219 | Pilot Initiative A |
| 3 | 3718658437 | Adaptive Assessment | baseline-age-67 | 3 | 1186079 | Baseline Model |
| 4 | IVC0 | Primary Survey A | pilot-age-68 | 4 | 1562855 | Distributed Cluster |

`v_beneficiary_group_training_program` joins `beneficiary_groups` to `training_programs` on `beneficiary_group_id = training_program_id`, answering: which training programme is associated with each beneficiary group? The row connecting `group_name` `Distributed Series` to `program_name` `Pilot Initiative A` with `target_audience` `ngo_staff` reveals that this group's training is delivered to NGO personnel, informing workforce development planning.

**View `v_training_program_nutrition_unit`**

```sql
CREATE VIEW v_training_program_nutrition_unit AS
SELECT a.id, a.program_id, a.program_name, a.start_date, b.id AS unit_id, b.unit_id AS unit_unit_id, b.established_date AS unit_established_date
FROM training_programs a JOIN nutrition_units b ON a.nutrition_unit_id = b.id;
```

| id | program_id | program_name | start_date | unit_id | unit_unit_id | unit_established_date |
|---|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | 2022-09-05 | 1 | 39800614 | 2024-03-27 |
| 2 | 2986219 | Pilot Initiative A | 2023-02-16 | 2 | 611523 | 2025-08-11 |
| 3 | 1186079 | Baseline Model | 2024-07-27 | 3 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | 2022-01-22 |
| 4 | 1562855 | Distributed Cluster | 2025-12-11 | 4 | account_pymes_1040 | 2023-06-06 |

`v_training_program_nutrition_unit` joins `training_programs` to `nutrition_units` on `training_program_id = nutrition_unit_id`, answering: which nutrition unit delivers each training programme? The row pairing `program_name` `Extended Review` with `unit_id` `39800614` and `effectiveness_rating` `high` identifies a high-performing training delivered at this unit, serving as a benchmark for quality improvement.

**View `v_training_program_staff_member`**

```sql
CREATE VIEW v_training_program_staff_member AS
SELECT a.id, a.program_id, a.program_name, a.start_date, b.staff_member_id AS member_staff_member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM training_programs a JOIN staff_members b ON a.staff_member_id = b.staff_member_id;
```

| id | program_id | program_name | start_date | member_staff_member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | 2022-09-05 | 1000 | 937735 | Theodore Mcgrath |
| 2 | 2986219 | Pilot Initiative A | 2023-02-16 | 1001 | 3158139 | Account Name |
| 3 | 1186079 | Baseline Model | 2024-07-27 | 1002 | 8189502 | Saipan International Airport |
| 4 | 1562855 | Distributed Cluster | 2025-12-11 | 1003 | 69438 | Norma Fisher |

`v_training_program_staff_member` joins `training_programs` to `staff_members` on `training_program_id = staff_member_id`, answering: which staff member is associated with each training programme? The row linking `program_name` `Pilot Initiative A` to `full_name` `Account Name` with `role` `nutritionist` and `years_of_experience` `10` shows that an experienced nutritionist leads this programme, suggesting strong instructional capacity.

**View `v_staff_member_training_program`**

```sql
CREATE VIEW v_staff_member_training_program AS
SELECT a.staff_member_id, a.staff_id, a.full_name, a.role, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM staff_members a JOIN training_programs b ON a.training_program_id = b.id;
```

| staff_member_id | staff_id | full_name | role | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 1000 | 937735 | Theodore Mcgrath | nurse | 1 | 103176 | Extended Review |
| 1001 | 3158139 | Account Name | nutritionist | 2 | 2986219 | Pilot Initiative A |
| 1002 | 8189502 | Saipan International Airport | community_health_worker | 3 | 1186079 | Baseline Model |
| 1003 | 69438 | Norma Fisher | administrator | 4 | 1562855 | Distributed Cluster |

`v_staff_member_training_program` joins `staff_members` to `training_programs` on `staff_member_id = training_program_id`, answering: which training programme does each staff member lead? The row connecting `full_name` `Theodore Mcgrath` to `program_name` `Extended Review` with `completion_rate` `19.70` indicates that this nurse's programme has a relatively low completion rate, potentially signalling a need for curriculum revision.

**View `v_staff_member_beneficiary_group`**

```sql
CREATE VIEW v_staff_member_beneficiary_group AS
SELECT a.staff_member_id, a.staff_id, a.full_name, a.role, b.beneficiary_group_id AS group_beneficiary_group_id, b.group_id AS group_group_id, b.group_name AS group_group_name
FROM staff_members a JOIN beneficiary_groups b ON a.beneficiary_group_id = b.beneficiary_group_id;
```

| staff_member_id | staff_id | full_name | role | group_beneficiary_group_id | group_group_id | group_group_name |
|---|---|---|---|---|---|---|
| 1000 | 937735 | Theodore Mcgrath | nurse | 1 | 10449530 | Baseline Corridor D |
| 1001 | 3158139 | Account Name | nutritionist | 2 | 8189483 | Distributed Series |
| 1002 | 8189502 | Saipan International Airport | community_health_worker | 3 | 3718658437 | Adaptive Assessment |
| 1003 | 69438 | Norma Fisher | administrator | 4 | IVC0 | Primary Survey A |

`v_staff_member_beneficiary_group` joins `staff_members` to `beneficiary_groups` on `staff_member_id = beneficiary_group_id`, answering: which beneficiary group does each staff member serve? The row linking `full_name` `Saipan International Airport` to `group_name` `Adaptive Assessment` with `recovery_status` `failed` highlights a staff member whose assigned population has not achieved recovery, flagging a potential service delivery issue.

**View `v_staff_member_research_study`**

```sql
CREATE VIEW v_staff_member_research_study AS
SELECT a.staff_member_id, a.staff_id, a.full_name, a.role, b.research_study_id AS study_research_study_id, b.study_id AS study_study_id, b.study_title AS study_study_title
FROM staff_members a JOIN research_studies b ON a.research_study_id = b.research_study_id;
```

| staff_member_id | staff_id | full_name | role | study_research_study_id | study_study_id | study_study_title |
|---|---|---|---|---|---|---|
| 1000 | 937735 | Theodore Mcgrath | nurse | 1 | Karyawan | Composite Programme |
| 1001 | 3158139 | Account Name | nutritionist | 2 | 392491 | Compact Standard A |
| 1002 | 8189502 | Saipan International Airport | community_health_worker | 3 | 9568466 | Legacy Framework |
| 1003 | 69438 | Norma Fisher | administrator | 4 | 4985166 | Regional Protocol |

`v_staff_member_research_study` joins `staff_members` to `research_studies` on `staff_member_id = research_study_id`, answering: which research study does each staff member participate in? The row connecting `full_name` `Account Name` to `study_title` `Compact Standard A` with `study_type` `impact_assessment` shows that this nutritionist is involved in an impact evaluation, contributing to the evidence base.

**View `v_research_study_nutrition_unit`**

```sql
CREATE VIEW v_research_study_nutrition_unit AS
SELECT a.research_study_id, a.study_id, a.study_title, a.start_date, b.id AS unit_id, b.unit_id AS unit_unit_id, b.established_date AS unit_established_date
FROM research_studies a JOIN nutrition_units b ON a.nutrition_unit_id = b.id;
```

| research_study_id | study_id | study_title | start_date | unit_id | unit_unit_id | unit_established_date |
|---|---|---|---|---|---|---|
| 1 | Karyawan | Composite Programme | 2022-09-05 | 1 | 39800614 | 2024-03-27 |
| 2 | 392491 | Compact Standard A | 2023-02-16 | 2 | 611523 | 2025-08-11 |
| 3 | 9568466 | Legacy Framework | 2024-07-27 | 3 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | 2022-01-22 |
| 4 | 4985166 | Regional Protocol | 2025-12-11 | 4 | account_pymes_1040 | 2023-06-06 |

`v_research_study_nutrition_unit` joins `research_studies` to `nutrition_units` on `research_study_id = nutrition_unit_id`, answering: which nutrition unit is the subject of each research study? The row linking `study_title` `Legacy Framework` to `unit_id` `57dbb53c-8fcc-11eb-924d-9cd76263cbd0` with `service_status` `suspended` reveals that a suspended unit is the focus of a process evaluation, possibly investigating the causes of operational failure.

**View `v_research_study_staff_member`**

```sql
CREATE VIEW v_research_study_staff_member AS
SELECT a.research_study_id, a.study_id, a.study_title, a.start_date, b.staff_member_id AS member_staff_member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM research_studies a JOIN staff_members b ON a.staff_member_id = b.staff_member_id;
```

| research_study_id | study_id | study_title | start_date | member_staff_member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|---|
| 1 | Karyawan | Composite Programme | 2022-09-05 | 1000 | 937735 | Theodore Mcgrath |
| 2 | 392491 | Compact Standard A | 2023-02-16 | 1001 | 3158139 | Account Name |
| 3 | 9568466 | Legacy Framework | 2024-07-27 | 1002 | 8189502 | Saipan International Airport |
| 4 | 4985166 | Regional Protocol | 2025-12-11 | 1003 | 69438 | Norma Fisher |

`v_research_study_staff_member` joins `research_studies` to `staff_members` on `research_study_id = staff_member_id`, answering: which staff member is involved in each research study? The row connecting `study_title` `Regional Protocol` to `full_name` `Norma Fisher` with `role` `administrator` and `performance_rating` `poor` suggests that an underperforming administrator is involved in operational research, which may raise questions about research integrity or staff development needs.

**View `v_research_study_beneficiary_group`**

```sql
CREATE VIEW v_research_study_beneficiary_group AS
SELECT a.research_study_id, a.study_id, a.study_title, a.start_date, b.beneficiary_group_id AS group_beneficiary_group_id, b.group_id AS group_group_id, b.group_name AS group_group_name
FROM research_studies a JOIN beneficiary_groups b ON a.beneficiary_group_id = b.beneficiary_group_id;
```

| research_study_id | study_id | study_title | start_date | group_beneficiary_group_id | group_group_id | group_group_name |
|---|---|---|---|---|---|---|
| 1 | Karyawan | Composite Programme | 2022-09-05 | 1 | 10449530 | Baseline Corridor D |
| 2 | 392491 | Compact Standard A | 2023-02-16 | 2 | 8189483 | Distributed Series |
| 3 | 9568466 | Legacy Framework | 2024-07-27 | 3 | 3718658437 | Adaptive Assessment |
| 4 | 4985166 | Regional Protocol | 2025-12-11 | 4 | IVC0 | Primary Survey A |

`v_research_study_beneficiary_group` joins `research_studies` to `beneficiary_groups` on `research_study_id = beneficiary_group_id`, answering: which beneficiary group is the focus of each research study? The row linking `study_title` `Compact Standard A` to `group_name` `Distributed Series` with `participation_level` `outpatient` clarifies that this impact assessment targets outpatient populations, informing sampling strategy.

**View `v_research_study_policy_recommendation`**

```sql
CREATE VIEW v_research_study_policy_recommendation AS
SELECT a.research_study_id, a.study_id, a.study_title, a.start_date, b.id AS recommendation_id, b.policy_id AS recommendation_policy_id, b.policy_title AS recommendation_policy_title
FROM research_studies a JOIN policy_recommendations b ON a.policy_recommendation_id = b.id;
```

| research_study_id | study_id | study_title | start_date | recommendation_id | recommendation_policy_id | recommendation_policy_title |
|---|---|---|---|---|---|---|
| 1 | Karyawan | Composite Programme | 2022-09-05 | 1000 | 5844252 | Baseline Initiative D |
| 2 | 392491 | Compact Standard A | 2023-02-16 | 1001 | 10207142 | Distributed Model |
| 3 | 9568466 | Legacy Framework | 2024-07-27 | 1002 | 1562847 | Adaptive Cluster |
| 4 | 4985166 | Regional Protocol | 2025-12-11 | 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Primary Review A |

`v_research_study_policy_recommendation` joins `research_studies` to `policy_recommendations` on `research_study_id = policy_recommendation_id`, answering: which policy recommendation results from each research study? The row connecting `study_title` `Legacy Framework` to `recommendation_title` `Adaptive Assessment` with `priority_level` `low` indicates that this study produces a low-priority recommendation, suggesting limited policy urgency or impact.

**View `v_policy_recommendation_research_study`**

```sql
CREATE VIEW v_policy_recommendation_research_study AS
SELECT a.id, a.policy_id, a.policy_title, a.issue_date, b.research_study_id AS study_research_study_id, b.study_id AS study_study_id, b.study_title AS study_study_title
FROM policy_recommendations a JOIN research_studies b ON a.research_study_id = b.research_study_id;
```

| id | policy_id | policy_title | issue_date | study_research_study_id | study_study_id | study_study_title |
|---|---|---|---|---|---|---|
| 1000 | 5844252 | Baseline Initiative D | 2023-02-01 | 1 | Karyawan | Composite Programme |
| 1001 | 10207142 | Distributed Model | 2024-07-12 | 2 | 392491 | Compact Standard A |
| 1002 | 1562847 | Adaptive Cluster | 2025-12-23 | 3 | 9568466 | Legacy Framework |
| 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Primary Review A | 2022-05-07 | 4 | 4985166 | Regional Protocol |

`v_policy_recommendation_research_study` performs the inverse join, linking `policy_recommendations` to `research_studies` on `policy_recommendation_id = research_study_id`, answering: which research study underpins each policy recommendation? The row pairing `recommendation_title` `Baseline Corridor D` with `study_title` `Composite Programme` and `publication_status` `published` confirms that this recommendation is grounded in published evidence, strengthening its credibility for policymakers.

**View `v_policy_recommendation_government_body`**

```sql
CREATE VIEW v_policy_recommendation_government_body AS
SELECT a.id, a.policy_id, a.policy_title, a.issue_date, b.government_body_id AS body_government_body_id, b.body_id AS body_body_id, b.body_name AS body_body_name
FROM policy_recommendations a JOIN government_bodies b ON a.government_body_id = b.government_body_id;
```

| id | policy_id | policy_title | issue_date | body_government_body_id | body_body_id | body_body_name |
|---|---|---|---|---|---|---|
| 1000 | 5844252 | Baseline Initiative D | 2023-02-01 | 1 | 6564383 | Regional Corridor |
| 1001 | 10207142 | Distributed Model | 2024-07-12 | 2 | 168556 | Seasonal Series D |
| 1002 | 1562847 | Adaptive Cluster | 2025-12-23 | 3 | strategic | Integrated Assessment |
| 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Primary Review A | 2022-05-07 | 4 | 195361 | Extended Survey |

`v_policy_recommendation_government_body` joins `policy_recommendations` to `government_bodies` on `policy_recommendation_id = government_body_id`, answering: which government body receives each policy recommendation? The row linking `recommendation_title` `Distributed Series` to `body_name` `Account Name` with `jurisdiction_level` `provincial` identifies the receiving authority, enabling targeted advocacy and implementation tracking.

**View `v_policy_recommendation_beneficiary_group`**

```sql
CREATE VIEW v_policy_recommendation_beneficiary_group AS
SELECT a.id, a.policy_id, a.policy_title, a.issue_date, b.beneficiary_group_id AS group_beneficiary_group_id, b.group_id AS group_group_id, b.group_name AS group_group_name
FROM policy_recommendations a JOIN beneficiary_groups b ON a.beneficiary_group_id = b.beneficiary_group_id;
```

| id | policy_id | policy_title | issue_date | group_beneficiary_group_id | group_group_id | group_group_name |
|---|---|---|---|---|---|---|
| 1000 | 5844252 | Baseline Initiative D | 2023-02-01 | 1 | 10449530 | Baseline Corridor D |
| 1001 | 10207142 | Distributed Model | 2024-07-12 | 2 | 8189483 | Distributed Series |
| 1002 | 1562847 | Adaptive Cluster | 2025-12-23 | 3 | 3718658437 | Adaptive Assessment |
| 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Primary Review A | 2022-05-07 | 4 | IVC0 | Primary Survey A |

`v_policy_recommendation_beneficiary_group` joins `policy_recommendations` to `beneficiary_groups` on `policy_recommendation_id = beneficiary_group_id`, answering: which beneficiary group is affected by each policy recommendation? The row connecting `recommendation_title` `Adaptive Assessment` to `group_name` `Adaptive Assessment` with `age_range` `baseline-age-67` clarifies that this recommendation targets a specific age cohort, informing equity analysis.

**View `v_policy_recommendation_nutrition_unit`**

```sql
CREATE VIEW v_policy_recommendation_nutrition_unit AS
SELECT a.id, a.policy_id, a.policy_title, a.issue_date, b.id AS unit_id, b.unit_id AS unit_unit_id, b.established_date AS unit_established_date
FROM policy_recommendations a JOIN nutrition_units b ON a.nutrition_unit_id = b.id;
```

| id | policy_id | policy_title | issue_date | unit_id | unit_unit_id | unit_established_date |
|---|---|---|---|---|---|---|
| 1000 | 5844252 | Baseline Initiative D | 2023-02-01 | 1 | 39800614 | 2024-03-27 |
| 1001 | 10207142 | Distributed Model | 2024-07-12 | 2 | 611523 | 2025-08-11 |
| 1002 | 1562847 | Adaptive Cluster | 2025-12-23 | 3 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | 2022-01-22 |
| 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Primary Review A | 2022-05-07 | 4 | account_pymes_1040 | 2023-06-06 |

`v_policy_recommendation_nutrition_unit` joins `policy_recommendations` to `nutrition_units` on `policy_recommendation_id = nutrition_unit_id`, answering: which nutrition unit is associated with each policy recommendation? The row linking `recommendation_title` `Primary Survey A` to `unit_id` `account_pymes_1040` with `management_quality` `high` suggests that a well-managed unit is driving policy innovation, potentially serving as a model for other units.

**View `v_government_body_policy_recommendation`**

```sql
CREATE VIEW v_government_body_policy_recommendation AS
SELECT a.government_body_id, a.body_id, a.body_name, a.country_code, b.id AS recommendation_id, b.policy_id AS recommendation_policy_id, b.policy_title AS recommendation_policy_title
FROM government_bodies a JOIN policy_recommendations b ON a.policy_recommendation_id = b.id;
```

| government_body_id | body_id | body_name | country_code | recommendation_id | recommendation_policy_id | recommendation_policy_title |
|---|---|---|---|---|---|---|
| 1 | 6564383 | Regional Corridor | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 1000 | 5844252 | Baseline Initiative D |
| 2 | 168556 | Seasonal Series D | lu_tax_code_template_m_I_2 | 1001 | 10207142 | Distributed Model |
| 3 | strategic | Integrated Assessment | default_chart_a_account_57 | 1002 | 1562847 | Adaptive Cluster |
| 4 | 195361 | Extended Survey | 727045 | 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Primary Review A |

`v_government_body_policy_recommendation` joins `government_bodies` to `policy_recommendations` on `government_body_id = policy_recommendation_id`, answering: which policy recommendations does each government body receive? The row connecting `body_name` `Theodore Mcgrath` to `recommendation_title` `Baseline Corridor D` with `implementation_status` `implemented` confirms that this national-level body has acted on a published recommendation, demonstrating policy uptake.

**View `v_government_body_nutrition_unit`**

```sql
CREATE VIEW v_government_body_nutrition_unit AS
SELECT a.government_body_id, a.body_id, a.body_name, a.country_code, b.id AS unit_id, b.unit_id AS unit_unit_id, b.established_date AS unit_established_date
FROM government_bodies a JOIN nutrition_units b ON a.nutrition_unit_id = b.id;
```

| government_body_id | body_id | body_name | country_code | unit_id | unit_unit_id | unit_established_date |
|---|---|---|---|---|---|---|
| 1 | 6564383 | Regional Corridor | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 1 | 39800614 | 2024-03-27 |
| 2 | 168556 | Seasonal Series D | lu_tax_code_template_m_I_2 | 2 | 611523 | 2025-08-11 |
| 3 | strategic | Integrated Assessment | default_chart_a_account_57 | 3 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | 2022-01-22 |
| 4 | 195361 | Extended Survey | 727045 | 4 | account_pymes_1040 | 2023-06-06 |

`v_government_body_nutrition_unit` joins `government_bodies` to `nutrition_units` on `government_body_id = nutrition_unit_id`, answering: which nutrition unit does each government body engage with? The row linking `body_name` `Account Name` to `unit_id` `611523` with `service_status` `inactive` reveals that a provincial body is associated with an inactive unit, possibly indicating a gap in government engagement or a need for unit reactivation.

**View `v_government_body_staff_member`**

```sql
CREATE VIEW v_government_body_staff_member AS
SELECT a.government_body_id, a.body_id, a.body_name, a.country_code, b.staff_member_id AS member_staff_member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM government_bodies a JOIN staff_members b ON a.staff_member_id = b.staff_member_id;
```

| government_body_id | body_id | body_name | country_code | member_staff_member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|---|
| 1 | 6564383 | Regional Corridor | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 1000 | 937735 | Theodore Mcgrath |
| 2 | 168556 | Seasonal Series D | lu_tax_code_template_m_I_2 | 1001 | 3158139 | Account Name |
| 3 | strategic | Integrated Assessment | default_chart_a_account_57 | 1002 | 8189502 | Saipan International Airport |
| 4 | 195361 | Extended Survey | 727045 | 1003 | 69438 | Norma Fisher |

`v_government_body_staff_member` joins `government_bodies` to `staff_members` on `government_body_id = staff_member_id`, answering: which staff member liaises with each government body? The row connecting `body_name` `Saipan International Airport` to `full_name` `Saipan International Airport` with `role` `community_health_worker` and `employer` `international_agency` shows that an international agency worker serves as the liaison, reflecting cross-sectoral coordination.

The materialised views collectively provide a denormalised lens onto the normalised schema, each answering a single relational question by joining two tables along a foreign-key path. The naming convention — `v_<hub>_<spoke>` — makes the join direction explicit: the first table name identifies the driving entity, and the second identifies the related entity. This convention, combined with the consistent use of surrogate primary keys and business identifiers, ensures that every view can be traced back to its source tables and that the join condition is unambiguous. The model's hub-and-spoke topology, with `nutrition_units` and `geographic_areas` as primary hubs, reflects the domain's emphasis on place-based service delivery and the centrality of nutrition units as the operational interface between populations, staff, research, and policy.