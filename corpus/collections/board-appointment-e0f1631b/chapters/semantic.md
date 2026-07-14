The governance of non-profit organizations rests on a network of board appointments, funding streams, and professional affiliations that must be tracked with precision. A board appointment is not merely a date on a calendar; it is a binding relationship between a person and an organization, carrying a role title, a term window, and a status that may be active, completed, or pending. The non-profit itself carries legal identity — a tax status, a founding date, a headquarters location — and is further characterized by its funding sources and its connections to affiliate organizations. Persons, meanwhile, exist at the intersection of multiple roles: they sit on boards, they practice law at firms, and they participate in affiliate councils. The relational model captures all of this by normalizing the domain into six base tables and exposing six materialized views that reconstruct the most common analytical joins.

**Table `board_appointments`**

| board_appointment_id | appointment_id | appointment_date | role_title | term_start_date | term_end_date | appointment_status | person_id | non_profit_organization_id | succeeds_previous_appointee_person_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2087748 | 2022-05-03T16:12:00 | Distributed Standard | 2022-05-26T16:36:00 | 2025-08-24T07:45:00 | active | 1 | 1 | 1 | 2025-01-01 00:14:00 |
| 1001 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2023-10-14T23:29:00 | Adaptive Framework D | 2023-10-10T23:53:00 | 2022-01-08T14:02:00 | completed | 2 | 2 | 2 | 2025-02-06 03:14:00 |
| 1002 | 2087740 | 2024-03-25T06:46:00 | Primary Protocol | 2024-03-21T06:10:00 | 2023-06-19T21:19:00 | pending | 3 | 3 | 3 | 2025-03-11 06:14:00 |
| 1003 | 1250223 | 2025-08-09T13:03:00 | Composite Programme | 2025-08-05T13:27:00 | 2024-11-03T04:36:00 | active | 4 | 4 | 4 | 2025-04-16 09:14:00 |

The `board_appointments` table is the central fact table of the governance domain. Each row represents a single appointment event, identified by a surrogate `board_appointment_id` (e.g., `1000`, `1001`, `1002`, `1003`) and a business `appointment_id` that may be a numeric string like `2087748` or a Google Place ID such as `ChIJJ60m-q5t5kcRMZ9MdM8fVm4`. The appointment carries temporal attributes: `appointment_date` marks when the appointment was recorded, while `term_start_date` and `term_end_date` define the active window of the appointment. The `role_title` column holds descriptive strings like `Distributed Standard`, `Adaptive Framework D`, `Primary Protocol`, and `Composite Programme`. The `appointment_status` enum — `active`, `completed`, or `pending` — captures the current lifecycle state. Two foreign keys anchor the appointment to its participants: `person_id` references the appointee in the `persons` table, and `non_profit_organization_id` references the receiving organization in `non_profit_organizations`. A self-referential column, `succeeds_previous_appointee_person_id`, allows one appointment to chain to another, modeling succession. The `created_at` timestamp records when the row was inserted.

**Table `non_profit_organizations`**

| non_profit_organization_id | organization_id | legal_name | tax_status | founding_date | headquarters_location | website_url | contact_phone_number | board_appointment_id | has_affiliate_non_profit_organization_id | funding_source_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Shell Oil | Adaptive Model | composite-tax-63 | 2023-06-24T05:03:00 | composite-headquar-63 | https://github.com/chiphuyen/lazynlp | Theodore Mcgrath | 1000 | 1 | 100 |
| 2 | GlobalPlatform Inc. | Primary Cluster | primary-tax-64 | 2024-11-08T12:20:00 | primary-headquar-64 | https://bugs.launchpad.net/ironic/+bug/1346406 | Peter Mcdowell | 1001 | 2 | 101 |
| 3 | Whatsapp Inc. | Composite Review D | adaptive-tax-65 | 2025-04-19T19:37:00 | adaptive-headquar-65 | http://en.wikipedia.org/wiki/Hyla_femoralis | Collin Lopez | 1002 | 3 | 102 |
| 4 | American Institutes for Research | Compact Initiative | distributed-tax-66 | 2022-09-03T02:54:00 | distributed-headquar-66 | https://www.nature.com/articles/nphoton.2014.41 | Steve Martin | 1003 | 4 | 103 |

The `non_profit_organizations` table stores the legal entities that receive board appointments. Its primary key is `non_profit_organization_id` (e.g., `1`, `2`, `3`, `4`), and it carries a business `organization_id` that may be a human-readable name like `Shell Oil` or `GlobalPlatform Inc.`. The `legal_name` column holds the formal name — `Adaptive Model`, `Primary Cluster`, `Composite Review D`, `Compact Initiative`. Tax classification is captured in `tax_status` (e.g., `composite-tax-63`, `primary-tax-64`), and `founding_date` records when the organization was established. Geographic presence is expressed through `headquarters_location` (e.g., `composite-headquar-63`), while `website_url` and `contact_phone_number` provide external contact channels. The organization is linked back to its board via `board_appointment_id`, creating a one-to-one or one-to-many relationship depending on whether multiple appointments exist per organization. The `has_affiliate_non_profit_organization_id` column is a self-referential foreign key that models inter-organizational affiliate relationships — organization `1` affiliates with organization `1`, organization `2` with `2`, and so on. Finally, `funding_source_id` connects the organization to its financial backing in the `funding_sources` table.

**Table `persons`**

| person_id | first_name | last_name | professional_title | affiliated_organization | contact_email | contact_phone_number | board_appointment_id | firm_id | affiliate_council_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Stephanie Collins | Paul Allen | Integrated Programme A | Alexandria Real Estate Equities | Christopher Wilson | Theodore Mcgrath | 1000 | 575216 | 1 |
| 2 | Janice Johnston | Heather Beasley | Extended Standard | Feedback Rating | Charles Larsen | Peter Mcdowell | 1001 | e4ea9416-8fd1-11eb-924d-9cd76263cbd0 | 2 |
| 3 | Upal Saha | Audrey Taylor | Pilot Framework | Feedback Rating | Mary Alvarez | Collin Lopez | 1002 | 884351 | 3 |
| 4 | Katherine Snyder | Susan Wagner | Baseline Protocol D | Litton Industries | April Snyder | Steve Martin | 1003 | L907 | 4 |

The `persons` table is the hub for all individual actors. Its primary key is `person_id` (e.g., `1`, `2`, `3`, `4`), and it stores the person's `first_name` and `last_name` — `Stephanie Collins`, `Janice Johnston`, `Upal Saha`, `Katherine Snyder` — along with a `professional_title` such as `Integrated Programme A` or `Extended Standard`. The `affiliated_organization` column holds a free-text reference to an employer or host organization (e.g., `Alexandria Real Estate Equities`, `Feedback Rating`, `Litton Industries`). Contact information is split across `contact_email` and `contact_phone_number`. The `board_appointment_id` column creates a direct link to the `board_appointments` table, indicating which board role the person holds. The `firm_id` column is a foreign key into `law_firms`, and `affiliate_council_id` links to `affiliate_councils`. This table thus sits at the convergence of three relationship axes: governance (board appointments), professional practice (law firms), and community participation (affiliate councils).

**Table `law_firms`**

| firm_id | firm_name | founding_year | primary_practice_areas | office_locations | legal_entity_status | person_id |
|---|---|---|---|---|---|---|
| 575216 | Legacy Review D | 43 | seasonal-primary-65 | composite-office-57 | primary-legal-46 | 1 |
| e4ea9416-8fd1-11eb-924d-9cd76263cbd0 | Regional Initiative | 48 | regional-primary-66 | primary-office-58 | adaptive-legal-47 | 2 |
| 884351 | Seasonal Model | 53 | legacy-primary-67 | adaptive-office-59 | distributed-legal-48 | 3 |
| L907 | Integrated Cluster A | 58 | compact-primary-68 | distributed-office-60 | baseline-legal-49 | 4 |

The `law_firms` table models the legal practices where persons may be employed or affiliated. Its primary key is `firm_id`, which in this dataset takes heterogeneous forms — an integer like `575216`, a UUID-like string such as `e4ea9416-8fd1-11eb-924d-9cd76263cbd0`, an alphanumeric code like `884351`, or a short identifier like `L907`. The `firm_name` column holds values like `Legacy Review D`, `Regional Initiative`, `Seasonal Model`, and `Integrated Cluster A`. The `founding_year` is stored as an integer (e.g., `43`, `48`, `53`, `58`), `primary_practice_areas` captures the firm's specialty (e.g., `seasonal-primary-65`, `regional-primary-66`), and `office_locations` describes physical presence (e.g., `composite-office-57`, `primary-office-58`). The `legal_entity_status` column classifies the firm's legal form (e.g., `primary-legal-46`, `adaptive-legal-47`). A `person_id` foreign key links the firm to its associated person, creating a bidirectional relationship with the `persons` table.

**Table `funding_sources`**

| id | source_id | source_type | source_name | contribution_amount | contribution_date | contribution_status | non_profit_organization_id |
|---|---|---|---|---|---|---|---|
| 100 | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | individual | Composite Model | 35.57 | 2024-07-07T06:30:00 | pledged | 1 |
| 101 | 7021001070050 | business | Compact Cluster A | 11.88 | 2025-12-18T13:47:00 | received | 2 |
| 102 | achat | foundation | Legacy Review | 17.41 | 2022-05-02T20:04:00 | applied | 3 |
| 103 | template_impcode_pagata_10det50 | special_event | Regional Initiative | 33.06 | 2023-10-13T03:21:00 | pledged | 4 |

The `funding_sources` table records the financial contributions that sustain non-profit operations. Its primary key is `id` (e.g., `100`, `101`, `102`, `103`), and each source carries a business `source_id` that may be a UUID (`3e9b5c70-8fcd-11eb-924d-9cd76263cbd0`), a numeric string (`7021001070050`), or a short code (`achat`, `template_impcode_pagata_10det50`). The `source_type` enum — `individual`, `business`, `foundation`, `special_event` — classifies the contributor category. The `source_name` provides a human-readable label (e.g., `Composite Model`, `Compact Cluster A`, `Legacy Review`, `Regional Initiative`). Financial details are captured in `contribution_amount` (e.g., `35.57`, `11.88`, `17.41`, `33.06`), `contribution_date` (e.g., `2024-07-07T06:30:00`), and `contribution_status` (`pledged`, `received`, `applied`). The `non_profit_organization_id` foreign key ties each funding event to the receiving organization.

**Table `affiliate_councils`**

| id | council_id | council_name | network_parent | member_count | scope_description | person_id | non_profit_organization_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Legacy Standard D | seasonal-network-11 | 4 | Integrated Model A | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Bjornfant | Regional Framework | regional-network-12 | 17 | Extended Cluster | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 726041 | Seasonal Protocol | legacy-network-13 | 9 | Pilot Review | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 2a540c6d30d447058e7e4de6c68c2d6d | Integrated Programme A | compact-network-14 | 0 | Baseline Initiative D | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `affiliate_councils` table models community or network affiliations that persons and organizations participate in. Its primary key is `id` (e.g., `1`, `2`, `3`, `4`), and each council carries a business `council_id` — a UUID like `ae409270-8fcd-11eb-924d-9cd76263cbd0`, a name like `Bjornfant`, a numeric code like `726041`, or a longer hash (`2a540c6d30d447058e7e4de6c68c2d6d`). The `council_name` provides a readable label (e.g., `Legacy Standard D`, `Regional Framework`, `Seasonal Protocol`, `Integrated Programme A`). The `network_parent` column indicates the parent network (e.g., `seasonal-network-11`, `regional-network-12`), and `member_count` records the number of members (e.g., `4`, `17`, `9`, `0`). The `scope_description` column describes the council's focus (e.g., `Integrated Model A`, `Extended Cluster`, `Pilot Review`, `Baseline Initiative D`). Foreign keys `person_id` and `non_profit_organization_id` link the council to its participating person and organization, while `created_at` and `updated_at` timestamps track the council's lifecycle.

With the base tables established, the materialized views reconstruct the most common analytical joins. Each view answers a specific domain question by pulling together columns from two or more tables.

**View `v_board_appointment_person`**

```sql
CREATE VIEW v_board_appointment_person AS
SELECT a.board_appointment_id, a.appointment_id, a.appointment_date, a.role_title, b.person_id AS person_person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM board_appointments a JOIN persons b ON a.person_id = b.person_id;
```

| board_appointment_id | appointment_id | appointment_date | role_title | person_person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1000 | 2087748 | 2022-05-03T16:12:00 | Distributed Standard | 1 | Stephanie Collins | Paul Allen |
| 1001 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2023-10-14T23:29:00 | Adaptive Framework D | 2 | Janice Johnston | Heather Beasley |
| 1002 | 2087740 | 2024-03-25T06:46:00 | Primary Protocol | 3 | Upal Saha | Audrey Taylor |
| 1003 | 1250223 | 2025-08-09T13:03:00 | Composite Programme | 4 | Katherine Snyder | Susan Wagner |

This view joins `board_appointments` to `persons` on `person_id`, answering the question: "Who holds which board appointment, and what are their personal details?" A row from this view might show board appointment `1000` with person `Stephanie Collins` (first name `Stephanie`, last name `Collins`, professional title `Integrated Programme A`), holding the role `Distributed Standard` at an organization identified by `non_profit_organization_id = 1`. The join reconstructs the governance fact that Stephanie Collins is appointed to a board under the `Distributed Standard` role, with her term running from `2022-05-26T16:36:00` to `2025-08-24T07:45:00`.

**View `v_board_appointment_non_profit_organization`**

```sql
CREATE VIEW v_board_appointment_non_profit_organization AS
SELECT a.board_appointment_id, a.appointment_id, a.appointment_date, a.role_title, b.non_profit_organization_id AS organization_non_profit_organization_id, b.organization_id AS organization_organization_id, b.legal_name AS organization_legal_name
FROM board_appointments a JOIN non_profit_organizations b ON a.non_profit_organization_id = b.non_profit_organization_id;
```

| board_appointment_id | appointment_id | appointment_date | role_title | organization_non_profit_organization_id | organization_organization_id | organization_legal_name |
|---|---|---|---|---|---|---|
| 1000 | 2087748 | 2022-05-03T16:12:00 | Distributed Standard | 1 | Shell Oil | Adaptive Model |
| 1001 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2023-10-14T23:29:00 | Adaptive Framework D | 2 | GlobalPlatform Inc. | Primary Cluster |
| 1002 | 2087740 | 2024-03-25T06:46:00 | Primary Protocol | 3 | Whatsapp Inc. | Composite Review D |
| 1003 | 1250223 | 2025-08-09T13:03:00 | Composite Programme | 4 | American Institutes for Research | Compact Initiative |

This view joins `board_appointments` to `non_profit_organizations` on `non_profit_organization_id`, answering: "Which organization receives which board appointment?" A representative row links board appointment `1000` to the organization whose `legal_name` is `Adaptive Model` and whose `tax_status` is `composite-tax-63`. The view reconstructs the fact that the `Adaptive Model` organization (business ID `Shell Oil`) has an active board appointment with role `Distributed Standard`, providing the organization's contact phone (`Theodore Mcgrath`) and website (`https://github.com/chiphuyen/lazynlp`) alongside the appointment's temporal boundaries.

**View `v_non_profit_organization_board_appointment`**

```sql
CREATE VIEW v_non_profit_organization_board_appointment AS
SELECT a.non_profit_organization_id, a.organization_id, a.legal_name, a.tax_status, b.board_appointment_id AS appointment_board_appointment_id, b.appointment_id AS appointment_appointment_id, b.appointment_date AS appointment_appointment_date
FROM non_profit_organizations a JOIN board_appointments b ON a.board_appointment_id = b.board_appointment_id;
```

| non_profit_organization_id | organization_id | legal_name | tax_status | appointment_board_appointment_id | appointment_appointment_id | appointment_appointment_date |
|---|---|---|---|---|---|---|
| 1 | Shell Oil | Adaptive Model | composite-tax-63 | 1000 | 2087748 | 2022-05-03T16:12:00 |
| 2 | GlobalPlatform Inc. | Primary Cluster | primary-tax-64 | 1001 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2023-10-14T23:29:00 |
| 3 | Whatsapp Inc. | Composite Review D | adaptive-tax-65 | 1002 | 2087740 | 2024-03-25T06:46:00 |
| 4 | American Institutes for Research | Compact Initiative | distributed-tax-66 | 1003 | 1250223 | 2025-08-09T13:03:00 |

This view presents the inverse perspective of the previous join: it starts from the organization and surfaces its board appointment. A row might show `non_profit_organization_id = 2` (organization `GlobalPlatform Inc.`, legal name `Primary Cluster`, tax status `primary-tax-64`) with its associated board appointment `1001`, role `Adaptive Framework D`, status `completed`, and term from `2023-10-10T23:53:00` to `2022-01-08T14:02:00`. This view is useful for organizational dashboards that need to display governance metadata alongside organizational identity.

**View `v_non_profit_organization_non_profit_organization`**

```sql
CREATE VIEW v_non_profit_organization_non_profit_organization AS
SELECT a.non_profit_organization_id, a.organization_id, a.legal_name, a.tax_status, b.non_profit_organization_id AS organization_non_profit_organization_id, b.organization_id AS organization_organization_id, b.legal_name AS organization_legal_name
FROM non_profit_organizations a JOIN non_profit_organizations b ON a.has_affiliate_non_profit_organization_id = b.non_profit_organization_id;
```

| non_profit_organization_id | organization_id | legal_name | tax_status | organization_non_profit_organization_id | organization_organization_id | organization_legal_name |
|---|---|---|---|---|---|---|
| 1 | Shell Oil | Adaptive Model | composite-tax-63 | 1 | Shell Oil | Adaptive Model |
| 2 | GlobalPlatform Inc. | Primary Cluster | primary-tax-64 | 2 | GlobalPlatform Inc. | Primary Cluster |
| 3 | Whatsapp Inc. | Composite Review D | adaptive-tax-65 | 3 | Whatsapp Inc. | Composite Review D |
| 4 | American Institutes for Research | Compact Initiative | distributed-tax-66 | 4 | American Institutes for Research | Compact Initiative |

This self-join view on `non_profit_organizations` answers: "Which organizations are affiliates of which other organizations?" The `has_affiliate_non_profit_organization_id` column creates the link. A row might show organization `1` (`Shell Oil`, legal name `Adaptive Model`) as affiliated with organization `1` itself, or organization `2` (`GlobalPlatform Inc.`, legal name `Primary Cluster`) affiliated with organization `2`. This view materializes the inter-organizational network, enabling queries about organizational clusters and affiliate chains.

**View `v_non_profit_organization_funding_source`**

```sql
CREATE VIEW v_non_profit_organization_funding_source AS
SELECT a.non_profit_organization_id, a.organization_id, a.legal_name, a.tax_status, b.id AS source_id, b.source_id AS source_source_id, b.source_type AS source_source_type
FROM non_profit_organizations a JOIN funding_sources b ON a.funding_source_id = b.id;
```

| non_profit_organization_id | organization_id | legal_name | tax_status | source_id | source_source_id | source_source_type |
|---|---|---|---|---|---|---|
| 1 | Shell Oil | Adaptive Model | composite-tax-63 | 100 | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | individual |
| 2 | GlobalPlatform Inc. | Primary Cluster | primary-tax-64 | 101 | 7021001070050 | business |
| 3 | Whatsapp Inc. | Composite Review D | adaptive-tax-65 | 102 | achat | foundation |
| 4 | American Institutes for Research | Compact Initiative | distributed-tax-66 | 103 | template_impcode_pagata_10det50 | special_event |

This view joins `non_profit_organizations` to `funding_sources` on `non_profit_organization_id`, answering: "What funding does each organization receive, and from what type of contributor?" A row might show organization `1` (`Shell Oil`, legal name `Adaptive Model`) receiving a contribution of `35.57` from source type `individual` (source name `Composite Model`), with status `pledged` on `2024-07-07T06:30:00`. Another row might show organization `2` (`GlobalPlatform Inc.`) receiving `11.88` from a `business` contributor (`Compact Cluster A`) with status `received`. This view is essential for financial reporting and donor analysis.

**View `v_person_board_appointment`**

```sql
CREATE VIEW v_person_board_appointment AS
SELECT a.person_id, a.first_name, a.last_name, a.professional_title, b.board_appointment_id AS appointment_board_appointment_id, b.appointment_id AS appointment_appointment_id, b.appointment_date AS appointment_appointment_date
FROM persons a JOIN board_appointments b ON a.board_appointment_id = b.board_appointment_id;
```

| person_id | first_name | last_name | professional_title | appointment_board_appointment_id | appointment_appointment_id | appointment_appointment_date |
|---|---|---|---|---|---|---|
| 1 | Stephanie Collins | Paul Allen | Integrated Programme A | 1000 | 2087748 | 2022-05-03T16:12:00 |
| 2 | Janice Johnston | Heather Beasley | Extended Standard | 1001 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2023-10-14T23:29:00 |
| 3 | Upal Saha | Audrey Taylor | Pilot Framework | 1002 | 2087740 | 2024-03-25T06:46:00 |
| 4 | Katherine Snyder | Susan Wagner | Baseline Protocol D | 1003 | 1250223 | 2025-08-09T13:03:00 |

This view joins `persons` to `board_appointments` on `board_appointment_id`, answering: "What board role does each person hold?" A row might show person `1` (`Stephanie Collins`, last name `Paul Allen`, professional title `Integrated Programme A`, affiliated with `Alexandria Real Estate Equities`) holding board appointment `1000` with role `Distributed Standard`, status `active`, and term from `2022-05-26T16:36:00` to `2025-08-24T07:45:00`. This view reconstructs the person-centric governance view, useful for individual profile pages and succession planning.

**View `v_person_law_firm`**

```sql
CREATE VIEW v_person_law_firm AS
SELECT a.person_id, a.first_name, a.last_name, a.professional_title, b.firm_id AS firm_firm_id, b.firm_name AS firm_firm_name, b.founding_year AS firm_founding_year
FROM persons a JOIN law_firms b ON a.firm_id = b.firm_id;
```

| person_id | first_name | last_name | professional_title | firm_firm_id | firm_firm_name | firm_founding_year |
|---|---|---|---|---|---|---|
| 1 | Stephanie Collins | Paul Allen | Integrated Programme A | 575216 | Legacy Review D | 43 |
| 2 | Janice Johnston | Heather Beasley | Extended Standard | e4ea9416-8fd1-11eb-924d-9cd76263cbd0 | Regional Initiative | 48 |
| 3 | Upal Saha | Audrey Taylor | Pilot Framework | 884351 | Seasonal Model | 53 |
| 4 | Katherine Snyder | Susan Wagner | Baseline Protocol D | L907 | Integrated Cluster A | 58 |

This view joins `persons` to `law_firms` on `firm_id`, answering: "Which law firm is each person associated with?" A row might show person `1` (`Stephanie Collins`) associated with firm `575216` (`Legacy Review D`), founded in year `43`, with practice areas `seasonal-primary-65` and office location `composite-office-57`, legal entity status `primary-legal-46`. Another row might show person `2` (`Janice Johnston`) with firm `e4ea9416-8fd1-11eb-924d-9cd76263cbd0` (`Regional Initiative`), founded in year `48`, practice areas `regional-primary-66`. This view materializes the professional practice axis of the person model.

**View `v_person_affiliate_council`**

```sql
CREATE VIEW v_person_affiliate_council AS
SELECT a.person_id, a.first_name, a.last_name, a.professional_title, b.id AS council_id, b.council_id AS council_council_id, b.council_name AS council_council_name
FROM persons a JOIN affiliate_councils b ON a.affiliate_council_id = b.id;
```

| person_id | first_name | last_name | professional_title | council_id | council_council_id | council_council_name |
|---|---|---|---|---|---|---|
| 1 | Stephanie Collins | Paul Allen | Integrated Programme A | 1 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Legacy Standard D |
| 2 | Janice Johnston | Heather Beasley | Extended Standard | 2 | Bjornfant | Regional Framework |
| 3 | Upal Saha | Audrey Taylor | Pilot Framework | 3 | 726041 | Seasonal Protocol |
| 4 | Katherine Snyder | Susan Wagner | Baseline Protocol D | 4 | 2a540c6d30d447058e7e4de6c68c2d6d | Integrated Programme A |

This view joins `persons` to `affiliate_councils` on `person_id`, answering: "Which affiliate council does each person participate in?" A row might show person `1` (`Stephanie Collins`) participating in council `1` (`council_id = ae409270-8fcd-11eb-924d-9cd76263cbd0`, name `Legacy Standard D`, parent network `seasonal-network-11`, `4` members, scope `Integrated Model A`). Another row might show person `2` (`Janice Johnston`) in council `2` (`Bjornfant`, `Regional Framework`, `17` members, scope `Extended Cluster`). This view reconstructs the community participation dimension of the person model.

**View `v_law_firm_person`**

```sql
CREATE VIEW v_law_firm_person AS
SELECT a.firm_id, a.firm_name, a.founding_year, a.primary_practice_areas, b.person_id AS person_person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM law_firms a JOIN persons b ON a.person_id = b.person_id;
```

| firm_id | firm_name | founding_year | primary_practice_areas | person_person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 575216 | Legacy Review D | 43 | seasonal-primary-65 | 1 | Stephanie Collins | Paul Allen |
| e4ea9416-8fd1-11eb-924d-9cd76263cbd0 | Regional Initiative | 48 | regional-primary-66 | 2 | Janice Johnston | Heather Beasley |
| 884351 | Seasonal Model | 53 | legacy-primary-67 | 3 | Upal Saha | Audrey Taylor |
| L907 | Integrated Cluster A | 58 | compact-primary-68 | 4 | Katherine Snyder | Susan Wagner |

This view presents the inverse of the person-law firm join: it starts from the law firm and surfaces its associated person. A row might show firm `575216` (`Legacy Review D`) with its associated person `1` (`Stephanie Collins`, last name `Paul Allen`, professional title `Integrated Programme A`, affiliated with `Alexandria Real Estate Equities`). This view is useful for firm directories and professional network analysis.

**View `v_funding_source_non_profit_organization`**

```sql
CREATE VIEW v_funding_source_non_profit_organization AS
SELECT a.id, a.source_id, a.source_type, a.source_name, b.non_profit_organization_id AS organization_non_profit_organization_id, b.organization_id AS organization_organization_id, b.legal_name AS organization_legal_name
FROM funding_sources a JOIN non_profit_organizations b ON a.non_profit_organization_id = b.non_profit_organization_id;
```

| id | source_id | source_type | source_name | organization_non_profit_organization_id | organization_organization_id | organization_legal_name |
|---|---|---|---|---|---|---|
| 100 | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | individual | Composite Model | 1 | Shell Oil | Adaptive Model |
| 101 | 7021001070050 | business | Compact Cluster A | 2 | GlobalPlatform Inc. | Primary Cluster |
| 102 | achat | foundation | Legacy Review | 3 | Whatsapp Inc. | Composite Review D |
| 103 | template_impcode_pagata_10det50 | special_event | Regional Initiative | 4 | American Institutes for Research | Compact Initiative |

This view joins `funding_sources` to `non_profit_organizations` on `non_profit_organization_id`, answering: "Which organization receives which funding contribution?" A row might show funding source `100` (source type `individual`, source name `Composite Model`, amount `35.57`, status `pledged`) received by organization `1` (`Shell Oil`, legal name `Adaptive Model`, tax status `composite-tax-63`). Another row might show funding source `103` (source type `special_event`, source name `Regional Initiative`, amount `33.06`, status `pledged`) received by organization `4` (`American Institutes for Research`, legal name `Compact Initiative`). This view is the financial counterpart to the organizational profile, enabling donor-to-organization mapping.

**View `v_affiliate_council_person`**

```sql
CREATE VIEW v_affiliate_council_person AS
SELECT a.id, a.council_id, a.council_name, a.network_parent, b.person_id AS person_person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM affiliate_councils a JOIN persons b ON a.person_id = b.person_id;
```

| id | council_id | council_name | network_parent | person_person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Legacy Standard D | seasonal-network-11 | 1 | Stephanie Collins | Paul Allen |
| 2 | Bjornfant | Regional Framework | regional-network-12 | 2 | Janice Johnston | Heather Beasley |
| 3 | 726041 | Seasonal Protocol | legacy-network-13 | 3 | Upal Saha | Audrey Taylor |
| 4 | 2a540c6d30d447058e7e4de6c68c2d6d | Integrated Programme A | compact-network-14 | 4 | Katherine Snyder | Susan Wagner |

This view joins `affiliate_councils` to `persons` on `person_id`, answering: "Which person is a member of which council?" A row might show council `1` (`Legacy Standard D`, `4` members, scope `Integrated Model A`) with its member person `1` (`Stephanie Collins`, last name `Paul Allen`, professional title `Integrated Programme A`). Another row might show council `3` (`Seasonal Protocol`, `9` members, scope `Pilot Review`) with member person `3` (`Upal Saha`, last name `Audrey Taylor`, professional title `Pilot Framework`). This view reconstructs the council membership roster from the normalized tables.

**View `v_affiliate_council_non_profit_organization`**

```sql
CREATE VIEW v_affiliate_council_non_profit_organization AS
SELECT a.id, a.council_id, a.council_name, a.network_parent, b.non_profit_organization_id AS organization_non_profit_organization_id, b.organization_id AS organization_organization_id, b.legal_name AS organization_legal_name
FROM affiliate_councils a JOIN non_profit_organizations b ON a.non_profit_organization_id = b.non_profit_organization_id;
```

| id | council_id | council_name | network_parent | organization_non_profit_organization_id | organization_organization_id | organization_legal_name |
|---|---|---|---|---|---|---|
| 1 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Legacy Standard D | seasonal-network-11 | 1 | Shell Oil | Adaptive Model |
| 2 | Bjornfant | Regional Framework | regional-network-12 | 2 | GlobalPlatform Inc. | Primary Cluster |
| 3 | 726041 | Seasonal Protocol | legacy-network-13 | 3 | Whatsapp Inc. | Composite Review D |
| 4 | 2a540c6d30d447058e7e4de6c68c2d6d | Integrated Programme A | compact-network-14 | 4 | American Institutes for Research | Compact Initiative |

This view joins `affiliate_councils` to `non_profit_organizations` on `non_profit_organization_id`, answering: "Which organization is associated with which affiliate council?" A row might show council `1` (`Legacy Standard D`, parent network `seasonal-network-11`, `4` members, scope `Integrated Model A`) associated with organization `1` (`Shell Oil`, legal name `Adaptive Model`, tax status `composite-tax-63`, headquarters `composite-headquar-63`). Another row might show council `4` (`Integrated Programme A`, parent network `compact-network-14`, `0` members, scope `Baseline Initiative D`) associated with organization `4` (`American Institutes for Research`, legal name `Compact Initiative`). This view materializes the organizational-council linkage, enabling queries about which organizations participate in which networks.

The relational schema above demonstrates a disciplined normalization of the non-profit governance domain. Six base tables capture the core entities — appointments, organizations, persons, law firms, funding sources, and affiliate councils — each with its own primary key and a set of descriptive attributes. Foreign keys create the relationships: `board_appointments` links persons to organizations; `non_profit_organizations` links to funding sources and to other organizations via self-referential columns; `persons` links to law firms and affiliate councils. The materialized views then reconstruct the most common analytical joins, allowing downstream consumers to query governance facts, financial relationships, and professional affiliations without writing complex multi-table joins. The result is a schema that is both normalized for data integrity and accessible for analytical consumption.