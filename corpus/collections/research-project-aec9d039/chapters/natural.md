# The Research Ecosystem: Projects, People, and Publications

Modern research organizations operate as complex networks where funding, personnel, scholarly output, and editorial governance intersect. At the core of this ecosystem are research projects—time-bound initiatives with defined scopes, budgets, and deliverables—anchored to institutions that provide infrastructure and legitimacy. Researchers move between projects and institutions, producing publications that feed into journals governed by editorial boards. Understanding how these entities relate requires examining both the individual records and the composite views that join them into actionable intelligence.

## Research Projects and Their Lifecycle

Research projects form the backbone of organized inquiry. Each project carries a unique identifier, a descriptive title, and a funding source that signals the economic and strategic priorities driving the work. Projects have explicit start and end dates, and their status—active, completed, or suspended—reflects their current standing in the organizational portfolio.

**Table `research_projects`**

| id | project_identifier | project_title | funding_agency | start_date | end_date | project_status |
|---|---|---|---|---|---|---|
| 1 | PRO-2058 | Integrated Model A | Alaska Air Group Inc | 2022-09-05 | 2022-09-01 | active |
| 2 | PRO-2059 | Extended Cluster | General Foods | 2023-02-16 | 2023-02-12 | completed |
| 3 | PRO-2060 | Pilot Review | Oscar Health Inc. | 2024-07-27 | 2024-07-23 | suspended |
| 4 | PRO-2061 | Baseline Initiative D | Mastercard International | 2025-12-11 | 2025-12-07 | active |

The project portfolio illustrates a range of operational states. Project PRO-2058, titled "Integrated Model A" and funded by Alaska Air Group Inc, began on 2022-09-05 and is marked active, though its end date of 2022-09-01 precedes the start—a data anomaly that warrants review. Project PRO-2059, "Extended Cluster" funded by General Foods, completed its lifecycle between 2023-02-16 and 2023-02-12. Project PRO-2060, "Pilot Review" under Oscar Health Inc., carries a suspended status as of 2024-07-27. The most recent entry, PRO-2061 "Baseline Initiative D" funded by Mastercard International, is scheduled for 2025-12-11 and remains active. These temporal patterns and status flags enable portfolio managers to track resource allocation and project health across the organization.

## Publications and Scholarly Output

Publications represent the formal dissemination of research findings. Each publication record includes an identifier, a title, a publication date, a type classification (such as book, journal article, chapter, or conference paper), language metadata, and a peer-review flag indicating whether the work underwent formal review. Publications are linked to both a journal and a research project, establishing their scholarly and organizational provenance.

**Table `publications`**

| id | publication_identifier | title | publication_date | publication_type | language | peer_reviewed | journal_id | research_project_id |
|---|---|---|---|---|---|---|---|---|
| 1 | PUB-2737 | Compact Initiative | 2025-12-01 | book | composite-language-45 | false | 100 | 1 |
| 2 | PUB-2743 | Legacy Model | 2022-05-12 | journal_article | primary-language-46 | true | 101 | 2 |
| 3 | PUB-2749 | Regional Cluster A | 2023-10-23 | chapter | adaptive-language-47 | false | 102 | 3 |
| 4 | PUB-2755 | Seasonal Review | 2024-03-07 | conference_paper | distributed-language-48 | true | 103 | 4 |

The publication catalog spans multiple formats and review statuses. Publication PUB-2737, "Compact Initiative," is classified as a book with composite-language-45 metadata and has not undergone peer review; it is associated with journal 100 and research project 1. Publication PUB-2743, "Legacy Model," is a peer-reviewed journal article in primary-language-46, published on 2022-05-12 under journal 101 and project 2. Publication PUB-2749, "Regional Cluster A," is a non-peer-reviewed chapter in adaptive-language-47 linked to journal 102 and project 3. Publication PUB-2755, "Seasonal Review," is a peer-reviewed conference paper in distributed-language-48 tied to journal 103 and project 4. The diversity of publication types and review statuses reflects the varied channels through which research findings reach their audiences.

## Researchers and Their Affiliations

Researchers are the human agents of the ecosystem. Each researcher record captures a full name, an institutional affiliation, a department, a role classification (such as professor, visiting_researcher, or postdoc), and timestamps for when the record was created and last updated. The institution_id field anchors each researcher to their home organization.

**Table `researchers`**

| researcher_id | full_name | institution | department | role | institution_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | baseline-institut-31 | adaptive-departme-89 | professor | 9424913 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Account Name | pilot-institut-32 | distributed-departme-90 | visiting_researcher | 8189481 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Saipan International Airport | extended-institut-33 | baseline-departme-91 | postdoc | 1437604 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Norma Fisher | integrated-institut-34 | pilot-departme-92 | professor | 884346 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The researcher roster includes Theodore Mcgrath, a professor at baseline-institut-31 within the adaptive-departme-89 department, with institution_id 9424913 and a record created on 2025-01-01. Account Name holds the role of visiting_researcher at pilot-institut-32 in the distributed-departme-90 department, with institution_id 8189481. Saipan International Airport is listed as a postdoc at extended-institut-33 in the baseline-departme-91 department, carrying institution_id 1437604. Norma Fisher, also a professor, is affiliated with integrated-institut-34 in the pilot-departme-92 department under institution_id 884346. These records establish the personnel foundation upon which project assignments and publication contributions are built.

## Institutions and Organizational Structure

Institutions provide the organizational container for research activity. Each institution record includes an institution_id, a name, a country classification, an institution_type (such as university, research_center, or government_agency), and a research_project_id that links the institution to a specific project.

**Table `institutions`**

| institution_id | institution_name | country | institution_type | research_project_id |
|---|---|---|---|---|
| 9424913 | Extended Corridor | compact-country-26 | university | 1 |
| 8189481 | Pilot Series A | composite-country-27 | research_center | 2 |
| 1437604 | Baseline Assessment | primary-country-28 | government_agency | 3 |
| 884346 | Distributed Survey | adaptive-country-29 | university | 4 |

The institutional landscape includes Extended Corridor (institution_id 9424913), classified as a university in compact-country-26 and associated with research project 1. Pilot Series A (institution_id 8189481) is a research_center in composite-country-27 linked to project 2. Baseline Assessment (institution_id 1437604) is a government_agency in primary-country-28 tied to project 3. Distributed Survey (institution_id 884346) is a university in adaptive-country-29 connected to project 4. The institution_type field distinguishes between academic, corporate, and governmental entities, each bringing different resources and mandates to the research enterprise.

## Journals and Editorial Governance

Journals serve as the formal venues for peer-reviewed publication. Each journal record contains an id, a journal_id, a journal_name, an issn, a publisher, and an impact_factor that quantifies the journal's influence within its field. Editorial boards govern the content and quality of each journal, with board members holding roles such as editor, associate_editor, or board_member.

**Table `journals`**

| id | journal_id | journal_name | issn | publisher | impact_factor |
|---|---|---|---|---|---|
| 100 | 195347 | Extended Standard | regional-issn-30 | pilot-publishe-50 | 4.70 |
| 101 | 3122ef58d8b44fb197236734beef7b29 | Pilot Framework A | legacy-issn-31 | extended-publishe-51 | 9.40 |
| 102 | 6926358 | Baseline Protocol | compact-issn-32 | integrated-publishe-52 | 14.10 |
| 103 | 4060663 | Distributed Programme | composite-issn-33 | seasonal-publishe-53 | 18.80 |

The journal registry includes Extended Standard (id 100, journal_id 195347), published by pilot-publishe-50 with an impact_factor of 4.70. Pilot Framework A (id 101, journal_id 3122ef58d8b44fb197236734beef7b29) carries a higher impact_factor of 9.40 and is published by extended-publishe-51. Baseline Protocol (id 102, journal_id 6926358) has an impact_factor of 14.10 and is published by integrated-publishe-52. Distributed Programme (id 103, journal_id 4060663) leads the portfolio with an impact_factor of 18.80, published by seasonal-publishe-53. These impact factors provide a quantitative measure of journal prestige that influences researcher publication strategies.

**Table `editorial_boards`**

| id | board_id | role | appointment_date | journal_id | created_at |
|---|---|---|---|---|---|
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | editor | 2022-05-03 | 100 | 2025-01-01 00:14:00 |
| 2 | 168553 | associate_editor | 2023-10-14 | 101 | 2025-02-06 03:14:00 |
| 3 | 5006454 | board_member | 2024-03-25 | 102 | 2025-03-11 06:14:00 |
| 4 | 1437585 | editor | 2025-08-09 | 103 | 2025-04-16 09:14:00 |

The editorial board structure assigns governance roles to journal oversight. Board entry 1 (board_id ChIJH2V4UYBt5kcR5doeFwuU7Ns) holds the editor role for journal 100, appointed on 2022-05-03. Board entry 2 (board_id 168553) serves as associate_editor for journal 101, appointed on 2023-10-14. Board entry 3 (board_id 5006454) is a board_member for journal 102, appointed on 2024-03-25. Board entry 4 (board_id 1437585) is an editor for journal 103, appointed on 2025-08-09. The appointment dates and role diversity reflect the layered editorial hierarchy that maintains publication quality.

## Cross-Cutting Relationships

The research ecosystem is defined not by isolated entities but by the relationships that connect them. Many-to-many associations between projects, researchers, and publications are captured in dedicated junction tables that record which researchers contributed to which projects and which researchers authored which publications.

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

These junction tables establish the attribution links that make the ecosystem analyzable. A single project may involve multiple researchers, and a single researcher may contribute to multiple projects. Similarly, publications may have multiple contributing researchers, and researchers may author publications across multiple projects. The junction tables preserve these many-to-many relationships as explicit records.

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

The institutions_researchers table formalizes the affiliation between researchers and their home institutions, while researchers_projects and researchers_publications provide alternative perspectives on the same relationships, organized from the researcher's point of view rather than the project's or publication's.

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

The journals_publications table links each publication to its publishing journal, journals_boards connects editorial boards to their journals, and boards_researchers establishes whether editorial board members are also researchers within the broader ecosystem. These relationships ensure that the editorial governance layer is fully integrated with the research and publication layers.

## Analytical Views

The junction tables provide the raw relational data, but analytical views synthesize these relationships into actionable detail. Each view answers a specific question by joining base tables and presenting the results in a unified format.

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

This view answers the question: which researchers are assigned to which research projects? It joins research_projects with researchers through the project-researcher relationship, producing a detailed roster. Reading a concrete row, one might find project PRO-2058 "Integrated Model A" paired with researcher Theodore Mcgrath, revealing the personnel allocation for that initiative.

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

This view maps research projects to their associated publications, answering: what scholarly output has each project produced? A row in this view might link project PRO-2059 "Extended Cluster" to publication PUB-2743 "Legacy Model," establishing the output trail from funded work to published result.

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

This view answers: which researchers contributed to which publications? It joins publications with researchers through the publication-researcher relationship. A representative row might show publication PUB-2749 "Regional Cluster A" alongside researcher Norma Fisher, documenting authorship attribution.

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

This view answers: which journal published which publication? It joins publications with journals, providing a clear mapping of scholarly output to its publishing venue. A row might link publication PUB-2755 "Seasonal Review" to journal Distributed Programme (id 103), showing the publication's editorial home.

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

This view answers: which research project produced which publication? It joins publications with research_projects, tracing the organizational provenance of each publication. A row might connect publication PUB-2737 "Compact Initiative" to project PRO-2058 "Integrated Model A," establishing the funding-to-output chain.

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

This view answers: which institution is each researcher affiliated with? It joins researchers with institutions, providing a clear personnel-to-organization mapping. A row might show researcher Theodore Mcgrath affiliated with institution Extended Corridor (institution_id 9424913), confirming the institutional anchor for that researcher.

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

This view answers: which research projects is each researcher involved in? It joins researchers with research_projects, providing a researcher-centric view of project assignments. A row might link researcher Norma Fisher to project PRO-2061 "Baseline Initiative D," revealing her current project engagement.

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

This view answers: which publications has each researcher authored? It joins researchers with publications, providing a researcher-centric view of scholarly output. A row might connect researcher Saipan International Airport to publication PUB-2749 "Regional Cluster A," documenting that researcher's contribution.

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

This view answers: which researchers belong to which institution? It joins institutions with researchers, providing an institution-centric roster of its personnel. A row might show institution Pilot Series A (institution_id 8189481) with researcher Account Name, listing the visiting researchers under that organization.

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

This view answers: which research projects are associated with which institutions? It joins institutions with research_projects, providing an organizational view of project involvement. A row might link institution Baseline Assessment (institution_id 1437604) to project PRO-2060 "Pilot Review," showing the institutional sponsorship of that suspended initiative.

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

This view answers: which publications appeared in which journal? It joins journals with publications, providing a journal-centric view of its content. A row might show journal Extended Standard (id 100) with publication PUB-2737 "Compact Initiative," listing the book that appeared in that venue.

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

This view answers: which editorial board members serve which journals? It joins journals with editorial_boards, providing a journal-centric view of its governance. A row might link journal Pilot Framework A (id 101) with board member 168553 holding the associate_editor role, documenting the editorial staffing for that journal.

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

This view answers: which journal does each editorial board serve? It joins editorial_boards with journals, providing a board-centric view of its publishing venue. A row might show board entry ChIJH2V4UYBt5kcR5doeFwuU7Ns serving journal Extended Standard (id 100), confirming the editor's assignment.

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

This view answers: which researchers serve on which editorial boards? It joins editorial_boards with researchers, revealing the overlap between editorial governance and research activity. A row might connect board member 5006454 (board_member role for journal 102) with researcher Theodore Mcgrath, indicating that this professor also participates in journal governance.

## Closing Synthesis

The research ecosystem is a tightly coupled network of projects, people, publications, institutions, journals, and editorial boards. Each entity carries its own attributes—identifiers, dates, classifications, and metrics—but the true analytical value emerges from the relationships that connect them. Junction tables preserve the many-to-many associations that define real-world research collaboration, while analytical views synthesize these relationships into focused lenses for decision-making. Whether tracking which researchers contribute to which projects, mapping publications to their funding sources, or verifying editorial governance structures, the integrated dataset provides a comprehensive foundation for understanding and managing the research enterprise.