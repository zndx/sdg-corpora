The credit union domain captures the interlocking relationships between financial cooperatives, their leadership, the individuals who populate those roles, and the educational and award credentials that contextualize their professional trajectories. At the core of the model sit eight base tables that normalize the domain into entity types—credit unions, executive roles, persons, educational institutions, degree programs, awards, organizations, and scholarship funds—each carrying a primary key and a set of attributes that describe the entity in isolation. Foreign keys and self-referential links then stitch these entities into a coherent graph, and a suite of twelve views materializes the most common join paths so that analysts can query domain facts without writing joins by hand.

**Table `cred_credit_unions`**

| id | identifier | legal_name | founding_date | headquarters_city | headquarters_state | member_eligibility_criteria | regulatory_status | executive_role_id | award_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Adaptive Model | 2023-06-24 | seasonal-headquar-83 | compact-headquar-74 | regional-member-66 | NCRUC | 1 | 1000 |
| 2 | IDE-2091 | Primary Cluster | 2024-11-08 | regional-headquar-84 | composite-headquar-75 | legacy-member-67 | NCUA | 2 | 1001 |
| 3 | IDE-2096 | Composite Review D | 2025-04-19 | legacy-headquar-85 | primary-headquar-76 | compact-member-68 | NCRUC | 3 | 1002 |
| 4 | IDE-2101 | Compact Initiative | 2022-09-03 | compact-headquar-86 | adaptive-headquar-77 | composite-member-69 | NCUA | 4 | 1003 |

The `cred_credit_unions` table anchors the cooperative side of the domain. Each row represents a single credit union identified by a surrogate `id` and a business-friendly `identifier` such as `IDE-2086` or `IDE-2101`. The `legal_name` column carries human-readable labels like *Adaptive Model* and *Primary Cluster D*, while `founding_date` records the calendar date the union was established—for instance, `2023-06-24` for the first row. Geographic presence is captured through `headquarters_city` and `headquarters_state`, whose values are coded identifiers such as `seasonal-headquar-83` and `compact-headquar-74`. Operational policy is described by `member_eligibility_criteria` (e.g., `regional-member-66`) and `regulatory_status`, which alternates between `NCRUC` and `NCUA`. Two foreign keys, `executive_role_id` and `award_id`, link each credit union to its current executive role and to an award, respectively; in the sample data these reference `1` and `1000` in the first row, `2` and `1001` in the second, and so on through `4` and `1003`.

**Table `cred_executive_roles`**

| executive_role_id | role_title | appointment_date | termination_date | reporting_to | compensation_band | is_current | person_id | credit_union_id | previously_held_executive_role_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Distributed Standard | 2022-05-03 | 2022-09-11 | integrated-reportin-82 | legacy-compensa-79 | true | 1 | 1 | 1 | 2025-01-01 00:14:00 |
| 2 | Adaptive Framework D | 2023-10-14 | 2023-02-22 | seasonal-reportin-83 | compact-compensa-80 | false | 2 | 2 | 2 | 2025-02-06 03:14:00 |
| 3 | Primary Protocol | 2024-03-25 | 2024-07-06 | regional-reportin-84 | composite-compensa-81 | true | 3 | 3 | 3 | 2025-03-11 06:14:00 |
| 4 | Composite Programme | 2025-08-09 | 2025-12-17 | legacy-reportin-85 | primary-compensa-82 | false | 4 | 4 | 4 | 2025-04-16 09:14:00 |

Executive roles form the bridge between organizations and people. The `cred_executive_roles` table uses `executive_role_id` as its primary key and stores the `role_title`—*Distributed Standard*, *Adaptive Framework D*, *Primary Protocol*, *Composite Programme*—alongside temporal metadata: `appointment_date` and `termination_date` delimit the tenure, while `created_at` records when the row was inserted. The `reporting_to` column holds a coded identifier for the reporting chain, `compensation_band` stores a salary band such as `legacy-compensa-79`, and `is_current` is a boolean flag indicating whether the role is still active. Two foreign keys anchor the role to the organizational and personal dimensions: `credit_union_id` points to `cred_credit_unions.id`, and `person_id` points to `cred_persons.id`. A self-referential foreign key, `previously_held_executive_role_id`, allows a role to reference another role in the same table, enabling career progression to be modelled within the fragment shown.

**Table `cred_persons`**

| id | first_name | last_name | date_of_birth | residence_city | residence_state | marital_status | number_of_dependents | executive_role_id | educational_institution_id | award_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Stephanie Collins | Paul Allen | 2025-04-02 | seasonal-residenc-65 | integrated-residenc-94 | seasonal-marital-83 | 14 | 1 | 1 | 1000 |
| 2 | Janice Johnston | Heather Beasley | 2022-09-13 | regional-residenc-66 | seasonal-residenc-95 | regional-marital-84 | 20 | 2 | 2 | 1001 |
| 3 | Upal Saha | Audrey Taylor | 2023-02-24 | legacy-residenc-67 | regional-residenc-96 | legacy-marital-85 | 26 | 3 | 3 | 1002 |
| 4 | Katherine Snyder | Susan Wagner | 2024-07-08 | compact-residenc-68 | legacy-residenc-97 | compact-marital-86 | 32 | 4 | 4 | 1003 |

The `cred_persons` table stores demographic and personal information for every individual in the domain. The surrogate `id` serves as the primary key, while `first_name` and `last_name` carry values such as *Stephanie Collins* and *Paul Allen*. Date of birth, residence city and state, marital status, and the number of dependents are captured in `date_of_birth`, `residence_city`, `residence_state`, `marital_status`, and `number_of_dependents` respectively. The sample data shows `number_of_dependents` ranging from `14` to `32`. Three foreign keys connect persons to the rest of the schema: `executive_role_id` links to `cred_executive_roles.executive_role_id`, `educational_institution_id` links to `cred_educational_institutions.educational_institution_id`, and `award_id` links to `cred_awards.id`.

**Table `cred_educational_institutions`**

| educational_institution_id | institution_name | location_city | location_state | accreditation_status | founding_year | person_id | degree_program_id |
|---|---|---|---|---|---|---|---|
| 1 | Extended Corridor | seasonal-location-23 | composite-location-93 | regional-accredit-66 | 43 | 1 | 1 |
| 2 | Pilot Series A | regional-location-24 | primary-location-94 | legacy-accredit-67 | 48 | 2 | 2 |
| 3 | Baseline Assessment | legacy-location-25 | adaptive-location-95 | compact-accredit-68 | 53 | 3 | 3 |
| 4 | Distributed Survey | compact-location-26 | distributed-location-96 | composite-accredit-69 | 58 | 4 | 4 |

Educational institutions are represented in `cred_educational_institutions`, keyed by `educational_institution_id`. The `institution_name` column holds names such as *Extended Corridor* and *Pilot Series A*, while `location_city` and `location_state` store geographic codes like `seasonal-location-23`. The `accreditation_status` column carries values such as `regional-accredit-66`, and `founding_year` stores an integer (e.g., `43`). A `person_id` foreign key links the institution to a person, and `degree_program_id` links it to a degree program.

**Table `cred_degree_programs`**

| degree_program_id | program_name | degree_type | duration_years | field_of_study | educational_institution_id | person_id |
|---|---|---|---|---|---|---|
| 1 | Extended Review | compact-degree-62 | 14 | legacy-field-25 | 1 | 1 |
| 2 | Pilot Initiative A | composite-degree-63 | 18 | compact-field-26 | 2 | 2 |
| 3 | Baseline Model | primary-degree-64 | 22 | composite-field-27 | 3 | 3 |
| 4 | Distributed Cluster | adaptive-degree-65 | 26 | primary-field-28 | 4 | 4 |

The `cred_degree_programs` table describes academic programs. Its primary key is `degree_program_id`, and the `program_name` column carries values like *Extended Review* and *Pilot Initiative A*. The `degree_type` and `field_of_study` columns store coded descriptors such as `compact-degree-62` and `legacy-field-25`. The `duration_years` column holds integers ranging from `14` to `26` in the sample data. Foreign keys `educational_institution_id` and `person_id` connect each program to its host institution and to a person.

**Table `cred_awards`**

| id | award_name | award_year | presented_by | citation_text | is_lifetime_achievement | person_id | organization_id |
|---|---|---|---|---|---|---|---|
| 1000 | Primary Review A | 36 | baseline-presente-13 | pilot-citation-80 | false | 1 | 1 |
| 1001 | Composite Initiative | 43 | pilot-presente-14 | extended-citation-81 | true | 2 | 2 |
| 1002 | Compact Model | 50 | extended-presente-15 | integrated-citation-82 | false | 3 | 3 |
| 1003 | Legacy Cluster D | 57 | integrated-presente-16 | seasonal-citation-83 | true | 4 | 4 |

Awards are captured in `cred_awards`, keyed by `id`. The `award_name` column carries names such as *Primary Review A* and *Legacy Cluster D*, while `award_year` stores an integer (e.g., `36`, `43`, `50`, `57`). The `presented_by` column holds coded identifiers like `baseline-presente-13`, and `citation_text` stores strings such as `pilot-citation-80`. The boolean `is_lifetime_achievement` distinguishes lifetime awards from regular ones. Foreign keys `person_id` and `organization_id` link each award to the recipient and to the presenting organization.

**Table `cred_organizations`**

| organization_id | organization_name | organization_type | founding_year | headquarters_location | award_id | scholarship_fund_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | Staples Inc. | Gulf Oil | 43 | composite-headquar-63 | 1000 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Oscar Health Inc. | FSG Social Impact Advisors | 48 | primary-headquar-64 | 1001 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Atlantic Richfield | McDonnell Douglas | 53 | adaptive-headquar-65 | 1002 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Port Loko | Alliant Energy Corp | 58 | distributed-headquar-66 | 1003 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `cred_organizations` table represents the broader organizational entities that present awards and sponsor scholarship funds. Although the sample data does not display its columns explicitly, the table is referenced by `cred_awards.organization_id` and by the scholarship fund tables, forming the hub through which awards and funds are associated with sponsoring bodies.

**Table `cred_scholarship_funds`**

| id | fund_name | established_year | target_beneficiaries | funding_source | organization_id | person_id | awarded_to_person_id |
|---|---|---|---|---|---|---|---|
| 1 | Seasonal Programme | 10 | integrated-target-76 | baseline-funding-73 | 1 | 1 | 1 |
| 2 | Integrated Standard | 16 | seasonal-target-77 | pilot-funding-74 | 2 | 2 | 2 |
| 3 | Extended Framework D | 22 | regional-target-78 | extended-funding-75 | 3 | 3 | 3 |
| 4 | Pilot Protocol | 28 | legacy-target-79 | integrated-funding-76 | 4 | 4 | 4 |

Scholarship funds are stored in `cred_scholarship_funds`, which links organizations to the financial resources they administer and to the persons who benefit from them. The table's foreign keys connect back to `cred_organizations` and `cred_persons`, completing the graph of relationships that the views will traverse.

With the base tables defined, the materialized views reconstruct domain facts by joining the normalized tables along their foreign-key edges. Each view answers a specific analytical question.

**View `v_credit_union_executive_role`**

```sql
CREATE VIEW v_credit_union_executive_role AS
SELECT a.id, a.identifier, a.legal_name, a.founding_date, b.executive_role_id AS role_executive_role_id, b.role_title AS role_role_title, b.appointment_date AS role_appointment_date
FROM cred_credit_unions a JOIN cred_executive_roles b ON a.executive_role_id = b.executive_role_id;
```

| id | identifier | legal_name | founding_date | role_executive_role_id | role_role_title | role_appointment_date |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Adaptive Model | 2023-06-24 | 1 | Distributed Standard | 2022-05-03 |
| 2 | IDE-2091 | Primary Cluster | 2024-11-08 | 2 | Adaptive Framework D | 2023-10-14 |
| 3 | IDE-2096 | Composite Review D | 2025-04-19 | 3 | Primary Protocol | 2024-03-25 |
| 4 | IDE-2101 | Compact Initiative | 2022-09-03 | 4 | Composite Programme | 2025-08-09 |

The view `v_credit_union_executive_role` joins `cred_credit_unions` to `cred_executive_roles` on `executive_role_id`, answering the question: *Which executive role is associated with each credit union?* In the sample data, the credit union *Adaptive Model* (`IDE-2086`) is linked to the executive role *Distributed Standard*, while *Primary Cluster* (`IDE-2091`) maps to *Adaptive Framework D*.

**View `v_credit_union_award`**

```sql
CREATE VIEW v_credit_union_award AS
SELECT a.id, a.identifier, a.legal_name, a.founding_date, b.id AS award_id, b.award_name AS award_award_name, b.award_year AS award_award_year
FROM cred_credit_unions a JOIN cred_awards b ON a.award_id = b.id;
```

| id | identifier | legal_name | founding_date | award_id | award_award_name | award_award_year |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Adaptive Model | 2023-06-24 | 1000 | Primary Review A | 36 |
| 2 | IDE-2091 | Primary Cluster | 2024-11-08 | 1001 | Composite Initiative | 43 |
| 3 | IDE-2096 | Composite Review D | 2025-04-19 | 1002 | Compact Model | 50 |
| 4 | IDE-2101 | Compact Initiative | 2022-09-03 | 1003 | Legacy Cluster D | 57 |

`v_credit_union_award` joins `cred_credit_unions` to `cred_awards` on `award_id`, answering: *Which award is associated with each credit union?* The first row shows *Adaptive Model* linked to the award *Primary Review A* (`id 1000`), and *Compact Initiative* (`IDE-2101`) linked to *Legacy Cluster D* (`id 1003`).

**View `v_executive_role_person`**

```sql
CREATE VIEW v_executive_role_person AS
SELECT a.executive_role_id, a.role_title, a.appointment_date, a.termination_date, b.id AS person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM cred_executive_roles a JOIN cred_persons b ON a.person_id = b.id;
```

| executive_role_id | role_title | appointment_date | termination_date | person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1 | Distributed Standard | 2022-05-03 | 2022-09-11 | 1 | Stephanie Collins | Paul Allen |
| 2 | Adaptive Framework D | 2023-10-14 | 2023-02-22 | 2 | Janice Johnston | Heather Beasley |
| 3 | Primary Protocol | 2024-03-25 | 2024-07-06 | 3 | Upal Saha | Audrey Taylor |
| 4 | Composite Programme | 2025-08-09 | 2025-12-17 | 4 | Katherine Snyder | Susan Wagner |

The view `v_executive_role_person` joins `cred_executive_roles` to `cred_persons` on `person_id`, answering: *Which person holds which executive role?* The sample shows the role *Distributed Standard* held by *Stephanie Collins Paul Allen*, and *Primary Protocol* held by *Upal Saha Audrey Taylor*.

**View `v_executive_role_credit_union`**

```sql
CREATE VIEW v_executive_role_credit_union AS
SELECT a.executive_role_id, a.role_title, a.appointment_date, a.termination_date, b.id AS union_id, b.identifier AS union_identifier, b.legal_name AS union_legal_name
FROM cred_executive_roles a JOIN cred_credit_unions b ON a.credit_union_id = b.id;
```

| executive_role_id | role_title | appointment_date | termination_date | union_id | union_identifier | union_legal_name |
|---|---|---|---|---|---|---|
| 1 | Distributed Standard | 2022-05-03 | 2022-09-11 | 1 | IDE-2086 | Adaptive Model |
| 2 | Adaptive Framework D | 2023-10-14 | 2023-02-22 | 2 | IDE-2091 | Primary Cluster |
| 3 | Primary Protocol | 2024-03-25 | 2024-07-06 | 3 | IDE-2096 | Composite Review D |
| 4 | Composite Programme | 2025-08-09 | 2025-12-17 | 4 | IDE-2101 | Compact Initiative |

`v_executive_role_credit_union` joins `cred_executive_roles` to `cred_credit_unions` on `credit_union_id`, answering: *Which credit union employs each executive role?* The role *Adaptive Framework D* is associated with the credit union *Primary Cluster* (`IDE-2091`), and *Composite Programme* with *Compact Initiative* (`IDE-2101`).

**View `v_executive_role_executive_role`**

```sql
CREATE VIEW v_executive_role_executive_role AS
SELECT a.executive_role_id, a.role_title, a.appointment_date, a.termination_date, b.executive_role_id AS role_executive_role_id, b.role_title AS role_role_title, b.appointment_date AS role_appointment_date
FROM cred_executive_roles a JOIN cred_executive_roles b ON a.previously_held_executive_role_id = b.executive_role_id;
```

| executive_role_id | role_title | appointment_date | termination_date | role_executive_role_id | role_role_title | role_appointment_date |
|---|---|---|---|---|---|---|
| 1 | Distributed Standard | 2022-05-03 | 2022-09-11 | 1 | Distributed Standard | 2022-05-03 |
| 2 | Adaptive Framework D | 2023-10-14 | 2023-02-22 | 2 | Adaptive Framework D | 2023-10-14 |
| 3 | Primary Protocol | 2024-03-25 | 2024-07-06 | 3 | Primary Protocol | 2024-03-25 |
| 4 | Composite Programme | 2025-08-09 | 2025-12-17 | 4 | Composite Programme | 2025-08-09 |

`v_executive_role_executive_role` performs a self-join on `cred_executive_roles` using the `previously_held_executive_role_id` foreign key, answering: *Which executive role succeeded another?* In the sample, each role references itself as its predecessor (`previously_held_executive_role_id` equals `executive_role_id`), indicating a self-referential career path where the role is its own prior iteration.

**View `v_person_executive_role`**

```sql
CREATE VIEW v_person_executive_role AS
SELECT a.id, a.first_name, a.last_name, a.date_of_birth, b.executive_role_id AS role_executive_role_id, b.role_title AS role_role_title, b.appointment_date AS role_appointment_date
FROM cred_persons a JOIN cred_executive_roles b ON a.executive_role_id = b.executive_role_id;
```

| id | first_name | last_name | date_of_birth | role_executive_role_id | role_role_title | role_appointment_date |
|---|---|---|---|---|---|---|
| 1 | Stephanie Collins | Paul Allen | 2025-04-02 | 1 | Distributed Standard | 2022-05-03 |
| 2 | Janice Johnston | Heather Beasley | 2022-09-13 | 2 | Adaptive Framework D | 2023-10-14 |
| 3 | Upal Saha | Audrey Taylor | 2023-02-24 | 3 | Primary Protocol | 2024-03-25 |
| 4 | Katherine Snyder | Susan Wagner | 2024-07-08 | 4 | Composite Programme | 2025-08-09 |

`v_person_executive_role` joins `cred_persons` to `cred_executive_roles` on `executive_role_id`, answering: *Which executive role does each person hold?* The person *Stephanie Collins Paul Allen* (`id 1`) holds the role *Distributed Standard* (`executive_role_id 1`), while *Katherine Snyder Susan Wagner* (`id 4`) holds *Composite Programme* (`executive_role_id 4`).

**View `v_person_educational_institution`**

```sql
CREATE VIEW v_person_educational_institution AS
SELECT a.id, a.first_name, a.last_name, a.date_of_birth, b.educational_institution_id AS institution_educational_institution_id, b.institution_name AS institution_institution_name, b.location_city AS institution_location_city
FROM cred_persons a JOIN cred_educational_institutions b ON a.educational_institution_id = b.educational_institution_id;
```

| id | first_name | last_name | date_of_birth | institution_educational_institution_id | institution_institution_name | institution_location_city |
|---|---|---|---|---|---|---|
| 1 | Stephanie Collins | Paul Allen | 2025-04-02 | 1 | Extended Corridor | seasonal-location-23 |
| 2 | Janice Johnston | Heather Beasley | 2022-09-13 | 2 | Pilot Series A | regional-location-24 |
| 3 | Upal Saha | Audrey Taylor | 2023-02-24 | 3 | Baseline Assessment | legacy-location-25 |
| 4 | Katherine Snyder | Susan Wagner | 2024-07-08 | 4 | Distributed Survey | compact-location-26 |

`v_person_educational_institution` joins `cred_persons` to `cred_educational_institutions` on `educational_institution_id`, answering: *Which educational institution is associated with each person?* *Stephanie Collins Paul Allen* is linked to *Extended Corridor* (`educational_institution_id 1`), and *Janice Johnston Heather Beasley* to *Pilot Series A* (`educational_institution_id 2`).

**View `v_person_award`**

```sql
CREATE VIEW v_person_award AS
SELECT a.id, a.first_name, a.last_name, a.date_of_birth, b.id AS award_id, b.award_name AS award_award_name, b.award_year AS award_award_year
FROM cred_persons a JOIN cred_awards b ON a.award_id = b.id;
```

| id | first_name | last_name | date_of_birth | award_id | award_award_name | award_award_year |
|---|---|---|---|---|---|---|
| 1 | Stephanie Collins | Paul Allen | 2025-04-02 | 1000 | Primary Review A | 36 |
| 2 | Janice Johnston | Heather Beasley | 2022-09-13 | 1001 | Composite Initiative | 43 |
| 3 | Upal Saha | Audrey Taylor | 2023-02-24 | 1002 | Compact Model | 50 |
| 4 | Katherine Snyder | Susan Wagner | 2024-07-08 | 1003 | Legacy Cluster D | 57 |

`v_person_award` joins `cred_persons` to `cred_awards` on `award_id`, answering: *Which award has each person received?* *Stephanie Collins Paul Allen* received *Primary Review A* (`id 1000`), and *Upal Saha Audrey Taylor* received *Compact Model* (`id 1002`).

**View `v_educational_institution_person`**

```sql
CREATE VIEW v_educational_institution_person AS
SELECT a.educational_institution_id, a.institution_name, a.location_city, a.location_state, b.id AS person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM cred_educational_institutions a JOIN cred_persons b ON a.person_id = b.id;
```

| educational_institution_id | institution_name | location_city | location_state | person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1 | Extended Corridor | seasonal-location-23 | composite-location-93 | 1 | Stephanie Collins | Paul Allen |
| 2 | Pilot Series A | regional-location-24 | primary-location-94 | 2 | Janice Johnston | Heather Beasley |
| 3 | Baseline Assessment | legacy-location-25 | adaptive-location-95 | 3 | Upal Saha | Audrey Taylor |
| 4 | Distributed Survey | compact-location-26 | distributed-location-96 | 4 | Katherine Snyder | Susan Wagner |

`v_educational_institution_person` joins `cred_educational_institutions` to `cred_persons` on `person_id`, answering: *Which person is associated with each educational institution?* *Extended Corridor* (`educational_institution_id 1`) is linked to person `id 1` (*Stephanie Collins Paul Allen*), and *Baseline Assessment* (`educational_institution_id 3`) to person `id 3` (*Upal Saha Audrey Taylor*).

**View `v_educational_institution_degree_program`**

```sql
CREATE VIEW v_educational_institution_degree_program AS
SELECT a.educational_institution_id, a.institution_name, a.location_city, a.location_state, b.degree_program_id AS program_degree_program_id, b.program_name AS program_program_name, b.degree_type AS program_degree_type
FROM cred_educational_institutions a JOIN cred_degree_programs b ON a.degree_program_id = b.degree_program_id;
```

| educational_institution_id | institution_name | location_city | location_state | program_degree_program_id | program_program_name | program_degree_type |
|---|---|---|---|---|---|---|
| 1 | Extended Corridor | seasonal-location-23 | composite-location-93 | 1 | Extended Review | compact-degree-62 |
| 2 | Pilot Series A | regional-location-24 | primary-location-94 | 2 | Pilot Initiative A | composite-degree-63 |
| 3 | Baseline Assessment | legacy-location-25 | adaptive-location-95 | 3 | Baseline Model | primary-degree-64 |
| 4 | Distributed Survey | compact-location-26 | distributed-location-96 | 4 | Distributed Cluster | adaptive-degree-65 |

`v_educational_institution_degree_program` joins `cred_educational_institutions` to `cred_degree_programs` on `degree_program_id`, answering: *Which degree program is offered by each educational institution?* *Extended Corridor* offers *Extended Review* (`degree_program_id 1`), and *Distributed Survey* offers *Distributed Cluster* (`degree_program_id 4`).

**View `v_degree_program_educational_institution`**

```sql
CREATE VIEW v_degree_program_educational_institution AS
SELECT a.degree_program_id, a.program_name, a.degree_type, a.duration_years, b.educational_institution_id AS institution_educational_institution_id, b.institution_name AS institution_institution_name, b.location_city AS institution_location_city
FROM cred_degree_programs a JOIN cred_educational_institutions b ON a.educational_institution_id = b.educational_institution_id;
```

| degree_program_id | program_name | degree_type | duration_years | institution_educational_institution_id | institution_institution_name | institution_location_city |
|---|---|---|---|---|---|---|
| 1 | Extended Review | compact-degree-62 | 14 | 1 | Extended Corridor | seasonal-location-23 |
| 2 | Pilot Initiative A | composite-degree-63 | 18 | 2 | Pilot Series A | regional-location-24 |
| 3 | Baseline Model | primary-degree-64 | 22 | 3 | Baseline Assessment | legacy-location-25 |
| 4 | Distributed Cluster | adaptive-degree-65 | 26 | 4 | Distributed Survey | compact-location-26 |

`v_degree_program_educational_institution` joins `cred_degree_programs` to `cred_educational_institutions` on `educational_institution_id`, answering: *Which educational institution hosts each degree program?* The program *Extended Review* is hosted by *Extended Corridor* (`educational_institution_id 1`), and *Baseline Model* by *Baseline Assessment* (`educational_institution_id 3`).

**View `v_degree_program_person`**

```sql
CREATE VIEW v_degree_program_person AS
SELECT a.degree_program_id, a.program_name, a.degree_type, a.duration_years, b.id AS person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM cred_degree_programs a JOIN cred_persons b ON a.person_id = b.id;
```

| degree_program_id | program_name | degree_type | duration_years | person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1 | Extended Review | compact-degree-62 | 14 | 1 | Stephanie Collins | Paul Allen |
| 2 | Pilot Initiative A | composite-degree-63 | 18 | 2 | Janice Johnston | Heather Beasley |
| 3 | Baseline Model | primary-degree-64 | 22 | 3 | Upal Saha | Audrey Taylor |
| 4 | Distributed Cluster | adaptive-degree-65 | 26 | 4 | Katherine Snyder | Susan Wagner |

`v_degree_program_person` joins `cred_degree_programs` to `cred_persons` on `person_id`, answering: *Which person is associated with each degree program?* *Extended Review* (`degree_program_id 1`) is linked to person `id 1` (*Stephanie Collins Paul Allen*), and *Distributed Cluster* (`degree_program_id 4`) to person `id 4` (*Katherine Snyder Susan Wagner*).

**View `v_award_person`**

```sql
CREATE VIEW v_award_person AS
SELECT a.id, a.award_name, a.award_year, a.presented_by, b.id AS person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM cred_awards a JOIN cred_persons b ON a.person_id = b.id;
```

| id | award_name | award_year | presented_by | person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1000 | Primary Review A | 36 | baseline-presente-13 | 1 | Stephanie Collins | Paul Allen |
| 1001 | Composite Initiative | 43 | pilot-presente-14 | 2 | Janice Johnston | Heather Beasley |
| 1002 | Compact Model | 50 | extended-presente-15 | 3 | Upal Saha | Audrey Taylor |
| 1003 | Legacy Cluster D | 57 | integrated-presente-16 | 4 | Katherine Snyder | Susan Wagner |

`v_award_person` joins `cred_awards` to `cred_persons` on `person_id`, answering: *Which person received each award?* The award *Primary Review A* (`id 1000`) was received by person `id 1` (*Stephanie Collins Paul Allen*), and *Legacy Cluster D* (`id 1003`) by person `id 4` (*Katherine Snyder Susan Wagner*).

**View `v_award_organization`**

```sql
CREATE VIEW v_award_organization AS
SELECT a.id, a.award_name, a.award_year, a.presented_by, b.organization_id AS organization_organization_id, b.organization_name AS organization_organization_name, b.organization_type AS organization_organization_type
FROM cred_awards a JOIN cred_organizations b ON a.organization_id = b.organization_id;
```

| id | award_name | award_year | presented_by | organization_organization_id | organization_organization_name | organization_organization_type |
|---|---|---|---|---|---|---|
| 1000 | Primary Review A | 36 | baseline-presente-13 | 1 | Staples Inc. | Gulf Oil |
| 1001 | Composite Initiative | 43 | pilot-presente-14 | 2 | Oscar Health Inc. | FSG Social Impact Advisors |
| 1002 | Compact Model | 50 | extended-presente-15 | 3 | Atlantic Richfield | McDonnell Douglas |
| 1003 | Legacy Cluster D | 57 | integrated-presente-16 | 4 | Port Loko | Alliant Energy Corp |

`v_award_organization` joins `cred_awards` to `cred_organizations` on `organization_id`, answering: *Which organization presented each award?* The award *Primary Review A* was presented by organization `id 1`, and *Composite Initiative* (`id 1001`) by organization `id 2`.

**View `v_organization_award`**

```sql
CREATE VIEW v_organization_award AS
SELECT a.organization_id, a.organization_name, a.organization_type, a.founding_year, b.id AS award_id, b.award_name AS award_award_name, b.award_year AS award_award_year
FROM cred_organizations a JOIN cred_awards b ON a.award_id = b.id;
```

| organization_id | organization_name | organization_type | founding_year | award_id | award_award_name | award_award_year |
|---|---|---|---|---|---|---|
| 1 | Staples Inc. | Gulf Oil | 43 | 1000 | Primary Review A | 36 |
| 2 | Oscar Health Inc. | FSG Social Impact Advisors | 48 | 1001 | Composite Initiative | 43 |
| 3 | Atlantic Richfield | McDonnell Douglas | 53 | 1002 | Compact Model | 50 |
| 4 | Port Loko | Alliant Energy Corp | 58 | 1003 | Legacy Cluster D | 57 |

`v_organization_award` joins `cred_organizations` to `cred_awards` on `organization_id`, answering: *Which awards has each organization presented?* Organization `id 1` presented *Primary Review A* (`id 1000`), and organization `id 4` presented *Legacy Cluster D* (`id 1003`).

**View `v_organization_scholarship_fund`**

```sql
CREATE VIEW v_organization_scholarship_fund AS
SELECT a.organization_id, a.organization_name, a.organization_type, a.founding_year, b.id AS fund_id, b.fund_name AS fund_fund_name, b.established_year AS fund_established_year
FROM cred_organizations a JOIN cred_scholarship_funds b ON a.scholarship_fund_id = b.id;
```

| organization_id | organization_name | organization_type | founding_year | fund_id | fund_fund_name | fund_established_year |
|---|---|---|---|---|---|---|
| 1 | Staples Inc. | Gulf Oil | 43 | 1 | Seasonal Programme | 10 |
| 2 | Oscar Health Inc. | FSG Social Impact Advisors | 48 | 2 | Integrated Standard | 16 |
| 3 | Atlantic Richfield | McDonnell Douglas | 53 | 3 | Extended Framework D | 22 |
| 4 | Port Loko | Alliant Energy Corp | 58 | 4 | Pilot Protocol | 28 |

`v_organization_scholarship_fund` joins `cred_organizations` to `cred_scholarship_funds` on the organization foreign key, answering: *Which scholarship funds are administered by each organization?* This view materializes the sponsorship relationship, connecting organizational entities to the financial resources they manage.

**View `v_scholarship_fund_organization`**

```sql
CREATE VIEW v_scholarship_fund_organization AS
SELECT a.id, a.fund_name, a.established_year, a.target_beneficiaries, b.organization_id AS organization_organization_id, b.organization_name AS organization_organization_name, b.organization_type AS organization_organization_type
FROM cred_scholarship_funds a JOIN cred_organizations b ON a.organization_id = b.organization_id;
```

| id | fund_name | established_year | target_beneficiaries | organization_organization_id | organization_organization_name | organization_organization_type |
|---|---|---|---|---|---|---|
| 1 | Seasonal Programme | 10 | integrated-target-76 | 1 | Staples Inc. | Gulf Oil |
| 2 | Integrated Standard | 16 | seasonal-target-77 | 2 | Oscar Health Inc. | FSG Social Impact Advisors |
| 3 | Extended Framework D | 22 | regional-target-78 | 3 | Atlantic Richfield | McDonnell Douglas |
| 4 | Pilot Protocol | 28 | legacy-target-79 | 4 | Port Loko | Alliant Energy Corp |

`v_scholarship_fund_organization` joins `cred_scholarship_funds` to `cred_organizations` on the organization foreign key, answering: *Which organization sponsors each scholarship fund?* This is the inverse of the previous view, presenting the fund-centric perspective on the sponsorship relationship.

**View `v_scholarship_fund_person`**

```sql
CREATE VIEW v_scholarship_fund_person AS
SELECT a.id, a.fund_name, a.established_year, a.target_beneficiaries, b.id AS person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM cred_scholarship_funds a JOIN cred_persons b ON a.person_id = b.id;
```

| id | fund_name | established_year | target_beneficiaries | person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1 | Seasonal Programme | 10 | integrated-target-76 | 1 | Stephanie Collins | Paul Allen |
| 2 | Integrated Standard | 16 | seasonal-target-77 | 2 | Janice Johnston | Heather Beasley |
| 3 | Extended Framework D | 22 | regional-target-78 | 3 | Upal Saha | Audrey Taylor |
| 4 | Pilot Protocol | 28 | legacy-target-79 | 4 | Katherine Snyder | Susan Wagner |

`v_scholarship_fund_person` joins `cred_scholarship_funds` to `cred_persons` on the person foreign key, answering: *Which persons benefit from each scholarship fund?* This view completes the chain from organizational sponsor through fund to individual recipient, allowing analysts to trace the flow of financial support from institution to person.

The schema as a whole models the credit union domain as a set of normalized entities connected by well-defined foreign-key relationships. Credit unions are linked to executive roles and awards; executive roles connect organizations to people; persons are tied to educational institutions, degree programs, and awards; awards are presented by organizations; and scholarship funds bridge organizations and persons. The twelve views materialize the most common join paths, allowing analysts to answer questions about role assignments, award recipients, educational affiliations, and fund sponsorship without manually writing joins. The normalization reduces redundancy while the views restore the denormalized facts that domain users need, striking a balance between storage efficiency and query convenience that is characteristic of mature relational designs.