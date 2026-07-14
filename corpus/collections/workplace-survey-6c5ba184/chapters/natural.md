## The Architecture of Workplace Assessment

Organizations seeking to understand their internal health rely on structured surveys, external research firms, and recognition programs to drive improvement. The data model described here captures the full lifecycle of workplace assessment: from the initial survey administered by a research firm, through the evaluation of organizational health across multiple dimensions, to the awarding of recognition and the involvement of media partners in publicizing results. Employees participate in surveys, belong to departments within organizations, and operate within client sectors that define the broader market context. This chapter walks through the entities, their relationships, and the analytical views that synthesize them into actionable intelligence.

The foundation of the system rests on seven core tables that store the primary records of the domain.

**Table `workplace_surveys`**

| id | survey_id | administered_by | survey_date | total_employees | organizational_health_score | alignment_score | execution_score | connection_score | status | research_firm_id | organization_id | workplace_award_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 21005921 | legacy-administ-49 | 2024-07-23T18:30:00 | 56 | 19.95 | 9.45 | 11.45 | 6.20 | pending | 1 | 1 | 1 |
| 2 | 726059 | compact-administ-50 | 2025-12-07T01:47:00 | 1150 | 22.90 | 12.90 | 14.90 | 10.40 | running | 2 | 2 | 2 |
| 3 | 32814 | composite-administ-51 | 2022-05-18T08:04:00 | 24 | 25.85 | 16.35 | 18.35 | 14.60 | complete | 3 | 3 | 3 |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | primary-administ-52 | 2023-10-02T15:21:00 | 1574 | 28.80 | 19.80 | 21.80 | 18.80 | failed | 4 | 4 | 4 |

The `workplace_surveys` table is the central record of each assessment event. Every row captures a unique survey identified by both a numeric `id` and a human-readable `survey_id`. The `administered_by` field records the entity that conducted the survey, with values such as `legacy-administ-49` and `compact-administ-50` appearing in the data. Surveys are timestamped via `survey_date`, and each records the `total_employees` scope — ranging from a small operation of 24 employees to a large enterprise of 1,574. The health of the organization is quantified through three dimension scores: `organizational_health_score`, `alignment_score`, `execution_score`, and `connection_score`. For instance, survey row 4 (identifier `b83e028a-8fcd-11eb-924d-9cd76263cbd0`) shows an organizational health score of 28.80, an alignment score of 19.80, an execution score of 21.80, and a connection score of 18.80. The `status` column tracks the lifecycle stage — `pending`, `running`, `complete`, or `failed` — and foreign keys `research_firm_id`, `organization_id`, and `workplace_award_id` link the survey to its administering firm, the target organization, and any associated award.

**Table `research_firms`**

| research_firm_id | firm_id | firm_name | headquarters_location | founding_year | b_corp_member | specialization | consulting_services | organization_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 575216 | Legacy Review D | composite-headquar-63 | 43 | true | legacy-speciali-13 | false | 1 |
| 2 | e4ea9416-8fd1-11eb-924d-9cd76263cbd0 | Regional Initiative | primary-headquar-64 | 48 | false | compact-speciali-14 | true | 2 |
| 3 | 884351 | Seasonal Model | adaptive-headquar-65 | 53 | true | composite-speciali-15 | false | 3 |
| 4 | L907 | Integrated Cluster A | distributed-headquar-66 | 58 | false | primary-speciali-16 | true | 4 |

Research firms are the external entities that design and administer workplace surveys. The `research_firms` table stores each firm's `research_firm_id`, `firm_id`, `firm_name`, `headquarters_location`, `founding_year`, and whether it is a `b_corp_member`. The `specialization` field categorizes the firm's focus area, with values like `legacy-speciali-13` and `compact-speciali-14` in the data. The `consulting_services` boolean indicates whether the firm offers advisory services beyond survey administration. Row 4, for example, represents "Integrated Cluster A" (firm_id `L907`), headquartered at `distributed-headquar-66`, founded in year 58, not a B Corp member, specializing in `primary-speciali-16`, and offering consulting services. The `organization_id` foreign key ties the firm to an organizational home.

**Table `organizations`**

| organization_id | org_id | org_name | established_year | industry | employee_count | platinum_member | parent_org | acquisition_date | workplace_survey_id | workplace_award_id | acquired_organization_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | 10 | composite-industry-99 | 131 | false | regional-parent-72 | 2023-02-07 | 1 | 1 | 1 |
| 2 | 1717 | Pilot Initiative A | 16 | primary-industry-100 | 428 | true | legacy-parent-73 | 2024-07-18 | 2 | 2 | 2 |
| 3 | 69437 | Baseline Model | 22 | adaptive-industry-101 | 3 | false | compact-parent-74 | 2025-12-02 | 3 | 3 | 3 |
| 4 | m16 | Distributed Cluster | 28 | distributed-industry-102 | 9 | true | composite-parent-75 | 2022-05-13 | 4 | 4 | 4 |

Organizations are the entities being assessed. The `organizations` table records each organization's `organization_id`, `org_id`, `org_name`, `established_year`, `industry`, `employee_count`, `platinum_member` status, `parent_org`, `acquisition_date`, and foreign keys to its `workplace_survey_id`, `workplace_award_id`, and `acquired_organization_id`. Row 1, "Extended Review" (org_id `790471`), was established in year 10, operates in `composite-industry-99`, has 131 employees, is not a platinum member, and was acquired on 2023-02-07. Row 4, "Distributed Cluster" (org_id `m16`), was established in year 28, operates in `distributed-industry-102`, has 9 employees, is a platinum member, and was acquired on 2022-05-13.

**Table `workplace_awards`**

| workplace_award_id | award_id | award_name | award_year | rank | issuing_body | criteria_met | award_description | organization_id | workplace_survey_id | media_partner_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Primary Review A | 36 | 16 | baseline-issuing-13 | false | Composite Cluster | 1 | 1 | 1 |
| 2 | 3012811 | Composite Initiative | 43 | 20 | pilot-issuing-14 | true | Compact Review A | 2 | 2 | 2 |
| 3 | 15493350 | Compact Model | 50 | 24 | extended-issuing-15 | false | Legacy Initiative | 3 | 3 | 3 |
| 4 | state_uk_17 | Legacy Cluster D | 57 | 28 | integrated-issuing-16 | true | Regional Model | 4 | 4 | 4 |

Workplace awards formalize recognition for organizational achievement. The `workplace_awards` table stores `workplace_award_id`, `award_id`, `award_name`, `award_year`, `rank`, `issuing_body`, `criteria_met`, `award_description`, and foreign keys to `organization_id`, `workplace_survey_id`, and `media_partner_id`. Row 1, "Primary Review A" (award_id `e02275d4-8fd1-11eb-924d-9cd76263cbd0`), was issued in year 36 at rank 16 by `baseline-issuing-13`, with criteria not met (`false`), described as "Composite Cluster". Row 4, "Legacy Cluster D" (award_id `state_uk_17`), was issued in year 57 at rank 28 by `integrated-issuing-16`, with criteria met (`true`), described as "Regional Model".

**Table `media_partners`**

| id | partner_id | partner_name | country | prestige_level | campaign_participation | research_firm_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 69420 | Composite Review | compact-country-26 | seasonal-prestige-23 | false | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 9085260 | Compact Initiative A | composite-country-27 | regional-prestige-24 | true | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 195367 | Legacy Model | primary-country-28 | legacy-prestige-25 | false | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | b_VB-EC-12 | Regional Cluster | adaptive-country-29 | compact-prestige-26 | true | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Media partners amplify the reach of awards and surveys. The `media_partners` table records `id`, `partner_id`, `partner_name`, `country`, `prestige_level`, `campaign_participation`, `research_firm_id`, `created_at`, and `updated_at`. Row 1, "Composite Review" (partner_id `69420`), is based in `compact-country-26` at `seasonal-prestige-23`, does not participate in campaigns, and is linked to research firm 1. Row 2, "Compact Initiative A" (partner_id `9085260`), is based in `composite-country-27` at `regional-prestige-24`, participates in campaigns (`true`), and is linked to research firm 2.

**Table `employees`**

| employee_id | employee_name | department | years_employed | feedback_submitted | professionalism_rating | teamwork_rating | organization_id | workplace_survey_id | client_sector_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | Cole Vasquez | adaptive-departme-89 | 46 | false | 18.95 | 9.95 | 1 | 1 | 1000 |
| 101 | Susan Levy | distributed-departme-90 | 57 | true | 20.90 | 13.90 | 2 | 2 | 1001 |
| 102 | Tasha Rodriguez | baseline-departme-91 | 68 | false | 22.85 | 17.85 | 3 | 3 | 1002 |
| 103 | Sarah Villanueva | pilot-departme-92 | 79 | true | 24.80 | 21.80 | 4 | 4 | 1003 |

Employees are the individuals who participate in surveys and work within organizations. The `employees` table stores `employee_id`, `employee_name`, `department`, `years_employed`, `feedback_submitted`, `professionalism_rating`, `teamwork_rating`, and foreign keys to `organization_id`, `workplace_survey_id`, and `client_sector_id`. Row 100, Cole Vasquez, works in `adaptive-departme-89`, has 46 years of employment, has not submitted feedback, and holds a professionalism rating of 18.95 and a teamwork rating of 9.95. Row 103, Sarah Villanueva, works in `pilot-departme-92`, has 79 years of employment, has submitted feedback, and holds a professionalism rating of 24.80 and a teamwork rating of 21.80.

**Table `client_sectors`**

| id | sector_id | sector_name | sector_type | service_level | implementation_complexity | employee_id |
|---|---|---|---|---|---|---|
| 1000 | 7119771 | Peter Montgomery | public | composite-service-57 | regional-implemen-84 | 100 |
| 1001 | 726049 | Katie Williams | commercial | primary-service-58 | legacy-implemen-85 | 101 |
| 1002 | 103175 | Norma Fisher | public | adaptive-service-59 | compact-implemen-86 | 102 |
| 1003 | 9125631 | Peter Mcdowell | commercial | distributed-service-60 | composite-implemen-87 | 103 |

Client sectors define the market segments in which organizations operate and employees work. The `client_sectors` table stores sector identifiers and descriptive attributes that categorize the business environment.

The relationships between these core entities are captured through six junction tables that model many-to-many associations and bridge entities.

**Table `firms_surveys`**

| research_firm_id | workplace_survey_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `firms_surveys` table links research firms to the surveys they administer, enabling a single firm to be associated with multiple survey records across different organizations and time periods.

**Table `firms_partners`**

| research_firm_id | media_partner_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `firms_partners` table connects research firms to media partners, establishing which partners collaborate with which firms on campaigns and award publicity.

**Table `organizations_employees`**

| organization_id | employee_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `organizations_employees` table maps employees to their home organizations, supporting the many-to-many relationship where employees may be associated with multiple organizational units.

**Table `organizations_sectors`**

| organization_id | client_sector_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `organizations_sectors` table associates organizations with client sectors, allowing organizations to operate across multiple market segments.

**Table `partners_awards`**

| media_partner_id | workplace_award_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `partners_awards` table links media partners to workplace awards, tracking which partners are involved in the dissemination of each award.

**Table `sectors_organizations`**

| client_sector_id | organization_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `sectors_organizations` table provides an additional linkage between client sectors and organizations, reinforcing the market-segment relationships captured in the organizations_sectors junction table.

With the core entities and their relationships established, the analytical views synthesize these records into focused perspectives that answer specific operational questions. Each view joins base and junction tables to produce a flattened result set optimized for reporting and analysis.

**View `v_workplace_survey_research_firm`**

```sql
CREATE VIEW v_workplace_survey_research_firm AS
SELECT a.id, a.survey_id, a.administered_by, a.survey_date, b.research_firm_id AS firm_research_firm_id, b.firm_id AS firm_firm_id, b.firm_name AS firm_firm_name
FROM workplace_surveys a JOIN research_firms b ON a.research_firm_id = b.research_firm_id;
```

| id | survey_id | administered_by | survey_date | firm_research_firm_id | firm_firm_id | firm_firm_name |
|---|---|---|---|---|---|---|
| 1 | 21005921 | legacy-administ-49 | 2024-07-23T18:30:00 | 1 | 575216 | Legacy Review D |
| 2 | 726059 | compact-administ-50 | 2025-12-07T01:47:00 | 2 | e4ea9416-8fd1-11eb-924d-9cd76263cbd0 | Regional Initiative |
| 3 | 32814 | composite-administ-51 | 2022-05-18T08:04:00 | 3 | 884351 | Seasonal Model |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | primary-administ-52 | 2023-10-02T15:21:00 | 4 | L907 | Integrated Cluster A |

This view joins workplace surveys with their administering research firms, answering the question of which firm conducted which survey. Reading row 1, the survey with identifier `21005921` was administered by research firm 1, "Legacy Review D". Row 4 links survey `b83e024d-8fcd-11eb-924d-9cd76263cbd0` to research firm 4, "Integrated Cluster A".

**View `v_workplace_survey_organization`**

```sql
CREATE VIEW v_workplace_survey_organization AS
SELECT a.id, a.survey_id, a.administered_by, a.survey_date, b.organization_id AS organization_organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM workplace_surveys a JOIN organizations b ON a.organization_id = b.organization_id;
```

| id | survey_id | administered_by | survey_date | organization_organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1 | 21005921 | legacy-administ-49 | 2024-07-23T18:30:00 | 1 | 790471 | Extended Review |
| 2 | 726059 | compact-administ-50 | 2025-12-07T01:47:00 | 2 | 1717 | Pilot Initiative A |
| 3 | 32814 | composite-administ-51 | 2022-05-18T08:04:00 | 3 | 69437 | Baseline Model |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | primary-administ-52 | 2023-10-02T15:21:00 | 4 | m16 | Distributed Cluster |

This view connects workplace surveys to the organizations they assess, answering which organization was evaluated in each survey. Row 1 shows survey `21005921` assessed "Extended Review" (organization 1), while row 4 links survey `b83e024d-8fcd-11eb-924d-9cd76263cbd0` to "Distributed Cluster" (organization 4).

**View `v_workplace_survey_workplace_award`**

```sql
CREATE VIEW v_workplace_survey_workplace_award AS
SELECT a.id, a.survey_id, a.administered_by, a.survey_date, b.workplace_award_id AS award_workplace_award_id, b.award_id AS award_award_id, b.award_name AS award_award_name
FROM workplace_surveys a JOIN workplace_awards b ON a.workplace_award_id = b.workplace_award_id;
```

| id | survey_id | administered_by | survey_date | award_workplace_award_id | award_award_id | award_award_name |
|---|---|---|---|---|---|---|
| 1 | 21005921 | legacy-administ-49 | 2024-07-23T18:30:00 | 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Primary Review A |
| 2 | 726059 | compact-administ-50 | 2025-12-07T01:47:00 | 2 | 3012811 | Composite Initiative |
| 3 | 32814 | composite-administ-51 | 2022-05-18T08:04:00 | 3 | 15493350 | Compact Model |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | primary-administ-52 | 2023-10-02T15:21:00 | 4 | state_uk_17 | Legacy Cluster D |

This view associates workplace surveys with their corresponding awards, answering which award was tied to which survey. Row 1 links survey `21005921` to award `e02275d4-8fd1-11eb-924d-9cd76263cbd0` ("Primary Review A"), and row 4 links survey `b83e024d-8fcd-11eb-924d-9cd76263cbd0` to award `state_uk_17` ("Legacy Cluster D").

**View `v_research_firm_workplace_survey_detail`**

```sql
CREATE VIEW v_research_firm_workplace_survey_detail AS
SELECT a.research_firm_id, a.firm_id, a.firm_name, b.id AS survey_id, b.survey_id AS survey_survey_id, b.administered_by AS survey_administered_by
FROM research_firms a
  JOIN firms_surveys j ON j.research_firm_id = a.research_firm_id
  JOIN workplace_surveys b ON b.id = j.workplace_survey_id;
```

| research_firm_id | firm_id | firm_name | survey_id | survey_survey_id | survey_administered_by |
|---|---|---|---|---|---|
| 1 | 575216 | Legacy Review D | 1 | 21005921 | legacy-administ-49 |
| 1 | 575216 | Legacy Review D | 2 | 726059 | compact-administ-50 |
| 2 | e4ea9416-8fd1-11eb-924d-9cd76263cbd0 | Regional Initiative | 2 | 726059 | compact-administ-50 |
| 2 | e4ea9416-8fd1-11eb-924d-9cd76263cbd0 | Regional Initiative | 3 | 32814 | composite-administ-51 |
| 3 | 884351 | Seasonal Model | 3 | 32814 | composite-administ-51 |
| 3 | 884351 | Seasonal Model | 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | primary-administ-52 |
| 4 | L907 | Integrated Cluster A | 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | primary-administ-52 |
| 4 | L907 | Integrated Cluster A | 1 | 21005921 | legacy-administ-49 |

This view provides a detailed record of each survey as seen from the research firm's perspective, combining survey metrics with firm information. Row 1 shows "Legacy Review D" administered survey `21005921` to an organization of 56 employees, achieving an organizational health score of 19.95. Row 2 shows "Regional Initiative A" administered survey `726059` to an organization of 1,150 employees, achieving an organizational health score of 22.90.

**View `v_research_firm_media_partner_detail`**

```sql
CREATE VIEW v_research_firm_media_partner_detail AS
SELECT a.research_firm_id, a.firm_id, a.firm_name, b.id AS partner_id, b.partner_id AS partner_partner_id, b.partner_name AS partner_partner_name
FROM research_firms a
  JOIN firms_partners j ON j.research_firm_id = a.research_firm_id
  JOIN media_partners b ON b.id = j.media_partner_id;
```

| research_firm_id | firm_id | firm_name | partner_id | partner_partner_id | partner_partner_name |
|---|---|---|---|---|---|
| 1 | 575216 | Legacy Review D | 1 | 69420 | Composite Review |
| 1 | 575216 | Legacy Review D | 2 | 9085260 | Compact Initiative A |
| 2 | e4ea9416-8fd1-11eb-924d-9cd76263cbd0 | Regional Initiative | 2 | 9085260 | Compact Initiative A |
| 2 | e4ea9416-8fd1-11eb-924d-9cd76263cbd0 | Regional Initiative | 3 | 195367 | Legacy Model |
| 3 | 884351 | Seasonal Model | 3 | 195367 | Legacy Model |
| 3 | 884351 | Seasonal Model | 4 | b_VB-EC-12 | Regional Cluster |
| 4 | L907 | Integrated Cluster A | 4 | b_VB-EC-12 | Regional Cluster |
| 4 | L907 | Integrated Cluster A | 1 | 69420 | Composite Review |

This view links research firms to their media partners, answering which partners are associated with which firms. Row 1 connects research firm 1 ("Legacy Review D") to media partner 1 ("Composite Review"), while row 2 connects research firm 2 ("Regional Initiative A") to media partner 2 ("Compact Initiative A").

**View `v_research_firm_organization`**

```sql
CREATE VIEW v_research_firm_organization AS
SELECT a.research_firm_id, a.firm_id, a.firm_name, a.headquarters_location, b.organization_id AS organization_organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM research_firms a JOIN organizations b ON a.organization_id = b.organization_id;
```

| research_firm_id | firm_id | firm_name | headquarters_location | organization_organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1 | 575216 | Legacy Review D | composite-headquar-63 | 1 | 790471 | Extended Review |
| 2 | e4ea9416-8fd1-11eb-924d-9cd76263cbd0 | Regional Initiative | primary-headquar-64 | 2 | 1717 | Pilot Initiative A |
| 3 | 884351 | Seasonal Model | adaptive-headquar-65 | 3 | 69437 | Baseline Model |
| 4 | L907 | Integrated Cluster A | distributed-headquar-66 | 4 | m16 | Distributed Cluster |

This view joins research firms with the organizations they serve, answering which organizations are assessed by which firms. Row 1 shows "Legacy Review D" serves "Extended Review" (organization 1), and row 4 shows "Integrated Cluster A" serves "Distributed Cluster" (organization 4).

**View `v_organization_workplace_survey`**

```sql
CREATE VIEW v_organization_workplace_survey AS
SELECT a.organization_id, a.org_id, a.org_name, a.established_year, b.id AS survey_id, b.survey_id AS survey_survey_id, b.administered_by AS survey_administered_by
FROM organizations a JOIN workplace_surveys b ON a.workplace_survey_id = b.id;
```

| organization_id | org_id | org_name | established_year | survey_id | survey_survey_id | survey_administered_by |
|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | 10 | 1 | 21005921 | legacy-administ-49 |
| 2 | 1717 | Pilot Initiative A | 16 | 2 | 726059 | compact-administ-50 |
| 3 | 69437 | Baseline Model | 22 | 3 | 32814 | composite-administ-51 |
| 4 | m16 | Distributed Cluster | 28 | 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | primary-administ-52 |

This view presents workplace surveys from the organization's perspective, answering which surveys each organization has undergone. Row 1 shows "Extended Review" underwent survey `21005921` with a health score of 19.95, while row 4 shows "Distributed Cluster" underwent survey `b83e024d-8fcd-11eb-924d-9cd76263cbd0` with a health score of 28.80.

**View `v_organization_workplace_award`**

```sql
CREATE VIEW v_organization_workplace_award AS
SELECT a.organization_id, a.org_id, a.org_name, a.established_year, b.workplace_award_id AS award_workplace_award_id, b.award_id AS award_award_id, b.award_name AS award_award_name
FROM organizations a JOIN workplace_awards b ON a.workplace_award_id = b.workplace_award_id;
```

| organization_id | org_id | org_name | established_year | award_workplace_award_id | award_award_id | award_award_name |
|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | 10 | 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Primary Review A |
| 2 | 1717 | Pilot Initiative A | 16 | 2 | 3012811 | Composite Initiative |
| 3 | 69437 | Baseline Model | 22 | 3 | 15493350 | Compact Model |
| 4 | m16 | Distributed Cluster | 28 | 4 | state_uk_17 | Legacy Cluster D |

This view connects organizations to their workplace awards, answering which awards each organization has received. Row 1 shows "Extended Review" received award `e02275d4-8fd1-11eb-924d-9cd76263cbd0` ("Primary Review A"), and row 4 shows "Distributed Cluster" received award `state_uk_17` ("Legacy Cluster D").

**View `v_organization_organization`**

```sql
CREATE VIEW v_organization_organization AS
SELECT a.organization_id, a.org_id, a.org_name, a.established_year, b.organization_id AS organization_organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM organizations a JOIN organizations b ON a.acquired_organization_id = b.organization_id;
```

| organization_id | org_id | org_name | established_year | organization_organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | 10 | 1 | 790471 | Extended Review |
| 2 | 1717 | Pilot Initiative A | 16 | 2 | 1717 | Pilot Initiative A |
| 3 | 69437 | Baseline Model | 22 | 3 | 69437 | Baseline Model |
| 4 | m16 | Distributed Cluster | 28 | 4 | m16 | Distributed Cluster |

This view provides a comprehensive organizational record, joining an organization with its parent organization and acquired entities. Row 1 shows "Extended Review" (org_id `790471`) has parent `regional-parent-72` and was acquired on 2023-02-07. Row 4 shows "Distributed Cluster" (org_id `m16`) has parent `composite-parent-75` and was acquired on 2022-05-13.

**View `v_organization_employee_detail`**

```sql
CREATE VIEW v_organization_employee_detail AS
SELECT a.organization_id, a.org_id, a.org_name, b.employee_id AS employee_employee_id, b.employee_name AS employee_employee_name, b.department AS employee_department
FROM organizations a
  JOIN organizations_employees j ON j.organization_id = a.organization_id
  JOIN employees b ON b.employee_id = j.employee_id;
```

| organization_id | org_id | org_name | employee_employee_id | employee_employee_name | employee_department |
|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | 100 | Cole Vasquez | adaptive-departme-89 |
| 1 | 790471 | Extended Review | 101 | Susan Levy | distributed-departme-90 |
| 2 | 1717 | Pilot Initiative A | 101 | Susan Levy | distributed-departme-90 |
| 2 | 1717 | Pilot Initiative A | 102 | Tasha Rodriguez | baseline-departme-91 |
| 3 | 69437 | Baseline Model | 102 | Tasha Rodriguez | baseline-departme-91 |
| 3 | 69437 | Baseline Model | 103 | Sarah Villanueva | pilot-departme-92 |
| 4 | m16 | Distributed Cluster | 103 | Sarah Villanueva | pilot-departme-92 |
| 4 | m16 | Distributed Cluster | 100 | Cole Vasquez | adaptive-departme-89 |

This view links organizations to their employees, answering which employees belong to which organization. Row 100 shows Cole Vasquez of "Extended Review" (organization 1) works in `adaptive-departme-89` with 46 years of employment. Row 103 shows Sarah Villanueva of "Distributed Cluster" (organization 4) works in `pilot-departme-92` with 79 years of employment.

**View `v_organization_client_sector_detail`**

```sql
CREATE VIEW v_organization_client_sector_detail AS
SELECT a.organization_id, a.org_id, a.org_name, b.id AS sector_id, b.sector_id AS sector_sector_id, b.sector_name AS sector_sector_name
FROM organizations a
  JOIN organizations_sectors j ON j.organization_id = a.organization_id
  JOIN client_sectors b ON b.id = j.client_sector_id;
```

| organization_id | org_id | org_name | sector_id | sector_sector_id | sector_sector_name |
|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | 1000 | 7119771 | Peter Montgomery |
| 1 | 790471 | Extended Review | 1001 | 726049 | Katie Williams |
| 2 | 1717 | Pilot Initiative A | 1001 | 726049 | Katie Williams |
| 2 | 1717 | Pilot Initiative A | 1002 | 103175 | Norma Fisher |
| 3 | 69437 | Baseline Model | 1002 | 103175 | Norma Fisher |
| 3 | 69437 | Baseline Model | 1003 | 9125631 | Peter Mcdowell |
| 4 | m16 | Distributed Cluster | 1003 | 9125631 | Peter Mcdowell |
| 4 | m16 | Distributed Cluster | 1000 | 7119771 | Peter Montgomery |

This view connects organizations to their client sectors, answering which market segments each organization operates in. The joined result reveals the sector classification for each organization, enabling market-level analysis of organizational performance.

**View `v_workplace_award_organization`**

```sql
CREATE VIEW v_workplace_award_organization AS
SELECT a.workplace_award_id, a.award_id, a.award_name, a.award_year, b.organization_id AS organization_organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM workplace_awards a JOIN organizations b ON a.organization_id = b.organization_id;
```

| workplace_award_id | award_id | award_name | award_year | organization_organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Primary Review A | 36 | 1 | 790471 | Extended Review |
| 2 | 3012811 | Composite Initiative | 43 | 2 | 1717 | Pilot Initiative A |
| 3 | 15493350 | Compact Model | 50 | 3 | 69437 | Baseline Model |
| 4 | state_uk_17 | Legacy Cluster D | 57 | 4 | m16 | Distributed Cluster |

This view presents workplace awards from the organization's perspective, answering which awards were given to which organizations. Row 1 shows "Extended Review" received "Primary Review A" in year 36 at rank 16, while row 4 shows "Distributed Cluster" received "Legacy Cluster D" in year 57 at rank 28.

**View `v_workplace_award_workplace_survey`**

```sql
CREATE VIEW v_workplace_award_workplace_survey AS
SELECT a.workplace_award_id, a.award_id, a.award_name, a.award_year, b.id AS survey_id, b.survey_id AS survey_survey_id, b.administered_by AS survey_administered_by
FROM workplace_awards a JOIN workplace_surveys b ON a.workplace_survey_id = b.id;
```

| workplace_award_id | award_id | award_name | award_year | survey_id | survey_survey_id | survey_administered_by |
|---|---|---|---|---|---|---|
| 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Primary Review A | 36 | 1 | 21005921 | legacy-administ-49 |
| 2 | 3012811 | Composite Initiative | 43 | 2 | 726059 | compact-administ-50 |
| 3 | 15493350 | Compact Model | 50 | 3 | 32814 | composite-administ-51 |
| 4 | state_uk_17 | Legacy Cluster D | 57 | 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | primary-administ-52 |

This view links workplace awards to their associated surveys, answering which survey led to which award. Row 1 connects award `e02275d4-8fd1-11eb-924d-9cd76263cbd0` to survey `21005921`, and row 4 connects award `state_uk_17` to survey `b83e024d-8fcd-11eb-924d-9cd76263cbd0`.

**View `v_workplace_award_media_partner`**

```sql
CREATE VIEW v_workplace_award_media_partner AS
SELECT a.workplace_award_id, a.award_id, a.award_name, a.award_year, b.id AS partner_id, b.partner_id AS partner_partner_id, b.partner_name AS partner_partner_name
FROM workplace_awards a JOIN media_partners b ON a.media_partner_id = b.id;
```

| workplace_award_id | award_id | award_name | award_year | partner_id | partner_partner_id | partner_partner_name |
|---|---|---|---|---|---|---|
| 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Primary Review A | 36 | 1 | 69420 | Composite Review |
| 2 | 3012811 | Composite Initiative | 43 | 2 | 9085260 | Compact Initiative A |
| 3 | 15493350 | Compact Model | 50 | 3 | 195367 | Legacy Model |
| 4 | state_uk_17 | Legacy Cluster D | 57 | 4 | b_VB-EC-12 | Regional Cluster |

This view associates workplace awards with their media partners, answering which partners publicize which awards. Row 1 links award `e02275d4-8fd1-11eb-924d-9cd76263cbd0` to media partner 1 ("Composite Review"), and row 4 links award `state_uk_17` to media partner 4 ("Regional Cluster").

**View `v_media_partner_workplace_award_detail`**

```sql
CREATE VIEW v_media_partner_workplace_award_detail AS
SELECT a.id, a.partner_id, a.partner_name, b.workplace_award_id AS award_workplace_award_id, b.award_id AS award_award_id, b.award_name AS award_award_name
FROM media_partners a
  JOIN partners_awards j ON j.media_partner_id = a.id
  JOIN workplace_awards b ON b.workplace_award_id = j.workplace_award_id;
```

| id | partner_id | partner_name | award_workplace_award_id | award_award_id | award_award_name |
|---|---|---|---|---|---|
| 1 | 69420 | Composite Review | 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Primary Review A |
| 1 | 69420 | Composite Review | 2 | 3012811 | Composite Initiative |
| 2 | 9085260 | Compact Initiative A | 2 | 3012811 | Composite Initiative |
| 2 | 9085260 | Compact Initiative A | 3 | 15493350 | Compact Model |
| 3 | 195367 | Legacy Model | 3 | 15493350 | Compact Model |
| 3 | 195367 | Legacy Model | 4 | state_uk_17 | Legacy Cluster D |
| 4 | b_VB-EC-12 | Regional Cluster | 4 | state_uk_17 | Legacy Cluster D |
| 4 | b_VB-EC-12 | Regional Cluster | 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Primary Review A |

This view provides a detailed record of awards as seen from the media partner's perspective, combining award information with partner details. Row 1 shows "Composite Review" publicized award `e02275d4-8fd1-11eb-924d-9cd76263cbd0` ("Primary Review A"), while row 2 shows "Compact Initiative A" publicized award `3012811` ("Composite Initiative").

**View `v_media_partner_research_firm`**

```sql
CREATE VIEW v_media_partner_research_firm AS
SELECT a.id, a.partner_id, a.partner_name, a.country, b.research_firm_id AS firm_research_firm_id, b.firm_id AS firm_firm_id, b.firm_name AS firm_firm_name
FROM media_partners a JOIN research_firms b ON a.research_firm_id = b.research_firm_id;
```

| id | partner_id | partner_name | country | firm_research_firm_id | firm_firm_id | firm_firm_name |
|---|---|---|---|---|---|---|
| 1 | 69420 | Composite Review | compact-country-26 | 1 | 575216 | Legacy Review D |
| 2 | 9085260 | Compact Initiative A | composite-country-27 | 2 | e4ea9416-8fd1-11eb-924d-9cd76263cbd0 | Regional Initiative |
| 3 | 195367 | Legacy Model | primary-country-28 | 3 | 884351 | Seasonal Model |
| 4 | b_VB-EC-12 | Regional Cluster | adaptive-country-29 | 4 | L907 | Integrated Cluster A |

This view connects media partners to research firms, answering which firms collaborate with which partners. Row 1 links media partner 1 ("Composite Review") to research firm 1 ("Legacy Review D"), and row 4 links media partner 4 ("Regional Cluster") to research firm 4 ("Integrated Cluster A").

**View `v_employee_organization`**

```sql
CREATE VIEW v_employee_organization AS
SELECT a.employee_id, a.employee_name, a.department, a.years_employed, b.organization_id AS organization_organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM employees a JOIN organizations b ON a.organization_id = b.organization_id;
```

| employee_id | employee_name | department | years_employed | organization_organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 100 | Cole Vasquez | adaptive-departme-89 | 46 | 1 | 790471 | Extended Review |
| 101 | Susan Levy | distributed-departme-90 | 57 | 2 | 1717 | Pilot Initiative A |
| 102 | Tasha Rodriguez | baseline-departme-91 | 68 | 3 | 69437 | Baseline Model |
| 103 | Sarah Villanueva | pilot-departme-92 | 79 | 4 | m16 | Distributed Cluster |

This view links employees to their organizations, answering which organization each employee belongs to. Row 100 shows Cole Vasquez belongs to organization 1 ("Extended Review"), and row 103 shows Sarah Villanueva belongs to organization 4 ("Distributed Cluster").

**View `v_employee_workplace_survey`**

```sql
CREATE VIEW v_employee_workplace_survey AS
SELECT a.employee_id, a.employee_name, a.department, a.years_employed, b.id AS survey_id, b.survey_id AS survey_survey_id, b.administered_by AS survey_administered_by
FROM employees a JOIN workplace_surveys b ON a.workplace_survey_id = b.id;
```

| employee_id | employee_name | department | years_employed | survey_id | survey_survey_id | survey_administered_by |
|---|---|---|---|---|---|---|
| 100 | Cole Vasquez | adaptive-departme-89 | 46 | 1 | 21005921 | legacy-administ-49 |
| 101 | Susan Levy | distributed-departme-90 | 57 | 2 | 726059 | compact-administ-50 |
| 102 | Tasha Rodriguez | baseline-departme-91 | 68 | 3 | 32814 | composite-administ-51 |
| 103 | Sarah Villanueva | pilot-departme-92 | 79 | 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | primary-administ-52 |

This view connects employees to the workplace surveys they participated in, answering which surveys each employee was involved in. Row 100 shows Cole Vasquez participated in survey `21005921`, while row 103 shows Sarah Villanueva participated in survey `b83e024d-8fcd-11eb-924d-9cd76263cbd0`.

**View `v_employee_client_sector`**

```sql
CREATE VIEW v_employee_client_sector AS
SELECT a.employee_id, a.employee_name, a.department, a.years_employed, b.id AS sector_id, b.sector_id AS sector_sector_id, b.sector_name AS sector_sector_name
FROM employees a JOIN client_sectors b ON a.client_sector_id = b.id;
```

| employee_id | employee_name | department | years_employed | sector_id | sector_sector_id | sector_sector_name |
|---|---|---|---|---|---|---|
| 100 | Cole Vasquez | adaptive-departme-89 | 46 | 1000 | 7119771 | Peter Montgomery |
| 101 | Susan Levy | distributed-departme-90 | 57 | 1001 | 726049 | Katie Williams |
| 102 | Tasha Rodriguez | baseline-departme-91 | 68 | 1002 | 103175 | Norma Fisher |
| 103 | Sarah Villanueva | pilot-departme-92 | 79 | 1003 | 9125631 | Peter Mcdowell |

This view links employees to their client sectors, answering which market segment each employee operates within. Row 100 shows Cole Vasquez is associated with client sector 1000, and row 103 shows Sarah Villanueva is associated with client sector 1003.

**View `v_client_sector_organization_detail`**

```sql
CREATE VIEW v_client_sector_organization_detail AS
SELECT a.id, a.sector_id, a.sector_name, b.organization_id AS organization_organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM client_sectors a
  JOIN sectors_organizations j ON j.client_sector_id = a.id
  JOIN organizations b ON b.organization_id = j.organization_id;
```

| id | sector_id | sector_name | organization_organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|
| 1000 | 7119771 | Peter Montgomery | 1 | 790471 | Extended Review |
| 1000 | 7119771 | Peter Montgomery | 2 | 1717 | Pilot Initiative A |
| 1001 | 726049 | Katie Williams | 2 | 1717 | Pilot Initiative A |
| 1001 | 726049 | Katie Williams | 3 | 69437 | Baseline Model |
| 1002 | 103175 | Norma Fisher | 3 | 69437 | Baseline Model |
| 1002 | 103175 | Norma Fisher | 4 | m16 | Distributed Cluster |
| 1003 | 9125631 | Peter Mcdowell | 4 | m16 | Distributed Cluster |
| 1003 | 9125631 | Peter Mcdowell | 1 | 790471 | Extended Review |

This view provides a detailed record of organizations as seen from the client sector's perspective, combining organizational data with sector classification. The joined result enables analysis of which organizations operate within which market segments and how their survey performance varies by sector.

**View `v_client_sector_employee`**

```sql
CREATE VIEW v_client_sector_employee AS
SELECT a.id, a.sector_id, a.sector_name, a.sector_type, b.employee_id AS employee_employee_id, b.employee_name AS employee_employee_name, b.department AS employee_department
FROM client_sectors a JOIN employees b ON a.employee_id = b.employee_id;
```

| id | sector_id | sector_name | sector_type | employee_employee_id | employee_employee_name | employee_department |
|---|---|---|---|---|---|---|
| 1000 | 7119771 | Peter Montgomery | public | 100 | Cole Vasquez | adaptive-departme-89 |
| 1001 | 726049 | Katie Williams | commercial | 101 | Susan Levy | distributed-departme-90 |
| 1002 | 103175 | Norma Fisher | public | 102 | Tasha Rodriguez | baseline-departme-91 |
| 1003 | 9125631 | Peter Mcdowell | commercial | 103 | Sarah Villanueva | pilot-departme-92 |

This view connects client sectors to their employees, answering which employees belong to which sectors. Row 100 shows Cole Vasquez is associated with client sector 1000, and row 103 shows Sarah Villanueva is associated with client sector 1003.

The data model presented here captures the interconnected nature of workplace assessment: research firms administer surveys to organizations, which earn awards publicized by media partners, while employees participate in the process and operate within defined client sectors. The junction tables enable flexible many-to-many relationships that reflect the real-world complexity of organizational ecosystems. The analytical views flatten these relationships into focused perspectives that support reporting, benchmarking, and strategic decision-making. Together, the base tables, junction tables, and views form a comprehensive framework for understanding and improving workplace health across diverse organizational contexts.