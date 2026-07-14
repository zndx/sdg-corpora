# Research Portfolio Management: A Practitioner's Reference

Research organizations operating within multi-stakeholder funding ecosystems must track a complex web of entities: individual researchers, collaborative events, project proposals, societal challenges, partner organizations, and thematic areas. This chapter documents the data model that underpins such a portfolio management system, showing how each record type functions and how they interlock to produce actionable views for program managers, institutional coordinators, and funding evaluators.

## The Researcher Registry

At the core of the system is the researcher registry, a table that captures the professional identity and institutional affiliation of each scientist or scholar participating in the portfolio.

**Table `researchers`**

| id | researcher_id | full_name | phd_award_date | institution | discipline | is_selected | project_proposal_id |
|---|---|---|---|---|---|---|---|
| 1 | 89419 | Theodore Mcgrath | 2023-06-13 | baseline-institut-31 | adaptive-discipli-53 | true | 100 |
| 2 | 2618557 | Account Name | 2024-11-24 | pilot-institut-32 | distributed-discipli-54 | false | 101 |
| 3 | 9736892 | Saipan International Airport | 2025-04-08 | extended-institut-33 | baseline-discipli-55 | true | 102 |
| 4 | 1450639 | Norma Fisher | 2022-09-19 | integrated-institut-34 | pilot-discipli-56 | false | 103 |

Each researcher record carries a unique `researcher_id` alongside a human-readable `full_name`. The `institution` field anchors the researcher to an organizational unit—values such as `baseline-institut-31`, `pilot-institut-32`, `extended-institut-33`, and `integrated-institut-34` represent the institutional landscape. The `discipline` column classifies the researcher's field, with entries like `adaptive-discipli-53`, `distributed-discipli-54`, `baseline-discipli-55`, and `pilot-discipli-56` reflecting the breadth of scientific domains covered. A `phd_award_date` provides a temporal anchor for seniority, while the `is_selected` flag indicates whether the researcher has been chosen for active portfolio participation. The `project_proposal_id` column links the researcher to a specific proposal, establishing the primary assignment relationship. For instance, Theodore Mcgrath (researcher_id 89419) at baseline-institut-31 holds discipline adaptive-discipli-53, was awarded their PhD on 2023-06-13, is marked as selected, and is assigned to proposal 100.

## Event Management

The events table records scientific and administrative gatherings—workshops, conferences, summer schools—that serve as coordination nodes within the research ecosystem.

**Table `events`**

| id | event_id | event_name | event_type | start_date | end_date | region | status | followed_by_event_id | project_proposal_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2002007020060 | Seasonal Standard | Lab Surfing Workshop | 2022-09-05 | 2022-09-01 | North and Irish Sea | planned | 1000 | 100 |
| 1001 | 168535 | Integrated Framework | Blue Sky Conference | 2023-02-16 | 2023-02-12 | Black Sea and South Mediterranean | running | 1001 | 101 |
| 1002 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | Science Incubator Summer School | 2024-07-27 | 2024-07-23 | Western Balkans | completed | 1002 | 102 |
| 1003 | 1186089 | Pilot Programme | Lab Surfing Workshop | 2025-12-11 | 2025-12-07 | Central and Eastern Europe | planned | 1003 | 103 |

Each event carries an `event_id` for system-level referencing and an `event_name` for human consumption. The `event_type` distinguishes formats: Lab Surfing Workshop, Blue Sky Conference, and Science Incubator Summer School appear across the dataset. Temporal scope is captured through `start_date` and `end_date`, while the `region` field situates the event geographically—North and Irish Sea, Black Sea and South Mediterranean, Western Balkans, and Central and Eastern Europe are represented. The `status` column tracks lifecycle state with values of `planned`, `running`, and `completed`. A `followed_by_event_id` column enables sequential event chaining, and `project_proposal_id` ties the event to its parent proposal. The event with identifier 2002007020060, titled "Seasonal Standard," is a Lab Surfing Workshop in the North and Irish Sea region, currently in planned status, linked to proposal 100.

## Project Proposals and Funding

Project proposals constitute the primary funding instrument in the portfolio. The `project_proposals` table captures each submission from draft through rejection.

**Table `project_proposals`**

| id | proposal_id | title | thematic_area | funding_program | status | submission_date | event_id | societal_challenge_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 2986221 | Compact Initiative | Constructive symbiosis | regional-funding-96 | draft | 2025-04-24 | 1000 | 1000 |
| 101 | 4447025 | Legacy Model | Bottom-up intelligent construction | legacy-funding-97 | submitted | 2022-09-08 | 1001 | 1001 |
| 102 | 2986232 | Regional Cluster A | Ecological technology | compact-funding-98 | funded | 2023-02-19 | 1002 | 1002 |
| 103 | lu_tax_code_template_m12 | Seasonal Review | Nano-bio-chem interface | composite-funding-99 | rejected | 2024-07-03 | 1003 | 1003 |

The `proposal_id` serves as the system-level key, while `title` provides the human-readable designation. The `thematic_area` column classifies the proposal's scientific focus—Constructive symbiosis, Bottom-up intelligent construction, Ecological technology, and Nano-bio-chem interface are the four areas represented. The `funding_program` field identifies the financial instrument, with values such as `regional-funding-96`, `legacy-funding-97`, `compact-funding-98`, and `composite-funding-99`. The `status` column tracks the proposal lifecycle through draft, submitted, funded, and rejected states. A `submission_date` anchors the timeline, `event_id` links the proposal to a coordinating event, and `societal_challenge_id` connects it to the broader challenge it addresses. Proposal 2986221, titled "Compact Initiative," falls under Constructive symbiosis, was submitted under regional-funding-96, is in draft status as of 2025-04-24, and is associated with event 1000 and societal challenge 1000.

## Societal Challenges

The societal challenges table maps each proposal to the high-level challenge it is designed to address, providing a policy-level classification layer.

**Table `societal_challenges`**

| societal_challenge_id | challenge_id | challenge_name | project_proposal_id |
|---|---|---|---|
| 1000 | 7119777 | Health, Demographic Change and Wellbeing | 100 |
| 1001 | 4005 | Secure, clean and efficient energy | 101 |
| 1002 | 9085252 | Industrial biotechnology | 102 |
| 1003 | ebdf79bc-8fd1-11eb-924d-9cd76263cbd0 | Smart, green and integrated transport | 103 |

Each challenge record carries a `societal_challenge_id` for internal referencing and a `challenge_id` for external alignment. The `challenge_name` field provides the human-readable label: Health, Demographic Change and Wellbeing; Secure, clean and efficient energy; Industrial biotechnology; and Smart, green and integrated transport. The `project_proposal_id` column creates the linkage back to the funding instrument. This table ensures that every proposal can be traced to its policy objective, enabling portfolio-level analysis of challenge coverage.

## Partner Organizations

Partner organizations table records the institutional participants in events, capturing their type, location, and coordination role.

**Table `partner_organizations`**

| id | partner_id | organization_name | organization_type | country | is_coordinator | event_id | partner_organization_id |
|---|---|---|---|---|---|---|---|
| 100 | 69420 | Staples Inc. | University | compact-country-26 | false | 1000 | 100 |
| 101 | 9085260 | Oscar Health Inc. | Research Institution | composite-country-27 | true | 1001 | 101 |
| 102 | 195367 | Atlantic Richfield | SME | primary-country-28 | false | 1002 | 102 |
| 103 | b_VB-EC-12 | Port Loko | University | adaptive-country-29 | true | 1003 | 103 |

Each record carries a `partner_id` for system identification and an `organization_name` for human reference. The `organization_type` field classifies entities as University, Research Institution, or SME. The `country` column encodes geographic location with values such as `compact-country-26`, `composite-country-27`, `primary-country-28`, and `adaptive-country-29`. The `is_coordinator` flag identifies the lead institution for each event. The `event_id` links the partner to its hosting event, while `partner_organization_id` enables cross-referencing between partner records. Staples Inc., a University in compact-country-26, participates in event 1000 as a non-coordinating partner. Oscar Health Inc., a Research Institution in composite-country-27, serves as the coordinator for event 1001.

## Thematic Areas

The thematic_areas table provides a structured classification of scientific domains, linking each area to the proposals that fall within it.

**Table `thematic_areas`**

| thematic_area_id | area_id | area_name | project_proposal_id |
|---|---|---|---|
| 1000 | default_chart_a_tax_19 | Constructive symbiosis | 100 |
| 1001 | fro | Bottom-up intelligent construction | 101 |
| 1002 | account_pymes_296 | Ecological technology | 102 |
| 1003 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Nano-bio-chem interface | 103 |

Each thematic area record carries a `thematic_area_id` for internal referencing and an `area_id` for external alignment. The `area_name` field provides the human-readable label: Constructive symbiosis, Bottom-up intelligent construction, Ecological technology, and Nano-bio-chem interface. The `project_proposal_id` column creates the linkage back to the funding instrument. This table ensures consistent classification across proposals and enables thematic portfolio analysis.

## Cross-Referencing Tables

The portfolio model employs junction tables to manage many-to-many relationships between core entities. These tables capture the associative facts that cannot be stored within any single entity record.

**Table `researchers_events`**

| researcher_id | event_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The researchers_events table records which researchers participate in which events, enabling the system to answer questions about event staffing and researcher event history.

**Table `researchers_researchers`**

| researcher_id | collaborates_with_researcher_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The researchers_researchers table captures collaboration relationships between researchers, supporting the tracking of co-authorship, mentorship, and institutional partnerships.

**Table `events_researchers`**

| event_id | researcher_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The events_researchers table provides an alternative linkage between events and researchers, complementing the researchers_events table with a different perspective on the same relationship.

**Table `proposals_researchers`**

| project_proposal_id | researcher_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The proposals_researchers table records which researchers are assigned to which project proposals, enabling the system to track team composition and workload distribution across the portfolio.

## Researcher-Centric Detail Views

Three views present the researcher's world from their own perspective, aggregating their event participation, collaborations, and proposal assignments into unified records.

**View `researcher_event_detail_view`**

```sql
CREATE VIEW researcher_event_detail_view AS
SELECT a.id, a.researcher_id, a.full_name, b.id AS event_id, b.event_id AS event_event_id, b.event_name AS event_event_name
FROM researchers a
  JOIN researchers_events j ON j.researcher_id = a.id
  JOIN events b ON b.id = j.event_id;
```

| id | researcher_id | full_name | event_id | event_event_id | event_event_name |
|---|---|---|---|---|---|
| 1 | 89419 | Theodore Mcgrath | 1000 | 2002007020060 | Seasonal Standard |
| 1 | 89419 | Theodore Mcgrath | 1001 | 168535 | Integrated Framework |
| 2 | 2618557 | Account Name | 1001 | 168535 | Integrated Framework |
| 2 | 2618557 | Account Name | 1002 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D |
| 3 | 9736892 | Saipan International Airport | 1002 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D |
| 3 | 9736892 | Saipan International Airport | 1003 | 1186089 | Pilot Programme |
| 4 | 1450639 | Norma Fisher | 1003 | 1186089 | Pilot Programme |
| 4 | 1450639 | Norma Fisher | 1000 | 2002007020060 | Seasonal Standard |

The researcher_event_detail_view answers the question: "What events is this researcher involved in, and what are the details of those events?" Each row in this view combines a researcher's identity with the full event record, including event name, type, dates, region, and status. A row showing Theodore Mcgrath (researcher_id 89419) alongside the Seasonal Standard Lab Surfing Workshop (event 2002007020060) in the North and Irish Sea region, currently in planned status, tells a program manager exactly which researcher is assigned to which upcoming event.

**View `researcher_researcher_detail_view`**

```sql
CREATE VIEW researcher_researcher_detail_view AS
SELECT a.id, a.researcher_id, a.full_name, b.id AS researcher_id, b.researcher_id AS researcher_researcher_id, b.full_name AS researcher_full_name
FROM researchers a
  JOIN researchers_researchers j ON j.researcher_id = a.id
  JOIN researchers b ON b.id = j.collaborates_with_researcher_id;
```

| id | researcher_id | full_name | researcher_id | researcher_researcher_id | researcher_full_name |
|---|---|---|---|---|---|
| 1 | 89419 | Theodore Mcgrath | 1 | 89419 | Theodore Mcgrath |
| 1 | 89419 | Theodore Mcgrath | 2 | 2618557 | Account Name |
| 2 | 2618557 | Account Name | 2 | 2618557 | Account Name |
| 2 | 2618557 | Account Name | 3 | 9736892 | Saipan International Airport |
| 3 | 9736892 | Saipan International Airport | 3 | 9736892 | Saipan International Airport |
| 3 | 9736892 | Saipan International Airport | 4 | 1450639 | Norma Fisher |
| 4 | 1450639 | Norma Fisher | 4 | 1450639 | Norma Fisher |
| 4 | 1450639 | Norma Fisher | 1 | 89419 | Theodore Mcgrath |

The researcher_researcher_detail_view answers: "Who collaborates with this researcher, and what are their institutional and disciplinary profiles?" Each row pairs a researcher with a collaborator, presenting both parties' names, institutions, disciplines, and selection status. This view supports network analysis and helps coordinators identify potential team compositions based on existing collaboration patterns.

**View `researcher_project_proposal_view`**

```sql
CREATE VIEW researcher_project_proposal_view AS
SELECT a.id, a.researcher_id, a.full_name, a.phd_award_date, b.id AS proposal_id, b.proposal_id AS proposal_proposal_id, b.title AS proposal_title
FROM researchers a JOIN project_proposals b ON a.project_proposal_id = b.id;
```

| id | researcher_id | full_name | phd_award_date | proposal_id | proposal_proposal_id | proposal_title |
|---|---|---|---|---|---|---|
| 1 | 89419 | Theodore Mcgrath | 2023-06-13 | 100 | 2986221 | Compact Initiative |
| 2 | 2618557 | Account Name | 2024-11-24 | 101 | 4447025 | Legacy Model |
| 3 | 9736892 | Saipan International Airport | 2025-04-08 | 102 | 2986232 | Regional Cluster A |
| 4 | 1450639 | Norma Fisher | 2022-09-19 | 103 | lu_tax_code_template_m12 | Seasonal Review |

The researcher_project_proposal_view answers: "Which project proposal is this researcher assigned to, and what are the proposal's funding and challenge details?" Each row combines the researcher's identity with the full proposal record, including title, thematic area, funding program, status, and submission date. A row showing Account Name (researcher_id 2618557) alongside the Legacy Model proposal (4447025) under legacy-funding-97 in submitted status, addressing Secure, clean and efficient energy, gives a manager a complete picture of that researcher's current assignment.

## Event-Centric Detail Views

Three views present the event's world from its own perspective, aggregating its researcher participants, sequential relationships, and proposal context.

**View `event_researcher_detail_view`**

```sql
CREATE VIEW event_researcher_detail_view AS
SELECT a.id, a.event_id, a.event_name, b.id AS researcher_id, b.researcher_id AS researcher_researcher_id, b.full_name AS researcher_full_name
FROM events a
  JOIN events_researchers j ON j.event_id = a.id
  JOIN researchers b ON b.id = j.researcher_id;
```

| id | event_id | event_name | researcher_id | researcher_researcher_id | researcher_full_name |
|---|---|---|---|---|---|
| 1000 | 2002007020060 | Seasonal Standard | 1 | 89419 | Theodore Mcgrath |
| 1000 | 2002007020060 | Seasonal Standard | 2 | 2618557 | Account Name |
| 1001 | 168535 | Integrated Framework | 2 | 2618557 | Account Name |
| 1001 | 168535 | Integrated Framework | 3 | 9736892 | Saipan International Airport |
| 1002 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 3 | 9736892 | Saipan International Airport |
| 1002 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 4 | 1450639 | Norma Fisher |
| 1003 | 1186089 | Pilot Programme | 4 | 1450639 | Norma Fisher |
| 1003 | 1186089 | Pilot Programme | 1 | 89419 | Theodore Mcgrath |

The event_researcher_detail_view answers: "Which researchers are participating in this event, and what are their profiles?" Each row pairs an event with one of its participating researchers, combining event metadata (name, type, dates, region, status) with researcher details (name, institution, discipline). A row showing the Blue Sky Conference (event 168535) in the Black Sea and South Mediterranean region, currently running, alongside a participating researcher, tells an event coordinator exactly who is involved and where they are based.

**View `event_event_view`**

```sql
CREATE VIEW event_event_view AS
SELECT a.id, a.event_id, a.event_name, a.event_type, b.id AS event_id, b.event_id AS event_event_id, b.event_name AS event_event_name
FROM events a JOIN events b ON a.followed_by_event_id = b.id;
```

| id | event_id | event_name | event_type | event_id | event_event_id | event_event_name |
|---|---|---|---|---|---|---|
| 1000 | 2002007020060 | Seasonal Standard | Lab Surfing Workshop | 1000 | 2002007020060 | Seasonal Standard |
| 1001 | 168535 | Integrated Framework | Blue Sky Conference | 1001 | 168535 | Integrated Framework |
| 1002 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | Science Incubator Summer School | 1002 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D |
| 1003 | 1186089 | Pilot Programme | Lab Surfing Workshop | 1003 | 1186089 | Pilot Programme |

The event_event_view answers: "Which events are sequentially linked, and what are their respective details?" Each row pairs an event with its successor (the event that follows it), presenting both events' names, types, dates, regions, and statuses. A row showing the Science Incubator Summer School (event ab8e1d18-8fcd-11eb-924d-9cd76263cbd0) in Western Balkans, completed status, followed by the Pilot Programme Lab Surfing Workshop (event 1186089) in Central and Eastern Europe, currently planned, reveals the event sequence and helps coordinators plan resource allocation across consecutive gatherings.

**View `event_project_proposal_view`**

```sql
CREATE VIEW event_project_proposal_view AS
SELECT a.id, a.event_id, a.event_name, a.event_type, b.id AS proposal_id, b.proposal_id AS proposal_proposal_id, b.title AS proposal_title
FROM events a JOIN project_proposals b ON a.project_proposal_id = b.id;
```

| id | event_id | event_name | event_type | proposal_id | proposal_proposal_id | proposal_title |
|---|---|---|---|---|---|---|
| 1000 | 2002007020060 | Seasonal Standard | Lab Surfing Workshop | 100 | 2986221 | Compact Initiative |
| 1001 | 168535 | Integrated Framework | Blue Sky Conference | 101 | 4447025 | Legacy Model |
| 1002 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | Science Incubator Summer School | 102 | 2986232 | Regional Cluster A |
| 1003 | 1186089 | Pilot Programme | Lab Surfing Workshop | 103 | lu_tax_code_template_m12 | Seasonal Review |

The event_project_proposal_view answers: "Which project proposal is associated with this event, and what are the proposal's details?" Each row combines the event record with its linked proposal, including proposal title, thematic area, funding program, status, and submission date. A row showing the Seasonal Standard Lab Surfing Workshop (event 2002007020060) alongside the Compact Initiative proposal (2986221) under regional-funding-96 in draft status, tells a manager which proposal is being coordinated through this event.

## Proposal-Centric Detail Views

Four views present the project proposal's world from its own perspective, aggregating its researcher team, event coordination, challenge alignment, and thematic classification.

**View `project_proposal_researcher_detail_view`**

```sql
CREATE VIEW project_proposal_researcher_detail_view AS
SELECT a.id, a.proposal_id, a.title, b.id AS researcher_id, b.researcher_id AS researcher_researcher_id, b.full_name AS researcher_full_name
FROM project_proposals a
  JOIN proposals_researchers j ON j.project_proposal_id = a.id
  JOIN researchers b ON b.id = j.researcher_id;
```

| id | proposal_id | title | researcher_id | researcher_researcher_id | researcher_full_name |
|---|---|---|---|---|---|
| 100 | 2986221 | Compact Initiative | 1 | 89419 | Theodore Mcgrath |
| 100 | 2986221 | Compact Initiative | 2 | 2618557 | Account Name |
| 101 | 4447025 | Legacy Model | 2 | 2618557 | Account Name |
| 101 | 4447025 | Legacy Model | 3 | 9736892 | Saipan International Airport |
| 102 | 2986232 | Regional Cluster A | 3 | 9736892 | Saipan International Airport |
| 102 | 2986232 | Regional Cluster A | 4 | 1450639 | Norma Fisher |
| 103 | lu_tax_code_template_m12 | Seasonal Review | 4 | 1450639 | Norma Fisher |
| 103 | lu_tax_code_template_m12 | Seasonal Review | 1 | 89419 | Theodore Mcgrath |

The project_proposal_researcher_detail_view answers: "Which researchers are assigned to this proposal, and what are their profiles?" Each row pairs a proposal with one of its assigned researchers, combining proposal metadata (title, thematic area, funding program, status) with researcher details (name, institution, discipline, PhD date). A row showing the Regional Cluster A proposal (2986232) under compact-funding-98 in funded status, alongside researcher Saipan International Airport (id 9736892) at extended-institut-33, gives a funding officer a complete picture of the team behind a funded project.

**View `project_proposal_event_view`**

```sql
CREATE VIEW project_proposal_event_view AS
SELECT a.id, a.proposal_id, a.title, a.thematic_area, b.id AS event_id, b.event_id AS event_event_id, b.event_name AS event_event_name
FROM project_proposals a JOIN events b ON a.event_id = b.id;
```

| id | proposal_id | title | thematic_area | event_id | event_event_id | event_event_name |
|---|---|---|---|---|---|---|
| 100 | 2986221 | Compact Initiative | Constructive symbiosis | 1000 | 2002007020060 | Seasonal Standard |
| 101 | 4447025 | Legacy Model | Bottom-up intelligent construction | 1001 | 168535 | Integrated Framework |
| 102 | 2986232 | Regional Cluster A | Ecological technology | 1002 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D |
| 103 | lu_tax_code_template_m12 | Seasonal Review | Nano-bio-chem interface | 1003 | 1186089 | Pilot Programme |

The project_proposal_event_view answers: "Which event coordinates this proposal, and what are the event's details?" Each row combines the proposal record with its linked event, including event name, type, dates, region, and status. A row showing the Seasonal Review proposal (lu_tax_code_template_m12) under composite-funding-99 in rejected status, alongside the Pilot Programme Lab Surfing Workshop (event 1186089) in Central and Eastern Europe, currently planned, reveals the event-proposal linkage even for proposals that did not achieve funding.

**View `project_proposal_societal_challenge_view`**

```sql
CREATE VIEW project_proposal_societal_challenge_view AS
SELECT a.id, a.proposal_id, a.title, a.thematic_area, b.societal_challenge_id AS challenge_societal_challenge_id, b.challenge_id AS challenge_challenge_id, b.challenge_name AS challenge_challenge_name
FROM project_proposals a JOIN societal_challenges b ON a.societal_challenge_id = b.societal_challenge_id;
```

| id | proposal_id | title | thematic_area | challenge_societal_challenge_id | challenge_challenge_id | challenge_challenge_name |
|---|---|---|---|---|---|---|
| 100 | 2986221 | Compact Initiative | Constructive symbiosis | 1000 | 7119777 | Health, Demographic Change and Wellbeing |
| 101 | 4447025 | Legacy Model | Bottom-up intelligent construction | 1001 | 4005 | Secure, clean and efficient energy |
| 102 | 2986232 | Regional Cluster A | Ecological technology | 1002 | 9085252 | Industrial biotechnology |
| 103 | lu_tax_code_template_m12 | Seasonal Review | Nano-bio-chem interface | 1003 | ebdf79bc-8fd1-11eb-924d-9cd76263cbd0 | Smart, green and integrated transport |

The project_proposal_societal_challenge_view answers: "Which societal challenge does this proposal address, and what are the proposal's details?" Each row pairs a proposal with its linked societal challenge, combining proposal metadata with the challenge name. A row showing the Compact Initiative proposal (2986221) under regional-funding-96 in draft status, addressing Health, Demographic Change and Wellbeing, tells a policy analyst exactly which proposal contributes to which high-level objective.

**View `societal_challenge_project_proposal_view`**

```sql
CREATE VIEW societal_challenge_project_proposal_view AS
SELECT a.societal_challenge_id, a.challenge_id, a.challenge_name, b.id AS proposal_id, b.proposal_id AS proposal_proposal_id, b.title AS proposal_title
FROM societal_challenges a JOIN project_proposals b ON a.project_proposal_id = b.id;
```

| societal_challenge_id | challenge_id | challenge_name | proposal_id | proposal_proposal_id | proposal_title |
|---|---|---|---|---|---|
| 1000 | 7119777 | Health, Demographic Change and Wellbeing | 100 | 2986221 | Compact Initiative |
| 1001 | 4005 | Secure, clean and efficient energy | 101 | 4447025 | Legacy Model |
| 1002 | 9085252 | Industrial biotechnology | 102 | 2986232 | Regional Cluster A |
| 1003 | ebdf79bc-8fd1-11eb-924d-9cd76263cbd0 | Smart, green and integrated transport | 103 | lu_tax_code_template_m12 | Seasonal Review |

The societal_challenge_project_proposal_view answers: "Which proposals address this societal challenge, and what are their details?" Each row pairs a societal challenge with one of its associated proposals, combining the challenge name with proposal metadata including title, thematic area, funding program, and status. A row showing Secure, clean and efficient energy alongside the Legacy Model proposal (4447025) under legacy-funding-97 in submitted status, addresses Bottom-up intelligent construction, tells a challenge manager which proposals are competing for resources within their policy domain.

## Organization and Thematic Views

Three views present the partner organization and thematic area perspectives, aggregating their event participation, inter-organizational relationships, and proposal linkages.

**View `partner_organization_event_view`**

```sql
CREATE VIEW partner_organization_event_view AS
SELECT a.id, a.partner_id, a.organization_name, a.organization_type, b.id AS event_id, b.event_id AS event_event_id, b.event_name AS event_event_name
FROM partner_organizations a JOIN events b ON a.event_id = b.id;
```

| id | partner_id | organization_name | organization_type | event_id | event_event_id | event_event_name |
|---|---|---|---|---|---|---|
| 100 | 69420 | Staples Inc. | University | 1000 | 2002007020060 | Seasonal Standard |
| 101 | 9085260 | Oscar Health Inc. | Research Institution | 1001 | 168535 | Integrated Framework |
| 102 | 195367 | Atlantic Richfield | SME | 1002 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D |
| 103 | b_VB-EC-12 | Port Loko | University | 1003 | 1186089 | Pilot Programme |

The partner_organization_event_view answers: "Which events is this partner organization involved in, and what are the event details?" Each row pairs a partner organization with one of its associated events, combining organization metadata (name, type, country, coordinator status) with event details (name, type, dates, region, status). A row showing Oscar Health Inc., a Research Institution in composite-country-27 serving as coordinator, alongside the Blue Sky Conference (event 168535) in the Black Sea and South Mediterranean region, currently running, tells an administrator exactly which organizations are leading which events.

**View `partner_organization_partner_organization_view`**

```sql
CREATE VIEW partner_organization_partner_organization_view AS
SELECT a.id, a.partner_id, a.organization_name, a.organization_type, b.id AS organization_id, b.partner_id AS organization_partner_id, b.organization_name AS organization_organization_name
FROM partner_organizations a JOIN partner_organizations b ON a.partner_organization_id = b.id;
```

| id | partner_id | organization_name | organization_type | organization_id | organization_partner_id | organization_organization_name |
|---|---|---|---|---|---|---|
| 100 | 69420 | Staples Inc. | University | 100 | 69420 | Staples Inc. |
| 101 | 9085260 | Oscar Health Inc. | Research Institution | 101 | 9085260 | Oscar Health Inc. |
| 102 | 195367 | Atlantic Richfield | SME | 102 | 195367 | Atlantic Richfield |
| 103 | b_VB-EC-12 | Port Loko | University | 103 | b_VB-EC-12 | Port Loko |

The partner_organization_partner_organization_view answers: "Which partner organizations are linked together, and what are their profiles?" Each row pairs a partner organization with a linked partner, presenting both organizations' names, types, countries, and coordinator status. This view supports inter-organizational network analysis and helps identify patterns of institutional collaboration across the portfolio.

**View `thematic_area_project_proposal_view`**

```sql
CREATE VIEW thematic_area_project_proposal_view AS
SELECT a.thematic_area_id, a.area_id, a.area_name, b.id AS proposal_id, b.proposal_id AS proposal_proposal_id, b.title AS proposal_title
FROM thematic_areas a JOIN project_proposals b ON a.project_proposal_id = b.id;
```

| thematic_area_id | area_id | area_name | proposal_id | proposal_proposal_id | proposal_title |
|---|---|---|---|---|---|
| 1000 | default_chart_a_tax_19 | Constructive symbiosis | 100 | 2986221 | Compact Initiative |
| 1001 | fro | Bottom-up intelligent construction | 101 | 4447025 | Legacy Model |
| 1002 | account_pymes_296 | Ecological technology | 102 | 2986232 | Regional Cluster A |
| 1003 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Nano-bio-chem interface | 103 | lu_tax_code_template_m12 | Seasonal Review |

The thematic_area_project_proposal_view answers: "Which proposals fall within this thematic area, and what are their details?" Each row pairs a thematic area with one of its associated proposals, combining the area name with proposal metadata including title, funding program, status, and submission date. A row showing Ecological technology alongside the Regional Cluster A proposal (2986232) under compact-funding-98 in funded status, submitted on 2023-02-19, tells a thematic program manager which proposals are active within their domain and their current funding status.

## Synthesis

The portfolio management model described in this chapter provides a comprehensive framework for tracking the relationships between researchers, events, proposals, challenges, partners, and thematic areas. The six base tables capture the core entities and their attributes, while the four junction tables manage the many-to-many relationships that arise in practice. The thirteen detail views synthesize these records into actionable perspectives, each answering a specific operational question that program managers, coordinators, and evaluators need to address. By maintaining clear foreign-key linkages between entities and providing joined views that combine relevant attributes, the system supports both granular record-level operations and portfolio-level analysis. The fictional organizations, researchers, and proposals documented here illustrate the model's structure; in production, these records would represent real scientists, institutions, and funding instruments within an active research ecosystem.