# Research Collaboration Ecosystem: A Practitioner's Guide

Modern research ecosystems operate at the intersection of human expertise, institutional capacity, and strategic funding. Organizations coordinate across borders to assemble teams, propose ideas, and respond to societal challenges through structured events and thematic programs. This chapter documents the data architecture that underpins such a system, tracing how individual researchers, partner organizations, research teams, and thematic priorities interlock to form a coherent picture of collaborative science. The records described here capture a snapshot of active and planned research activity, with each entity carrying attributes that determine eligibility, coordination roles, and strategic alignment.

## Core Entities

The foundation of the system rests on eight base tables that store the primary records of the research ecosystem.

**Table `researchers`**

| id | researcher_id | full_name | phd_award_date | current_affiliation | email_address | is_selected_for_funding | event_id | research_team_id | research_idea_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 89419 | Rebecca Hall | 2025-08-10 | composite-current-51 | compact-email-32 | true | ChIJEctqrYFt5kcRUrBEPR-XXBE | 1 | 1 |
| 1001 | 2618557 | Brianna Mejia | 2022-01-21 | primary-current-52 | composite-email-33 | false | 209230 | 2 | 2 |
| 1002 | 9736892 | Desiree Cain | 2023-06-05 | adaptive-current-53 | primary-email-34 | true | 69440 | 3 | 3 |
| 1003 | 1450639 | Suzanne Collins | 2024-11-16 | distributed-current-54 | adaptive-email-35 | false | 4793467 | 4 | 4 |

The `researchers` table holds individual profiles for scientists and scholars participating in the ecosystem. Each row identifies a person by a numeric surrogate `id` and a persistent `researcher_id` (for example, `89419` for Rebecca Hall). The `full_name` column stores the human-readable name, while `phd_award_date` records the date the researcher received their doctorate — ranging from 2022 through 2025 in the current dataset. The `current_affiliation` field contains a coded reference to the researcher's home institution (e.g., `composite-current-51`), and `email_address` provides a contact handle. The boolean `is_selected_for_funding` flag indicates whether the researcher has been approved for financial support; in the sample data, Rebecca Hall and Desiree Cain carry `true`, while Brianna Mejia and Suzanne Collins carry `false`. The remaining columns (`event_id`, `research_team_id`, `research_idea_id`) serve as denormalized pointers linking the researcher to their primary event, team, and idea.

**Table `events`**

| event_id | event_name | event_type | start_date | end_date | location_region | is_funded | partner_organization_id | research_theme_id |
|---|---|---|---|---|---|---|---|---|
| ChIJEctqrYFt5kcRUrBEPR-XXBE | Composite Review | Lab Surfing Workshop | 2022-09-10T08:48:00 | 2022-09-09T20:48:00 | North and Irish Sea | true | 1 | 1 |
| 209230 | Compact Initiative A | Blue Sky Conference | 2023-02-21T15:05:00 | 2023-02-20T03:05:00 | Black Sea and South Mediterranean | false | 2 | 2 |
| 69440 | Legacy Model | Science Incubator Summer School | 2024-07-05T22:22:00 | 2024-07-04T10:22:00 | Western Balkans | true | 3 | 3 |
| 4793467 | Regional Cluster | Lab Surfing Workshop | 2025-12-16T05:39:00 | 2025-12-15T17:39:00 | Central and Eastern Europe | false | 4 | 4 |

Events represent the temporal anchors of research activity — workshops, conferences, summer schools, and review meetings. The `event_id` column uses a mix of identifiers: some follow a Google Place ID format such as `ChIJEctqrYFt5kcRUrBEPR-XXBE`, while others are plain integers like `209230`. The `event_name` provides a human-readable label (e.g., "Composite Review"), and `event_type` categorizes the format — "Lab Surfing Workshop," "Blue Sky Conference," "Science Incubator Summer School." The `start_date` and `end_date` columns record the event window; note that in this dataset the end date precedes the start date by one day, a pattern that reflects the data generation method rather than a logical constraint. The `location_region` field names the geographic scope (e.g., "North and Irish Sea," "Black Sea and South Mediterranean"), `is_funded` indicates financial backing, and `partner_organization_id` and `research_theme_id` link the event to its coordinating organization and thematic focus.

**Table `partner_organizations`**

| partner_organization_id | org_id | org_name | org_type | country_code | is_coordinator | is_originator | coordinates_project_partner_organization_id | event_id | country_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | id_18 | Extended Model | University | 727051 | true | false | 1 | ChIJEctqrYFt5kcRUrBEPR-XXBE | 1 |
| 2 | lu_tax_code_template_m14 | Pilot Cluster A | Research Institution | select | false | true | 2 | 209230 | 2 |
| 3 | 10207153 | Baseline Review | SME | 5f9467a0-8fcd-11eb-924d-9cd76263cbd0 | true | false | 3 | 69440 | 3 |
| 4 | 6926378 | Distributed Initiative | University | 8843764 | false | true | 4 | 4793467 | 4 |

Partner organizations are the institutional actors that participate in and coordinate research events. The `partner_organization_id` serves as the primary key, while `org_id` holds a secondary identifier (e.g., `id_18` for the "Extended Model" university). The `org_name` column stores the organization's display name, and `org_type` classifies it as a "University," "Research Institution," or "SME." The `country_code` column references the organization's home country, and the boolean flags `is_coordinator` and `is_originator` indicate whether the organization leads the partnership or originated the proposal. The `coordinates_project_partner_organization_id` column creates a self-referential link, allowing one partner organization to be designated as the coordinator of another's project.

**Table `research_ideas`**

| id | idea_id | idea_title | risk_level | is_selected_for_incubator | is_selected_for_funding | research_team_id | research_theme_id | challenge_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 7731863 | Composite Series | High Risk | true | true | 1 | 1 | a28f77ac-9bad-11eb-a8a2-19ed5c03f8d3 |
| 2 | lu_tax_code_template_m40 | Compact Assessment A | Breakthrough | false | false | 2 | 2 | 726054 |
| 3 | 57dabcae-8fcc-11eb-924d-9cd76263cbd0 | Legacy Survey | Conventional | true | true | 3 | 3 | 1204-0009-L |
| 4 | 3012826 | Regional Corridor | High Risk | false | false | 4 | 4 | 209219 |

Research ideas capture the substantive proposals under consideration. Each row has a surrogate `id`, a persistent `idea_id` (e.g., `7731863` for "Composite Series"), and an `idea_title`. The `risk_level` column classifies the proposal's ambition — values in the sample include "High Risk," "Breakthrough," and "Conventional." The boolean flags `is_selected_for_incubator` and `is_selected_for_funding` track the idea's progression through the selection pipeline. The `research_team_id` and `research_theme_id` columns link the idea to its assigned team and thematic area, while `challenge_id` connects it to a broader societal challenge.

**Table `research_teams`**

| id | team_id | team_name | formation_region | is_formed_for_incubator | research_idea_id | event_id |
|---|---|---|---|---|---|---|
| 1 | 4716411 | Integrated Framework A | pilot-formatio-32 | true | 1 | ChIJEctqrYFt5kcRUrBEPR-XXBE |
| 2 | 7441142 | Extended Protocol | extended-formatio-33 | false | 2 | 209230 |
| 3 | IVC20Idet15 | Pilot Programme | integrated-formatio-34 | true | 3 | 69440 |
| 4 | 3158142 | Baseline Standard D | seasonal-formatio-35 | false | 4 | 4793467 |

Research teams represent the human structures assembled to execute ideas. The `team_id` is the persistent identifier (e.g., `4716411` for "Integrated Framework A"), and `team_name` provides the display name. The `formation_region` column codes the geographic or organizational context of the team's creation (e.g., `pilot-formatio-32`). The `is_formed_for_incubator` flag indicates whether the team was assembled specifically for an incubator program. The `research_idea_id` and `event_id` columns link the team to its parent idea and the event where it was convened.

**Table `research_themes`**

| id | theme_id | theme_name | is_disruptive | is_interdisciplinary | event_id | research_idea_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 4447020 | Baseline Series D | true | false | ChIJEctqrYFt5kcRUrBEPR-XXBE | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 9085272 | Distributed Assessment | false | true | 209230 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 13219 | Adaptive Survey | true | false | 69440 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | d02c82f0-8fb3-11eb-924d-9cd76263cbd0 | Primary Corridor A | false | true | 4793467 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Research themes define the intellectual categories under which ideas and events are organized. The `theme_id` is the persistent identifier (e.g., `4447020` for "Baseline Series D"), and `theme_name` provides the display label. The boolean flags `is_disruptive` and `is_interdisciplinary` characterize the theme's nature — "Baseline Series D" is disruptive but not interdisciplinary, while "Distributed Assessment" is interdisciplinary but not disruptive. The `event_id` and `research_idea_id` columns link the theme to its associated event and idea, and `created_at` / `updated_at` track the theme's lifecycle.

**Table `societal_challenges`**

| challenge_id | challenge_name | is_policy_relevant | research_idea_id |
|---|---|---|---|
| a28f77ac-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Initiative A | false | 1 |
| 726054 | Composite Model | true | 2 |
| 1204-0009-L | Compact Cluster | false | 3 |
| 209219 | Legacy Review D | true | 4 |

Societal challenges represent the high-level problems that research ideas aim to address. Challenges are identified by codes such as `a28f77ac-9bad-11eb-a8a2-19ed5c03f8d3` and `1204-0009-L`, which follow various naming conventions including UUIDs and structured codes.

**Table `countries`**

| country_id | country_code | country_name | has_partner | has_local_network | partner_organization_id | has_local_network_established_by_partner_organization_id |
|---|---|---|---|---|---|---|
| 1 | 727051 | Pilot Assessment | true | false | 1 | 1 |
| 2 | select | Baseline Survey | false | true | 2 | 2 |
| 3 | 5f9467a0-8fcd-11eb-924d-9cd76263cbd0 | Distributed Corridor A | true | false | 3 | 3 |
| 4 | 8843764 | Adaptive Series | false | true | 4 | 4 |

Countries provide the geographic grounding for partner organizations. The `country_id` serves as the primary key, and `country_code` stores the geographic or administrative code (e.g., `727051`, `8843764`).

## Relational Bridges

The ecosystem connects researchers to events and teams through two junction tables that resolve many-to-many relationships.

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

The `events_researchers` table records which researchers participated in which events. Each row links a `researcher_id` to an `event_id`, enabling the system to track attendance, contribution, and eligibility across the event calendar.

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

The `teams_researchers` table records team membership. Each row links a `researcher_id` to a `team_id`, allowing the system to determine which researchers belong to which teams and to aggregate team composition for reporting and funding decisions.

## Analytical Views

The system provides a suite of views that join base tables to answer specific operational questions. Each view is described below with its purpose and representative data.

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

This view joins researchers to their associated events, answering the question: "Which researchers are linked to which events?" A representative row shows Rebecca Hall (`researcher_id` 89419) linked to the "Composite Review" event (`ChIJEctqrYFt5kcRUrBEPR-XXBE`), a Lab Surfing Workshop held in the North and Irish Sea region that is funded. The view surfaces the researcher's funding status alongside the event's funding status, enabling quick cross-referencing of eligibility.

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

This view connects researchers to their assigned teams, answering: "Which researchers belong to which teams?" Brianna Mejia (`researcher_id` 2618557) appears in the "Extended Protocol" team (`team_id` 7441142), a team that was not formed for an incubator and is associated with the "Compact Initiative A" event. The view surfaces the team's formation region and the researcher's current affiliation side by side.

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

This view links researchers to their research ideas, answering: "Which researchers are associated with which proposals?" Desiree Cain (`researcher_id` 9736892) is linked to the "Legacy Survey" idea (`idea_id` 57dabcae-8fcc-11eb-924d-9cd76263cbd0), which carries a "Conventional" risk level and has been selected for both incubator and funding. The view surfaces the idea's risk classification alongside the researcher's PhD award date, allowing reviewers to assess experience against proposal ambition.

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

This view joins events to their partner organizations, answering: "Which organizations are associated with which events?" The "Composite Review" event (`ChIJEctqrYFt5kcRUrBEPR-XXBE`) is linked to the "Extended Model" organization (`partner_organization_id` 1), a university that serves as the coordinator (`is_coordinator` = true) but not the originator. The view surfaces the organization type and coordination role alongside the event's location and funding status.

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

This view provides a detailed snapshot of researchers within the context of their events, answering: "Who are the researchers involved in each event, and what are their qualifications?" The view combines researcher demographics (PhD date, affiliation) with event metadata (type, region, funding), enabling program managers to assess the composition and seniority of event participants.

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

This view connects events to their research themes, answering: "Which thematic areas are associated with which events?" The "Composite Review" event is linked to the "Baseline Series D" theme (`theme_id` 4447020), which is marked as disruptive but not interdisciplinary. The view surfaces the theme's temporal metadata (`created_at`, `updated_at`) alongside the event's date range, allowing analysts to track how quickly themes are established relative to event scheduling.

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

This self-joining view reveals coordination relationships among partner organizations, answering: "Which organizations coordinate the projects of other organizations?" The "Extended Model" organization (`partner_organization_id` 1) appears as the coordinator of its own project (`coordinates_project_partner_organization_id` = 1), indicating a self-coordination pattern. This view is essential for understanding the governance structure of multi-partner initiatives.

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

This view links partner organizations to the events they participate in, answering: "Which organizations are involved in which events?" The "Pilot Cluster A" organization (`partner_organization_id` 2), a research institution, is linked to the "Compact Initiative A" event (`209230`), a Blue Sky Conference in the Black Sea and South Mediterranean region that is not funded. The view surfaces the organization's originator status alongside the event's funding status, enabling analysis of which types of organizations tend to participate in funded versus unfunded events.

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

This view connects partner organizations to their home countries, answering: "Which countries host which partner organizations?" The "Extended Model" university (`partner_organization_id` 1) is located in country `1` (country code `727051`), while the "Distributed Initiative" university (`partner_organization_id` 4) is in country `4` (country code `8843764`). The view enables geographic distribution analysis of the partner network.

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

This view links research ideas to their assigned teams, answering: "Which teams are executing which ideas?" The "Composite Series" idea (`idea_id` 7731863) is assigned to the "Integrated Framework A" team (`team_id` 4716411), a team formed for an incubator program. The view surfaces the idea's risk level and selection status alongside the team's formation region, enabling assessment of whether high-risk ideas are preferentially assigned to incubator-formed teams.

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

This view connects research ideas to their thematic areas, answering: "Which ideas fall under which themes?" The "Composite Series" idea is classified under the "Baseline Series D" theme (`theme_id` 4447020), which is disruptive but not interdisciplinary. The view surfaces the theme's flags alongside the idea's risk level, enabling analysis of whether disruptive themes attract high-risk proposals.

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

This view links research ideas to the societal challenges they address, answering: "Which ideas target which challenges?" The "Composite Series" idea is linked to challenge `a28f77ac-9bad-11eb-a8a2-19ed5c03f8d3`, while the "Legacy Survey" idea targets challenge `1204-0009-L`. The view surfaces the idea's risk level and selection status alongside the challenge identifier, enabling strategic mapping of the portfolio against national or international challenge priorities.

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

This view provides a detailed roster of researchers within each team, answering: "Who are the members of each team, and what are their qualifications?" The "Integrated Framework A" team (`team_id` 4716411) includes Rebecca Hall (`researcher_id` 89419), who received her PhD in August 2025 and is selected for funding. The view surfaces the researcher's affiliation and email alongside the team's formation region, enabling program managers to assess team composition and contactability.

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

This view connects research teams to their parent ideas, answering: "Which teams are responsible for which ideas?" The "Integrated Framework A" team is responsible for the "Composite Series" idea, which carries a "High Risk" classification and has been selected for both incubator and funding. The view surfaces the idea's risk level and the team's incubator status, enabling analysis of whether incubator teams are preferentially assigned high-risk proposals.

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

This view links research teams to the events where they were convened, answering: "Which teams were assembled for which events?" The "Integrated Framework A" team was formed for the "Composite Review" event (`ChIJEctqrYFt5kcRUrBEPR-XXBE`), a Lab Surfing Workshop in the North and Irish Sea region. The view surfaces the event's type and funding status alongside the team's formation region, enabling analysis of event formats that most frequently spawn incubator teams.

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

This view connects research themes to their associated events, answering: "Which themes are anchored to which events?" The "Baseline Series D" theme (`theme_id` 4447020) is anchored to the "Composite Review" event, while the "Distributed Assessment" theme (`theme_id` 9085272) is anchored to the "Compact Initiative A" event. The view surfaces the theme's disruptive and interdisciplinary flags alongside the event's location and funding status, enabling analysis of how theme characteristics correlate with event geography and financing.

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

This view links research themes to their ideas, answering: "Which ideas are classified under which themes?" The "Baseline Series D" theme contains the "Composite Series" idea, while the "Distributed Assessment" theme contains the "Compact Assessment A" idea. The view surfaces the theme's flags alongside the idea's risk level and selection status, enabling portfolio analysis of how theme characteristics (disruptive vs. interdisciplinary) correlate with idea risk profiles.

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

This view connects societal challenges to the ideas that address them, answering: "Which ideas are responding to which challenges?" Challenge `a28f77ac-9bad-11eb-a8a2-19ed5c03f8d3` is addressed by the "Composite Series" idea, while challenge `726054` is addressed by the "Compact Assessment A" idea. The view surfaces the idea's risk level and funding status alongside the challenge identifier, enabling strategic assessment of how well the idea portfolio aligns with priority challenges.

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

This view links countries to their partner organizations, answering: "Which countries host which partner organizations?" Country `1` hosts the "Extended Model" university, while country `2` hosts the "Pilot Cluster A" research institution. The view surfaces the organization type and coordination status alongside the country code, enabling geographic distribution analysis of the partner network and identification of countries with high-coordinator density.

## Synthesis

The research collaboration ecosystem described here operates through a layered architecture of base records and analytical views. Base tables capture the raw entities — researchers, events, organizations, ideas, teams, themes, challenges, and countries — while junction tables resolve the many-to-many relationships between researchers and events, and between researchers and teams. The view layer then assembles these pieces into operational snapshots: researcher-event pairings for attendance tracking, team-roster views for composition analysis, idea-theme-challenge triads for portfolio alignment, and organization-country pairings for geographic distribution. Together, these structures support the full lifecycle of research collaboration, from idea proposal through team assembly, event execution, and challenge response. The data model is deliberately denormalized in places — for instance, the `researchers` table carries direct pointers to events, teams, and ideas — to support fast analytical queries without requiring complex joins at read time. This trade-off between normalization and query performance is characteristic of systems designed for operational reporting rather than transactional processing, and it reflects the practical needs of program managers who require instant visibility into the state of the research portfolio.