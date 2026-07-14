## Ontology-Grounded Relational Modelling of Corporate Governance

The corporate governance domain captures the interlocking relationships between individuals, organizations, boards, qualifications, and ventures that together constitute the landscape of institutional oversight. At its core, the model distinguishes six principal entity types—persons, organizations, governance boards, board members, academic qualifications, and business ventures—each materialized as a relational table with a stable surrogate key, a set of descriptive attributes, and foreign keys that encode cardinality-bounded relationships. A single junction table, `boards_members`, resolves the many-to-many association between governance boards and board members, while a suite of twelve views reconstructs domain facts by joining the normalized tables back into readable, fact-oriented projections. The following sections walk through the entity types, their attributes, the foreign-key topology, and the view-level reconstructions that make the schema queryable in terms of the original domain concepts.

**Table `board_members`**

| board_member_id | member_id | role_type | appointment_date | termination_date | is_current_member | board_id | person_id | position_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 10207158 | temporary | 2022-05-03 | 2022-09-11 | false | ChIJH2V4UYBt5kcR5doeFwuU7Ns | 1000 | 14477856 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 10207158 | permanent | 2023-10-14 | 2023-02-22 | true | 168553 | 1001 | gd_acc_260002 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 25820616 | non-executive | 2024-03-25 | 2024-07-06 | false | 5006454 | 1002 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 2002007020250 | chairman | 2025-08-09 | 2025-12-17 | true | 1437585 | 1003 | 82871 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `board_members` table is the central association entity in the governance subgraph. It records every appointment of a person to a governance board, capturing not only the linkage but also the temporal and role metadata of that appointment. The primary key is `board_member_id`, a sequential integer (1000, 1001, 1002, 1003 in the sample). The `member_id` column carries an external identifier—`10207158` for the first two rows, `25820616` for the third, and `2002007020250` for the fourth—allowing the model to reconcile with upstream systems. The `role_type` attribute distinguishes appointment categories such as `temporary`, `permanent`, `non-executive`, and `chairman`, as seen in the four sample rows. Temporal boundaries are recorded in `appointment_date` and `termination_date`; for instance, row 1000 shows a temporary appointment from 2022-05-03 to 2022-09-11, while row 1003 records a chairman tenure from 2025-08-09 to 2025-12-17. The boolean `is_current_member` flag (true for rows 1001 and 1003, false for 1000 and 1002) provides a convenient denormalized indicator of active membership. The foreign keys `board_id` (referencing `governance_boards`), `person_id` (referencing `persons`), and `position_id` (referencing `leadership_positions`) bind the appointment to its structural context. Audit timestamps `created_at` and `updated_at` round out the table.

**Table `governance_boards`**

| board_id | board_name | organization_id | established_date | status | oversees_organization_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | Shell Oil | 2024-03-27 | active | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 168553 | Legacy Assessment | GlobalPlatform Inc. | 2025-08-11 | dissolved | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 5006454 | Regional Survey A | Whatsapp Inc. | 2022-01-22 | restructuring | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1437585 | Seasonal Corridor | American Institutes for Research | 2023-06-06 | active | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `governance_boards` table defines the boards themselves. Its primary key `board_id` is a heterogeneous identifier: it can be a Google Place ID string such as `ChIJH2V4UYBt5kcR5doeFwuU7Ns` (the Compact Series board), or a plain integer like `168553` (Legacy Assessment), `5006454` (Regional Survey A), or `1437585` (Seasonal Corridor). The `board_name` column carries human-readable labels, while `organization_id` (a small integer: 1, 2, 3, 4) points to the parent organization that the board oversees. The `established_date` records when the board was constituted—2024-03-27 for Compact Series, 2025-08-11 for Legacy Assessment, and so on. The `status` column enumerates lifecycle states: `active`, `dissolved`, and `restructuring` appear in the sample. The `oversees_organization_id` column (values 1 through 4) provides a second organizational linkage, enabling the model to express that a board both belongs to and supervises an organization. Timestamps `created_at` and `updated_at` complete the record.

**Table `persons`**

| id | person_id | first_name | last_name | professional_title | years_of_experience | organization_id | academic_qualification_qual_id | board_id | business_venture_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | George Bernard Shaw | Stephanie Collins | Paul Allen | Integrated Programme A | 7 | 1 | 2002007020190 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | 1000 |
| 1001 | Maria Rodriguez | Janice Johnston | Heather Beasley | Extended Standard | 10 | 2 | 974947 | 168553 | 1001 |
| 1002 | Sarah Villanueva | Upal Saha | Audrey Taylor | Pilot Framework | 13 | 3 | 4716397 | 5006454 | 1002 |
| 1003 | Susan Wagner | Katherine Snyder | Susan Wagner | Baseline Protocol D | 16 | 4 | PHR-98 | 1437585 | 1003 |

The `persons` table stores individual records. Its surrogate primary key is `id` (1000–1003), while `person_id` carries a free-text name or identifier such as `George Bernard Shaw`, `Maria Rodriguez`, `Sarah Villanueva`, and `Susan Wagner`. The `first_name` and `last_name` columns decompose the name further (e.g., `Stephanie Collins` and `Paul Allen` for id 1000). The `professional_title` attribute holds programmatic titles like `Integrated Programme A`, `Extended Standard`, `Pilot Framework`, and `Baseline Protocol D`. `years_of_experience` is an integer (7, 10, 13, 16 in the sample). Foreign keys `organization_id` (1–4), `academic_qualification_qual_id` (linking to `academic_qualifications`), `board_id` (linking to `governance_boards`), and `business_venture_id` (linking to `business_ventures`) embed direct associations within the person record, while the `board_members` table provides the richer, temporally-aware membership linkage.

**Table `organizations`**

| id | org_id | org_name | org_type | headquarters_location | listing_status | person_id | business_venture_id | board_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | local_government | composite-headquar-63 | listed | 1000 | 1000 | ChIJH2V4UYBt5kcR5doeFwuU7Ns |
| 2 | 1717 | Pilot Initiative A | private_company | primary-headquar-64 | private | 1001 | 1001 | 168553 |
| 3 | 69437 | Baseline Model | public_company | adaptive-headquar-65 | n/a | 1002 | 1002 | 5006454 |
| 4 | m16 | Distributed Cluster | educational_institution | distributed-headquar-66 | listed | 1003 | 1003 | 1437585 |

The `organizations` table captures institutional entities. Its surrogate key is `id` (1–4), and `org_id` carries a secondary identifier such as `790471`, `1717`, `69437`, or `m16`. The `org_name` column holds names like `Extended Review`, `Pilot Initiative A`, `Baseline Model`, and `Distributed Cluster`. The `org_type` attribute classifies organizations as `local_government`, `private_company`, `public_company`, or `educational_institution`. The `headquarters_location` column uses coded location strings such as `composite-headquar-63` and `primary-headquar-64`. The `listing_status` column indicates whether the organization is `listed`, `private`, or `n/a`. Foreign keys `person_id`, `business_venture_id`, and `board_id` embed direct associations, while the `governance_boards` table provides the organizational oversight linkage through `organization_id` and `oversees_organization_id`.

**Table `academic_qualifications`**

| qual_id | degree_type | field_of_study | awarding_institution | graduation_year | distinction | person_id | organization_id |
|---|---|---|---|---|---|---|---|
| 2002007020190 | compact-degree-62 | legacy-field-25 | distributed-awarding-30 | 38 | pilot-distinct-56 | 1000 | 1 |
| 974947 | composite-degree-63 | compact-field-26 | baseline-awarding-31 | 45 | extended-distinct-57 | 1001 | 2 |
| 4716397 | primary-degree-64 | composite-field-27 | pilot-awarding-32 | 52 | integrated-distinct-58 | 1002 | 3 |
| PHR-98 | adaptive-degree-65 | primary-field-28 | extended-awarding-33 | 59 | seasonal-distinct-59 | 1003 | 4 |

The `academic_qualifications` table records educational credentials. Its primary key is `qual_id`, which can be numeric (`2002007020190`, `974947`, `4716397`) or alphanumeric (`PHR-98`). The `degree_type` column uses coded values such as `compact-degree-62`, `composite-degree-63`, `primary-degree-64`, and `adaptive-degree-65`. The `field_of_study` column carries fields like `legacy-field-25`, `compact-field-26`, `composite-field-27`, and `primary-field-28`. The `awarding_institution` column uses coded institution names (`distributed-awarding-30`, `baseline-awarding-31`, etc.), while `graduation_year` and `distinction` store numeric year codes and distinction codes respectively. Foreign keys `person_id` and `organization_id` link the qualification to its holder and, optionally, to an organization context.

**Table `business_ventures`**

| id | venture_id | venture_name | industry_sector | operational_status | geographic_scope | organization_id | person_id |
|---|---|---|---|---|---|---|---|
| 1000 | 1889765 | Integrated Programme A | seasonal-industry-35 | operational | distributed-geograph-78 | 1 | 1000 |
| 1001 | 1996924 | Extended Standard | regional-industry-36 | development | baseline-geograph-79 | 2 | 1001 |
| 1002 | 1250194 | Pilot Framework | legacy-industry-37 | closed | pilot-geograph-80 | 3 | 1002 |
| 1003 | 1450646 | Baseline Protocol D | compact-industry-38 | operational | extended-geograph-81 | 4 | 1003 |

The `business_ventures` table captures entrepreneurial or project entities. Its surrogate key is `id` (1000–1003), and `venture_id` carries numeric identifiers such as `1889765`, `1996924`, `1250194`, and `1450646`. The `venture_name` column holds names like `Integrated Programme A`, `Extended Standard`, `Pilot Framework`, and `Baseline Protocol D`. The `industry_sector` column uses coded sectors (`seasonal-industry-35`, `regional-industry-36`, `legacy-industry-37`, `compact-industry-38`), while `operational_status` enumerates `operational`, `development`, and `closed`. The `geographic_scope` column uses coded scope strings (`distributed-geograph-78`, `baseline-geograph-79`, etc.). Foreign keys `organization_id` and `person_id` link the venture to its sponsoring organization and, optionally, to a responsible person.

**Table `leadership_positions`**

| position_id | position_title | sector | start_date | end_date | is_current | person_id | organization_id |
|---|---|---|---|---|---|---|---|
| 14477856 | Extended Model | adaptive-sector-53 | 2022-09-05 | 2022-09-01 | true | 1000 | 1 |
| gd_acc_260002 | Pilot Cluster A | distributed-sector-54 | 2023-02-16 | 2023-02-12 | false | 1001 | 2 |
| 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Review | baseline-sector-55 | 2024-07-27 | 2024-07-23 | true | 1002 | 3 |
| 82871 | Distributed Initiative | pilot-sector-56 | 2025-12-11 | 2025-12-07 | false | 1003 | 4 |

The `leadership_positions` table defines formal positions within the governance structure. The `board_members` table references this table via its `position_id` column, which carries identifiers such as `gd_acc_260002`, `3e41f384-9bac-11eb-a8a2-19ed5c03f8d3`, and `82871`. The table itself would contain the position title, description, and organizational context, though the sample data is not shown here. The foreign key relationship from `board_members.position_id` to `leadership_positions` ensures that every board appointment is anchored to a well-defined role.

**Table `boards_members`**

| board_id | board_member_id |
|---|---|
| ChIJH2V4UYBt5kcR5doeFwuU7Ns | 1000 |
| ChIJH2V4UYBt5kcR5doeFwuU7Ns | 1001 |
| 168553 | 1001 |
| 168553 | 1002 |
| 5006454 | 1002 |
| 5006454 | 1003 |
| 1437585 | 1003 |
| 1437585 | 1000 |

The `boards_members` table serves as the junction table resolving the many-to-many relationship between `governance_boards` and `board_members`. In a normalized design, a board can have many members, and a person (through their board member record) can serve on multiple boards. This junction table would contain at minimum `board_id` and `board_member_id` columns, forming a composite foreign key that references `governance_boards(board_id)` and `board_members(board_member_id)`. The presence of this junction table confirms that the model treats board membership as a true many-to-many association rather than a simple foreign key on either side.

With the base tables established, the schema provides a rich set of views that reconstruct domain facts by joining the normalized tables. Each view answers a specific analytical question by assembling the relevant columns from multiple tables into a single, queryable projection.

**View `v_board_member_governance_board`**

```sql
CREATE VIEW v_board_member_governance_board AS
SELECT a.board_member_id, a.member_id, a.role_type, a.appointment_date, b.board_id AS board_board_id, b.board_name AS board_board_name, b.organization_id AS board_organization_id
FROM board_members a JOIN governance_boards b ON a.board_id = b.board_id;
```

| board_member_id | member_id | role_type | appointment_date | board_board_id | board_board_name | board_organization_id |
|---|---|---|---|---|---|---|
| 1000 | 10207158 | temporary | 2022-05-03 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | Shell Oil |
| 1001 | 10207158 | permanent | 2023-10-14 | 168553 | Legacy Assessment | GlobalPlatform Inc. |
| 1002 | 25820616 | non-executive | 2024-03-25 | 5006454 | Regional Survey A | Whatsapp Inc. |
| 1003 | 2002007020250 | chairman | 2025-08-09 | 1437585 | Seasonal Corridor | American Institutes for Research |

The view `v_board_member_governance_board` joins `board_members` to `governance_boards` on `board_id`, producing a row that pairs each board member appointment with the full details of the board to which they are appointed. Reading the sample, row 1000 (a temporary member) is associated with the Compact Series board (`ChIJH2V4UYBt5kcR5doeFwuU7Ns`), which is an active board established on 2024-03-27. Row 1001 (a permanent member) is linked to the Legacy Assessment board (`168553`), which is in a dissolved state. This view answers the question: "For each board member appointment, what board is it for, and what is the board's status and establishment date?"

**View `v_board_member_person`**

```sql
CREATE VIEW v_board_member_person AS
SELECT a.board_member_id, a.member_id, a.role_type, a.appointment_date, b.id AS person_id, b.person_id AS person_person_id, b.first_name AS person_first_name
FROM board_members a JOIN persons b ON a.person_id = b.id;
```

| board_member_id | member_id | role_type | appointment_date | person_id | person_person_id | person_first_name |
|---|---|---|---|---|---|---|
| 1000 | 10207158 | temporary | 2022-05-03 | 1000 | George Bernard Shaw | Stephanie Collins |
| 1001 | 10207158 | permanent | 2023-10-14 | 1001 | Maria Rodriguez | Janice Johnston |
| 1002 | 25820616 | non-executive | 2024-03-25 | 1002 | Sarah Villanueva | Upal Saha |
| 1003 | 2002007020250 | chairman | 2025-08-09 | 1003 | Susan Wagner | Katherine Snyder |

The view `v_board_member_person` joins `board_members` to `persons` on `person_id`, producing a row that pairs each appointment with the full identity and professional profile of the appointee. Row 1000 links to person id 1000 (George Bernard Shaw, with 7 years of experience and professional title Integrated Programme A), while row 1003 links to person id 1003 (Susan Wagner, with 16 years of experience and title Baseline Protocol D). This view answers: "Who is each board member, and what is their professional background?"

**View `v_board_member_leadership_position`**

```sql
CREATE VIEW v_board_member_leadership_position AS
SELECT a.board_member_id, a.member_id, a.role_type, a.appointment_date, b.position_id AS position_position_id, b.position_title AS position_position_title, b.sector AS position_sector
FROM board_members a JOIN leadership_positions b ON a.position_id = b.position_id;
```

| board_member_id | member_id | role_type | appointment_date | position_position_id | position_position_title | position_sector |
|---|---|---|---|---|---|---|
| 1000 | 10207158 | temporary | 2022-05-03 | 14477856 | Extended Model | adaptive-sector-53 |
| 1001 | 10207158 | permanent | 2023-10-14 | gd_acc_260002 | Pilot Cluster A | distributed-sector-54 |
| 1002 | 25820616 | non-executive | 2024-03-25 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Review | baseline-sector-55 |
| 1003 | 2002007020250 | chairman | 2025-08-09 | 82871 | Distributed Initiative | pilot-sector-56 |

The view `v_board_member_leadership_position` joins `board_members` to `leadership_positions` on `position_id`, producing a row that pairs each appointment with the formal position held. Row 1000 holds position `14477856`, row 1001 holds `gd_acc_260002`, row 1002 holds `3e41f384-9bac-11eb-a8a2-19ed5c03f8d3`, and row 1003 holds `82871`. This view answers: "What formal leadership position does each board member occupy?"

**View `v_governance_board_organization`**

```sql
CREATE VIEW v_governance_board_organization AS
SELECT a.board_id, a.board_name, a.organization_id, a.established_date, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM governance_boards a JOIN organizations b ON a.oversees_organization_id = b.id;
```

| board_id | board_name | organization_id | established_date | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | Shell Oil | 2024-03-27 | 1 | 790471 | Extended Review |
| 168553 | Legacy Assessment | GlobalPlatform Inc. | 2025-08-11 | 2 | 1717 | Pilot Initiative A |
| 5006454 | Regional Survey A | Whatsapp Inc. | 2022-01-22 | 3 | 69437 | Baseline Model |
| 1437585 | Seasonal Corridor | American Institutes for Research | 2023-06-06 | 4 | m16 | Distributed Cluster |

The view `v_governance_board_organization` joins `governance_boards` to `organizations` on `organization_id`, producing a row that pairs each board with its parent organization. Row for Compact Series (`ChIJH2V4UYBt5kcR5doeFwuU7Ns`) links to organization id 1 (Extended Review, a local government entity), while the Legacy Assessment board (`168553`) links to organization id 2 (Pilot Initiative A, a private company). This view answers: "Which organization does each governance board belong to, and what type of organization is it?"

**View `v_governance_board_board_member_detail`**

```sql
CREATE VIEW v_governance_board_board_member_detail AS
SELECT a.board_id, a.board_name, a.organization_id, b.board_member_id AS member_board_member_id, b.member_id AS member_member_id, b.role_type AS member_role_type
FROM governance_boards a
  JOIN boards_members j ON j.board_id = a.board_id
  JOIN board_members b ON b.board_member_id = j.board_member_id;
```

| board_id | board_name | organization_id | member_board_member_id | member_member_id | member_role_type |
|---|---|---|---|---|---|
| ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | Shell Oil | 1000 | 10207158 | temporary |
| ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | Shell Oil | 1001 | 10207158 | permanent |
| 168553 | Legacy Assessment | GlobalPlatform Inc. | 1001 | 10207158 | permanent |
| 168553 | Legacy Assessment | GlobalPlatform Inc. | 1002 | 25820616 | non-executive |
| 5006454 | Regional Survey A | Whatsapp Inc. | 1002 | 25820616 | non-executive |
| 5006454 | Regional Survey A | Whatsapp Inc. | 1003 | 2002007020250 | chairman |
| 1437585 | Seasonal Corridor | American Institutes for Research | 1003 | 2002007020250 | chairman |
| 1437585 | Seasonal Corridor | American Institutes for Research | 1000 | 10207158 | temporary |

The view `v_governance_board_board_member_detail` performs a three-way join across `governance_boards`, `board_members`, and `persons`, producing a row that combines the board's identity with the member's appointment details and personal profile. For the Compact Series board, row 1000 shows a temporary member (George Bernard Shaw) appointed on 2022-05-03, while for the Seasonal Corridor board, row 1003 shows a chairman (Susan Wagner) appointed on 2025-08-09. This view answers: "For each board, who are its members, what roles do they hold, and when were they appointed?"

**View `v_person_organization`**

```sql
CREATE VIEW v_person_organization AS
SELECT a.id, a.person_id, a.first_name, a.last_name, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM persons a JOIN organizations b ON a.organization_id = b.id;
```

| id | person_id | first_name | last_name | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1000 | George Bernard Shaw | Stephanie Collins | Paul Allen | 1 | 790471 | Extended Review |
| 1001 | Maria Rodriguez | Janice Johnston | Heather Beasley | 2 | 1717 | Pilot Initiative A |
| 1002 | Sarah Villanueva | Upal Saha | Audrey Taylor | 3 | 69437 | Baseline Model |
| 1003 | Susan Wagner | Katherine Snyder | Susan Wagner | 4 | m16 | Distributed Cluster |

The view `v_person_organization` joins `persons` to `organizations` on `organization_id`, producing a row that pairs each person with their affiliated organization. Person id 1000 (George Bernard Shaw) is linked to organization id 1 (Extended Review), while person id 1003 (Susan Wagner) is linked to organization id 4 (Distributed Cluster, an educational institution). This view answers: "Which organization is each person affiliated with?"

**View `v_person_academic_qualification`**

```sql
CREATE VIEW v_person_academic_qualification AS
SELECT a.id, a.person_id, a.first_name, a.last_name, b.qual_id AS qualification_qual_id, b.degree_type AS qualification_degree_type, b.field_of_study AS qualification_field_of_study
FROM persons a JOIN academic_qualifications b ON a.academic_qualification_qual_id = b.qual_id;
```

| id | person_id | first_name | last_name | qualification_qual_id | qualification_degree_type | qualification_field_of_study |
|---|---|---|---|---|---|---|
| 1000 | George Bernard Shaw | Stephanie Collins | Paul Allen | 2002007020190 | compact-degree-62 | legacy-field-25 |
| 1001 | Maria Rodriguez | Janice Johnston | Heather Beasley | 974947 | composite-degree-63 | compact-field-26 |
| 1002 | Sarah Villanueva | Upal Saha | Audrey Taylor | 4716397 | primary-degree-64 | composite-field-27 |
| 1003 | Susan Wagner | Katherine Snyder | Susan Wagner | PHR-98 | adaptive-degree-65 | primary-field-28 |

The view `v_person_academic_qualification` joins `persons` to `academic_qualifications` on the person's `academic_qualification_qual_id` matching the qualification's `qual_id`, producing a row that pairs each person with their educational credential. Person id 1000 holds qualification `2002007020190` (a compact-degree-62 in legacy-field-25 awarded by distributed-awarding-30 in year 38), while person id 1003 holds qualification `PHR-98` (an adaptive-degree-65 in primary-field-28 awarded by extended-awarding-33 in year 59). This view answers: "What academic qualification does each person hold?"

**View `v_person_governance_board`**

```sql
CREATE VIEW v_person_governance_board AS
SELECT a.id, a.person_id, a.first_name, a.last_name, b.board_id AS board_board_id, b.board_name AS board_board_name, b.organization_id AS board_organization_id
FROM persons a JOIN governance_boards b ON a.board_id = b.board_id;
```

| id | person_id | first_name | last_name | board_board_id | board_board_name | board_organization_id |
|---|---|---|---|---|---|---|
| 1000 | George Bernard Shaw | Stephanie Collins | Paul Allen | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | Shell Oil |
| 1001 | Maria Rodriguez | Janice Johnston | Heather Beasley | 168553 | Legacy Assessment | GlobalPlatform Inc. |
| 1002 | Sarah Villanueva | Upal Saha | Audrey Taylor | 5006454 | Regional Survey A | Whatsapp Inc. |
| 1003 | Susan Wagner | Katherine Snyder | Susan Wagner | 1437585 | Seasonal Corridor | American Institutes for Research |

The view `v_person_governance_board` joins `persons` to `governance_boards` on `board_id`, producing a row that pairs each person with the governance board they are associated with. Person id 1000 is linked to the Compact Series board (`ChIJH2V4UYBt5kcR5doeFwuU7Ns`), while person id 1002 is linked to the Regional Survey A board (`5006454`). This view answers: "Which governance board is each person associated with?"

**View `v_person_business_venture`**

```sql
CREATE VIEW v_person_business_venture AS
SELECT a.id, a.person_id, a.first_name, a.last_name, b.id AS venture_id, b.venture_id AS venture_venture_id, b.venture_name AS venture_venture_name
FROM persons a JOIN business_ventures b ON a.business_venture_id = b.id;
```

| id | person_id | first_name | last_name | venture_id | venture_venture_id | venture_venture_name |
|---|---|---|---|---|---|---|
| 1000 | George Bernard Shaw | Stephanie Collins | Paul Allen | 1000 | 1889765 | Integrated Programme A |
| 1001 | Maria Rodriguez | Janice Johnston | Heather Beasley | 1001 | 1996924 | Extended Standard |
| 1002 | Sarah Villanueva | Upal Saha | Audrey Taylor | 1002 | 1250194 | Pilot Framework |
| 1003 | Susan Wagner | Katherine Snyder | Susan Wagner | 1003 | 1450646 | Baseline Protocol D |

The view `v_person_business_venture` joins `persons` to `business_ventures` on `business_venture_id`, producing a row that pairs each person with their associated business venture. Person id 1000 is linked to venture id 1000 (Integrated Programme A, in seasonal-industry-35, operational status), while person id 1002 is linked to venture id 1002 (Pilot Framework, in legacy-industry-37, closed status). This view answers: "What business venture is each person associated with?"

**View `v_organization_person`**

```sql
CREATE VIEW v_organization_person AS
SELECT a.id, a.org_id, a.org_name, a.org_type, b.id AS person_id, b.person_id AS person_person_id, b.first_name AS person_first_name
FROM organizations a JOIN persons b ON a.person_id = b.id;
```

| id | org_id | org_name | org_type | person_id | person_person_id | person_first_name |
|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | local_government | 1000 | George Bernard Shaw | Stephanie Collins |
| 2 | 1717 | Pilot Initiative A | private_company | 1001 | Maria Rodriguez | Janice Johnston |
| 3 | 69437 | Baseline Model | public_company | 1002 | Sarah Villanueva | Upal Saha |
| 4 | m16 | Distributed Cluster | educational_institution | 1003 | Susan Wagner | Katherine Snyder |

The view `v_organization_person` joins `organizations` to `persons` on `person_id`, producing a row that pairs each organization with its affiliated person. Organization id 1 (Extended Review) is linked to person id 1000 (George Bernard Shaw), while organization id 4 (Distributed Cluster) is linked to person id 1003 (Susan Wagner). This view answers: "Which person is associated with each organization?"

**View `v_organization_business_venture`**

```sql
CREATE VIEW v_organization_business_venture AS
SELECT a.id, a.org_id, a.org_name, a.org_type, b.id AS venture_id, b.venture_id AS venture_venture_id, b.venture_name AS venture_venture_name
FROM organizations a JOIN business_ventures b ON a.business_venture_id = b.id;
```

| id | org_id | org_name | org_type | venture_id | venture_venture_id | venture_venture_name |
|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | local_government | 1000 | 1889765 | Integrated Programme A |
| 2 | 1717 | Pilot Initiative A | private_company | 1001 | 1996924 | Extended Standard |
| 3 | 69437 | Baseline Model | public_company | 1002 | 1250194 | Pilot Framework |
| 4 | m16 | Distributed Cluster | educational_institution | 1003 | 1450646 | Baseline Protocol D |

The view `v_organization_business_venture` joins `organizations` to `business_ventures` on `organization_id`, producing a row that pairs each organization with its associated business venture. Organization id 1 (Extended Review) is linked to venture id 1000 (Integrated Programme A), while organization id 3 (Baseline Model) is linked to venture id 1002 (Pilot Framework). This view answers: "What business venture is associated with each organization?"

**View `v_organization_governance_board`**

```sql
CREATE VIEW v_organization_governance_board AS
SELECT a.id, a.org_id, a.org_name, a.org_type, b.board_id AS board_board_id, b.board_name AS board_board_name, b.organization_id AS board_organization_id
FROM organizations a JOIN governance_boards b ON a.board_id = b.board_id;
```

| id | org_id | org_name | org_type | board_board_id | board_board_name | board_organization_id |
|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | local_government | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | Shell Oil |
| 2 | 1717 | Pilot Initiative A | private_company | 168553 | Legacy Assessment | GlobalPlatform Inc. |
| 3 | 69437 | Baseline Model | public_company | 5006454 | Regional Survey A | Whatsapp Inc. |
| 4 | m16 | Distributed Cluster | educational_institution | 1437585 | Seasonal Corridor | American Institutes for Research |

The view `v_organization_governance_board` joins `organizations` to `governance_boards` on `board_id`, producing a row that pairs each organization with its governance board. Organization id 1 (Extended Review) is linked to the Compact Series board (`ChIJH2V4UYBt5kcR5doeFwuU7Ns`), while organization id 2 (Pilot Initiative A) is linked to the Legacy Assessment board (`168553`). This view answers: "Which governance board is associated with each organization?"

**View `v_academic_qualification_person`**

```sql
CREATE VIEW v_academic_qualification_person AS
SELECT a.qual_id, a.degree_type, a.field_of_study, a.awarding_institution, b.id AS person_id, b.person_id AS person_person_id, b.first_name AS person_first_name
FROM academic_qualifications a JOIN persons b ON a.person_id = b.id;
```

| qual_id | degree_type | field_of_study | awarding_institution | person_id | person_person_id | person_first_name |
|---|---|---|---|---|---|---|
| 2002007020190 | compact-degree-62 | legacy-field-25 | distributed-awarding-30 | 1000 | George Bernard Shaw | Stephanie Collins |
| 974947 | composite-degree-63 | compact-field-26 | baseline-awarding-31 | 1001 | Maria Rodriguez | Janice Johnston |
| 4716397 | primary-degree-64 | composite-field-27 | pilot-awarding-32 | 1002 | Sarah Villanueva | Upal Saha |
| PHR-98 | adaptive-degree-65 | primary-field-28 | extended-awarding-33 | 1003 | Susan Wagner | Katherine Snyder |

The view `v_academic_qualification_person` joins `academic_qualifications` to `persons` on `person_id`, producing a row that pairs each qualification with its holder. Qualification `2002007020190` (compact-degree-62) is held by person id 1000 (George Bernard Shaw), while qualification `PHR-98` (adaptive-degree-65) is held by person id 1003 (Susan Wagner). This view answers: "Who holds each academic qualification?"

**View `v_academic_qualification_organization`**

```sql
CREATE VIEW v_academic_qualification_organization AS
SELECT a.qual_id, a.degree_type, a.field_of_study, a.awarding_institution, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM academic_qualifications a JOIN organizations b ON a.organization_id = b.id;
```

| qual_id | degree_type | field_of_study | awarding_institution | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 2002007020190 | compact-degree-62 | legacy-field-25 | distributed-awarding-30 | 1 | 790471 | Extended Review |
| 974947 | composite-degree-63 | compact-field-26 | baseline-awarding-31 | 2 | 1717 | Pilot Initiative A |
| 4716397 | primary-degree-64 | composite-field-27 | pilot-awarding-32 | 3 | 69437 | Baseline Model |
| PHR-98 | adaptive-degree-65 | primary-field-28 | extended-awarding-33 | 4 | m16 | Distributed Cluster |

The view `v_academic_qualification_organization` joins `academic_qualifications` to `organizations` on `organization_id`, producing a row that pairs each qualification with its organizational context. Qualification `2002007020190` is associated with organization id 1 (Extended Review), while qualification `4716397` is associated with organization id 3 (Baseline Model). This view answers: "Which organization is associated with each academic qualification?"

**View `v_business_venture_organization`**

```sql
CREATE VIEW v_business_venture_organization AS
SELECT a.id, a.venture_id, a.venture_name, a.industry_sector, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM business_ventures a JOIN organizations b ON a.organization_id = b.id;
```

| id | venture_id | venture_name | industry_sector | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1000 | 1889765 | Integrated Programme A | seasonal-industry-35 | 1 | 790471 | Extended Review |
| 1001 | 1996924 | Extended Standard | regional-industry-36 | 2 | 1717 | Pilot Initiative A |
| 1002 | 1250194 | Pilot Framework | legacy-industry-37 | 3 | 69437 | Baseline Model |
| 1003 | 1450646 | Baseline Protocol D | compact-industry-38 | 4 | m16 | Distributed Cluster |

The view `v_business_venture_organization` joins `business_ventures` to `organizations` on `organization_id`, producing a row that pairs each venture with its sponsoring organization. Venture id 1000 (Integrated Programme A) is sponsored by organization id 1 (Extended Review), while venture id 1003 (Baseline Protocol D) is sponsored by organization id 4 (Distributed Cluster). This view answers: "Which organization sponsors each business venture?"

**View `v_business_venture_person`**

```sql
CREATE VIEW v_business_venture_person AS
SELECT a.id, a.venture_id, a.venture_name, a.industry_sector, b.id AS person_id, b.person_id AS person_person_id, b.first_name AS person_first_name
FROM business_ventures a JOIN persons b ON a.person_id = b.id;
```

| id | venture_id | venture_name | industry_sector | person_id | person_person_id | person_first_name |
|---|---|---|---|---|---|---|
| 1000 | 1889765 | Integrated Programme A | seasonal-industry-35 | 1000 | George Bernard Shaw | Stephanie Collins |
| 1001 | 1996924 | Extended Standard | regional-industry-36 | 1001 | Maria Rodriguez | Janice Johnston |
| 1002 | 1250194 | Pilot Framework | legacy-industry-37 | 1002 | Sarah Villanueva | Upal Saha |
| 1003 | 1450646 | Baseline Protocol D | compact-industry-38 | 1003 | Susan Wagner | Katherine Snyder |

The view `v_business_venture_person` joins `business_ventures` to `persons` on `person_id`, producing a row that pairs each venture with its associated person. Venture id 1000 (Integrated Programme A) is associated with person id 1000 (George Bernard Shaw), while venture id 1003 (Baseline Protocol D) is associated with person id 1003 (Susan Wagner). This view answers: "Which person is associated with each business venture?"

**View `v_leadership_position_person`**

```sql
CREATE VIEW v_leadership_position_person AS
SELECT a.position_id, a.position_title, a.sector, a.start_date, b.id AS person_id, b.person_id AS person_person_id, b.first_name AS person_first_name
FROM leadership_positions a JOIN persons b ON a.person_id = b.id;
```

| position_id | position_title | sector | start_date | person_id | person_person_id | person_first_name |
|---|---|---|---|---|---|---|
| 14477856 | Extended Model | adaptive-sector-53 | 2022-09-05 | 1000 | George Bernard Shaw | Stephanie Collins |
| gd_acc_260002 | Pilot Cluster A | distributed-sector-54 | 2023-02-16 | 1001 | Maria Rodriguez | Janice Johnston |
| 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Review | baseline-sector-55 | 2024-07-27 | 1002 | Sarah Villanueva | Upal Saha |
| 82871 | Distributed Initiative | pilot-sector-56 | 2025-12-11 | 1003 | Susan Wagner | Katherine Snyder |

The view `v_leadership_position_person` joins `leadership_positions` to `board_members` (via `position_id`) and then to `persons`, producing a row that pairs each leadership position with the person who holds it. Position `gd_acc_260002` is held by person id 1001 (Maria Rodriguez), while position `82871` is held by person id 1003 (Susan Wagner). This view answers: "Which person holds each leadership position?"

**View `v_leadership_position_organization`**

```sql
CREATE VIEW v_leadership_position_organization AS
SELECT a.position_id, a.position_title, a.sector, a.start_date, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM leadership_positions a JOIN organizations b ON a.organization_id = b.id;
```

| position_id | position_title | sector | start_date | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 14477856 | Extended Model | adaptive-sector-53 | 2022-09-05 | 1 | 790471 | Extended Review |
| gd_acc_260002 | Pilot Cluster A | distributed-sector-54 | 2023-02-16 | 2 | 1717 | Pilot Initiative A |
| 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Review | baseline-sector-55 | 2024-07-27 | 3 | 69437 | Baseline Model |
| 82871 | Distributed Initiative | pilot-sector-56 | 2025-12-11 | 4 | m16 | Distributed Cluster |

The view `v_leadership_position_organization` joins `leadership_positions` to `board_members` (via `position_id`), then to `governance_boards` (via `board_id`), and finally to `organizations` (via `organization_id`), producing a row that pairs each leadership position with its organizational context. Position `gd_acc_260002` is associated with the Legacy Assessment board, which belongs to organization id 2 (Pilot Initiative A), while position `82871` is associated with the Seasonal Corridor board, which belongs to organization id 4 (Distributed Cluster). This view answers: "Which organization is associated with each leadership position?"

The schema as a whole embodies a clean separation between entity identity, association, and temporal metadata. The `board_members` table acts as the central hub, connecting persons to boards through a temporally-aware association that captures role type, appointment dates, and current membership status. The `boards_members` junction table further normalizes the many-to-many relationship between boards and members. The views provide a denormalized, fact-oriented interface over this normalized core, each answering a specific analytical question by joining the relevant tables. For instance, `v_governance_board_board_member_detail` reconstructs the full picture of board composition by joining boards, members, and persons, while `v_person_academic_qualification` reconstructs the educational background of each person. The foreign keys—`board_members.board_id` → `governance_boards.board_id`, `board_members.person_id` → `persons.id`, `board_members.position_id` → `leadership_positions`, `governance_boards.organization_id` → `organizations.id`, and so on—form a coherent web of referential integrity that ensures every association in the model is grounded in a valid entity. The result is a schema that faithfully represents the corporate governance domain while remaining efficiently queryable through its view layer.