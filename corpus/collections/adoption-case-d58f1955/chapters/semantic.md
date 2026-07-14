The adoption of a competent adult is a legal procedure that, in this domain, is captured as a structured workflow spanning multiple actors, contact channels, and residential locations. The schema models a single `adoption_case` as the central event, linking an `adoption_petitioner` who initiates the petition, an `adult_to_be_adopted` who is the subject of the petition, and an `n_l_f_representative` who acts on behalf of the adult. Each actor carries personal attributes, a residential address, and one or more contact methods. The relational design normalizes these entities into seven base tables and eight junction / lookup tables, then reassembles them through twenty-two views that answer the specific questions a case manager needs during intake, review, and approval.

## The Core Event: `adoption_cases`

The adoption process is anchored in the `adoption_cases` table, which records the procedural metadata of each petition. Its primary key `id` is a sequential integer (1000, 1001, 1002, 1003), while the business-facing `case_identifier` column carries human-readable codes such as `CAS-2099` and `CAS-2100`. The `filing_date` column stores the date the petition was submitted — for example, `2023-02-09` for case 1000 and `2025-12-04` for case 1002. The `jurisdiction_code` column holds a heterogeneous string that may be a plain numeric code like `5917299`, a short identifier like `id_25`, or a UUID fragment such as `7c692762-8fcd-11eb-924d-9cd76263cbd0`. The `case_status` column is an enumerated state machine with values `pending`, `under_review`, `approved`, and `denied`; case 1000 is `pending`, case 1001 is `under_review`, case 1002 is `approved`, and case 1003 is `denied`. The `court_docket_number` column (e.g., `COU-2632`) provides the court's own docket reference.

Three foreign keys tie the case to its participants: `adoption_petitioner_id` references `adoption_petitioners.id`, `adult_to_be_adopted_social_security_number` references `adult_to_be_adopteds.social_security_number`, and `n_l_f_representative_id` references `n_l_f_representatives.n_l_f_representative_id`. This design enforces a one-to-one relationship between a case and each of its three participants.

**Table `adoption_cases`**

| id | case_identifier | filing_date | jurisdiction_code | case_status | court_docket_number | adoption_petitioner_id | adult_to_be_adopted_social_security_number | n_l_f_representative_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | CAS-2099 | 2023-02-09 | 5917299 | pending | COU-2632 | 1 | SOC-2466 | 1 |
| 1001 | CAS-2100 | 2024-07-20 | id_25 | under_review | COU-2637 | 2 | SOC-2467 | 2 |
| 1002 | CAS-2101 | 2025-12-04 | 7731856 | approved | COU-2642 | 3 | SOC-2468 | 3 |
| 1003 | CAS-2102 | 2022-05-15 | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | denied | COU-2647 | 4 | SOC-2469 | 4 |

## The Petitioner: `adoption_petitioners`

The `adoption_petitioners` table stores the identity and relationship details of the person filing the petition. Its surrogate key `id` (1, 2, 3, 4) maps directly to the `adoption_petitioner_id` in `adoption_cases`. The `full_legal_name` column carries names such as `Integrated Framework A`, `Extended Protocol`, `Pilot Programme`, and `Baseline Standard D`. The `date_of_birth` column stores dates like `2025-04-02` and `2022-09-13`. The `social_security_number` column (e.g., `SOC-2466`) is a natural key that is also referenced by `adult_to_be_adopteds` and `residential_addresses`.

The `residency_start_date` column (e.g., `2023-06-17`) records when the petitioner established residency at the address linked by `residential_address_id`. The `relationship_to_adult` and `duration_of_acquaintance` columns store coded descriptors — for instance, `regional-relation-42` paired with `compact-duration-44` for petitioner 1, and `legacy-relation-43` paired with `composite-duration-45` for petitioner 2. The `adoption_case_id` column is a foreign key back to `adoption_cases.id`, creating a bidirectional link that allows navigation from case to petitioner and vice versa.

**Table `adoption_petitioners`**

| id | full_legal_name | date_of_birth | social_security_number | residency_start_date | relationship_to_adult | duration_of_acquaintance | residential_address_id | adoption_case_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Integrated Framework A | 2025-04-02 | SOC-2466 | 2023-06-17 | regional-relation-42 | compact-duration-44 | 1 | 1000 |
| 2 | Extended Protocol | 2022-09-13 | SOC-2467 | 2024-11-01 | legacy-relation-43 | composite-duration-45 | 2 | 1001 |
| 3 | Pilot Programme | 2023-02-24 | SOC-2468 | 2025-04-12 | compact-relation-44 | primary-duration-46 | 3 | 1002 |
| 4 | Baseline Standard D | 2024-07-08 | SOC-2469 | 2022-09-23 | composite-relation-45 | adaptive-duration-47 | 4 | 1003 |

## The Adult Being Adopted: `adult_to_be_adopteds`

The `adult_to_be_adopteds` table mirrors the petitioner table in structure but adds birth and person-reference columns. Its `social_security_number` column (e.g., `SOC-2466`, `SOC-2467`) serves as the natural key referenced by `adoption_cases.adult_to_be_adopted_social_security_number`. The `full_legal_name` column holds the same set of names as the petitioner table — `Integrated Framework A`, `Extended Protocol`, `Pilot Programme`, `Baseline Standard D` — reflecting that in this dataset the petitioner and the adult being adopted share the same legal identity. The `date_of_birth` and `residency_start_date` columns follow the same date format.

Additional columns include `birth_city` (e.g., `baseline-birth-73`, `pilot-birth-74`), `birth_state` (e.g., `compact-birth-98`, `composite-birth-99`), and `preferred_post_adoption_name` (e.g., `Extended Corridor`, `Pilot Series A`, `Baseline Assessment`, `Distributed Survey`). The `residential_address_id` column links to `residential_addresses`, and `adoption_case_id` links back to `adoption_cases`. Two person-reference columns — `person_id` and `has_birth_father_person_id` — both point to the `persons` table, allowing the schema to distinguish the adult's own person record from their birth father's record.

**Table `adult_to_be_adopteds`**

| full_legal_name | date_of_birth | social_security_number | residency_start_date | birth_city | birth_state | preferred_post_adoption_name | residential_address_id | adoption_case_id | person_id | has_birth_father_person_id |
|---|---|---|---|---|---|---|---|---|---|---|
| Integrated Framework A | 2025-04-02 | SOC-2466 | 2023-06-17 | baseline-birth-73 | compact-birth-98 | Extended Corridor | 1 | 1000 | 1 | 1 |
| Extended Protocol | 2022-09-13 | SOC-2467 | 2024-11-01 | pilot-birth-74 | composite-birth-99 | Pilot Series A | 2 | 1001 | 2 | 2 |
| Pilot Programme | 2023-02-24 | SOC-2468 | 2025-04-12 | extended-birth-75 | primary-birth-100 | Baseline Assessment | 3 | 1002 | 3 | 3 |
| Baseline Standard D | 2024-07-08 | SOC-2469 | 2022-09-23 | integrated-birth-76 | adaptive-birth-101 | Distributed Survey | 4 | 1003 | 4 | 4 |

## Addresses and Contact Methods

The `residential_addresses` table normalizes location data into a shared table referenced by both petitioners and adults. Its primary key `residential_address_id` (1, 2, 3, 4) is referenced by `adoption_petitioners.residential_address_id` and `adult_to_be_adopteds.residential_address_id`. The `street_address` column stores values like `composite-street-15` and `primary-street-16`. The `city` column holds values such as `integrated-city-34` and `seasonal-city-35`. The `state_code` column is a string that may be numeric (`17788643`, `8350031`) or a UUID fragment (`9bb5fec0-8fcc-11eb-924d-9cd76263cbd0`). The `zip_code` column stores strings like `69434` and `13589`. Two foreign-key columns — `adoption_petitioner_id` and `adult_to_be_adopted_social_security_number` — create a many-to-one relationship: multiple addresses could theoretically belong to the same petitioner or adult, though in the current data each address is associated with exactly one petitioner and one adult.

**Table `residential_addresses`**

| residential_address_id | street_address | city | state_code | zip_code | adoption_petitioner_id | adult_to_be_adopted_social_security_number |
|---|---|---|---|---|---|---|
| 1 | composite-street-15 | integrated-city-34 | 17788643 | 69434 | 1 | SOC-2466 |
| 2 | primary-street-16 | seasonal-city-35 | 8350031 | 13589 | 2 | SOC-2467 |
| 3 | adaptive-street-17 | regional-city-36 | 790483 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | 3 | SOC-2468 |
| 4 | distributed-street-18 | legacy-city-37 | 8387549 | 1250214 | 4 | SOC-2469 |

The `contact_methods` table normalizes communication channels. Its primary key `contact_method_id` (1, 2, 3, 4) is referenced by junction tables described below. The `contact_value` column stores the actual contact information — for example, `Jennifer Summers` (a cell phone), `Friedrich Nietzsche` (an alternate phone), `Theodore Mcgrath` (an email), and `Tasha Rodriguez` (a cell phone). The `contact_type` column is an enumerated value (`cell_phone`, `alternate_phone`, `email`). The `is_primary` column is a boolean flag; contact 1 and contact 3 are marked `true`, while contacts 2 and 4 are `false`. The `adoption_petitioner_id` and `adult_to_be_adopted_social_security_number` columns create the same many-to-one pattern as addresses, linking each contact method to its owner.

**Table `contact_methods`**

| contact_method_id | contact_value | contact_type | is_primary | adoption_petitioner_id | adult_to_be_adopted_social_security_number |
|---|---|---|---|---|---|
| 1 | Jennifer Summers | cell_phone | true | 1 | SOC-2466 |
| 2 | Friedrich Nietzsche | alternate_phone | false | 2 | SOC-2467 |
| 3 | Theodore Mcgrath | email | true | 3 | SOC-2468 |
| 4 | Tasha Rodriguez | cell_phone | false | 4 | SOC-2469 |

## Representatives and Persons

The `n_l_f_representatives` table stores the non-law-firm representatives who act on behalf of the adult. Its primary key `n_l_f_representative_id` (1, 2, 3, 4) is referenced by `adoption_cases.n_l_f_representative_id`. The `rep_identifier` column carries codes like `REP-2164` and `REP-2166`. The `rep_name` column stores names such as `Pilot Protocol`, `Baseline Programme`, `Distributed Standard A`, and `Adaptive Framework`. The `adoption_case_id` column creates a one-to-one link back to the case.

**Table `n_l_f_representatives`**

| n_l_f_representative_id | rep_identifier | rep_name | adoption_case_id |
|---|---|---|---|
| 1 | REP-2164 | Pilot Protocol | 1000 |
| 2 | REP-2166 | Baseline Programme | 1001 |
| 3 | REP-2168 | Distributed Standard A | 1002 |
| 4 | REP-2170 | Adaptive Framework | 1003 |

The `persons` table is a generic identity store referenced by `adult_to_be_adopteds.person_id` and `adult_to_be_adopteds.has_birth_father_person_id`. In the current data, each adult's `person_id` and `has_birth_father_person_id` both point to the same row (1, 2, 3, 4 respectively), indicating that the birth father record is not yet differentiated from the adult's own person record.

**Table `persons`**

| id | full_name | adult_to_be_adopted_social_security_number | is_birth_father_of_adult_to_be_adopted_social_security_number | created_at | updated_at |
|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | SOC-2466 | SOC-2466 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Account Name | SOC-2467 | SOC-2467 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Saipan International Airport | SOC-2468 | SOC-2468 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Norma Fisher | SOC-2469 | SOC-2469 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

## Junction Tables: `petitioners_methods` and `adopteds_methods`

The `petitioners_methods` and `adopteds_methods` tables are junction (associative) tables that resolve the many-to-many relationship between persons and contact methods. `petitioners_methods` links `adoption_petitioners.id` to `contact_methods.contact_method_id`, allowing a petitioner to have multiple contact methods. `adopteds_methods` performs the same function for `adult_to_be_adopteds.social_security_number` and `contact_methods.contact_method_id`. These tables enable a single contact method to be associated with multiple petitioners or adults, while also supporting the `is_primary` flag at the relationship level rather than at the contact method level.

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

## Views: Reconstructing Domain Facts

The views reassemble the normalized tables into flat, query-ready result sets that answer the specific questions a case manager needs. Each view is a `SELECT` with explicit `JOIN` clauses that trace foreign-key paths back to the base tables.

### Case-Level Views

The view `v_adoption_case_adoption_petitioner` joins `adoption_cases` to `adoption_petitioners` on `adoption_cases.adoption_petitioner_id = adoption_petitioners.id`, producing a flat row that combines case metadata with petitioner identity. For case 1000 (`CAS-2099`, status `pending`, filed `2023-02-09`), the joined row shows petitioner `Integrated Framework A` (DOB `2025-04-02`, SSN `SOC-2466`, relationship `regional-relation-42`). This view answers the question: "Who is the petitioner for this case, and what are their details?"

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

The view `v_adoption_case_adult_to_be_adopted` joins `adoption_cases` to `adult_to_be_adopteds` on `adoption_cases.adult_to_be_adopted_social_security_number = adult_to_be_adopteds.social_security_number`. For case 1001 (`CAS-2100`, status `under_review`, filed `2024-07-20`), the joined row shows the adult `Extended Protocol` (DOB `2022-09-13`, SSN `SOC-2467`, birth city `pilot-birth-74`, preferred post-adoption name `Pilot Series A`). This view answers: "Who is the adult being adopted in this case, and what are their personal details?"

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

The view `v_adoption_case_n_l_f_representative` joins `adoption_cases` to `n_l_f_representatives` on `adoption_cases.n_l_f_representative_id = n_l_f_representatives.n_l_f_representative_id`. For case 1002 (`CAS-2101`, status `approved`, filed `2025-12-04`), the joined row shows representative `Distributed Standard A` (identifier `REP-2168`). This view answers: "Which representative is assigned to this case?"

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

### Petitioner-Centric Views

The view `v_adoption_petitioner_residential_address` joins `adoption_petitioners` to `residential_addresses` on `adoption_petitioners.residential_address_id = residential_addresses.residential_address_id`. For petitioner 1 (`Integrated Framework A`), the joined row shows address `composite-street-15` in `integrated-city-34` with state code `17788643` and zip `69434`. This view answers: "Where does this petitioner reside?"

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

The view `v_adoption_petitioner_contact_method_detail` joins `adoption_petitioners` through `petitioners_methods` to `contact_methods`. For petitioner 1, the joined row shows contact value `Jennifer Summers` with type `cell_phone` and `is_primary = true`. This view answers: "What are the contact methods for this petitioner, and which is primary?"

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

The view `v_adoption_petitioner_adoption_case` joins `adoption_petitioners` to `adoption_cases` on `adoption_petitioners.adoption_case_id = adoption_cases.id`. For petitioner 2 (`Extended Protocol`), the joined row shows case `CAS-2100` with status `under_review` and court docket `COU-2637`. This view answers: "Which case is this petitioner associated with, and what is the case status?"

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

### Adult-Centric Views

The view `v_adult_to_be_adopted_residential_address` joins `adult_to_be_adopteds` to `residential_addresses` on `adult_to_be_adopteds.residential_address_id = residential_addresses.residential_address_id`. For adult 3 (`Pilot Programme`), the joined row shows address `adaptive-street-17` in `regional-city-36` with state code `790483` and zip `9bb5fec0-8fcc-11eb-924d-9cd76263cbd0`. This view answers: "Where does the adult being adopted reside?"

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

The view `v_adult_to_be_adopted_contact_method_detail` joins `adult_to_be_adopteds` through `adopteds_methods` to `contact_methods`. For adult 4 (`Baseline Standard D`), the joined row shows contact value `Tasha Rodriguez` with type `cell_phone` and `is_primary = false`. This view answers: "What are the contact methods for the adult being adopted, and which is primary?"

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

The view `v_adult_to_be_adopted_adoption_case` joins `adult_to_be_adopteds` to `adoption_cases` on `adult_to_be_adopteds.adoption_case_id = adoption_cases.id`. For adult 3 (`Pilot Programme`), the joined row shows case `CAS-2101` with status `approved` and court docket `COU-2642`. This view answers: "Which case is this adult being adopted in, and what is the case status?"

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

The view `v_adult_to_be_adopted_person` joins `adult_to_be_adopteds` to `persons` on `adult_to_be_adopteds.person_id = persons.id`. For adult 4 (`Baseline Standard D`), the joined row includes the person record referenced by `person_id = 4`. This view answers: "What is the person record for this adult?"

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

### Address-Centric Views

The view `v_residential_address_adoption_petitioner` joins `residential_addresses` to `adoption_petitioners` on `residential_addresses.residential_address_id = adoption_petitioners.residential_address_id`. For address 2 (`primary-street-16` in `seasonal-city-35`), the joined row shows petitioner 2 (`Extended Protocol`). This view answers the inverse question: "Which petitioner lives at this address?"

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

The view `v_residential_address_adult_to_be_adopted` joins `residential_addresses` to `adult_to_be_adopteds` on `residential_addresses.residential_address_id = adult_to_be_adopteds.residential_address_id`. For address 3 (`adaptive-street-17` in `regional-city-36`), the joined row shows adult 3 (`Pilot Programme`). This view answers: "Which adult being adopted lives at this address?"

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

### Contact Method-Centric Views

The view `v_contact_method_adoption_petitioner` joins `contact_methods` to `adoption_petitioners` through `petitioners_methods`. For contact 1 (`Jennifer Summers`, type `cell_phone`, `is_primary = true`), the joined row shows petitioner 1 (`Integrated Framework A`). This view answers: "Which petitioner owns this contact method?"

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

The view `v_contact_method_adult_to_be_adopted` joins `contact_methods` to `adult_to_be_adopteds` through `adopteds_methods`. For contact 3 (`Theodore Mcgrath`, type `email`, `is_primary = true`), the joined row shows adult 3 (`Pilot Programme`). This view answers: "Which adult being adopted owns this contact method?"

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

### Representative-Centric View

The view `v_n_l_f_representative_adoption_case` joins `n_l_f_representatives` to `adoption_cases` on `n_l_f_representatives.adoption_case_id = adoption_cases.id`. For representative 4 (`Adaptive Framework`, identifier `REP-2170`), the joined row shows case `CAS-2102` with status `denied` and court docket `COU-2647`. This view answers: "Which case is this representative assigned to, and what is the case status?"

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

### Person-Centric View

The view `v_person_adult_to_be_adopted` joins `persons` to `adult_to_be_adopteds` on `persons.id = adult_to_be_adopteds.person_id`. For person 4, the joined row shows adult `Baseline Standard D` (DOB `2024-07-08`, SSN `SOC-2469`, birth city `integrated-birth-76`). This view answers: "Which adult being adopted corresponds to this person record?"

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

## Synthesis

The schema models the adult adoption domain as a central event (`adoption_cases`) surrounded by three participant entities (`adoption_petitioners`, `adult_to_be_adopteds`, `n_l_f_representatives`), each of which carries its own address and contact methods. The normalization into separate `residential_addresses` and `contact_methods` tables, linked through foreign keys and junction tables (`petitioners_methods`, `adopteds_methods`), eliminates redundancy and supports multiple addresses and contact methods per participant. The twenty-two views traverse the foreign-key graph from every possible entry point — case, petitioner, adult, address, contact method, representative, and person — producing flat result sets that answer the operational questions of intake, review, and approval. The design trades a moderate number of joins for the clarity and referential integrity that comes from a fully normalized relational model.