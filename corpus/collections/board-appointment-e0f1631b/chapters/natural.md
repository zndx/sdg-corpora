## Governance and Resource Flows in Non-Profit Ecosystems

Non-profit organizations operate within complex networks of governance, professional service, and financial support. Each entity maintains a structured relationship with its board of directors, legal counsel, funding sources, and affiliated councils. Understanding these relationships requires examining how individuals assume governance roles, how organizations connect through shared networks, and how financial resources flow between donors and recipients. The records in this domain capture the full lifecycle of board appointments, the professional affiliations of persons with law firms and councils, and the financial contributions that sustain organizational operations.

**Table `non_profit_organizations`**

| non_profit_organization_id | organization_id | legal_name | tax_status | founding_date | headquarters_location | website_url | contact_phone_number | board_appointment_id | has_affiliate_non_profit_organization_id | funding_source_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Shell Oil | Adaptive Model | composite-tax-63 | 2023-06-24T05:03:00 | composite-headquar-63 | https://github.com/chiphuyen/lazynlp | Theodore Mcgrath | 1000 | 1 | 100 |
| 2 | GlobalPlatform Inc. | Primary Cluster | primary-tax-64 | 2024-11-08T12:20:00 | primary-headquar-64 | https://bugs.launchpad.net/ironic/+bug/1346406 | Peter Mcdowell | 1001 | 2 | 101 |
| 3 | Whatsapp Inc. | Composite Review D | adaptive-tax-65 | 2025-04-19T19:37:00 | adaptive-headquar-65 | http://en.wikipedia.org/wiki/Hyla_femoralis | Collin Lopez | 1002 | 3 | 102 |
| 4 | American Institutes for Research | Compact Initiative | distributed-tax-66 | 2022-09-03T02:54:00 | distributed-headquar-66 | https://www.nature.com/articles/nphoton.2014.41 | Steve Martin | 1003 | 4 | 103 |

Non-profit organizations form the central entities in this ecosystem. Each organization carries a unique identifier, a legal name, and a tax status classification such as composite-tax-63 or primary-tax-64. The founding dates span from 2022 through 2025, reflecting a relatively recent establishment of these entities. Headquarters locations follow a naming convention like composite-headquar-63, and each organization maintains a website and contact phone number. Notably, the organization table includes a field linking to a board appointment, a reference to an affiliate non-profit organization, and a funding source identifier, establishing the core relational structure of the domain. Shell Oil, for instance, operates under the legal name Adaptive Model with tax status composite-tax-63, founded on 2023-06-24, and is headquartered at composite-headquar-63.

**Table `board_appointments`**

| board_appointment_id | appointment_id | appointment_date | role_title | term_start_date | term_end_date | appointment_status | person_id | non_profit_organization_id | succeeds_previous_appointee_person_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2087748 | 2022-05-03T16:12:00 | Distributed Standard | 2022-05-26T16:36:00 | 2025-08-24T07:45:00 | active | 1 | 1 | 1 | 2025-01-01 00:14:00 |
| 1001 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | 2023-10-14T23:29:00 | Adaptive Framework D | 2023-10-10T23:53:00 | 2022-01-08T14:02:00 | completed | 2 | 2 | 2 | 2025-02-06 03:14:00 |
| 1002 | 2087740 | 2024-03-25T06:46:00 | Primary Protocol | 2024-03-21T06:10:00 | 2023-06-19T21:19:00 | pending | 3 | 3 | 3 | 2025-03-11 06:14:00 |
| 1003 | 1250223 | 2025-08-09T13:03:00 | Composite Programme | 2025-08-05T13:27:00 | 2024-11-03T04:36:00 | active | 4 | 4 | 4 | 2025-04-16 09:14:00 |

Board appointments serve as the governance mechanism through which persons assume leadership roles within non-profit organizations. Each appointment record carries a unique board appointment identifier, an external appointment reference, and a role title such as Distributed Standard or Adaptive Framework D. The appointment date marks when the appointment was recorded, while term start and end dates define the active period of service. The appointment status—active, completed, or pending—indicates the current state of the governance relationship. Each appointment links to a specific person and a non-profit organization, and may reference a previous appointee through the succeeds_previous_appointee_person_id field, enabling tracking of succession patterns. Appointment 1000, for example, assigned role title Distributed Standard to person 1 within organization 1, with an active status and a term running from 2022-05-26 through 2025-08-24.

**Table `persons`**

| person_id | first_name | last_name | professional_title | affiliated_organization | contact_email | contact_phone_number | board_appointment_id | firm_id | affiliate_council_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Stephanie Collins | Paul Allen | Integrated Programme A | Alexandria Real Estate Equities | Christopher Wilson | Theodore Mcgrath | 1000 | 575216 | 1 |
| 2 | Janice Johnston | Heather Beasley | Extended Standard | Feedback Rating | Charles Larsen | Peter Mcdowell | 1001 | e4ea9416-8fd1-11eb-924d-9cd76263cbd0 | 2 |
| 3 | Upal Saha | Audrey Taylor | Pilot Framework | Feedback Rating | Mary Alvarez | Collin Lopez | 1002 | 884351 | 3 |
| 4 | Katherine Snyder | Susan Wagner | Baseline Protocol D | Litton Industries | April Snyder | Steve Martin | 1003 | L907 | 4 |

Persons represent the individuals who participate in the governance and professional infrastructure of non-profit organizations. Each person record includes a first name, last name, professional title, and affiliated organization. Contact information is captured through email and phone number fields. Persons are linked to board appointments, law firms, and affiliate councils, reflecting their multi-faceted roles within the ecosystem. Stephanie Collins, for instance, holds the professional title Integrated Programme A and is affiliated with Alexandria Real Estate Equities. Her record connects her to board appointment 1000, law firm 575216, and affiliate council 1, illustrating how a single individual participates across multiple organizational dimensions.

**Table `law_firms`**

| firm_id | firm_name | founding_year | primary_practice_areas | office_locations | legal_entity_status | person_id |
|---|---|---|---|---|---|---|
| 575216 | Legacy Review D | 43 | seasonal-primary-65 | composite-office-57 | primary-legal-46 | 1 |
| e4ea9416-8fd1-11eb-924d-9cd76263cbd0 | Regional Initiative | 48 | regional-primary-66 | primary-office-58 | adaptive-legal-47 | 2 |
| 884351 | Seasonal Model | 53 | legacy-primary-67 | adaptive-office-59 | distributed-legal-48 | 3 |
| L907 | Integrated Cluster A | 58 | compact-primary-68 | distributed-office-60 | baseline-legal-49 | 4 |

Law firms provide professional legal services to the non-profit organizations and their personnel. Each firm record includes a firm identifier, firm name, founding year, primary practice areas, office locations, and legal entity status. The firm status categories—such as primary-legal-46 or adaptive-legal-47—reflect different operational classifications. Legacy Review D, established in year 43, operates under legal entity status primary-legal-46 with practice area seasonal-primary-65. Each firm is associated with a person through the person_id field, establishing the professional linkage between individual practitioners and their employing organizations.

**Table `funding_sources`**

| id | source_id | source_type | source_name | contribution_amount | contribution_date | contribution_status | non_profit_organization_id |
|---|---|---|---|---|---|---|---|
| 100 | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | individual | Composite Model | 35.57 | 2024-07-07T06:30:00 | pledged | 1 |
| 101 | 7021001070050 | business | Compact Cluster A | 11.88 | 2025-12-18T13:47:00 | received | 2 |
| 102 | achat | foundation | Legacy Review | 17.41 | 2022-05-02T20:04:00 | applied | 3 |
| 103 | template_impcode_pagata_10det50 | special_event | Regional Initiative | 33.06 | 2023-10-13T03:21:00 | pledged | 4 |

Funding sources document the financial contributions that sustain non-profit operations. Each funding record includes a source identifier, source type (individual, business, foundation, or special_event), source name, contribution amount, contribution date, and contribution status. The contribution status values—pledged, received, or applied—track the fulfillment state of financial commitments. Contribution amounts range from 11.88 to 35.57 in the sample data. The funding source identified by source_id 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 represents an individual contribution of 35.57 to organization 1, pledged on 2024-07-07. Each funding record is linked to a specific non-profit organization, creating a direct financial relationship.

**Table `affiliate_councils`**

| id | council_id | council_name | network_parent | member_count | scope_description | person_id | non_profit_organization_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Legacy Standard D | seasonal-network-11 | 4 | Integrated Model A | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Bjornfant | Regional Framework | regional-network-12 | 17 | Extended Cluster | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 726041 | Seasonal Protocol | legacy-network-13 | 9 | Pilot Review | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 2a540c6d30d447058e7e4de6c68c2d6d | Integrated Programme A | compact-network-14 | 0 | Baseline Initiative D | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Affiliate councils represent collaborative networks that connect persons and non-profit organizations through shared governance or operational frameworks. Each council record includes a council identifier, council name, network parent, member count, and scope description. The network parent field (such as seasonal-network-11 or regional-network-12) indicates the broader network to which the council belongs. Council membership ranges from 0 to 17 members, with scope descriptions like Integrated Model A or Extended Cluster providing context for the council's purpose. Council 1, named Legacy Standard D, belongs to network seasonal-network-11, has 4 members, and operates under the scope Integrated Model A. Each council links to a person and a non-profit organization, establishing the dual affiliation structure.

### Board Appointment and Person Relationships

The relationship between board appointments and persons reveals how individuals assume governance responsibilities. The view joining these tables answers the question of which person holds which board appointment and under what role title.

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

Reading the joined result, appointment 1000 connects person 1 to the role title Distributed Standard within non-profit organization 1. The appointment status is active, with a term extending through 2025-08-24. Appointment 1001, by contrast, shows role title Adaptive Framework D with a completed status, indicating the governance relationship has concluded. The succeeds_previous_appointee_person_id field reveals that appointment 1000 succeeded previous appointee 1, suggesting a self-referential succession pattern where the same person may hold successive terms.

### Board Appointment and Non-Profit Organization Relationships

The connection between board appointments and non-profit organizations clarifies which governance appointments apply to which entities.

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

In this joined view, appointment 1000 is associated with the non-profit organization bearing identifier 1 and legal name Shell Oil. The role title Distributed Standard applies to this specific organization. Appointment 1003 links to organization 4, American Institutes for Research, under the role title Composite Programme. The appointment dates and term dates provide temporal context for when each governance relationship was established and when it is scheduled to conclude.

### Non-Profit Organization and Board Appointment Relationships

This perspective reverses the relationship, showing which board appointments are associated with each non-profit organization.

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

Organization 1 (Shell Oil) has board appointment 1000 with role title Distributed Standard and active status. Organization 2 (GlobalPlatform Inc.) has appointment 1001 with role title Adaptive Framework D in completed status. The view confirms that each organization maintains a single primary board appointment in the current records, and the appointment status provides an immediate indicator of whether the governance arrangement is currently active.

### Non-Profit Organization Self-Relationships

The domain supports a self-referential relationship between non-profit organizations, indicating affiliate or subsidiary connections.

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

In the sample data, organization 1 (Shell Oil) references affiliate non-profit organization 1, and organization 2 (GlobalPlatform Inc.) references affiliate 2. This pattern suggests that each organization may maintain an affiliate relationship with itself or a related entity. The board_appointment_id field in the organization table links back to the governance structure, while the affiliate reference creates a parallel organizational hierarchy.

### Non-Profit Organization and Funding Source Relationships

Financial sustainability is captured through the relationship between non-profit organizations and their funding sources.

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

Organization 1 (Shell Oil) is linked to funding source 100, which carries source type individual and source name Composite Model. The contribution amount of 35.57 was pledged on 2024-07-07. Organization 2 (GlobalPlatform Inc.) receives funding from source 101, a business contribution of 11.88 with received status dated 2025-12-18. The view enables tracking of contribution types, amounts, and statuses across the portfolio of non-profit organizations.

### Person and Board Appointment Relationships

This view presents the person-centric perspective, showing which board appointments each individual holds.

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

Person 1 (Stephanie Collins) holds board appointment 1000 with role title Distributed Standard. The appointment is active and applies to non-profit organization 1. Person 2 (Janice Johnston) holds appointment 1001 with role title Adaptive Framework D, which has completed status. The professional title of each person—Integrated Programme A for person 1 and Extended Standard for person 2—provides additional context about their professional background within the governance structure.

### Person and Law Firm Relationships

The professional affiliation between persons and law firms is captured in this joined view.

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

Person 1 (Stephanie Collins) is affiliated with law firm 575216, named Legacy Review D, which was founded in year 43 and operates under legal entity status primary-legal-46. Person 2 (Janice Johnston) is linked to firm e4ea9416-8fd1-11eb-924d-9cd76263cbd0, named Regional Initiative, with founding year 48 and adaptive-legal-47 status. The practice areas—seasonal-primary-65 for Legacy Review D and regional-primary-66 for Regional Initiative—indicate the specialized service domains of each firm.

### Person and Affiliate Council Relationships

Affiliate councils connect persons to collaborative governance networks.

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

Person 1 (Stephanie Collins) is a member of affiliate council 1, named Legacy Standard D, which belongs to network seasonal-network-11 and has 4 members. Person 2 (Janice Johnston) is associated with council 2, Regional Framework, which has 17 members and belongs to network regional-network-12. The scope descriptions—Integrated Model A for council 1 and Extended Cluster for council 2—provide context for the collaborative focus of each council.

### Law Firm and Person Relationships

This view reverses the law firm-person relationship, showing which persons are associated with each law firm.

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

Law firm 575216 (Legacy Review D) is associated with person 1 (Stephanie Collins), whose professional title is Integrated Programme A. Law firm e4ea9416-8fd1-11eb-924d-9cd76263cbd0 (Regional Initiative) is linked to person 2 (Janice Johnston) with professional title Extended Standard. The office locations—composite-office-57 for Legacy Review D and primary-office-58 for Regional Initiative—indicate the physical presence of each firm.

### Funding Source and Non-Profit Organization Relationships

This perspective presents the funding source-centric view, showing which non-profit organizations receive contributions from each source.

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

Funding source 100 (Composite Model, type individual) contributes to non-profit organization 1 (Shell Oil) with a pledged amount of 35.57. Funding source 101 (Compact Cluster A, type business) contributes to organization 2 (GlobalPlatform Inc.) with a received amount of 11.88. The contribution dates and statuses enable financial tracking and reporting across the funding portfolio.

### Affiliate Council and Person Relationships

This view shows which persons are members of each affiliate council.

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

Council 1 (Legacy Standard D) is associated with person 1 (Stephanie Collins), who holds professional title Integrated Programme A. Council 2 (Regional Framework) is linked to person 2 (Janice Johnston) with professional title Extended Standard. The member counts—4 for council 1 and 17 for council 2—indicate the relative size of each collaborative network.

### Affiliate Council and Non-Profit Organization Relationships

The final joined view connects affiliate councils to the non-profit organizations they serve or represent.

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

Council 1 (Legacy Standard D) is associated with non-profit organization 1 (Shell Oil), which has legal name Adaptive Model and tax status composite-tax-63. Council 2 (Regional Framework) connects to organization 2 (GlobalPlatform Inc.), with legal name Primary Cluster and tax status primary-tax-64. The council names and scope descriptions—Integrated Model A for council 1 and Extended Cluster for council 2—provide the collaborative context for these organizational relationships.

### Synthesis

The non-profit governance ecosystem comprises interlocking relationships between organizations, individuals, legal entities, financial contributors, and collaborative councils. Board appointments serve as the primary governance mechanism, linking persons to organizations through defined roles and terms. Law firms provide professional legal infrastructure, while funding sources sustain organizational operations through diverse contribution types. Affiliate councils create collaborative networks that extend beyond individual organizational boundaries. The joined views enable multi-dimensional analysis of these relationships, supporting governance oversight, financial reporting, and network mapping across the entire ecosystem.