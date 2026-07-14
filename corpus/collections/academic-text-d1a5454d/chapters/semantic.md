The academic publishing ecosystem under study comprises a network of scholarly texts, their authors, digital distribution platforms, access-card licensing packages, and the statistical exercises embedded within those platforms. Each text is a first-class entity carrying bibliographic metadata—ISBN, edition, publication date, format, and suggested retail price—alongside a human-readable title. Authors are modelled as distinct entities with institutional affiliations and named roles, while digital platforms provide the technical substrate for content delivery. Access-card packages sit between texts and platforms, governing activation windows and subscription status. Finally, statistical exercises populate the platforms with pedagogical content, each tagged to a statistical concept and a difficulty tier. The relational schema normalises these concepts into seven base tables and eleven materialised views, each view encoding a specific join that reconstructs a domain fact from the underlying normalised rows.

## The Core Entity Layer

The publishing domain begins with the `academic_texts` table, which anchors the entire model. Each row represents a distinct publication, identified by a surrogate `id` and enriched with bibliographic columns: `isbn`, `edition`, `publication_date`, `format`, `suggested_retail_price`, and `title`. The title "Compact Initiative" (id 1) carries ISBN `2618568` in the "baseline-edition-91" format, published on 2025-12-01 with a suggested retail price of 16.54. The title "Legacy Model" (id 2) bears ISBN `4277024`, while "Regional Cluster A" (id 3) uses the ISBN `1208-0004-M` and "Seasonal Review" (id 4) carries `3717612`. Three foreign-key columns—`academic_author_id`, `access_card_package_id`, and `digital_platform_id`—bind each text to its author, its access-card package, and its hosting platform respectively. These FK columns are the primary mechanism through which the otherwise isolated entity tables are woven into a coherent relational graph.

**Table `academic_texts`**

| id | isbn | edition | publication_date | format | suggested_retail_price | title | academic_author_id | access_card_package_id | digital_platform_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 2618568 | baseline-edition-91 | 2025-12-01T23:33:00 | legacy-format-25 | 16.54 | Compact Initiative | 1 | 1000 | 1 |
| 2 | 4277024 | pilot-edition-92 | 2022-05-12T06:50:00 | compact-format-26 | 32.21 | Legacy Model | 2 | 1001 | 2 |
| 3 | 1208-0004-M | extended-edition-93 | 2023-10-23T13:07:00 | composite-format-27 | 33.06 | Regional Cluster A | 3 | 1002 | 3 |
| 4 | 3717612 | integrated-edition-94 | 2024-03-07T20:24:00 | primary-format-28 | 29.99 | Seasonal Review | 4 | 1003 | 4 |

Authors are captured in the `academic_authors` table, which stores each author's `id`, a secondary `author_id`, a `full_name`, an `affiliation`, a `role`, and a back-reference `academic_text_id` pointing to the text they authored. Stephen King (id 1), affiliated with "Theodore Mcgrath" under the "pilot-role-20" designation, is linked to academic text id 1. Collin Lopez (id 2) at "Account Name" with "extended-role-21" maps to text id 2. Dana Nguyen (id 3) at "Saipan International Airport" with "integrated-role-22" maps to text id 3, and Greg Miller (id 4) at "Norma Fisher" with "seasonal-role-23" maps to text id 4. The `academic_text_id` column creates a cardinality-bounded relationship: each author row is scoped to exactly one text, while a text may reference one author through its own `academic_author_id` column.

**Table `academic_authors`**

| id | author_id | full_name | affiliation | role | academic_text_id |
|---|---|---|---|---|---|
| 1 | Stephen King | Theodore Mcgrath | baseline-affiliat-55 | pilot-role-20 | 1 |
| 2 | Collin Lopez | Account Name | pilot-affiliat-56 | extended-role-21 | 2 |
| 3 | Dana Nguyen | Saipan International Airport | extended-affiliat-57 | integrated-role-22 | 3 |
| 4 | Greg Miller | Norma Fisher | integrated-affiliat-58 | seasonal-role-23 | 4 |

Access-card packages are modelled in `access_card_packages`, which carries a rich set of licensing attributes: `package_id`, `access_duration`, `platform_name`, `status`, `activation_date`, `created_at`, and `updated_at`. The `status` column enumerates lifecycle states such as "active", "expired", "redeemed", and "unused". Package id 1000 (internal `package_id` 9424918) has "composite-access-51" duration, is named "Baseline Initiative D", and holds "active" status as of 2024-03-03. Package id 1001 (internal `account_pymes_1044`) uses "primary-access-52" duration, is named "Distributed Model", and carries "expired" status. Package id 1002 (internal `5844275`) is "Adaptive Cluster" with "adaptive-access-53" duration and "redeemed" status, while package id 1003 (internal `2106710`) is "Primary Review A" with "distributed-access-54" duration and "unused" status. Two FK columns—`digital_platform_id` and `academic_text_id`—tie each package to its platform and its associated text.

**Table `access_card_packages`**

| id | package_id | access_duration | platform_name | status | activation_date | digital_platform_id | academic_text_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 9424918 | composite-access-51 | Baseline Initiative D | active | 2024-03-03T14:42:00 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | account_pymes_1044 | primary-access-52 | Distributed Model | expired | 2025-08-14T21:59:00 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 5844275 | adaptive-access-53 | Adaptive Cluster | redeemed | 2022-01-25T04:16:00 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 2106710 | distributed-access-54 | Primary Review A | unused | 2023-06-09T11:33:00 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Digital platforms reside in `digital_platforms`, which records each platform's `id`, a secondary `platform_id`, a `platform_name`, a `version`, a `provider`, an `is_available` boolean, and an `academic_text_id` FK. Platform id 1 (internal `state_uk_28`) is named "Baseline Initiative D", runs "seasonal-version-71", is provided by "legacy-provider-37", and is currently available. Platform id 2 (internal UUID `e6ce01fe-8fc3-11eb-924d-9cd76263cbd0`) is "Distributed Model" on "regional-version-72" from "compact-provider-38" and is unavailable. Platform id 3 (internal `4716417`) is "Adaptive Cluster" on "legacy-version-73" from "composite-provider-39" and is available. Platform id 4 (internal `10966228`) is "Primary Review A" on "compact-version-74" from "primary-provider-40" and is unavailable.

**Table `digital_platforms`**

| id | platform_id | platform_name | version | provider | is_available | academic_text_id |
|---|---|---|---|---|---|---|
| 1 | state_uk_28 | Baseline Initiative D | seasonal-version-71 | legacy-provider-37 | true | 1 |
| 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model | regional-version-72 | compact-provider-38 | false | 2 |
| 3 | 4716417 | Adaptive Cluster | legacy-version-73 | composite-provider-39 | true | 3 |
| 4 | 10966228 | Primary Review A | compact-version-74 | primary-provider-40 | false | 4 |

The statistical domain is anchored by `statistical_exercises`, which stores each exercise's `id`, a secondary `exercise_id`, an `exercise_type`, a `difficulty_level`, an `is_updated` flag, a `concept_covered` label, and two FK columns: `digital_platform_id` and `statistical_concept_id`. Exercise id 1000 (internal `8189475`) is of type "Retain Your Knowledge" at difficulty level 22, is not updated, covers "seasonal-concept-53", and is hosted on digital platform id 1. Exercise id 1001 (internal `Karyawan`) is "Big Data" at difficulty 28, is updated, covers "regional-concept-54", and sits on platform id 2. Exercise id 1002 (internal `611494`) is "Standard" at difficulty 34, is not updated, covers "legacy-concept-55", and is on platform id 3. Exercise id 1003 (internal `8599e66e-9bad-11eb-a8a2-19ed5c03f8d3`) is "Step-by-Step" at difficulty 40, is updated, covers "compact-concept-56", and is on platform id 4.

**Table `statistical_exercises`**

| id | exercise_id | exercise_type | difficulty_level | is_updated | concept_covered | digital_platform_id | statistical_concept_id |
|---|---|---|---|---|---|---|---|
| 1000 | 8189475 | Retain Your Knowledge | 22 | false | seasonal-concept-53 | 1 | 1 |
| 1001 | Karyawan | Big Data | 28 | true | regional-concept-54 | 2 | 2 |
| 1002 | 611494 | Standard | 34 | false | legacy-concept-55 | 3 | 3 |
| 1003 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | Step-by-Step | 40 | true | compact-concept-56 | 4 | 4 |

Statistical concepts are captured in `statistical_concepts`, which records each concept's `statistical_concept_id`, a secondary `concept_id`, a `concept_name`, a `category`, an `is_core` boolean, and a `statistical_exercise_id` FK. Concept id 1 (internal `884350`) is named "Pilot Cluster", belongs to "compact-category-92", is not core, and is referenced by exercise 1000. Concept id 2 (internal `392497`) is "Baseline Review" in "composite-category-93", is core, and is referenced by exercise 1001. Concept id 3 (internal `2106713`) is "Distributed Initiative A" in "primary-category-94", is not core, and is referenced by exercise 1002. Concept id 4 (internal `4463648`) is "Adaptive Model" in "adaptive-category-95", is core, and is referenced by exercise 1003.

**Table `statistical_concepts`**

| statistical_concept_id | concept_id | concept_name | category | is_core | statistical_exercise_id |
|---|---|---|---|---|---|
| 1 | 884350 | Pilot Cluster | compact-category-92 | false | 1000 |
| 2 | 392497 | Baseline Review | composite-category-93 | true | 1001 |
| 3 | 2106713 | Distributed Initiative A | primary-category-94 | false | 1002 |
| 4 | 4463648 | Adaptive Model | adaptive-category-95 | true | 1003 |

The `platforms_exercises` table serves as a junction table, mediating the many-to-many relationship between digital platforms and statistical exercises. In this particular dataset, each platform hosts exactly one exercise, but the junction-table pattern allows for future expansion where a single platform could carry multiple exercises or an exercise could be cross-listed across platforms.

**Table `platforms_exercises`**

| digital_platform_id | statistical_exercise_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

## View-Based Reconstructive Joins

The eleven materialised views each encode a specific join that reconstructs a domain fact from the normalised base tables. They answer concrete analytical questions by pulling together columns that would otherwise be scattered across multiple tables.

The `academic_text_academic_author_view` joins `academic_texts` with `academic_authors` on the shared text-author relationship. It answers the question: "Which author is associated with each academic text, and what are their institutional details?" Reading row 1, the view would present text id 1 ("Compact Initiative") alongside author id 1 (Stephen King, "Theodore Mcgrath", "pilot-role-20"). Row 2 pairs text id 2 ("Legacy Model") with author id 2 (Collin Lopez, "Account Name", "extended-role-21").

**View `academic_text_academic_author_view`**

```sql
CREATE VIEW academic_text_academic_author_view AS
SELECT a.id, a.isbn, a.edition, a.publication_date, b.id AS author_id, b.author_id AS author_author_id, b.full_name AS author_full_name
FROM academic_texts a JOIN academic_authors b ON a.academic_author_id = b.id;
```

| id | isbn | edition | publication_date | author_id | author_author_id | author_full_name |
|---|---|---|---|---|---|---|
| 1 | 2618568 | baseline-edition-91 | 2025-12-01T23:33:00 | 1 | Stephen King | Theodore Mcgrath |
| 2 | 4277024 | pilot-edition-92 | 2022-05-12T06:50:00 | 2 | Collin Lopez | Account Name |
| 3 | 1208-0004-M | extended-edition-93 | 2023-10-23T13:07:00 | 3 | Dana Nguyen | Saipan International Airport |
| 4 | 3717612 | integrated-edition-94 | 2024-03-07T20:24:00 | 4 | Greg Miller | Norma Fisher |

The `academic_text_access_card_package_view` joins `academic_texts` with `access_card_packages` to answer: "Which access-card package is linked to each text, and what is its licensing status?" Row 1 shows text id 1 ("Compact Initiative") paired with package id 1000 ("Baseline Initiative D", status "active", duration "composite-access-51"). Row 2 shows text id 2 ("Legacy Model") with package id 1001 ("Distributed Model", status "expired", duration "primary-access-52").

**View `academic_text_access_card_package_view`**

```sql
CREATE VIEW academic_text_access_card_package_view AS
SELECT a.id, a.isbn, a.edition, a.publication_date, b.id AS package_id, b.package_id AS package_package_id, b.access_duration AS package_access_duration
FROM academic_texts a JOIN access_card_packages b ON a.access_card_package_id = b.id;
```

| id | isbn | edition | publication_date | package_id | package_package_id | package_access_duration |
|---|---|---|---|---|---|---|
| 1 | 2618568 | baseline-edition-91 | 2025-12-01T23:33:00 | 1000 | 9424918 | composite-access-51 |
| 2 | 4277024 | pilot-edition-92 | 2022-05-12T06:50:00 | 1001 | account_pymes_1044 | primary-access-52 |
| 3 | 1208-0004-M | extended-edition-93 | 2023-10-23T13:07:00 | 1002 | 5844275 | adaptive-access-53 |
| 4 | 3717612 | integrated-edition-94 | 2024-03-07T20:24:00 | 1003 | 2106710 | distributed-access-54 |

The `academic_text_digital_platform_view` joins `academic_texts` with `digital_platforms` to answer: "Which digital platform hosts each text, and is it currently available?" Row 1 presents text id 1 ("Compact Initiative") on platform id 1 ("Baseline Initiative D", version "seasonal-version-71", provider "legacy-provider-37", available). Row 2 presents text id 2 ("Legacy Model") on platform id 2 ("Distributed Model", version "regional-version-72", provider "compact-provider-38", unavailable).

**View `academic_text_digital_platform_view`**

```sql
CREATE VIEW academic_text_digital_platform_view AS
SELECT a.id, a.isbn, a.edition, a.publication_date, b.id AS platform_id, b.platform_id AS platform_platform_id, b.platform_name AS platform_platform_name
FROM academic_texts a JOIN digital_platforms b ON a.digital_platform_id = b.id;
```

| id | isbn | edition | publication_date | platform_id | platform_platform_id | platform_platform_name |
|---|---|---|---|---|---|---|
| 1 | 2618568 | baseline-edition-91 | 2025-12-01T23:33:00 | 1 | state_uk_28 | Baseline Initiative D |
| 2 | 4277024 | pilot-edition-92 | 2022-05-12T06:50:00 | 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model |
| 3 | 1208-0004-M | extended-edition-93 | 2023-10-23T13:07:00 | 3 | 4716417 | Adaptive Cluster |
| 4 | 3717612 | integrated-edition-94 | 2024-03-07T20:24:00 | 4 | 10966228 | Primary Review A |

The `academic_author_academic_text_view` reverses the perspective of the first view, joining `academic_authors` with `academic_texts` to answer: "For each author, which text do they author and what are the text's bibliographic details?" Row 1 shows author id 1 (Stephen King, "Theodore Mcgrath", "pilot-role-20") linked to text id 1 ("Compact Initiative", ISBN `2618568`, edition "baseline-edition-91", price 16.54). Row 2 shows author id 2 (Collin Lopez, "Account Name", "extended-role-21") linked to text id 2 ("Legacy Model", ISBN `4277024`, edition "pilot-edition-92", price 32.21).

**View `academic_author_academic_text_view`**

```sql
CREATE VIEW academic_author_academic_text_view AS
SELECT a.id, a.author_id, a.full_name, a.affiliation, b.id AS text_id, b.isbn AS text_isbn, b.edition AS text_edition
FROM academic_authors a JOIN academic_texts b ON a.academic_text_id = b.id;
```

| id | author_id | full_name | affiliation | text_id | text_isbn | text_edition |
|---|---|---|---|---|---|---|
| 1 | Stephen King | Theodore Mcgrath | baseline-affiliat-55 | 1 | 2618568 | baseline-edition-91 |
| 2 | Collin Lopez | Account Name | pilot-affiliat-56 | 2 | 4277024 | pilot-edition-92 |
| 3 | Dana Nguyen | Saipan International Airport | extended-affiliat-57 | 3 | 1208-0004-M | extended-edition-93 |
| 4 | Greg Miller | Norma Fisher | integrated-affiliat-58 | 4 | 3717612 | integrated-edition-94 |

The `access_card_package_digital_platform_view` joins `access_card_packages` with `digital_platforms` to answer: "Which digital platform is associated with each access-card package, and what are the platform's technical details?" Row 1 shows package id 1000 ("Baseline Initiative D", status "active", duration "composite-access-51") on platform id 1 ("Baseline Initiative D", version "seasonal-version-71", provider "legacy-provider-37", available). Row 2 shows package id 1001 ("Distributed Model", status "expired", duration "primary-access-52") on platform id 2 ("Distributed Model", version "regional-version-72", provider "compact-provider-38", unavailable).

**View `access_card_package_digital_platform_view`**

```sql
CREATE VIEW access_card_package_digital_platform_view AS
SELECT a.id, a.package_id, a.access_duration, a.platform_name, b.id AS platform_id, b.platform_id AS platform_platform_id, b.platform_name AS platform_platform_name
FROM access_card_packages a JOIN digital_platforms b ON a.digital_platform_id = b.id;
```

| id | package_id | access_duration | platform_name | platform_id | platform_platform_id | platform_platform_name |
|---|---|---|---|---|---|---|
| 1000 | 9424918 | composite-access-51 | Baseline Initiative D | 1 | state_uk_28 | Baseline Initiative D |
| 1001 | account_pymes_1044 | primary-access-52 | Distributed Model | 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model |
| 1002 | 5844275 | adaptive-access-53 | Adaptive Cluster | 3 | 4716417 | Adaptive Cluster |
| 1003 | 2106710 | distributed-access-54 | Primary Review A | 4 | 10966228 | Primary Review A |

The `access_card_package_academic_text_view` joins `access_card_packages` with `academic_texts` to answer: "For each access-card package, which academic text does it license and what are the text's metadata?" Row 1 shows package id 1000 ("Baseline Initiative D", status "active") linked to text id 1 ("Compact Initiative", ISBN `2618568`, edition "baseline-edition-91", price 16.54). Row 2 shows package id 1001 ("Distributed Model", status "expired") linked to text id 2 ("Legacy Model", ISBN `4277024`, edition "pilot-edition-92", price 32.21).

**View `access_card_package_academic_text_view`**

```sql
CREATE VIEW access_card_package_academic_text_view AS
SELECT a.id, a.package_id, a.access_duration, a.platform_name, b.id AS text_id, b.isbn AS text_isbn, b.edition AS text_edition
FROM access_card_packages a JOIN academic_texts b ON a.academic_text_id = b.id;
```

| id | package_id | access_duration | platform_name | text_id | text_isbn | text_edition |
|---|---|---|---|---|---|---|
| 1000 | 9424918 | composite-access-51 | Baseline Initiative D | 1 | 2618568 | baseline-edition-91 |
| 1001 | account_pymes_1044 | primary-access-52 | Distributed Model | 2 | 4277024 | pilot-edition-92 |
| 1002 | 5844275 | adaptive-access-53 | Adaptive Cluster | 3 | 1208-0004-M | extended-edition-93 |
| 1003 | 2106710 | distributed-access-54 | Primary Review A | 4 | 3717612 | integrated-edition-94 |

The `digital_platform_academic_text_view` joins `digital_platforms` with `academic_texts` to answer: "For each digital platform, which academic text does it host and what are the text's bibliographic attributes?" Row 1 shows platform id 1 ("Baseline Initiative D", version "seasonal-version-71", provider "legacy-provider-37", available) hosting text id 1 ("Compact Initiative", ISBN `2618568`, edition "baseline-edition-91", price 16.54). Row 2 shows platform id 2 ("Distributed Model", version "regional-version-72", provider "compact-provider-38", unavailable) hosting text id 2 ("Legacy Model", ISBN `4277024`, edition "pilot-edition-92", price 32.21).

**View `digital_platform_academic_text_view`**

```sql
CREATE VIEW digital_platform_academic_text_view AS
SELECT a.id, a.platform_id, a.platform_name, a.version, b.id AS text_id, b.isbn AS text_isbn, b.edition AS text_edition
FROM digital_platforms a JOIN academic_texts b ON a.academic_text_id = b.id;
```

| id | platform_id | platform_name | version | text_id | text_isbn | text_edition |
|---|---|---|---|---|---|---|
| 1 | state_uk_28 | Baseline Initiative D | seasonal-version-71 | 1 | 2618568 | baseline-edition-91 |
| 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model | regional-version-72 | 2 | 4277024 | pilot-edition-92 |
| 3 | 4716417 | Adaptive Cluster | legacy-version-73 | 3 | 1208-0004-M | extended-edition-93 |
| 4 | 10966228 | Primary Review A | compact-version-74 | 4 | 3717612 | integrated-edition-94 |

The `digital_platform_statistical_exercise_detail_view` joins `digital_platforms` with `statistical_exercises` to answer: "For each digital platform, which statistical exercises does it host and what are the exercise characteristics?" Row 1 shows platform id 1 ("Baseline Initiative D", version "seasonal-version-71", provider "legacy-provider-37", available) hosting exercise id 1000 ("Retain Your Knowledge", difficulty 22, not updated, covers "seasonal-concept-53"). Row 2 shows platform id 2 ("Distributed Model", version "regional-version-72", provider "compact-provider-38", unavailable) hosting exercise id 1001 ("Big Data", difficulty 28, updated, covers "regional-concept-54").

**View `digital_platform_statistical_exercise_detail_view`**

```sql
CREATE VIEW digital_platform_statistical_exercise_detail_view AS
SELECT a.id, a.platform_id, a.platform_name, b.id AS exercise_id, b.exercise_id AS exercise_exercise_id, b.exercise_type AS exercise_exercise_type
FROM digital_platforms a
  JOIN platforms_exercises j ON j.digital_platform_id = a.id
  JOIN statistical_exercises b ON b.id = j.statistical_exercise_id;
```

| id | platform_id | platform_name | exercise_id | exercise_exercise_id | exercise_exercise_type |
|---|---|---|---|---|---|
| 1 | state_uk_28 | Baseline Initiative D | 1000 | 8189475 | Retain Your Knowledge |
| 1 | state_uk_28 | Baseline Initiative D | 1001 | Karyawan | Big Data |
| 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model | 1001 | Karyawan | Big Data |
| 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model | 1002 | 611494 | Standard |
| 3 | 4716417 | Adaptive Cluster | 1002 | 611494 | Standard |
| 3 | 4716417 | Adaptive Cluster | 1003 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | Step-by-Step |
| 4 | 10966228 | Primary Review A | 1003 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | Step-by-Step |
| 4 | 10966228 | Primary Review A | 1000 | 8189475 | Retain Your Knowledge |

The `statistical_exercise_digital_platform_view` reverses the perspective, joining `statistical_exercises` with `digital_platforms` to answer: "For each statistical exercise, which digital platform hosts it and what are the platform's technical details?" Row 1 shows exercise id 1000 ("Retain Your Knowledge", difficulty 22, not updated, covers "seasonal-concept-53") hosted on platform id 1 ("Baseline Initiative D", version "seasonal-version-71", provider "legacy-provider-37", available). Row 2 shows exercise id 1001 ("Big Data", difficulty 28, updated, covers "regional-concept-54") hosted on platform id 2 ("Distributed Model", version "regional-version-72", provider "compact-provider-38", unavailable).

**View `statistical_exercise_digital_platform_view`**

```sql
CREATE VIEW statistical_exercise_digital_platform_view AS
SELECT a.id, a.exercise_id, a.exercise_type, a.difficulty_level, b.id AS platform_id, b.platform_id AS platform_platform_id, b.platform_name AS platform_platform_name
FROM statistical_exercises a JOIN digital_platforms b ON a.digital_platform_id = b.id;
```

| id | exercise_id | exercise_type | difficulty_level | platform_id | platform_platform_id | platform_platform_name |
|---|---|---|---|---|---|---|
| 1000 | 8189475 | Retain Your Knowledge | 22 | 1 | state_uk_28 | Baseline Initiative D |
| 1001 | Karyawan | Big Data | 28 | 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model |
| 1002 | 611494 | Standard | 34 | 3 | 4716417 | Adaptive Cluster |
| 1003 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | Step-by-Step | 40 | 4 | 10966228 | Primary Review A |

The `statistical_exercise_statistical_concept_view` joins `statistical_exercises` with `statistical_concepts` to answer: "For each statistical exercise, which statistical concept does it cover and what are the concept's classification attributes?" Row 1 shows exercise id 1000 ("Retain Your Knowledge", difficulty 22, not updated, covers "seasonal-concept-53") linked to concept id 1 ("Pilot Cluster", category "compact-category-92", not core). Row 2 shows exercise id 1001 ("Big Data", difficulty 28, updated, covers "regional-concept-54") linked to concept id 2 ("Baseline Review", category "composite-category-93", core).

**View `statistical_exercise_statistical_concept_view`**

```sql
CREATE VIEW statistical_exercise_statistical_concept_view AS
SELECT a.id, a.exercise_id, a.exercise_type, a.difficulty_level, b.statistical_concept_id AS concept_statistical_concept_id, b.concept_id AS concept_concept_id, b.concept_name AS concept_concept_name
FROM statistical_exercises a JOIN statistical_concepts b ON a.statistical_concept_id = b.statistical_concept_id;
```

| id | exercise_id | exercise_type | difficulty_level | concept_statistical_concept_id | concept_concept_id | concept_concept_name |
|---|---|---|---|---|---|---|
| 1000 | 8189475 | Retain Your Knowledge | 22 | 1 | 884350 | Pilot Cluster |
| 1001 | Karyawan | Big Data | 28 | 2 | 392497 | Baseline Review |
| 1002 | 611494 | Standard | 34 | 3 | 2106713 | Distributed Initiative A |
| 1003 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | Step-by-Step | 40 | 4 | 4463648 | Adaptive Model |

The `statistical_concept_statistical_exercise_view` reverses the perspective, joining `statistical_concepts` with `statistical_exercises` to answer: "For each statistical concept, which exercise covers it and what are the exercise's characteristics?" Row 1 shows concept id 1 ("Pilot Cluster", category "compact-category-92", not core) covered by exercise id 1000 ("Retain Your Knowledge", difficulty 22, not updated, covers "seasonal-concept-53"). Row 2 shows concept id 2 ("Baseline Review", category "composite-category-93", core) covered by exercise id 1001 ("Big Data", difficulty 28, updated, covers "regional-concept-54").

**View `statistical_concept_statistical_exercise_view`**

```sql
CREATE VIEW statistical_concept_statistical_exercise_view AS
SELECT a.statistical_concept_id, a.concept_id, a.concept_name, a.category, b.id AS exercise_id, b.exercise_id AS exercise_exercise_id, b.exercise_type AS exercise_exercise_type
FROM statistical_concepts a JOIN statistical_exercises b ON a.statistical_exercise_id = b.id;
```

| statistical_concept_id | concept_id | concept_name | category | exercise_id | exercise_exercise_id | exercise_exercise_type |
|---|---|---|---|---|---|---|
| 1 | 884350 | Pilot Cluster | compact-category-92 | 1000 | 8189475 | Retain Your Knowledge |
| 2 | 392497 | Baseline Review | composite-category-93 | 1001 | Karyawan | Big Data |
| 3 | 2106713 | Distributed Initiative A | primary-category-94 | 1002 | 611494 | Standard |
| 4 | 4463648 | Adaptive Model | adaptive-category-95 | 1003 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | Step-by-Step |

## Synthesis

The relational schema for this academic publishing domain achieves a clean separation of concerns: bibliographic metadata lives in `academic_texts`, authorship in `academic_authors`, licensing in `access_card_packages`, technical infrastructure in `digital_platforms`, and pedagogical content in `statistical_exercises` and `statistical_concepts`. The `platforms_exercises` junction table provides the extensibility needed for many-to-many relationships between platforms and exercises. Each of the eleven views materialises a specific join path, allowing analysts to reconstruct domain facts—such as "which author wrote which text and what is the text's retail price" or "which statistical concept is core and which exercise covers it"—without manually writing join clauses. The foreign-key columns (`academic_author_id`, `access_card_package_id`, `digital_platform_id`, `academic_text_id`, `statistical_concept_id`, and `statistical_exercise_id`) serve as the structural glue that binds these otherwise independent entity tables into a coherent, queryable whole.