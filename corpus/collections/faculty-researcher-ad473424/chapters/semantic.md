In the academic research ecosystem, the institutional record of a scholar is never a single monolithic fact. It is a composite of identity, affiliation, expertise, professional standing, and output — each dimension independently maintained yet jointly necessary to answer questions like "Which senior researchers at Compact Initiative have published in international journals?" or "What is the distribution of core traits among researchers ranked at level 41?" The relational model captures this composite by distributing attributes across seven base tables, linking them through foreign keys and junction tables, and then reassembling them through twelve materialized views. Every row in every table carries a surrogate identifier, a domain-level identifier, and a set of attributes whose cardinality is bounded by the schema's foreign-key constraints.

## The Faculty Researcher as Anchor Entity

The central entity in this domain is the faculty researcher. The table `faculty_researchers` stores the canonical identity record for each scholar. Its primary key is the surrogate `id` column, an auto-incrementing integer. The column `researcher_id` carries the domain-level identifier — a numeric code such as `89419` for Theodore Mcgrath or `2618557` for Account Name — which is stable across systems. The remaining identity columns are `full_name`, `age`, `is_married`, and `highest_degree`. The `highest_degree` column uses a controlled vocabulary of synthetic labels: `legacy-highest-85`, `compact-highest-86`, `composite-highest-87`, and `primary-highest-88`. These are not free-text fields; they are bounded values drawn from a finite set.

The table also carries four foreign-key columns that link the researcher to their institutional and professional context: `academic_rank_id` references `academic_ranks`, `university_id` references `universities`, `field_code` references `research_fields`, and `core_characteristic_id` references `core_characteristics`. The column `publication_count` is a denormalized integer summary (values `2`, `9`, `39`, `44` in the sample data) that avoids a runtime count over the `publications` table. The columns `university` and `research_field` appear to store synthetic display names (`primary-universi-16`, `compact-research-74`) that mirror the referenced entities but are not themselves foreign keys — they are denormalized labels for convenience.

**Table `faculty_researchers`**

| id | researcher_id | full_name | age | is_married | highest_degree | university | research_field | publication_count | academic_rank_id | university_id | field_code | core_characteristic_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 89419 | Theodore Mcgrath | 35 | false | legacy-highest-85 | primary-universi-16 | compact-research-74 | 2 | 1 | 1 | 1186082 | 1000 |
| 2 | 2618557 | Account Name | 40 | true | compact-highest-86 | adaptive-universi-17 | composite-research-75 | 9 | 2 | 2 | 9bb42384-8fcc-11eb-924d-9cd76263cbd0 | 1001 |
| 3 | 9736892 | Saipan International Airport | 45 | false | composite-highest-87 | distributed-universi-18 | primary-research-76 | 39 | 3 | 3 | 9424937 | 1002 |
| 4 | 1450639 | Norma Fisher | 50 | true | primary-highest-88 | baseline-universi-19 | adaptive-research-77 | 44 | 4 | 4 | 1889784 | 1003 |

The four foreign-key columns in `faculty_researchers` establish the cardinality-bounded relationships that structure the entire schema. Each researcher is associated with exactly one academic rank, one university, one research field, and one core characteristic. This is a 1:1 relationship from the researcher's perspective, but the inverse direction is 1:N: a single academic rank can be held by many researchers, a single university can employ many researchers, and so on. The schema enforces this through the foreign keys in `faculty_researchers` pointing to the primary keys of the dimension tables.

## Academic Ranks as a Dimension Table

The table `academic_ranks` defines the professional standing of researchers. Its primary key is `id`, and it carries the domain-level `rank_code` (values such as `3012818` and `17254906`), the human-readable `rank_title` (`Compact Survey`, `Legacy Corridor`, `Regional Series A`, `Seasonal Assessment`), an integer `level` (`21`, `31`, `41`, `51`), and a `responsibilities` column with synthetic labels (`integrated-responsi-58`, `seasonal-responsi-59`). The column `faculty_researcher_id` is a foreign key pointing back to `faculty_researchers.id`, creating a bidirectional link. This design means that the `academic_ranks` table can serve as either the driving table or the driven table in a join, depending on the analytical question.

**Table `academic_ranks`**

| id | rank_code | rank_title | level | responsibilities | faculty_researcher_id |
|---|---|---|---|---|---|
| 1 | 3012818 | Compact Survey | 21 | integrated-responsi-58 | 1 |
| 2 | 17254906 | Legacy Corridor | 31 | seasonal-responsi-59 | 2 |
| 3 | 325444 | Regional Series A | 41 | regional-responsi-60 | 3 |
| 4 | 374 | Seasonal Assessment | 51 | legacy-responsi-61 | 4 |

The `level` column is an integer that suggests an ordinal hierarchy: level `21` is lower than level `31`, which is lower than level `41`, and so on. This ordering is not enforced by the schema (there is no CHECK constraint visible in the sample), but the naming convention implies a career progression model. The `rank_title` column provides the human-readable label that would appear on a business report, while `rank_code` serves as the stable machine-readable identifier.

## Universities as an Institutional Dimension

The `universities` table captures the institutional affiliation of researchers. Its primary key is `id`, and it carries the domain-level `university_id` (`gd_acc_160002`, `d87f6fa90b894eb8be0b031dcc4d667a`), the `university_name` (`Compact Initiative`, `Legacy Model`, `Regional Cluster A`, `Seasonal Review`), the `location` and `country` columns (both using synthetic labels such as `extended-location-99` and `compact-country-26`), and an integer `research_output_rank` (`30`, `38`, `46`, `54`). The column `faculty_researcher_id` is a foreign key pointing to `faculty_researchers.id`.

**Table `universities`**

| id | university_id | university_name | location | country | research_output_rank | faculty_researcher_id |
|---|---|---|---|---|---|---|
| 1 | gd_acc_160002 | Compact Initiative | extended-location-99 | compact-country-26 | 30 | 1 |
| 2 | d87f6fa90b894eb8be0b031dcc4d667a | Legacy Model | integrated-location-100 | composite-country-27 | 38 | 2 |
| 3 | 2002007020150 | Regional Cluster A | seasonal-location-101 | primary-country-28 | 46 | 3 |
| 4 | 392482 | Seasonal Review | regional-location-102 | adaptive-country-29 | 54 | 4 |

The `research_output_rank` column is a synthetic metric that suggests the university's standing in terms of research productivity. Higher values indicate lower standing (rank `54` is worse than rank `30`), following the convention of ranking systems where rank `1` is the best. The `university_id` column uses a mix of numeric and UUID-style identifiers, reflecting the heterogeneity of institutional identifier schemes across different systems.

## Research Fields as a Classification Dimension

The `research_fields` table defines the area of scholarly expertise. Its primary key is `field_code`, which is a string column containing values such as `1186082`, `9bb42384-8fcc-11eb-924d-9cd76263cbd0`, `9424937`, and `1889784`. The column `field_name` carries the human-readable label (`Composite Review`, `Compact Initiative A`, `Legacy Model`, `Regional Cluster`), and the `category` column classifies the field as either `Science` or `Social Science`. The column `faculty_researcher_id` is a foreign key pointing to `faculty_researchers.id`.

**Table `research_fields`**

| field_code | field_name | category | faculty_researcher_id |
|---|---|---|---|
| 1186082 | Composite Review | Science | 1 |
| 9bb42384-8fcc-11eb-924d-9cd76263cbd0 | Compact Initiative A | Social Science | 2 |
| 9424937 | Legacy Model | Science | 3 |
| 1889784 | Regional Cluster | Social Science | 4 |

The `field_code` column is notable for its heterogeneous format: some codes are purely numeric (`1186082`, `9424937`, `1889784`), while others are UUIDs (`9bb42384-8fcc-11eb-924d-9cd76263cbd0`). This reflects the reality that research field classification systems vary in their identifier formats. The `category` column provides a coarse-grained classification that groups fields into broad disciplinary buckets.

## Core Characteristics as a Trait Dimension

The `core_characteristics` table captures personal or professional traits of researchers. Its primary key is `core_characteristic_id` (values `1000`, `1001`, `1002`, `1003`), and it carries the domain-level `trait_id` (`505988`, `4180945`, `4463653`, `2bf31fca-8fb6-11eb-924d-9cd76263cbd0`), the `trait_name` (`Pilot Assessment`, `Baseline Survey`, `Distributed Corridor A`, `Adaptive Series`), a `description` column (`Extended Survey`, `Pilot Corridor A`, `Baseline Series`, `Distributed Assessment`), and an `impact_level` column with values `Low`, `Medium`, and `High`. The column `faculty_researcher_id` is a foreign key pointing to `faculty_researchers.id`.

**Table `core_characteristics`**

| core_characteristic_id | trait_id | trait_name | description | impact_level | faculty_researcher_id |
|---|---|---|---|---|---|
| 1000 | 505988 | Pilot Assessment | Extended Survey | Low | 1 |
| 1001 | 4180945 | Baseline Survey | Pilot Corridor A | Medium | 2 |
| 1002 | 4463653 | Distributed Corridor A | Baseline Series | High | 3 |
| 1003 | 2bf31fca-8fb6-11eb-924d-9cd76263cbd0 | Adaptive Series | Distributed Assessment | Low | 4 |

The `impact_level` column is an enumerated type with three possible values, suggesting a bounded classification of the significance or reach of each trait. The `trait_id` column uses a mix of numeric and UUID-style identifiers, similar to the `field_code` column in `research_fields`. The `description` column provides additional context about the trait that is not captured by the `trait_name` alone.

## Publications as an Output Entity

The `publications` table records the scholarly output of researchers. Its primary key is `id`, and it carries the domain-level `publication_id` (`20723567`, `2002007020120`, `template_ivacode_pagata_20det15`, `lu_tax_code_template_m13`), the `title` (`Compact Initiative`, `Legacy Model`, `Regional Cluster A`, `Seasonal Review`), the `publication_date` (ISO 8601 timestamps such as `2025-12-01T23:33:00`), the `journal_name` (`Extended Standard`, `Pilot Framework A`, `Baseline Protocol`, `Distributed Programme`), a boolean `is_international` flag, an integer `citation_count` (`81`, `6`, `42`, `13`), the foreign key `faculty_researcher_id` pointing to `faculty_researchers.id`, and the foreign key `journal_id` pointing to `journals.id`.

**Table `publications`**

| id | publication_id | title | publication_date | journal_name | is_international | citation_count | faculty_researcher_id | journal_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 20723567 | Compact Initiative | 2025-12-01T23:33:00 | Extended Standard | false | 81 | 1 | 1000 |
| 2 | 2002007020120 | Legacy Model | 2022-05-12T06:50:00 | Pilot Framework A | true | 6 | 2 | 1001 |
| 3 | template_ivacode_pagata_20det15 | Regional Cluster A | 2023-10-23T13:07:00 | Baseline Protocol | false | 42 | 3 | 1002 |
| 4 | lu_tax_code_template_m13 | Seasonal Review | 2024-03-07T20:24:00 | Distributed Programme | true | 13 | 4 | 1003 |

The `publications` table is the only entity table that has a many-to-many relationship with another entity table: each publication is written by exactly one researcher (enforced by the `faculty_researcher_id` foreign key), but a researcher can write many publications. Similarly, each publication appears in exactly one journal (enforced by the `journal_id` foreign key), but a journal can publish many papers. The `citation_count` column is a denormalized metric that avoids a runtime aggregation. The `is_international` boolean allows filtering for domestic versus international output.

## Journals as a Publication Venue Dimension

The `journals` table defines the publication venues. Its primary key is `id`, and it carries the domain-level `journal_id` (`1000`, `1001`, `1002`, `1003`), the `journal_name` (`Extended Standard`, `Pilot Framework A`, `Baseline Protocol`, `Distributed Programme`), and the `issn` column. The `issn` column uses a mix of numeric and UUID-style identifiers.

**Table `journals`**

| journal_id | journal_name | issn | is_international | impact_factor | publication_id |
|---|---|---|---|---|---|
| 1000 | Extended Standard | regional-issn-30 | false | 4.70 | 1 |
| 1001 | Pilot Framework A | legacy-issn-31 | true | 9.40 | 2 |
| 1002 | Baseline Protocol | compact-issn-32 | false | 14.10 | 3 |
| 1003 | Distributed Programme | composite-issn-33 | true | 18.80 | 4 |

The `journals` table is a simple dimension table with no foreign keys pointing to other tables. It is referenced by `publications.journal_id`, making it a leaf dimension in the star schema. The `issn` column provides the International Standard Serial Number, a stable identifier for the journal that is independent of the surrogate `id`.

## Materialized Views: Reconstructing Domain Facts

The twelve materialized views in this schema serve two purposes: they provide convenient join paths for common analytical queries, and they encode the directionality of the relationship between entities. The views fall into two categories: those that drive from `faculty_researchers` outward to their associated dimensions, and those that drive from the dimension tables inward to the researchers.

### Faculty-Centric Views

The view `vw_faculty_researcher_academic_rank` joins `faculty_researchers` to `academic_ranks` on the relationship between the two tables. It answers questions like "What is the academic rank of each researcher?" Reading the first row: Theodore Mcgrath (`id = 1`, `researcher_id = 89419`) holds the rank `Compact Survey` (`rank_code = 3012818`, `level = 21`) with responsibilities described as `integrated-responsi-58`. The second row shows Account Name (`id = 2`, `researcher_id = 2618557`) holding the rank `Legacy Corridor` (`rank_code = 17254906`, `level = 31`).

**View `vw_faculty_researcher_academic_rank`**

```sql
CREATE VIEW vw_faculty_researcher_academic_rank AS
SELECT a.id, a.researcher_id, a.full_name, a.age, b.id AS rank_id, b.rank_code AS rank_rank_code, b.rank_title AS rank_rank_title
FROM faculty_researchers a JOIN academic_ranks b ON a.academic_rank_id = b.id;
```

| id | researcher_id | full_name | age | rank_id | rank_rank_code | rank_rank_title |
|---|---|---|---|---|---|---|
| 1 | 89419 | Theodore Mcgrath | 35 | 1 | 3012818 | Compact Survey |
| 2 | 2618557 | Account Name | 40 | 2 | 17254906 | Legacy Corridor |
| 3 | 9736892 | Saipan International Airport | 45 | 3 | 325444 | Regional Series A |
| 4 | 1450639 | Norma Fisher | 50 | 4 | 374 | Seasonal Assessment |

The view `vw_faculty_researcher_university` joins `faculty_researchers` to `universities`. It answers "Which university employs each researcher?" The first row shows Theodore Mcgrath employed at `Compact Initiative` (`university_id = gd_acc_160002`, `location = extended-location-99`, `country = compact-country-26`, `research_output_rank = 30`). The third row shows Saipan International Airport (`id = 3`, `researcher_id = 9736892`) employed at `Regional Cluster A` (`university_id = 2002007020150`, `research_output_rank = 46`).

**View `vw_faculty_researcher_university`**

```sql
CREATE VIEW vw_faculty_researcher_university AS
SELECT a.id, a.researcher_id, a.full_name, a.age, b.id AS university_id, b.university_id AS university_university_id, b.university_name AS university_university_name
FROM faculty_researchers a JOIN universities b ON a.university_id = b.id;
```

| id | researcher_id | full_name | age | university_id | university_university_id | university_university_name |
|---|---|---|---|---|---|---|
| 1 | 89419 | Theodore Mcgrath | 35 | 1 | gd_acc_160002 | Compact Initiative |
| 2 | 2618557 | Account Name | 40 | 2 | d87f6fa90b894eb8be0b031dcc4d667a | Legacy Model |
| 3 | 9736892 | Saipan International Airport | 45 | 3 | 2002007020150 | Regional Cluster A |
| 4 | 1450639 | Norma Fisher | 50 | 4 | 392482 | Seasonal Review |

The view `vw_faculty_researcher_research_field` joins `faculty_researchers` to `research_fields`. It answers "What is the research field of each scholar?" The first row shows Theodore Mcgrath working in `Composite Review` (`field_code = 1186082`, `category = Science`). The second row shows Account Name working in `Compact Initiative A` (`field_code = 9bb42384-8fcc-11eb-924d-9cd76263cbd0`, `category = Social Science`).

**View `vw_faculty_researcher_research_field`**

```sql
CREATE VIEW vw_faculty_researcher_research_field AS
SELECT a.id, a.researcher_id, a.full_name, a.age, b.field_code AS field_field_code, b.field_name AS field_field_name, b.category AS field_category
FROM faculty_researchers a JOIN research_fields b ON a.field_code = b.field_code;
```

| id | researcher_id | full_name | age | field_field_code | field_field_name | field_category |
|---|---|---|---|---|---|---|
| 1 | 89419 | Theodore Mcgrath | 35 | 1186082 | Composite Review | Science |
| 2 | 2618557 | Account Name | 40 | 9bb42384-8fcc-11eb-924d-9cd76263cbd0 | Compact Initiative A | Social Science |
| 3 | 9736892 | Saipan International Airport | 45 | 9424937 | Legacy Model | Science |
| 4 | 1450639 | Norma Fisher | 50 | 1889784 | Regional Cluster | Social Science |

The view `vw_faculty_researcher_core_characteristic` joins `faculty_researchers` to `core_characteristics`. It answers "What is the core characteristic of each researcher?" The first row shows Theodore Mcgrath with trait `Pilot Assessment` (`trait_id = 505988`, `description = Extended Survey`, `impact_level = Low`). The third row shows Saipan International Airport with trait `Distributed Corridor A` (`trait_id = 4463653`, `impact_level = High`).

**View `vw_faculty_researcher_core_characteristic`**

```sql
CREATE VIEW vw_faculty_researcher_core_characteristic AS
SELECT a.id, a.researcher_id, a.full_name, a.age, b.core_characteristic_id AS characteristic_core_characteristic_id, b.trait_id AS characteristic_trait_id, b.trait_name AS characteristic_trait_name
FROM faculty_researchers a JOIN core_characteristics b ON a.core_characteristic_id = b.core_characteristic_id;
```

| id | researcher_id | full_name | age | characteristic_core_characteristic_id | characteristic_trait_id | characteristic_trait_name |
|---|---|---|---|---|---|---|
| 1 | 89419 | Theodore Mcgrath | 35 | 1000 | 505988 | Pilot Assessment |
| 2 | 2618557 | Account Name | 40 | 1001 | 4180945 | Baseline Survey |
| 3 | 9736892 | Saipan International Airport | 45 | 1002 | 4463653 | Distributed Corridor A |
| 4 | 1450639 | Norma Fisher | 50 | 1003 | 2bf31fca-8fb6-11eb-924d-9cd76263cbd0 | Adaptive Series |

### Dimension-Centric Views

The view `vw_academic_rank_faculty_researcher` reverses the join direction, driving from `academic_ranks` to `faculty_researchers`. It answers "Which researchers hold this academic rank?" The first row shows that the rank `Compact Survey` (`rank_code = 3012818`, `level = 21`) is held by Theodore Mcgrath (`researcher_id = 89419`, `age = 35`, `is_married = false`). This view is useful for rank-based aggregation, such as counting researchers by rank level.

**View `vw_academic_rank_faculty_researcher`**

```sql
CREATE VIEW vw_academic_rank_faculty_researcher AS
SELECT a.id, a.rank_code, a.rank_title, a.level, b.id AS researcher_id, b.researcher_id AS researcher_researcher_id, b.full_name AS researcher_full_name
FROM academic_ranks a JOIN faculty_researchers b ON a.faculty_researcher_id = b.id;
```

| id | rank_code | rank_title | level | researcher_id | researcher_researcher_id | researcher_full_name |
|---|---|---|---|---|---|---|
| 1 | 3012818 | Compact Survey | 21 | 1 | 89419 | Theodore Mcgrath |
| 2 | 17254906 | Legacy Corridor | 31 | 2 | 2618557 | Account Name |
| 3 | 325444 | Regional Series A | 41 | 3 | 9736892 | Saipan International Airport |
| 4 | 374 | Seasonal Assessment | 51 | 4 | 1450639 | Norma Fisher |

The view `vw_university_faculty_researcher` drives from `universities` to `faculty_researchers`. It answers "Which researchers are employed at this university?" The first row shows that `Compact Initiative` (`university_id = gd_acc_160002`, `research_output_rank = 30`) employs Theodore Mcgrath (`full_name = Theodore Mcgrath`, `publication_count = 2`). This view supports institutional analysis, such as comparing research output across universities.

**View `vw_university_faculty_researcher`**

```sql
CREATE VIEW vw_university_faculty_researcher AS
SELECT a.id, a.university_id, a.university_name, a.location, b.id AS researcher_id, b.researcher_id AS researcher_researcher_id, b.full_name AS researcher_full_name
FROM universities a JOIN faculty_researchers b ON a.faculty_researcher_id = b.id;
```

| id | university_id | university_name | location | researcher_id | researcher_researcher_id | researcher_full_name |
|---|---|---|---|---|---|---|
| 1 | gd_acc_160002 | Compact Initiative | extended-location-99 | 1 | 89419 | Theodore Mcgrath |
| 2 | d87f6fa90b894eb8be0b031dcc4d667a | Legacy Model | integrated-location-100 | 2 | 2618557 | Account Name |
| 3 | 2002007020150 | Regional Cluster A | seasonal-location-101 | 3 | 9736892 | Saipan International Airport |
| 4 | 392482 | Seasonal Review | regional-location-102 | 4 | 1450639 | Norma Fisher |

The view `vw_research_field_faculty_researcher` drives from `research_fields` to `faculty_researchers`. It answers "Which researchers work in this field?" The first row shows that the field `Composite Review` (`field_code = 1186082`, `category = Science`) is the area of Theodore Mcgrath. This view supports disciplinary analysis, such as comparing publication counts across Science and Social Science categories.

**View `vw_research_field_faculty_researcher`**

```sql
CREATE VIEW vw_research_field_faculty_researcher AS
SELECT a.field_code, a.field_name, a.category, b.id AS researcher_id, b.researcher_id AS researcher_researcher_id, b.full_name AS researcher_full_name
FROM research_fields a JOIN faculty_researchers b ON a.faculty_researcher_id = b.id;
```

| field_code | field_name | category | researcher_id | researcher_researcher_id | researcher_full_name |
|---|---|---|---|---|---|
| 1186082 | Composite Review | Science | 1 | 89419 | Theodore Mcgrath |
| 9bb42384-8fcc-11eb-924d-9cd76263cbd0 | Compact Initiative A | Social Science | 2 | 2618557 | Account Name |
| 9424937 | Legacy Model | Science | 3 | 9736892 | Saipan International Airport |
| 1889784 | Regional Cluster | Social Science | 4 | 1450639 | Norma Fisher |

The view `vw_core_characteristic_faculty_researcher` drives from `core_characteristics` to `faculty_researchers`. It answers "Which researchers have this core characteristic?" The first row shows that the trait `Pilot Assessment` (`trait_id = 505988`, `impact_level = Low`) is associated with Theodore Mcgrath. This view supports trait-based analysis, such as comparing the distribution of impact levels across researchers.

**View `vw_core_characteristic_faculty_researcher`**

```sql
CREATE VIEW vw_core_characteristic_faculty_researcher AS
SELECT a.core_characteristic_id, a.trait_id, a.trait_name, a.description, b.id AS researcher_id, b.researcher_id AS researcher_researcher_id, b.full_name AS researcher_full_name
FROM core_characteristics a JOIN faculty_researchers b ON a.faculty_researcher_id = b.id;
```

| core_characteristic_id | trait_id | trait_name | description | researcher_id | researcher_researcher_id | researcher_full_name |
|---|---|---|---|---|---|---|
| 1000 | 505988 | Pilot Assessment | Extended Survey | 1 | 89419 | Theodore Mcgrath |
| 1001 | 4180945 | Baseline Survey | Pilot Corridor A | 2 | 2618557 | Account Name |
| 1002 | 4463653 | Distributed Corridor A | Baseline Series | 3 | 9736892 | Saipan International Airport |
| 1003 | 2bf31fca-8fb6-11eb-924d-9cd76263cbd0 | Adaptive Series | Distributed Assessment | 4 | 1450639 | Norma Fisher |

### Publication-Centric Views

The view `vw_publication_faculty_researcher` joins `publications` to `faculty_researchers`. It answers "Which publications has each researcher produced?" The first row shows that Theodore Mcgrath (`researcher_id = 89419`) published `Compact Initiative` (`publication_id = 20723567`, `publication_date = 2025-12-01T23:33:00`, `journal_name = Extended Standard`, `is_international = false`, `citation_count = 81`). The third row shows Saipan International Airport (`researcher_id = 9736892`) publishing `Regional Cluster A` (`publication_id = template_ivacode_pagata_20det15`, `citation_count = 42`).

**View `vw_publication_faculty_researcher`**

```sql
CREATE VIEW vw_publication_faculty_researcher AS
SELECT a.id, a.publication_id, a.title, a.publication_date, b.id AS researcher_id, b.researcher_id AS researcher_researcher_id, b.full_name AS researcher_full_name
FROM publications a JOIN faculty_researchers b ON a.faculty_researcher_id = b.id;
```

| id | publication_id | title | publication_date | researcher_id | researcher_researcher_id | researcher_full_name |
|---|---|---|---|---|---|---|
| 1 | 20723567 | Compact Initiative | 2025-12-01T23:33:00 | 1 | 89419 | Theodore Mcgrath |
| 2 | 2002007020120 | Legacy Model | 2022-05-12T06:50:00 | 2 | 2618557 | Account Name |
| 3 | template_ivacode_pagata_20det15 | Regional Cluster A | 2023-10-23T13:07:00 | 3 | 9736892 | Saipan International Airport |
| 4 | lu_tax_code_template_m13 | Seasonal Review | 2024-03-07T20:24:00 | 4 | 1450639 | Norma Fisher |

The view `vw_publication_journal` joins `publications` to `journals`. It answers "In which journal was each publication featured?" The first row shows that the publication `Compact Initiative` (`publication_id = 20723567`) appeared in `Extended Standard` (`journal_id = 1000`). The second row shows `Legacy Model` (`publication_id = 2002007020120`) appearing in `Pilot Framework A` (`journal_id = 1001`).

**View `vw_publication_journal`**

```sql
CREATE VIEW vw_publication_journal AS
SELECT a.id, a.publication_id, a.title, a.publication_date, b.journal_id AS journal_journal_id, b.journal_name AS journal_journal_name, b.issn AS journal_issn
FROM publications a JOIN journals b ON a.journal_id = b.journal_id;
```

| id | publication_id | title | publication_date | journal_journal_id | journal_journal_name | journal_issn |
|---|---|---|---|---|---|---|
| 1 | 20723567 | Compact Initiative | 2025-12-01T23:33:00 | 1000 | Extended Standard | regional-issn-30 |
| 2 | 2002007020120 | Legacy Model | 2022-05-12T06:50:00 | 1001 | Pilot Framework A | legacy-issn-31 |
| 3 | template_ivacode_pagata_20det15 | Regional Cluster A | 2023-10-23T13:07:00 | 1002 | Baseline Protocol | compact-issn-32 |
| 4 | lu_tax_code_template_m13 | Seasonal Review | 2024-03-07T20:24:00 | 1003 | Distributed Programme | composite-issn-33 |

The view `vw_journal_publication` reverses the join direction, driving from `journals` to `publications`. It answers "Which publications appeared in this journal?" The first row shows that the journal `Extended Standard` (`journal_id = 1000`) published `Compact Initiative` (`publication_id = 20723567`, `citation_count = 81`). This view supports venue-based analysis, such as comparing citation counts across journals.

**View `vw_journal_publication`**

```sql
CREATE VIEW vw_journal_publication AS
SELECT a.journal_id, a.journal_name, a.issn, a.is_international, b.id AS publication_id, b.publication_id AS publication_publication_id, b.title AS publication_title
FROM journals a JOIN publications b ON a.publication_id = b.id;
```

| journal_id | journal_name | issn | is_international | publication_id | publication_publication_id | publication_title |
|---|---|---|---|---|---|---|
| 1000 | Extended Standard | regional-issn-30 | false | 1 | 20723567 | Compact Initiative |
| 1001 | Pilot Framework A | legacy-issn-31 | true | 2 | 2002007020120 | Legacy Model |
| 1002 | Baseline Protocol | compact-issn-32 | false | 3 | template_ivacode_pagata_20det15 | Regional Cluster A |
| 1003 | Distributed Programme | composite-issn-33 | true | 4 | lu_tax_code_template_m13 | Seasonal Review |

## Synthesis

The schema models the academic research domain as a set of seven base tables linked by foreign keys, with twelve materialized views providing bidirectional join paths. The `faculty_researchers` table serves as the anchor entity, with four foreign-key columns (`academic_rank_id`, `university_id`, `field_code`, `core_characteristic_id`) establishing 1:1 relationships to dimension tables. The `publications` table is the only entity with a many-to-one relationship to another entity table (`journals`), creating a publication chain from researcher to journal. The views encode the directionality of these relationships, providing both faculty-centric and dimension-centric perspectives. Every row in every table carries a surrogate identifier and a domain-level identifier, ensuring that the model is both machine-processable and human-readable. The synthetic values in the data — from `legacy-highest-85` to `compact-country-26` — are placeholders that demonstrate the schema's capacity to handle heterogeneous identifier formats, enumerated types, and denormalized summary columns without compromising referential integrity.