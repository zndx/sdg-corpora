## Ontology-Grounded Relational Modelling of the Research Administration Domain

The research administration domain captures the interlocking relationships between scholarly projects, their outputs, the people who produce them, and the institutional and publishing infrastructure that frames their work. At its core, the domain distinguishes five principal entity types: research projects, publications, researchers, institutions, and journals, with editorial boards serving as a sixth entity that mediates the relationship between journals and the scholars who govern them. The relational schema materialises these entities through a combination of six base tables, nine junction tables that resolve many-to-many associations, and fourteen denormalised views that reconstruct domain facts for reporting. This chapter walks through the modelling decisions, the column-level anatomy of each table, and the join logic that powers every view.

### Core Entities and Their Attributes

The `research_projects` table anchors the domain. Each row represents a funded investigation, identified by a surrogate `id` and a business key `project_identifier`. The columns `project_title`, `funding_agency`, `start_date`, `end_date`, and `project_status` capture the essential lifecycle attributes. For example, project `PRO-2058` (Integrated Model A) is funded by Alaska Air Group Inc and carries an `active` status, while `PRO-2059` (Extended Cluster) is funded by General Foods and marked `completed`. The temporal columns store dates in ISO-8601 format, and the status column is a constrained categorical field.

**Table `research_projects`**

| id | project_identifier | project_title | funding_agency | start_date | end_date | project_status |
|---|---|---|---|---|---|---|
| 1 | PRO-2058 | Integrated Model A | Alaska Air Group Inc | 2022-09-05 | 2022-09-01 | active |
| 2 | PRO-2059 | Extended Cluster | General Foods | 2023-02-16 | 2023-02-12 | completed |
| 3 | PRO-2060 | Pilot Review | Oscar Health Inc. | 2024-07-27 | 2024-07-23 | suspended |
| 4 | PRO-2061 | Baseline Initiative D | Mastercard International | 2025-12-11 | 2025-12-07 | active |

The `publications` table records scholarly outputs. Its primary key is `id`, with `publication_identifier` as the natural key. The columns `title`, `publication_date`, `publication_type`, `language`, and `peer_reviewed` describe the output itself. The `publication_type` column accepts values such as `book`, `journal_article`, `chapter`, and `conference_paper`. The `language` column stores codes like `composite-language-45` and `primary-language-46`. The boolean `peer_reviewed` flag indicates whether the work underwent peer review. Two foreign keys, `journal_id` and `research_project_id`, link the publication to its publishing venue and its originating project respectively.

**Table `publications`**

| id | publication_identifier | title | publication_date | publication_type | language | peer_reviewed | journal_id | research_project_id |
|---|---|---|---|---|---|---|---|---|
| 1 | PUB-2737 | Compact Initiative | 2025-12-01 | book | composite-language-45 | false | 100 | 1 |
| 2 | PUB-2743 | Legacy Model | 2022-05-12 | journal_article | primary-language-46 | true | 101 | 2 |
| 3 | PUB-2749 | Regional Cluster A | 2023-10-23 | chapter | adaptive-language-47 | false | 102 | 3 |
| 4 | PUB-2755 | Seasonal Review | 2024-03-07 | conference_paper | distributed-language-48 | true | 103 | 4 |

The `researchers` table stores individual scholars. The surrogate key `researcher_id` pairs with `full_name` as the human-readable identifier. The columns `institution`, `department`, and `role` capture the researcher's organisational context and seniority level. Role values include `professor`, `visiting_researcher`, and `postdoc`. The `institution_id` foreign key connects the researcher to their home institution, while `created_at` and `updated_at` provide audit timestamps. Researcher `1` (Theodore Mcgrath) holds the role of `professor` at `baseline-institut-31`, whereas researcher `2` (Account Name) is a `visiting_researcher` at `pilot-institut-32`.

**Table `researchers`**

| researcher_id | full_name | institution | department | role | institution_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | baseline-institut-31 | adaptive-departme-89 | professor | 9424913 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Account Name | pilot-institut-32 | distributed-departme-90 | visiting_researcher | 8189481 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Saipan International Airport | extended-institut-33 | baseline-departme-91 | postdoc | 1437604 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Norma Fisher | integrated-institut-34 | pilot-departme-92 | professor | 884346 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `institutions` table models the organisations that host researchers and sponsor projects. Its primary key is `institution_id`, and the columns `institution_name`, `country`, and `institution_type` describe the entity. Institution types include `university`, `research_center`, and `government_agency`. The `research_project_id` foreign key ties an institution to a specific project, indicating which project the institution is associated with. For instance, institution `9424913` (Extended Corridor) is a `university` in `compact-country-26` and is linked to project `1`.

**Table `institutions`**

| institution_id | institution_name | country | institution_type | research_project_id |
|---|---|---|---|---|
| 9424913 | Extended Corridor | compact-country-26 | university | 1 |
| 8189481 | Pilot Series A | composite-country-27 | research_center | 2 |
| 1437604 | Baseline Assessment | primary-country-28 | government_agency | 3 |
| 884346 | Distributed Survey | adaptive-country-29 | university | 4 |

The `journals` table captures the publishing venues. The surrogate `id` serves as the primary key, while `journal_id` is the natural identifier. Columns `journal_name`, `issn`, `publisher`, and `impact_factor` describe the journal's identity and prestige. The `impact_factor` is a decimal value ranging from `4.70` (Extended Standard) to `18.80` (Distributed Programme).

**Table `journals`**

| id | journal_id | journal_name | issn | publisher | impact_factor |
|---|---|---|---|---|---|
| 100 | 195347 | Extended Standard | regional-issn-30 | pilot-publishe-50 | 4.70 |
| 101 | 3122ef58d8b44fb197236734beef7b29 | Pilot Framework A | legacy-issn-31 | extended-publishe-51 | 9.40 |
| 102 | 6926358 | Baseline Protocol | compact-issn-32 | integrated-publishe-52 | 14.10 |
| 103 | 4060663 | Distributed Programme | composite-issn-33 | seasonal-publishe-53 | 18.80 |

The `editorial_boards` table models the governance bodies of journals. Its primary key is `id`, and `board_id` is the natural identifier. The `role` column distinguishes between `editor`, `associate_editor`, and `board_member`. The `appointment_date` records when the board member was appointed, and `journal_id` links the board entry to its journal. The `created_at` column provides an audit timestamp.

**Table `editorial_boards`**

| id | board_id | role | appointment_date | journal_id | created_at |
|---|---|---|---|---|---|
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | editor | 2022-05-03 | 100 | 2025-01-01 00:14:00 |
| 2 | 168553 | associate_editor | 2023-10-14 | 101 | 2025-02-06 03:14:00 |
| 3 | 5006454 | board_member | 2024-03-25 | 102 | 2025-03-11 06:14:00 |
| 4 | 1437585 | editor | 2025-08-09 | 103 | 2025-04-16 09:14:00 |

### Junction Tables and Many-to-Many Relationships

Several domain relationships are inherently many-to-many and therefore require junction tables. The `projects_researchers` table resolves the association between research projects and researchers, allowing a single project to involve multiple researchers and a researcher to participate in multiple projects. Similarly, `projects_publications` links projects to their outputs, enabling a project to produce multiple publications and a publication to be associated with multiple projects.

**Table `projects_researchers`**

| research_project_id | researcher_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `projects_publications`**

| research_project_id | publication_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `publications_researchers` table connects publications to the researchers who authored them, supporting the common scenario where a single paper has multiple authors and a researcher publishes across many papers. The symmetric junction tables `researchers_projects` and `researchers_publications` provide the reverse direction of these associations, ensuring that queries can traverse from researcher to project or researcher to publication without requiring separate join logic.

**Table `publications_researchers`**

| publication_id | researcher_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `researchers_projects`**

| researcher_id | research_project_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `researchers_publications`**

| researcher_id | publication_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `institutions_researchers` table resolves the relationship between institutions and their affiliated researchers, while `journals_publications` links journals to the articles they publish. The `journals_boards` table connects journals to their editorial boards, and `boards_researchers` links editorial board members (who are themselves researchers) to the boards they serve on.

**Table `institutions_researchers`**

| institution_id | researcher_id |
|---|---|
| 9424913 | 1 |
| 9424913 | 2 |
| 8189481 | 2 |
| 8189481 | 3 |
| 1437604 | 3 |
| 1437604 | 4 |
| 884346 | 4 |
| 884346 | 1 |

**Table `journals_publications`**

| journal_id | publication_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `journals_boards`**

| journal_id | editorial_board_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `boards_researchers`**

| editorial_board_id | researcher_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

### Denormalised Views: Reconstructing Domain Facts

The views in this schema serve as materialised interpretations of the normalised tables, each answering a specific analytical question by joining the relevant entities.

The view `v_research_project_researcher_detail` reconstructs the project-to-researcher association by joining `research_projects` with `projects_researchers` and `researchers`. It answers the question: "Which researchers are working on which projects?" A row from this view might show project `PRO-2058` (Integrated Model A) alongside researcher Theodore Mcgrath, making it straightforward to audit project staffing.

**View `v_research_project_researcher_detail`**

```sql
CREATE VIEW v_research_project_researcher_detail AS
SELECT a.id, a.project_identifier, a.project_title, b.researcher_id AS researcher_researcher_id, b.full_name AS researcher_full_name, b.institution AS researcher_institution
FROM research_projects a
  JOIN projects_researchers j ON j.research_project_id = a.id
  JOIN researchers b ON b.researcher_id = j.researcher_id;
```

| id | project_identifier | project_title | researcher_researcher_id | researcher_full_name | researcher_institution |
|---|---|---|---|---|---|
| 1 | PRO-2058 | Integrated Model A | 1 | Theodore Mcgrath | baseline-institut-31 |
| 1 | PRO-2058 | Integrated Model A | 2 | Account Name | pilot-institut-32 |
| 2 | PRO-2059 | Extended Cluster | 2 | Account Name | pilot-institut-32 |
| 2 | PRO-2059 | Extended Cluster | 3 | Saipan International Airport | extended-institut-33 |
| 3 | PRO-2060 | Pilot Review | 3 | Saipan International Airport | extended-institut-33 |
| 3 | PRO-2060 | Pilot Review | 4 | Norma Fisher | integrated-institut-34 |
| 4 | PRO-2061 | Baseline Initiative D | 4 | Norma Fisher | integrated-institut-34 |
| 4 | PRO-2061 | Baseline Initiative D | 1 | Theodore Mcgrath | baseline-institut-31 |

The view `v_research_project_publication_detail` joins `research_projects` with `projects_publications` and `publications` to answer: "What publications have emerged from each research project?" A representative row would pair project `PRO-2058` with the publication `Compact Initiative`, a `book` published on `2025-12-01` that is not peer-reviewed.

**View `v_research_project_publication_detail`**

```sql
CREATE VIEW v_research_project_publication_detail AS
SELECT a.id, a.project_identifier, a.project_title, b.id AS publication_id, b.publication_identifier AS publication_publication_identifier, b.title AS publication_title
FROM research_projects a
  JOIN projects_publications j ON j.research_project_id = a.id
  JOIN publications b ON b.id = j.publication_id;
```

| id | project_identifier | project_title | publication_id | publication_publication_identifier | publication_title |
|---|---|---|---|---|---|
| 1 | PRO-2058 | Integrated Model A | 1 | PUB-2737 | Compact Initiative |
| 1 | PRO-2058 | Integrated Model A | 2 | PUB-2743 | Legacy Model |
| 2 | PRO-2059 | Extended Cluster | 2 | PUB-2743 | Legacy Model |
| 2 | PRO-2059 | Extended Cluster | 3 | PUB-2749 | Regional Cluster A |
| 3 | PRO-2060 | Pilot Review | 3 | PUB-2749 | Regional Cluster A |
| 3 | PRO-2060 | Pilot Review | 4 | PUB-2755 | Seasonal Review |
| 4 | PRO-2061 | Baseline Initiative D | 4 | PUB-2755 | Seasonal Review |
| 4 | PRO-2061 | Baseline Initiative D | 1 | PUB-2737 | Compact Initiative |

The view `v_publication_researcher_detail` joins `publications` with `publications_researchers` and `researchers` to answer: "Which researchers authored which publications?" This view is essential for bibliometric analysis. A row might show the publication `Legacy Model` (a peer-reviewed `journal_article`) alongside researcher Theodore Mcgrath.

**View `v_publication_researcher_detail`**

```sql
CREATE VIEW v_publication_researcher_detail AS
SELECT a.id, a.publication_identifier, a.title, b.researcher_id AS researcher_researcher_id, b.full_name AS researcher_full_name, b.institution AS researcher_institution
FROM publications a
  JOIN publications_researchers j ON j.publication_id = a.id
  JOIN researchers b ON b.researcher_id = j.researcher_id;
```

| id | publication_identifier | title | researcher_researcher_id | researcher_full_name | researcher_institution |
|---|---|---|---|---|---|
| 1 | PUB-2737 | Compact Initiative | 1 | Theodore Mcgrath | baseline-institut-31 |
| 1 | PUB-2737 | Compact Initiative | 2 | Account Name | pilot-institut-32 |
| 2 | PUB-2743 | Legacy Model | 2 | Account Name | pilot-institut-32 |
| 2 | PUB-2743 | Legacy Model | 3 | Saipan International Airport | extended-institut-33 |
| 3 | PUB-2749 | Regional Cluster A | 3 | Saipan International Airport | extended-institut-33 |
| 3 | PUB-2749 | Regional Cluster A | 4 | Norma Fisher | integrated-institut-34 |
| 4 | PUB-2755 | Seasonal Review | 4 | Norma Fisher | integrated-institut-34 |
| 4 | PUB-2755 | Seasonal Review | 1 | Theodore Mcgrath | baseline-institut-31 |

The view `v_publication_journal` joins `publications` with `journals_publications` and `journals` to answer: "Which journal published which article, and what is the journal's impact factor?" A row from this view might show the publication `Regional Cluster A` published in `Baseline Protocol` (ISSN `6926358`) with an impact factor of `14.10`.

**View `v_publication_journal`**

```sql
CREATE VIEW v_publication_journal AS
SELECT a.id, a.publication_identifier, a.title, a.publication_date, b.id AS journal_id, b.journal_id AS journal_journal_id, b.journal_name AS journal_journal_name
FROM publications a JOIN journals b ON a.journal_id = b.id;
```

| id | publication_identifier | title | publication_date | journal_id | journal_journal_id | journal_journal_name |
|---|---|---|---|---|---|---|
| 1 | PUB-2737 | Compact Initiative | 2025-12-01 | 100 | 195347 | Extended Standard |
| 2 | PUB-2743 | Legacy Model | 2022-05-12 | 101 | 3122ef58d8b44fb197236734beef7b29 | Pilot Framework A |
| 3 | PUB-2749 | Regional Cluster A | 2023-10-23 | 102 | 6926358 | Baseline Protocol |
| 4 | PUB-2755 | Seasonal Review | 2024-03-07 | 103 | 4060663 | Distributed Programme |

The view `v_publication_research_project` joins `publications` with `projects_publications` and `research_projects` to answer: "Which research project is each publication associated with?" This is the inverse of `v_research_project_publication_detail` but presented from the publication's perspective. A row might show the publication `Seasonal Review` (a `conference_paper`) associated with project `PRO-2061` (Baseline Initiative D).

**View `v_publication_research_project`**

```sql
CREATE VIEW v_publication_research_project AS
SELECT a.id, a.publication_identifier, a.title, a.publication_date, b.id AS project_id, b.project_identifier AS project_project_identifier, b.project_title AS project_project_title
FROM publications a JOIN research_projects b ON a.research_project_id = b.id;
```

| id | publication_identifier | title | publication_date | project_id | project_project_identifier | project_project_title |
|---|---|---|---|---|---|---|
| 1 | PUB-2737 | Compact Initiative | 2025-12-01 | 1 | PRO-2058 | Integrated Model A |
| 2 | PUB-2743 | Legacy Model | 2022-05-12 | 2 | PRO-2059 | Extended Cluster |
| 3 | PUB-2749 | Regional Cluster A | 2023-10-23 | 3 | PRO-2060 | Pilot Review |
| 4 | PUB-2755 | Seasonal Review | 2024-03-07 | 4 | PRO-2061 | Baseline Initiative D |

The view `v_researcher_institution` joins `researchers` with `institutions_researchers` and `institutions` to answer: "Which institution is each researcher affiliated with?" A representative row would show researcher Theodore Mcgrath at institution `9424913` (Extended Corridor), a `university` in `compact-country-26`.

**View `v_researcher_institution`**

```sql
CREATE VIEW v_researcher_institution AS
SELECT a.researcher_id, a.full_name, a.institution, a.department, b.institution_id AS institution_institution_id, b.institution_name AS institution_institution_name, b.country AS institution_country
FROM researchers a JOIN institutions b ON a.institution_id = b.institution_id;
```

| researcher_id | full_name | institution | department | institution_institution_id | institution_institution_name | institution_country |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | baseline-institut-31 | adaptive-departme-89 | 9424913 | Extended Corridor | compact-country-26 |
| 2 | Account Name | pilot-institut-32 | distributed-departme-90 | 8189481 | Pilot Series A | composite-country-27 |
| 3 | Saipan International Airport | extended-institut-33 | baseline-departme-91 | 1437604 | Baseline Assessment | primary-country-28 |
| 4 | Norma Fisher | integrated-institut-34 | pilot-departme-92 | 884346 | Distributed Survey | adaptive-country-29 |

The view `v_researcher_research_project_detail` joins `researchers` with `researchers_projects` and `research_projects` to answer: "Which projects is each researcher involved in?" This is the reverse of `v_research_project_researcher_detail`. A row might show researcher Theodore Mcgrath participating in project `PRO-2058` (Integrated Model A), funded by Alaska Air Group Inc.

**View `v_researcher_research_project_detail`**

```sql
CREATE VIEW v_researcher_research_project_detail AS
SELECT a.researcher_id, a.full_name, a.institution, b.id AS project_id, b.project_identifier AS project_project_identifier, b.project_title AS project_project_title
FROM researchers a
  JOIN researchers_projects j ON j.researcher_id = a.researcher_id
  JOIN research_projects b ON b.id = j.research_project_id;
```

| researcher_id | full_name | institution | project_id | project_project_identifier | project_project_title |
|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | baseline-institut-31 | 1 | PRO-2058 | Integrated Model A |
| 1 | Theodore Mcgrath | baseline-institut-31 | 2 | PRO-2059 | Extended Cluster |
| 2 | Account Name | pilot-institut-32 | 2 | PRO-2059 | Extended Cluster |
| 2 | Account Name | pilot-institut-32 | 3 | PRO-2060 | Pilot Review |
| 3 | Saipan International Airport | extended-institut-33 | 3 | PRO-2060 | Pilot Review |
| 3 | Saipan International Airport | extended-institut-33 | 4 | PRO-2061 | Baseline Initiative D |
| 4 | Norma Fisher | integrated-institut-34 | 4 | PRO-2061 | Baseline Initiative D |
| 4 | Norma Fisher | integrated-institut-34 | 1 | PRO-2058 | Integrated Model A |

The view `v_researcher_publication_detail` joins `researchers` with `researchers_publications` and `publications` to answer: "Which publications has each researcher produced?" A row might show researcher Theodore Mcgrath as the author of the publication `Compact Initiative`, a `book` with composite language.

**View `v_researcher_publication_detail`**

```sql
CREATE VIEW v_researcher_publication_detail AS
SELECT a.researcher_id, a.full_name, a.institution, b.id AS publication_id, b.publication_identifier AS publication_publication_identifier, b.title AS publication_title
FROM researchers a
  JOIN researchers_publications j ON j.researcher_id = a.researcher_id
  JOIN publications b ON b.id = j.publication_id;
```

| researcher_id | full_name | institution | publication_id | publication_publication_identifier | publication_title |
|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | baseline-institut-31 | 1 | PUB-2737 | Compact Initiative |
| 1 | Theodore Mcgrath | baseline-institut-31 | 2 | PUB-2743 | Legacy Model |
| 2 | Account Name | pilot-institut-32 | 2 | PUB-2743 | Legacy Model |
| 2 | Account Name | pilot-institut-32 | 3 | PUB-2749 | Regional Cluster A |
| 3 | Saipan International Airport | extended-institut-33 | 3 | PUB-2749 | Regional Cluster A |
| 3 | Saipan International Airport | extended-institut-33 | 4 | PUB-2755 | Seasonal Review |
| 4 | Norma Fisher | integrated-institut-34 | 4 | PUB-2755 | Seasonal Review |
| 4 | Norma Fisher | integrated-institut-34 | 1 | PUB-2737 | Compact Initiative |

The view `v_institution_researcher_detail` joins `institutions` with `institutions_researchers` and `researchers` to answer: "Which researchers are employed by each institution?" A representative row would show institution `9424913` (Extended Corridor) employing researcher Theodore Mcgrath, a `professor` in the `adaptive-departme-89` department.

**View `v_institution_researcher_detail`**

```sql
CREATE VIEW v_institution_researcher_detail AS
SELECT a.institution_id, a.institution_name, a.country, b.researcher_id AS researcher_researcher_id, b.full_name AS researcher_full_name, b.institution AS researcher_institution
FROM institutions a
  JOIN institutions_researchers j ON j.institution_id = a.institution_id
  JOIN researchers b ON b.researcher_id = j.researcher_id;
```

| institution_id | institution_name | country | researcher_researcher_id | researcher_full_name | researcher_institution |
|---|---|---|---|---|---|
| 9424913 | Extended Corridor | compact-country-26 | 1 | Theodore Mcgrath | baseline-institut-31 |
| 9424913 | Extended Corridor | compact-country-26 | 2 | Account Name | pilot-institut-32 |
| 8189481 | Pilot Series A | composite-country-27 | 2 | Account Name | pilot-institut-32 |
| 8189481 | Pilot Series A | composite-country-27 | 3 | Saipan International Airport | extended-institut-33 |
| 1437604 | Baseline Assessment | primary-country-28 | 3 | Saipan International Airport | extended-institut-33 |
| 1437604 | Baseline Assessment | primary-country-28 | 4 | Norma Fisher | integrated-institut-34 |
| 884346 | Distributed Survey | adaptive-country-29 | 4 | Norma Fisher | integrated-institut-34 |
| 884346 | Distributed Survey | adaptive-country-29 | 1 | Theodore Mcgrath | baseline-institut-31 |

The view `v_institution_research_project` joins `institutions` with `research_projects` (via the `research_project_id` foreign key on `institutions`) to answer: "Which research projects is each institution associated with?" A row might show institution `9424913` (Extended Corridor) associated with project `PRO-2058` (Integrated Model A).

**View `v_institution_research_project`**

```sql
CREATE VIEW v_institution_research_project AS
SELECT a.institution_id, a.institution_name, a.country, a.institution_type, b.id AS project_id, b.project_identifier AS project_project_identifier, b.project_title AS project_project_title
FROM institutions a JOIN research_projects b ON a.research_project_id = b.id;
```

| institution_id | institution_name | country | institution_type | project_id | project_project_identifier | project_project_title |
|---|---|---|---|---|---|---|
| 9424913 | Extended Corridor | compact-country-26 | university | 1 | PRO-2058 | Integrated Model A |
| 8189481 | Pilot Series A | composite-country-27 | research_center | 2 | PRO-2059 | Extended Cluster |
| 1437604 | Baseline Assessment | primary-country-28 | government_agency | 3 | PRO-2060 | Pilot Review |
| 884346 | Distributed Survey | adaptive-country-29 | university | 4 | PRO-2061 | Baseline Initiative D |

The view `v_journal_publication_detail` joins `journals` with `journals_publications` and `publications` to answer: "Which publications appear in each journal?" A representative row would show journal `Extended Standard` (ISSN `195347`, impact factor `4.70`) publishing the article `Compact Initiative`.

**View `v_journal_publication_detail`**

```sql
CREATE VIEW v_journal_publication_detail AS
SELECT a.id, a.journal_id, a.journal_name, b.id AS publication_id, b.publication_identifier AS publication_publication_identifier, b.title AS publication_title
FROM journals a
  JOIN journals_publications j ON j.journal_id = a.id
  JOIN publications b ON b.id = j.publication_id;
```

| id | journal_id | journal_name | publication_id | publication_publication_identifier | publication_title |
|---|---|---|---|---|---|
| 100 | 195347 | Extended Standard | 1 | PUB-2737 | Compact Initiative |
| 100 | 195347 | Extended Standard | 2 | PUB-2743 | Legacy Model |
| 101 | 3122ef58d8b44fb197236734beef7b29 | Pilot Framework A | 2 | PUB-2743 | Legacy Model |
| 101 | 3122ef58d8b44fb197236734beef7b29 | Pilot Framework A | 3 | PUB-2749 | Regional Cluster A |
| 102 | 6926358 | Baseline Protocol | 3 | PUB-2749 | Regional Cluster A |
| 102 | 6926358 | Baseline Protocol | 4 | PUB-2755 | Seasonal Review |
| 103 | 4060663 | Distributed Programme | 4 | PUB-2755 | Seasonal Review |
| 103 | 4060663 | Distributed Programme | 1 | PUB-2737 | Compact Initiative |

The view `v_journal_editorial_board_detail` joins `journals` with `journals_boards` and `editorial_boards` to answer: "Which editorial boards govern each journal, and what are their roles?" A row might show journal `Extended Standard` with board member `ChIJH2V4UYBt5kcR5doeFwuU7Ns` serving as `editor` since `2022-05-03`.

**View `v_journal_editorial_board_detail`**

```sql
CREATE VIEW v_journal_editorial_board_detail AS
SELECT a.id, a.journal_id, a.journal_name, b.id AS board_id, b.board_id AS board_board_id, b.role AS board_role
FROM journals a
  JOIN journals_boards j ON j.journal_id = a.id
  JOIN editorial_boards b ON b.id = j.editorial_board_id;
```

| id | journal_id | journal_name | board_id | board_board_id | board_role |
|---|---|---|---|---|---|
| 100 | 195347 | Extended Standard | 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | editor |
| 100 | 195347 | Extended Standard | 2 | 168553 | associate_editor |
| 101 | 3122ef58d8b44fb197236734beef7b29 | Pilot Framework A | 2 | 168553 | associate_editor |
| 101 | 3122ef58d8b44fb197236734beef7b29 | Pilot Framework A | 3 | 5006454 | board_member |
| 102 | 6926358 | Baseline Protocol | 3 | 5006454 | board_member |
| 102 | 6926358 | Baseline Protocol | 4 | 1437585 | editor |
| 103 | 4060663 | Distributed Programme | 4 | 1437585 | editor |
| 103 | 4060663 | Distributed Programme | 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | editor |

The view `v_editorial_board_journal` joins `editorial_boards` with `journals_boards` and `journals` to answer: "Which journal does each editorial board serve?" This is the reverse of `v_journal_editorial_board_detail`. A row might show board `ChIJH2V4UYBt5kcR5doeFwuU7Ns` (role: `editor`) serving journal `Extended Standard`.

**View `v_editorial_board_journal`**

```sql
CREATE VIEW v_editorial_board_journal AS
SELECT a.id, a.board_id, a.role, a.appointment_date, b.id AS journal_id, b.journal_id AS journal_journal_id, b.journal_name AS journal_journal_name
FROM editorial_boards a JOIN journals b ON a.journal_id = b.id;
```

| id | board_id | role | appointment_date | journal_id | journal_journal_id | journal_journal_name |
|---|---|---|---|---|---|---|
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | editor | 2022-05-03 | 100 | 195347 | Extended Standard |
| 2 | 168553 | associate_editor | 2023-10-14 | 101 | 3122ef58d8b44fb197236734beef7b29 | Pilot Framework A |
| 3 | 5006454 | board_member | 2024-03-25 | 102 | 6926358 | Baseline Protocol |
| 4 | 1437585 | editor | 2025-08-09 | 103 | 4060663 | Distributed Programme |

The view `v_editorial_board_researcher_detail` joins `editorial_boards` with `boards_researchers` and `researchers` to answer: "Which researchers serve on which editorial boards?" This view bridges the scholarly and governance dimensions of the domain. A row might show board member `ChIJH2V4UYBt5kcR5doeFwuU7Ns` (role: `editor`) served by researcher Theodore Mcgrath.

**View `v_editorial_board_researcher_detail`**

```sql
CREATE VIEW v_editorial_board_researcher_detail AS
SELECT a.id, a.board_id, a.role, b.researcher_id AS researcher_researcher_id, b.full_name AS researcher_full_name, b.institution AS researcher_institution
FROM editorial_boards a
  JOIN boards_researchers j ON j.editorial_board_id = a.id
  JOIN researchers b ON b.researcher_id = j.researcher_id;
```

| id | board_id | role | researcher_researcher_id | researcher_full_name | researcher_institution |
|---|---|---|---|---|---|
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | editor | 1 | Theodore Mcgrath | baseline-institut-31 |
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | editor | 2 | Account Name | pilot-institut-32 |
| 2 | 168553 | associate_editor | 2 | Account Name | pilot-institut-32 |
| 2 | 168553 | associate_editor | 3 | Saipan International Airport | extended-institut-33 |
| 3 | 5006454 | board_member | 3 | Saipan International Airport | extended-institut-33 |
| 3 | 5006454 | board_member | 4 | Norma Fisher | integrated-institut-34 |
| 4 | 1437585 | editor | 4 | Norma Fisher | integrated-institut-34 |
| 4 | 1437585 | editor | 1 | Theodore Mcgrath | baseline-institut-31 |

### Synthesis

The research administration schema demonstrates a disciplined separation of concerns: base tables encode entity attributes and their intrinsic constraints, junction tables resolve many-to-many cardinalities without introducing redundancy, and views provide denormalised projections that answer concrete analytical questions. The foreign-key topology forms a connected graph — researchers belong to institutions, institutions sponsor projects, projects produce publications, publications appear in journals, and journals are governed by editorial boards composed of researchers. This cycle of relationships means that any domain fact, from "which professor authored a peer-reviewed article in a high-impact journal" to "which editorial board member is affiliated with a university that sponsors an active project," can be reconstructed through a single join path through the normalised tables. The fourteen views cover every pairwise and three-way combination of the six core entities, ensuring that reporting, auditing, and analytical queries never require ad-hoc join construction.