## Adult Adoption Proceedings: A Reference Guide

Adult adoption proceedings represent a formal legal mechanism through which one individual petitions a court to establish a parent-child relationship with another adult. Unlike child adoption, which centers on the welfare of minors, adult adoption typically serves purposes ranging from honoring longstanding familial bonds to addressing inheritance and healthcare decision-making needs. The records in this system capture every facet of the proceeding—from the initial filing through jurisdictional assignment, representative involvement, and the final disposition of the case. Each adoption case is a self-contained legal matter, anchored by a unique case identifier and a filing date that establishes the procedural timeline.

**Table `adoption_cases`**

| id | case_identifier | filing_date | jurisdiction_code | case_status | court_docket_number | adoption_petitioner_id | adult_to_be_adopted_social_security_number | n_l_f_representative_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | CAS-2099 | 2023-02-09 | 5917299 | pending | COU-2632 | 1 | SOC-2466 | 1 |
| 1001 | CAS-2100 | 2024-07-20 | id_25 | under_review | COU-2637 | 2 | SOC-2467 | 2 |
| 1002 | CAS-2101 | 2025-12-04 | 7731856 | approved | COU-2642 | 3 | SOC-2468 | 3 |
| 1003 | CAS-2102 | 2022-05-15 | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | denied | COU-2647 | 4 | SOC-2469 | 4 |

The `adoption_cases` table serves as the central ledger for all proceedings. Each row represents a single case, identified by an internal integer `id` and a human-readable `case_identifier` such as CAS-2099 or CAS-2100. The `filing_date` records when the petition was submitted to the court, while `jurisdiction_code` designates the geographic or administrative jurisdiction under which the case falls—values range from numeric codes like 5917299 to UUID-style identifiers such as 7c692762-8fcd-11eb-924d-9cd76263cbd0. The `case_status` column tracks the procedural state, with observed values including pending, under_review, approved, and denied. A `court_docket_number` provides the court's own reference for the matter, and three foreign-key columns link the case to its `adoption_petitioner_id`, the `adult_to_be_adopted_social_security_number`, and the `n_l_f_representative_id`.

The petitioner who initiates the adoption is recorded in the `adoption_petitioners` table. This table holds the full legal name of the petitioner, their date of birth, social security number, and the date they established residency relevant to the proceeding. The `relationship_to_adult` field describes the nature of the connection between petitioner and the adult being adopted, using coded values such as regional-relation-42, legacy-relation-43, compact-relation-44, and composite-relation-45. Similarly, `duration_of_acquaintance` captures how long the parties have known each other, with values like compact-duration-44, composite-duration-45, primary-duration-46, and adaptive-duration-47. Each petitioner record also stores a `residential_address_id` and an `adoption_case_id`, creating a direct link back to the case and to the address table.

**Table `adoption_petitioners`**

| id | full_legal_name | date_of_birth | social_security_number | residency_start_date | relationship_to_adult | duration_of_acquaintance | residential_address_id | adoption_case_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Integrated Framework A | 2025-04-02 | SOC-2466 | 2023-06-17 | regional-relation-42 | compact-duration-44 | 1 | 1000 |
| 2 | Extended Protocol | 2022-09-13 | SOC-2467 | 2024-11-01 | legacy-relation-43 | composite-duration-45 | 2 | 1001 |
| 3 | Pilot Programme | 2023-02-24 | SOC-2468 | 2025-04-12 | compact-relation-44 | primary-duration-46 | 3 | 1002 |
| 4 | Baseline Standard D | 2024-07-08 | SOC-2469 | 2022-09-23 | composite-relation-45 | adaptive-duration-47 | 4 | 1003 |

The adult who is the subject of the adoption is recorded in the `adult_to_be_adopteds` table. This table mirrors much of the petitioner's structure but includes additional fields relevant to the adoptee: `birth_city`, `birth_state`, and `preferred_post_adoption_name`, which reflects the name the adult wishes to assume after the adoption is finalized. For example, the adult whose current legal name is Integrated Framework A prefers the post-adoption name Extended Corridor, while the adult known as Extended Protocol wishes to become Pilot Series A. The table also links to a `person_id` and a `has_birth_father_person_id`, which reference entries in the `persons` table—records that may document biological parentage or other personal identifiers.

**Table `adult_to_be_adopteds`**

| full_legal_name | date_of_birth | social_security_number | residency_start_date | birth_city | birth_state | preferred_post_adoption_name | residential_address_id | adoption_case_id | person_id | has_birth_father_person_id |
|---|---|---|---|---|---|---|---|---|---|---|
| Integrated Framework A | 2025-04-02 | SOC-2466 | 2023-06-17 | baseline-birth-73 | compact-birth-98 | Extended Corridor | 1 | 1000 | 1 | 1 |
| Extended Protocol | 2022-09-13 | SOC-2467 | 2024-11-01 | pilot-birth-74 | composite-birth-99 | Pilot Series A | 2 | 1001 | 2 | 2 |
| Pilot Programme | 2023-02-24 | SOC-2468 | 2025-04-12 | extended-birth-75 | primary-birth-100 | Baseline Assessment | 3 | 1002 | 3 | 3 |
| Baseline Standard D | 2024-07-08 | SOC-2469 | 2022-09-23 | integrated-birth-76 | adaptive-birth-101 | Distributed Survey | 4 | 1003 | 4 | 4 |

Residential addresses for both petitioners and adoptees are maintained in the `residential_addresses` table. Each address record contains a `street_address`, `city`, `state_code`, and `zip_code`. The `state_code` values in this dataset are notable for their format: they appear as numeric codes such as 17788643 and 8350031, or as UUID-style strings like 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0. The `zip_code` field similarly contains values ranging from simple integers like 69434 to longer numeric strings such as 1250214. Each address row is associated with a specific petitioner via `adoption_petitioner_id` and with a specific adult via `adult_to_be_adopted_social_security_number`, enabling the system to track where both parties reside.

**Table `residential_addresses`**

| residential_address_id | street_address | city | state_code | zip_code | adoption_petitioner_id | adult_to_be_adopted_social_security_number |
|---|---|---|---|---|---|---|
| 1 | composite-street-15 | integrated-city-34 | 17788643 | 69434 | 1 | SOC-2466 |
| 2 | primary-street-16 | seasonal-city-35 | 8350031 | 13589 | 2 | SOC-2467 |
| 3 | adaptive-street-17 | regional-city-36 | 790483 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | 3 | SOC-2468 |
| 4 | distributed-street-18 | legacy-city-37 | 8387549 | 1250214 | 4 | SOC-2469 |

Contact methods for petitioners and adoptees are stored in the `contact_methods` table. Each record specifies a `contact_value`, which in this dataset contains names such as Jennifer Summers, Friedrich Nietzsche, Theodore Mcgrath, and Tasha Rodriguez—these serve as the contact identifiers for the respective communication channel. The `contact_type` field indicates whether the method is a cell_phone, alternate_phone, or email. The `is_primary` flag marks the preferred contact method for each party. Contact records are linked to petitioners through `adoption_petitioner_id` and to adoptees through `adult_to_be_adopted_social_security_number`.

**Table `contact_methods`**

| contact_method_id | contact_value | contact_type | is_primary | adoption_petitioner_id | adult_to_be_adopted_social_security_number |
|---|---|---|---|---|---|
| 1 | Jennifer Summers | cell_phone | true | 1 | SOC-2466 |
| 2 | Friedrich Nietzsche | alternate_phone | false | 2 | SOC-2467 |
| 3 | Theodore Mcgrath | email | true | 3 | SOC-2468 |
| 4 | Tasha Rodriguez | cell_phone | false | 4 | SOC-2469 |

Non-profit or organizational representatives involved in adoption cases are tracked in the `n_l_f_representatives` table. Each representative has a `rep_identifier` (such as REP-2164 or REP-2166), a `rep_name` (for example, Pilot Protocol, Baseline Programme, Distributed Standard A, or Adaptive Framework), and an `adoption_case_id` linking them to the specific case they are associated with. These representatives may provide guidance, advocacy, or administrative support during the adoption process.

**Table `n_l_f_representatives`**

| n_l_f_representative_id | rep_identifier | rep_name | adoption_case_id |
|---|---|---|---|
| 1 | REP-2164 | Pilot Protocol | 1000 |
| 2 | REP-2166 | Baseline Programme | 1001 |
| 3 | REP-2168 | Distributed Standard A | 1002 |
| 4 | REP-2170 | Adaptive Framework | 1003 |

The `persons` table serves as a master directory of individuals referenced across the adoption records. While the specific columns are not enumerated here, the table is linked to the `adult_to_be_adopteds` table through the `person_id` and `has_birth_father_person_id` fields, suggesting it contains biographical or identity information that supplements the adoption-specific records.

**Table `persons`**

| id | full_name | adult_to_be_adopted_social_security_number | is_birth_father_of_adult_to_be_adopted_social_security_number | created_at | updated_at |
|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | SOC-2466 | SOC-2466 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Account Name | SOC-2467 | SOC-2467 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Saipan International Airport | SOC-2468 | SOC-2468 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Norma Fisher | SOC-2469 | SOC-2469 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The junction tables `petitioners_methods` and `adopteds_methods` provide many-to-many relationships between petitioners (or adoptees) and their contact methods, allowing a single individual to have multiple contact entries of various types.

**Table `petitioners_methods`**

| adoption_petitioner_id | contact_method_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `adopteds_methods`**

| adult_to_be_adopted_social_security_number | contact_method_id |
|---|---|
| SOC-2466 | 1 |
| SOC-2466 | 2 |
| SOC-2467 | 2 |
| SOC-2467 | 3 |
| SOC-2468 | 3 |
| SOC-2468 | 4 |
| SOC-2469 | 4 |
| SOC-2469 | 1 |

### Case and Petitioner Relationships

The view `v_adoption_case_adoption_petitioner` joins the adoption case with its petitioner, answering the question of which petitioner is associated with which case and under what status. For instance, case CAS-2099 (id 1000) is filed by petitioner id 1, who holds the legal name Integrated Framework A, and the case is currently pending. Case CAS-2101 (id 1002) is filed by petitioner id 3, named Pilot Programme, and has reached the approved status.

**View `v_adoption_case_adoption_petitioner`**

```sql
CREATE VIEW v_adoption_case_adoption_petitioner AS
SELECT a.id, a.case_identifier, a.filing_date, a.jurisdiction_code, b.id AS petitioner_id, b.full_legal_name AS petitioner_full_legal_name, b.date_of_birth AS petitioner_date_of_birth
FROM adoption_cases a JOIN adoption_petitioners b ON a.adoption_petitioner_id = b.id;
```

| id | case_identifier | filing_date | jurisdiction_code | petitioner_id | petitioner_full_legal_name | petitioner_date_of_birth |
|---|---|---|---|---|---|---|
| 1000 | CAS-2099 | 2023-02-09 | 5917299 | 1 | Integrated Framework A | 2025-04-02 |
| 1001 | CAS-2100 | 2024-07-20 | id_25 | 2 | Extended Protocol | 2022-09-13 |
| 1002 | CAS-2101 | 2025-12-04 | 7731856 | 3 | Pilot Programme | 2023-02-24 |
| 1003 | CAS-2102 | 2022-05-15 | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | 4 | Baseline Standard D | 2024-07-08 |

The view `v_adoption_petitioner_adoption_case` presents the same relationship from the petitioner's perspective, confirming that petitioner Integrated Framework A (id 1) is linked to case CAS-2099, while petitioner Baseline Standard D (id 4) is linked to case CAS-2102, which carries a denied status.

**View `v_adoption_petitioner_adoption_case`**

```sql
CREATE VIEW v_adoption_petitioner_adoption_case AS
SELECT a.id, a.full_legal_name, a.date_of_birth, a.social_security_number, b.id AS case_id, b.case_identifier AS case_case_identifier, b.filing_date AS case_filing_date
FROM adoption_petitioners a JOIN adoption_cases b ON a.adoption_case_id = b.id;
```

| id | full_legal_name | date_of_birth | social_security_number | case_id | case_case_identifier | case_filing_date |
|---|---|---|---|---|---|---|
| 1 | Integrated Framework A | 2025-04-02 | SOC-2466 | 1000 | CAS-2099 | 2023-02-09 |
| 2 | Extended Protocol | 2022-09-13 | SOC-2467 | 1001 | CAS-2100 | 2024-07-20 |
| 3 | Pilot Programme | 2023-02-24 | SOC-2468 | 1002 | CAS-2101 | 2025-12-04 |
| 4 | Baseline Standard D | 2024-07-08 | SOC-2469 | 1003 | CAS-2102 | 2022-05-15 |

The view `v_residential_address_adoption_petitioner` connects residential addresses to their corresponding petitioners, revealing that petitioner id 1 resides at composite-street-15 in integrated-city-34, while petitioner id 2 resides at primary-street-16 in seasonal-city-35.

**View `v_residential_address_adoption_petitioner`**

```sql
CREATE VIEW v_residential_address_adoption_petitioner AS
SELECT a.residential_address_id, a.street_address, a.city, a.state_code, b.id AS petitioner_id, b.full_legal_name AS petitioner_full_legal_name, b.date_of_birth AS petitioner_date_of_birth
FROM residential_addresses a JOIN adoption_petitioners b ON a.adoption_petitioner_id = b.id;
```

| residential_address_id | street_address | city | state_code | petitioner_id | petitioner_full_legal_name | petitioner_date_of_birth |
|---|---|---|---|---|---|---|
| 1 | composite-street-15 | integrated-city-34 | 17788643 | 1 | Integrated Framework A | 2025-04-02 |
| 2 | primary-street-16 | seasonal-city-35 | 8350031 | 2 | Extended Protocol | 2022-09-13 |
| 3 | adaptive-street-17 | regional-city-36 | 790483 | 3 | Pilot Programme | 2023-02-24 |
| 4 | distributed-street-18 | legacy-city-37 | 8387549 | 4 | Baseline Standard D | 2024-07-08 |

### Case and Adult Adoptee Relationships

The view `v_adoption_case_adult_to_be_adopted` joins the adoption case with the adult being adopted, providing a consolidated view of the case alongside the adoptee's details. Case CAS-2099 involves the adult whose current legal name is Integrated Framework A and who prefers the post-adoption name Extended Corridor. Case CAS-2102 involves the adult named Pilot Programme, who prefers the post-adoption name Baseline Assessment.

**View `v_adoption_case_adult_to_be_adopted`**

```sql
CREATE VIEW v_adoption_case_adult_to_be_adopted AS
SELECT a.id, a.case_identifier, a.filing_date, a.jurisdiction_code, b.full_legal_name AS adopted_full_legal_name, b.date_of_birth AS adopted_date_of_birth, b.social_security_number AS adopted_social_security_number
FROM adoption_cases a JOIN adult_to_be_adopteds b ON a.adult_to_be_adopted_social_security_number = b.social_security_number;
```

| id | case_identifier | filing_date | jurisdiction_code | adopted_full_legal_name | adopted_date_of_birth | adopted_social_security_number |
|---|---|---|---|---|---|---|
| 1000 | CAS-2099 | 2023-02-09 | 5917299 | Integrated Framework A | 2025-04-02 | SOC-2466 |
| 1001 | CAS-2100 | 2024-07-20 | id_25 | Extended Protocol | 2022-09-13 | SOC-2467 |
| 1002 | CAS-2101 | 2025-12-04 | 7731856 | Pilot Programme | 2023-02-24 | SOC-2468 |
| 1003 | CAS-2102 | 2022-05-15 | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | Baseline Standard D | 2024-07-08 | SOC-2469 |

The view `v_adult_to_be_adopted_adoption_case` presents the same relationship from the adoptee's perspective, confirming that the adult Integrated Framework A is the subject of case CAS-2099, and the adult Baseline Standard D is the subject of case CAS-2102.

**View `v_adult_to_be_adopted_adoption_case`**

```sql
CREATE VIEW v_adult_to_be_adopted_adoption_case AS
SELECT a.full_legal_name, a.date_of_birth, a.social_security_number, a.residency_start_date, b.id AS case_id, b.case_identifier AS case_case_identifier, b.filing_date AS case_filing_date
FROM adult_to_be_adopteds a JOIN adoption_cases b ON a.adoption_case_id = b.id;
```

| full_legal_name | date_of_birth | social_security_number | residency_start_date | case_id | case_case_identifier | case_filing_date |
|---|---|---|---|---|---|---|
| Integrated Framework A | 2025-04-02 | SOC-2466 | 2023-06-17 | 1000 | CAS-2099 | 2023-02-09 |
| Extended Protocol | 2022-09-13 | SOC-2467 | 2024-11-01 | 1001 | CAS-2100 | 2024-07-20 |
| Pilot Programme | 2023-02-24 | SOC-2468 | 2025-04-12 | 1002 | CAS-2101 | 2025-12-04 |
| Baseline Standard D | 2024-07-08 | SOC-2469 | 2022-09-23 | 1003 | CAS-2102 | 2022-05-15 |

The view `v_adult_to_be_adopted_person` links the adult to be adopted with their corresponding person record, establishing the identity linkage between the adoption-specific record and the broader person directory.

**View `v_adult_to_be_adopted_person`**

```sql
CREATE VIEW v_adult_to_be_adopted_person AS
SELECT a.full_legal_name, a.date_of_birth, a.social_security_number, a.residency_start_date, b.id AS person_id, b.full_name AS person_full_name, b.adult_to_be_adopted_social_security_number AS person_adult_to_be_adopted_social_security_number
FROM adult_to_be_adopteds a JOIN persons b ON a.person_id = b.id;
```

| full_legal_name | date_of_birth | social_security_number | residency_start_date | person_id | person_full_name | person_adult_to_be_adopted_social_security_number |
|---|---|---|---|---|---|---|
| Integrated Framework A | 2025-04-02 | SOC-2466 | 2023-06-17 | 1 | Theodore Mcgrath | SOC-2466 |
| Extended Protocol | 2022-09-13 | SOC-2467 | 2024-11-01 | 2 | Account Name | SOC-2467 |
| Pilot Programme | 2023-02-24 | SOC-2468 | 2025-04-12 | 3 | Saipan International Airport | SOC-2468 |
| Baseline Standard D | 2024-07-08 | SOC-2469 | 2022-09-23 | 4 | Norma Fisher | SOC-2469 |

### Address and Contact Detail Views

The view `v_adoption_petitioner_residential_address` joins the petitioner with their residential address, showing that petitioner Integrated Framework A (id 1) is associated with the address at composite-street-15, integrated-city-34, state code 17788643, zip code 69434. Petitioner Extended Protocol (id 2) is associated with primary-street-16 in seasonal-city-35.

**View `v_adoption_petitioner_residential_address`**

```sql
CREATE VIEW v_adoption_petitioner_residential_address AS
SELECT a.id, a.full_legal_name, a.date_of_birth, a.social_security_number, b.residential_address_id AS address_residential_address_id, b.street_address AS address_street_address, b.city AS address_city
FROM adoption_petitioners a JOIN residential_addresses b ON a.residential_address_id = b.residential_address_id;
```

| id | full_legal_name | date_of_birth | social_security_number | address_residential_address_id | address_street_address | address_city |
|---|---|---|---|---|---|---|
| 1 | Integrated Framework A | 2025-04-02 | SOC-2466 | 1 | composite-street-15 | integrated-city-34 |
| 2 | Extended Protocol | 2022-09-13 | SOC-2467 | 2 | primary-street-16 | seasonal-city-35 |
| 3 | Pilot Programme | 2023-02-24 | SOC-2468 | 3 | adaptive-street-17 | regional-city-36 |
| 4 | Baseline Standard D | 2024-07-08 | SOC-2469 | 4 | distributed-street-18 | legacy-city-37 |

The view `v_adult_to_be_adopted_residential_address` performs the same join for adoptees, linking each adult to their residential address. The adult Integrated Framework A is linked to composite-street-15 in integrated-city-34, while the adult Extended Protocol is linked to primary-street-16 in seasonal-city-35.

**View `v_adult_to_be_adopted_residential_address`**

```sql
CREATE VIEW v_adult_to_be_adopted_residential_address AS
SELECT a.full_legal_name, a.date_of_birth, a.social_security_number, a.residency_start_date, b.residential_address_id AS address_residential_address_id, b.street_address AS address_street_address, b.city AS address_city
FROM adult_to_be_adopteds a JOIN residential_addresses b ON a.residential_address_id = b.residential_address_id;
```

| full_legal_name | date_of_birth | social_security_number | residency_start_date | address_residential_address_id | address_street_address | address_city |
|---|---|---|---|---|---|---|
| Integrated Framework A | 2025-04-02 | SOC-2466 | 2023-06-17 | 1 | composite-street-15 | integrated-city-34 |
| Extended Protocol | 2022-09-13 | SOC-2467 | 2024-11-01 | 2 | primary-street-16 | seasonal-city-35 |
| Pilot Programme | 2023-02-24 | SOC-2468 | 2025-04-12 | 3 | adaptive-street-17 | regional-city-36 |
| Baseline Standard D | 2024-07-08 | SOC-2469 | 2022-09-23 | 4 | distributed-street-18 | legacy-city-37 |

The view `v_residential_address_adoption_petitioner` and `v_residential_address_adult_to_be_adopted` provide the reverse perspective, showing which petitioners and adoptees are associated with each address record.



**View `v_residential_address_adult_to_be_adopted`**

```sql
CREATE VIEW v_residential_address_adult_to_be_adopted AS
SELECT a.residential_address_id, a.street_address, a.city, a.state_code, b.full_legal_name AS adopted_full_legal_name, b.date_of_birth AS adopted_date_of_birth, b.social_security_number AS adopted_social_security_number
FROM residential_addresses a JOIN adult_to_be_adopteds b ON a.adult_to_be_adopted_social_security_number = b.social_security_number;
```

| residential_address_id | street_address | city | state_code | adopted_full_legal_name | adopted_date_of_birth | adopted_social_security_number |
|---|---|---|---|---|---|---|
| 1 | composite-street-15 | integrated-city-34 | 17788643 | Integrated Framework A | 2025-04-02 | SOC-2466 |
| 2 | primary-street-16 | seasonal-city-35 | 8350031 | Extended Protocol | 2022-09-13 | SOC-2467 |
| 3 | adaptive-street-17 | regional-city-36 | 790483 | Pilot Programme | 2023-02-24 | SOC-2468 |
| 4 | distributed-street-18 | legacy-city-37 | 8387549 | Baseline Standard D | 2024-07-08 | SOC-2469 |

The view `v_adoption_petitioner_contact_method_detail` joins the petitioner with their contact method, revealing that petitioner id 1 (Integrated Framework A) has a primary cell_phone contact with the value Jennifer Summers, while petitioner id 3 (Pilot Programme) has a primary email contact with the value Theodore Mcgrath.

**View `v_adoption_petitioner_contact_method_detail`**

```sql
CREATE VIEW v_adoption_petitioner_contact_method_detail AS
SELECT a.id, a.full_legal_name, a.date_of_birth, b.contact_method_id AS method_contact_method_id, b.contact_value AS method_contact_value, b.contact_type AS method_contact_type
FROM adoption_petitioners a
  JOIN petitioners_methods j ON j.adoption_petitioner_id = a.id
  JOIN contact_methods b ON b.contact_method_id = j.contact_method_id;
```

| id | full_legal_name | date_of_birth | method_contact_method_id | method_contact_value | method_contact_type |
|---|---|---|---|---|---|
| 1 | Integrated Framework A | 2025-04-02 | 1 | Jennifer Summers | cell_phone |
| 1 | Integrated Framework A | 2025-04-02 | 2 | Friedrich Nietzsche | alternate_phone |
| 2 | Extended Protocol | 2022-09-13 | 2 | Friedrich Nietzsche | alternate_phone |
| 2 | Extended Protocol | 2022-09-13 | 3 | Theodore Mcgrath | email |
| 3 | Pilot Programme | 2023-02-24 | 3 | Theodore Mcgrath | email |
| 3 | Pilot Programme | 2023-02-24 | 4 | Tasha Rodriguez | cell_phone |
| 4 | Baseline Standard D | 2024-07-08 | 4 | Tasha Rodriguez | cell_phone |
| 4 | Baseline Standard D | 2024-07-08 | 1 | Jennifer Summers | cell_phone |

The view `v_adult_to_be_adopted_contact_method_detail` performs the same join for adoptees, showing that the adult Integrated Framework A has a primary cell_phone contact (Jennifer Summers), and the adult Pilot Programme has a primary email contact (Theodore Mcgrath).

**View `v_adult_to_be_adopted_contact_method_detail`**

```sql
CREATE VIEW v_adult_to_be_adopted_contact_method_detail AS
SELECT a.full_legal_name, a.date_of_birth, a.social_security_number, b.contact_method_id AS method_contact_method_id, b.contact_value AS method_contact_value, b.contact_type AS method_contact_type
FROM adult_to_be_adopteds a
  JOIN adopteds_methods j ON j.adult_to_be_adopted_social_security_number = a.social_security_number
  JOIN contact_methods b ON b.contact_method_id = j.contact_method_id;
```

| full_legal_name | date_of_birth | social_security_number | method_contact_method_id | method_contact_value | method_contact_type |
|---|---|---|---|---|---|
| Integrated Framework A | 2025-04-02 | SOC-2466 | 1 | Jennifer Summers | cell_phone |
| Integrated Framework A | 2025-04-02 | SOC-2466 | 2 | Friedrich Nietzsche | alternate_phone |
| Extended Protocol | 2022-09-13 | SOC-2467 | 2 | Friedrich Nietzsche | alternate_phone |
| Extended Protocol | 2022-09-13 | SOC-2467 | 3 | Theodore Mcgrath | email |
| Pilot Programme | 2023-02-24 | SOC-2468 | 3 | Theodore Mcgrath | email |
| Pilot Programme | 2023-02-24 | SOC-2468 | 4 | Tasha Rodriguez | cell_phone |
| Baseline Standard D | 2024-07-08 | SOC-2469 | 4 | Tasha Rodriguez | cell_phone |
| Baseline Standard D | 2024-07-08 | SOC-2469 | 1 | Jennifer Summers | cell_phone |

The views `v_contact_method_adoption_petitioner` and `v_contact_method_adult_to_be_adopted` present the contact method perspective, listing which petitioners and adoptees are associated with each contact method record.

**View `v_contact_method_adoption_petitioner`**

```sql
CREATE VIEW v_contact_method_adoption_petitioner AS
SELECT a.contact_method_id, a.contact_value, a.contact_type, a.is_primary, b.id AS petitioner_id, b.full_legal_name AS petitioner_full_legal_name, b.date_of_birth AS petitioner_date_of_birth
FROM contact_methods a JOIN adoption_petitioners b ON a.adoption_petitioner_id = b.id;
```

| contact_method_id | contact_value | contact_type | is_primary | petitioner_id | petitioner_full_legal_name | petitioner_date_of_birth |
|---|---|---|---|---|---|---|
| 1 | Jennifer Summers | cell_phone | true | 1 | Integrated Framework A | 2025-04-02 |
| 2 | Friedrich Nietzsche | alternate_phone | false | 2 | Extended Protocol | 2022-09-13 |
| 3 | Theodore Mcgrath | email | true | 3 | Pilot Programme | 2023-02-24 |
| 4 | Tasha Rodriguez | cell_phone | false | 4 | Baseline Standard D | 2024-07-08 |

**View `v_contact_method_adult_to_be_adopted`**

```sql
CREATE VIEW v_contact_method_adult_to_be_adopted AS
SELECT a.contact_method_id, a.contact_value, a.contact_type, a.is_primary, b.full_legal_name AS adopted_full_legal_name, b.date_of_birth AS adopted_date_of_birth, b.social_security_number AS adopted_social_security_number
FROM contact_methods a JOIN adult_to_be_adopteds b ON a.adult_to_be_adopted_social_security_number = b.social_security_number;
```

| contact_method_id | contact_value | contact_type | is_primary | adopted_full_legal_name | adopted_date_of_birth | adopted_social_security_number |
|---|---|---|---|---|---|---|
| 1 | Jennifer Summers | cell_phone | true | Integrated Framework A | 2025-04-02 | SOC-2466 |
| 2 | Friedrich Nietzsche | alternate_phone | false | Extended Protocol | 2022-09-13 | SOC-2467 |
| 3 | Theodore Mcgrath | email | true | Pilot Programme | 2023-02-24 | SOC-2468 |
| 4 | Tasha Rodriguez | cell_phone | false | Baseline Standard D | 2024-07-08 | SOC-2469 |

### Representative and Case Relationships

The view `v_adoption_case_n_l_f_representative` joins the adoption case with its non-profit or organizational representative, answering which representative is assigned to which case. Case CAS-2099 is associated with representative REP-2164, named Pilot Protocol. Case CAS-2100 is associated with representative REP-2166, named Baseline Programme. Case CAS-2101 involves representative REP-2168, named Distributed Standard A. Case CAS-2102 involves representative REP-2170, named Adaptive Framework.

**View `v_adoption_case_n_l_f_representative`**

```sql
CREATE VIEW v_adoption_case_n_l_f_representative AS
SELECT a.id, a.case_identifier, a.filing_date, a.jurisdiction_code, b.n_l_f_representative_id AS representative_n_l_f_representative_id, b.rep_identifier AS representative_rep_identifier, b.rep_name AS representative_rep_name
FROM adoption_cases a JOIN n_l_f_representatives b ON a.n_l_f_representative_id = b.n_l_f_representative_id;
```

| id | case_identifier | filing_date | jurisdiction_code | representative_n_l_f_representative_id | representative_rep_identifier | representative_rep_name |
|---|---|---|---|---|---|---|
| 1000 | CAS-2099 | 2023-02-09 | 5917299 | 1 | REP-2164 | Pilot Protocol |
| 1001 | CAS-2100 | 2024-07-20 | id_25 | 2 | REP-2166 | Baseline Programme |
| 1002 | CAS-2101 | 2025-12-04 | 7731856 | 3 | REP-2168 | Distributed Standard A |
| 1003 | CAS-2102 | 2022-05-15 | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | 4 | REP-2170 | Adaptive Framework |

The view `v_n_l_f_representative_adoption_case` presents the same relationship from the representative's perspective, confirming that representative Pilot Protocol (REP-2164) is assigned to case CAS-2099, and representative Adaptive Framework (REP-2170) is assigned to case CAS-2102.

**View `v_n_l_f_representative_adoption_case`**

```sql
CREATE VIEW v_n_l_f_representative_adoption_case AS
SELECT a.n_l_f_representative_id, a.rep_identifier, a.rep_name, b.id AS case_id, b.case_identifier AS case_case_identifier, b.filing_date AS case_filing_date
FROM n_l_f_representatives a JOIN adoption_cases b ON a.adoption_case_id = b.id;
```

| n_l_f_representative_id | rep_identifier | rep_name | case_id | case_case_identifier | case_filing_date |
|---|---|---|---|---|---|
| 1 | REP-2164 | Pilot Protocol | 1000 | CAS-2099 | 2023-02-09 |
| 2 | REP-2166 | Baseline Programme | 1001 | CAS-2100 | 2024-07-20 |
| 3 | REP-2168 | Distributed Standard A | 1002 | CAS-2101 | 2025-12-04 |
| 4 | REP-2170 | Adaptive Framework | 1003 | CAS-2102 | 2022-05-15 |

### Synthesis

The adult adoption proceeding system captures a complete lifecycle of legal cases, from the initial filing through jurisdictional assignment, representative involvement, and final disposition. Each case is a nexus of interconnected records: the petitioner who initiates the action, the adult who is the subject of the adoption, the residential and contact information for both parties, and the organizational representative who may provide support. The views in this system provide multiple entry points into the data, allowing practitioners to query from the perspective of the case, the petitioner, the adoptee, the address, the contact method, or the representative. The coded values for relationships, durations, birth locations, and jurisdictional identifiers reflect a structured approach to categorizing the diverse circumstances that arise in adult adoption proceedings. Together, these records form a comprehensive reference for understanding and managing the administrative and legal dimensions of adult adoption.

## Data appendix

**View `v_person_adult_to_be_adopted`**

```sql
CREATE VIEW v_person_adult_to_be_adopted AS
SELECT a.id, a.full_name, a.is_birth_father_of_adult_to_be_adopted_social_security_number, a.created_at, b.full_legal_name AS adopted_full_legal_name, b.date_of_birth AS adopted_date_of_birth, b.social_security_number AS adopted_social_security_number
FROM persons a JOIN adult_to_be_adopteds b ON a.adult_to_be_adopted_social_security_number = b.social_security_number;
```

| id | full_name | is_birth_father_of_adult_to_be_adopted_social_security_number | created_at | adopted_full_legal_name | adopted_date_of_birth | adopted_social_security_number |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | SOC-2466 | 2025-01-01 00:14:00 | Integrated Framework A | 2025-04-02 | SOC-2466 |
| 2 | Account Name | SOC-2467 | 2025-02-06 03:14:00 | Extended Protocol | 2022-09-13 | SOC-2467 |
| 3 | Saipan International Airport | SOC-2468 | 2025-03-11 06:14:00 | Pilot Programme | 2023-02-24 | SOC-2468 |
| 4 | Norma Fisher | SOC-2469 | 2025-04-16 09:14:00 | Baseline Standard D | 2024-07-08 | SOC-2469 |
