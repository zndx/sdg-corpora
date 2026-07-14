## The Faculty Researcher Record

The academic research ecosystem is a structured network of individuals, institutions, and scholarly outputs. At its center sits the faculty researcher—a professional whose identity, rank, institutional affiliation, research focus, and publication record form a composite profile used for evaluation, funding allocation, and institutional benchmarking. Each researcher is assigned a unique identifier, a full name, an age, and demographic markers such as marital status. Their highest academic degree is catalogued alongside a publication count that serves as a basic productivity metric. Beyond these personal attributes, the researcher record anchors to external reference tables: an academic rank, a university, a research field, and a set of core professional characteristics. The following table presents the core researcher record and its foreign-key associations.

**Table `faculty_researchers`**

| id | researcher_id | full_name | age | is_married | highest_degree | university | research_field | publication_count | academic_rank_id | university_id | field_code | core_characteristic_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 89419 | Theodore Mcgrath | 35 | false | legacy-highest-85 | primary-universi-16 | compact-research-74 | 2 | 1 | 1 | 1186082 | 1000 |
| 2 | 2618557 | Account Name | 40 | true | compact-highest-86 | adaptive-universi-17 | composite-research-75 | 9 | 2 | 2 | 9bb42384-8fcc-11eb-924d-9cd76263cbd0 | 1001 |
| 3 | 9736892 | Saipan International Airport | 45 | false | composite-highest-87 | distributed-universi-18 | primary-research-76 | 39 | 3 | 3 | 9424937 | 1002 |
| 4 | 1450639 | Norma Fisher | 50 | true | primary-highest-88 | baseline-universi-19 | adaptive-research-77 | 44 | 4 | 4 | 1889784 | 1003 |

Consider the first row: researcher Theodore Mcgrath, age 35, holds the degree designation `legacy-highest-85` and is affiliated with `primary-universi-16` in the `compact-research-74` field. He has produced two publications and carries academic rank identifier 1. The second row, Account Name, age 40, is married, holds `compact-highest-86`, and is associated with `adaptive-universi-17` and `composite-research-75`. This researcher has nine publications and rank identifier 2. The third row, Saipan International Airport, age 45, is affiliated with `distributed-universi-18` in `primary-research-76`, with 39 publications and rank identifier 3. The fourth row, Norma Fisher, age 50, holds `primary-highest-88`, is affiliated with `baseline-universi-19` in `adaptive-research-77`, has 44 publications, and carries rank identifier 4. These records establish the foundational entities that the remaining tables and views elaborate upon.

## Academic Ranks and Institutional Standing

Academic rank defines a researcher's seniority, scope of responsibility, and standing within the institution. The rank table stores a `rank_code`, a human-readable `rank_title`, a numeric `level`, and a description of the associated `responsibilities`. Each rank record is linked back to a specific faculty researcher.

**Table `academic_ranks`**

| id | rank_code | rank_title | level | responsibilities | faculty_researcher_id |
|---|---|---|---|---|---|
| 1 | 3012818 | Compact Survey | 21 | integrated-responsi-58 | 1 |
| 2 | 17254906 | Legacy Corridor | 31 | seasonal-responsi-59 | 2 |
| 3 | 325444 | Regional Series A | 41 | regional-responsi-60 | 3 |
| 4 | 374 | Seasonal Assessment | 51 | legacy-responsi-61 | 4 |

The first rank entry, `Compact Survey` (code `3012818`), sits at level 21 with responsibilities described as `integrated-responsi-58`. It is assigned to researcher Theodore Mcgrath. The second rank, `Legacy Corridor` (code `17254906`), occupies level 31 with `seasonal-responsi-59` responsibilities and belongs to Account Name. The third rank, `Regional Series A` (code `325444`), is at level 41 with `regional-responsi-60` responsibilities, linked to Saipan International Airport. The fourth rank, `Seasonal Assessment` (code `374`), sits at level 51 with `legacy-responsi-61` responsibilities and is assigned to Norma Fisher. The ascending level values suggest a progression from junior to senior standing, with responsibilities broadening as the rank increases.

## Universities and Geographic Context

Every faculty researcher is affiliated with a university, which provides the institutional home for their research activities. The university table records the `university_id`, a `university_name`, a `location`, a `country`, and a `research_output_rank` that reflects the institution's standing in terms of scholarly output. Each university record is linked to a specific faculty researcher.

**Table `universities`**

| id | university_id | university_name | location | country | research_output_rank | faculty_researcher_id |
|---|---|---|---|---|---|---|
| 1 | gd_acc_160002 | Compact Initiative | extended-location-99 | compact-country-26 | 30 | 1 |
| 2 | d87f6fa90b894eb8be0b031dcc4d667a | Legacy Model | integrated-location-100 | composite-country-27 | 38 | 2 |
| 3 | 2002007020150 | Regional Cluster A | seasonal-location-101 | primary-country-28 | 46 | 3 |
| 4 | 392482 | Seasonal Review | regional-location-102 | adaptive-country-29 | 54 | 4 |

The first university, `Compact Initiative` (ID `gd_acc_160002`), is located at `extended-location-99` in `compact-country-26` and holds a research output rank of 30. It is associated with Theodore Mcgrath. The second university, `Legacy Model` (ID `d87f6fa90b894eb8be0b031dcc4d667a`), sits at `integrated-location-100` in `composite-country-27` with a research output rank of 38, linked to Account Name. The third university, `Regional Cluster A` (ID `2002007020150`), is at `seasonal-location-101` in `primary-country-28` with a research output rank of 46, associated with Saipan International Airport. The fourth university, `Seasonal Review` (ID `392482`), is located at `regional-location-102` in `adaptive-country-29` with a research output rank of 54, linked to Norma Fisher. The increasing research output ranks across these entries suggest a gradient of institutional productivity.

## Research Fields and Classification

Research fields categorize the intellectual domain in which a faculty researcher operates. The research fields table stores a `field_code`, a `field_name`, a `category` (such as Science or Social Science), and a link to the associated faculty researcher.

**Table `research_fields`**

| field_code | field_name | category | faculty_researcher_id |
|---|---|---|---|
| 1186082 | Composite Review | Science | 1 |
| 9bb42384-8fcc-11eb-924d-9cd76263cbd0 | Compact Initiative A | Social Science | 2 |
| 9424937 | Legacy Model | Science | 3 |
| 1889784 | Regional Cluster | Social Science | 4 |

The first field, `Composite Review` (code `1186082`), falls under the Science category and is associated with Theodore Mcgrath. The second field, `Compact Initiative A` (code `9bb42384-8fcc-11eb-924d-9cd76263cbd0`), belongs to Social Science and is linked to Account Name. The third field, `Legacy Model` (code `9424937`), is classified as Science and is associated with Saipan International Airport. The fourth field, `Regional Cluster` (code `1889784`), falls under Social Science and is linked to Norma Fisher. The alternation between Science and Social Science categories across the four researchers illustrates the diversity of disciplinary affiliations within the dataset.

## Core Characteristics and Professional Traits

Beyond rank and field, each researcher is described by a set of core professional characteristics. The core characteristics table records a `core_characteristic_id`, a `trait_id`, a `trait_name`, a textual `description`, an `impact_level` (Low, Medium, or High), and the associated faculty researcher.

**Table `core_characteristics`**

| core_characteristic_id | trait_id | trait_name | description | impact_level | faculty_researcher_id |
|---|---|---|---|---|---|
| 1000 | 505988 | Pilot Assessment | Extended Survey | Low | 1 |
| 1001 | 4180945 | Baseline Survey | Pilot Corridor A | Medium | 2 |
| 1002 | 4463653 | Distributed Corridor A | Baseline Series | High | 3 |
| 1003 | 2bf31fca-8fb6-11eb-924d-9cd76263cbd0 | Adaptive Series | Distributed Assessment | Low | 4 |

The first characteristic, `Pilot Assessment` (ID `1000`, trait ID `505988`), carries the description `Extended Survey` and an impact level of Low. It is associated with Theodore Mcgrath. The second characteristic, `Baseline Survey` (ID `1001`, trait ID `4180945`), is described as `Pilot Corridor A` with a Medium impact level, linked to Account Name. The third characteristic, `Distributed Corridor A` (ID `1002`, trait ID `4463653`), has the description `Baseline Series` and a High impact level, associated with Saipan International Airport. The fourth characteristic, `Adaptive Series` (ID `1003`, trait ID `2bf31fca-8fb6-11eb-924d-9cd76263cbd0`), is described as `Distributed Assessment` with a Low impact level, linked to Norma Fisher. The impact levels provide a quick heuristic for assessing the significance of each researcher's defining professional trait.

## Publications and Journal Venues

The scholarly output of a faculty researcher is captured in the publications table, which records a `publication_id`, a `title`, a `publication_date`, the `journal_name` where it appeared, a boolean flag `is_international`, a `citation_count`, and links to both the faculty researcher and the journal.

**Table `publications`**

| id | publication_id | title | publication_date | journal_name | is_international | citation_count | faculty_researcher_id | journal_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 20723567 | Compact Initiative | 2025-12-01T23:33:00 | Extended Standard | false | 81 | 1 | 1000 |
| 2 | 2002007020120 | Legacy Model | 2022-05-12T06:50:00 | Pilot Framework A | true | 6 | 2 | 1001 |
| 3 | template_ivacode_pagata_20det15 | Regional Cluster A | 2023-10-23T13:07:00 | Baseline Protocol | false | 42 | 3 | 1002 |
| 4 | lu_tax_code_template_m13 | Seasonal Review | 2024-03-07T20:24:00 | Distributed Programme | true | 13 | 4 | 1003 |

The first publication, titled `Compact Initiative` (ID `20723567`), was published on 2025-12-01 in `Extended Standard`. It is not an international publication and has accumulated 81 citations. It is linked to Theodore Mcgrath and journal ID 1000. The second publication, `Legacy Model` (ID `2002007020120`), appeared on 2022-05-12 in `Pilot Framework A`. It is an international publication with 6 citations, linked to Account Name and journal ID 1001. The third publication, `Regional Cluster A` (ID `template_ivacode_pagata_20det15`), was published on 2023-10-23 in `Baseline Protocol`. It is not international and has 42 citations, linked to Saipan International Airport and journal ID 1002. The fourth publication, `Seasonal Review` (ID `lu_tax_code_template_m13`), appeared on 2024-03-07 in `Distributed Programme`. It is an international publication with 13 citations, linked to Norma Fisher and journal ID 1003. The citation counts vary widely, from 6 to 81, reflecting differences in research impact and publication age.

The journals table provides the metadata for the venues in which these publications appear.

**Table `journals`**

| journal_id | journal_name | issn | is_international | impact_factor | publication_id |
|---|---|---|---|---|---|
| 1000 | Extended Standard | regional-issn-30 | false | 4.70 | 1 |
| 1001 | Pilot Framework A | legacy-issn-31 | true | 9.40 | 2 |
| 1002 | Baseline Protocol | compact-issn-32 | false | 14.10 | 3 |
| 1003 | Distributed Programme | composite-issn-33 | true | 18.80 | 4 |

## Joined Perspectives: Researcher Profiles

A single table cannot answer all analytical questions about the research ecosystem. Joined views combine the base tables to produce richer, multi-dimensional records. Each view answers a specific analytical question by merging the researcher's personal attributes with related reference data.

The view `vw_faculty_researcher_academic_rank` merges the faculty researcher record with their academic rank, answering the question: what is the rank profile of each researcher? Reading the first row, Theodore Mcgrath (researcher ID 89419) holds the rank `Compact Survey` at level 21 with integrated responsibilities. The second row shows Account Name (researcher ID 2618557) with the rank `Legacy Corridor` at level 31 and seasonal responsibilities. This join is essential for any analysis that correlates rank with publication output or institutional affiliation.

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

The view `vw_faculty_researcher_university` joins the researcher record with their university, answering: which institution does each researcher belong to, and what is that institution's research output standing? The first row reveals that Theodore Mcgrath is affiliated with Compact Initiative, located at extended-location-99 in compact-country-26, with a research output rank of 30. The second row shows Account Name at Legacy Model (location integrated-location-100, country composite-country-27, output rank 38). This view supports institutional benchmarking and geographic analysis of research distribution.

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

The view `vw_faculty_researcher_research_field` merges the researcher with their research field, answering: what is the disciplinary home of each researcher? The first row indicates Theodore Mcgrath works in the Science category under the field name `Composite Review` (code 1186082). The second row shows Account Name in Social Science, field `Compact Initiative A`. This join is critical for disciplinary mapping and cross-field collaboration analysis.

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

The view `vw_faculty_researcher_core_characteristic` combines the researcher with their defining professional trait, answering: what is the core characteristic profile of each researcher? The first row shows Theodore Mcgrath with the trait `Pilot Assessment`, described as `Extended Survey`, at a Low impact level. The third row reveals Saipan International Airport with the trait `Distributed Corridor A`, described as `Baseline Series`, at a High impact level. This view is useful for profiling researchers by their professional strengths and impact potential.

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

## Inverted Perspectives: Reference-to-Researcher Links

The preceding views all start from the researcher and look outward to related entities. The inverted views reverse this direction, starting from a reference table and listing the researchers associated with each value. These views are particularly useful for administrative queries: for example, identifying all researchers at a given rank or in a given university.

The view `vw_academic_rank_faculty_researcher` starts from the academic rank and lists the researchers holding each rank. The first row shows that the rank `Compact Survey` (level 21) is held by Theodore Mcgrath. The fourth row indicates that `Seasonal Assessment` (level 51) is held by Norma Fisher. This inverted perspective is valuable for workload distribution analysis and rank-based staffing reports.

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

The view `vw_university_faculty_researcher` starts from the university and lists the researchers affiliated with each institution. The first row shows Compact Initiative (research output rank 30) is associated with Theodore Mcgrath. The fourth row shows Seasonal Review (research output rank 54) is associated with Norma Fisher. This view supports institutional capacity planning and resource allocation.

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

The view `vw_research_field_faculty_researcher` starts from the research field and lists the researchers working in each field. The first row shows the Science field `Composite Review` is associated with Theodore Mcgrath. The fourth row shows the Social Science field `Regional Cluster` is associated with Norma Fisher. This view is essential for identifying disciplinary clusters and potential collaboration opportunities.

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

The view `vw_core_characteristic_faculty_researcher` starts from the core characteristic and lists the researchers who exhibit each trait. The first row shows the trait `Pilot Assessment` (Low impact) is exhibited by Theodore Mcgrath. The third row shows `Distributed Corridor A` (High impact) is exhibited by Saipan International Airport. This view supports talent identification and strategic hiring decisions.

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

## Publication Perspectives

The publication-related views connect researchers to their scholarly output and the journals that host it. These views answer questions about publication patterns, journal prestige, and international reach.

The view `vw_publication_faculty_researcher` joins the publication record with the researcher, answering: which researcher produced each publication, and what are its bibliometric properties? The first row shows that Theodore Mcgrath published `Compact Initiative` in 2025, which has accumulated 81 citations. The third row shows Saipan International Airport published `Regional Cluster A` in 2023 with 42 citations. This view is the primary tool for researcher-level bibliometric analysis.

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

The view `vw_publication_journal` joins the publication with its journal venue, answering: which journal published each work, and what are the publication's citation metrics? The first row shows that `Compact Initiative` was published in journal ID 1000 and has 81 citations. The second row shows `Legacy Model` was published in journal ID 1001 with 6 citations. This view supports journal-level analysis and venue selection strategies.

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

The view `vw_journal_publication` inverts the relationship, starting from the journal and listing the publications it has hosted. The first row shows journal ID 1000 has published `Compact Initiative` (81 citations, non-international). The fourth row shows journal ID 1003 has published `Seasonal Review` (13 citations, international). This view is useful for journal portfolio management and impact factor calculations.

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

## Closing Synthesis

The faculty research ecosystem is composed of seven base tables and eleven joined views that together provide a comprehensive picture of academic research activity. The base tables capture the fundamental entities: researchers, their ranks, their universities, their research fields, their core characteristics, their publications, and the journals that host those publications. The joined views provide two complementary perspectives. The researcher-centric views (`vw_faculty_researcher_*`) answer questions about individual profiles by merging personal attributes with institutional and disciplinary context. The reference-centric views (`vw_*_faculty_researcher`) answer administrative questions by listing researchers associated with each rank, university, field, or characteristic. Together, these tables and views form a complete analytical framework for understanding, evaluating, and managing the academic research enterprise. The data values—ranging from Theodore Mcgrath's 81-citation publication in `Extended Standard` to Norma Fisher's rank of `Seasonal Assessment` at level 51—illustrate the diversity and depth of information available for scholarly analysis.