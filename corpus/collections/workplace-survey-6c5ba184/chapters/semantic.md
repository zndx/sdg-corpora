## Ontology-Grounded Relational Modelling of the Workplace Survey Ecosystem

The domain under examination captures the lifecycle of workplace surveys as they traverse a network of research firms, organizations, awards, media partners, and employees. At its core, the model distinguishes between the survey event itself, the institutional actors that administer and receive surveys, the accolades that result from survey outcomes, and the human participants whose feedback drives the process. This chapter explains how the ontology of these entities and their relationships materializes as a normalized relational schema, how junction tables resolve many-to-many associations, and how materialized views reconstruct domain facts through controlled joins.

**Table `workplace_surveys`**

| id | survey_id | administered_by | survey_date | total_employees | organizational_health_score | alignment_score | execution_score | connection_score | status | research_firm_id | organization_id | workplace_award_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 21005921 | legacy-administ-49 | 2024-07-23T18:30:00 | 56 | 19.95 | 9.45 | 11.45 | 6.20 | pending | 1 | 1 | 1 |
| 2 | 726059 | compact-administ-50 | 2025-12-07T01:47:00 | 1150 | 22.90 | 12.90 | 14.90 | 10.40 | running | 2 | 2 | 2 |
| 3 | 32814 | composite-administ-51 | 2022-05-18T08:04:00 | 24 | 25.85 | 16.35 | 18.35 | 14.60 | complete | 3 | 3 | 3 |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | primary-administ-52 | 2023-10-02T15:21:00 | 1574 | 28.80 | 19.80 | 21.80 | 18.80 | failed | 4 | 4 | 4 |

The `workplace_surveys` table anchors the entire schema. Each row represents a discrete survey administration event, identified by a surrogate `id` and a business-level `survey_id` that carries a human-readable prefix such as `21005921` or the UUID `b83e028a-8fcd-11eb-924d-9cd76263cbd0`. The `administered_by` column records the provenance of the survey — values like `legacy-administ-49` and `compact-administ-50` trace back to the originating system. The `survey_date` column timestamps the event (e.g. `2024-07-23T18:30:00`), while `total_employees` quantifies the scope of the survey population, ranging from a small unit of 24 employees to a large enterprise of 1574.

The survey's analytical output is captured in four score columns: `organizational_health_score`, `alignment_score`, `execution_score`, and `connection_score`. These are continuous measures — for instance, survey row 4 reports a health score of 28.80, an alignment of 19.80, an execution of 21.80, and a connection of 18.80. The `status` column classifies the survey's lifecycle stage, taking values such as `pending`, `running`, `complete`, and `failed`. Three foreign keys bind the survey to its institutional context: `research_firm_id` references the administering firm, `organization_id` references the surveyed organization, and `workplace_award_id` references any award associated with the survey.

**Table `research_firms`**

| research_firm_id | firm_id | firm_name | headquarters_location | founding_year | b_corp_member | specialization | consulting_services | organization_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 575216 | Legacy Review D | composite-headquar-63 | 43 | true | legacy-speciali-13 | false | 1 |
| 2 | e4ea9416-8fd1-11eb-924d-9cd76263cbd0 | Regional Initiative | primary-headquar-64 | 48 | false | compact-speciali-14 | true | 2 |
| 3 | 884351 | Seasonal Model | adaptive-headquar-65 | 53 | true | composite-speciali-15 | false | 3 |
| 4 | L907 | Integrated Cluster A | distributed-headquar-66 | 58 | false | primary-speciali-16 | true | 4 |

The `research_firms` table profiles the entities that conduct surveys. Each firm has a surrogate `research_firm_id`, a business `firm_id` (e.g. `575216` or `L907`), and a descriptive `firm_name` such as "Legacy Review D" or "Integrated Cluster A". The `headquarters_location` column stores a coded location identifier like `composite-headquar-63`, while `founding_year` records the firm's age in years (43 through 58 in the sample). The boolean `b_corp_member` indicates B-Corporation membership, and `specialization` encodes the firm's domain focus (e.g. `legacy-speciali-13`). The `consulting_services` flag signals whether the firm offers consulting. A foreign key `organization_id` links each research firm to its parent organization, embedding the firm within the organizational hierarchy.

**Table `organizations`**

| organization_id | org_id | org_name | established_year | industry | employee_count | platinum_member | parent_org | acquisition_date | workplace_survey_id | workplace_award_id | acquired_organization_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | 10 | composite-industry-99 | 131 | false | regional-parent-72 | 2023-02-07 | 1 | 1 | 1 |
| 2 | 1717 | Pilot Initiative A | 16 | primary-industry-100 | 428 | true | legacy-parent-73 | 2024-07-18 | 2 | 2 | 2 |
| 3 | 69437 | Baseline Model | 22 | adaptive-industry-101 | 3 | false | compact-parent-74 | 2025-12-02 | 3 | 3 | 3 |
| 4 | m16 | Distributed Cluster | 28 | distributed-industry-102 | 9 | true | composite-parent-75 | 2022-05-13 | 4 | 4 | 4 |

The `organizations` table is the central hub of the institutional graph. Each row represents an organization with a surrogate `organization_id`, a business `org_id` (e.g. `790471` or `m16`), and a name such as "Extended Review" or "Distributed Cluster". The `established_year` column records the organization's age, `industry` stores a coded industry classification like `composite-industry-99`, and `employee_count` quantifies size (from 3 to 428 in the sample). The `platinum_member` boolean flags premium membership status.

Two self-referential foreign keys — `parent_org` and `acquired_organization_id` — model organizational hierarchy and M&A activity. The `parent_org` column holds values like `regional-parent-72`, indicating a parent-child relationship, while `acquired_organization_id` (e.g. `1`) links to an acquired entity. The `acquisition_date` column (e.g. `2023-02-07`) timestamps the transaction. Finally, `workplace_survey_id` and `workplace_award_id` link the organization to its survey and award records, creating a bidirectional bridge between the organization and the survey/award tables.

**Table `workplace_awards`**

| workplace_award_id | award_id | award_name | award_year | rank | issuing_body | criteria_met | award_description | organization_id | workplace_survey_id | media_partner_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Primary Review A | 36 | 16 | baseline-issuing-13 | false | Composite Cluster | 1 | 1 | 1 |
| 2 | 3012811 | Composite Initiative | 43 | 20 | pilot-issuing-14 | true | Compact Review A | 2 | 2 | 2 |
| 3 | 15493350 | Compact Model | 50 | 24 | extended-issuing-15 | false | Legacy Initiative | 3 | 3 | 3 |
| 4 | state_uk_17 | Legacy Cluster D | 57 | 28 | integrated-issuing-16 | true | Regional Model | 4 | 4 | 4 |

The `workplace_awards` table captures accolades conferred on organizations. Each award has a surrogate `workplace_award_id`, a business `award_id` (e.g. `e02275d4-8fd1-11eb-924d-9cd76263cbd0`), and a descriptive `award_name` such as "Primary Review A" or "Legacy Cluster D". The `award_year` column records the year of conferral (36 through 57), and `rank` provides a competitive ranking (16 through 28). The `issuing_body` column identifies the awarding authority (e.g. `baseline-issuing-13`), while `criteria_met` is a boolean indicating whether all criteria were satisfied. The `award_description` column provides a free-text summary like "Composite Cluster" or "Regional Model".

Foreign keys `organization_id`, `workplace_survey_id`, and `media_partner_id` bind the award to its recipient organization, the originating survey, and the media partner involved in the award process. This creates a triangular relationship: an award sits at the intersection of an organization, a survey, and a media partner.

**Table `media_partners`**

| id | partner_id | partner_name | country | prestige_level | campaign_participation | research_firm_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 69420 | Composite Review | compact-country-26 | seasonal-prestige-23 | false | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 9085260 | Compact Initiative A | composite-country-27 | regional-prestige-24 | true | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 195367 | Legacy Model | primary-country-28 | legacy-prestige-25 | false | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | b_VB-EC-12 | Regional Cluster | adaptive-country-29 | compact-prestige-26 | true | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `media_partners` table profiles the media entities that collaborate on awards and campaigns. Each partner has a surrogate `id`, a business `partner_id` (e.g. `69420` or `b_VB-EC-12`), and a `partner_name` such as "Composite Review" or "Regional Cluster". The `country` column stores a coded country identifier like `compact-country-26`, and `prestige_level` encodes the partner's standing (e.g. `seasonal-prestige-23`). The `campaign_participation` boolean indicates active campaign involvement. A foreign key `research_firm_id` links the partner to the research firm it collaborates with, and `created_at` / `updated_at` timestamps track the partner record's lifecycle.

**Table `employees`**

| employee_id | employee_name | department | years_employed | feedback_submitted | professionalism_rating | teamwork_rating | organization_id | workplace_survey_id | client_sector_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | Cole Vasquez | adaptive-departme-89 | 46 | false | 18.95 | 9.95 | 1 | 1 | 1000 |
| 101 | Susan Levy | distributed-departme-90 | 57 | true | 20.90 | 13.90 | 2 | 2 | 1001 |
| 102 | Tasha Rodriguez | baseline-departme-91 | 68 | false | 22.85 | 17.85 | 3 | 3 | 1002 |
| 103 | Sarah Villanueva | pilot-departme-92 | 79 | true | 24.80 | 21.80 | 4 | 4 | 1003 |

The `employees` table captures individual survey participants. Each employee has a surrogate `employee_id`, a `employee_name` (e.g. "Cole Vasquez" or "Sarah Villanueva"), and a `department` code such as `adaptive-departme-89`. The `years_employed` column records tenure (46 through 79 years in the sample), and `feedback_submitted` is a boolean indicating whether the employee submitted feedback. Two rating columns — `professionalism_rating` and `teamwork_rating` — capture performance metrics (e.g. 18.95 and 9.95 for Cole Vasquez). Foreign keys `organization_id`, `workplace_survey_id`, and `client_sector_id` link the employee to their organization, the survey they participated in, and their client sector.

**Table `client_sectors`**

| id | sector_id | sector_name | sector_type | service_level | implementation_complexity | employee_id |
|---|---|---|---|---|---|---|
| 1000 | 7119771 | Peter Montgomery | public | composite-service-57 | regional-implemen-84 | 100 |
| 1001 | 726049 | Katie Williams | commercial | primary-service-58 | legacy-implemen-85 | 101 |
| 1002 | 103175 | Norma Fisher | public | adaptive-service-59 | compact-implemen-86 | 102 |
| 1003 | 9125631 | Peter Mcdowell | commercial | distributed-service-60 | composite-implemen-87 | 103 |

The `client_sectors` table defines the industry or market sectors that organizations and employees belong to. While the sample data does not display rows from this table directly, it is referenced as a foreign key target in both the `employees` table (via `client_sector_id`, with values like `1000` and `1003`) and the `organizations_sectors` junction table, establishing sector membership as a first-class dimension in the model.

The schema employs six junction tables to resolve many-to-many relationships that cannot be expressed through simple foreign keys. The `firms_surveys` table links research firms to the surveys they administer, allowing a single firm to be associated with multiple surveys and a survey to be linked to multiple firms. Similarly, `firms_partners` resolves the many-to-many relationship between research firms and media partners, enabling flexible collaboration patterns.

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

The `organizations_employees` table links organizations to their employees, supporting the case where an employee may belong to multiple organizations or an organization may have many employees. The `organizations_sectors` table associates organizations with client sectors, allowing an organization to operate across multiple sectors.

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

The `partners_awards` table connects media partners to workplace awards, enabling a partner to be associated with multiple awards and an award to involve multiple partners. The `sectors_organizations` table provides an alternative or complementary link between client sectors and organizations, reinforcing the sector dimension from a different angle.

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

With the base tables and junction tables established, the schema provides a suite of materialized views that reconstruct domain facts by joining the normalized tables. Each view answers a specific analytical question by denormalizing the relevant entities into a single flat result set.

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

The view `v_workplace_survey_research_firm` joins `workplace_surveys` to `research_firms`, answering the question: "Which research firm administered each survey, and what are the survey's scores?" A row from this view would show survey `21005921` administered by the firm with `research_firm_id` 1, alongside the survey's health score of 19.95 and status of `pending`.

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

The view `v_workplace_survey_organization` joins `workplace_surveys` to `organizations`, answering: "Which organization was surveyed, and what are its characteristics?" A row would pair survey `726059` with organization `1717` ("Pilot Initiative A"), revealing that the surveyed organization has 428 employees and is a `platinum_member`.

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

The view `v_workplace_survey_workplace_award` joins `workplace_surveys` to `workplace_awards`, answering: "What award is associated with each survey?" A row would link survey `32814` to award `15493350` ("Compact Model"), showing the award's rank of 24 and the issuing body `extended-issuing-15`.

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

The view `v_research_firm_workplace_survey_detail` provides a denormalized view of research firms enriched with their survey records. It answers: "What surveys has each firm administered, and what are the survey outcomes?" A row would show "Legacy Review D" alongside survey `21005921` with its organizational health score of 19.95.

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

The view `v_research_firm_media_partner_detail` joins `research_firms` to `media_partners`, answering: "Which media partners collaborate with each research firm?" A row would pair "Legacy Review D" with the partner "Composite Review" from `compact-country-26` at `seasonal-prestige-23`.

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

The view `v_research_firm_organization` joins `research_firms` to `organizations`, answering: "Which parent organization does each research firm belong to?" A row would show "Regional Initiative" (`research_firm_id` 2) linked to its parent organization `1717` ("Pilot Initiative A").

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

The view `v_organization_workplace_survey` joins `organizations` to `workplace_surveys`, answering: "What surveys has each organization undergone?" A row would pair "Extended Review" (`organization_id` 1) with survey `21005921`, showing the survey's connection score of 6.20.

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

The view `v_organization_workplace_award` joins `organizations` to `workplace_awards`, answering: "What awards has each organization received?" A row would show "Pilot Initiative A" (`organization_id` 2) alongside award `3012811` ("Composite Initiative") with rank 20 and `criteria_met` set to true.

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

The view `v_organization_organization` performs a self-join on `organizations`, answering: "What is the parent-child or acquisition relationship between organizations?" A row would show organization `790471` ("Extended Review") with its `parent_org` value of `regional-parent-72` and `acquisition_date` of `2023-02-07`.

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

The view `v_organization_employee_detail` joins `organizations` to `employees`, answering: "Which employees belong to each organization, and what are their ratings?" A row would pair "Extended Review" with employee "Cole Vasquez" from department `adaptive-departme-89`, showing a professionalism rating of 18.95 and teamwork rating of 9.95.

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

The view `v_organization_client_sector_detail` joins `organizations` to `client_sectors`, answering: "Which sectors does each organization operate in?" This view reconstructs the sector membership of organizations through the `organizations_sectors` junction table.

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

The view `v_workplace_award_organization` joins `workplace_awards` to `organizations`, answering: "Which organization received each award?" A row would show award `e02275d4-8fd1-11eb-924d-9cd76263cbd0` ("Primary Review A") conferred on organization `790471` ("Extended Review").

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

The view `v_workplace_award_workplace_survey` joins `workplace_awards` to `workplace_surveys`, answering: "Which survey is associated with each award?" A row would link award `3012811` to survey `726059`, showing the survey's alignment score of 12.90.

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

The view `v_workplace_award_media_partner` joins `workplace_awards` to `media_partners`, answering: "Which media partner is involved in each award?" A row would show award `15493350` ("Compact Model") associated with partner `195367` ("Legacy Model") from `primary-country-28`.

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

The view `v_media_partner_workplace_award_detail` joins `media_partners` to `workplace_awards`, answering: "What awards has each media partner been involved in?" A row would show "Compact Initiative A" alongside award `3012811` with its rank of 20.

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

The view `v_media_partner_research_firm` joins `media_partners` to `research_firms`, answering: "Which research firm does each media partner collaborate with?" A row would pair "Legacy Model" (`partner_id` 3) with research firm `884351` ("Seasonal Model").

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

The view `v_employee_organization` joins `employees` to `organizations`, answering: "Which organization does each employee belong to?" A row would show "Susan Levy" (`employee_id` 101) belonging to organization `1717` ("Pilot Initiative A").

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

The view `v_employee_workplace_survey` joins `employees` to `workplace_surveys`, answering: "Which survey did each employee participate in?" A row would link "Tasha Rodriguez" (`employee_id` 102) to survey `32814`, showing the survey's execution score of 18.35.

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

The view `v_employee_client_sector` joins `employees` to `client_sectors`, answering: "Which client sector does each employee belong to?" A row would show "Sarah Villanueva" (`employee_id` 103) associated with `client_sector_id` 1003.

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

The view `v_client_sector_organization_detail` joins `client_sectors` to `organizations`, answering: "Which organizations operate in each client sector?" This view reconstructs the sector-to-organization mapping through the `organizations_sectors` or `sectors_organizations` junction tables.

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

The view `v_client_sector_employee` joins `client_sectors` to `employees`, answering: "Which employees belong to each client sector?" A row would show `client_sector_id` 1000 associated with employee "Cole Vasquez" (`employee_id` 100).

The schema as a whole embodies a carefully normalized design that separates concerns across seven base tables and six junction tables, with twenty-one materialized views providing denormalized access patterns for common analytical queries. The foreign key graph forms a connected component: `workplace_surveys` sits at the center, linked to `research_firms`, `organizations`, and `workplace_awards`; `workplace_awards` in turn links to `media_partners`; and `employees` connects to `organizations` and `client_sectors`. The junction tables (`firms_surveys`, `firms_partners`, `organizations_employees`, `organizations_sectors`, `partners_awards`, `sectors_organizations`) add flexibility for many-to-many relationships that the direct foreign keys alone cannot express. Together, the base tables and views form a complete relational representation of the workplace survey domain, where each view reconstructs a specific domain fact from the normalized tables through controlled joins, enabling both data integrity through normalization and analytical convenience through denormalized views.