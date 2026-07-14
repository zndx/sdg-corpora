The modern enterprise communicates through a layered ecosystem of social media platforms, internal events, and organizational policies, all mediated by employees whose digital literacy and tenure shape how information flows. This domain models that ecosystem as a normalized relational schema: five entity tables capture the core concepts, eight junction tables encode many-to-many relationships, and twelve materialized views reconstruct domain facts for reporting. The schema enforces a clean separation between entity definitions, their cross-references, and the analytical lenses through which managers observe communication patterns.

**Table `social_media_platforms`**

| id | platform_identifier | platform_name | primary_function | adoption_status | usage_frequency | is_enterprise_grade |
|---|---|---|---|---|---|---|
| 1 | PLA-2037 | Baseline Initiative D | messaging | officially_adopted | daily | true |
| 2 | PLA-2041 | Distributed Model | file_sharing | informally_used | weekly | false |
| 3 | PLA-2045 | Adaptive Cluster | video_calling | not_adopted | monthly | true |
| 4 | PLA-2049 | Primary Review A | micro_blogging | officially_adopted | rarely | false |

The `social_media_platforms` table anchors the platform dimension of the domain. Each row represents a distinct tool that employees may use for internal communication, identified by a surrogate `id` and a human-readable `platform_identifier` such as `PLA-2037`. The `platform_name` column carries descriptive labels like "Baseline Initiative D" or "Adaptive Cluster," while `primary_function` classifies the tool's main purpose—`messaging`, `file_sharing`, `video_calling`, or `micro_blogging`. Adoption governance is captured through `adoption_status`, which takes values like `officially_adopted`, `informally_used`, or `not_adopted`, and `usage_frequency`, which records how often the platform is engaged with: `daily`, `weekly`, `monthly`, or `rarely`. The boolean `is_enterprise_grade` flag distinguishes production-grade tools from informal ones. Row 1, for instance, describes a daily-used, officially adopted messaging platform that is enterprise-grade, whereas row 3 describes a monthly-used video-calling tool that is enterprise-grade but not yet adopted.

**Table `internal_communication_events`**

| internal_communication_event_id | event_identifier | timestamp | communication_direction | content_type | is_formal | effectiveness_rating | social_media_platform_id | employee_id |
|---|---|---|---|---|---|---|---|---|
| 100 | EVE-2706 | 2024-07-08T18:18:00 | horizontal | text | false | 4.20 | 1 | Norma Fisher |
| 101 | EVE-2707 | 2025-12-19T01:35:00 | vertical | image | true | 7.40 | 2 | Tasha Rodriguez |
| 102 | EVE-2708 | 2022-05-03T08:52:00 | diagonal | video | false | 10.60 | 3 | Theodore Mcgrath |
| 103 | EVE-2709 | 2023-10-14T15:09:00 | horizontal | file | true | 13.80 | 4 | Peter Mcdowell |

Communication events form the central fact-like table, recording discrete instances of information exchange. Each event carries a surrogate `internal_communication_event_id`, a business key `event_identifier` (e.g., `EVE-2706`), and a `timestamp` such as `2024-07-08T18:18:00`. The `communication_direction` column classifies the flow of information as `horizontal`, `vertical`, or `diagonal`, while `content_type` records the medium: `text`, `image`, `video`, or `file`. The `is_formal` boolean distinguishes structured communications from ad-hoc ones, and `effectiveness_rating` provides a numeric assessment of the event's impact, ranging from 4.20 to 13.80 in the sample data. Crucially, this table embeds two foreign keys—`social_media_platform_id` and `employee_id`—that link each event to the platform on which it occurred and the employee who initiated or participated in it. Event 100, for example, is a horizontal text message sent on platform 1 by Norma Fisher with an effectiveness rating of 4.20, while event 103 is a formal file exchange on platform 4 by Peter Mcdowell rated at 13.80.

**Table `employees`**

| employee_id | department | role | years_of_service | digital_literacy_level |
|---|---|---|---|---|
| Norma Fisher | adaptive-departme-89 | pilot-role-20 | 30 | low |
| Tasha Rodriguez | distributed-departme-90 | extended-role-21 | 40 | medium |
| Theodore Mcgrath | baseline-departme-91 | integrated-role-22 | 50 | high |
| Peter Mcdowell | pilot-departme-92 | seasonal-role-23 | 60 | low |

The `employees` table profiles the human actors in the communication ecosystem. The `employee_id` column stores the employee's full name as a natural key—`Norma Fisher`, `Tasha Rodriguez`, `Theodore Mcgrath`, `Peter Mcdowell`—while `department` assigns each person to a unit such as `adaptive-departme-89` or `pilot-departme-92`. The `role` column captures job classification (`pilot-role-20`, `extended-role-21`, etc.), `years_of_service` records tenure from 30 to 60 years in the sample, and `digital_literacy_level` classifies technical proficiency as `low`, `medium`, or `high`. Theodore Mcgrath, for instance, has 50 years of service, holds an integrated role, and possesses high digital literacy, whereas Norma Fisher has 30 years of service, a pilot role, and low digital literacy.

**Table `communication_factors`**

| id | factor_id | factor_name | category | impact_score | is_positive |
|---|---|---|---|---|---|
| 1 | account_pymes_659 | Legacy Cluster D | convenience | 8.95 | true |
| 2 | default_chart_a_tax_15 | Regional Review | speed | 10.90 | false |
| 3 | 10782176 | Seasonal Initiative | cost | 12.85 | true |
| 4 | 9424924 | Integrated Model A | usability | 14.80 | false |

`communication_factors` captures qualitative influences on communication effectiveness. Each factor is identified by a surrogate `id` and a `factor_id` such as `account_pymes_659` or `default_chart_a_tax_15`. The `factor_name` column provides a human-readable label ("Legacy Cluster D," "Regional Review"), `category` classifies the factor's domain—`convenience`, `speed`, `cost`, or `usability`—and `impact_score` quantifies its influence numerically, ranging from 8.95 to 14.80. The `is_positive` boolean indicates whether the factor's effect is beneficial or detrimental. Factor 2, for example, is a speed-related factor with an impact score of 10.90 that is classified as negative.

**Table `organizational_policies`**

| id | policy_id | policy_title | effective_date | status | scope | created_at |
|---|---|---|---|---|---|---|
| 1 | 5844252 | Baseline Initiative D | 2023-02-14 | draft | all_employees | 2025-01-01 00:14:00 |
| 2 | 10207142 | Distributed Model | 2024-07-25 | active | specific_department | 2025-02-06 03:14:00 |
| 3 | 1562847 | Adaptive Cluster | 2025-12-09 | deprecated | management_only | 2025-03-11 06:14:00 |
| 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Primary Review A | 2022-05-20 | under_review | all_employees | 2025-04-16 09:14:00 |

The `organizational_policies` table codifies governance rules. Each policy has a surrogate `id`, a `policy_id` (which may be numeric like `5844252` or a UUID-like string such as `ChIJkzsYUIBt5kcRM6_JHx26ONk`), and a `policy_title` that often mirrors platform or initiative names. The `effective_date` records when the policy takes effect, `status` tracks its lifecycle stage (`draft`, `active`, `deprecated`, `under_review`), `scope` defines its applicability (`all_employees`, `specific_department`, `management_only`), and `created_at` timestamps its creation. Policy 2, for instance, is an active policy titled "Distributed Model" scoped to a specific department, while policy 3 is a deprecated policy for management only.

The five entity tables above are connected through a network of junction tables that resolve many-to-many relationships. In the raw schema, `internal_communication_events` already embeds `social_media_platform_id` and `employee_id` as foreign keys, directly linking events to their platform and employee contexts. However, the schema also provides explicit junction tables for all pairwise entity combinations, enabling flexible cross-referencing beyond the event-centric model.

**Table `platforms_employees`**

| social_media_platform_id | employee_id |
|---|---|
| 1 | Norma Fisher |
| 1 | Tasha Rodriguez |
| 2 | Tasha Rodriguez |
| 2 | Theodore Mcgrath |
| 3 | Theodore Mcgrath |
| 3 | Peter Mcdowell |
| 4 | Peter Mcdowell |
| 4 | Norma Fisher |

The `platforms_employees` junction table maps which employees use which platforms. It contains two columns—`social_media_platform_id` and `employee_id`—with rows such as (1, "Norma Fisher") and (2, "Tasha Rodriguez"). The sample data shows that Norma Fisher uses platforms 1 and 4, Tasha Rodriguez uses platforms 1 and 2, Theodore Mcgrath uses platforms 2 and 3, and Peter Mcdowell uses platforms 3 and 4. This creates a balanced bipartite graph where each employee is associated with exactly two platforms.

**Table `platforms_events`**

| social_media_platform_id | internal_communication_event_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `platforms_events` table links platforms to communication events, providing an alternative path from platform to event that does not pass through the `internal_communication_events` table's embedded foreign key. This redundancy supports different query patterns and analytical perspectives.

**Table `events_employees`**

| internal_communication_event_id | employee_id |
|---|---|
| 100 | Norma Fisher |
| 100 | Tasha Rodriguez |
| 101 | Tasha Rodriguez |
| 101 | Theodore Mcgrath |
| 102 | Theodore Mcgrath |
| 102 | Peter Mcdowell |
| 103 | Peter Mcdowell |
| 103 | Norma Fisher |

Similarly, `events_employees` connects events to employees independently of the embedded `employee_id` in `internal_communication_events`, enabling event-to-employee joins that can be filtered or aggregated separately.

**Table `employees_platforms`**

| employee_id | social_media_platform_id |
|---|---|
| Norma Fisher | 1 |
| Norma Fisher | 2 |
| Tasha Rodriguez | 2 |
| Tasha Rodriguez | 3 |
| Theodore Mcgrath | 3 |
| Theodore Mcgrath | 4 |
| Peter Mcdowell | 4 |
| Peter Mcdowell | 1 |

The `employees_platforms` table is the inverse of `platforms_employees`, storing the same relationship with columns ordered as `employee_id` and `social_media_platform_id`. This symmetry supports queries that start from the employee side.

**Table `employees_events`**

| employee_id | internal_communication_event_id |
|---|---|
| Norma Fisher | 100 |
| Norma Fisher | 101 |
| Tasha Rodriguez | 101 |
| Tasha Rodriguez | 102 |
| Theodore Mcgrath | 102 |
| Theodore Mcgrath | 103 |
| Peter Mcdowell | 103 |
| Peter Mcdowell | 100 |

The `employees_events` junction mirrors `events_employees`, providing another employee-to-event linkage path.

**Table `factors_platforms`**

| communication_factor_id | social_media_platform_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `factors_platforms` table connects communication factors to social media platforms, encoding which qualitative influences apply to which tools. This relationship is not present in the sample data rows shown, but the table structure supports many-to-many associations between factors and platforms.

**Table `factors_employees`**

| communication_factor_id | employee_id |
|---|---|
| 1 | Norma Fisher |
| 1 | Tasha Rodriguez |
| 2 | Tasha Rodriguez |
| 2 | Theodore Mcgrath |
| 3 | Theodore Mcgrath |
| 3 | Peter Mcdowell |
| 4 | Peter Mcdowell |
| 4 | Norma Fisher |

The `factors_employees` table links communication factors to employees, capturing which factors influence which individuals. Like `factors_platforms`, this junction enables granular analysis of how qualitative factors map to specific people.

**Table `policies_platforms`**

| organizational_policy_id | social_media_platform_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `policies_platforms` junction associates organizational policies with social media platforms, defining which governance rules apply to which tools. This relationship allows policies to be scoped to specific platforms rather than only to employee groups.

**Table `policies_employees`**

| organizational_policy_id | employee_id |
|---|---|
| 1 | Norma Fisher |
| 1 | Tasha Rodriguez |
| 2 | Tasha Rodriguez |
| 2 | Theodore Mcgrath |
| 3 | Theodore Mcgrath |
| 3 | Peter Mcdowell |
| 4 | Peter Mcdowell |
| 4 | Norma Fisher |

The `policies_employees` table connects organizational policies to employees, specifying which policies govern which individuals. Combined with `policies_platforms`, this creates a two-dimensional governance matrix across people and tools.

With the base tables and junction tables established, the schema materializes twelve views that reconstruct domain facts by joining entity tables through their foreign keys. Each view answers a specific analytical question by denormalizing the normalized structure.

**View `v_social_media_platform_employee_detail`**

```sql
CREATE VIEW v_social_media_platform_employee_detail AS
SELECT a.id, a.platform_identifier, a.platform_name, b.employee_id AS employee_employee_id, b.department AS employee_department, b.role AS employee_role
FROM social_media_platforms a
  JOIN platforms_employees j ON j.social_media_platform_id = a.id
  JOIN employees b ON b.employee_id = j.employee_id;
```

| id | platform_identifier | platform_name | employee_employee_id | employee_department | employee_role |
|---|---|---|---|---|---|
| 1 | PLA-2037 | Baseline Initiative D | Norma Fisher | adaptive-departme-89 | pilot-role-20 |
| 1 | PLA-2037 | Baseline Initiative D | Tasha Rodriguez | distributed-departme-90 | extended-role-21 |
| 2 | PLA-2041 | Distributed Model | Tasha Rodriguez | distributed-departme-90 | extended-role-21 |
| 2 | PLA-2041 | Distributed Model | Theodore Mcgrath | baseline-departme-91 | integrated-role-22 |
| 3 | PLA-2045 | Adaptive Cluster | Theodore Mcgrath | baseline-departme-91 | integrated-role-22 |
| 3 | PLA-2045 | Adaptive Cluster | Peter Mcdowell | pilot-departme-92 | seasonal-role-23 |
| 4 | PLA-2049 | Primary Review A | Peter Mcdowell | pilot-departme-92 | seasonal-role-23 |
| 4 | PLA-2049 | Primary Review A | Norma Fisher | adaptive-departme-89 | pilot-role-20 |

This view joins `social_media_platforms` with `employees` through the `platforms_employees` junction, answering the question: "Which employees are associated with which platforms?" The result presents each platform alongside its linked employees, enabling managers to see the human footprint of each tool. For example, the view would show that platform 1 ("Baseline Initiative D," a messaging tool) is associated with Norma Fisher and Tasha Rodriguez, while platform 4 ("Primary Review A," micro-blogging) is linked to Peter Mcdowell and Norma Fisher.

**View `v_social_media_platform_internal_communication_event_detail`**

```sql
CREATE VIEW v_social_media_platform_internal_communication_event_detail AS
SELECT a.id, a.platform_identifier, a.platform_name, b.internal_communication_event_id AS event_internal_communication_event_id, b.event_identifier AS event_event_identifier, b.timestamp AS event_timestamp
FROM social_media_platforms a
  JOIN platforms_events j ON j.social_media_platform_id = a.id
  JOIN internal_communication_events b ON b.internal_communication_event_id = j.internal_communication_event_id;
```

| id | platform_identifier | platform_name | event_internal_communication_event_id | event_event_identifier | event_timestamp |
|---|---|---|---|---|---|
| 1 | PLA-2037 | Baseline Initiative D | 100 | EVE-2706 | 2024-07-08T18:18:00 |
| 1 | PLA-2037 | Baseline Initiative D | 101 | EVE-2707 | 2025-12-19T01:35:00 |
| 2 | PLA-2041 | Distributed Model | 101 | EVE-2707 | 2025-12-19T01:35:00 |
| 2 | PLA-2041 | Distributed Model | 102 | EVE-2708 | 2022-05-03T08:52:00 |
| 3 | PLA-2045 | Adaptive Cluster | 102 | EVE-2708 | 2022-05-03T08:52:00 |
| 3 | PLA-2045 | Adaptive Cluster | 103 | EVE-2709 | 2023-10-14T15:09:00 |
| 4 | PLA-2049 | Primary Review A | 103 | EVE-2709 | 2023-10-14T15:09:00 |
| 4 | PLA-2049 | Primary Review A | 100 | EVE-2706 | 2024-07-08T18:18:00 |

This view joins `social_media_platforms` with `internal_communication_events`, answering: "What communication events occurred on each platform?" The result enriches each event with the platform's descriptive attributes. Row 100 appears with platform details showing it was a horizontal text message on "Baseline Initiative D," while row 103 appears with platform 4's details, revealing it was a formal file exchange on "Primary Review A."

**View `v_internal_communication_event_social_media_platform`**

```sql
CREATE VIEW v_internal_communication_event_social_media_platform AS
SELECT a.internal_communication_event_id, a.event_identifier, a.timestamp, a.communication_direction, b.id AS platform_id, b.platform_identifier AS platform_platform_identifier, b.platform_name AS platform_platform_name
FROM internal_communication_events a JOIN social_media_platforms b ON a.social_media_platform_id = b.id;
```

| internal_communication_event_id | event_identifier | timestamp | communication_direction | platform_id | platform_platform_identifier | platform_platform_name |
|---|---|---|---|---|---|---|
| 100 | EVE-2706 | 2024-07-08T18:18:00 | horizontal | 1 | PLA-2037 | Baseline Initiative D |
| 101 | EVE-2707 | 2025-12-19T01:35:00 | vertical | 2 | PLA-2041 | Distributed Model |
| 102 | EVE-2708 | 2022-05-03T08:52:00 | diagonal | 3 | PLA-2045 | Adaptive Cluster |
| 103 | EVE-2709 | 2023-10-14T15:09:00 | horizontal | 4 | PLA-2049 | Primary Review A |

This view joins `internal_communication_events` with `social_media_platforms`, answering: "Which platform was used for each communication event?" The perspective is event-centric, with each event row carrying the platform's name, function, and adoption status. Event 101, for instance, would show that a vertical image message was sent on platform 2 ("Distributed Model," a file-sharing tool that is informally used).

**View `v_internal_communication_event_employee`**

```sql
CREATE VIEW v_internal_communication_event_employee AS
SELECT a.internal_communication_event_id, a.event_identifier, a.timestamp, a.communication_direction, b.employee_id AS employee_employee_id, b.department AS employee_department, b.role AS employee_role
FROM internal_communication_events a JOIN employees b ON a.employee_id = b.employee_id;
```

| internal_communication_event_id | event_identifier | timestamp | communication_direction | employee_employee_id | employee_department | employee_role |
|---|---|---|---|---|---|---|
| 100 | EVE-2706 | 2024-07-08T18:18:00 | horizontal | Norma Fisher | adaptive-departme-89 | pilot-role-20 |
| 101 | EVE-2707 | 2025-12-19T01:35:00 | vertical | Tasha Rodriguez | distributed-departme-90 | extended-role-21 |
| 102 | EVE-2708 | 2022-05-03T08:52:00 | diagonal | Theodore Mcgrath | baseline-departme-91 | integrated-role-22 |
| 103 | EVE-2709 | 2023-10-14T15:09:00 | horizontal | Peter Mcdowell | pilot-departme-92 | seasonal-role-23 |

This view joins `internal_communication_events` with `employees`, answering: "Which employee was involved in each communication event?" The result pairs each event with the employee's department, role, tenure, and digital literacy. Event 102 would show that Theodore Mcgrath, a high-literacy employee with 50 years of service in the baseline department, participated in a diagonal video communication.

**View `v_internal_communication_event_employee_detail`**

```sql
CREATE VIEW v_internal_communication_event_employee_detail AS
SELECT a.internal_communication_event_id, a.event_identifier, a.timestamp, b.employee_id AS employee_employee_id, b.department AS employee_department, b.role AS employee_role
FROM internal_communication_events a
  JOIN events_employees j ON j.internal_communication_event_id = a.internal_communication_event_id
  JOIN employees b ON b.employee_id = j.employee_id;
```

| internal_communication_event_id | event_identifier | timestamp | employee_employee_id | employee_department | employee_role |
|---|---|---|---|---|---|
| 100 | EVE-2706 | 2024-07-08T18:18:00 | Norma Fisher | adaptive-departme-89 | pilot-role-20 |
| 100 | EVE-2706 | 2024-07-08T18:18:00 | Tasha Rodriguez | distributed-departme-90 | extended-role-21 |
| 101 | EVE-2707 | 2025-12-19T01:35:00 | Tasha Rodriguez | distributed-departme-90 | extended-role-21 |
| 101 | EVE-2707 | 2025-12-19T01:35:00 | Theodore Mcgrath | baseline-departme-91 | integrated-role-22 |
| 102 | EVE-2708 | 2022-05-03T08:52:00 | Theodore Mcgrath | baseline-departme-91 | integrated-role-22 |
| 102 | EVE-2708 | 2022-05-03T08:52:00 | Peter Mcdowell | pilot-departme-92 | seasonal-role-23 |
| 103 | EVE-2709 | 2023-10-14T15:09:00 | Peter Mcdowell | pilot-departme-92 | seasonal-role-23 |
| 103 | EVE-2709 | 2023-10-14T15:09:00 | Norma Fisher | adaptive-departme-89 | pilot-role-20 |

This view joins `internal_communication_events` with `employees`, providing a detailed event-to-employee mapping enriched with employee attributes. It answers: "What are the full profiles of employees involved in each communication event?" Event 100 would appear with Norma Fisher's full profile—adaptive department, pilot role, 30 years of service, low digital literacy—alongside the event's timestamp, direction, content type, and effectiveness rating of 4.20.

**View `v_employee_social_media_platform_detail`**

```sql
CREATE VIEW v_employee_social_media_platform_detail AS
SELECT a.employee_id, a.department, a.role, b.id AS platform_id, b.platform_identifier AS platform_platform_identifier, b.platform_name AS platform_platform_name
FROM employees a
  JOIN employees_platforms j ON j.employee_id = a.employee_id
  JOIN social_media_platforms b ON b.id = j.social_media_platform_id;
```

| employee_id | department | role | platform_id | platform_platform_identifier | platform_platform_name |
|---|---|---|---|---|---|
| Norma Fisher | adaptive-departme-89 | pilot-role-20 | 1 | PLA-2037 | Baseline Initiative D |
| Norma Fisher | adaptive-departme-89 | pilot-role-20 | 2 | PLA-2041 | Distributed Model |
| Tasha Rodriguez | distributed-departme-90 | extended-role-21 | 2 | PLA-2041 | Distributed Model |
| Tasha Rodriguez | distributed-departme-90 | extended-role-21 | 3 | PLA-2045 | Adaptive Cluster |
| Theodore Mcgrath | baseline-departme-91 | integrated-role-22 | 3 | PLA-2045 | Adaptive Cluster |
| Theodore Mcgrath | baseline-departme-91 | integrated-role-22 | 4 | PLA-2049 | Primary Review A |
| Peter Mcdowell | pilot-departme-92 | seasonal-role-23 | 4 | PLA-2049 | Primary Review A |
| Peter Mcdowell | pilot-departme-92 | seasonal-role-23 | 1 | PLA-2037 | Baseline Initiative D |

This view joins `employees` with `social_media_platforms` through the `employees_platforms` junction, answering: "What platforms does each employee use, and what are the platform characteristics?" The result presents each employee alongside their associated platforms' names, functions, adoption statuses, and enterprise-grade flags. Norma Fisher would appear with platforms 1 and 4, showing she uses both a daily messaging tool and a rarely-used micro-blogging platform.

**View `v_employee_internal_communication_event_detail`**

```sql
CREATE VIEW v_employee_internal_communication_event_detail AS
SELECT a.employee_id, a.department, a.role, b.internal_communication_event_id AS event_internal_communication_event_id, b.event_identifier AS event_event_identifier, b.timestamp AS event_timestamp
FROM employees a
  JOIN employees_events j ON j.employee_id = a.employee_id
  JOIN internal_communication_events b ON b.internal_communication_event_id = j.internal_communication_event_id;
```

| employee_id | department | role | event_internal_communication_event_id | event_event_identifier | event_timestamp |
|---|---|---|---|---|---|
| Norma Fisher | adaptive-departme-89 | pilot-role-20 | 100 | EVE-2706 | 2024-07-08T18:18:00 |
| Norma Fisher | adaptive-departme-89 | pilot-role-20 | 101 | EVE-2707 | 2025-12-19T01:35:00 |
| Tasha Rodriguez | distributed-departme-90 | extended-role-21 | 101 | EVE-2707 | 2025-12-19T01:35:00 |
| Tasha Rodriguez | distributed-departme-90 | extended-role-21 | 102 | EVE-2708 | 2022-05-03T08:52:00 |
| Theodore Mcgrath | baseline-departme-91 | integrated-role-22 | 102 | EVE-2708 | 2022-05-03T08:52:00 |
| Theodore Mcgrath | baseline-departme-91 | integrated-role-22 | 103 | EVE-2709 | 2023-10-14T15:09:00 |
| Peter Mcdowell | pilot-departme-92 | seasonal-role-23 | 103 | EVE-2709 | 2023-10-14T15:09:00 |
| Peter Mcdowell | pilot-departme-92 | seasonal-role-23 | 100 | EVE-2706 | 2024-07-08T18:18:00 |

This view joins `employees` with `internal_communication_events`, answering: "What communication events has each employee participated in, with full event and employee context?" The result pairs each employee's department, role, and literacy level with their events' directions, content types, and effectiveness ratings. Peter Mcdowell would appear with event 103, a formal file exchange rated at 13.80, alongside his profile of 60 years of service and low digital literacy.

**View `v_communication_factor_social_media_platform_detail`**

```sql
CREATE VIEW v_communication_factor_social_media_platform_detail AS
SELECT a.id, a.factor_id, a.factor_name, b.id AS platform_id, b.platform_identifier AS platform_platform_identifier, b.platform_name AS platform_platform_name
FROM communication_factors a
  JOIN factors_platforms j ON j.communication_factor_id = a.id
  JOIN social_media_platforms b ON b.id = j.social_media_platform_id;
```

| id | factor_id | factor_name | platform_id | platform_platform_identifier | platform_platform_name |
|---|---|---|---|---|---|
| 1 | account_pymes_659 | Legacy Cluster D | 1 | PLA-2037 | Baseline Initiative D |
| 1 | account_pymes_659 | Legacy Cluster D | 2 | PLA-2041 | Distributed Model |
| 2 | default_chart_a_tax_15 | Regional Review | 2 | PLA-2041 | Distributed Model |
| 2 | default_chart_a_tax_15 | Regional Review | 3 | PLA-2045 | Adaptive Cluster |
| 3 | 10782176 | Seasonal Initiative | 3 | PLA-2045 | Adaptive Cluster |
| 3 | 10782176 | Seasonal Initiative | 4 | PLA-2049 | Primary Review A |
| 4 | 9424924 | Integrated Model A | 4 | PLA-2049 | Primary Review A |
| 4 | 9424924 | Integrated Model A | 1 | PLA-2037 | Baseline Initiative D |

This view joins `communication_factors` with `social_media_platforms` through the `factors_platforms` junction, answering: "Which communication factors influence which platforms?" The result presents each platform alongside the qualitative factors that affect it, including the factor's category, impact score, and whether its effect is positive. A platform like "Baseline Initiative D" might appear with factor 1 ("Legacy Cluster D," a convenience factor with an 8.95 impact score that is positive).

**View `v_communication_factor_employee_detail`**

```sql
CREATE VIEW v_communication_factor_employee_detail AS
SELECT a.id, a.factor_id, a.factor_name, b.employee_id AS employee_employee_id, b.department AS employee_department, b.role AS employee_role
FROM communication_factors a
  JOIN factors_employees j ON j.communication_factor_id = a.id
  JOIN employees b ON b.employee_id = j.employee_id;
```

| id | factor_id | factor_name | employee_employee_id | employee_department | employee_role |
|---|---|---|---|---|---|
| 1 | account_pymes_659 | Legacy Cluster D | Norma Fisher | adaptive-departme-89 | pilot-role-20 |
| 1 | account_pymes_659 | Legacy Cluster D | Tasha Rodriguez | distributed-departme-90 | extended-role-21 |
| 2 | default_chart_a_tax_15 | Regional Review | Tasha Rodriguez | distributed-departme-90 | extended-role-21 |
| 2 | default_chart_a_tax_15 | Regional Review | Theodore Mcgrath | baseline-departme-91 | integrated-role-22 |
| 3 | 10782176 | Seasonal Initiative | Theodore Mcgrath | baseline-departme-91 | integrated-role-22 |
| 3 | 10782176 | Seasonal Initiative | Peter Mcdowell | pilot-departme-92 | seasonal-role-23 |
| 4 | 9424924 | Integrated Model A | Peter Mcdowell | pilot-departme-92 | seasonal-role-23 |
| 4 | 9424924 | Integrated Model A | Norma Fisher | adaptive-departme-89 | pilot-role-20 |

This view joins `communication_factors` with `employees` through the `factors_employees` junction, answering: "Which communication factors influence which employees?" The result pairs each employee with the factors affecting their communication, including the factor's category and impact score. An employee like Theodore Mcgrath might appear with factor 3 ("Seasonal Initiative," a cost factor with a 12.85 impact score that is positive).

**View `v_organizational_policy_social_media_platform_detail`**

```sql
CREATE VIEW v_organizational_policy_social_media_platform_detail AS
SELECT a.id, a.policy_id, a.policy_title, b.id AS platform_id, b.platform_identifier AS platform_platform_identifier, b.platform_name AS platform_platform_name
FROM organizational_policies a
  JOIN policies_platforms j ON j.organizational_policy_id = a.id
  JOIN social_media_platforms b ON b.id = j.social_media_platform_id;
```

| id | policy_id | policy_title | platform_id | platform_platform_identifier | platform_platform_name |
|---|---|---|---|---|---|
| 1 | 5844252 | Baseline Initiative D | 1 | PLA-2037 | Baseline Initiative D |
| 1 | 5844252 | Baseline Initiative D | 2 | PLA-2041 | Distributed Model |
| 2 | 10207142 | Distributed Model | 2 | PLA-2041 | Distributed Model |
| 2 | 10207142 | Distributed Model | 3 | PLA-2045 | Adaptive Cluster |
| 3 | 1562847 | Adaptive Cluster | 3 | PLA-2045 | Adaptive Cluster |
| 3 | 1562847 | Adaptive Cluster | 4 | PLA-2049 | Primary Review A |
| 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Primary Review A | 4 | PLA-2049 | Primary Review A |
| 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Primary Review A | 1 | PLA-2037 | Baseline Initiative D |

This view joins `organizational_policies` with `social_media_platforms` through the `policies_platforms` junction, answering: "Which organizational policies apply to which platforms?" The result presents each platform alongside the policies governing it, including the policy's status, scope, and effective date. Platform 2 ("Distributed Model") might appear with policy 2 ("Distributed Model," an active policy scoped to a specific department).

**View `v_organizational_policy_employee_detail`**

```sql
CREATE VIEW v_organizational_policy_employee_detail AS
SELECT a.id, a.policy_id, a.policy_title, b.employee_id AS employee_employee_id, b.department AS employee_department, b.role AS employee_role
FROM organizational_policies a
  JOIN policies_employees j ON j.organizational_policy_id = a.id
  JOIN employees b ON b.employee_id = j.employee_id;
```

| id | policy_id | policy_title | employee_employee_id | employee_department | employee_role |
|---|---|---|---|---|---|
| 1 | 5844252 | Baseline Initiative D | Norma Fisher | adaptive-departme-89 | pilot-role-20 |
| 1 | 5844252 | Baseline Initiative D | Tasha Rodriguez | distributed-departme-90 | extended-role-21 |
| 2 | 10207142 | Distributed Model | Tasha Rodriguez | distributed-departme-90 | extended-role-21 |
| 2 | 10207142 | Distributed Model | Theodore Mcgrath | baseline-departme-91 | integrated-role-22 |
| 3 | 1562847 | Adaptive Cluster | Theodore Mcgrath | baseline-departme-91 | integrated-role-22 |
| 3 | 1562847 | Adaptive Cluster | Peter Mcdowell | pilot-departme-92 | seasonal-role-23 |
| 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Primary Review A | Peter Mcdowell | pilot-departme-92 | seasonal-role-23 |
| 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Primary Review A | Norma Fisher | adaptive-departme-89 | pilot-role-20 |

This view joins `organizational_policies` with `employees` through the `policies_employees` junction, answering: "Which organizational policies govern which employees?" The result pairs each employee with the policies that apply to them, including the policy's scope and status. Norma Fisher might appear with policy 1 ("Baseline Initiative D," a draft policy scoped to all employees).

The schema's design reflects a deliberate separation between entity definitions, relationship encodings, and analytical projections. The five base tables capture the domain's core concepts with minimal redundancy, while the eight junction tables provide flexible many-to-many bridges that support diverse query patterns. The twelve views materialize common analytical joins, allowing managers to reconstruct domain facts—such as which employees use which platforms, what events occurred on which tools, and which policies govern which people—without writing complex join logic. This architecture balances normalization for data integrity with denormalized views for analytical convenience, ensuring that the relational model faithfully represents the communication ecosystem while remaining accessible to business users.