## The Adoption Case Registry as a Normalized Relational Model

The adoption case registry captures the lifecycle of adult adoption proceedings: who petitions, who is adopted, which jurisdiction presides, and how contact details are distributed across the parties. The schema decomposes this domain into six base tables and seven derived views, each view materializing a specific domain fact by joining the normalized tables. The design follows a star-like topology centred on `adoption_cases`, with `adoption_petitioners` and `adult_adoptees` as sibling entity tables linked through shared social security numbers and foreign keys, while `contact_informations` and `informations_cases` form a many-to-many bridge between contact records and cases.

**Table `adoption_cases`**

| case_id | filing_date | status | jurisdiction | case_notes | petitioner_contact_person | nlf_rep | adoption_petitioner_social_security_number | adult_adoptee_id |
|---|---|---|---|---|---|---|---|---|
| 39800622 | 2023-02-09 | pending | regional-jurisdic-30 | compact-case-98 | Brandon Long | baseline-nlf-85 | SOC-2466 | 1 |
| 4891 | 2024-07-20 | under_review | legacy-jurisdic-31 | composite-case-99 | Stephanie Lawrence | pilot-nlf-86 | SOC-2467 | 2 |
| 17374813 | 2025-12-04 | approved | compact-jurisdic-32 | primary-case-100 | Mary Alvarez | extended-nlf-87 | SOC-2468 | 3 |
| state_uk_9 | 2022-05-15 | denied | composite-jurisdic-33 | adaptive-case-101 | Theodore Mcgrath | integrated-nlf-88 | SOC-2469 | 4 |

The `adoption_cases` table is the central fact table. Each row represents a single adoption proceeding identified by `case_id`, which carries heterogeneous identifiers such as `39800622`, `4891`, `17374813`, and the string key `state_uk_9`. The `filing_date` column records the date the petition was submitted (e.g. `2023-02-09`), and `status` tracks the current disposition with values `pending`, `under_review`, `approved`, and `denied`. The `jurisdiction` column stores a short jurisdiction label like `regional-jurisdic-30`, while `case_notes` holds a free-text descriptor such as `compact-case-98`. The column `petitioner_contact_person` names the individual handling the petition (e.g. `Brandon Long`), and `nlf_rep` records the non-lawyer facilitator (`baseline-nlf-85`). The column `adoption_petitioner_social_security_number` carries the petitioner's SSN (`SOC-2466`), and `adult_adoptee_id` links the case to the adoptee's row in `adult_adoptees`.

**Table `adoption_petitioners`**

| full_name | date_of_birth | social_security_number | street_address | city | state | zip_code | phone_number | email_address | date_moved_to_nevada | relationship_to_adoptee | duration_of_acquaintance | adult_adoptee_id | jurisdiction_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Theodore Mcgrath | 2025-04-02 | SOC-2466 | composite-street-15 | integrated-city-34 | distributed-state-84 | 69434 | PHO-2092 | primary-email-70 | 2023-02-12 | seasonal-relation-65 | compact-duration-44 | 1 | 1000 |
| Account Name | 2022-09-13 | SOC-2467 | primary-street-16 | seasonal-city-35 | baseline-state-85 | 13589 | PHO-2093 | adaptive-email-71 | 2024-07-23 | regional-relation-66 | composite-duration-45 | 2 | 1001 |
| Saipan International Airport | 2023-02-24 | SOC-2468 | adaptive-street-17 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | PHO-2094 | distributed-email-72 | 2025-12-07 | legacy-relation-67 | primary-duration-46 | 3 | 1002 |
| Norma Fisher | 2024-07-08 | SOC-2469 | distributed-street-18 | legacy-city-37 | extended-state-87 | 1250214 | PHO-2095 | baseline-email-73 | 2022-05-18 | compact-relation-68 | adaptive-duration-47 | 4 | 1003 |

The `adoption_petitioners` table stores the petitioner's personal and demographic attributes. Its primary key is the composite of `full_name` and `social_security_number`, though in practice `social_security_number` (e.g. `SOC-2466`) serves as the stable identifier. The table records the petitioner's date of birth (`2025-04-02`), full address (`composite-street-15`, `integrated-city-34`, `distributed-state-84`, `69434`), phone (`PHO-2092`), and email (`primary-email-70`). Additional columns capture the `date_moved_to_nevada` (`2023-02-12`), the `relationship_to_adoptee` (`seasonal-relation-65`), and `duration_of_acquaintance` (`compact-duration-44`). The foreign key `adult_adoptee_id` points to the adoptee's row, and `jurisdiction_id` (e.g. `1000`) references the `jurisdictions` table.

**Table `adult_adoptees`**

| id | full_name | date_of_birth | social_security_number | street_address | city | state | zip_code | phone_number | email_address | date_moved_to_nevada | birth_city_state | preferred_post_adoption_name | birth_mother_name | birth_father_name | adoption_petitioner_social_security_number | jurisdiction_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | 2025-04-02 | SOC-2466 | composite-street-15 | integrated-city-34 | distributed-state-84 | 69434 | PHO-2092 | primary-email-70 | 2023-02-12 | integrated-birth-16 | Extended Corridor | Composite Programme | Extended Review | SOC-2466 | 1000 |
| 2 | Account Name | 2022-09-13 | SOC-2467 | primary-street-16 | seasonal-city-35 | baseline-state-85 | 13589 | PHO-2093 | adaptive-email-71 | 2024-07-23 | seasonal-birth-17 | Pilot Series A | Compact Standard A | Pilot Initiative A | SOC-2467 | 1001 |
| 3 | Saipan International Airport | 2023-02-24 | SOC-2468 | adaptive-street-17 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | PHO-2094 | distributed-email-72 | 2025-12-07 | regional-birth-18 | Baseline Assessment | Legacy Framework | Baseline Model | SOC-2468 | 1002 |
| 4 | Norma Fisher | 2024-07-08 | SOC-2469 | distributed-street-18 | legacy-city-37 | extended-state-87 | 1250214 | PHO-2095 | baseline-email-73 | 2022-05-18 | legacy-birth-19 | Distributed Survey | Regional Protocol | Distributed Cluster | SOC-2469 | 1003 |

The `adult_adoptees` table mirrors the petitioner table's address and contact structure but adds birth-related fields. Its primary key is `id` (values `1` through `4`). Each row carries the adoptee's `full_name` (e.g. `Theodore Mcgrath`), `date_of_birth` (`2025-04-02`), `social_security_number` (`SOC-2466`), and full address. The columns `birth_city_state` (`integrated-birth-16`), `preferred_post_adoption_name` (`Extended Corridor`), `birth_mother_name` (`Composite Programme`), and `birth_father_name` (`Extended Review`) record the adoptee's birth history. The column `adoption_petitioner_social_security_number` (`SOC-2466`) creates a symmetric link back to the petitioner, and `jurisdiction_id` (`1000`) references the presiding court.

**Table `contact_informations`**

| contact_information_id | contact_person | street_address | cell_phone | city | state | zip_code | alternate_phone | email |
|---|---|---|---|---|---|---|---|---|
| 1 | Alyssa Chung | composite-street-15 | distributed-cell-72 | integrated-city-34 | distributed-state-84 | 69434 | integrated-alternat-58 | seasonal-email-11 |
| 2 | Brianna Mejia | primary-street-16 | baseline-cell-73 | seasonal-city-35 | baseline-state-85 | 13589 | seasonal-alternat-59 | regional-email-12 |
| 3 | Eric Schultz | adaptive-street-17 | pilot-cell-74 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | regional-alternat-60 | legacy-email-13 |
| 4 | Peter Montgomery | distributed-street-18 | extended-cell-75 | legacy-city-37 | extended-state-87 | 1250214 | legacy-alternat-61 | compact-email-14 |

The `contact_informations` table is a standalone directory of contact records, keyed by `contact_information_id` (`1` through `4`). Each row stores a `contact_person` (e.g. `Alyssa Chung`), address fields, a `cell_phone` (`distributed-cell-72`), an `alternate_phone` (`integrated-alternat-58`), and an `email` (`seasonal-email-11`). This table is not directly linked to any other table by a foreign key; instead, it is connected through the junction table `informations_cases`.

**Table `jurisdictions`**

| jurisdiction_id | state_code | state_name | court_system |
|---|---|---|---|
| 1000 | 17788643 | Composite Protocol | primary-court-34 |
| 1001 | 8350031 | Compact Programme A | adaptive-court-35 |
| 1002 | 790483 | Legacy Standard | distributed-court-36 |
| 1003 | 8387549 | Regional Framework | baseline-court-37 |

The `jurisdictions` table is a small lookup table with four rows. Its primary key is `jurisdiction_id` (`1000`–`1003`). Each row provides a `state_code` (e.g. `17788643`), a human-readable `state_name` (`Composite Protocol`), and a `court_system` identifier (`primary-court-34`). This table is referenced by `adoption_petitioners.jurisdiction_id` and `adult_adoptees.jurisdiction_id`.

**Table `informations_cases`**

| contact_information_id | case_id |
|---|---|
| 1 | 39800622 |
| 1 | 4891 |
| 2 | 4891 |
| 2 | 17374813 |
| 3 | 17374813 |
| 3 | state_uk_9 |
| 4 | state_uk_9 |
| 4 | 39800622 |

The `informations_cases` table is a junction (associative) table that resolves the many-to-many relationship between `contact_informations` and `adoption_cases`. Its two columns, `contact_information_id` and `case_id`, form a composite primary key. For example, contact record `1` (Alyssa Chung) is associated with cases `39800622` and `4891`, while contact record `4` (Peter Montgomery) is associated with `state_uk_9` and `39800622`. This design allows a single contact person to be linked to multiple cases and a single case to have multiple contacts.

The base tables above form the normalized core. The seven views materialize domain-specific join patterns that reconstruct meaningful facts from this normalized structure.

**View `adoption_case_adoption_petitioner_view`**

```sql
CREATE VIEW adoption_case_adoption_petitioner_view AS
SELECT a.case_id, a.filing_date, a.status, a.jurisdiction, b.full_name AS petitioner_full_name, b.date_of_birth AS petitioner_date_of_birth, b.social_security_number AS petitioner_social_security_number
FROM adoption_cases a JOIN adoption_petitioners b ON a.adoption_petitioner_social_security_number = b.social_security_number;
```

| case_id | filing_date | status | jurisdiction | petitioner_full_name | petitioner_date_of_birth | petitioner_social_security_number |
|---|---|---|---|---|---|---|
| 39800622 | 2023-02-09 | pending | regional-jurisdic-30 | Theodore Mcgrath | 2025-04-02 | SOC-2466 |
| 4891 | 2024-07-20 | under_review | legacy-jurisdic-31 | Account Name | 2022-09-13 | SOC-2467 |
| 17374813 | 2025-12-04 | approved | compact-jurisdic-32 | Saipan International Airport | 2023-02-24 | SOC-2468 |
| state_uk_9 | 2022-05-15 | denied | composite-jurisdic-33 | Norma Fisher | 2024-07-08 | SOC-2469 |

This view joins `adoption_cases` to `adoption_petitioners` on the social security number, producing a row that combines the case-level metadata with the petitioner's full demographic profile. For the row with `case_id = 39800622`, the view yields `filing_date = 2023-02-09`, `status = pending`, `petitioner_contact_person = Brandon Long`, and the petitioner's `full_name = Theodore Mcgrath` with `social_security_number = SOC-2466`. The join reconstructs the fact "which petitioner is associated with which case" by aligning `adoption_cases.adoption_petitioner_social_security_number` with `adoption_petitioners.social_security_number`.

**View `adoption_case_adult_adoptee_view`**

```sql
CREATE VIEW adoption_case_adult_adoptee_view AS
SELECT a.case_id, a.filing_date, a.status, a.jurisdiction, b.id AS adoptee_id, b.full_name AS adoptee_full_name, b.date_of_birth AS adoptee_date_of_birth
FROM adoption_cases a JOIN adult_adoptees b ON a.adult_adoptee_id = b.id;
```

| case_id | filing_date | status | jurisdiction | adoptee_id | adoptee_full_name | adoptee_date_of_birth |
|---|---|---|---|---|---|---|
| 39800622 | 2023-02-09 | pending | regional-jurisdic-30 | 1 | Theodore Mcgrath | 2025-04-02 |
| 4891 | 2024-07-20 | under_review | legacy-jurisdic-31 | 2 | Account Name | 2022-09-13 |
| 17374813 | 2025-12-04 | approved | compact-jurisdic-32 | 3 | Saipan International Airport | 2023-02-24 |
| state_uk_9 | 2022-05-15 | denied | composite-jurisdic-33 | 4 | Norma Fisher | 2024-07-08 |

This view joins `adoption_cases` to `adult_adoptees` on `adoption_cases.adult_adoptee_id = adult_adoptees.id`. It answers the question "who is being adopted in this case?" For `case_id = 4891` (filed `2024-07-20`, status `under_review`), the view returns `adult_adoptee_id = 2`, `full_name = Account Name`, `preferred_post_adoption_name = Pilot Series A`, and `birth_mother_name = Compact Standard A`. The join reconstructs the adoption pairing by linking the case's `adult_adoptee_id` to the adoptee's primary key.

**View `adoption_petitioner_adult_adoptee_view`**

```sql
CREATE VIEW adoption_petitioner_adult_adoptee_view AS
SELECT a.full_name, a.date_of_birth, a.social_security_number, a.street_address, b.id AS adoptee_id, b.full_name AS adoptee_full_name, b.date_of_birth AS adoptee_date_of_birth
FROM adoption_petitioners a JOIN adult_adoptees b ON a.adult_adoptee_id = b.id;
```

| full_name | date_of_birth | social_security_number | street_address | adoptee_id | adoptee_full_name | adoptee_date_of_birth |
|---|---|---|---|---|---|---|
| Theodore Mcgrath | 2025-04-02 | SOC-2466 | composite-street-15 | 1 | Theodore Mcgrath | 2025-04-02 |
| Account Name | 2022-09-13 | SOC-2467 | primary-street-16 | 2 | Account Name | 2022-09-13 |
| Saipan International Airport | 2023-02-24 | SOC-2468 | adaptive-street-17 | 3 | Saipan International Airport | 2023-02-24 |
| Norma Fisher | 2024-07-08 | SOC-2469 | distributed-street-18 | 4 | Norma Fisher | 2024-07-08 |

This view joins `adoption_petitioners` to `adult_adoptees` on `adoption_petitioners.adult_adoptee_id = adult_adoptees.id`. It reconstructs the petitioner–adoptee relationship directly, bypassing the case table. For `adult_adoptee_id = 1`, the view yields the petitioner `Theodore Mcgrath` (DOB `2025-04-02`, SSN `SOC-2466`) and the adoptee `Theodore Mcgrath` (DOB `2025-04-02`, SSN `SOC-2466`, preferred name `Extended Corridor`). The symmetric relationship is also visible in the `adult_adoptees` table's `adoption_petitioner_social_security_number` column, which echoes the petitioner's SSN.

**View `adoption_petitioner_jurisdiction_view`**

```sql
CREATE VIEW adoption_petitioner_jurisdiction_view AS
SELECT a.full_name, a.date_of_birth, a.social_security_number, a.street_address, b.jurisdiction_id AS jurisdiction_jurisdiction_id, b.state_code AS jurisdiction_state_code, b.state_name AS jurisdiction_state_name
FROM adoption_petitioners a JOIN jurisdictions b ON a.jurisdiction_id = b.jurisdiction_id;
```

| full_name | date_of_birth | social_security_number | street_address | jurisdiction_jurisdiction_id | jurisdiction_state_code | jurisdiction_state_name |
|---|---|---|---|---|---|---|
| Theodore Mcgrath | 2025-04-02 | SOC-2466 | composite-street-15 | 1000 | 17788643 | Composite Protocol |
| Account Name | 2022-09-13 | SOC-2467 | primary-street-16 | 1001 | 8350031 | Compact Programme A |
| Saipan International Airport | 2023-02-24 | SOC-2468 | adaptive-street-17 | 1002 | 790483 | Legacy Standard |
| Norma Fisher | 2024-07-08 | SOC-2469 | distributed-street-18 | 1003 | 8387549 | Regional Framework |

This view joins `adoption_petitioners` to `jurisdictions` on `adoption_petitioners.jurisdiction_id = jurisdictions.jurisdiction_id`. It answers "which court system presides over this petitioner?" For `jurisdiction_id = 1000`, the view returns `state_name = Composite Protocol` and `court_system = primary-court-34`. The petitioner `Theodore Mcgrath` (SSN `SOC-2466`) is thus associated with the `Composite Protocol` jurisdiction.

**View `adult_adoptee_adoption_petitioner_view`**

```sql
CREATE VIEW adult_adoptee_adoption_petitioner_view AS
SELECT a.id, a.full_name, a.date_of_birth, a.social_security_number, b.full_name AS petitioner_full_name, b.date_of_birth AS petitioner_date_of_birth, b.social_security_number AS petitioner_social_security_number
FROM adult_adoptees a JOIN adoption_petitioners b ON a.adoption_petitioner_social_security_number = b.social_security_number;
```

| id | full_name | date_of_birth | social_security_number | petitioner_full_name | petitioner_date_of_birth | petitioner_social_security_number |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | 2025-04-02 | SOC-2466 | Theodore Mcgrath | 2025-04-02 | SOC-2466 |
| 2 | Account Name | 2022-09-13 | SOC-2467 | Account Name | 2022-09-13 | SOC-2467 |
| 3 | Saipan International Airport | 2023-02-24 | SOC-2468 | Saipan International Airport | 2023-02-24 | SOC-2468 |
| 4 | Norma Fisher | 2024-07-08 | SOC-2469 | Norma Fisher | 2024-07-08 | SOC-2469 |

This view joins `adult_adoptees` to `adoption_petitioners` on `adult_adoptees.id = adoption_petitioners.adult_adoptee_id`. It is the inverse of `adoption_petitioner_adult_adoptee_view` and answers "which petitioner is linked to this adoptee?" For `adult_adoptee_id = 3`, the view yields the adoptee `Saipan International Airport` (preferred name `Baseline Assessment`) and the petitioner `Saipan International Airport` (SSN `SOC-2468`). The join confirms the bidirectional linkage: the adoptee's `adoption_petitioner_social_security_number` (`SOC-2468`) matches the petitioner's `social_security_number`.

**View `adult_adoptee_jurisdiction_view`**

```sql
CREATE VIEW adult_adoptee_jurisdiction_view AS
SELECT a.id, a.full_name, a.date_of_birth, a.social_security_number, b.jurisdiction_id AS jurisdiction_jurisdiction_id, b.state_code AS jurisdiction_state_code, b.state_name AS jurisdiction_state_name
FROM adult_adoptees a JOIN jurisdictions b ON a.jurisdiction_id = b.jurisdiction_id;
```

| id | full_name | date_of_birth | social_security_number | jurisdiction_jurisdiction_id | jurisdiction_state_code | jurisdiction_state_name |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | 2025-04-02 | SOC-2466 | 1000 | 17788643 | Composite Protocol |
| 2 | Account Name | 2022-09-13 | SOC-2467 | 1001 | 8350031 | Compact Programme A |
| 3 | Saipan International Airport | 2023-02-24 | SOC-2468 | 1002 | 790483 | Legacy Standard |
| 4 | Norma Fisher | 2024-07-08 | SOC-2469 | 1003 | 8387549 | Regional Framework |

This view joins `adult_adoptees` to `jurisdictions` on `adult_adoptees.jurisdiction_id = jurisdictions.jurisdiction_id`. It answers "which court system is associated with this adoptee?" For `adult_adoptee_id = 4`, the view returns `full_name = Norma Fisher`, `preferred_post_adoption_name = Distributed Survey`, `state_name = Regional Framework`, and `court_system = baseline-court-37`. The jurisdiction lookup is resolved through `jurisdiction_id = 1003`.

**View `contact_information_adoption_case_detail_view`**

```sql
CREATE VIEW contact_information_adoption_case_detail_view AS
SELECT a.contact_information_id, a.contact_person, a.street_address, b.case_id AS case_case_id, b.filing_date AS case_filing_date, b.status AS case_status
FROM contact_informations a
  JOIN informations_cases j ON j.contact_information_id = a.contact_information_id
  JOIN adoption_cases b ON b.case_id = j.case_id;
```

| contact_information_id | contact_person | street_address | case_case_id | case_filing_date | case_status |
|---|---|---|---|---|---|
| 1 | Alyssa Chung | composite-street-15 | 39800622 | 2023-02-09 | pending |
| 1 | Alyssa Chung | composite-street-15 | 4891 | 2024-07-20 | under_review |
| 2 | Brianna Mejia | primary-street-16 | 4891 | 2024-07-20 | under_review |
| 2 | Brianna Mejia | primary-street-16 | 17374813 | 2025-12-04 | approved |
| 3 | Eric Schultz | adaptive-street-17 | 17374813 | 2025-12-04 | approved |
| 3 | Eric Schultz | adaptive-street-17 | state_uk_9 | 2022-05-15 | denied |
| 4 | Peter Montgomery | distributed-street-18 | state_uk_9 | 2022-05-15 | denied |
| 4 | Peter Montgomery | distributed-street-18 | 39800622 | 2023-02-09 | pending |

This view joins `contact_informations` to `adoption_cases` through the junction table `informations_cases`, reconstructing the many-to-many relationship. It answers "which contact persons are associated with which adoption cases?" For `case_id = 39800622`, the view returns two contact rows: `contact_person = Alyssa Chung` (cell `distributed-cell-72`, email `seasonal-email-11`) and `contact_person = Peter Montgomery` (cell `extended-cell-75`, email `compact-email-14`). For `case_id = 4891`, it returns `Alyssa Chung` and `Brianna Mejia` (cell `baseline-cell-73`). The join path is `contact_informations.contact_information_id = informations_cases.contact_information_id = adoption_cases.case_id` via `informations_cases.case_id`, materializing the fact that multiple contacts can serve a single case and a single contact can serve multiple cases.

The schema as a whole achieves third normal form for the core entities while using the junction table `informations_cases` to handle the M:N relationship between contacts and cases. The seven views provide denormalized projections that answer the most common domain queries without requiring the application layer to perform joins manually. Each view is a deterministic reconstruction of a domain fact from the normalized base tables, and the foreign-key relationships—`adoption_cases.adult_adoptee_id → adult_adoptees.id`, `adoption_petitioners.adult_adoptee_id → adult_adoptees.id`, `adoption_petitioners.jurisdiction_id → jurisdictions.jurisdiction_id`, `adult_adoptees.jurisdiction_id → jurisdictions.jurisdiction_id`, and the `informations_cases` bridge—ensure referential integrity across the entire adoption case registry.