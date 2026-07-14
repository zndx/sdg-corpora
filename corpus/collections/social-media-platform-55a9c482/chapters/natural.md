## The Architecture of Internal Communication

Modern organizations navigate a complex ecosystem of digital channels through which employees exchange information, coordinate work, and maintain professional relationships. The infrastructure supporting these interactions spans formally adopted platforms, informal tools, and the policies that govern their use. Understanding how communication flows through this landscape requires examining not only which platforms exist and which employees use them, but also the nature of the messages themselves, the factors that influence their effectiveness, and the organizational rules that shape behavior. This chapter documents the data model that captures these relationships, drawing on concrete records from a fictional organization to illustrate how each component fits into the broader picture.

The foundation of this model begins with the platforms themselves — the digital channels through which communication occurs.

**Table `social_media_platforms`**

| id | platform_identifier | platform_name | primary_function | adoption_status | usage_frequency | is_enterprise_grade |
|---|---|---|---|---|---|---|
| 1 | PLA-2037 | Baseline Initiative D | messaging | officially_adopted | daily | true |
| 2 | PLA-2041 | Distributed Model | file_sharing | informally_used | weekly | false |
| 3 | PLA-2045 | Adaptive Cluster | video_calling | not_adopted | monthly | true |
| 4 | PLA-2049 | Primary Review A | micro_blogging | officially_adopted | rarely | false |

The `social_media_platforms` table catalogs the tools available to the organization, each identified by a unique platform identifier such as PLA-2037 or PLA-2049. Four platforms appear in the current inventory, ranging from officially adopted messaging services to informally used file-sharing tools. The `primary_function` column distinguishes their core purpose — messaging, file_sharing, video_calling, or micro_blogging — while `adoption_status` records whether the platform is officially_adopted, informally_used, or not_adopted by the organization. The `usage_frequency` field captures how often employees engage with each platform, spanning daily to rarely, and `is_enterprise_grade` indicates whether the platform meets enterprise-level standards. Notably, Baseline Initiative D (PLA-2037) is both officially adopted and enterprise-grade with daily usage, whereas Distributed Model (PLA-2041) is only informally used despite its file-sharing utility.

These platforms do not exist in isolation; they connect to the people who use them.

**Table `employees`**

| employee_id | department | role | years_of_service | digital_literacy_level |
|---|---|---|---|---|
| Norma Fisher | adaptive-departme-89 | pilot-role-20 | 30 | low |
| Tasha Rodriguez | distributed-departme-90 | extended-role-21 | 40 | medium |
| Theodore Mcgrath | baseline-departme-91 | integrated-role-22 | 50 | high |
| Peter Mcdowell | pilot-departme-92 | seasonal-role-23 | 60 | low |

The `employees` table maintains a roster of staff members, each identified by name and characterized by their department, role, tenure, and digital literacy level. Four employees appear in the dataset: Norma Fisher in adaptive-departme-89 with thirty years of service and a low digital literacy level; Tasha Rodriguez in distributed-departme-90 with forty years of service and medium digital literacy; Theodore Mcgrath in baseline-departme-91 with fifty years of service and high digital literacy; and Peter Mcdowell in pilot-departme-92 with sixty years of service and low digital literacy. The `years_of_service` column reveals a wide range of institutional knowledge, from three to sixty years, while `digital_literacy_level` categorizes each employee as low, medium, or high — a factor that may influence platform adoption and communication effectiveness.

The relationship between platforms and employees is captured through a dedicated junction table.

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

The `platforms_employees` table establishes which employees use which platforms, forming a many-to-many relationship. Each row pairs a `social_media_platform_id` with an `employee_id`, creating a clear mapping of platform access. Norma Fisher uses platforms 1 and 4, Tasha Rodriguez uses platforms 1 and 2, Theodore Mcgrath uses platforms 2 and 3, and Peter Mcdowell uses platforms 3 and 4. This distribution shows that each employee has access to exactly two platforms, and each platform is used by exactly two employees, creating a balanced and interconnected network. The platform assignments do not follow departmental boundaries strictly — for instance, Norma Fisher from adaptive-departme-89 uses both Baseline Initiative D (platform 1) and Primary Review A (platform 4), while Tasha Rodriguez from distributed-departme-90 uses both Baseline Initiative D and Distributed Model.

Beyond platform access, the organization tracks actual communication events that occur through these channels.

**Table `internal_communication_events`**

| internal_communication_event_id | event_identifier | timestamp | communication_direction | content_type | is_formal | effectiveness_rating | social_media_platform_id | employee_id |
|---|---|---|---|---|---|---|---|---|
| 100 | EVE-2706 | 2024-07-08T18:18:00 | horizontal | text | false | 4.20 | 1 | Norma Fisher |
| 101 | EVE-2707 | 2025-12-19T01:35:00 | vertical | image | true | 7.40 | 2 | Tasha Rodriguez |
| 102 | EVE-2708 | 2022-05-03T08:52:00 | diagonal | video | false | 10.60 | 3 | Theodore Mcgrath |
| 103 | EVE-2709 | 2023-10-14T15:09:00 | horizontal | file | true | 13.80 | 4 | Peter Mcdowell |

The `internal_communication_events` table records individual instances of workplace communication, each with a unique event identifier such as EVE-2706 or EVE-2709. The `timestamp` field captures when each event occurred, ranging from 2022 to 2025 in the sample data. The `communication_direction` column classifies the flow of information as horizontal (between peers), vertical (up or down the hierarchy), or diagonal (crossing both departmental and hierarchical boundaries). The `content_type` field distinguishes between text, image, video, and file messages, while `is_formal` indicates whether the communication followed formal protocols. The `effectiveness_rating` provides a quantitative measure of how well the communication achieved its purpose, with values ranging from 4.20 to 13.80 in the sample. Each event is linked to a specific platform via `social_media_platform_id` and to the participating employee via `employee_id`. Event EVE-2706, for example, was a horizontal text message sent on 2024-07-08 through platform 1 by Norma Fisher, rated 4.20 in effectiveness and marked as informal.

The factors that influence communication outcomes are cataloged separately.

**Table `communication_factors`**

| id | factor_id | factor_name | category | impact_score | is_positive |
|---|---|---|---|---|---|
| 1 | account_pymes_659 | Legacy Cluster D | convenience | 8.95 | true |
| 2 | default_chart_a_tax_15 | Regional Review | speed | 10.90 | false |
| 3 | 10782176 | Seasonal Initiative | cost | 12.85 | true |
| 4 | 9424924 | Integrated Model A | usability | 14.80 | false |

The `communication_factors` table identifies elements that affect how communication performs, each with a unique `factor_id` such as account_pymes_659 or 9424924. The `factor_name` provides a human-readable label like Legacy Cluster D or Integrated Model A, while `category` classifies the factor's domain — convenience, speed, cost, or usability. The `impact_score` quantifies the factor's influence on communication outcomes, ranging from 8.95 to 14.80 in the sample, and `is_positive` indicates whether the factor's effect is beneficial or detrimental. Legacy Cluster D, categorized under convenience, has an impact score of 8.95 and is marked as positive, whereas Regional Review, categorized under speed, has a higher impact score of 10.90 but is marked as negative.

Organizational governance is captured through a parallel set of records.

**Table `organizational_policies`**

| id | policy_id | policy_title | effective_date | status | scope | created_at |
|---|---|---|---|---|---|---|
| 1 | 5844252 | Baseline Initiative D | 2023-02-14 | draft | all_employees | 2025-01-01 00:14:00 |
| 2 | 10207142 | Distributed Model | 2024-07-25 | active | specific_department | 2025-02-06 03:14:00 |
| 3 | 1562847 | Adaptive Cluster | 2025-12-09 | deprecated | management_only | 2025-03-11 06:14:00 |
| 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Primary Review A | 2022-05-20 | under_review | all_employees | 2025-04-16 09:14:00 |

The `organizational_policies` table documents the rules and guidelines that govern platform use and communication practices. Each policy has a unique `policy_id`, such as 5844252 or ChIJkzsYUIBt5kcRM6_JHx26ONk, and a `policy_title` that often mirrors platform names — Baseline Initiative D, Distributed Model, Adaptive Cluster, and Primary Review A. The `effective_date` records when the policy took effect, `status` indicates its current state (draft, active, deprecated, or under_review), and `scope` defines which employees it applies to — all_employees, specific_department, or management_only. The `created_at` timestamp shows when the policy record was established. Policy 10207142 (Distributed Model) is currently active and applies to a specific department, while policy 1562847 (Adaptive Cluster) is deprecated and was scoped to management_only.

The remaining junction tables extend the relational model to capture additional dimensions of the communication ecosystem.

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

The `platforms_events` table links communication events to the platforms through which they were conducted, reinforcing the platform-event relationship already visible in the events table itself. This explicit linkage supports queries that aggregate events by platform, enabling analysis of which channels carry the most communication volume.

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

The `events_employees` table connects communication events to the employees who participated in them, providing a second pathway to the employee-event relationship. This redundancy in the data model supports flexible querying patterns and ensures referential integrity across different analytical perspectives.

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

The `employees_platforms` table mirrors the `platforms_employees` relationship from the employee side, establishing the same platform-employee associations with the employee identifier as the primary reference. This bidirectional representation simplifies queries that start from either the employee or the platform perspective.

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

The `employees_events` table provides yet another linkage between employees and their communication events, supporting analytical workflows that need to trace an employee's complete communication history across all platforms and event types.

The model also captures how communication factors relate to both platforms and employees.

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

The `factors_platforms` table associates communication factors with specific platforms, allowing analysts to determine which factors most strongly influence the performance of particular channels. A factor like Legacy Cluster D might be particularly relevant to messaging platforms, while Integrated Model A could be more pertinent to file-sharing tools.

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

The `factors_employees` table links communication factors to individual employees, reflecting the idea that different staff members may be influenced by different factors based on their role, department, or digital literacy level. Norma Fisher's low digital literacy might make her more sensitive to usability factors, while Theodore Mcgrath's high digital literacy might make him more responsive to convenience considerations.

Finally, the model documents the relationship between organizational policies and the entities they govern.

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

The `policies_platforms` table maps organizational policies to the platforms they regulate, enabling queries that identify which policies apply to which channels. A policy scoped to all_employees might govern multiple platforms, while a management-only policy might apply to a single specialized platform.

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

The `policies_employees` table connects organizational policies directly to employees, providing a granular view of which rules apply to which individuals. This relationship, combined with the scope field in the policies table, supports compliance auditing and policy impact analysis.

With the base tables established, the model includes a series of views that join these tables to answer specific analytical questions. Each view combines data from multiple sources to provide a comprehensive perspective on a particular aspect of the communication ecosystem.

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

The `v_social_media_platform_employee_detail` view joins the social media platforms table with the platforms-employees junction and the employees table to produce a comprehensive profile of each platform-user pairing. This view answers the question: "What are the characteristics of each employee-platform combination?" Reading a concrete row from this view, one might find that Norma Fisher is associated with Baseline Initiative D (PLA-2037), a messaging platform that is officially adopted, used daily, and enterprise-grade. The view enriches this basic pairing with Norma's department (adaptive-departme-89), her role (pilot-role-20), her thirty years of service, and her low digital literacy level — information that together might suggest she relies on this platform despite limited technical proficiency, perhaps because it is the most widely adopted and familiar tool in the organization.

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

The `v_social_media_platform_internal_communication_event_detail` view connects platforms to communication events, answering: "What kinds of messages flow through each platform?" A representative row might show that Baseline Initiative D (PLA-2037) carried event EVE-2706, a horizontal text message sent on 2024-07-08 with an effectiveness rating of 4.20. This row reveals that the officially adopted, daily-used messaging platform handles informal peer-to-peer text communication, and the relatively low effectiveness rating might indicate that text-based horizontal messages on this channel could benefit from additional structure or formality.

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

The `v_internal_communication_event_social_media_platform` view inverts the previous perspective, starting from events and revealing their platform context. This view answers: "Through which platform did each communication event occur, and what are the platform's characteristics?" A row from this view might show event EVE-2707 — a vertical image message sent on 2025-12-19 with an effectiveness rating of 7.40 — flowing through Distributed Model (PLA-2041), a file-sharing platform that is only informally used and accessed weekly. The higher effectiveness of this vertical image message on an informal platform suggests that certain content types may perform better on less formal channels.

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

The `v_internal_communication_event_employee` view links events to the employees who participated in them, answering: "Which employees are generating which types of communication, and through what channels?" A row might reveal that Tasha Rodriguez sent event EVE-2707, a vertical image message rated 7.40 in effectiveness, through platform 2 (Distributed Model). Given Tasha's forty years of service, extended-role-21 position, and medium digital literacy, this row suggests that experienced employees with moderate technical skills may leverage informal platforms for structured vertical communication.

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

The `v_internal_communication_event_employee_detail` view provides the most comprehensive event-level perspective by joining events with both platform and employee information. This view answers: "What is the complete context of each communication event, including the channel, the participant, and their characteristics?" A row might show event EVE-2708 — a diagonal video message sent on 2022-05-03 with an effectiveness rating of 10.60 — transmitted through platform 3 (Adaptive Cluster) by Theodore Mcgrath, an employee with fifty years of service, an integrated-role-22 position, and high digital literacy. This combination of diagonal direction, video content, and high effectiveness, paired with an experienced and technically proficient employee, suggests that complex cross-boundary communication benefits from rich media channels and skilled users.

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

The `v_employee_social_media_platform_detail` view aggregates from the employee perspective, showing each employee's complete platform portfolio. This view answers: "What platforms does each employee use, and what are the characteristics of those platforms?" A row might show Norma Fisher with access to Baseline Initiative D (PLA-2037, messaging, officially adopted, daily usage, enterprise-grade) and Primary Review A (PLA-2049, micro_blogging, officially adopted, rarely used, non-enterprise). Despite her low digital literacy, Norma has access to two officially adopted platforms, though their usage patterns differ dramatically — one with daily engagement and another with rare use — suggesting that adoption status does not always translate to active usage.

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

The `v_employee_internal_communication_event_detail` view provides a comprehensive employee-centric view of their communication activity, joining employee records with their events and the platforms used. This view answers: "What is the full communication profile of each employee, including the events they've participated in and the channels used?" A row might show Peter Mcdowell, who has sixty years of service, a seasonal-role-23 position, and low digital literacy, with event EVE-2709 — a horizontal file message sent on 2023-10-14, rated 13.80 in effectiveness, sent through platform 4 (Primary Review A). The exceptionally high effectiveness rating for Peter's file-based horizontal communication, despite his low digital literacy, suggests that certain content types (files) and directions (horizontal) may be particularly well-suited to his communication style and the platform he uses.

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

The `v_communication_factor_social_media_platform_detail` view connects communication factors to platforms, answering: "Which factors influence the performance of each platform?" A row might show that Legacy Cluster D (account_pymes_659), a convenience factor with an impact score of 8.95 and a positive effect, is associated with Baseline Initiative D (PLA-2037). This association suggests that the convenience of the messaging platform contributes positively to communication outcomes, which aligns with the platform's daily usage pattern and official adoption status.

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

The `v_communication_factor_employee_detail` view links communication factors to employees, answering: "Which factors are most relevant to each employee's communication experience?" A row might show that Regional Review (default_chart_a_tax_15), a speed factor with an impact score of 10.90 and a negative effect, is associated with Norma Fisher. This negative speed factor affecting an employee with low digital literacy and thirty years of service suggests that speed-related challenges may be particularly impactful for less technologically proficient employees, potentially explaining lower effectiveness ratings in their communications.

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

The `v_organizational_policy_social_media_platform_detail` view maps policies to platforms, answering: "Which organizational policies govern each platform?" A row might show that policy 10207142 (Distributed Model, active, specific_department scope) is associated with platform 2 (Distributed Model, file_sharing, informally_used). The alignment between the policy title and the platform name, combined with the active status and department-specific scope, suggests that the organization has established targeted governance for this informally used file-sharing tool, possibly to bring structure to an otherwise unregulated channel.

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

The `v_organizational_policy_employee_detail` view connects policies to employees, answering: "Which policies apply to each employee?" A row might show that policy 5844252 (Baseline Initiative D, draft status, all_employees scope) applies to Norma Fisher from adaptive-departme-89. The draft status of this policy, which shares its title with the platform Norma uses most actively (Baseline Initiative D, PLA-2037), suggests that the organization is in the process of formalizing governance for its most widely used platform, and the all_employees scope means Norma will be affected regardless of her department or role.

The data model described in this chapter captures the multifaceted nature of organizational communication by maintaining separate but interconnected records for platforms, employees, events, factors, and policies. The junction tables — platforms_employees, platforms_events, events_employees, employees_platforms, employees_events, factors_platforms, factors_employees, policies_platforms, and policies_employees — create a rich web of relationships that support diverse analytical queries. The views synthesize these relationships into actionable perspectives, from platform-user pairings to event-level context to policy compliance tracking. Together, these records provide a comprehensive foundation for understanding how information flows through the organization, who participates in those flows, what factors influence their effectiveness, and which policies govern the entire ecosystem.