## Ontology-Grounded Relational Modelling of the Research Collaboration Domain

The research collaboration domain captures the ecosystem of scientists, events, teams, ideas, and institutional partners that coalesce around shared scientific themes and societal challenges. At its core, the domain models how individual researchers participate in events, form teams around research ideas, and collaborate with partner organizations distributed across countries. The ontology underlying this domain distinguishes eight entity types—`researchers`, `events`, `partner_organizations`, `research_ideas`, `research_teams`, `research_themes`, `societal_challenges`, and `countries`—connected through binary and n-ary relationships that are materialized as foreign keys, junction tables, and denormalized views. The following sections walk through the base schema, the join-based views that reconstruct domain facts, and the cardinality constraints that govern the model.

### Base Tables and Entity Types

The foundation of the schema consists of eight base tables, each representing a distinct entity type from the ontology. The `researchers` table stores individual scientists with their identifying metadata and selection flags.

**Table `researchers`**

| id | researcher_id | full_name | phd_award_date | current_affiliation | email_address | is_selected_for_funding | event_id | research_team_id | research_idea_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 89419 | Rebecca Hall | 2025-08-10 | composite-current-51 | compact-email-32 | true | ChIJEctqrYFt5kcRUrBEPR-XXBE | 1 | 1 |
| 1001 | 2618557 | Brianna Mejia | 2022-01-21 | primary-current-52 | composite-email-33 | false | 209230 | 2 | 2 |
| 1002 | 9736892 | Desiree Cain | 2023-06-05 | adaptive-current-53 | primary-email-34 | true | 69440 | 3 | 3 |
| 1003 | 1450639 | Suzanne Collins | 2024-11-16 | distributed-current-54 | adaptive-email-35 | false | 4793467 | 4 | 4 |

Each row in `researchers` carries a surrogate `id` (e.g., `1000`), a domain-level `researcher_id` (e.g., `89419`), and a `full_name` such as "Rebecca Hall" or "Suzanne Collins". The `phd_award_date` column records the date of doctoral conferral, while `current_affiliation` holds a synthetic affiliation label like "composite-current-51". The `email_address` column stores a synthetic email handle, and `is_selected_for_funding` is a boolean flag indicating whether the researcher has been shortlisted for funding. The columns `event_id`, `research_team_id`, and `research_idea_id` serve as foreign keys linking the researcher to an event, a team, and a research idea respectively, establishing the primary participation relationships.

The `events` table captures scientific gatherings, workshops, and conferences.

**Table `events`**

| event_id | event_name | event_type | start_date | end_date | location_region | is_funded | partner_organization_id | research_theme_id |
|---|---|---|---|---|---|---|---|---|
| ChIJEctqrYFt5kcRUrBEPR-XXBE | Composite Review | Lab Surfing Workshop | 2022-09-10T08:48:00 | 2022-09-09T20:48:00 | North and Irish Sea | true | 1 | 1 |
| 209230 | Compact Initiative A | Blue Sky Conference | 2023-02-21T15:05:00 | 2023-02-20T03:05:00 | Black Sea and South Mediterranean | false | 2 | 2 |
| 69440 | Legacy Model | Science Incubator Summer School | 2024-07-05T22:22:00 | 2024-07-04T10:22:00 | Western Balkans | true | 3 | 3 |
| 4793467 | Regional Cluster | Lab Surfing Workshop | 2025-12-16T05:39:00 | 2025-12-15T17:39:00 | Central and Eastern Europe | false | 4 | 4 |

Each event is identified by a composite `event_id` (e.g., `ChIJEctqrYFt5kcRUrBEPR-XXBE` for the "Composite Review" event) and carries a human-readable `event_name` such as "Lab Surfing Workshop" or "Blue Sky Conference". The `event_type` column classifies the gathering, while `start_date` and `end_date` record the temporal bounds. The `location_region` column specifies a geographic region like "North and Irish Sea" or "Western Balkans". The `is_funded` boolean indicates funding status, and the foreign keys `partner_organization_id` and `research_theme_id` link the event to its associated partner organization and research theme.

The `partner_organizations` table models the institutional actors in the collaboration network.

**Table `partner_organizations`**

| partner_organization_id | org_id | org_name | org_type | country_code | is_coordinator | is_originator | coordinates_project_partner_organization_id | event_id | country_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | id_18 | Extended Model | University | 727051 | true | false | 1 | ChIJEctqrYFt5kcRUrBEPR-XXBE | 1 |
| 2 | lu_tax_code_template_m14 | Pilot Cluster A | Research Institution | select | false | true | 2 | 209230 | 2 |
| 3 | 10207153 | Baseline Review | SME | 5f9467a0-8fcd-11eb-924d-9cd76263cbd0 | true | false | 3 | 69440 | 3 |
| 4 | 6926378 | Distributed Initiative | University | 8843764 | false | true | 4 | 4793467 | 4 |

Each organization has a surrogate `id`, a domain `org_id` (e.g., `id_18`), and an `org_name` such as "Extended Model" or "Pilot Cluster A". The `org_type` column classifies the institution as a "University", "Research Institution", or "SME". The `country_code` column references the country, while `is_coordinator` and `is_originator` are boolean flags indicating the organization's role. The `coordinates_project_partner_organization_id` column supports self-referential coordination relationships, and the foreign keys `event_id` and `country_id` link the organization to its event and country.

The `research_ideas` table stores the intellectual proposals underpinning the collaboration.

**Table `research_ideas`**

| id | idea_id | idea_title | risk_level | is_selected_for_incubator | is_selected_for_funding | research_team_id | research_theme_id | challenge_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 7731863 | Composite Series | High Risk | true | true | 1 | 1 | a28f77ac-9bad-11eb-a8a2-19ed5c03f8d3 |
| 2 | lu_tax_code_template_m40 | Compact Assessment A | Breakthrough | false | false | 2 | 2 | 726054 |
| 3 | 57dabcae-8fcc-11eb-924d-9cd76263cbd0 | Legacy Survey | Conventional | true | true | 3 | 3 | 1204-0009-L |
| 4 | 3012826 | Regional Corridor | High Risk | false | false | 4 | 4 | 209219 |

Each idea has a surrogate `id`, a domain `idea_id` (e.g., `7731863`), and an `idea_title` such as "Composite Series" or "Compact Assessment A". The `risk_level` column classifies the idea as "High Risk", "Breakthrough", or "Conventional". The boolean flags `is_selected_for_incubator` and `is_selected_for_funding` indicate selection status. The foreign keys `research_team_id`, `research_theme_id`, and `challenge_id` link the idea to its team, theme, and the societal challenge it addresses.

The `research_teams` table captures the collaborative groupings formed around ideas.

**Table `research_teams`**

| id | team_id | team_name | formation_region | is_formed_for_incubator | research_idea_id | event_id |
|---|---|---|---|---|---|---|
| 1 | 4716411 | Integrated Framework A | pilot-formatio-32 | true | 1 | ChIJEctqrYFt5kcRUrBEPR-XXBE |
| 2 | 7441142 | Extended Protocol | extended-formatio-33 | false | 2 | 209230 |
| 3 | IVC20Idet15 | Pilot Programme | integrated-formatio-34 | true | 3 | 69440 |
| 4 | 3158142 | Baseline Standard D | seasonal-formatio-35 | false | 4 | 4793467 |

Each team has a surrogate `id`, a domain `team_id` (e.g., `4716411`), and a `team_name` such as "Integrated Framework A" or "Extended Protocol". The `formation_region` column records where the team was formed, and `is_formed_for_incubator` is a boolean flag. The foreign keys `research_idea_id` and `event_id` link the team to its associated idea and event.

The `research_themes` table stores the thematic categories that organize research activity.

**Table `research_themes`**

| id | theme_id | theme_name | is_disruptive | is_interdisciplinary | event_id | research_idea_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 4447020 | Baseline Series D | true | false | ChIJEctqrYFt5kcRUrBEPR-XXBE | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 9085272 | Distributed Assessment | false | true | 209230 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 13219 | Adaptive Survey | true | false | 69440 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | d02c82f0-8fb3-11eb-924d-9cd76263cbd0 | Primary Corridor A | false | true | 4793467 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Each theme has a surrogate `id`, a domain `theme_id` (e.g., `4447020`), and a `theme_name` such as "Baseline Series D" or "Distributed Assessment". The boolean columns `is_disruptive` and `is_interdisciplinary` capture thematic properties. The `created_at` and `updated_at` columns record temporal metadata, while the foreign keys `event_id` and `research_idea_id` link the theme to its event and idea.

The `societal_challenges` and `countries` tables provide the reference ontologies for the challenge and geographic dimensions.

**Table `societal_challenges`**

| challenge_id | challenge_name | is_policy_relevant | research_idea_id |
|---|---|---|---|
| a28f77ac-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Initiative A | false | 1 |
| 726054 | Composite Model | true | 2 |
| 1204-0009-L | Compact Cluster | false | 3 |
| 209219 | Legacy Review D | true | 4 |

**Table `countries`**

| country_id | country_code | country_name | has_partner | has_local_network | partner_organization_id | has_local_network_established_by_partner_organization_id |
|---|---|---|---|---|---|---|
| 1 | 727051 | Pilot Assessment | true | false | 1 | 1 |
| 2 | select | Baseline Survey | false | true | 2 | 2 |
| 3 | 5f9467a0-8fcd-11eb-924d-9cd76263cbd0 | Distributed Corridor A | true | false | 3 | 3 |
| 4 | 8843764 | Adaptive Series | false | true | 4 | 4 |

These reference tables supply the controlled vocabularies for the `challenge_id` foreign key in `research_ideas` and the `country_id`/`country_code` foreign keys in `partner_organizations`.

Two junction tables resolve the many-to-many relationships between researchers and events, and between researchers and teams.

**Table `events_researchers`**

| event_id | researcher_id |
|---|---|
| ChIJEctqrYFt5kcRUrBEPR-XXBE | 1000 |
| ChIJEctqrYFt5kcRUrBEPR-XXBE | 1001 |
| 209230 | 1001 |
| 209230 | 1002 |
| 69440 | 1002 |
| 69440 | 1003 |
| 4793467 | 1003 |
| 4793467 | 1000 |

**Table `teams_researchers`**

| research_team_id | researcher_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `events_researchers` junction table links researchers to events they participate in, while `teams_researchers` links researchers to teams they belong to. These tables enable the cardinality-bounded relationships required by the ontology, where a single researcher may attend multiple events and belong to multiple teams.

### Denormalized Views

The views materialize the normalized base tables into denormalized projections that answer specific domain questions. Each view performs a join across two or more base tables, reconstructing a coherent fact from the relational fragments.

The view `v_researcher_event` joins `researchers` with `events` to answer the question: which researchers participated in which events?

**View `v_researcher_event`**

```sql
CREATE VIEW v_researcher_event AS
SELECT a.id, a.researcher_id, a.full_name, a.phd_award_date, b.event_id AS event_event_id, b.event_name AS event_event_name, b.event_type AS event_event_type
FROM researchers a JOIN events b ON a.event_id = b.event_id;
```

| id | researcher_id | full_name | phd_award_date | event_event_id | event_event_name | event_event_type |
|---|---|---|---|---|---|---|
| 1000 | 89419 | Rebecca Hall | 2025-08-10 | ChIJEctqrYFt5kcRUrBEPR-XXBE | Composite Review | Lab Surfing Workshop |
| 1001 | 2618557 | Brianna Mejia | 2022-01-21 | 209230 | Compact Initiative A | Blue Sky Conference |
| 1002 | 9736892 | Desiree Cain | 2023-06-05 | 69440 | Legacy Model | Science Incubator Summer School |
| 1003 | 1450639 | Suzanne Collins | 2024-11-16 | 4793467 | Regional Cluster | Lab Surfing Workshop |

Reading a concrete row from this view, we see that researcher `Rebecca Hall` (id `1000`, researcher_id `89419`) participated in the event `ChIJEctqrYFt5kcRUrBEPR-XXBE` ("Composite Review"), a "Lab Surfing Workshop" held in the "North and Irish Sea" region. The view preserves the researcher's funding selection status alongside the event's funding status, enabling queries that correlate researcher eligibility with event funding.

The view `v_researcher_research_team` joins `researchers` with `research_teams` to answer: which researchers belong to which teams?

**View `v_researcher_research_team`**

```sql
CREATE VIEW v_researcher_research_team AS
SELECT a.id, a.researcher_id, a.full_name, a.phd_award_date, b.id AS team_id, b.team_id AS team_team_id, b.team_name AS team_team_name
FROM researchers a JOIN research_teams b ON a.research_team_id = b.id;
```

| id | researcher_id | full_name | phd_award_date | team_id | team_team_id | team_team_name |
|---|---|---|---|---|---|---|
| 1000 | 89419 | Rebecca Hall | 2025-08-10 | 1 | 4716411 | Integrated Framework A |
| 1001 | 2618557 | Brianna Mejia | 2022-01-21 | 2 | 7441142 | Extended Protocol |
| 1002 | 9736892 | Desiree Cain | 2023-06-05 | 3 | IVC20Idet15 | Pilot Programme |
| 1003 | 1450639 | Suzanne Collins | 2024-11-16 | 4 | 3158142 | Baseline Standard D |

A row from this view shows that researcher `Brianna Mejia` (id `1001`, researcher_id `2618557`) belongs to the team `Extended Protocol` (team_id `7441142`), which was formed in the region `extended-formatio-33` and was not formed for incubator purposes. The view carries the team's `research_idea_id` and `event_id`, enabling downstream joins to the idea and event dimensions.

The view `v_researcher_research_idea` joins `researchers` with `research_ideas` to answer: which researchers are associated with which research ideas?

**View `v_researcher_research_idea`**

```sql
CREATE VIEW v_researcher_research_idea AS
SELECT a.id, a.researcher_id, a.full_name, a.phd_award_date, b.id AS idea_id, b.idea_id AS idea_idea_id, b.idea_title AS idea_idea_title
FROM researchers a JOIN research_ideas b ON a.research_idea_id = b.id;
```

| id | researcher_id | full_name | phd_award_date | idea_id | idea_idea_id | idea_idea_title |
|---|---|---|---|---|---|---|
| 1000 | 89419 | Rebecca Hall | 2025-08-10 | 1 | 7731863 | Composite Series |
| 1001 | 2618557 | Brianna Mejia | 2022-01-21 | 2 | lu_tax_code_template_m40 | Compact Assessment A |
| 1002 | 9736892 | Desiree Cain | 2023-06-05 | 3 | 57dabcae-8fcc-11eb-924d-9cd76263cbd0 | Legacy Survey |
| 1003 | 1450639 | Suzanne Collins | 2024-11-16 | 4 | 3012826 | Regional Corridor |

From this view, we observe that researcher `Desiree Cain` (id `1002`, researcher_id `9736892`) is associated with the research idea `Legacy Survey` (idea_id `57dabcae-8fcc-11eb-924d-9cd76263cbd0`), which is classified as "Conventional" risk and is selected for both incubator and funding. The view carries the idea's team and theme identifiers, enabling multi-hop traversal to the team and theme dimensions.

The view `v_event_partner_organization` joins `events` with `partner_organizations` to answer: which partner organizations are associated with which events?

**View `v_event_partner_organization`**

```sql
CREATE VIEW v_event_partner_organization AS
SELECT a.event_id, a.event_name, a.event_type, a.start_date, b.partner_organization_id AS organization_partner_organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM events a JOIN partner_organizations b ON a.partner_organization_id = b.partner_organization_id;
```

| event_id | event_name | event_type | start_date | organization_partner_organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| ChIJEctqrYFt5kcRUrBEPR-XXBE | Composite Review | Lab Surfing Workshop | 2022-09-10T08:48:00 | 1 | id_18 | Extended Model |
| 209230 | Compact Initiative A | Blue Sky Conference | 2023-02-21T15:05:00 | 2 | lu_tax_code_template_m14 | Pilot Cluster A |
| 69440 | Legacy Model | Science Incubator Summer School | 2024-07-05T22:22:00 | 3 | 10207153 | Baseline Review |
| 4793467 | Regional Cluster | Lab Surfing Workshop | 2025-12-16T05:39:00 | 4 | 6926378 | Distributed Initiative |

A row from this view shows that the event `ChIJEctqrYFt5kcRUrBEPR-XXBE` ("Composite Review") is associated with the partner organization `Extended Model` (org_id `id_18`), which is a "University" type and serves as the coordinator (`is_coordinator = true`). The view carries the organization's country code, enabling geographic queries on event partners.

The view `v_event_researcher_detail` joins `events` with `researchers` to answer: which researchers are associated with which events, from the event's perspective?

**View `v_event_researcher_detail`**

```sql
CREATE VIEW v_event_researcher_detail AS
SELECT a.event_id, a.event_name, a.event_type, b.id AS researcher_id, b.researcher_id AS researcher_researcher_id, b.full_name AS researcher_full_name
FROM events a
  JOIN events_researchers j ON j.event_id = a.event_id
  JOIN researchers b ON b.id = j.researcher_id;
```

| event_id | event_name | event_type | researcher_id | researcher_researcher_id | researcher_full_name |
|---|---|---|---|---|---|
| ChIJEctqrYFt5kcRUrBEPR-XXBE | Composite Review | Lab Surfing Workshop | 1000 | 89419 | Rebecca Hall |
| ChIJEctqrYFt5kcRUrBEPR-XXBE | Composite Review | Lab Surfing Workshop | 1001 | 2618557 | Brianna Mejia |
| 209230 | Compact Initiative A | Blue Sky Conference | 1001 | 2618557 | Brianna Mejia |
| 209230 | Compact Initiative A | Blue Sky Conference | 1002 | 9736892 | Desiree Cain |
| 69440 | Legacy Model | Science Incubator Summer School | 1002 | 9736892 | Desiree Cain |
| 69440 | Legacy Model | Science Incubator Summer School | 1003 | 1450639 | Suzanne Collins |
| 4793467 | Regional Cluster | Lab Surfing Workshop | 1003 | 1450639 | Suzanne Collins |
| 4793467 | Regional Cluster | Lab Surfing Workshop | 1000 | 89419 | Rebecca Hall |

From this view, we see that the event `209230` ("Compact Initiative A", a "Blue Sky Conference") is associated with researcher `Brianna Mejia` (id `1001`), whose PhD was awarded on `2022-01-21` and who is not selected for funding. The view carries the researcher's team and idea identifiers, enabling the reconstruction of the full participation chain from event through researcher to team and idea.

The view `v_event_research_theme` joins `events` with `research_themes` to answer: which research themes are associated with which events?

**View `v_event_research_theme`**

```sql
CREATE VIEW v_event_research_theme AS
SELECT a.event_id, a.event_name, a.event_type, a.start_date, b.id AS theme_id, b.theme_id AS theme_theme_id, b.theme_name AS theme_theme_name
FROM events a JOIN research_themes b ON a.research_theme_id = b.id;
```

| event_id | event_name | event_type | start_date | theme_id | theme_theme_id | theme_theme_name |
|---|---|---|---|---|---|---|
| ChIJEctqrYFt5kcRUrBEPR-XXBE | Composite Review | Lab Surfing Workshop | 2022-09-10T08:48:00 | 1 | 4447020 | Baseline Series D |
| 209230 | Compact Initiative A | Blue Sky Conference | 2023-02-21T15:05:00 | 2 | 9085272 | Distributed Assessment |
| 69440 | Legacy Model | Science Incubator Summer School | 2024-07-05T22:22:00 | 3 | 13219 | Adaptive Survey |
| 4793467 | Regional Cluster | Lab Surfing Workshop | 2025-12-16T05:39:00 | 4 | d02c82f0-8fb3-11eb-924d-9cd76263cbd0 | Primary Corridor A |

A row from this view shows that the event `ChIJEctqrYFt5kcRUrBEPR-XXBE` is associated with the research theme `Baseline Series D` (theme_id `4447020`), which is marked as disruptive (`is_disruptive = true`) but not interdisciplinary (`is_interdisciplinary = false`). The view carries the theme's `research_idea_id`, enabling the link from theme to idea.

The view `v_partner_organization_partner_organization` performs a self-join on `partner_organizations` to answer: which organizations coordinate or originate projects with other organizations?

**View `v_partner_organization_partner_organization`**

```sql
CREATE VIEW v_partner_organization_partner_organization AS
SELECT a.partner_organization_id, a.org_id, a.org_name, a.org_type, b.partner_organization_id AS organization_partner_organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM partner_organizations a JOIN partner_organizations b ON a.coordinates_project_partner_organization_id = b.partner_organization_id;
```

| partner_organization_id | org_id | org_name | org_type | organization_partner_organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1 | id_18 | Extended Model | University | 1 | id_18 | Extended Model |
| 2 | lu_tax_code_template_m14 | Pilot Cluster A | Research Institution | 2 | lu_tax_code_template_m14 | Pilot Cluster A |
| 3 | 10207153 | Baseline Review | SME | 3 | 10207153 | Baseline Review |
| 4 | 6926378 | Distributed Initiative | University | 4 | 6926378 | Distributed Initiative |

This view reveals the coordination relationships within the partner network. For example, organization `Extended Model` (id `1`) coordinates with itself (via `coordinates_project_partner_organization_id = 1`), indicating a self-coordination pattern. The view carries both the source and target organization details, enabling queries on coordination chains.

The view `v_partner_organization_event` joins `partner_organizations` with `events` to answer: which events are associated with which partner organizations?

**View `v_partner_organization_event`**

```sql
CREATE VIEW v_partner_organization_event AS
SELECT a.partner_organization_id, a.org_id, a.org_name, a.org_type, b.event_id AS event_event_id, b.event_name AS event_event_name, b.event_type AS event_event_type
FROM partner_organizations a JOIN events b ON a.event_id = b.event_id;
```

| partner_organization_id | org_id | org_name | org_type | event_event_id | event_event_name | event_event_type |
|---|---|---|---|---|---|---|
| 1 | id_18 | Extended Model | University | ChIJEctqrYFt5kcRUrBEPR-XXBE | Composite Review | Lab Surfing Workshop |
| 2 | lu_tax_code_template_m14 | Pilot Cluster A | Research Institution | 209230 | Compact Initiative A | Blue Sky Conference |
| 3 | 10207153 | Baseline Review | SME | 69440 | Legacy Model | Science Incubator Summer School |
| 4 | 6926378 | Distributed Initiative | University | 4793467 | Regional Cluster | Lab Surfing Workshop |

From this view, we see that the partner organization `Extended Model` (id `1`) is associated with the event `ChIJEctqrYFt5kcRUrBEPR-XXBE` ("Composite Review"). The view carries the event's type, dates, and region, enabling queries that correlate organizational participation with event characteristics.

The view `v_partner_organization_country` joins `partner_organizations` with `countries` to answer: which countries host which partner organizations?

**View `v_partner_organization_country`**

```sql
CREATE VIEW v_partner_organization_country AS
SELECT a.partner_organization_id, a.org_id, a.org_name, a.org_type, b.country_id AS country_country_id, b.country_code AS country_country_code, b.country_name AS country_country_name
FROM partner_organizations a JOIN countries b ON a.country_id = b.country_id;
```

| partner_organization_id | org_id | org_name | org_type | country_country_id | country_country_code | country_country_name |
|---|---|---|---|---|---|---|
| 1 | id_18 | Extended Model | University | 1 | 727051 | Pilot Assessment |
| 2 | lu_tax_code_template_m14 | Pilot Cluster A | Research Institution | 2 | select | Baseline Survey |
| 3 | 10207153 | Baseline Review | SME | 3 | 5f9467a0-8fcd-11eb-924d-9cd76263cbd0 | Distributed Corridor A |
| 4 | 6926378 | Distributed Initiative | University | 4 | 8843764 | Adaptive Series |

A row from this view shows that the partner organization `Extended Model` (id `1`) is located in country `1`. The view carries the organization's name, type, and coordination status, enabling geographic analysis of the partner network.

The view `v_research_idea_research_team` joins `research_ideas` with `research_teams` to answer: which research ideas are associated with which teams?

**View `v_research_idea_research_team`**

```sql
CREATE VIEW v_research_idea_research_team AS
SELECT a.id, a.idea_id, a.idea_title, a.risk_level, b.id AS team_id, b.team_id AS team_team_id, b.team_name AS team_team_name
FROM research_ideas a JOIN research_teams b ON a.research_team_id = b.id;
```

| id | idea_id | idea_title | risk_level | team_id | team_team_id | team_team_name |
|---|---|---|---|---|---|---|
| 1 | 7731863 | Composite Series | High Risk | 1 | 4716411 | Integrated Framework A |
| 2 | lu_tax_code_template_m40 | Compact Assessment A | Breakthrough | 2 | 7441142 | Extended Protocol |
| 3 | 57dabcae-8fcc-11eb-924d-9cd76263cbd0 | Legacy Survey | Conventional | 3 | IVC20Idet15 | Pilot Programme |
| 4 | 3012826 | Regional Corridor | High Risk | 4 | 3158142 | Baseline Standard D |

From this view, we observe that the research idea `Composite Series` (id `1`) is associated with the research team `Integrated Framework A` (team_id `4716411`), which was formed in region `pilot-formatio-32` and was formed for incubator purposes. The view carries the team's event identifier, enabling the link from idea through team to event.

The view `v_research_idea_research_theme` joins `research_ideas` with `research_themes` to answer: which research ideas fall under which themes?

**View `v_research_idea_research_theme`**

```sql
CREATE VIEW v_research_idea_research_theme AS
SELECT a.id, a.idea_id, a.idea_title, a.risk_level, b.id AS theme_id, b.theme_id AS theme_theme_id, b.theme_name AS theme_theme_name
FROM research_ideas a JOIN research_themes b ON a.research_theme_id = b.id;
```

| id | idea_id | idea_title | risk_level | theme_id | theme_theme_id | theme_theme_name |
|---|---|---|---|---|---|---|
| 1 | 7731863 | Composite Series | High Risk | 1 | 4447020 | Baseline Series D |
| 2 | lu_tax_code_template_m40 | Compact Assessment A | Breakthrough | 2 | 9085272 | Distributed Assessment |
| 3 | 57dabcae-8fcc-11eb-924d-9cd76263cbd0 | Legacy Survey | Conventional | 3 | 13219 | Adaptive Survey |
| 4 | 3012826 | Regional Corridor | High Risk | 4 | d02c82f0-8fb3-11eb-924d-9cd76263cbd0 | Primary Corridor A |

A row from this view shows that the research idea `Composite Series` (id `1`) falls under the research theme `Baseline Series D` (theme_id `4447020`), which is disruptive but not interdisciplinary. The view carries the theme's event identifier, enabling the link from idea through theme to event.

The view `v_research_idea_societal_challenge` joins `research_ideas` with `societal_challenges` to answer: which societal challenges does each research idea address?

**View `v_research_idea_societal_challenge`**

```sql
CREATE VIEW v_research_idea_societal_challenge AS
SELECT a.id, a.idea_id, a.idea_title, a.risk_level, b.challenge_id AS challenge_challenge_id, b.challenge_name AS challenge_challenge_name, b.is_policy_relevant AS challenge_is_policy_relevant
FROM research_ideas a JOIN societal_challenges b ON a.challenge_id = b.challenge_id;
```

| id | idea_id | idea_title | risk_level | challenge_challenge_id | challenge_challenge_name | challenge_is_policy_relevant |
|---|---|---|---|---|---|---|
| 1 | 7731863 | Composite Series | High Risk | a28f77ac-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Initiative A | false |
| 2 | lu_tax_code_template_m40 | Compact Assessment A | Breakthrough | 726054 | Composite Model | true |
| 3 | 57dabcae-8fcc-11eb-924d-9cd76263cbd0 | Legacy Survey | Conventional | 1204-0009-L | Compact Cluster | false |
| 4 | 3012826 | Regional Corridor | High Risk | 209219 | Legacy Review D | true |

From this view, we see that the research idea `Composite Series` (id `1`) addresses the societal challenge identified by `a28f77ac-9bad-11eb-a8a2-19ed5c03f8d3`. The view carries the idea's title, risk level, and selection flags, enabling queries that correlate challenge domains with idea characteristics.

The view `v_research_team_researcher_detail` joins `research_teams` with `researchers` to answer: which researchers belong to which teams, from the team's perspective?

**View `v_research_team_researcher_detail`**

```sql
CREATE VIEW v_research_team_researcher_detail AS
SELECT a.id, a.team_id, a.team_name, b.id AS researcher_id, b.researcher_id AS researcher_researcher_id, b.full_name AS researcher_full_name
FROM research_teams a
  JOIN teams_researchers j ON j.research_team_id = a.id
  JOIN researchers b ON b.id = j.researcher_id;
```

| id | team_id | team_name | researcher_id | researcher_researcher_id | researcher_full_name |
|---|---|---|---|---|---|
| 1 | 4716411 | Integrated Framework A | 1000 | 89419 | Rebecca Hall |
| 1 | 4716411 | Integrated Framework A | 1001 | 2618557 | Brianna Mejia |
| 2 | 7441142 | Extended Protocol | 1001 | 2618557 | Brianna Mejia |
| 2 | 7441142 | Extended Protocol | 1002 | 9736892 | Desiree Cain |
| 3 | IVC20Idet15 | Pilot Programme | 1002 | 9736892 | Desiree Cain |
| 3 | IVC20Idet15 | Pilot Programme | 1003 | 1450639 | Suzanne Collins |
| 4 | 3158142 | Baseline Standard D | 1003 | 1450639 | Suzanne Collins |
| 4 | 3158142 | Baseline Standard D | 1000 | 89419 | Rebecca Hall |

A row from this view shows that the research team `Integrated Framework A` (id `1`) includes researcher `Rebecca Hall` (id `1000`), who is selected for funding (`is_selected_for_funding = true`). The view carries the researcher's event and idea identifiers, enabling the reconstruction of the full team-to-researcher-to-event/idea chain.

The view `v_research_team_research_idea` joins `research_teams` with `research_ideas` to answer: which research ideas are associated with which teams?

**View `v_research_team_research_idea`**

```sql
CREATE VIEW v_research_team_research_idea AS
SELECT a.id, a.team_id, a.team_name, a.formation_region, b.id AS idea_id, b.idea_id AS idea_idea_id, b.idea_title AS idea_idea_title
FROM research_teams a JOIN research_ideas b ON a.research_idea_id = b.id;
```

| id | team_id | team_name | formation_region | idea_id | idea_idea_id | idea_idea_title |
|---|---|---|---|---|---|---|
| 1 | 4716411 | Integrated Framework A | pilot-formatio-32 | 1 | 7731863 | Composite Series |
| 2 | 7441142 | Extended Protocol | extended-formatio-33 | 2 | lu_tax_code_template_m40 | Compact Assessment A |
| 3 | IVC20Idet15 | Pilot Programme | integrated-formatio-34 | 3 | 57dabcae-8fcc-11eb-924d-9cd76263cbd0 | Legacy Survey |
| 4 | 3158142 | Baseline Standard D | seasonal-formatio-35 | 4 | 3012826 | Regional Corridor |

From this view, we observe that the research team `Integrated Framework A` (id `1`) is associated with the research idea `Composite Series` (id `1`), which is classified as "High Risk" and selected for both incubator and funding. The view carries the idea's theme and challenge identifiers, enabling multi-hop traversal to the theme and challenge dimensions.

The view `v_research_team_event` joins `research_teams` with `events` to answer: which events are associated with which research teams?

**View `v_research_team_event`**

```sql
CREATE VIEW v_research_team_event AS
SELECT a.id, a.team_id, a.team_name, a.formation_region, b.event_id AS event_event_id, b.event_name AS event_event_name, b.event_type AS event_event_type
FROM research_teams a JOIN events b ON a.event_id = b.event_id;
```

| id | team_id | team_name | formation_region | event_event_id | event_event_name | event_event_type |
|---|---|---|---|---|---|---|
| 1 | 4716411 | Integrated Framework A | pilot-formatio-32 | ChIJEctqrYFt5kcRUrBEPR-XXBE | Composite Review | Lab Surfing Workshop |
| 2 | 7441142 | Extended Protocol | extended-formatio-33 | 209230 | Compact Initiative A | Blue Sky Conference |
| 3 | IVC20Idet15 | Pilot Programme | integrated-formatio-34 | 69440 | Legacy Model | Science Incubator Summer School |
| 4 | 3158142 | Baseline Standard D | seasonal-formatio-35 | 4793467 | Regional Cluster | Lab Surfing Workshop |

A row from this view shows that the research team `Integrated Framework A` (id `1`) is associated with the event `ChIJEctqrYFt5kcRUrBEPR-XXBE` ("Composite Review"). The view carries the event's type, dates, and region, enabling queries that correlate team formation with event characteristics.

The view `v_research_theme_event` joins `research_themes` with `events` to answer: which events are associated with which research themes?

**View `v_research_theme_event`**

```sql
CREATE VIEW v_research_theme_event AS
SELECT a.id, a.theme_id, a.theme_name, a.is_disruptive, b.event_id AS event_event_id, b.event_name AS event_event_name, b.event_type AS event_event_type
FROM research_themes a JOIN events b ON a.event_id = b.event_id;
```

| id | theme_id | theme_name | is_disruptive | event_event_id | event_event_name | event_event_type |
|---|---|---|---|---|---|---|
| 1 | 4447020 | Baseline Series D | true | ChIJEctqrYFt5kcRUrBEPR-XXBE | Composite Review | Lab Surfing Workshop |
| 2 | 9085272 | Distributed Assessment | false | 209230 | Compact Initiative A | Blue Sky Conference |
| 3 | 13219 | Adaptive Survey | true | 69440 | Legacy Model | Science Incubator Summer School |
| 4 | d02c82f0-8fb3-11eb-924d-9cd76263cbd0 | Primary Corridor A | false | 4793467 | Regional Cluster | Lab Surfing Workshop |

From this view, we see that the research theme `Baseline Series D` (id `1`) is associated with the event `ChIJEctqrYFt5kcRUrBEPR-XXBE` ("Composite Review"). The view carries the theme's idea identifier, enabling the link from theme through idea to challenge.

The view `v_research_theme_research_idea` joins `research_themes` with `research_ideas` to answer: which research ideas fall under which themes?

**View `v_research_theme_research_idea`**

```sql
CREATE VIEW v_research_theme_research_idea AS
SELECT a.id, a.theme_id, a.theme_name, a.is_disruptive, b.id AS idea_id, b.idea_id AS idea_idea_id, b.idea_title AS idea_idea_title
FROM research_themes a JOIN research_ideas b ON a.research_idea_id = b.id;
```

| id | theme_id | theme_name | is_disruptive | idea_id | idea_idea_id | idea_idea_title |
|---|---|---|---|---|---|---|
| 1 | 4447020 | Baseline Series D | true | 1 | 7731863 | Composite Series |
| 2 | 9085272 | Distributed Assessment | false | 2 | lu_tax_code_template_m40 | Compact Assessment A |
| 3 | 13219 | Adaptive Survey | true | 3 | 57dabcae-8fcc-11eb-924d-9cd76263cbd0 | Legacy Survey |
| 4 | d02c82f0-8fb3-11eb-924d-9cd76263cbd0 | Primary Corridor A | false | 4 | 3012826 | Regional Corridor |

A row from this view shows that the research theme `Baseline Series D` (id `1`) encompasses the research idea `Composite Series` (id `1`). The view carries the idea's risk level and selection flags, enabling queries that correlate thematic properties with idea characteristics.

The view `v_societal_challenge_research_idea` joins `societal_challenges` with `research_ideas` to answer: which research ideas address which societal challenges?

**View `v_societal_challenge_research_idea`**

```sql
CREATE VIEW v_societal_challenge_research_idea AS
SELECT a.challenge_id, a.challenge_name, a.is_policy_relevant, b.id AS idea_id, b.idea_id AS idea_idea_id, b.idea_title AS idea_idea_title
FROM societal_challenges a JOIN research_ideas b ON a.research_idea_id = b.id;
```

| challenge_id | challenge_name | is_policy_relevant | idea_id | idea_idea_id | idea_idea_title |
|---|---|---|---|---|---|
| a28f77ac-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Initiative A | false | 1 | 7731863 | Composite Series |
| 726054 | Composite Model | true | 2 | lu_tax_code_template_m40 | Compact Assessment A |
| 1204-0009-L | Compact Cluster | false | 3 | 57dabcae-8fcc-11eb-924d-9cd76263cbd0 | Legacy Survey |
| 209219 | Legacy Review D | true | 4 | 3012826 | Regional Corridor |

From this view, we observe that the societal challenge `a28f77ac-9bad-11eb-a8a2-19ed5c03f8d3` is addressed by the research idea `Composite Series` (id `1`), which is classified as "High Risk" and selected for both incubator and funding. The view carries the idea's team and theme identifiers, enabling the reconstruction of the full challenge-to-idea-to-team/theme chain.

The view `v_country_partner_organization` joins `countries` with `partner_organizations` to answer: which partner organizations are located in which countries?

**View `v_country_partner_organization`**

```sql
CREATE VIEW v_country_partner_organization AS
SELECT a.country_id, a.country_code, a.country_name, a.has_partner, b.partner_organization_id AS organization_partner_organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM countries a JOIN partner_organizations b ON a.partner_organization_id = b.partner_organization_id;
```

| country_id | country_code | country_name | has_partner | organization_partner_organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1 | 727051 | Pilot Assessment | true | 1 | id_18 | Extended Model |
| 2 | select | Baseline Survey | false | 2 | lu_tax_code_template_m14 | Pilot Cluster A |
| 3 | 5f9467a0-8fcd-11eb-924d-9cd76263cbd0 | Distributed Corridor A | true | 3 | 10207153 | Baseline Review |
| 4 | 8843764 | Adaptive Series | false | 4 | 6926378 | Distributed Initiative |

A row from this view shows that country `1` hosts the partner organization `Extended Model` (id `1`), which is a "University" type and serves as the coordinator. The view carries the organization's name, type, and event association, enabling geographic analysis of the partner network.

### Synthesis

The research collaboration domain is modelled as a normalized relational schema with eight base tables and two junction tables, connected by foreign keys that encode the ontology's participation and classification relationships. The base tables capture the entity types—researchers, events, partner organizations, research ideas, research teams, research themes, societal challenges, and countries—with attributes that reflect the domain's cardinality constraints: a researcher participates in one event and one team (as recorded in the base table), a research idea belongs to one team and one theme, and a partner organization is located in one country. The junction tables `events_researchers` and `teams_researchers` resolve the many-to-many relationships that the ontology permits, enabling a researcher to attend multiple events and belong to multiple teams without violating normalization.

The twenty denormalized views reconstruct domain facts by joining the base tables along their foreign key paths. Each view answers a specific question: which researchers attended which events, which organizations coordinate which projects, which ideas address which challenges. The views preserve the surrogate and domain identifiers from the base tables, enabling traceability back to the normalized schema. Representative rows—such as Rebecca Hall's participation in the Composite Review event, or the Composite Series idea's classification as High Risk and association with the Baseline Series D theme—illustrate how the join-based projections materialize the ontology's relationships as queryable facts. The schema thus provides both a normalized foundation for data integrity and a denormalized interface for domain analysis.