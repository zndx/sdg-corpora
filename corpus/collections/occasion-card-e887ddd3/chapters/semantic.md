## Ontology-Grounded Relational Modelling: Memorial Card Enrolments and Perpetual Folders

The domain under examination concerns the administration of memorial card programmes, where organisations issue occasion-based cards (sympathy, get-well, thank-you, and intention cards) that are linked to long-lived perpetual folders and to the people or institutions enrolled in those folders. A single enrolment event sits at the centre of the data model: it binds an occasion card to a perpetual folder and to an enrollee, while carrying its own transactional metadata such as status, duration, and donation amount. Order requests sit alongside enrolments as a parallel concern, recording how many cards were delivered and by which channel. The relational schema materialises this ontology through five core entity tables, three many-to-many junction tables, and twelve derived views that reassemble domain facts from the normalised structure.

**Table `occasion_cards`**

| occasion_card_id | card_type | reference_number | suggested_donation | is_pre_signed | is_free | perpetual_folder_id |
|---|---|---|---|---|---|---|
| 1 | Sympathy | REF-2039 | 21.95 | true | true | 100 |
| 2 | Get Well | REF-2040 | 25.90 | false | false | 101 |
| 3 | For Your Intention | REF-2041 | 29.85 | true | true | 102 |
| 4 | Thank You | REF-2042 | 33.80 | false | false | 103 |

The `occasion_cards` table encodes the product catalogue. Each row represents a distinct card type offered for a particular occasion. The primary key `occasion_card_id` is a small integer (1 through 4 in the sample), while `card_type` carries the human-readable label — `Sympathy`, `Get Well`, `For Your Intention`, and `Thank You`. The `reference_number` column stores a stable product code such as `REF-2039` or `REF-2042`. Financial attributes appear as `suggested_donation` (a decimal ranging from 21.95 to 33.80) and two boolean flags, `is_pre_signed` and `is_free`, which indicate whether the card arrives pre-signed and whether it carries no cost. The column `perpetual_folder_id` is a foreign key pointing to `perpetual_folders.id`, establishing a one-to-many relationship: each perpetual folder may be associated with zero or more occasion cards, but a card row references exactly one folder. In the sample data, card 1 (`Sympathy`, `REF-2039`, donation 21.95, pre-signed and free) is linked to folder 100 (`Agony in the Garden`).

**Table `perpetual_folders`**

| id | folder_name | cover_color | suggested_donation | has_society_logo | enrollee_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 100 | Agony in the Garden | White | 21.95 | true | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | Sacred Heart | Red | 25.90 | false | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | St. Patrick | Green | 29.85 | true | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | Immaculate Conception | Light Blue | 33.80 | false | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `perpetual_folders` table is the second core entity. Its primary key `id` is a four-digit integer (100–103), and `folder_name` carries the memorial title — `Agony in the Garden`, `Sacred Heart`, `St. Patrick`, `Immaculate Conception`. The `cover_color` column stores values such as `White`, `Red`, `Green`, and `Light Blue`. Like the cards table, `suggested_donation` appears here (21.95 through 33.80), and `has_society_logo` is a boolean indicating branding. The `enrollee_id` column is a foreign key into `enrollees`, creating a one-to-one or one-to-many link from folder to enrollee. Timestamps `created_at` and `updated_at` record the lifecycle of each folder; for instance, folder 100 was created on `2025-01-01 00:14:00` and last updated on `2025-01-02 00:41:00`.

**Table `enrolments`**

| enrolment_id | enrolment_status | duration_years | donation_amount | enrolment_date | occasion_card_id | perpetual_folder_id | enrollee_id |
|---|---|---|---|---|---|---|---|
| 1 | Pending | 14 | 26.25 | 2024-07-10T18:54:00 | 1 | 100 | 1 |
| 2 | Active | 18 | 29.99 | 2025-12-21T01:11:00 | 2 | 101 | 2 |
| 3 | Completed | 22 | 16.11 | 2022-05-05T08:28:00 | 3 | 102 | 3 |
| 4 | Pending | 26 | 13.49 | 2023-10-16T15:45:00 | 4 | 103 | 4 |

The `enrolments` table is the central fact table of the model. Its primary key `enrolment_id` is a small integer (1–4). The column `enrolment_status` carries the lifecycle state — `Pending`, `Active`, or `Completed`. `duration_years` is an integer (14, 18, 22, 26) indicating how long the enrolment lasts. `donation_amount` records the actual amount paid (26.25, 29.99, 16.11, 13.49), and `enrolment_date` is a timestamp such as `2024-07-10T18:54:00`. Three foreign keys bind this table to the other core entities: `occasion_card_id` references `occasion_cards.occasion_card_id`, `perpetual_folder_id` references `perpetual_folders.id`, and `enrollee_id` references `enrollees.enrollee_id`. Each enrolment row therefore represents a single triadic association between a card, a folder, and an enrollee. Enrolment 1, for example, links card 1 (`Sympathy`), folder 100 (`Agony in the Garden`), and enrollee 1 (`Theodore Mcgrath`), with status `Pending`, duration 14 years, and a donation of 26.25.

**Table `enrollees`**

| enrollee_id | full_name | is_deceased | relationship_to_requester | perpetual_folder_id |
|---|---|---|---|---|
| 1 | Theodore Mcgrath | true | regional-relation-96 | 100 |
| 2 | Account Name | false | legacy-relation-97 | 101 |
| 3 | Saipan International Airport | true | compact-relation-98 | 102 |
| 4 | Norma Fisher | false | composite-relation-99 | 103 |

The `enrollees` table stores the people and organisations being memorialised. Its primary key `enrollee_id` is a small integer (1–4). The `full_name` column carries names such as `Theodore Mcgrath`, `Account Name`, `Saipan International Airport`, and `Norma Fisher`. The boolean `is_deceased` indicates whether the enrollee is deceased (true for Theodore Mcgrath and Saipan International Airport; false for Account Name and Norma Fisher). The `relationship_to_requester` column stores a categorical label such as `regional-relation-96`, `legacy-relation-97`, `compact-relation-98`, and `composite-relation-99`. The `perpetual_folder_id` column is a foreign key into `perpetual_folders.id`, creating a reverse link from enrollee to folder.

**Table `order_requests`**

| id | request_id | submission_date | delivery_method | total_quantity | perpetual_folder_id | enrollee_id |
|---|---|---|---|---|---|---|
| 1000 | 2087732 | 2025-04-24T03:57:00 | Post | 20 | 100 | 1 |
| 1001 | 575213 | 2022-09-08T10:14:00 | Email | 20 | 101 | 2 |
| 1002 | 103167 | 2023-02-19T17:31:00 | Phone | 0 | 102 | 3 |
| 1003 | 611510 | 2024-07-03T00:48:00 | Post | 1 | 103 | 4 |

The `order_requests` table records delivery transactions. Its primary key `id` is a four-digit integer (1000–1003). The `request_id` column stores a separate identifier (2087732, 575213, 103167, 611510). `submission_date` is a timestamp such as `2025-04-24T03:57:00`. `delivery_method` carries one of three values: `Post`, `Email`, or `Phone`. `total_quantity` is an integer (20, 20, 0, 1) indicating how many cards were ordered. The foreign keys `perpetual_folder_id` and `enrollee_id` link the request to the corresponding folder and enrollee. Order request 1000, for instance, is linked to folder 100 and enrollee 1, was submitted by `Post`, and has a quantity of 20.

The remaining three tables are junction (associative) tables that resolve many-to-many relationships.

**Table `cards_enrolments`**

| occasion_card_id | enrolment_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `cards_enrolments` table resolves the many-to-many relationship between `occasion_cards` and `enrolments`. Its composite key consists of `occasion_card_id` and `enrolment_id`, both foreign keys. In the sample data, card 1 is associated with enrolments 1 and 2; card 2 with enrolments 2 and 3; card 3 with enrolments 3 and 4; and card 4 with enrolments 4 and 1. This means any single occasion card can appear in multiple enrolments, and any single enrolment can reference multiple cards.

**Table `folders_enrolments`**

| perpetual_folder_id | enrolment_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `folders_enrolments` table resolves the many-to-many relationship between `perpetual_folders` and `enrolments`. Its composite key consists of `perpetual_folder_id` and `enrolment_id`. This junction allows a single folder to participate in multiple enrolments and a single enrolment to reference multiple folders.

**Table `enrollees_enrolments`**

| enrollee_id | enrolment_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `enrollees_enrolments` table resolves the many-to-many relationship between `enrollees` and `enrolments`. Its composite key consists of `enrollee_id` and `enrolment_id`. This junction allows a single enrollee to be associated with multiple enrolments and a single enrolment to reference multiple enrollees.

**Table `requests_cards`**

| order_request_id | occasion_card_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `requests_cards` table resolves the many-to-many relationship between `order_requests` and `occasion_cards`. Its composite key consists of `request_id` (or the corresponding `order_requests.id`) and `occasion_card_id`. This junction allows a single order request to include multiple card types and a single card type to appear in multiple order requests.

With the base schema established, the twelve views each answer a specific analytical question by joining the normalised tables back together.

**View `v_occasion_card_enrolment_detail`**

```sql
CREATE VIEW v_occasion_card_enrolment_detail AS
SELECT a.occasion_card_id, a.card_type, a.reference_number, b.enrolment_id AS enrolment_enrolment_id, b.enrolment_status AS enrolment_enrolment_status, b.duration_years AS enrolment_duration_years
FROM occasion_cards a
  JOIN cards_enrolments j ON j.occasion_card_id = a.occasion_card_id
  JOIN enrolments b ON b.enrolment_id = j.enrolment_id;
```

| occasion_card_id | card_type | reference_number | enrolment_enrolment_id | enrolment_enrolment_status | enrolment_duration_years |
|---|---|---|---|---|---|
| 1 | Sympathy | REF-2039 | 1 | Pending | 14 |
| 1 | Sympathy | REF-2039 | 2 | Active | 18 |
| 2 | Get Well | REF-2040 | 2 | Active | 18 |
| 2 | Get Well | REF-2040 | 3 | Completed | 22 |
| 3 | For Your Intention | REF-2041 | 3 | Completed | 22 |
| 3 | For Your Intention | REF-2041 | 4 | Pending | 26 |
| 4 | Thank You | REF-2042 | 4 | Pending | 26 |
| 4 | Thank You | REF-2042 | 1 | Pending | 14 |

The view `v_occasion_card_enrolment_detail` joins `occasion_cards` to `enrolments` on `occasion_card_id`, producing a row per card-enrolment association. It answers the question: "For each occasion card, what are the details of the enrolments that reference it?" A row from this view would show card 1 (`Sympathy`, `REF-2039`, donation 21.95) alongside enrolment 1 (status `Pending`, duration 14 years, donation 26.25, date `2024-07-10T18:54:00`), and another row would show the same card alongside enrolment 2 (status `Active`, duration 18 years, donation 29.99). This view is useful for auditing which cards have been used in which enrolments and comparing the card's suggested donation against the actual enrolment donation.

**View `v_occasion_card_perpetual_folder`**

```sql
CREATE VIEW v_occasion_card_perpetual_folder AS
SELECT a.occasion_card_id, a.card_type, a.reference_number, a.suggested_donation, b.id AS folder_id, b.folder_name AS folder_folder_name, b.cover_color AS folder_cover_color
FROM occasion_cards a JOIN perpetual_folders b ON a.perpetual_folder_id = b.id;
```

| occasion_card_id | card_type | reference_number | suggested_donation | folder_id | folder_folder_name | folder_cover_color |
|---|---|---|---|---|---|---|
| 1 | Sympathy | REF-2039 | 21.95 | 100 | Agony in the Garden | White |
| 2 | Get Well | REF-2040 | 25.90 | 101 | Sacred Heart | Red |
| 3 | For Your Intention | REF-2041 | 29.85 | 102 | St. Patrick | Green |
| 4 | Thank You | REF-2042 | 33.80 | 103 | Immaculate Conception | Light Blue |

The view `v_occasion_card_perpetual_folder` joins `occasion_cards` to `perpetual_folders` on `perpetual_folder_id`, producing a row per card-folder pair. It answers: "Which perpetual folder is each occasion card associated with?" A row would show card 1 (`Sympathy`, `REF-2039`) alongside folder 100 (`Agony in the Garden`, `White` cover, donation 21.95, has society logo). This view is useful for understanding the product-folder mapping and for verifying that the suggested donations are consistent across the two tables.

**View `v_perpetual_folder_enrolment_detail`**

```sql
CREATE VIEW v_perpetual_folder_enrolment_detail AS
SELECT a.id, a.folder_name, a.cover_color, b.enrolment_id AS enrolment_enrolment_id, b.enrolment_status AS enrolment_enrolment_status, b.duration_years AS enrolment_duration_years
FROM perpetual_folders a
  JOIN folders_enrolments j ON j.perpetual_folder_id = a.id
  JOIN enrolments b ON b.enrolment_id = j.enrolment_id;
```

| id | folder_name | cover_color | enrolment_enrolment_id | enrolment_enrolment_status | enrolment_duration_years |
|---|---|---|---|---|---|
| 100 | Agony in the Garden | White | 1 | Pending | 14 |
| 100 | Agony in the Garden | White | 2 | Active | 18 |
| 101 | Sacred Heart | Red | 2 | Active | 18 |
| 101 | Sacred Heart | Red | 3 | Completed | 22 |
| 102 | St. Patrick | Green | 3 | Completed | 22 |
| 102 | St. Patrick | Green | 4 | Pending | 26 |
| 103 | Immaculate Conception | Light Blue | 4 | Pending | 26 |
| 103 | Immaculate Conception | Light Blue | 1 | Pending | 14 |

The view `v_perpetual_folder_enrolment_detail` joins `perpetual_folders` to `enrolments` on `perpetual_folder_id`, producing a row per folder-enrolment association. It answers: "For each perpetual folder, what are the details of the enrolments that reference it?" A row would show folder 100 (`Agony in the Garden`, `White`, donation 21.95) alongside enrolment 1 (status `Pending`, duration 14 years, donation 26.25, date `2024-07-10T18:54:00`). This view supports folder-level reporting on enrolment activity.

**View `v_perpetual_folder_enrollee`**

```sql
CREATE VIEW v_perpetual_folder_enrollee AS
SELECT a.id, a.folder_name, a.cover_color, a.suggested_donation, b.enrollee_id AS enrollee_enrollee_id, b.full_name AS enrollee_full_name, b.is_deceased AS enrollee_is_deceased
FROM perpetual_folders a JOIN enrollees b ON a.enrollee_id = b.enrollee_id;
```

| id | folder_name | cover_color | suggested_donation | enrollee_enrollee_id | enrollee_full_name | enrollee_is_deceased |
|---|---|---|---|---|---|---|
| 100 | Agony in the Garden | White | 21.95 | 1 | Theodore Mcgrath | true |
| 101 | Sacred Heart | Red | 25.90 | 2 | Account Name | false |
| 102 | St. Patrick | Green | 29.85 | 3 | Saipan International Airport | true |
| 103 | Immaculate Conception | Light Blue | 33.80 | 4 | Norma Fisher | false |

The view `v_perpetual_folder_enrollee` joins `perpetual_folders` to `enrollees` on `perpetual_folder_id` (or via the enrollee's `perpetual_folder_id` column), producing a row per folder-enrollee pair. It answers: "Which enrollee is associated with each perpetual folder?" A row would show folder 100 (`Agony in the Garden`, `White`) alongside enrollee 1 (`Theodore Mcgrath`, deceased, relationship `regional-relation-96`). This view is useful for understanding the folder-to-enrollee mapping and for generating memorial reports.

**View `v_enrolment_occasion_card`**

```sql
CREATE VIEW v_enrolment_occasion_card AS
SELECT a.enrolment_id, a.enrolment_status, a.duration_years, a.donation_amount, b.occasion_card_id AS card_occasion_card_id, b.card_type AS card_card_type, b.reference_number AS card_reference_number
FROM enrolments a JOIN occasion_cards b ON a.occasion_card_id = b.occasion_card_id;
```

| enrolment_id | enrolment_status | duration_years | donation_amount | card_occasion_card_id | card_card_type | card_reference_number |
|---|---|---|---|---|---|---|
| 1 | Pending | 14 | 26.25 | 1 | Sympathy | REF-2039 |
| 2 | Active | 18 | 29.99 | 2 | Get Well | REF-2040 |
| 3 | Completed | 22 | 16.11 | 3 | For Your Intention | REF-2041 |
| 4 | Pending | 26 | 13.49 | 4 | Thank You | REF-2042 |

The view `v_enrolment_occasion_card` joins `enrolments` to `occasion_cards` on `occasion_card_id`, producing a row per enrolment-card pair. It answers: "For each enrolment, which occasion card was used?" A row would show enrolment 1 (status `Pending`, duration 14 years, donation 26.25, date `2024-07-10T18:54:00`) alongside card 1 (`Sympathy`, `REF-2039`, donation 21.95). This view is useful for card-level analytics, such as counting how many enrolments used each card type.

**View `v_enrolment_perpetual_folder`**

```sql
CREATE VIEW v_enrolment_perpetual_folder AS
SELECT a.enrolment_id, a.enrolment_status, a.duration_years, a.donation_amount, b.id AS folder_id, b.folder_name AS folder_folder_name, b.cover_color AS folder_cover_color
FROM enrolments a JOIN perpetual_folders b ON a.perpetual_folder_id = b.id;
```

| enrolment_id | enrolment_status | duration_years | donation_amount | folder_id | folder_folder_name | folder_cover_color |
|---|---|---|---|---|---|---|
| 1 | Pending | 14 | 26.25 | 100 | Agony in the Garden | White |
| 2 | Active | 18 | 29.99 | 101 | Sacred Heart | Red |
| 3 | Completed | 22 | 16.11 | 102 | St. Patrick | Green |
| 4 | Pending | 26 | 13.49 | 103 | Immaculate Conception | Light Blue |

The view `v_enrolment_perpetual_folder` joins `enrolments` to `perpetual_folders` on `perpetual_folder_id`, producing a row per enrolment-folder pair. It answers: "For each enrolment, which perpetual folder was used?" A row would show enrolment 1 (status `Pending`, duration 14 years, donation 26.25) alongside folder 100 (`Agony in the Garden`, `White`, donation 21.95). This view supports enrolment-level reporting on folder usage.

**View `v_enrolment_enrollee`**

```sql
CREATE VIEW v_enrolment_enrollee AS
SELECT a.enrolment_id, a.enrolment_status, a.duration_years, a.donation_amount, b.enrollee_id AS enrollee_enrollee_id, b.full_name AS enrollee_full_name, b.is_deceased AS enrollee_is_deceased
FROM enrolments a JOIN enrollees b ON a.enrollee_id = b.enrollee_id;
```

| enrolment_id | enrolment_status | duration_years | donation_amount | enrollee_enrollee_id | enrollee_full_name | enrollee_is_deceased |
|---|---|---|---|---|---|---|
| 1 | Pending | 14 | 26.25 | 1 | Theodore Mcgrath | true |
| 2 | Active | 18 | 29.99 | 2 | Account Name | false |
| 3 | Completed | 22 | 16.11 | 3 | Saipan International Airport | true |
| 4 | Pending | 26 | 13.49 | 4 | Norma Fisher | false |

The view `v_enrolment_enrollee` joins `enrolments` to `enrollees` on `enrollee_id`, producing a row per enrolment-enrollee pair. It answers: "For each enrolment, which enrollee was enrolled?" A row would show enrolment 1 (status `Pending`, duration 14 years, donation 26.25) alongside enrollee 1 (`Theodore Mcgrath`, deceased, relationship `regional-relation-96`). This view is useful for enrollee-level analytics, such as counting how many enrolments each enrollee has.

**View `v_enrollee_enrolment_detail`**

```sql
CREATE VIEW v_enrollee_enrolment_detail AS
SELECT a.enrollee_id, a.full_name, a.is_deceased, b.enrolment_id AS enrolment_enrolment_id, b.enrolment_status AS enrolment_enrolment_status, b.duration_years AS enrolment_duration_years
FROM enrollees a
  JOIN enrollees_enrolments j ON j.enrollee_id = a.enrollee_id
  JOIN enrolments b ON b.enrolment_id = j.enrolment_id;
```

| enrollee_id | full_name | is_deceased | enrolment_enrolment_id | enrolment_enrolment_status | enrolment_duration_years |
|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | true | 1 | Pending | 14 |
| 1 | Theodore Mcgrath | true | 2 | Active | 18 |
| 2 | Account Name | false | 2 | Active | 18 |
| 2 | Account Name | false | 3 | Completed | 22 |
| 3 | Saipan International Airport | true | 3 | Completed | 22 |
| 3 | Saipan International Airport | true | 4 | Pending | 26 |
| 4 | Norma Fisher | false | 4 | Pending | 26 |
| 4 | Norma Fisher | false | 1 | Pending | 14 |

The view `v_enrollee_enrolment_detail` joins `enrollees` to `enrolments` on `enrollee_id`, producing a row per enrollee-enrolment association. It answers: "For each enrollee, what are the details of the enrolments they are part of?" A row would show enrollee 1 (`Theodore Mcgrath`, deceased, relationship `regional-relation-96`) alongside enrolment 1 (status `Pending`, duration 14 years, donation 26.25, date `2024-07-10T18:54:00`). This view supports enrollee-level reporting on their enrolment history.

**View `v_enrollee_perpetual_folder`**

```sql
CREATE VIEW v_enrollee_perpetual_folder AS
SELECT a.enrollee_id, a.full_name, a.is_deceased, a.relationship_to_requester, b.id AS folder_id, b.folder_name AS folder_folder_name, b.cover_color AS folder_cover_color
FROM enrollees a JOIN perpetual_folders b ON a.perpetual_folder_id = b.id;
```

| enrollee_id | full_name | is_deceased | relationship_to_requester | folder_id | folder_folder_name | folder_cover_color |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | true | regional-relation-96 | 100 | Agony in the Garden | White |
| 2 | Account Name | false | legacy-relation-97 | 101 | Sacred Heart | Red |
| 3 | Saipan International Airport | true | compact-relation-98 | 102 | St. Patrick | Green |
| 4 | Norma Fisher | false | composite-relation-99 | 103 | Immaculate Conception | Light Blue |

The view `v_enrollee_perpetual_folder` joins `enrollees` to `perpetual_folders` on `perpetual_folder_id`, producing a row per enrollee-folder pair. It answers: "Which perpetual folder is each enrollee associated with?" A row would show enrollee 1 (`Theodore Mcgrath`, deceased, relationship `regional-relation-96`) alongside folder 100 (`Agony in the Garden`, `White`, donation 21.95). This view is useful for understanding the enrollee-to-folder mapping.

**View `v_order_request_occasion_card_detail`**

```sql
CREATE VIEW v_order_request_occasion_card_detail AS
SELECT a.id, a.request_id, a.submission_date, b.occasion_card_id AS card_occasion_card_id, b.card_type AS card_card_type, b.reference_number AS card_reference_number
FROM order_requests a
  JOIN requests_cards j ON j.order_request_id = a.id
  JOIN occasion_cards b ON b.occasion_card_id = j.occasion_card_id;
```

| id | request_id | submission_date | card_occasion_card_id | card_card_type | card_reference_number |
|---|---|---|---|---|---|
| 1000 | 2087732 | 2025-04-24T03:57:00 | 1 | Sympathy | REF-2039 |
| 1000 | 2087732 | 2025-04-24T03:57:00 | 2 | Get Well | REF-2040 |
| 1001 | 575213 | 2022-09-08T10:14:00 | 2 | Get Well | REF-2040 |
| 1001 | 575213 | 2022-09-08T10:14:00 | 3 | For Your Intention | REF-2041 |
| 1002 | 103167 | 2023-02-19T17:31:00 | 3 | For Your Intention | REF-2041 |
| 1002 | 103167 | 2023-02-19T17:31:00 | 4 | Thank You | REF-2042 |
| 1003 | 611510 | 2024-07-03T00:48:00 | 4 | Thank You | REF-2042 |
| 1003 | 611510 | 2024-07-03T00:48:00 | 1 | Sympathy | REF-2039 |

The view `v_order_request_occasion_card_detail` joins `order_requests` to `occasion_cards` (via the junction table `requests_cards`), producing a row per request-card association. It answers: "For each order request, which occasion cards were included?" A row would show order request 1000 (request ID 2087732, submitted `2025-04-24T03:57:00`, delivered by `Post`, quantity 20) alongside card 1 (`Sympathy`, `REF-2039`, donation 21.95). This view is useful for order-level analytics on card distribution.

**View `v_order_request_perpetual_folder`**

```sql
CREATE VIEW v_order_request_perpetual_folder AS
SELECT a.id, a.request_id, a.submission_date, a.delivery_method, b.id AS folder_id, b.folder_name AS folder_folder_name, b.cover_color AS folder_cover_color
FROM order_requests a JOIN perpetual_folders b ON a.perpetual_folder_id = b.id;
```

| id | request_id | submission_date | delivery_method | folder_id | folder_folder_name | folder_cover_color |
|---|---|---|---|---|---|---|
| 1000 | 2087732 | 2025-04-24T03:57:00 | Post | 100 | Agony in the Garden | White |
| 1001 | 575213 | 2022-09-08T10:14:00 | Email | 101 | Sacred Heart | Red |
| 1002 | 103167 | 2023-02-19T17:31:00 | Phone | 102 | St. Patrick | Green |
| 1003 | 611510 | 2024-07-03T00:48:00 | Post | 103 | Immaculate Conception | Light Blue |

The view `v_order_request_perpetual_folder` joins `order_requests` to `perpetual_folders` on `perpetual_folder_id`, producing a row per request-folder pair. It answers: "For each order request, which perpetual folder was involved?" A row would show order request 1000 (request ID 2087732, submitted `2025-04-24T03:57:00`, delivered by `Post`, quantity 20) alongside folder 100 (`Agony in the Garden`, `White`, donation 21.95). This view supports order-level reporting on folder usage.

**View `v_order_request_enrollee`**

```sql
CREATE VIEW v_order_request_enrollee AS
SELECT a.id, a.request_id, a.submission_date, a.delivery_method, b.enrollee_id AS enrollee_enrollee_id, b.full_name AS enrollee_full_name, b.is_deceased AS enrollee_is_deceased
FROM order_requests a JOIN enrollees b ON a.enrollee_id = b.enrollee_id;
```

| id | request_id | submission_date | delivery_method | enrollee_enrollee_id | enrollee_full_name | enrollee_is_deceased |
|---|---|---|---|---|---|---|
| 1000 | 2087732 | 2025-04-24T03:57:00 | Post | 1 | Theodore Mcgrath | true |
| 1001 | 575213 | 2022-09-08T10:14:00 | Email | 2 | Account Name | false |
| 1002 | 103167 | 2023-02-19T17:31:00 | Phone | 3 | Saipan International Airport | true |
| 1003 | 611510 | 2024-07-03T00:48:00 | Post | 4 | Norma Fisher | false |

The view `v_order_request_enrollee` joins `order_requests` to `enrollees` on `enrollee_id`, producing a row per request-enrollee pair. It answers: "For each order request, which enrollee was involved?" A row would show order request 1000 (request ID 2087732, submitted `2025-04-24T03:57:00`, delivered by `Post`, quantity 20) alongside enrollee 1 (`Theodore Mcgrath`, deceased, relationship `regional-relation-96`). This view is useful for understanding which enrollees are associated with which order requests.

The schema as a whole embodies a clean separation between entity definitions (the five core tables), associative relationships (the three junction tables), and analytical access patterns (the twelve views). The core tables normalise the domain into atomic facts: cards are products, folders are memorial containers, enrolments are transactional events, enrollees are the subjects of memorialisation, and order requests are delivery records. The junction tables resolve the many-to-many relationships that arise because a card can appear in multiple enrolments, a folder can participate in multiple enrolments, an enrollee can be part of multiple enrolments, and a request can include multiple card types. The views then reassemble these normalised facts into domain-level perspectives — each view answering a specific question by joining the appropriate tables and presenting the result as a flat, queryable row set. This architecture supports both operational integrity (through foreign keys and normalised storage) and analytical flexibility (through the derived views), making it well-suited for a memorial card programme that needs to track products, enrolments, people, and deliveries in a consistent and queryable manner.