## Organizational Assessment and Workplace Evaluation

Modern enterprises operate within complex ecosystems where internal culture, external partnerships, and measurable health indicators converge to define organizational performance. The records maintained across this domain capture a comprehensive picture of how companies are evaluated, recognized, and connected to their broader industrial landscape. At the center of this framework sits the organization—a legal and operational entity characterized by its founding year, headquarters location, membership tier, and whether it holds B Corporation certification. These entities are not isolated; they maintain formal partnerships, participate in industry sectors, and undergo structured assessment cycles that produce awards, survey results, and health scores. The data model preserves every link in this chain, from the initial survey administration through to the final recognition or remediation recommendation.

**Table `organizations`**

| id | org_id | org_name | founding_year | headquarters_location | industry_sector | membership_level | is_b_corp | workplace_award_id | employee_feedback_survey_id | health_id | partner_organization_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 790471 | Extended Review | 43 | composite-headquar-63 | seasonal-industry-35 | pilot-membersh-32 | true | 1 | 1 | 3990171 | 1 |
| 1001 | 1717 | Pilot Initiative A | 48 | primary-headquar-64 | regional-industry-36 | extended-membersh-33 | false | 2 | 2 | 101 | 2 |
| 1002 | 69437 | Baseline Model | 53 | adaptive-headquar-65 | legacy-industry-37 | integrated-membersh-34 | true | 3 | 3 | select | 3 |
| 1003 | m16 | Distributed Cluster | 58 | distributed-headquar-66 | compact-industry-38 | seasonal-membersh-35 | false | 4 | 4 | 778569 | 4 |

An organization such as Extended Review (identifier 790471), founded in year 43 and headquartered at composite-headquar-63, carries a seasonal-industry-35 classification and pilot-membersh-32 membership level. Its B Corporation status is confirmed as true, and it maintains a formal partnership with Composite Review. Another example, Pilot Initiative A (identifier 1717), operates from primary-headquar-64 under regional-industry-36 with extended-membersh-33 membership and does not hold B Corp designation. The organization table anchors all other records; every award, survey, health assessment, and partnership references back to one of these core entities through the id column.

**Table `workplace_awards`**

| workplace_award_id | award_id | award_year | rank | category | issuing_organization | survey_methodology | is_repeat_winner | organization_id | employee_feedback_survey_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | 36 | 16 | compact-category-92 | Alphabet Inc Class A | pilot-survey-14 | false | 1000 | 1 |
| 2 | 3012811 | 43 | 20 | composite-category-93 | ITT Industries | extended-survey-15 | true | 1001 | 2 |
| 3 | 15493350 | 50 | 24 | primary-category-94 | Switch Card Services Ltd. | integrated-survey-16 | false | 1002 | 3 |
| 4 | state_uk_17 | 57 | 28 | adaptive-category-95 | Buypass AS | seasonal-survey-17 | true | 1003 | 4 |

Workplace awards represent formal recognition granted to organizations, each carrying a unique award identifier, a year value, a rank, and a category classification. The issuing organization—such as Alphabet Inc Class A for award e02275d4-8fd1-11eb-924d-9cd76263cbd0—documents the granting body, while the survey_methodology field records whether the evaluation used pilot-survey-14, extended-survey-15, integrated-survey-16, or seasonal-survey-17 protocols. The is_repeat_winner flag distinguishes first-time recipients from those who have earned recognition previously; ITT Industries, for instance, holds award 3012811 with a rank of 20 in composite-category-93 and is marked as a repeat winner. Awards are tied to specific organizations and their associated employee feedback surveys, creating a traceable lineage from survey administration through to formal recognition.

**Table `employee_feedback_surveys`**

| employee_feedback_survey_id | survey_id | administered_by | number_of_employees | number_of_organizations | measurement_aspects | survey_date | response_rate | organization_id | workplace_award_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 21005921 | legacy-administ-49 | 20 | 22 | compact-measurem-62 | 2024-07-23T18:30:00 | 18.45 | 1000 | 1 |
| 2 | 726059 | compact-administ-50 | 30 | 28 | composite-measurem-63 | 2025-12-07T01:47:00 | 21.90 | 1001 | 2 |
| 3 | 32814 | composite-administ-51 | 40 | 34 | primary-measurem-64 | 2022-05-18T08:04:00 | 25.35 | 1002 | 3 |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | primary-administ-52 | 50 | 40 | adaptive-measurem-65 | 2023-10-02T15:21:00 | 28.80 | 1003 | 4 |

Employee feedback surveys constitute the primary mechanism for gathering workplace data. Each survey is administered by a designated body—legacy-administ-49, compact-administ-50, composite-administ-51, or primary-administ-52—and covers a defined number of employees and organizations. Survey 21005921, administered by legacy-administ-49, reached 20 employees across 22 organizations with a response rate of 18.45 percent, using compact-measurem-62 as its measurement aspect on the date 2024-07-23. Survey 726059, by contrast, engaged 30 employees from 28 organizations at a 21.90 percent response rate, employing composite-measurem-63. The survey_date field anchors each assessment in time, while the response_rate provides a quality signal for downstream analysis. Every survey links to exactly one organization and one workplace award, forming a direct chain from data collection to recognition.

**Table `workplace_culture_dimensions`**

| id | dimension_id | dimension_name | description | measurement_scale | is_core_metric | employee_feedback_survey_id | health_id |
|---|---|---|---|---|---|---|---|
| 1 | 5917277 | Seasonal Corridor | Extended Survey | pilot-measurem-38 | true | 1 | 3990171 |
| 2 | 4277009 | Integrated Series | Pilot Corridor A | extended-measurem-39 | false | 2 | 101 |
| 3 | 8928522 | Extended Assessment D | Baseline Series | integrated-measurem-40 | true | 3 | select |
| 4 | 16346068 | Pilot Survey | Distributed Assessment | seasonal-measurem-41 | false | 4 | 778569 |

Workplace culture dimensions capture the qualitative aspects of organizational life, each identified by a dimension_name such as Seasonal Corridor, Integrated Series, Extended Assessment D, or Pilot Survey. The description field provides additional context—Extended Survey, Pilot Corridor A, Baseline Series, Distributed Assessment—while the measurement_scale (pilot-measurem-38 through seasonal-measurem-41) standardizes how each dimension is quantified. The is_core_metric flag indicates whether a dimension is central to the assessment framework; Seasonal Corridor and Extended Assessment D are both marked as core metrics. Each dimension record connects to an employee feedback survey and, where applicable, to an organizational health record, enabling cross-referencing between cultural indicators and health outcomes.

**Table `organizational_healths`**

| health_id | organization_id | health_score | assessment_date | health_status | improvement_areas | assessed_for_organization_id | workplace_award_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 3990171 | Shell Oil | 15.20 | 2022-05-10T04:24:00 | integrated-health-94 | extended-improvem-93 | 1000 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | GlobalPlatform Inc. | 18.40 | 2023-10-21T11:41:00 | seasonal-health-95 | integrated-improvem-94 | 1001 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| select | Whatsapp Inc. | 21.60 | 2024-03-05T18:58:00 | regional-health-96 | seasonal-improvem-95 | 1002 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 778569 | American Institutes for Research | 24.80 | 2025-08-16T01:15:00 | legacy-health-97 | regional-improvem-96 | 1003 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Organizational health assessments provide a numerical and categorical evaluation of an entity's operational well-being. The health_score—ranging from 15.20 for Shell Oil to 24.80 for American Institutes for Research—offers a quantitative snapshot, while the health_status field (integrated-health-94, seasonal-health-95, regional-health-96, legacy-health-97) classifies the overall condition. Improvement areas are documented through fields like extended-improvem-93 and integrated-improvem-94, guiding remediation efforts. The assessment_date records when the evaluation occurred, and the assessed_for_organization_id confirms which entity was evaluated. Health records are linked to organizations, workplace awards, and workplace culture dimensions, creating a multidimensional view of organizational performance.

**Table `partner_organizations`**

| partner_organization_id | partner_id | partner_name | partnership_type | membership_level | start_date | organization_id | industry_sector_id |
|---|---|---|---|---|---|---|---|
| 1 | 69420 | Composite Review | primary-partners-40 | pilot-membersh-32 | 2022-09-05 | 1000 | 1 |
| 2 | 9085260 | Compact Initiative A | adaptive-partners-41 | extended-membersh-33 | 2023-02-16 | 1001 | 2 |
| 3 | 195367 | Legacy Model | distributed-partners-42 | integrated-membersh-34 | 2024-07-27 | 1002 | 3 |
| 4 | b_VB-EC-12 | Regional Cluster | baseline-partners-43 | seasonal-membersh-35 | 2025-12-11 | 1003 | 4 |

Partnerships between organizations are formally recorded with a partner_name, partnership_type, and membership_level. Composite Review, for example, maintains a primary-partners-40 relationship with Extended Review (organization 1000), beginning on 2022-09-05 under pilot-membersh-32 terms. Compact Initiative A holds an adaptive-partners-41 partnership with Pilot Initiative A, starting 2023-02-16. The partner_organization table also references an industry_sector_id, connecting each partnership to a broader industrial classification. These records ensure that the network of organizational relationships is fully traceable and auditable.

**Table `industry_sectors`**

| industry_sector_id | sector_id | sector_name | description | is_public_sector | organization_id | partner_organization_id |
|---|---|---|---|---|---|---|
| 1 | 7119771 | Distributed Survey | Extended Survey | true | 1000 | 1 |
| 2 | 726049 | Adaptive Corridor D | Pilot Corridor A | false | 1001 | 2 |
| 3 | 103175 | Primary Series | Baseline Series | true | 1002 | 3 |
| 4 | 9125631 | Composite Assessment | Distributed Assessment | false | 1003 | 4 |

Industry sectors provide the categorical framework within which organizations and their partnerships are classified. While the sector table itself contains the master list of sector identifiers and names, its presence in the model ensures that every organization and partner relationship can be contextualized within an industrial taxonomy. The sector_id columns in both the organizations and partner_organizations tables reference this master list, enabling aggregation and comparison across industry boundaries.

**Table `surveys_dimensions`**

| employee_feedback_survey_id | workplace_culture_dimension_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

Surveys dimensions define the measurement aspects used across employee feedback surveys. The compact-measurem-62, composite-measurem-63, primary-measurem-64, and adaptive-measurem-65 values seen in the survey records are catalogued here, providing a standardized vocabulary for survey design and analysis. This dimension table ensures consistency in how measurement aspects are named, referenced, and interpreted across the entire assessment pipeline.

**Table `healths_dimensions`**

| health_id | workplace_culture_dimension_id |
|---|---|
| 3990171 | 1 |
| 3990171 | 2 |
| 101 | 2 |
| 101 | 3 |
| select | 3 |
| select | 4 |
| 778569 | 4 |
| 778569 | 1 |

Healths dimensions serve a parallel function for organizational health assessments, cataloguing the health_status and improvement_area classifications used throughout the health records. The integrated-health-94, seasonal-health-95, regional-health-96, and legacy-health-97 statuses, along with their corresponding improvement areas, are defined here to maintain uniformity across all health evaluations.

The relational structure of this domain becomes most powerful when the individual tables are joined into analytical views. Each view answers a specific operational question by combining data from multiple sources.

**View `vw_workplace_award_organization`**

```sql
CREATE VIEW vw_workplace_award_organization AS
SELECT a.workplace_award_id, a.award_id, a.award_year, a.rank, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM workplace_awards a JOIN organizations b ON a.organization_id = b.id;
```

| workplace_award_id | award_id | award_year | rank | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | 36 | 16 | 1000 | 790471 | Extended Review |
| 2 | 3012811 | 43 | 20 | 1001 | 1717 | Pilot Initiative A |
| 3 | 15493350 | 50 | 24 | 1002 | 69437 | Baseline Model |
| 4 | state_uk_17 | 57 | 28 | 1003 | m16 | Distributed Cluster |

This view joins workplace awards with their parent organizations, answering the question: which organization received which award, and under what conditions? The record for Alphabet Inc Class A shows award e02275d4-8fd1-11eb-924d-9cd76263cbd0 granted to organization 1000 in year 36 at rank 16, with pilot-survey-14 methodology and a non-repeat status. This single row connects the award identifier, the issuing body, the survey approach, and the recipient organization into one coherent record.

**View `vw_workplace_award_employee_feedback_survey`**

```sql
CREATE VIEW vw_workplace_award_employee_feedback_survey AS
SELECT a.workplace_award_id, a.award_id, a.award_year, a.rank, b.employee_feedback_survey_id AS survey_employee_feedback_survey_id, b.survey_id AS survey_survey_id, b.administered_by AS survey_administered_by
FROM workplace_awards a JOIN employee_feedback_surveys b ON a.employee_feedback_survey_id = b.employee_feedback_survey_id;
```

| workplace_award_id | award_id | award_year | rank | survey_employee_feedback_survey_id | survey_survey_id | survey_administered_by |
|---|---|---|---|---|---|---|
| 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | 36 | 16 | 1 | 21005921 | legacy-administ-49 |
| 2 | 3012811 | 43 | 20 | 2 | 726059 | compact-administ-50 |
| 3 | 15493350 | 50 | 24 | 3 | 32814 | composite-administ-51 |
| 4 | state_uk_17 | 57 | 28 | 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | primary-administ-52 |

By linking awards to their associated surveys, this view reveals the data collection process behind each recognition. ITT Industries' award 3012811 (rank 20, composite-category-93) is connected to survey 726059, which was administered by compact-administ-50 to 30 employees with a 21.90 percent response rate. The view confirms that repeat winners like ITT Industries earned their recognition through structured survey processes with documented participation rates.

**View `vw_employee_feedback_survey_workplace_culture_dimension_detail`**

```sql
CREATE VIEW vw_employee_feedback_survey_workplace_culture_dimension_detail AS
SELECT a.employee_feedback_survey_id, a.survey_id, a.administered_by, b.id AS dimension_id, b.dimension_id AS dimension_dimension_id, b.dimension_name AS dimension_dimension_name
FROM employee_feedback_surveys a
  JOIN surveys_dimensions j ON j.employee_feedback_survey_id = a.employee_feedback_survey_id
  JOIN workplace_culture_dimensions b ON b.id = j.workplace_culture_dimension_id;
```

| employee_feedback_survey_id | survey_id | administered_by | dimension_id | dimension_dimension_id | dimension_dimension_name |
|---|---|---|---|---|---|
| 1 | 21005921 | legacy-administ-49 | 1 | 5917277 | Seasonal Corridor |
| 1 | 21005921 | legacy-administ-49 | 2 | 4277009 | Integrated Series |
| 2 | 726059 | compact-administ-50 | 2 | 4277009 | Integrated Series |
| 2 | 726059 | compact-administ-50 | 3 | 8928522 | Extended Assessment D |
| 3 | 32814 | composite-administ-51 | 3 | 8928522 | Extended Assessment D |
| 3 | 32814 | composite-administ-51 | 4 | 16346068 | Pilot Survey |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | primary-administ-52 | 4 | 16346068 | Pilot Survey |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | primary-administ-52 | 1 | 5917277 | Seasonal Corridor |

This join connects survey results to the cultural dimensions measured within them. Survey 21005921, which reached 20 employees at an 18.45 percent response rate, is linked to the Seasonal Corridor dimension (dimension_id 5917277), measured on the pilot-measurem-38 scale and flagged as a core metric. The health_id 3990171 ties this cultural assessment directly to the organizational health record for Shell Oil, creating a bridge between survey data and health outcomes.

**View `vw_employee_feedback_survey_organization`**

```sql
CREATE VIEW vw_employee_feedback_survey_organization AS
SELECT a.employee_feedback_survey_id, a.survey_id, a.administered_by, a.number_of_employees, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM employee_feedback_surveys a JOIN organizations b ON a.organization_id = b.id;
```

| employee_feedback_survey_id | survey_id | administered_by | number_of_employees | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1 | 21005921 | legacy-administ-49 | 20 | 1000 | 790471 | Extended Review |
| 2 | 726059 | compact-administ-50 | 30 | 1001 | 1717 | Pilot Initiative A |
| 3 | 32814 | composite-administ-51 | 40 | 1002 | 69437 | Baseline Model |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | primary-administ-52 | 50 | 1003 | m16 | Distributed Cluster |

This view answers which organization conducted which survey and under what parameters. Survey 32814, administered by composite-administ-51 to 40 employees across 34 organizations with a 25.35 percent response rate, is linked to organization 1002 (Baseline Model). The survey_date of 2022-05-18 and measurement aspect primary-measurem-64 provide the temporal and methodological context for this assessment.

**View `vw_employee_feedback_survey_workplace_award`**

```sql
CREATE VIEW vw_employee_feedback_survey_workplace_award AS
SELECT a.employee_feedback_survey_id, a.survey_id, a.administered_by, a.number_of_employees, b.workplace_award_id AS award_workplace_award_id, b.award_id AS award_award_id, b.award_year AS award_award_year
FROM employee_feedback_surveys a JOIN workplace_awards b ON a.workplace_award_id = b.workplace_award_id;
```

| employee_feedback_survey_id | survey_id | administered_by | number_of_employees | award_workplace_award_id | award_award_id | award_award_year |
|---|---|---|---|---|---|---|
| 1 | 21005921 | legacy-administ-49 | 20 | 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | 36 |
| 2 | 726059 | compact-administ-50 | 30 | 2 | 3012811 | 43 |
| 3 | 32814 | composite-administ-51 | 40 | 3 | 15493350 | 50 |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | primary-administ-52 | 50 | 4 | state_uk_17 | 57 |

This view maps surveys to their corresponding awards, revealing the recognition pathway. Survey b83e028a-8fcd-11eb-924d-9cd76263cbd0, administered by primary-administ-52 to 50 employees with a 28.80 percent response rate, is associated with award 15493350 (rank 24, primary-category-94) issued by Switch Card Services Ltd. The survey_date of 2023-10-02 and the organization_id of 1003 complete the picture of how data collection led to formal recognition.

**View `vw_workplace_culture_dimension_employee_feedback_survey`**

```sql
CREATE VIEW vw_workplace_culture_dimension_employee_feedback_survey AS
SELECT a.id, a.dimension_id, a.dimension_name, a.description, b.employee_feedback_survey_id AS survey_employee_feedback_survey_id, b.survey_id AS survey_survey_id, b.administered_by AS survey_administered_by
FROM workplace_culture_dimensions a JOIN employee_feedback_surveys b ON a.employee_feedback_survey_id = b.employee_feedback_survey_id;
```

| id | dimension_id | dimension_name | description | survey_employee_feedback_survey_id | survey_survey_id | survey_administered_by |
|---|---|---|---|---|---|---|
| 1 | 5917277 | Seasonal Corridor | Extended Survey | 1 | 21005921 | legacy-administ-49 |
| 2 | 4277009 | Integrated Series | Pilot Corridor A | 2 | 726059 | compact-administ-50 |
| 3 | 8928522 | Extended Assessment D | Baseline Series | 3 | 32814 | composite-administ-51 |
| 4 | 16346068 | Pilot Survey | Distributed Assessment | 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | primary-administ-52 |

Reversing the cultural dimension perspective, this view shows which surveys measured which dimensions. The Extended Assessment D dimension (id 8928522, description Baseline Series, measurement_scale integrated-measurem-40, is_core_metric true) is linked to survey 32814, which had a 25.35 percent response rate and used primary-measurem-64. This cross-reference enables analysts to trace how specific cultural constructs were evaluated across different survey administrations.

**View `vw_workplace_culture_dimension_organizational_health`**

```sql
CREATE VIEW vw_workplace_culture_dimension_organizational_health AS
SELECT a.id, a.dimension_id, a.dimension_name, a.description, b.health_id AS health_health_id, b.organization_id AS health_organization_id, b.health_score AS health_health_score
FROM workplace_culture_dimensions a JOIN organizational_healths b ON a.health_id = b.health_id;
```

| id | dimension_id | dimension_name | description | health_health_id | health_organization_id | health_health_score |
|---|---|---|---|---|---|---|
| 1 | 5917277 | Seasonal Corridor | Extended Survey | 3990171 | Shell Oil | 15.20 |
| 2 | 4277009 | Integrated Series | Pilot Corridor A | 101 | GlobalPlatform Inc. | 18.40 |
| 3 | 8928522 | Extended Assessment D | Baseline Series | select | Whatsapp Inc. | 21.60 |
| 4 | 16346068 | Pilot Survey | Distributed Assessment | 778569 | American Institutes for Research | 24.80 |

This join connects cultural dimensions to health assessments, answering whether specific cultural factors correlate with health outcomes. The Seasonal Corridor dimension (id 5917277) is linked to health record 3990171, which carries a health_score of 15.20, health_status integrated-health-94, and improvement_area extended-improvem-93 for Shell Oil. The assessment_date of 2022-05-10 provides the temporal anchor for this correlation.

**View `vw_organizational_health_organization`**

```sql
CREATE VIEW vw_organizational_health_organization AS
SELECT a.health_id, a.organization_id, a.health_score, a.assessment_date, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM organizational_healths a JOIN organizations b ON a.assessed_for_organization_id = b.id;
```

| health_id | organization_id | health_score | assessment_date | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 3990171 | Shell Oil | 15.20 | 2022-05-10T04:24:00 | 1000 | 790471 | Extended Review |
| 101 | GlobalPlatform Inc. | 18.40 | 2023-10-21T11:41:00 | 1001 | 1717 | Pilot Initiative A |
| select | Whatsapp Inc. | 21.60 | 2024-03-05T18:58:00 | 1002 | 69437 | Baseline Model |
| 778569 | American Institutes for Research | 24.80 | 2025-08-16T01:15:00 | 1003 | m16 | Distributed Cluster |

This view links health assessments to their parent organizations, answering which entity received which health evaluation. Health record 101, with a score of 18.40 and status seasonal-health-95, is associated with organization 1001 (Pilot Initiative A). The improvement_area integrated-improvem-94 and assessment_date 2023-10-21 provide the remediation guidance and timing for this evaluation.

**View `vw_organizational_health_workplace_culture_dimension_detail`**

```sql
CREATE VIEW vw_organizational_health_workplace_culture_dimension_detail AS
SELECT a.health_id, a.organization_id, a.health_score, b.id AS dimension_id, b.dimension_id AS dimension_dimension_id, b.dimension_name AS dimension_dimension_name
FROM organizational_healths a
  JOIN healths_dimensions j ON j.health_id = a.health_id
  JOIN workplace_culture_dimensions b ON b.id = j.workplace_culture_dimension_id;
```

| health_id | organization_id | health_score | dimension_id | dimension_dimension_id | dimension_dimension_name |
|---|---|---|---|---|---|
| 3990171 | Shell Oil | 15.20 | 1 | 5917277 | Seasonal Corridor |
| 3990171 | Shell Oil | 15.20 | 2 | 4277009 | Integrated Series |
| 101 | GlobalPlatform Inc. | 18.40 | 2 | 4277009 | Integrated Series |
| 101 | GlobalPlatform Inc. | 18.40 | 3 | 8928522 | Extended Assessment D |
| select | Whatsapp Inc. | 21.60 | 3 | 8928522 | Extended Assessment D |
| select | Whatsapp Inc. | 21.60 | 4 | 16346068 | Pilot Survey |
| 778569 | American Institutes for Research | 24.80 | 4 | 16346068 | Pilot Survey |
| 778569 | American Institutes for Research | 24.80 | 1 | 5917277 | Seasonal Corridor |

This view cross-references health records with the cultural dimensions that informed them. Health record 778569 (score 24.80, status legacy-health-97, improvement_area regional-improvem-96) for American Institutes for Research is linked to the Pilot Survey dimension (id 16346068, measurement_scale seasonal-measurem-41, is_core_metric false). The assessment_date of 2025-08-16 situates this evaluation in the most recent cycle.

**View `vw_organizational_health_workplace_award`**

```sql
CREATE VIEW vw_organizational_health_workplace_award AS
SELECT a.health_id, a.organization_id, a.health_score, a.assessment_date, b.workplace_award_id AS award_workplace_award_id, b.award_id AS award_award_id, b.award_year AS award_award_year
FROM organizational_healths a JOIN workplace_awards b ON a.workplace_award_id = b.workplace_award_id;
```

| health_id | organization_id | health_score | assessment_date | award_workplace_award_id | award_award_id | award_award_year |
|---|---|---|---|---|---|---|
| 3990171 | Shell Oil | 15.20 | 2022-05-10T04:24:00 | 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | 36 |
| 101 | GlobalPlatform Inc. | 18.40 | 2023-10-21T11:41:00 | 2 | 3012811 | 43 |
| select | Whatsapp Inc. | 21.60 | 2024-03-05T18:58:00 | 3 | 15493350 | 50 |
| 778569 | American Institutes for Research | 24.80 | 2025-08-16T01:15:00 | 4 | state_uk_17 | 57 |

This join connects health assessments to the awards that organizations held at the time of evaluation. Health record 3990171 (Shell Oil, score 15.20) is linked to workplace award 1 (issued by Alphabet Inc Class A, rank 16, category compact-category-92). The assessed_for_organization_id of 1000 confirms the entity under evaluation, while the created_at and updated_at timestamps (2025-01-01 and 2025-01-02) document the assessment lifecycle.

**View `vw_organization_workplace_award`**

```sql
CREATE VIEW vw_organization_workplace_award AS
SELECT a.id, a.org_id, a.org_name, a.founding_year, b.workplace_award_id AS award_workplace_award_id, b.award_id AS award_award_id, b.award_year AS award_award_year
FROM organizations a JOIN workplace_awards b ON a.workplace_award_id = b.workplace_award_id;
```

| id | org_id | org_name | founding_year | award_workplace_award_id | award_award_id | award_award_year |
|---|---|---|---|---|---|---|
| 1000 | 790471 | Extended Review | 43 | 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | 36 |
| 1001 | 1717 | Pilot Initiative A | 48 | 2 | 3012811 | 43 |
| 1002 | 69437 | Baseline Model | 53 | 3 | 15493350 | 50 |
| 1003 | m16 | Distributed Cluster | 58 | 4 | state_uk_17 | 57 |

This view presents organizations alongside their awards, providing a clean organizational-to-recognition mapping. Organization 1000 (Extended Review, founding_year 43, headquarters composite-headquar-63, B Corp true) is linked to workplace award 1 (award_id e02275d4-8fd1-11eb-924d-9cd76263cbd0, year 36, rank 16, category compact-category-92, issuing_organization Alphabet Inc Class A). The employee_feedback_survey_id of 1 and health_id of 3990171 complete the organizational profile.

**View `vw_organization_employee_feedback_survey`**

```sql
CREATE VIEW vw_organization_employee_feedback_survey AS
SELECT a.id, a.org_id, a.org_name, a.founding_year, b.employee_feedback_survey_id AS survey_employee_feedback_survey_id, b.survey_id AS survey_survey_id, b.administered_by AS survey_administered_by
FROM organizations a JOIN employee_feedback_surveys b ON a.employee_feedback_survey_id = b.employee_feedback_survey_id;
```

| id | org_id | org_name | founding_year | survey_employee_feedback_survey_id | survey_survey_id | survey_administered_by |
|---|---|---|---|---|---|---|
| 1000 | 790471 | Extended Review | 43 | 1 | 21005921 | legacy-administ-49 |
| 1001 | 1717 | Pilot Initiative A | 48 | 2 | 726059 | compact-administ-50 |
| 1002 | 69437 | Baseline Model | 53 | 3 | 32814 | composite-administ-51 |
| 1003 | m16 | Distributed Cluster | 58 | 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | primary-administ-52 |

This view maps organizations to their surveys, answering which entity was assessed through which survey process. Organization 1001 (Pilot Initiative A, founding_year 48, headquarters primary-headquar-64, B Corp false) is linked to employee feedback survey 2 (survey_id 726059, administered by compact-administ-50, 30 employees, 21.90 percent response rate, survey_date 2025-12-07). The workplace_award_id of 2 and health_id of 101 provide the recognition and health context.

**View `vw_organization_organizational_health`**

```sql
CREATE VIEW vw_organization_organizational_health AS
SELECT a.id, a.org_id, a.org_name, a.founding_year, b.health_id AS health_health_id, b.organization_id AS health_organization_id, b.health_score AS health_health_score
FROM organizations a JOIN organizational_healths b ON a.health_id = b.health_id;
```

| id | org_id | org_name | founding_year | health_health_id | health_organization_id | health_health_score |
|---|---|---|---|---|---|---|
| 1000 | 790471 | Extended Review | 43 | 3990171 | Shell Oil | 15.20 |
| 1001 | 1717 | Pilot Initiative A | 48 | 101 | GlobalPlatform Inc. | 18.40 |
| 1002 | 69437 | Baseline Model | 53 | select | Whatsapp Inc. | 21.60 |
| 1003 | m16 | Distributed Cluster | 58 | 778569 | American Institutes for Research | 24.80 |

This view connects organizations to their health assessments, providing a direct organizational-to-health mapping. Organization 1002 (Baseline Model, founding_year 53, headquarters adaptive-headquar-65, B Corp true) is linked to health record select (health_score 21.60, status regional-health-96, improvement_area seasonal-improvem-95, assessment_date 2024-03-05). The workplace_award_id of 3 and employee_feedback_survey_id of 3 complete the assessment chain.

**View `vw_organization_partner_organization`**

```sql
CREATE VIEW vw_organization_partner_organization AS
SELECT a.id, a.org_id, a.org_name, a.founding_year, b.partner_organization_id AS organization_partner_organization_id, b.partner_id AS organization_partner_id, b.partner_name AS organization_partner_name
FROM organizations a JOIN partner_organizations b ON a.partner_organization_id = b.partner_organization_id;
```

| id | org_id | org_name | founding_year | organization_partner_organization_id | organization_partner_id | organization_partner_name |
|---|---|---|---|---|---|---|
| 1000 | 790471 | Extended Review | 43 | 1 | 69420 | Composite Review |
| 1001 | 1717 | Pilot Initiative A | 48 | 2 | 9085260 | Compact Initiative A |
| 1002 | 69437 | Baseline Model | 53 | 3 | 195367 | Legacy Model |
| 1003 | m16 | Distributed Cluster | 58 | 4 | b_VB-EC-12 | Regional Cluster |

This view reveals the partnership network of each organization. Organization 1003 (Distributed Cluster, founding_year 58, headquarters distributed-headquar-66, B Corp false) is linked to partner organization 4 (partner_name Regional Cluster, partnership_type baseline-partners-43, membership_level seasonal-membersh-35, start_date 2025-12-11). The health_id of 778569 and workplace_award_id of 4 provide the health and recognition context for this partnership.

**View `vw_partner_organization_organization`**

```sql
CREATE VIEW vw_partner_organization_organization AS
SELECT a.partner_organization_id, a.partner_id, a.partner_name, a.partnership_type, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM partner_organizations a JOIN organizations b ON a.organization_id = b.id;
```

| partner_organization_id | partner_id | partner_name | partnership_type | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1 | 69420 | Composite Review | primary-partners-40 | 1000 | 790471 | Extended Review |
| 2 | 9085260 | Compact Initiative A | adaptive-partners-41 | 1001 | 1717 | Pilot Initiative A |
| 3 | 195367 | Legacy Model | distributed-partners-42 | 1002 | 69437 | Baseline Model |
| 4 | b_VB-EC-12 | Regional Cluster | baseline-partners-43 | 1003 | m16 | Distributed Cluster |

This view presents partner organizations alongside their parent organizations, clarifying the partnership structure. Partner organization 1 (partner_name Composite Review, partner_id 69420, partnership_type primary-partners-40, membership_level pilot-membersh-32, start_date 2022-09-05) is linked to organization 1000 (Extended Review, founding_year 43, B Corp true). The industry_sector_id of 1 provides the industrial classification for this partnership.

**View `vw_partner_organization_industry_sector`**

```sql
CREATE VIEW vw_partner_organization_industry_sector AS
SELECT a.partner_organization_id, a.partner_id, a.partner_name, a.partnership_type, b.industry_sector_id AS sector_industry_sector_id, b.sector_id AS sector_sector_id, b.sector_name AS sector_sector_name
FROM partner_organizations a JOIN industry_sectors b ON a.industry_sector_id = b.industry_sector_id;
```

| partner_organization_id | partner_id | partner_name | partnership_type | sector_industry_sector_id | sector_sector_id | sector_sector_name |
|---|---|---|---|---|---|---|
| 1 | 69420 | Composite Review | primary-partners-40 | 1 | 7119771 | Distributed Survey |
| 2 | 9085260 | Compact Initiative A | adaptive-partners-41 | 2 | 726049 | Adaptive Corridor D |
| 3 | 195367 | Legacy Model | distributed-partners-42 | 3 | 103175 | Primary Series |
| 4 | b_VB-EC-12 | Regional Cluster | baseline-partners-43 | 4 | 9125631 | Composite Assessment |

This view connects partner organizations to their industry sectors, answering which industrial classification applies to each partnership. Partner organization 2 (Compact Initiative A, adaptive-partners-41, start_date 2023-02-16) is linked to organization 1001 and industry sector 2. Partner organization 3 (Legacy Model, distributed-partners-42, start_date 2024-07-27) connects to organization 1002 and industry sector 3. Partner organization 4 (Regional Cluster, baseline-partners-43, start_date 2025-12-11) links to organization 1003 and industry sector 4.

**View `vw_industry_sector_organization`**

```sql
CREATE VIEW vw_industry_sector_organization AS
SELECT a.industry_sector_id, a.sector_id, a.sector_name, a.description, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM industry_sectors a JOIN organizations b ON a.organization_id = b.id;
```

| industry_sector_id | sector_id | sector_name | description | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1 | 7119771 | Distributed Survey | Extended Survey | 1000 | 790471 | Extended Review |
| 2 | 726049 | Adaptive Corridor D | Pilot Corridor A | 1001 | 1717 | Pilot Initiative A |
| 3 | 103175 | Primary Series | Baseline Series | 1002 | 69437 | Baseline Model |
| 4 | 9125631 | Composite Assessment | Distributed Assessment | 1003 | m16 | Distributed Cluster |

This view maps industry sectors to the organizations operating within them, providing an industrial taxonomy view. Industry sector 1 is associated with organization 1000 (Extended Review, B Corp true, pilot-membersh-32). Industry sector 2 corresponds to organization 1001 (Pilot Initiative A, B Corp false, extended-membersh-33). Industry sector 3 maps to organization 1002 (Baseline Model, B Corp true, integrated-membersh-34). Industry sector 4 links to organization 1003 (Distributed Cluster, B Corp false, seasonal-membersh-35).

**View `vw_industry_sector_partner_organization`**

```sql
CREATE VIEW vw_industry_sector_partner_organization AS
SELECT a.industry_sector_id, a.sector_id, a.sector_name, a.description, b.partner_organization_id AS organization_partner_organization_id, b.partner_id AS organization_partner_id, b.partner_name AS organization_partner_name
FROM industry_sectors a JOIN partner_organizations b ON a.partner_organization_id = b.partner_organization_id;
```

| industry_sector_id | sector_id | sector_name | description | organization_partner_organization_id | organization_partner_id | organization_partner_name |
|---|---|---|---|---|---|---|
| 1 | 7119771 | Distributed Survey | Extended Survey | 1 | 69420 | Composite Review |
| 2 | 726049 | Adaptive Corridor D | Pilot Corridor A | 2 | 9085260 | Compact Initiative A |
| 3 | 103175 | Primary Series | Baseline Series | 3 | 195367 | Legacy Model |
| 4 | 9125631 | Composite Assessment | Distributed Assessment | 4 | b_VB-EC-12 | Regional Cluster |

This final view connects industry sectors to the partner organizations operating within them, completing the industrial partnership taxonomy. Industry sector 1 encompasses partner organization 1 (Composite Review, primary-partners-40). Industry sector 2 includes partner organization 2 (Compact Initiative A, adaptive-partners-41). Industry sector 3 contains partner organization 3 (Legacy Model, distributed-partners-42). Industry sector 4 holds partner organization 4 (Regional Cluster, baseline-partners-43).

The domain model presented here captures the full lifecycle of organizational assessment—from initial survey administration through cultural dimension measurement, health evaluation, formal recognition, and partnership documentation. Every record is traceable to its parent organization, and every view provides a specific analytical lens on the relationships between these entities. The data supports both granular investigation of individual assessments and broad aggregation across industry sectors and membership levels, making it suitable for practitioners who need to understand not just how organizations are evaluated, but how those evaluations connect to the broader ecosystem of partnerships, cultural factors, and industrial classifications.