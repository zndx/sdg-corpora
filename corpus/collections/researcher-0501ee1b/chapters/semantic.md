## Ontology-Grounded Relational Modelling of the Research Collaboration Domain

The research collaboration domain captures the intricate web of relationships between researchers, events, project proposals, and the broader institutional and societal contexts in which they operate. At its core, the domain models how individual researchers participate in collaborative events, contribute to project proposals, and align their work with thematic areas and societal challenges. The ontology underlying this domain distinguishes several entity types—researchers, events, project proposals, societal challenges, partner organizations, and thematic areas—each carrying attributes that describe their identity, temporal properties, and organisational context. The relational schema materialises these entities as base tables, with many-to-many relationships expressed through junction tables, and presents the domain's join paths as views that reconstruct meaningful facts from the normalised structure.

**Table `researchers`**

| id | researcher_id | full_name | phd_award_date | institution | discipline | is_selected | project_proposal_id |
|---|---|---|---|---|---|---|---|
| 1 | 89419 | Theodore Mcgrath | 2023-06-13 | baseline-institut-31 | adaptive-discipli-53 | true | 100 |
| 2 | 2618557 | Account Name | 2024-11-24 | pilot-institut-32 | distributed-discipli-54 | false | 101 |
| 3 | 9736892 | Saipan International Airport | 2025-04-08 | extended-institut-33 | baseline-discipli-55 | true | 102 |
| 4 | 1450639 | Norma Fisher | 2022-09-19 | integrated-institut-34 | pilot-discipli-56 | false | 103 |

The `researchers` table anchors the individual-level dimension of the domain. Each row represents a researcher identified by a surrogate `id` and a business-level `researcher_id`, such as `89419` for Theodore Mcgrath or `2618557` for Account Name. The `full_name` column carries the human-readable identifier, while `phd_award_date` records the date of doctoral conferral, ranging from `2022-09-19` (Norma Fisher) to `2025-04-08` (Saipan International Airport). The `institution` column links the researcher to an organisational home—`baseline-institut-31`, `pilot-institut-32`, `extended-institut-33`, `integrated-institut-34`—and `discipline` captures the academic field, such as `adaptive-discipli-53` or `distributed-discipli-54`. The boolean `is_selected` flag indicates whether the researcher has been selected for a particular initiative, and `project_proposal_id` provides a direct foreign-key link to the `project_proposals` table, establishing a one-to-many relationship where a single proposal may be associated with multiple researchers.

**Table `events`**

| id | event_id | event_name | event_type | start_date | end_date | region | status | followed_by_event_id | project_proposal_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2002007020060 | Seasonal Standard | Lab Surfing Workshop | 2022-09-05 | 2022-09-01 | North and Irish Sea | planned | 1000 | 100 |
| 1001 | 168535 | Integrated Framework | Blue Sky Conference | 2023-02-16 | 2023-02-12 | Black Sea and South Mediterranean | running | 1001 | 101 |
| 1002 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | Science Incubator Summer School | 2024-07-27 | 2024-07-23 | Western Balkans | completed | 1002 | 102 |
| 1003 | 1186089 | Pilot Programme | Lab Surfing Workshop | 2025-12-11 | 2025-12-07 | Central and Eastern Europe | planned | 1003 | 103 |

The `events` table models the temporal and organisational occurrences through which researchers interact. Each event carries a surrogate `id` (e.g., `1000`, `1001`), a business-level `event_id` such as `2002007020060` or the UUID `ab8e1d18-8fcd-11eb-924d-9cd76263cbd0`, and a descriptive `event_name` like "Lab Surfing Workshop" or "Blue Sky Conference". The `event_type` column categorises the nature of the event, while `start_date` and `end_date` define its temporal span—for instance, the "Science Incubator Summer School" runs from `2024-07-27` to `2024-07-23`. The `region` column situates the event geographically, with values such as "North and Irish Sea", "Black Sea and South Mediterranean", "Western Balkans", and "Central and Eastern Europe". The `status` column tracks the lifecycle state (`planned`, `running`, `completed`), and `followed_by_event_id` encodes a self-referential chain linking one event to its successor. The `project_proposal_id` column creates a foreign-key relationship to `project_proposals`, indicating which proposal an event is associated with.

**Table `project_proposals`**

| id | proposal_id | title | thematic_area | funding_program | status | submission_date | event_id | societal_challenge_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 2986221 | Compact Initiative | Constructive symbiosis | regional-funding-96 | draft | 2025-04-24 | 1000 | 1000 |
| 101 | 4447025 | Legacy Model | Bottom-up intelligent construction | legacy-funding-97 | submitted | 2022-09-08 | 1001 | 1001 |
| 102 | 2986232 | Regional Cluster A | Ecological technology | compact-funding-98 | funded | 2023-02-19 | 1002 | 1002 |
| 103 | lu_tax_code_template_m12 | Seasonal Review | Nano-bio-chem interface | composite-funding-99 | rejected | 2024-07-03 | 1003 | 1003 |

The `project_proposals` table is the central hub of the domain, connecting researchers, events, thematic areas, and societal challenges. Each proposal has a surrogate `id` (e.g., `100`, `101`, `102`, `103`), a business-level `proposal_id` such as `2986221` or the template identifier `lu_tax_code_template_m12`, and a `title` like "Compact Initiative" or "Legacy Model". The `thematic_area` column stores the thematic classification (e.g., "Constructive symbiosis", "Bottom-up intelligent construction"), while `funding_program` indicates the funding source, with values like `regional-funding-96`, `legacy-funding-97`, `compact-funding-98`, and `composite-funding-99`. The `status` column tracks the proposal lifecycle (`draft`, `submitted`, `funded`, `rejected`), and `submission_date` records when the proposal was submitted. The `event_id` column creates a foreign-key link to the `events` table, and `societal_challenge_id` links to the `societal_challenges` table, establishing the proposal's alignment with broader societal goals.

**Table `societal_challenges`**

| societal_challenge_id | challenge_id | challenge_name | project_proposal_id |
|---|---|---|---|
| 1000 | 7119777 | Health, Demographic Change and Wellbeing | 100 |
| 1001 | 4005 | Secure, clean and efficient energy | 101 |
| 1002 | 9085252 | Industrial biotechnology | 102 |
| 1003 | ebdf79bc-8fd1-11eb-924d-9cd76263cbd0 | Smart, green and integrated transport | 103 |

The `societal_challenges` table captures the high-level societal objectives that project proposals are designed to address. Each row is identified by `societal_challenge_id` (e.g., `1000`, `1001`, `1002`, `1003`), a business-level `challenge_id` such as `7119777` or `4005`, and a descriptive `challenge_name` like "Health, Demographic Change and Wellbeing", "Secure, clean and efficient energy", "Industrial biotechnology", and "Smart, green and integrated transport". The `project_proposal_id` column creates a foreign-key relationship back to `project_proposals`, indicating which proposal addresses each challenge. This table thus provides the normative framing for the research domain, linking technical proposals to their intended societal impact.

**Table `partner_organizations`**

| id | partner_id | organization_name | organization_type | country | is_coordinator | event_id | partner_organization_id |
|---|---|---|---|---|---|---|---|
| 100 | 69420 | Staples Inc. | University | compact-country-26 | false | 1000 | 100 |
| 101 | 9085260 | Oscar Health Inc. | Research Institution | composite-country-27 | true | 1001 | 101 |
| 102 | 195367 | Atlantic Richfield | SME | primary-country-28 | false | 1002 | 102 |
| 103 | b_VB-EC-12 | Port Loko | University | adaptive-country-29 | true | 1003 | 103 |

The `partner_organizations` table models the institutional actors involved in events. Each row carries a surrogate `id` (e.g., `100`, `101`, `102`, `103`), a business-level `partner_id` such as `69420` or `9085260`, and an `organization_name` like "Staples Inc.", "Oscar Health Inc.", "Atlantic Richfield", and "Port Loko". The `organization_type` column classifies the institution as a `University`, `Research Institution`, or `SME`, while `country` stores the geographic location using codes such as `compact-country-26`, `composite-country-27`, `primary-country-28`, and `adaptive-country-29`. The boolean `is_coordinator` flag indicates whether the organization serves as the coordinating partner for the event. The `event_id` column links the partner to a specific event, and `partner_organization_id` creates a self-referential relationship that may encode hierarchical or collaborative links between partner organizations.

**Table `thematic_areas`**

| thematic_area_id | area_id | area_name | project_proposal_id |
|---|---|---|---|
| 1000 | default_chart_a_tax_19 | Constructive symbiosis | 100 |
| 1001 | fro | Bottom-up intelligent construction | 101 |
| 1002 | account_pymes_296 | Ecological technology | 102 |
| 1003 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Nano-bio-chem interface | 103 |

The `thematic_areas` table provides a structured classification of the research domains covered by project proposals. Each row is identified by `thematic_area_id` (e.g., `1000`, `1001`, `1002`, `1003`), a business-level `area_id` such as `default_chart_a_tax_19` or `fro`, and a descriptive `area_name` like "Constructive symbiosis", "Bottom-up intelligent construction", "Ecological technology", and "Nano-bio-chem interface". The `project_proposal_id` column creates a foreign-key relationship to `project_proposals`, indicating which proposal falls under each thematic area. This table serves as a lookup dimension that enriches the thematic classification stored directly in the `project_proposals` table.

The many-to-many relationships inherent in the domain are materialised through junction tables. The `researchers_events` table links researchers to events they participate in, the `researchers_researchers` table captures collaborative or co-authorship relationships between researchers, the `events_researchers` table provides an alternative or complementary linkage between events and researchers, and the `proposals_researchers` table connects researchers to the project proposals they contribute to. These junction tables decompose the cardinality-bounded relationships into normalised foreign-key pairs, ensuring that each relationship instance is explicitly recorded and queryable.

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

The `researchers_events` junction table resolves the many-to-many relationship between the `researchers` and `events` tables. Each row represents a participation instance, linking a specific researcher to a specific event. This table enables queries that answer questions such as "which researchers participated in which events" and supports the construction of the `researcher_event_detail_view` and `event_researcher_detail_view` by providing the join path between the two entity tables.

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

The `researchers_researchers` junction table captures the self-referential collaborative relationships among researchers. Each row links one researcher to another, encoding co-authorship, mentorship, or institutional collaboration. This table supports the `researcher_researcher_detail_view`, which reconstructs the full picture of researcher-to-researcher connections by joining the junction table back to the `researchers` table on both sides, thereby producing pairs of researcher names and their relationship context.

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

The `events_researchers` junction table provides an alternative or complementary linkage between events and researchers. While `researchers_events` may encode one perspective of the relationship, `events_researchers` offers another, potentially with different attributes or a different semantic interpretation. This table supports the `event_researcher_detail_view` and enriches the domain's ability to query event-participation facts from the event-centric perspective.

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

The `proposals_researchers` junction table resolves the many-to-many relationship between `project_proposals` and `researchers`. Each row represents a contribution instance, linking a specific researcher to a specific project proposal. This table supports the `researcher_project_proposal_view` and the `project_proposal_researcher_detail_view`, enabling queries that answer "which researchers contributed to which proposals" and "which proposals did a given researcher work on."

The views in this schema are the primary interface for domain-level querying. Each view encapsulates a specific join path through the normalised tables, reconstructing a coherent fact from the distributed structure. They answer concrete domain questions by joining the relevant base and junction tables and projecting the columns that together form a meaningful record.

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

The `researcher_event_detail_view` answers the question "which researchers participated in which events, and what are the details of both parties?" It joins the `researchers` table to the `researchers_events` junction table and then to the `events` table, producing rows that combine researcher identity (e.g., Theodore Mcgrath, researcher_id `89419`) with event details (e.g., "Lab Surfing Workshop", event_id `2002007020060`). A representative row might show Theodore Mcgrath from `baseline-institut-31` participating in an event in the "North and Irish Sea" region with status `planned`. This view is essential for understanding the participation landscape of the research domain.

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

The `researcher_researcher_detail_view` answers the question "which researchers are connected to which other researchers, and what are their details?" It joins the `researchers_researchers` junction table back to the `researchers` table on both sides, producing pairs of researcher names and their associated attributes. A representative row might show Theodore Mcgrath (researcher_id `89419`) connected to Account Name (researcher_id `2618557`), with both their institutions and disciplines visible. This view is critical for mapping the collaborative network of the research domain.

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

The `researcher_project_proposal_view` answers the question "which researchers contributed to which project proposals, and what are the proposal details?" It joins the `researchers` table to the `proposals_researchers` junction table and then to the `project_proposals` table, producing rows that combine researcher identity with proposal metadata. A representative row might show Theodore Mcgrath (researcher_id `89419`) contributing to the "Compact Initiative" proposal (proposal_id `2986221`), which is in `draft` status and funded under `regional-funding-96`. This view is essential for tracking researcher contributions to the proposal pipeline.

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

The `event_researcher_detail_view` answers the question "which researchers participated in which events, viewed from the event's perspective?" It joins the `events` table to the `events_researchers` junction table and then to the `researchers` table, producing rows that combine event details with researcher identity. A representative row might show the "Blue Sky Conference" (event_id `168535`) in the "Black Sea and South Mediterranean" region with status `running`, linked to a researcher such as Norma Fisher (researcher_id `1450639`) from `integrated-institut-34`. This view is essential for understanding the researcher composition of each event.

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

The `event_event_view` answers the question "which events are linked to which other events through the follow-on relationship?" It joins the `events` table to itself via the `followed_by_event_id` self-referential column, producing pairs of events where one event is the successor of another. A representative row might show the "Lab Surfing Workshop" (event_id `2002007020060`) followed by the "Blue Sky Conference" (event_id `168535`), both associated with project proposals `100` and `101` respectively. This view is essential for tracking the temporal progression of events within the domain.

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

The `event_project_proposal_view` answers the question "which events are associated with which project proposals?" It joins the `events` table to the `project_proposals` table via the `project_proposal_id` foreign key, producing rows that combine event details with proposal metadata. A representative row might show the "Science Incubator Summer School" (event_id `ab8e1d18-8fcd-11eb-924d-9cd76263cbd0`) associated with the "Regional Cluster A" proposal (proposal_id `2986232`), which is in `funded` status under `compact-funding-98`. This view is essential for understanding the event-proposal linkage.

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

The `project_proposal_researcher_detail_view` answers the question "which researchers contributed to which project proposals, viewed from the proposal's perspective?" It joins the `project_proposals` table to the `proposals_researchers` junction table and then to the `researchers` table, producing rows that combine proposal metadata with researcher identity. A representative row might show the "Compact Initiative" proposal (proposal_id `2986221`) in `draft` status, linked to Theodore Mcgrath (researcher_id `89419`) from `baseline-institut-31`. This view is essential for understanding the researcher composition of each proposal.

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

The `project_proposal_event_view` answers the question "which project proposals are associated with which events?" It joins the `project_proposals` table to the `events` table via the `event_id` foreign key, producing rows that combine proposal metadata with event details. A representative row might show the "Legacy Model" proposal (proposal_id `4447025`) in `submitted` status under `legacy-funding-97`, associated with the "Blue Sky Conference" event (event_id `168535`) in the "Black Sea and South Mediterranean" region. This view is essential for understanding the event-proposal linkage from the proposal's perspective.

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

The `project_proposal_societal_challenge_view` answers the question "which project proposals address which societal challenges?" It joins the `project_proposals` table to the `societal_challenges` table via the `societal_challenge_id` foreign key, producing rows that combine proposal metadata with challenge details. A representative row might show the "Compact Initiative" proposal (proposal_id `2986221`) addressing the "Health, Demographic Change and Wellbeing" challenge (challenge_id `7119777`). This view is essential for understanding the societal alignment of each proposal.

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

The `societal_challenge_project_proposal_view` answers the question "which societal challenges are addressed by which project proposals, viewed from the challenge's perspective?" It joins the `societal_challenges` table to the `project_proposals` table via the `project_proposal_id` foreign key, producing rows that combine challenge details with proposal metadata. A representative row might show the "Secure, clean and efficient energy" challenge (challenge_id `4005`) addressed by the "Legacy Model" proposal (proposal_id `4447025`) in `submitted` status. This view is essential for understanding the proposal coverage of each societal challenge.

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

The `partner_organization_event_view` answers the question "which partner organizations participate in which events?" It joins the `partner_organizations` table to the `events` table via the `event_id` foreign key, producing rows that combine partner details with event information. A representative row might show "Staples Inc." (partner_id `69420`), a `University` in `compact-country-26`, participating in the "Lab Surfing Workshop" event (event_id `2002007020060`) with `is_coordinator` set to `false`. This view is essential for understanding the institutional composition of each event.

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

The `partner_organization_partner_organization_view` answers the question "which partner organizations are linked to which other partner organizations?" It joins the `partner_organizations` table to itself via the `partner_organization_id` self-referential column, producing pairs of partner organizations that may represent hierarchical or collaborative relationships. A representative row might show "Staples Inc." (partner_id `69420`) linked to "Oscar Health Inc." (partner_id `9085260`), both participating in events `1000` and `1001` respectively. This view is essential for understanding the institutional network within the domain.

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

The `thematic_area_project_proposal_view` answers the question "which project proposals fall under which thematic areas?" It joins the `thematic_areas` table to the `project_proposals` table via the `project_proposal_id` foreign key, producing rows that combine thematic area details with proposal metadata. A representative row might show the "Constructive symbiosis" thematic area (area_id `default_chart_a_tax_19`) covering the "Compact Initiative" proposal (proposal_id `2986221`) in `draft` status under `regional-funding-96`. This view is essential for understanding the thematic coverage of each proposal and the proposal distribution across thematic areas.

The relational schema presented here faithfully materialises the ontology of the research collaboration domain. Six base tables capture the core entities—researchers, events, project proposals, societal challenges, partner organizations, and thematic areas—each with attributes that describe their identity, temporal properties, and organisational context. Four junction tables resolve the many-to-many relationships between these entities, ensuring that participation, collaboration, and contribution instances are explicitly recorded. The thirteen views provide the primary interface for domain-level querying, each encapsulating a specific join path that reconstructs a coherent fact from the normalised structure. Together, the tables and views form a complete, queryable representation of the research collaboration domain, enabling analysts to trace the relationships between individual researchers, their events, their proposals, and the societal challenges those proposals are designed to address.