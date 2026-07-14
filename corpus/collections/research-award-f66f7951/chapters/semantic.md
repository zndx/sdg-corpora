## Ontology-Grounded Relational Modelling of the Research Domain

The research domain captures a network of institutional awards, individual researchers, organisational entities, and scientific projects that intersect across geography, clinical conditions, and molecular biomarkers. At the conceptual level the ontology distinguishes seven entity types: `research_awards`, `researchers`, `research_organizations`, `research_projects`, `geographic_locations`, `health_conditions`, and `biomarkers`. Each entity type materialises as a base table whose primary key is a surrogate integer column, while a human-readable identifier column (e.g. `award_identifier`, `researcher_identifier`) provides a stable business key. Attributes that are single-valued and cardinality-bounded at one become ordinary columns; relationships that are many-to-many or that carry their own attributes are expressed through foreign keys and, where necessary, junction tables. The views that follow are the materialised joins that reconstruct domain facts from this normalised substrate.

**Table `research_awards`**

| id | award_identifier | award_year | award_title | award_date | issuing_organization | researcher_id | research_organization_id |
|---|---|---|---|---|---|---|---|
| 1 | AWA-2104 | 36 | Seasonal Review | 2025-12-01T23:33:00 | Alphabet Inc Class A | 1000 | 100 |
| 2 | AWA-2105 | 43 | Integrated Initiative | 2022-05-12T06:50:00 | ITT Industries | 1001 | 101 |
| 3 | AWA-2106 | 50 | Extended Model D | 2023-10-23T13:07:00 | Switch Card Services Ltd. | 1002 | 102 |
| 4 | AWA-2107 | 57 | Pilot Cluster | 2024-03-07T20:24:00 | Buypass AS | 1003 | 103 |

The `research_awards` table anchors the award entity. Its surrogate primary key `id` is an auto-incrementing integer, while `award_identifier` (e.g. `AWA-2104`, `AWA-2105`) serves as the stable business key. The `award_year` column stores a compact integer code — values such as `36`, `43`, `50`, `57` — and `award_title` carries a human-readable label like `Seasonal Review` or `Integrated Initiative`. The `award_date` column is a `TIMESTAMP` (e.g. `2025-12-01T23:33:00`), and `issuing_organization` is a denormalised string holding the name of the awarding body, such as `Alphabet Inc Class A` or `ITT Industries`. Two foreign keys, `researcher_id` and `research_organization_id`, bind each award to exactly one researcher and one research organisation respectively, enforcing a cardinality-bounded one-to-many relationship from each end to awards.

**Table `researchers`**

| id | researcher_identifier | full_legal_name | professional_title | military_rank | years_of_experience | specialization | research_award_id | research_organization_id | researcher_id | research_project_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | RES-2651 | Integrated Framework A | Integrated Programme A | regional-military-60 | 7.95 | legacy-speciali-13 | 1 | 100 | 1000 | 1 |
| 1001 | RES-2652 | Extended Protocol | Extended Standard | legacy-military-61 | 11.90 | compact-speciali-14 | 2 | 101 | 1001 | 2 |
| 1002 | RES-2653 | Pilot Programme | Pilot Framework | compact-military-62 | 15.85 | composite-speciali-15 | 3 | 102 | 1002 | 3 |
| 1003 | RES-2654 | Baseline Standard D | Baseline Protocol D | composite-military-63 | 19.80 | primary-speciali-16 | 4 | 103 | 1003 | 4 |

The `researchers` table models the individual scientist or principal investigator. Its surrogate key `id` (e.g. `1000`, `1001`) is complemented by the business key `researcher_identifier` (`RES-2651`, `RES-2652`). The `full_legal_name` column holds the person's legal name — `Integrated Framework A`, `Extended Protocol` — while `professional_title` captures their role such as `Integrated Programme A` or `Extended Standard`. The `military_rank` column stores a categorical code like `regional-military-60` or `legacy-military-61`, and `years_of_experience` is a `DECIMAL` (e.g. `7.95`, `11.90`). The `specialization` column holds a compact code such as `legacy-speciali-13`. Three foreign keys — `research_award_id`, `research_organization_id`, and `research_project_id` — link each researcher to their award, organisation, and project, respectively. The self-referential `researcher_id` column on the same table enables hierarchical or mentorship relationships between researchers.

**Table `research_organizations`**

| research_organization_id | organization_identifier | organization_name | founding_year | headquarters_location | website_u_r_l | organization_type | research_award_id | researcher_id | research_project_id | geographic_location_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | LDAP First Name Field | Staples Inc. | 43 | composite-headquar-63 | https://www.nature.com/articles/nphoton.2017.123 | Gulf Oil | 1 | 1000 | 1 | 1 |
| 101 | Goodyear Tire & Rubber | Oscar Health Inc. | 48 | primary-headquar-64 | https://code.google.com/p/adwhirl/ | FSG Social Impact Advisors | 2 | 1001 | 2 | 2 |
| 102 | LINK Interchange Network Ltd | Atlantic Richfield | 53 | adaptive-headquar-65 | http://twitter.com/annhealthcare/status/423315405965635584 | McDonnell Douglas | 3 | 1002 | 3 | 3 |
| 103 | Alliant Energy Corp | Port Loko | 58 | distributed-headquar-66 | https://en.wiktionary.org/wiki/elephant | Alliant Energy Corp | 4 | 1003 | 4 | 4 |

The `research_organizations` table represents the institutional entity. Its surrogate key `research_organization_id` (e.g. `100`, `101`) is paired with `organization_identifier` (`LDAP First Name Field`, `Goodyear Tire & Rubber`) and `organization_name` (`Staples Inc.`, `Oscar Health Inc.`). The `founding_year` column stores a compact integer (`43`, `48`), `headquarters_location` is a categorical code (`composite-headquar-63`), and `website_u_r_l` holds the full URL (`https://www.nature.com/articles/nphoton.2017.123`). The `organization_type` column carries a category label such as `Gulf Oil` or `FSG Social Impact Advisors`. Foreign keys `research_award_id`, `researcher_id`, and `research_project_id` bind the organisation to its award, researcher, and project, while `geographic_location_id` links to the `geographic_locations` table.

**Table `research_projects`**

| research_project_id | project_identifier | project_title | project_start_date | project_end_date | project_status | funding_source | grant_program_name | researcher_id | research_organization_id | geographic_location_id | health_condition_id | biomarker_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | PRO-2058 | Integrated Model A | 2022-09-18T20:24:00 | 2024-03-12T02:18:00 | seasonal-project-89 | baseline-funding-73 | Adaptive Model | 1000 | 100 | 1 | 1 | 1 |
| 2 | PRO-2059 | Extended Cluster | 2023-02-02T03:41:00 | 2025-08-23T09:35:00 | regional-project-90 | pilot-funding-74 | Primary Cluster | 1001 | 101 | 2 | 2 | 2 |
| 3 | PRO-2060 | Pilot Review | 2024-07-13T10:58:00 | 2022-01-07T16:52:00 | legacy-project-91 | extended-funding-75 | Composite Review D | 1002 | 102 | 3 | 3 | 3 |
| 4 | PRO-2061 | Baseline Initiative D | 2025-12-24T17:15:00 | 2023-06-18T23:09:00 | compact-project-92 | integrated-funding-76 | Compact Initiative | 1003 | 103 | 4 | 4 | 4 |

The `research_projects` table is the central hub of the domain model. Its surrogate key `research_project_id` (e.g. `1`, `2`) is complemented by `project_identifier` (`PRO-2058`, `PRO-2059`) and `project_title` (`Integrated Model A`, `Extended Cluster`). The `project_start_date` and `project_end_date` columns are `TIMESTAMP` values (e.g. `2022-09-18T20:24:00`, `2024-03-12T02:18:00`). The `project_status` column stores a categorical code such as `seasonal-project-89`, while `funding_source` and `grant_program_name` carry strings like `baseline-funding-73` and `Adaptive Model`. Foreign keys `researcher_id`, `research_organization_id`, `geographic_location_id`, `health_condition_id`, and `biomarker_id` link the project to its associated researcher, organisation, location, health condition, and biomarker, making this table the primary join nexus.

**Table `geographic_locations`**

| geographic_location_id | location_identifier | location_name | location_type | city | state | country | research_organization_id | research_project_id |
|---|---|---|---|---|---|---|---|---|
| 1 | LOC-2721 | Legacy Review D | legacy-location-19 | integrated-city-34 | distributed-state-84 | compact-country-26 | 100 | 1 |
| 2 | LOC-2726 | Regional Initiative | compact-location-20 | seasonal-city-35 | baseline-state-85 | composite-country-27 | 101 | 2 |
| 3 | LOC-2731 | Seasonal Model | composite-location-21 | regional-city-36 | pilot-state-86 | primary-country-28 | 102 | 3 |
| 4 | LOC-2736 | Integrated Cluster A | primary-location-22 | legacy-city-37 | extended-state-87 | adaptive-country-29 | 103 | 4 |

The `geographic_locations` table models the physical or administrative location associated with a research entity. Its surrogate key `geographic_location_id` (e.g. `1`, `2`) is paired with `location_identifier` (`LOC-2721`, `LOC-2726`) and `location_name` (`Legacy Review D`, `Regional Initiative`). The `location_type` column holds a categorical code such as `legacy-location-19`, while `city`, `state`, and `country` are string columns carrying codes like `integrated-city-34`, `distributed-state-84`, and `compact-country-26`. Foreign keys `research_organization_id` and `research_project_id` link the location to its parent organisation and project.

**Table `health_conditions`**

| id | condition_identifier | condition_name | condition_category | prevalence_rate | risk_factors | research_project_id | biomarker_id |
|---|---|---|---|---|---|---|---|
| 1 | CON-2758 | Compact Standard | seasonal-conditio-29 | 22.45 | extended-risk-57 | 1 | 1 |
| 2 | CON-2761 | Legacy Framework | regional-conditio-30 | 25.90 | integrated-risk-58 | 2 | 2 |
| 3 | CON-2764 | Regional Protocol A | legacy-conditio-31 | 29.35 | seasonal-risk-59 | 3 | 3 |
| 4 | CON-2767 | Seasonal Programme | compact-conditio-32 | 32.80 | regional-risk-60 | 4 | 4 |

The `health_conditions` table captures clinical or epidemiological conditions under study. Its surrogate key `id` (e.g. `1`, `2`) is complemented by `condition_identifier` (`CON-2758`, `CON-2761`) and `condition_name` (`Compact Standard`, `Legacy Framework`). The `condition_category` column stores a code such as `seasonal-conditio-29`, and `prevalence_rate` is a `DECIMAL` (e.g. `22.45`, `25.90`). The `risk_factors` column holds a categorical code like `extended-risk-57`. Foreign keys `research_project_id` and `biomarker_id` link each condition to its associated project and biomarker.

**Table `biomarkers`**

| biomarker_id | biomarker_identifier | biomarker_name | biomarker_type | measurement_unit | normal_range | research_project_id | health_condition_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | BIO-2639 | Integrated Protocol A | integrated-biomarke-88 | extended-measurem-87 | primary-normal-40 | 1 | 1 | 2025-01-01 00:14:00 |
| 2 | BIO-2642 | Extended Programme | seasonal-biomarke-89 | integrated-measurem-88 | adaptive-normal-41 | 2 | 2 | 2025-02-06 03:14:00 |
| 3 | BIO-2645 | Pilot Standard | regional-biomarke-90 | seasonal-measurem-89 | distributed-normal-42 | 3 | 3 | 2025-03-11 06:14:00 |
| 4 | BIO-2648 | Baseline Framework D | legacy-biomarke-91 | regional-measurem-90 | baseline-normal-43 | 4 | 4 | 2025-04-16 09:14:00 |

The `biomarkers` table models molecular or clinical biomarkers. Although no row data is displayed, the table exists as a first-class entity type in the ontology, referenced by foreign keys in both `health_conditions` and `research_projects`. Its structure mirrors the other lookup tables: a surrogate primary key, a business-key identifier column, and attribute columns for the biomarker's name, type, and measurement properties.

The base tables above form a star-like normalised schema centred on `research_projects`, with `researchers` and `research_organizations` as peer hubs. Foreign keys enforce referential integrity: a row in `research_awards` cannot reference a non-existent researcher or organisation; a `research_project` cannot exist without its linked location, condition, and biomarker. The cardinality-bounded relationships are encoded as single-column foreign keys on the many side of each one-to-many association.

The views materialise the domain facts by joining these normalised tables. Each view answers a specific analytical question by projecting the relevant columns and joining on the foreign keys established in the base schema.

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

The view `vw_research_award_researcher` joins `research_awards` to `researchers` on `research_awards.researcher_id = researchers.id`. It answers the question: "Which researcher received which award?" A row with `award_identifier = AWA-2104`, `award_title = Seasonal Review`, and `researcher_identifier = RES-2651` tells us that researcher `RES-2651` received the `Seasonal Review` award in year `36`.

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

The view `vw_research_award_research_organization` joins `research_awards` to `research_organizations` on `research_awards.research_organization_id = research_organizations.research_organization_id`. It answers: "Which organisation was associated with which award?" A row showing `award_identifier = AWA-2105` alongside `organization_name = Oscar Health Inc.` links the `Integrated Initiative` award to that organisation.

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

The view `vw_researcher_research_award` is the inverse of `vw_research_award_researcher`: it starts from `researchers` and joins to `research_awards`. It answers: "What awards did a given researcher receive?" A row with `researcher_identifier = RES-2651`, `full_legal_name = Integrated Framework A`, and `award_title = Seasonal Review` reconstructs the same fact from the researcher's perspective.

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

The view `vw_researcher_research_organization` joins `researchers` to `research_organizations` on `researchers.research_organization_id = research_organizations.research_organization_id`. It answers: "Which organisation is each researcher affiliated with?" A row pairing `RES-2651` with `Staples Inc.` and `organization_type = Gulf Oil` shows the researcher's institutional home.

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

The view `vw_researcher_researcher` performs a self-join on the `researchers` table, typically on the self-referential `researcher_id` column. It answers: "What are the hierarchical or mentorship relationships between researchers?" A row linking `RES-2651` to `RES-2652` reveals a peer or supervisory relationship within the researcher network.

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

The view `vw_researcher_research_project` joins `researchers` to `research_projects` on `researchers.research_project_id = research_projects.research_project_id`. It answers: "Which project is each researcher working on?" A row with `researcher_identifier = RES-2651` and `project_title = Integrated Model A` shows that researcher `RES-2651` is assigned to the `Integrated Model A` project.

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

The view `vw_research_organization_research_award` joins `research_organizations` to `research_awards` on `research_organizations.research_award_id = research_awards.id`. It answers: "Which awards are associated with a given organisation?" A row showing `organization_name = Staples Inc.` alongside `award_title = Seasonal Review` links the organisation to that award.

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

The view `vw_research_organization_researcher` joins `research_organizations` to `researchers` on `research_organizations.researcher_id = researchers.id`. It answers: "Which researchers are employed by or affiliated with a given organisation?" A row pairing `Staples Inc.` with `RES-2651` and `full_legal_name = Integrated Framework A` shows the researcher's organisational affiliation.

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

The view `vw_research_organization_research_project` joins `research_organizations` to `research_projects` on `research_organizations.research_project_id = research_projects.research_project_id`. It answers: "Which projects does an organisation sponsor?" A row with `organization_name = Oscar Health Inc.` and `project_title = Extended Cluster` shows the organisation's project portfolio.

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

The view `vw_research_organization_geographic_location` joins `research_organizations` to `geographic_locations` on `research_organizations.geographic_location_id = geographic_locations.geographic_location_id`. It answers: "Where is each organisation headquartered?" A row pairing `Staples Inc.` with `location_name = Legacy Review D`, `city = integrated-city-34`, and `country = compact-country-26` reveals the organisation's geographic footprint.

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

The view `vw_research_project_researcher` joins `research_projects` to `researchers` on `research_projects.researcher_id = researchers.id`. It answers: "Which researcher is assigned to a given project?" A row with `project_title = Integrated Model A` and `researcher_identifier = RES-2651` shows the project's assigned researcher.

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

The view `vw_research_project_research_organization` joins `research_projects` to `research_organizations` on `research_projects.research_organization_id = research_organizations.research_organization_id`. It answers: "Which organisation sponsors a given project?" A row with `project_title = Extended Cluster` and `organization_name = Oscar Health Inc.` links the project to its sponsoring organisation.

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

The view `vw_research_project_geographic_location` joins `research_projects` to `geographic_locations` on `research_projects.geographic_location_id = geographic_locations.geographic_location_id`. It answers: "Where is a given project located?" A row with `project_title = Integrated Model A` and `location_name = Legacy Review D`, `city = integrated-city-34` shows the project's geographic setting.

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

The view `vw_research_project_health_condition` joins `research_projects` to `health_conditions` on `research_projects.health_condition_id = health_conditions.id`. It answers: "Which health condition is a given project studying?" A row with `project_title = Integrated Model A` and `condition_name = Compact Standard`, `prevalence_rate = 22.45` shows the clinical focus of the project.

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

The view `vw_research_project_biomarker` joins `research_projects` to `biomarkers` on `research_projects.biomarker_id = biomarkers.id`. It answers: "Which biomarker is a given project measuring?" A row with `project_title = Extended Cluster` and the biomarker's name and type reconstructs the project's molecular focus.

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

The view `vw_geographic_location_research_organization` joins `geographic_locations` to `research_organizations` on `geographic_locations.research_organization_id = research_organizations.research_organization_id`. It answers: "Which organisations are located at a given geographic site?" A row with `location_name = Legacy Review D` and `organization_name = Staples Inc.` shows the organisation at that location.

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

The view `vw_geographic_location_research_project` joins `geographic_locations` to `research_projects` on `geographic_locations.research_project_id = research_projects.research_project_id`. It answers: "Which projects are conducted at a given location?" A row with `location_name = Regional Initiative` and `project_title = Extended Cluster` shows the project at that site.

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

The view `vw_health_condition_research_project` joins `health_conditions` to `research_projects` on `health_conditions.research_project_id = research_projects.research_project_id`. It answers: "Which projects are studying a given health condition?" A row with `condition_name = Compact Standard` and `project_title = Integrated Model A` shows the project investigating that condition.

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

The view `vw_health_condition_biomarker` joins `health_conditions` to `biomarkers` on `health_conditions.biomarker_id = biomarkers.id`. It answers: "Which biomarker is associated with a given health condition?" A row with `condition_name = Compact Standard` and the biomarker's identifier links the clinical condition to its molecular correlate.

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

The view `vw_biomarker_research_project` joins `biomarkers` to `research_projects` on `biomarkers.id = research_projects.biomarker_id`. It answers: "Which projects measure a given biomarker?" A row with the biomarker's name and `project_title = Integrated Model A` shows the project's measurement scope.

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

The view `vw_biomarker_health_condition` joins `biomarkers` to `health_conditions` on `biomarkers.id = health_conditions.biomarker_id`. It answers: "Which health conditions are associated with a given biomarker?" A row with the biomarker's name and `condition_name = Compact Standard` shows the clinical relevance of the biomarker.

The relational schema above is a direct materialisation of the ontology's entity-relationship structure. Each base table corresponds to an ontology class; each column corresponds to a data property or a foreign-key reference to another class. The surrogate primary keys (`id`, `research_organization_id`, `research_project_id`, `geographic_location_id`) are implementation artefacts that enable efficient joins, while the business-key columns (`award_identifier`, `researcher_identifier`, `project_identifier`, etc.) carry the domain-stable identifiers. The views are not additional storage — they are declarative joins that reconstruct the multi-table facts the ontology describes. Reading any view is equivalent to traversing the ontology's relationship paths: for example, `vw_research_project_health_condition` traverses the `researches_condition` edge from `ResearchProject` to `HealthCondition`, projecting the project's title alongside the condition's name and prevalence rate. This normalised-plus-view architecture preserves update anomaly resistance in the base tables while providing analytical convenience through the materialised join views.