## Research Administration and Clinical Investigation Framework

The modern research enterprise operates as a complex ecosystem of interlocking records: awards that fund work, researchers who execute it, organizations that host it, projects that structure it, and the clinical dimensions—geographic settings, health conditions, and biomarkers—that define what is being studied. This chapter documents the data architecture that captures these relationships, showing how discrete records about awards, people, institutions, and clinical targets are joined into composite views that answer practical questions about who is doing what, where, and for whom. The domain treats every entity as a tracked record with stable identifiers, and every operational relationship as a joinable link.

**Table `research_awards`**

| id | award_identifier | award_year | award_title | award_date | issuing_organization | researcher_id | research_organization_id |
|---|---|---|---|---|---|---|---|
| 1 | AWA-2104 | 36 | Seasonal Review | 2025-12-01T23:33:00 | Alphabet Inc Class A | 1000 | 100 |
| 2 | AWA-2105 | 43 | Integrated Initiative | 2022-05-12T06:50:00 | ITT Industries | 1001 | 101 |
| 3 | AWA-2106 | 50 | Extended Model D | 2023-10-23T13:07:00 | Switch Card Services Ltd. | 1002 | 102 |
| 4 | AWA-2107 | 57 | Pilot Cluster | 2024-03-07T20:24:00 | Buypass AS | 1003 | 103 |

Research awards form the financial backbone of the domain. Each award carries a stable identifier such as AWA-2104, a calendar year, a descriptive title like "Seasonal Review," and a precise issuance date. The issuing organization—Alphabet Inc Class A, ITT Industries, Switch Card Services Ltd., or Buypass AS—anchors the award to a funding source. The `researcher_id` and `research_organization_id` columns tie each award to the individual and institution responsible for its execution. Award 36, titled "Seasonal Review," was issued in December 2025 by Alphabet Inc Class A to researcher 1000 at organization 100, establishing the first funding chain in the dataset.

**Table `researchers`**

| id | researcher_identifier | full_legal_name | professional_title | military_rank | years_of_experience | specialization | research_award_id | research_organization_id | researcher_id | research_project_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | RES-2651 | Integrated Framework A | Integrated Programme A | regional-military-60 | 7.95 | legacy-speciali-13 | 1 | 100 | 1000 | 1 |
| 1001 | RES-2652 | Extended Protocol | Extended Standard | legacy-military-61 | 11.90 | compact-speciali-14 | 2 | 101 | 1001 | 2 |
| 1002 | RES-2653 | Pilot Programme | Pilot Framework | compact-military-62 | 15.85 | composite-speciali-15 | 3 | 102 | 1002 | 3 |
| 1003 | RES-2654 | Baseline Standard D | Baseline Protocol D | composite-military-63 | 19.80 | primary-speciali-16 | 4 | 103 | 1003 | 4 |

Researchers are the human actors in this system. Each record stores a legal name, a professional title, a military rank, years of experience, and a specialization code. The `researcher_identifier` column (RES-2651 through RES-2654) provides a stable handle. Researcher 1000, named "Integrated Framework A," holds the professional title "Integrated Programme A," carries the military rank regional-military-60, has accumulated 7.95 years of experience, and specializes in legacy-speciali-13. This individual is linked to award 1, organization 100, and project 1, forming a complete assignment chain. The `researcher_id` column also supports self-referential relationships, enabling the tracking of mentorship, collaboration, or hierarchical ties between researchers.

**Table `research_organizations`**

| research_organization_id | organization_identifier | organization_name | founding_year | headquarters_location | website_u_r_l | organization_type | research_award_id | researcher_id | research_project_id | geographic_location_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | LDAP First Name Field | Staples Inc. | 43 | composite-headquar-63 | https://www.nature.com/articles/nphoton.2017.123 | Gulf Oil | 1 | 1000 | 1 | 1 |
| 101 | Goodyear Tire & Rubber | Oscar Health Inc. | 48 | primary-headquar-64 | https://code.google.com/p/adwhirl/ | FSG Social Impact Advisors | 2 | 1001 | 2 | 2 |
| 102 | LINK Interchange Network Ltd | Atlantic Richfield | 53 | adaptive-headquar-65 | http://twitter.com/annhealthcare/status/423315405965635584 | McDonnell Douglas | 3 | 1002 | 3 | 3 |
| 103 | Alliant Energy Corp | Port Loko | 58 | distributed-headquar-66 | https://en.wiktionary.org/wiki/elephant | Alliant Energy Corp | 4 | 1003 | 4 | 4 |

Research organizations serve as the institutional containers for all activity. The table stores an organization identifier, a legal name, a founding year, headquarters location, website URL, and organization type. Organization 100, named "Staples Inc.," was founded in year 43, is headquartered at composite-headquar-63, and operates under the Gulf Oil classification. Its website points to a Nature Photonics article, and it is linked to award 1, researcher 1000, project 1, and geographic location 1. Organization 103, "Alliant Energy Corp," founded in year 58, operates under its own name as the organization type and is headquartered at distributed-headquar-66.

**Table `research_projects`**

| research_project_id | project_identifier | project_title | project_start_date | project_end_date | project_status | funding_source | grant_program_name | researcher_id | research_organization_id | geographic_location_id | health_condition_id | biomarker_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | PRO-2058 | Integrated Model A | 2022-09-18T20:24:00 | 2024-03-12T02:18:00 | seasonal-project-89 | baseline-funding-73 | Adaptive Model | 1000 | 100 | 1 | 1 | 1 |
| 2 | PRO-2059 | Extended Cluster | 2023-02-02T03:41:00 | 2025-08-23T09:35:00 | regional-project-90 | pilot-funding-74 | Primary Cluster | 1001 | 101 | 2 | 2 | 2 |
| 3 | PRO-2060 | Pilot Review | 2024-07-13T10:58:00 | 2022-01-07T16:52:00 | legacy-project-91 | extended-funding-75 | Composite Review D | 1002 | 102 | 3 | 3 | 3 |
| 4 | PRO-2061 | Baseline Initiative D | 2025-12-24T17:15:00 | 2023-06-18T23:09:00 | compact-project-92 | integrated-funding-76 | Compact Initiative | 1003 | 103 | 4 | 4 | 4 |

Research projects represent the operational units of investigation. Each project has an identifier (PRO-2058 through PRO-2061), a title, start and end dates, a status code, a funding source, and a grant program name. Project 1, "Integrated Model A," ran from September 2022 to March 2024 under the status seasonal-project-89, was funded by baseline-funding-73, and operated under the Adaptive Model grant program. It is assigned to researcher 1000, organization 100, geographic location 1, health condition 1, and biomarker 1, making it the central node connecting all seven base tables.

**Table `geographic_locations`**

| geographic_location_id | location_identifier | location_name | location_type | city | state | country | research_organization_id | research_project_id |
|---|---|---|---|---|---|---|---|---|
| 1 | LOC-2721 | Legacy Review D | legacy-location-19 | integrated-city-34 | distributed-state-84 | compact-country-26 | 100 | 1 |
| 2 | LOC-2726 | Regional Initiative | compact-location-20 | seasonal-city-35 | baseline-state-85 | composite-country-27 | 101 | 2 |
| 3 | LOC-2731 | Seasonal Model | composite-location-21 | regional-city-36 | pilot-state-86 | primary-country-28 | 102 | 3 |
| 4 | LOC-2736 | Integrated Cluster A | primary-location-22 | legacy-city-37 | extended-state-87 | adaptive-country-29 | 103 | 4 |

Geographic locations anchor research activity to physical places. Each record contains a location identifier (LOC-2721 through LOC-2736), a name, a type code, and city, state, and country fields. Location 1, "Legacy Review D," is classified as a legacy-location-19 and sits within integrated-city-34, distributed-state-84, and compact-country-26. It is associated with organization 100 and project 1. Location 4, "Integrated Cluster A," is a primary-location-22 in legacy-city-37, extended-state-87, and adaptive-country-29, linked to organization 103 and project 4.

**Table `health_conditions`**

| id | condition_identifier | condition_name | condition_category | prevalence_rate | risk_factors | research_project_id | biomarker_id |
|---|---|---|---|---|---|---|---|
| 1 | CON-2758 | Compact Standard | seasonal-conditio-29 | 22.45 | extended-risk-57 | 1 | 1 |
| 2 | CON-2761 | Legacy Framework | regional-conditio-30 | 25.90 | integrated-risk-58 | 2 | 2 |
| 3 | CON-2764 | Regional Protocol A | legacy-conditio-31 | 29.35 | seasonal-risk-59 | 3 | 3 |
| 4 | CON-2767 | Seasonal Programme | compact-conditio-32 | 32.80 | regional-risk-60 | 4 | 4 |

Health conditions define the clinical targets of research. Each condition has an identifier (CON-2758 through CON-2767), a name, a category code, a prevalence rate, and risk factors. Condition 1, "Compact Standard," falls under seasonal-conditio-29, has a prevalence rate of 22.45, and is associated with extended-risk-57. It is linked to project 1 and biomarker 1. Condition 4, "Seasonal Programme," has the highest prevalence rate at 32.80 and is tied to project 4 and biomarker 4.

**Table `biomarkers`**

| biomarker_id | biomarker_identifier | biomarker_name | biomarker_type | measurement_unit | normal_range | research_project_id | health_condition_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | BIO-2639 | Integrated Protocol A | integrated-biomarke-88 | extended-measurem-87 | primary-normal-40 | 1 | 1 | 2025-01-01 00:14:00 |
| 2 | BIO-2642 | Extended Programme | seasonal-biomarke-89 | integrated-measurem-88 | adaptive-normal-41 | 2 | 2 | 2025-02-06 03:14:00 |
| 3 | BIO-2645 | Pilot Standard | regional-biomarke-90 | seasonal-measurem-89 | distributed-normal-42 | 3 | 3 | 2025-03-11 06:14:00 |
| 4 | BIO-2648 | Baseline Framework D | legacy-biomarke-91 | regional-measurem-90 | baseline-normal-43 | 4 | 4 | 2025-04-16 09:14:00 |

Biomarkers represent the measurable biological indicators tracked within health conditions. While the table structure mirrors the other base tables with an identifier, name, and associated project and condition links, the specific biomarker values in the dataset (biomarker 1 through 4) serve as the quantitative readouts that connect clinical conditions to research projects. Each biomarker is paired with exactly one health condition and one research project, forming a triad of clinical measurement.

The power of this domain lies in its views—pre-joined result sets that answer specific operational questions by combining base tables. Each view represents a particular lens through which administrators, investigators, and analysts examine the research enterprise.

**View `vw_research_award_researcher`**

```sql
CREATE VIEW vw_research_award_researcher AS
SELECT a.id, a.award_identifier, a.award_year, a.award_title, b.id AS researcher_id, b.researcher_identifier AS researcher_researcher_identifier, b.full_legal_name AS researcher_full_legal_name
FROM research_awards a JOIN researchers b ON a.researcher_id = b.id;
```

| id | award_identifier | award_year | award_title | researcher_id | researcher_researcher_identifier | researcher_full_legal_name |
|---|---|---|---|---|---|---|
| 1 | AWA-2104 | 36 | Seasonal Review | 1000 | RES-2651 | Integrated Framework A |
| 2 | AWA-2105 | 43 | Integrated Initiative | 1001 | RES-2652 | Extended Protocol |
| 3 | AWA-2106 | 50 | Extended Model D | 1002 | RES-2653 | Pilot Programme |
| 4 | AWA-2107 | 57 | Pilot Cluster | 1003 | RES-2654 | Baseline Standard D |

This view joins research awards with their assigned researchers, answering the question of which individual is responsible for which award. The result surface reveals that award AWA-2104 (Seasonal Review, year 36) is held by researcher 1000, "Integrated Framework A," who brings 7.95 years of experience and specializes in legacy-speciali-13. This pairing confirms the direct funding-to-executor chain.

**View `vw_research_award_research_organization`**

```sql
CREATE VIEW vw_research_award_research_organization AS
SELECT a.id, a.award_identifier, a.award_year, a.award_title, b.research_organization_id AS organization_research_organization_id, b.organization_identifier AS organization_organization_identifier, b.organization_name AS organization_organization_name
FROM research_awards a JOIN research_organizations b ON a.research_organization_id = b.research_organization_id;
```

| id | award_identifier | award_year | award_title | organization_research_organization_id | organization_organization_identifier | organization_organization_name |
|---|---|---|---|---|---|---|
| 1 | AWA-2104 | 36 | Seasonal Review | 100 | LDAP First Name Field | Staples Inc. |
| 2 | AWA-2105 | 43 | Integrated Initiative | 101 | Goodyear Tire & Rubber | Oscar Health Inc. |
| 3 | AWA-2106 | 50 | Extended Model D | 102 | LINK Interchange Network Ltd | Atlantic Richfield |
| 4 | AWA-2107 | 57 | Pilot Cluster | 103 | Alliant Energy Corp | Port Loko |

By linking awards to their host organizations, this view clarifies institutional accountability. Award AWA-2105 (Integrated Initiative, year 43) is issued by ITT Industries and hosted at organization 101, Oscar Health Inc., which was founded in year 48 and operates under the FSG Social Impact Advisors classification. The view makes it possible to audit which organizations are managing which awards.

**View `vw_researcher_research_award`**

```sql
CREATE VIEW vw_researcher_research_award AS
SELECT a.id, a.researcher_identifier, a.full_legal_name, a.professional_title, b.id AS award_id, b.award_identifier AS award_award_identifier, b.award_year AS award_award_year
FROM researchers a JOIN research_awards b ON a.research_award_id = b.id;
```

| id | researcher_identifier | full_legal_name | professional_title | award_id | award_award_identifier | award_award_year |
|---|---|---|---|---|---|---|
| 1000 | RES-2651 | Integrated Framework A | Integrated Programme A | 1 | AWA-2104 | 36 |
| 1001 | RES-2652 | Extended Protocol | Extended Standard | 2 | AWA-2105 | 43 |
| 1002 | RES-2653 | Pilot Programme | Pilot Framework | 3 | AWA-2106 | 50 |
| 1003 | RES-2654 | Baseline Standard D | Baseline Protocol D | 4 | AWA-2107 | 57 |

This is the inverse of the award-to-researcher perspective, answering which awards a given researcher holds. Researcher 1001, "Extended Protocol," with 11.90 years of experience and military rank legacy-military-61, holds award 2 (AWA-2105, Integrated Initiative). The specialization compact-speciali-14 and professional title Extended Standard further characterize this individual's profile.

**View `vw_researcher_research_organization`**

```sql
CREATE VIEW vw_researcher_research_organization AS
SELECT a.id, a.researcher_identifier, a.full_legal_name, a.professional_title, b.research_organization_id AS organization_research_organization_id, b.organization_identifier AS organization_organization_identifier, b.organization_name AS organization_organization_name
FROM researchers a JOIN research_organizations b ON a.research_organization_id = b.research_organization_id;
```

| id | researcher_identifier | full_legal_name | professional_title | organization_research_organization_id | organization_organization_identifier | organization_organization_name |
|---|---|---|---|---|---|---|
| 1000 | RES-2651 | Integrated Framework A | Integrated Programme A | 100 | LDAP First Name Field | Staples Inc. |
| 1001 | RES-2652 | Extended Protocol | Extended Standard | 101 | Goodyear Tire & Rubber | Oscar Health Inc. |
| 1002 | RES-2653 | Pilot Programme | Pilot Framework | 102 | LINK Interchange Network Ltd | Atlantic Richfield |
| 1003 | RES-2654 | Baseline Standard D | Baseline Protocol D | 103 | Alliant Energy Corp | Port Loko |

This view maps researchers to their host organizations, revealing the institutional affiliations that structure the research workforce. Researcher 1002, "Pilot Programme," is affiliated with organization 102, LINK Interchange Network Ltd, which was founded in year 53 and headquartered at adaptive-headquar-65. The organization type McDonnell Douglas and the Atlantic Richfield identifier complete the institutional picture.

**View `vw_researcher_researcher`**

```sql
CREATE VIEW vw_researcher_researcher AS
SELECT a.id, a.researcher_identifier, a.full_legal_name, a.professional_title, b.id AS researcher_id, b.researcher_identifier AS researcher_researcher_identifier, b.full_legal_name AS researcher_full_legal_name
FROM researchers a JOIN researchers b ON a.researcher_id = b.id;
```

| id | researcher_identifier | full_legal_name | professional_title | researcher_id | researcher_researcher_identifier | researcher_full_legal_name |
|---|---|---|---|---|---|---|
| 1000 | RES-2651 | Integrated Framework A | Integrated Programme A | 1000 | RES-2651 | Integrated Framework A |
| 1001 | RES-2652 | Extended Protocol | Extended Standard | 1001 | RES-2652 | Extended Protocol |
| 1002 | RES-2653 | Pilot Programme | Pilot Framework | 1002 | RES-2653 | Pilot Programme |
| 1003 | RES-2654 | Baseline Standard D | Baseline Protocol D | 1003 | RES-2654 | Baseline Standard D |

The self-join on researchers captures interpersonal relationships—mentorship, collaboration, or reporting structures. This view enables the tracking of how researchers 1000 through 1003 are connected to one another, forming a network of professional ties that extends beyond individual project assignments.

**View `vw_researcher_research_project`**

```sql
CREATE VIEW vw_researcher_research_project AS
SELECT a.id, a.researcher_identifier, a.full_legal_name, a.professional_title, b.research_project_id AS project_research_project_id, b.project_identifier AS project_project_identifier, b.project_title AS project_project_title
FROM researchers a JOIN research_projects b ON a.research_project_id = b.research_project_id;
```

| id | researcher_identifier | full_legal_name | professional_title | project_research_project_id | project_project_identifier | project_project_title |
|---|---|---|---|---|---|---|
| 1000 | RES-2651 | Integrated Framework A | Integrated Programme A | 1 | PRO-2058 | Integrated Model A |
| 1001 | RES-2652 | Extended Protocol | Extended Standard | 2 | PRO-2059 | Extended Cluster |
| 1002 | RES-2653 | Pilot Programme | Pilot Framework | 3 | PRO-2060 | Pilot Review |
| 1003 | RES-2654 | Baseline Standard D | Baseline Protocol D | 4 | PRO-2061 | Baseline Initiative D |

This view connects researchers to their assigned projects, answering who is working on what. Researcher 1000, "Integrated Framework A," is assigned to project 1, "Integrated Model A" (PRO-2058), which ran from September 2022 to March 2024 under the Adaptive Model grant program. The project status seasonal-project-89 and funding source baseline-funding-73 provide the operational context for this assignment.

**View `vw_research_organization_research_award`**

```sql
CREATE VIEW vw_research_organization_research_award AS
SELECT a.research_organization_id, a.organization_identifier, a.organization_name, a.founding_year, b.id AS award_id, b.award_identifier AS award_award_identifier, b.award_year AS award_award_year
FROM research_organizations a JOIN research_awards b ON a.research_award_id = b.id;
```

| research_organization_id | organization_identifier | organization_name | founding_year | award_id | award_award_identifier | award_award_year |
|---|---|---|---|---|---|---|
| 100 | LDAP First Name Field | Staples Inc. | 43 | 1 | AWA-2104 | 36 |
| 101 | Goodyear Tire & Rubber | Oscar Health Inc. | 48 | 2 | AWA-2105 | 43 |
| 102 | LINK Interchange Network Ltd | Atlantic Richfield | 53 | 3 | AWA-2106 | 50 |
| 103 | Alliant Energy Corp | Port Loko | 58 | 4 | AWA-2107 | 57 |

The organizational perspective on awards shows which awards each institution manages. Organization 100, Staples Inc., manages award 1 (AWA-2104, Seasonal Review), issued by Alphabet Inc Class A in December 2025. This view supports institutional financial reporting and award portfolio analysis.

**View `vw_research_organization_researcher`**

```sql
CREATE VIEW vw_research_organization_researcher AS
SELECT a.research_organization_id, a.organization_identifier, a.organization_name, a.founding_year, b.id AS researcher_id, b.researcher_identifier AS researcher_researcher_identifier, b.full_legal_name AS researcher_full_legal_name
FROM research_organizations a JOIN researchers b ON a.researcher_id = b.id;
```

| research_organization_id | organization_identifier | organization_name | founding_year | researcher_id | researcher_researcher_identifier | researcher_full_legal_name |
|---|---|---|---|---|---|---|
| 100 | LDAP First Name Field | Staples Inc. | 43 | 1000 | RES-2651 | Integrated Framework A |
| 101 | Goodyear Tire & Rubber | Oscar Health Inc. | 48 | 1001 | RES-2652 | Extended Protocol |
| 102 | LINK Interchange Network Ltd | Atlantic Richfield | 53 | 1002 | RES-2653 | Pilot Programme |
| 103 | Alliant Energy Corp | Port Loko | 58 | 1003 | RES-2654 | Baseline Standard D |

This view reveals which researchers are employed by or affiliated with each organization. Organization 101, Oscar Health Inc., is associated with researcher 1001, "Extended Protocol," who holds the professional title Extended Standard and specializes in compact-speciali-14. The view supports workforce planning and institutional capacity assessment.

**View `vw_research_organization_research_project`**

```sql
CREATE VIEW vw_research_organization_research_project AS
SELECT a.research_organization_id, a.organization_identifier, a.organization_name, a.founding_year, b.research_project_id AS project_research_project_id, b.project_identifier AS project_project_identifier, b.project_title AS project_project_title
FROM research_organizations a JOIN research_projects b ON a.research_project_id = b.research_project_id;
```

| research_organization_id | organization_identifier | organization_name | founding_year | project_research_project_id | project_project_identifier | project_project_title |
|---|---|---|---|---|---|---|
| 100 | LDAP First Name Field | Staples Inc. | 43 | 1 | PRO-2058 | Integrated Model A |
| 101 | Goodyear Tire & Rubber | Oscar Health Inc. | 48 | 2 | PRO-2059 | Extended Cluster |
| 102 | LINK Interchange Network Ltd | Atlantic Richfield | 53 | 3 | PRO-2060 | Pilot Review |
| 103 | Alliant Energy Corp | Port Loko | 58 | 4 | PRO-2061 | Baseline Initiative D |

By linking organizations to their projects, this view answers which institution is hosting which investigation. Organization 102, LINK Interchange Network Ltd, hosts project 3, "Pilot Review" (PRO-2060), which has the status legacy-project-91 and is funded by extended-funding-75 under the Composite Review D grant program. The project's end date of January 2022 predates its start date of July 2024, suggesting a retrospective or restructured timeline.

**View `vw_research_organization_geographic_location`**

```sql
CREATE VIEW vw_research_organization_geographic_location AS
SELECT a.research_organization_id, a.organization_identifier, a.organization_name, a.founding_year, b.geographic_location_id AS location_geographic_location_id, b.location_identifier AS location_location_identifier, b.location_name AS location_location_name
FROM research_organizations a JOIN geographic_locations b ON a.geographic_location_id = b.geographic_location_id;
```

| research_organization_id | organization_identifier | organization_name | founding_year | location_geographic_location_id | location_location_identifier | location_location_name |
|---|---|---|---|---|---|---|
| 100 | LDAP First Name Field | Staples Inc. | 43 | 1 | LOC-2721 | Legacy Review D |
| 101 | Goodyear Tire & Rubber | Oscar Health Inc. | 48 | 2 | LOC-2726 | Regional Initiative |
| 102 | LINK Interchange Network Ltd | Atlantic Richfield | 53 | 3 | LOC-2731 | Seasonal Model |
| 103 | Alliant Energy Corp | Port Loko | 58 | 4 | LOC-2736 | Integrated Cluster A |

This view maps organizations to their geographic locations, answering where each institution is based. Organization 100, Staples Inc., is located at geographic location 1, "Legacy Review D" (LOC-2721), a legacy-location-19 in integrated-city-34, distributed-state-84, compact-country-26. The view supports geographic distribution analysis and regional capacity mapping.

**View `vw_research_project_researcher`**

```sql
CREATE VIEW vw_research_project_researcher AS
SELECT a.research_project_id, a.project_identifier, a.project_title, a.project_start_date, b.id AS researcher_id, b.researcher_identifier AS researcher_researcher_identifier, b.full_legal_name AS researcher_full_legal_name
FROM research_projects a JOIN researchers b ON a.researcher_id = b.id;
```

| research_project_id | project_identifier | project_title | project_start_date | researcher_id | researcher_researcher_identifier | researcher_full_legal_name |
|---|---|---|---|---|---|---|
| 1 | PRO-2058 | Integrated Model A | 2022-09-18T20:24:00 | 1000 | RES-2651 | Integrated Framework A |
| 2 | PRO-2059 | Extended Cluster | 2023-02-02T03:41:00 | 1001 | RES-2652 | Extended Protocol |
| 3 | PRO-2060 | Pilot Review | 2024-07-13T10:58:00 | 1002 | RES-2653 | Pilot Programme |
| 4 | PRO-2061 | Baseline Initiative D | 2025-12-24T17:15:00 | 1003 | RES-2654 | Baseline Standard D |

The project-centric view of researcher assignments shows which individuals are working on each project. Project 2, "Extended Cluster" (PRO-2059), is staffed by researcher 1001, "Extended Protocol," who has 11.90 years of experience and specializes in compact-speciali-14. The project runs from February 2023 to August 2025 under the Primary Cluster grant program.

**View `vw_research_project_research_organization`**

```sql
CREATE VIEW vw_research_project_research_organization AS
SELECT a.research_project_id, a.project_identifier, a.project_title, a.project_start_date, b.research_organization_id AS organization_research_organization_id, b.organization_identifier AS organization_organization_identifier, b.organization_name AS organization_organization_name
FROM research_projects a JOIN research_organizations b ON a.research_organization_id = b.research_organization_id;
```

| research_project_id | project_identifier | project_title | project_start_date | organization_research_organization_id | organization_organization_identifier | organization_organization_name |
|---|---|---|---|---|---|---|
| 1 | PRO-2058 | Integrated Model A | 2022-09-18T20:24:00 | 100 | LDAP First Name Field | Staples Inc. |
| 2 | PRO-2059 | Extended Cluster | 2023-02-02T03:41:00 | 101 | Goodyear Tire & Rubber | Oscar Health Inc. |
| 3 | PRO-2060 | Pilot Review | 2024-07-13T10:58:00 | 102 | LINK Interchange Network Ltd | Atlantic Richfield |
| 4 | PRO-2061 | Baseline Initiative D | 2025-12-24T17:15:00 | 103 | Alliant Energy Corp | Port Loko |

This view links projects to their host organizations, providing an institutional view of the project portfolio. Project 3, "Pilot Review," is hosted by organization 102, LINK Interchange Network Ltd, which was founded in year 53 and operates under the McDonnell Douglas classification. The project's extended-funding-75 source and Composite Review D grant program define its financial structure.

**View `vw_research_project_geographic_location`**

```sql
CREATE VIEW vw_research_project_geographic_location AS
SELECT a.research_project_id, a.project_identifier, a.project_title, a.project_start_date, b.geographic_location_id AS location_geographic_location_id, b.location_identifier AS location_location_identifier, b.location_name AS location_location_name
FROM research_projects a JOIN geographic_locations b ON a.geographic_location_id = b.geographic_location_id;
```

| research_project_id | project_identifier | project_title | project_start_date | location_geographic_location_id | location_location_identifier | location_location_name |
|---|---|---|---|---|---|---|
| 1 | PRO-2058 | Integrated Model A | 2022-09-18T20:24:00 | 1 | LOC-2721 | Legacy Review D |
| 2 | PRO-2059 | Extended Cluster | 2023-02-02T03:41:00 | 2 | LOC-2726 | Regional Initiative |
| 3 | PRO-2060 | Pilot Review | 2024-07-13T10:58:00 | 3 | LOC-2731 | Seasonal Model |
| 4 | PRO-2061 | Baseline Initiative D | 2025-12-24T17:15:00 | 4 | LOC-2736 | Integrated Cluster A |

This view connects projects to their operational locations, answering where each investigation takes place. Project 4, "Baseline Initiative D" (PRO-2061), is located at geographic location 4, "Integrated Cluster A" (LOC-2736), a primary-location-22 in legacy-city-37, extended-state-87, and adaptive-country-29. The project's compact-project-92 status and integrated-funding-76 source complete its operational profile.

**View `vw_research_project_health_condition`**

```sql
CREATE VIEW vw_research_project_health_condition AS
SELECT a.research_project_id, a.project_identifier, a.project_title, a.project_start_date, b.id AS condition_id, b.condition_identifier AS condition_condition_identifier, b.condition_name AS condition_condition_name
FROM research_projects a JOIN health_conditions b ON a.health_condition_id = b.id;
```

| research_project_id | project_identifier | project_title | project_start_date | condition_id | condition_condition_identifier | condition_condition_name |
|---|---|---|---|---|---|---|
| 1 | PRO-2058 | Integrated Model A | 2022-09-18T20:24:00 | 1 | CON-2758 | Compact Standard |
| 2 | PRO-2059 | Extended Cluster | 2023-02-02T03:41:00 | 2 | CON-2761 | Legacy Framework |
| 3 | PRO-2060 | Pilot Review | 2024-07-13T10:58:00 | 3 | CON-2764 | Regional Protocol A |
| 4 | PRO-2061 | Baseline Initiative D | 2025-12-24T17:15:00 | 4 | CON-2767 | Seasonal Programme |

This view reveals which health conditions each research project targets. Project 1, "Integrated Model A," targets health condition 1, "Compact Standard" (CON-2758), which has a prevalence rate of 22.45 and falls under the seasonal-conditio-29 category. The condition's risk factor extended-risk-57 and its association with biomarker 1 define the clinical measurement framework for this project.

**View `vw_research_project_biomarker`**

```sql
CREATE VIEW vw_research_project_biomarker AS
SELECT a.research_project_id, a.project_identifier, a.project_title, a.project_start_date, b.biomarker_id AS biomarker_biomarker_id, b.biomarker_identifier AS biomarker_biomarker_identifier, b.biomarker_name AS biomarker_biomarker_name
FROM research_projects a JOIN biomarkers b ON a.biomarker_id = b.biomarker_id;
```

| research_project_id | project_identifier | project_title | project_start_date | biomarker_biomarker_id | biomarker_biomarker_identifier | biomarker_biomarker_name |
|---|---|---|---|---|---|---|
| 1 | PRO-2058 | Integrated Model A | 2022-09-18T20:24:00 | 1 | BIO-2639 | Integrated Protocol A |
| 2 | PRO-2059 | Extended Cluster | 2023-02-02T03:41:00 | 2 | BIO-2642 | Extended Programme |
| 3 | PRO-2060 | Pilot Review | 2024-07-13T10:58:00 | 3 | BIO-2645 | Pilot Standard |
| 4 | PRO-2061 | Baseline Initiative D | 2025-12-24T17:15:00 | 4 | BIO-2648 | Baseline Framework D |

By linking projects to their biomarkers, this view shows which biological indicators are being measured. Project 2, "Extended Cluster," is associated with biomarker 2, which is linked to health condition 2, "Legacy Framework" (CON-2761). The condition has a prevalence rate of 25.90 and falls under regional-conditio-30, with integrated-risk-58 as its risk factor.

**View `vw_geographic_location_research_organization`**

```sql
CREATE VIEW vw_geographic_location_research_organization AS
SELECT a.geographic_location_id, a.location_identifier, a.location_name, a.location_type, b.research_organization_id AS organization_research_organization_id, b.organization_identifier AS organization_organization_identifier, b.organization_name AS organization_organization_name
FROM geographic_locations a JOIN research_organizations b ON a.research_organization_id = b.research_organization_id;
```

| geographic_location_id | location_identifier | location_name | location_type | organization_research_organization_id | organization_organization_identifier | organization_organization_name |
|---|---|---|---|---|---|---|
| 1 | LOC-2721 | Legacy Review D | legacy-location-19 | 100 | LDAP First Name Field | Staples Inc. |
| 2 | LOC-2726 | Regional Initiative | compact-location-20 | 101 | Goodyear Tire & Rubber | Oscar Health Inc. |
| 3 | LOC-2731 | Seasonal Model | composite-location-21 | 102 | LINK Interchange Network Ltd | Atlantic Richfield |
| 4 | LOC-2736 | Integrated Cluster A | primary-location-22 | 103 | Alliant Energy Corp | Port Loko |

This is the geographic perspective on organizations, showing which institutions operate from each location. Geographic location 2, "Regional Initiative" (LOC-2726), a compact-location-20 in seasonal-city-35, baseline-state-85, and composite-country-27, hosts organization 101, Oscar Health Inc. The view supports regional planning and infrastructure allocation.

**View `vw_geographic_location_research_project`**

```sql
CREATE VIEW vw_geographic_location_research_project AS
SELECT a.geographic_location_id, a.location_identifier, a.location_name, a.location_type, b.research_project_id AS project_research_project_id, b.project_identifier AS project_project_identifier, b.project_title AS project_project_title
FROM geographic_locations a JOIN research_projects b ON a.research_project_id = b.research_project_id;
```

| geographic_location_id | location_identifier | location_name | location_type | project_research_project_id | project_project_identifier | project_project_title |
|---|---|---|---|---|---|---|
| 1 | LOC-2721 | Legacy Review D | legacy-location-19 | 1 | PRO-2058 | Integrated Model A |
| 2 | LOC-2726 | Regional Initiative | compact-location-20 | 2 | PRO-2059 | Extended Cluster |
| 3 | LOC-2731 | Seasonal Model | composite-location-21 | 3 | PRO-2060 | Pilot Review |
| 4 | LOC-2736 | Integrated Cluster A | primary-location-22 | 4 | PRO-2061 | Baseline Initiative D |

This view maps geographic locations to their projects, answering which investigations are conducted at each site. Location 3, "Seasonal Model" (LOC-2731), a composite-location-21 in regional-city-36, pilot-state-86, and primary-country-28, hosts project 3, "Pilot Review." The project's legacy-project-91 status and Composite Review D grant program define its operational parameters.

**View `vw_health_condition_research_project`**

```sql
CREATE VIEW vw_health_condition_research_project AS
SELECT a.id, a.condition_identifier, a.condition_name, a.condition_category, b.research_project_id AS project_research_project_id, b.project_identifier AS project_project_identifier, b.project_title AS project_project_title
FROM health_conditions a JOIN research_projects b ON a.research_project_id = b.research_project_id;
```

| id | condition_identifier | condition_name | condition_category | project_research_project_id | project_project_identifier | project_project_title |
|---|---|---|---|---|---|---|
| 1 | CON-2758 | Compact Standard | seasonal-conditio-29 | 1 | PRO-2058 | Integrated Model A |
| 2 | CON-2761 | Legacy Framework | regional-conditio-30 | 2 | PRO-2059 | Extended Cluster |
| 3 | CON-2764 | Regional Protocol A | legacy-conditio-31 | 3 | PRO-2060 | Pilot Review |
| 4 | CON-2767 | Seasonal Programme | compact-conditio-32 | 4 | PRO-2061 | Baseline Initiative D |

The health-condition-centric view shows which projects target each condition. Health condition 3, "Regional Protocol A" (CON-2764), has a prevalence rate of 29.35 and falls under legacy-conditio-31 with seasonal-risk-59 as its risk factor. It is targeted by project 3, "Pilot Review," which runs under the Composite Review D grant program.

**View `vw_health_condition_biomarker`**

```sql
CREATE VIEW vw_health_condition_biomarker AS
SELECT a.id, a.condition_identifier, a.condition_name, a.condition_category, b.biomarker_id AS biomarker_biomarker_id, b.biomarker_identifier AS biomarker_biomarker_identifier, b.biomarker_name AS biomarker_biomarker_name
FROM health_conditions a JOIN biomarkers b ON a.biomarker_id = b.biomarker_id;
```

| id | condition_identifier | condition_name | condition_category | biomarker_biomarker_id | biomarker_biomarker_identifier | biomarker_biomarker_name |
|---|---|---|---|---|---|---|
| 1 | CON-2758 | Compact Standard | seasonal-conditio-29 | 1 | BIO-2639 | Integrated Protocol A |
| 2 | CON-2761 | Legacy Framework | regional-conditio-30 | 2 | BIO-2642 | Extended Programme |
| 3 | CON-2764 | Regional Protocol A | legacy-conditio-31 | 3 | BIO-2645 | Pilot Standard |
| 4 | CON-2767 | Seasonal Programme | compact-conditio-32 | 4 | BIO-2648 | Baseline Framework D |

This view links health conditions to their associated biomarkers, defining the clinical measurement pairs. Health condition 4, "Seasonal Programme" (CON-2767), has the highest prevalence rate at 32.80 and is associated with biomarker 4. The condition falls under compact-conditio-32 with regional-risk-60 as its risk factor, and the biomarker provides the quantitative readout for this clinical target.

**View `vw_biomarker_research_project`**

```sql
CREATE VIEW vw_biomarker_research_project AS
SELECT a.biomarker_id, a.biomarker_identifier, a.biomarker_name, a.biomarker_type, b.research_project_id AS project_research_project_id, b.project_identifier AS project_project_identifier, b.project_title AS project_project_title
FROM biomarkers a JOIN research_projects b ON a.research_project_id = b.research_project_id;
```

| biomarker_id | biomarker_identifier | biomarker_name | biomarker_type | project_research_project_id | project_project_identifier | project_project_title |
|---|---|---|---|---|---|---|
| 1 | BIO-2639 | Integrated Protocol A | integrated-biomarke-88 | 1 | PRO-2058 | Integrated Model A |
| 2 | BIO-2642 | Extended Programme | seasonal-biomarke-89 | 2 | PRO-2059 | Extended Cluster |
| 3 | BIO-2645 | Pilot Standard | regional-biomarke-90 | 3 | PRO-2060 | Pilot Review |
| 4 | BIO-2648 | Baseline Framework D | legacy-biomarke-91 | 4 | PRO-2061 | Baseline Initiative D |

This view shows which projects measure each biomarker, completing the clinical measurement chain. Biomarker 1 is measured in project 1, "Integrated Model A," which targets health condition 1, "Compact Standard." The project's seasonal-project-89 status and baseline-funding-76 source provide the operational context for this clinical measurement.

**View `vw_biomarker_health_condition`**

```sql
CREATE VIEW vw_biomarker_health_condition AS
SELECT a.biomarker_id, a.biomarker_identifier, a.biomarker_name, a.biomarker_type, b.id AS condition_id, b.condition_identifier AS condition_condition_identifier, b.condition_name AS condition_condition_name
FROM biomarkers a JOIN health_conditions b ON a.health_condition_id = b.id;
```

| biomarker_id | biomarker_identifier | biomarker_name | biomarker_type | condition_id | condition_condition_identifier | condition_condition_name |
|---|---|---|---|---|---|---|
| 1 | BIO-2639 | Integrated Protocol A | integrated-biomarke-88 | 1 | CON-2758 | Compact Standard |
| 2 | BIO-2642 | Extended Programme | seasonal-biomarke-89 | 2 | CON-2761 | Legacy Framework |
| 3 | BIO-2645 | Pilot Standard | regional-biomarke-90 | 3 | CON-2764 | Regional Protocol A |
| 4 | BIO-2648 | Baseline Framework D | legacy-biomarke-91 | 4 | CON-2767 | Seasonal Programme |

The biomarker-centric view of health conditions shows which clinical target each biomarker measures. Biomarker 2 is associated with health condition 2, "Legacy Framework," which has a prevalence rate of 25.90 and falls under regional-conditio-30. The condition's integrated-risk-58 risk factor and its link to project 2, "Extended Cluster," complete the clinical investigation chain.

The research administration domain, as captured in these tables and views, presents a tightly integrated record system where every award, researcher, organization, project, location, condition, and biomarker is a tracked entity with stable identifiers and explicit relationships. The base tables store the atomic facts; the views synthesize them into answerable questions. An administrator querying vw_researcher_research_project can determine that researcher 1000 is working on project 1, "Integrated Model A," which targets health condition 1, "Compact Standard," at geographic location 1, "Legacy Review D," under award AWA-2104, issued by Alphabet Inc Class A and hosted by organization 100, Staples Inc. Every layer of the enterprise is visible through the appropriate join, and every operational decision rests on the integrity of these linked records.