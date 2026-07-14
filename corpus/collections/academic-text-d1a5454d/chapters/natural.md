The academic publishing ecosystem has evolved into a multi-layered infrastructure where textbooks, digital platforms, access credentials, and pedagogical exercises intersect to support learners and institutions alike. At the core of this ecosystem are four foundational record types: academic texts, their authors, the access card packages that grant learners entry to digital resources, and the digital platforms themselves that host content and exercises. Statistical exercises and their underlying concepts form a parallel layer, tied to platforms and concepts to enable structured learning pathways. Understanding how these records relate requires examining each layer in turn, then observing the joined views that answer practical questions about authorship, platform availability, access status, and exercise coverage.

## Academic Texts and Their Authors

The backbone of the publishing operation is the collection of academic texts, each identified by a unique internal `id` and tracked through metadata such as ISBN, edition, publication date, format, and suggested retail price.

**Table `academic_texts`**

| id | isbn | edition | publication_date | format | suggested_retail_price | title | academic_author_id | access_card_package_id | digital_platform_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 2618568 | baseline-edition-91 | 2025-12-01T23:33:00 | legacy-format-25 | 16.54 | Compact Initiative | 1 | 1000 | 1 |
| 2 | 4277024 | pilot-edition-92 | 2022-05-12T06:50:00 | compact-format-26 | 32.21 | Legacy Model | 2 | 1001 | 2 |
| 3 | 1208-0004-M | extended-edition-93 | 2023-10-23T13:07:00 | composite-format-27 | 33.06 | Regional Cluster A | 3 | 1002 | 3 |
| 4 | 3717612 | integrated-edition-94 | 2024-03-07T20:24:00 | primary-format-28 | 29.99 | Seasonal Review | 4 | 1003 | 4 |

Consider the first entry: a text titled *Compact Initiative* (ISBN 2618568), published on 2025-12-01 under the baseline-edition-91 designation. It is formatted as legacy-format-25 and carries a suggested retail price of $16.54. The second text, *Legacy Model* (ISBN 4277024), dates to 2022-05-12 and is priced at $32.21 under the compact-format-26 format. The third, *Regional Cluster A*, was published in October 2023 at $33.06, while the fourth, *Seasonal Review*, appeared in March 2024 at $29.99. Each text carries a foreign key pointing to its primary author and to an access card package and digital platform, establishing the first layer of relational structure.

Authorship is recorded in a separate table that captures the full name, institutional affiliation, and role of each contributor.

**Table `academic_authors`**

| id | author_id | full_name | affiliation | role | academic_text_id |
|---|---|---|---|---|---|
| 1 | Stephen King | Theodore Mcgrath | baseline-affiliat-55 | pilot-role-20 | 1 |
| 2 | Collin Lopez | Account Name | pilot-affiliat-56 | extended-role-21 | 2 |
| 3 | Dana Nguyen | Saipan International Airport | extended-affiliat-57 | integrated-role-22 | 3 |
| 4 | Greg Miller | Norma Fisher | integrated-affiliat-58 | seasonal-role-23 | 4 |

Stephen King of Theodore Mcgrath holds the pilot-role-20 designation and is linked to the first academic text. Collin Lopez, affiliated with Account Name, carries the extended-role-21 label and is associated with the second text. Dana Nguyen, connected to Saipan International Airport, holds the integrated-role-22 role for the third text, while Greg Miller of Norma Fisher carries the seasonal-role-23 designation for the fourth. The `academic_text_id` column in this table creates a direct link back to the text records, ensuring that every authorship claim is traceable to a specific publication.

## Access Card Packages and Digital Platforms

Learners and institutions gain access to digital content through access card packages, which encode the duration of access, the platform name, the current status, and activation timestamps.

**Table `access_card_packages`**

| id | package_id | access_duration | platform_name | status | activation_date | digital_platform_id | academic_text_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 9424918 | composite-access-51 | Baseline Initiative D | active | 2024-03-03T14:42:00 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | account_pymes_1044 | primary-access-52 | Distributed Model | expired | 2025-08-14T21:59:00 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 5844275 | adaptive-access-53 | Adaptive Cluster | redeemed | 2022-01-25T04:16:00 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 2106710 | distributed-access-54 | Primary Review A | unused | 2023-06-09T11:33:00 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The package with identifier 9424918 provides composite-access-51 duration under the name Baseline Initiative D. It is currently active, was activated on 2024-03-03, and is linked to digital platform 1 and academic text 1. In contrast, the package account_pymes_1044, which provides primary-access-52 under the name Distributed Model, has an expired status and was activated on 2025-08-14. The package 5844275 carries adaptive-access-53 duration under Adaptive Cluster with a redeemed status, while 2106710 offers distributed-access-54 under Primary Review A in an unused state. Each package records its creation and last update timestamps, providing an audit trail for access management.

Digital platforms serve as the hosting infrastructure for both content and exercises.

**Table `digital_platforms`**

| id | platform_id | platform_name | version | provider | is_available | academic_text_id |
|---|---|---|---|---|---|---|
| 1 | state_uk_28 | Baseline Initiative D | seasonal-version-71 | legacy-provider-37 | true | 1 |
| 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model | regional-version-72 | compact-provider-38 | false | 2 |
| 3 | 4716417 | Adaptive Cluster | legacy-version-73 | composite-provider-39 | true | 3 |
| 4 | 10966228 | Primary Review A | compact-version-74 | primary-provider-40 | false | 4 |

Platform state_uk_28, named Baseline Initiative D and running seasonal-version-71, is provided by legacy-provider-37 and is currently available. Its counterpart, identified by the UUID e6ce01fe-8fc3-11eb-924d-9cd76263cbd0, is named Distributed Model, runs regional-version-72, is provided by compact-provider-38, and is currently unavailable. Platform 4716417, named Adaptive Cluster and running legacy-version-73, is available and provided by composite-provider-39. Platform 10966228, named Primary Review A, runs compact-version-74, is provided by primary-provider-40, and is unavailable. Each platform is linked to an academic text, anchoring the hosting relationship.

## Statistical Exercises and Concepts

Beyond static content, the ecosystem supports structured learning through statistical exercises. These exercises are categorized by type, difficulty level, update status, and the concept they cover.

**Table `statistical_exercises`**

| id | exercise_id | exercise_type | difficulty_level | is_updated | concept_covered | digital_platform_id | statistical_concept_id |
|---|---|---|---|---|---|---|---|
| 1000 | 8189475 | Retain Your Knowledge | 22 | false | seasonal-concept-53 | 1 | 1 |
| 1001 | Karyawan | Big Data | 28 | true | regional-concept-54 | 2 | 2 |
| 1002 | 611494 | Standard | 34 | false | legacy-concept-55 | 3 | 3 |
| 1003 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | Step-by-Step | 40 | true | compact-concept-56 | 4 | 4 |

Exercise 8189475, labeled Retain Your Knowledge, carries a difficulty level of 22, has not been updated, covers seasonal-concept-53, and is hosted on digital platform 1. Exercise Karyawan, categorized as Big Data, has a difficulty of 28, has been updated, covers regional-concept-54, and runs on platform 2. Exercise 611494, a Standard type at difficulty level 34, covers legacy-concept-55 on platform 3. Exercise 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3, a Step-by-Step exercise at difficulty 40, covers compact-concept-56 on platform 4. Each exercise references both a digital platform and a statistical concept, creating a bridge between pedagogical activities and their theoretical foundations.

Statistical concepts themselves are cataloged with a name, category, and a flag indicating whether the concept is core to the curriculum.

**Table `statistical_concepts`**

| statistical_concept_id | concept_id | concept_name | category | is_core | statistical_exercise_id |
|---|---|---|---|---|---|
| 1 | 884350 | Pilot Cluster | compact-category-92 | false | 1000 |
| 2 | 392497 | Baseline Review | composite-category-93 | true | 1001 |
| 3 | 2106713 | Distributed Initiative A | primary-category-94 | false | 1002 |
| 4 | 4463648 | Adaptive Model | adaptive-category-95 | true | 1003 |

Pilot Cluster (concept_id 884350) falls under compact-category-92 and is not marked as core; it is associated with exercise 1000. Baseline Review (concept_id 392497) belongs to composite-category-93 and is marked as core, linked to exercise 1001. Distributed Initiative A (concept_id 2106713) is in primary-category-94, is not core, and connects to exercise 1002. Adaptive Model (concept_id 4463648) resides in adaptive-category-95, is marked as core, and is tied to exercise 1003. The `statistical_exercise_id` column in this table ensures that every concept can be traced to the exercises that teach it.

The platforms_exercises table provides an additional mapping layer between platforms and exercises, enabling flexible assignment of exercises to hosting environments.

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

## Joined Views: Answering Operational Questions

Individual tables tell part of the story, but the real operational questions require joining records across tables. The views defined in the system answer these questions by combining related records into single, queryable results.

The academic_text_academic_author_view answers the question: "Which author is responsible for which academic text, and what is their institutional affiliation?" This join pairs each text with its author through the shared identifier. For instance, the text Compact Initiative (id 1) is paired with author Stephen King of Theodore Mcgrath, who holds the pilot-role-20 designation. Similarly, Legacy Model (id 2) is linked to Collin Lopez of Account Name, carrying the extended-role-21 label. This view is essential for editorial tracking and for identifying the primary contributor to any given publication.

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

The academic_text_access_card_package_view addresses: "Which access card package is associated with which academic text, and what is the current status of that access?" This join connects texts to their corresponding access packages. The text Compact Initiative (id 1) is linked to package 9424918 (Baseline Initiative D), which is active. The text Legacy Model (id 2) connects to package account_pymes_1044 (Distributed Model), which has expired. This view is critical for customer support and access management, as it reveals at a glance which texts have active, expired, redeemed, or unused access packages.

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

The academic_text_digital_platform_view answers: "Which digital platform hosts which academic text, and is that platform currently available?" This join links texts to their hosting platforms. Compact Initiative (id 1) is hosted on platform state_uk_28 (Baseline Initiative D), which is available. Legacy Model (id 2) is hosted on platform e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 (Distributed Model), which is unavailable. This view is indispensable for platform operations teams monitoring content availability and for learners checking whether the platform hosting their text is operational.

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

The academic_author_academic_text_view provides the inverse perspective of the first view, answering: "For a given author, which academic texts are they associated with?" This join presents authorship from the author's side. Stephen King (author_id 1) is associated with the text Compact Initiative (id 1). Collin Lopez (author_id 2) is linked to Legacy Model (id 2). This view supports workload analysis, author portfolio management, and institutional affiliation reporting.

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

The access_card_package_digital_platform_view answers: "Which digital platform is associated with which access card package, and what is the package's status?" This join connects packages to their hosting platforms. Package 9424918 (Baseline Initiative D, active) is linked to platform state_uk_28. Package account_pymes_1044 (Distributed Model, expired) connects to platform e6ce01fe-8fc3-11eb-924d-9cd76263cbd0. This view is valuable for revenue tracking and platform utilization analysis, as it reveals which platforms are generating active access versus those tied to expired or unused packages.

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

The access_card_package_academic_text_view addresses: "Which academic text is tied to which access card package, and what is the package's lifecycle status?" This join pairs texts with their access packages. Text Compact Initiative (id 1) is tied to package 9424918 (active), while text Legacy Model (id 2) is tied to package account_pymes_1044 (expired). This view is essential for understanding the commercial lifecycle of each text, from initial activation through expiration or redemption.

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

The digital_platform_academic_text_view provides the inverse of the earlier platform-text join, answering: "For a given digital platform, which academic text does it host?" Platform state_uk_28 (Baseline Initiative D) hosts text Compact Initiative (id 1). Platform e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 (Distributed Model) hosts text Legacy Model (id 2). This view supports capacity planning and content audits, allowing platform managers to see exactly what content resides on each hosting environment.

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

The digital_platform_statistical_exercise_detail_view answers a more complex question: "Which statistical exercises are hosted on which digital platforms, and what concepts do those exercises cover?" This join connects platforms to exercises through the shared platform identifier. Platform state_uk_28 hosts exercise 8189475 (Retain Your Knowledge, difficulty 22), which covers seasonal-concept-53. Platform e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 hosts exercise Karyawan (Big Data, difficulty 28), covering regional-concept-54. This view is critical for curriculum designers evaluating whether exercises are properly distributed across available platforms.

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

The statistical_exercise_digital_platform_view provides the inverse perspective, answering: "For a given statistical exercise, which digital platform hosts it?" Exercise 8189475 (Retain Your Knowledge) is hosted on platform state_uk_28. Exercise Karyawan (Big Data) is hosted on platform e6ce01fe-8fc3-11eb-924d-9cd76263cbd0. This view supports exercise-level auditing and helps identify whether any platform is over- or under-utilized for exercise hosting.

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

The statistical_exercise_statistical_concept_view answers: "Which statistical concept does each exercise cover, and is that concept marked as core?" This join links exercises to their underlying concepts. Exercise 8189475 (Retain Your Knowledge) covers Pilot Cluster (concept_id 884350), which is not a core concept. Exercise Karyawan (Big Data) covers Baseline Review (concept_id 392497), which is marked as core. This view is essential for curriculum alignment, ensuring that exercises adequately cover both core and supplementary concepts.

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

The statistical_concept_statistical_exercise_view provides the inverse, answering: "For a given statistical concept, which exercises teach it?" Pilot Cluster (concept_id 884350) is taught through exercise 8189475 (Retain Your Knowledge). Baseline Review (concept_id 392497) is taught through exercise Karyawan (Big Data). This view supports concept coverage analysis, helping educators verify that every concept—core or supplementary—has at least one associated exercise.

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

## Closing Synthesis

The academic publishing ecosystem is defined by a network of interlocking records: texts authored by individuals, accessed through time-limited packages, hosted on digital platforms, and enriched with structured statistical exercises tied to pedagogical concepts. Each base table captures a distinct dimension of this ecosystem, while the views synthesize these dimensions into actionable insights. The author-text joins clarify responsibility and affiliation. The text-package and text-platform joins reveal the commercial and technical infrastructure supporting each publication. The platform-exercise and exercise-concept joins illuminate the learning layer that transforms static content into active pedagogy. Together, these records and their joined forms provide a complete operational picture, enabling editorial, technical, and instructional teams to manage the full lifecycle of academic content from authorship through access to exercise delivery.