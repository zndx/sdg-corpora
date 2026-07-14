## Nutrition Program Administration and Cross-Functional Coordination

Nutrition program administration operates at the intersection of clinical service delivery, geographic targeting, and multi-stakeholder coordination. Nutrition units serve as the primary operational entities, each anchored to a specific geographic area, serving defined beneficiary populations, and staffed by personnel who deliver training, conduct research, and inform policy. The records maintained across these organizations form an interconnected web: a nutrition unit does not exist in isolation but is embedded within a geographic area's socioeconomic context, serves a particular beneficiary group, employs staff members who run training programs, and generates research that feeds into policy recommendations reviewed by government bodies. Understanding how these entities relate requires examining both the standalone records and the joined views that reveal the operational relationships between them.

**Table `nutrition_units`**

| id | unit_id | established_date | annual_budget | currency_code | service_status | operational_scope | target_population | management_quality | geographic_area_id | beneficiary_group_id | research_study_id | staff_member_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 39800614 | 2024-03-27 | 44,248 | gd_fp_eu_acc3 | active | inpatient | urban_poor | high | 1000 | 1 | 1 | 1000 |
| 2 | 611523 | 2025-08-11 | 76,784 | managing-resources | inactive | outpatient | hard_core_poor | medium | 1001 | 2 | 2 | 1001 |
| 3 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | 2022-01-22 | 41,373 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | suspended | daycare | slum_residents | low | 1002 | 3 | 3 | 1002 |
| 4 | account_pymes_1040 | 2023-06-06 | 175,434 | 10445649 | active | community | urban_poor | high | 1003 | 4 | 4 | 1003 |

Nutrition units are the foundational service-delivery entities in this system. Each unit carries a unique identifier, an established date, and an annual budget measured in a specific currency code. The service status—active, inactive, or suspended—indicates current operational capacity, while the operational scope distinguishes between inpatient, outpatient, daycare, and community-based service models. Management quality is assessed as high, medium, or low, and each unit targets a specific population segment such as urban_poor or hard_core_poor. The unit at identifier 39800614, established on 2024-03-27 with an annual budget of 44,248 gd_fp_eu_acc3, operates as an inpatient facility serving the urban_poor population with high management quality. By contrast, the unit account_pymes_1040, established on 2023-06-06 with a substantially larger budget of 175,434, also serves the urban_poor but at the community level. The suspended unit 57dbb53c-8fcc-11eb-924d-9cd76263cbd0, operating at the daycare level for slum_residents, carries a low management quality rating, suggesting that resource allocation and oversight intensity vary considerably across the portfolio.

**Table `geographic_areas`**

| id | area_id | area_name | population_density | mortality_rate | morbidity_rate | administrative_zone | socioeconomic_status | infrastructure_level | nutrition_unit_id | beneficiary_group_id | geographic_area_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | default_chart_a_tax_19 | Primary Programme A | 18 | 3.70 | 7.95 | compact-administ-38 | extreme_poverty | basic | 1 | 1 | 1000 |
| 1001 | fro | Composite Standard | 24 | 7.40 | 9.90 | composite-administ-39 | poverty | adequate | 2 | 2 | 1001 |
| 1002 | account_pymes_296 | Compact Framework | 30 | 11.10 | 11.85 | primary-administ-40 | moderate_poverty | advanced | 3 | 3 | 1002 |
| 1003 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Legacy Protocol D | 36 | 14.80 | 13.80 | adaptive-administ-41 | extreme_poverty | basic | 4 | 4 | 1003 |

Geographic areas provide the spatial and socioeconomic context within which nutrition units operate. Each area is characterized by its population density, mortality rate, morbidity rate, administrative zone classification, socioeconomic status, and infrastructure level. The area Primary Programme A, identified as default_chart_a_tax_19, has a population density of 18, a mortality rate of 3.70, and a morbidity rate of 7.95, situated in the compact-administ-38 zone with extreme_poverty socioeconomic status and basic infrastructure. The area Legacy Protocol D, identified as 57e52fbc-8fcd-11eb-924d-9cd76263cbd0, presents a markedly different profile: population density of 36, mortality rate of 14.80, and morbidity rate of 13.80, in the adaptive-administ-41 zone, also classified as extreme_poverty but with advanced infrastructure. This contrast illustrates that socioeconomic status alone does not determine health outcomes; infrastructure quality and administrative structure play significant mediating roles.

**Table `beneficiary_groups`**

| beneficiary_group_id | group_id | group_name | age_range | gender | enrollment_date | discharge_date | recovery_status | participation_level | nutrition_unit_id | training_program_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 10449530 | Baseline Corridor D | adaptive-age-65 | female | 2022-05-11 | 2022-09-02 | recovered | inpatient | 1 | 1 |
| 2 | 8189483 | Distributed Series | distributed-age-66 | male | 2023-10-22 | 2023-02-13 | ongoing | outpatient | 2 | 2 |
| 3 | 3718658437 | Adaptive Assessment | baseline-age-67 | both | 2024-03-06 | 2024-07-24 | failed | community | 3 | 3 |
| 4 | IVC0 | Primary Survey A | pilot-age-68 | female | 2025-08-17 | 2025-12-08 | transferred | none | 4 | 4 |

Beneficiary groups represent the populations enrolled in nutrition services. Each group is defined by a group name, an age range category, a gender designation, enrollment and discharge dates, a recovery status, and a participation level. The group Baseline Corridor D, identified as 10449530, consists of female participants in the adaptive-age-65 range, enrolled from 2022-05-11 to 2022-09-02, with a recovered status and inpatient participation level. The group Primary Survey A, identified as IVC0, comprises female participants in the pilot-age-68 range, enrolled from 2025-08-17 to 2025-12-08, with a transferred status and no participation level, indicating a transition out of the program. Recovery outcomes span recovered, ongoing, failed, and transferred, reflecting the heterogeneous trajectories of beneficiaries through the nutrition system.

**Table `training_programs`**

| id | program_id | program_name | start_date | end_date | duration_hours | target_audience | completion_rate | effectiveness_rating | nutrition_unit_id | staff_member_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | 2022-09-05 | 2022-09-01 | 29 | government_staff | 19.70 | high | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 2986219 | Pilot Initiative A | 2023-02-16 | 2023-02-12 | 38 | ngo_staff | 22.40 | medium | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 1186079 | Baseline Model | 2024-07-27 | 2024-07-23 | 47 | community_workers | 25.10 | low | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 1562855 | Distributed Cluster | 2025-12-11 | 2025-12-07 | 56 | government_staff | 27.80 | high | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Training programs deliver capacity-building interventions to staff and community workers. Each program has a name, a defined start and end date, a duration in hours, a target audience, a completion rate, and an effectiveness rating. The program Extended Review, identified as 103176, targets government_staff, runs for 29 hours, achieves a completion rate of 19.70, and carries a high effectiveness rating. The program Distributed Cluster, identified as 1562855, also targets government_staff but with a longer duration of 56 hours, a higher completion rate of 27.80, and a high effectiveness rating. Programs targeting different audiences—government_staff, ngo_staff, and community_workers—show varying completion rates and effectiveness, suggesting that audience composition and program design interact to influence outcomes.

**Table `staff_members`**

| staff_member_id | staff_id | full_name | role | employer | training_completion_date | performance_rating | motivation_level | years_of_experience | training_program_id | beneficiary_group_id | research_study_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 937735 | Theodore Mcgrath | nurse | government | 2024-11-27 | excellent | high | 7 | 1 | 1 | 1 |
| 1001 | 3158139 | Account Name | nutritionist | ngo | 2025-04-11 | good | medium | 10 | 2 | 2 | 2 |
| 1002 | 8189502 | Saipan International Airport | community_health_worker | international_agency | 2022-09-22 | average | low | 13 | 3 | 3 | 3 |
| 1003 | 69438 | Norma Fisher | administrator | government | 2023-02-06 | poor | high | 16 | 4 | 4 | 4 |

Staff members are the human resources who deliver services, conduct research, and manage programs. Each staff member has a full name, a role, an employer type, a training completion date, a performance rating, a motivation level, and years of experience. Theodore Mcgrath, identified as staff member 1000, is a nurse employed by the government with 7 years of experience, an excellent performance rating, and high motivation. Norma Fisher, identified as staff member 1003, is an administrator also employed by the government but with 16 years of experience, a poor performance rating, and high motivation. The divergence between experience and performance rating—Norma Fisher's 16 years paired with a poor rating versus Theodore Mcgrath's 7 years with an excellent rating—highlights that tenure alone does not guarantee effectiveness, and motivation levels do not always align with performance outcomes.

**Table `research_studies`**

| research_study_id | study_id | study_title | start_date | end_date | study_type | sample_size | primary_outcome | publication_status | nutrition_unit_id | staff_member_id | beneficiary_group_id | policy_recommendation_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Karyawan | Composite Programme | 2022-09-05 | 2022-09-01 | operational_research | 31 | extended-primary-63 | published | 1 | 1000 | 1 | 1000 |
| 2 | 392491 | Compact Standard A | 2023-02-16 | 2023-02-12 | impact_assessment | 38 | integrated-primary-64 | in_review | 2 | 1001 | 2 | 1001 |
| 3 | 9568466 | Legacy Framework | 2024-07-27 | 2024-07-23 | process_evaluation | 45 | seasonal-primary-65 | unpublished | 3 | 1002 | 3 | 1002 |
| 4 | 4985166 | Regional Protocol | 2025-12-11 | 2025-12-07 | operational_research | 52 | regional-primary-66 | published | 4 | 1003 | 4 | 1003 |

Research studies generate evidence that informs program design and policy. Each study has a title, a start and end date, a study type, a sample size, a primary outcome category, and a publication status. The study Composite Programme, identified as Karyawan, is an operational_research study with a sample size of 31, primary outcome extended-primary-63, and published status. The study Compact Standard A, identified as 392491, is an impact_assessment with a sample size of 38, primary outcome integrated-primary-64, and in_review status. Study types range from operational_research to impact_assessment to process_evaluation, and publication statuses include published, in_review, and unpublished, indicating that the evidence pipeline spans from completed and disseminated work to studies still under review.

**Table `policy_recommendations`**

| id | policy_id | policy_title | issue_date | target_policy_area | adoption_status | influence_level | source_study | research_study_id | government_body_id | beneficiary_group_id | nutrition_unit_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 5844252 | Baseline Initiative D | 2023-02-01 | malnutrition_treatment | adopted | high | integrated-source-22 | 1 | 1 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 10207142 | Distributed Model | 2024-07-12 | community_health | rejected | medium | seasonal-source-23 | 2 | 2 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 1562847 | Adaptive Cluster | 2025-12-23 | training_standards | pending | low | regional-source-24 | 3 | 3 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Primary Review A | 2022-05-07 | resource_allocation | partially_adopted | high | legacy-source-25 | 4 | 4 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Policy recommendations translate research findings into actionable guidance for government bodies. Each recommendation is linked to a research study, a government body, and a beneficiary group, forming the bridge between evidence and governance. The specific recommendations and their institutional linkages are detailed in the joined views that follow.

**Table `government_bodies`**

| government_body_id | body_id | body_name | country_code | policy_status | budget_allocation | coordination_level | last_policy_review | policy_recommendation_id | nutrition_unit_id | staff_member_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 6564383 | Regional Corridor | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | clearly_stated | 446.22 | high | 2025-08-09 | 1000 | 1 | 1000 | 2025-01-01 00:14:00 |
| 2 | 168556 | Seasonal Series D | lu_tax_code_template_m_I_2 | vague | 763.46 | medium | 2022-01-20 | 1001 | 2 | 1001 | 2025-02-06 03:14:00 |
| 3 | strategic | Integrated Assessment | default_chart_a_account_57 | non_existent | 12.34 | low | 2023-06-04 | 1002 | 3 | 1002 | 2025-03-11 06:14:00 |
| 4 | 195361 | Extended Survey | 727045 | clearly_stated | 1,737 | high | 2024-11-15 | 1003 | 4 | 1003 | 2025-04-16 09:14:00 |

Government bodies are the institutional recipients of policy recommendations and the authorities that oversee nutrition program operations. Each body is linked to specific policy recommendations and nutrition units, anchoring the policy cycle within a governance structure. The relationships between government bodies and other entities are elaborated in the views below.

The view v_nutrition_unit_geographic_area connects nutrition units to their host geographic areas, answering the question of which spatial and socioeconomic contexts each unit serves. The unit 39800614 is linked to the geographic area default_chart_a_tax_19 (Primary Programme A), which has a population density of 18, a mortality rate of 3.70, and extreme_poverty socioeconomic status. This pairing reveals that the unit operates in a relatively low-density area with moderate health indicators. The unit account_pymes_1040 is linked to the geographic area 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 (Legacy Protocol D), which has a population density of 36, a mortality rate of 14.80, and extreme_poverty status with advanced infrastructure. The higher mortality and morbidity rates in this area, despite advanced infrastructure, suggest that socioeconomic deprivation and population density may outweigh infrastructure advantages in determining health outcomes.

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

The view v_nutrition_unit_beneficiary_group links nutrition units to the beneficiary groups they serve, clarifying the population-level reach of each unit. The unit 39800614 serves the beneficiary group 10449530 (Baseline Corridor D), which consists of female participants in the adaptive-age-65 range with a recovered status and inpatient participation level. This indicates that the unit's inpatient scope aligns with a population that has completed its recovery trajectory. The unit account_pymes_1040 serves the beneficiary group IVC0 (Primary Survey A), with a transferred status and no participation level, suggesting that this unit's community-based model may facilitate transitions to other care settings or programs.

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

The view v_nutrition_unit_research_study connects nutrition units to the research studies they support, revealing the evidence-generation activities embedded within service delivery. The unit 39800614 is associated with the research study Karyawan (Composite Programme), an operational_research study with a sample size of 31 and published status. This pairing suggests that the unit contributes to or hosts operational research that has already been disseminated. The unit account_pymes_1040 is associated with the research study 4985166 (Regional Protocol), an operational_research study with a sample size of 52 and published status, indicating a larger evidence base generated from this unit.

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

The view v_nutrition_unit_staff_member links nutrition units to the staff members who work within them, establishing the human resource allocation across units. The unit 39800614 is staffed by Theodore Mcgrath (staff member 1000), a nurse with 7 years of experience, excellent performance, and high motivation. The unit account_pymes_1040 is staffed by Norma Fisher (staff member 1003), an administrator with 16 years of experience, poor performance, and high motivation. These pairings illustrate that staffing decisions do not always align with performance outcomes, and that different roles—nurse versus administrator—may carry different expectations and evaluation criteria.

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

The view v_geographic_area_nutrition_unit reverses the perspective, showing which nutrition units operate within each geographic area. The area default_chart_a_tax_19 (Primary Programme A) hosts the nutrition unit 39800614, which has an active service status, an inpatient operational scope, and a high management quality rating. The area 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 (Legacy Protocol D) hosts the nutrition unit account_pymes_1040, which also has an active status but a community operational scope and high management quality. This view enables geographic planners to assess whether the quality and scope of nutrition services are appropriately matched to the health needs of each area.

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

The view v_geographic_area_beneficiary_group connects geographic areas to the beneficiary groups served within them, providing a spatial-population mapping. The area default_chart_a_tax_19 (Primary Programme A) encompasses the beneficiary group 10449530 (Baseline Corridor D), a female, adaptive-age-65 cohort with recovered status. The area 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 (Legacy Protocol D) encompasses the beneficiary group IVC0 (Primary Survey A), a female, pilot-age-68 cohort with transferred status. These pairings allow geographic coordinators to understand the demographic composition and recovery trajectories of populations within each area.

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

The view v_geographic_area_geographic_area captures self-referential or hierarchical relationships within the geographic area registry, potentially indicating nested administrative zones or overlapping service territories. The area default_chart_a_tax_19 (Primary Programme A) references itself, as does the area 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 (Legacy Protocol D). This self-linking may reflect areas that serve as both primary service zones and administrative reference points for subordinate territories.

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

The view v_beneficiary_group_nutrition_unit presents the beneficiary-group perspective on nutrition unit linkages, answering which units each beneficiary group has engaged with. The group 10449530 (Baseline Corridor D) is linked to the nutrition unit 39800614, which operates at the inpatient level with high management quality. The group IVC0 (Primary Survey A) is linked to the nutrition unit account_pymes_1040, which operates at the community level with high management quality. This view is useful for tracking beneficiary pathways and understanding how different service scopes affect enrollment and discharge patterns.

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

The view v_beneficiary_group_training_program connects beneficiary groups to the training programs that may have been designed for or delivered to their members. The group 10449530 (Baseline Corridor D) is linked to the training program 103176 (Extended Review), which targets government_staff, runs for 29 hours, and has a high effectiveness rating. The group IVC0 (Primary Survey A) is linked to the training program 1562855 (Distributed Cluster), which also targets government_staff, runs for 56 hours, and has a high effectiveness rating. These linkages suggest that training programs may be designed with specific beneficiary populations in mind, even when the stated target audience is staff rather than beneficiaries directly.

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

The view v_training_program_nutrition_unit links training programs to the nutrition units that host or sponsor them. The program 103176 (Extended Review) is associated with the nutrition unit 39800614, which has an active status and inpatient scope. The program 1562855 (Distributed Cluster) is associated with the nutrition unit account_pymes_1040, which has an active status and community scope. This view helps training coordinators understand which units are investing in capacity building and whether program design varies by unit type.

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

The view v_training_program_staff_member connects training programs to the staff members who deliver or participate in them. The program 103176 (Extended Review) is delivered by staff member 1000 (Theodore Mcgrath), a nurse with excellent performance and high motivation. The program 1562855 (Distributed Cluster) is delivered by staff member 1003 (Norma Fisher), an administrator with poor performance but high motivation. These pairings reveal that staff members with divergent performance ratings may both be entrusted with training delivery, and that motivation levels do not necessarily predict training effectiveness.

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

The view v_staff_member_training_program presents the staff-member perspective on training program involvement. Staff member 1000 (Theodore Mcgrath) is associated with the training program 103176 (Extended Review), which has a completion rate of 19.70 and high effectiveness. Staff member 1003 (Norma Fisher) is associated with the training program 1562855 (Distributed Cluster), which has a completion rate of 27.80 and high effectiveness. The higher completion rate of the program delivered by the lower-performing staff member raises questions about whether program design, rather than individual staff performance, drives training outcomes.

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

The view v_staff_member_beneficiary_group links staff members to the beneficiary groups they serve, establishing the human-population interface. Staff member 1000 (Theodore Mcgrath) serves the beneficiary group 10449530 (Baseline Corridor D), a female cohort with recovered status. Staff member 1003 (Norma Fisher) serves the beneficiary group IVC0 (Primary Survey A), a female cohort with transferred status. These pairings allow supervisors to assess workload distribution and the alignment between staff expertise and beneficiary needs.

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

The view v_staff_member_research_study connects staff members to the research studies they conduct or contribute to. Staff member 1000 (Theodore Mcgrath) is associated with the research study Karyawan (Composite Programme), an operational_research study with published status. Staff member 1003 (Norma Fisher) is associated with the research study 4985166 (Regional Protocol), an operational_research study with published status. Both staff members are engaged in operational research that has reached publication, suggesting that research output is not limited to senior or highly-rated staff.

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

The view v_research_study_nutrition_unit links research studies to the nutrition units that host or support them. The study Karyawan (Composite Programme) is hosted by the nutrition unit 39800614, which has an active status and high management quality. The study 4985166 (Regional Protocol) is hosted by the nutrition unit account_pymes_1040, which also has an active status and high management quality. This view enables research coordinators to assess whether research productivity correlates with unit management quality and operational status.

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

The view v_research_study_staff_member presents the research-study perspective on staff involvement. The study Karyawan (Composite Programme) involves staff member 1000 (Theodore Mcgrath), a nurse with excellent performance. The study 4985166 (Regional Protocol) involves staff member 1003 (Norma Fisher), an administrator with poor performance. The inclusion of staff members across the performance spectrum in published research suggests that research contributions may be valued independently of routine performance evaluations.

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

The view v_research_study_beneficiary_group connects research studies to the beneficiary groups that are the subjects of research. The study Karyawan (Composite Programme) focuses on the beneficiary group 10449530 (Baseline Corridor D), a female cohort with recovered status. The study 4985166 (Regional Protocol) focuses on the beneficiary group IVC0 (Primary Survey A), a female cohort with transferred status. These linkages clarify the population-level focus of each study and enable researchers to assess whether certain beneficiary profiles are over- or under-represented in the evidence base.

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

The view v_research_study_policy_recommendation links research studies to the policy recommendations they inform, completing the evidence-to-policy pipeline. The study Karyawan (Composite Programme) informs the policy recommendation linked to government body 1000. The study 4985166 (Regional Protocol) informs the policy recommendation linked to government body 1003. These connections demonstrate how operational research and impact assessments feed directly into policy formulation, ensuring that governance decisions are grounded in empirical evidence.

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

The view v_policy_recommendation_research_study presents the policy-recommendation perspective on its research foundations. Each policy recommendation traces back to a specific research study, ensuring traceability from recommendation to evidence. The recommendation linked to government body 1000 derives from the study Karyawan (Composite Programme), while the recommendation linked to government body 1003 derives from the study 4985166 (Regional Protocol). This traceability is essential for accountability and for updating recommendations as new evidence becomes available.

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

The view v_policy_recommendation_government_body connects policy recommendations to the government bodies that receive and act on them. The government body 1000 receives the policy recommendation derived from the study Karyawan (Composite Programme). The government body 1003 receives the policy recommendation derived from the study 4985166 (Regional Protocol). These pairings establish the institutional channels through which research evidence enters the policy-making process, enabling oversight of which bodies are most actively engaged with evidence-based guidance.

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

The view v_policy_recommendation_beneficiary_group links policy recommendations to the beneficiary groups they are designed to serve. The recommendation received by government body 1000 targets the beneficiary group 10449530 (Baseline Corridor D). The recommendation received by government body 1003 targets the beneficiary group IVC0 (Primary Survey A). These linkages ensure that policy recommendations are population-specific and that the intended beneficiaries of each recommendation are clearly identified.

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

The view v_policy_recommendation_nutrition_unit connects policy recommendations to the nutrition units they are intended to guide. The recommendation received by government body 1000 is designed to guide the nutrition unit 39800614. The recommendation received by government body 1003 is designed to guide the nutrition unit account_pymes_1040. This view completes the policy cycle by showing how evidence-based recommendations flow from research through governance to operational units, ensuring that program management decisions are informed by the best available evidence.

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

The view v_government_body_policy_recommendation presents the government-body perspective on the policy recommendations it receives. Government body 1000 receives the policy recommendation derived from the study Karyawan (Composite Programme), while government body 1003 receives the recommendation derived from the study 4985166 (Regional Protocol). These pairings allow governance coordinators to track which bodies are most actively engaged with research evidence and to assess whether policy uptake is evenly distributed across the institutional landscape.

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

The view v_government_body_nutrition_unit links government bodies to the nutrition units they oversee, establishing the governance hierarchy. Government body 1000 oversees the nutrition unit 39800614, which has an active status and inpatient scope. Government body 1003 oversees the nutrition unit account_pymes_1040, which has an active status and community scope. These pairings enable oversight authorities to monitor the operational status and service scope of the units under their jurisdiction, ensuring that governance aligns with service delivery realities.

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

The view v_government_body_staff_member connects government bodies to the staff members they employ or supervise. Government body 1000 supervises staff member 1000 (Theodore Mcgrath), a nurse with excellent performance and high motivation. Government body 1003 supervises staff member 1003 (Norma Fisher), an administrator with poor performance and high motivation. These linkages allow governance bodies to assess workforce composition, identify performance trends, and allocate resources for training and development where needed.

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

## Synthesis

The nutrition program administration domain is defined by a dense network of relationships that span service delivery, geographic targeting, human resources, evidence generation, and governance. Nutrition units anchor the operational layer, each embedded in a geographic area with distinct health indicators and socioeconomic conditions, serving specific beneficiary groups through defined service scopes. Staff members deliver services, conduct research, and train others, while their performance and motivation levels vary independently of tenure and employer type. Research studies generate evidence across operational, impact, and process evaluation designs, with publication status indicating the maturity of the evidence pipeline. Policy recommendations translate this evidence into actionable guidance for government bodies, which in turn oversee nutrition units and supervise staff. The joined views make these relationships explicit, enabling practitioners to trace a beneficiary's journey from enrollment through recovery, follow a research study from design to publication to policy, or assess how a government body's oversight aligns with the operational realities of the units and staff under its jurisdiction. Effective administration in this domain requires maintaining the integrity of each record while leveraging the cross-entity relationships that the views expose.