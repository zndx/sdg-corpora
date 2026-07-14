The Universal Periodic Review (UPR) domain captures the lifecycle of human-rights review engagements: a state undergoes a review cycle, receives recommendations, and those recommendations target vulnerable groups whose rights are constrained by documented barriers. Non-governmental organizations (NGOs) form coalitions to submit evidence and track which recommendations they support. The relational schema models this ecosystem through seven entity tables, four junction tables that resolve many-to-many relationships, and twenty materialized views that reassemble the normalized facts into domain-level perspectives. Every table carries a surrogate primary key alongside a business identifier, and foreign keys propagate the cardinality-bounded relationships from the ontology into the columnar layer.

## Review Cycles and Recommendations

The review cycle is the temporal anchor of the domain. Each cycle represents a discrete UPR session in which a state is examined.

**Table `u_p_r_review_cycles`**

| id | cycle_id | session_date | reviewing_state | review_status | review_outcome | state_id |
|---|---|---|---|---|---|---|
| 100 | 5082976 | 2022-09-11T20:24:00 | extended-reviewin-75 | completed | adaptive-review-59 | 100 |
| 101 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-22T03:41:00 | integrated-reviewin-76 | ongoing | distributed-review-60 | 101 |
| 102 | 2618560 | 2024-07-06T10:58:00 | seasonal-reviewin-77 | scheduled | baseline-review-61 | 102 |
| 103 | 2839528 | 2025-12-17T17:15:00 | regional-reviewin-78 | completed | pilot-review-62 | 103 |

The table `u_p_r_review_cycles` stores one row per session. The surrogate `id` (e.g. `100`, `101`) is the internal primary key; the `cycle_id` column holds the external identifier such as `5082976` or the UUID `27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3`. The `session_date` records when the review took place, while `reviewing_state` describes the type of review (e.g. `extended-reviewin-75`, `integrated-reviewin-76`). The `review_status` enum (`completed`, `ongoing`, `scheduled`) and `review_outcome` enum (`adaptive-review-59`, `distributed-review-60`, `baseline-review-61`, `pilot-review-62`) capture the lifecycle state. A foreign key `state_id` links the cycle to the state being reviewed.

Recommendations are the actionable outputs of a review cycle.

**Table `u_p_r_recommendations`**

| id | recommendation_id | recommendation_text | topic_area | acceptance_status | priority_level | u_p_r_review_cycle_id | state_id | vulnerable_group_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 3158134 | pilot-recommen-20 | education | accepted | high | 100 | 100 | 100 |
| 2 | 4649 | extended-recommen-21 | health | noted | medium | 101 | 101 | 101 |
| 3 | 9fff478e-9bac-11eb-a8a2-19ed5c03f8d3 | integrated-recommen-22 | indigenous_rights | rejected | low | 102 | 102 | 102 |
| 4 | 89820 | seasonal-recommen-23 | gender_based_violence | accepted | high | 103 | 103 | 103 |

The `u_p_r_recommendations` table holds one row per recommendation. Its surrogate `id` (1, 2, 3, 4) is the primary key; `recommendation_id` carries the business identifier (`3158134`, `4649`, `9fff478e-9bac-11eb-a8a2-19ed5c03f8d3`). The `recommendation_text` column stores the short label (e.g. `pilot-recommen-20`, `extended-recommen-21`). The `topic_area` enum (`education`, `health`, `indigenous_rights`, `gender_based_violence`) classifies the subject. `acceptance_status` (`accepted`, `noted`, `rejected`) and `priority_level` (`high`, `medium`, `low`) are the recommendation's disposition attributes. Three foreign keys anchor the recommendation to its context: `u_p_r_review_cycle_id` points to the originating cycle, `state_id` to the recommending state, and `vulnerable_group_id` to the group the recommendation targets.

## States and Vulnerable Groups

States are the sovereign entities under review.

**Table `states`**

| id | state_code | state_name | government_type | hrc_membership_status | last_review_date | u_p_r_review_cycle_id | vulnerable_group_id |
|---|---|---|---|---|---|---|---|
| 100 | 17788643 | Composite Protocol | extended-governme-81 | active | 2022-09-03T08:24:00 | 100 | 100 |
| 101 | 8350031 | Compact Programme A | integrated-governme-82 | suspended | 2023-02-14T15:41:00 | 101 | 101 |
| 102 | 790483 | Legacy Standard | seasonal-governme-83 | withdrawn | 2024-07-25T22:58:00 | 102 | 102 |
| 103 | 8387549 | Regional Framework | regional-governme-84 | active | 2025-12-09T05:15:00 | 103 | 103 |

The `states` table stores state metadata. The surrogate `id` (100–103) is the primary key. `state_code` holds a numeric code (`17788643`, `8350031`), while `state_name` carries a descriptive label (`Composite Protocol`, `Compact Programme A`, `Legacy Standard`, `Regional Framework`). The `government_type` (`extended-governme-81`, `integrated-governme-82`, `seasonal-governme-83`, `regional-governme-84`) and `hrc_membership_status` (`active`, `suspended`, `withdrawn`) describe governance attributes. `last_review_date` records the most recent review timestamp. The table also carries `u_p_r_review_cycle_id` and `vulnerable_group_id` as foreign keys, linking each state to its active cycle and to a vulnerable group.

Vulnerable groups are the populations that recommendations and barriers reference.

**Table `vulnerable_groups`**

| id | group_identifier | group_name | risk_category | geographic_distribution | population_size | u_p_r_recommendation_id | state_id |
|---|---|---|---|---|---|---|---|
| 100 | GRO-2079 | Baseline Corridor D | education_disparity | rural | 35 | 1 | 100 |
| 101 | GRO-2081 | Distributed Series | healthcare_access | urban | 42 | 2 | 101 |
| 102 | GRO-2083 | Adaptive Assessment | gender_based_violence | mixed | 49 | 3 | 102 |
| 103 | GRO-2085 | Primary Survey A | discrimination | rural | 56 | 4 | 103 |

The `vulnerable_groups` table stores group profiles. The surrogate `id` (100–103) is the primary key. `group_identifier` holds the business code (`GRO-2079`, `GRO-2081`, `GRO-2083`, `GRO-2085`), and `group_name` carries the label (`Baseline Corridor D`, `Distributed Series`, `Adaptive Assessment`, `Primary Survey A`). The `risk_category` (`education_disparity`, `healthcare_access`, `gender_based_violence`, `discrimination`), `geographic_distribution` (`rural`, `urban`, `mixed`), and `population_size` (35, 42, 49, 56) are descriptive attributes. Foreign keys `u_p_r_recommendation_id` and `state_id` link each group to a recommendation and a state.

## Rights Barriers

Rights barriers document the obstacles that prevent vulnerable groups from enjoying their rights.

**Table `rights_barriers`**

| rights_barrier_id | barrier_id | barrier_type | severity_level | documented_evidence | mitigation_status | vulnerable_group_id | u_p_r_recommendation_id | state_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 9125631 | funding_disparity | critical | extended-document-51 | unaddressed | 100 | 1 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 6969441 | discrimination | high | integrated-document-52 | partially_addressed | 101 | 2 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | gd_taxc_1122 | violence | medium | seasonal-document-53 | fully_addressed | 102 | 3 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 790474 | isolation | low | regional-document-54 | unaddressed | 103 | 4 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `rights_barriers` table stores one row per documented barrier. The surrogate `rights_barrier_id` (100–103) is the primary key. `barrier_id` holds the business identifier (`9125631`, `6969441`, `gd_taxc_1122`, `790474`). The `barrier_type` enum (`funding_disparity`, `discrimination`, `violence`, `isolation`) classifies the obstacle. `severity_level` (`critical`, `high`, `medium`, `low`) and `mitigation_status` (`unaddressed`, `partially_addressed`, `fully_addressed`) capture the barrier's impact and remediation state. `documented_evidence` stores a reference label (`extended-document-51`, `integrated-document-52`, `seasonal-document-53`, `regional-document-54`). Timestamps `created_at` and `updated_at` track the record's lifecycle. Three foreign keys (`vulnerable_group_id`, `u_p_r_recommendation_id`, `state_id`) link each barrier to its contextual entities.

## NGO Coalitions and Members

NGO coalitions represent collaborative submissions to the UPR process.

**Table `n_g_o_coalitions`**

| n_g_o_coalition_id | coalition_id | coalition_name | submission_date | submission_type | signatory_count | u_p_r_review_cycle_id | u_p_r_recommendation_id |
|---|---|---|---|---|---|---|---|
| 1 | 392482 | Integrated Programme A | 2025-04-24T03:57:00 | oral_statement | 2 | 100 | 1 |
| 2 | 46a41ee4-9bac-11eb-a8a2-19ed5c03f8d3 | Extended Standard | 2022-09-08T10:14:00 | written_submission | 13 | 101 | 2 |
| 3 | 3355789 | Pilot Framework | 2023-02-19T17:31:00 | oral_statement | 1 | 102 | 3 |
| 4 | 726056 | Baseline Protocol D | 2024-07-03T00:48:00 | written_submission | 4 | 103 | 4 |

The `n_g_o_coalitions` table stores coalition records. The surrogate `n_g_o_coalition_id` (1–4) is the primary key. `coalition_id` holds the business identifier (`392482`, `46a41ee4-9bac-11eb-a8a2-19ed5c03f8d3`, `3355789`, `726056`), and `coalition_name` carries the label (`Integrated Programme A`, `Extended Standard`, `Pilot Framework`, `Baseline Protocol D`). The `submission_date` records when the coalition submitted its input, `submission_type` (`oral_statement`, `written_submission`) classifies the format, and `signatory_count` (1, 2, 4, 13) records the number of participating organizations. Foreign keys `u_p_r_review_cycle_id` and `u_p_r_recommendation_id` link each coalition to its review cycle and recommendation.

NGO members are the individual organizations within coalitions.

**Table `n_g_o_members`**

| n_g_o_member_id | org_id | org_name | org_type | focus_area | registration_country | n_g_o_coalition_id | u_p_r_recommendation_id | state_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 790471 | Nancy Garrison | international | education | compact-registra-38 | 1 | 1 | 100 |
| 2 | 1717 | Stephenie Meyer | national | health | composite-registra-39 | 2 | 2 | 101 |
| 3 | 69437 | Brian Hamilton | local | women_rights | primary-registra-40 | 3 | 3 | 102 |
| 4 | m16 | Doctor Bob | international | indigenous_rights | adaptive-registra-41 | 4 | 4 | 103 |

The `n_g_o_members` table stores individual NGO organization records. Each member belongs to a coalition and may participate in multiple coalitions, forming a many-to-many relationship resolved by the `coalitions_members` junction table. Members are linked to review cycles, recommendations, and states through the coalition context and direct foreign keys.

## Junction Tables and Normalization

The four junction tables resolve many-to-many relationships that the ontology specifies but the relational model cannot express directly.

**Table `cycles_recommendations`**

| u_p_r_review_cycle_id | u_p_r_recommendation_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `cycles_recommendations` junction table links review cycles to recommendations, allowing a single cycle to generate multiple recommendations and a recommendation to be associated with multiple cycles.

**Table `states_recommendations`**

| state_id | u_p_r_recommendation_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `states_recommendations` junction table links states to recommendations, enabling a state to make multiple recommendations and a recommendation to be attributed to multiple states.

**Table `groups_barriers`**

| vulnerable_group_id | rights_barrier_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

The `groups_barriers` junction table links vulnerable groups to rights barriers, allowing a group to experience multiple barriers and a barrier type to affect multiple groups.

**Table `coalitions_members`**

| n_g_o_coalition_id | n_g_o_member_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `coalitions_members` junction table links NGO coalitions to NGO members, allowing a coalition to comprise multiple members and a member to participate in multiple coalitions.

## View: Review Cycle to Recommendation Detail

**View `v_u_p_r_review_cycle_u_p_r_recommendation_detail`**

```sql
CREATE VIEW v_u_p_r_review_cycle_u_p_r_recommendation_detail AS
SELECT a.id, a.cycle_id, a.session_date, b.id AS recommendation_id, b.recommendation_id AS recommendation_recommendation_id, b.recommendation_text AS recommendation_recommendation_text
FROM u_p_r_review_cycles a
  JOIN cycles_recommendations j ON j.u_p_r_review_cycle_id = a.id
  JOIN u_p_r_recommendations b ON b.id = j.u_p_r_recommendation_id;
```

| id | cycle_id | session_date | recommendation_id | recommendation_recommendation_id | recommendation_recommendation_text |
|---|---|---|---|---|---|
| 100 | 5082976 | 2022-09-11T20:24:00 | 1 | 3158134 | pilot-recommen-20 |
| 100 | 5082976 | 2022-09-11T20:24:00 | 2 | 4649 | extended-recommen-21 |
| 101 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-22T03:41:00 | 2 | 4649 | extended-recommen-21 |
| 101 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-22T03:41:00 | 3 | 9fff478e-9bac-11eb-a8a2-19ed5c03f8d3 | integrated-recommen-22 |
| 102 | 2618560 | 2024-07-06T10:58:00 | 3 | 9fff478e-9bac-11eb-a8a2-19ed5c03f8d3 | integrated-recommen-22 |
| 102 | 2618560 | 2024-07-06T10:58:00 | 4 | 89820 | seasonal-recommen-23 |
| 103 | 2839528 | 2025-12-17T17:15:00 | 4 | 89820 | seasonal-recommen-23 |
| 103 | 2839528 | 2025-12-17T17:15:00 | 1 | 3158134 | pilot-recommen-20 |

This view joins `u_p_r_review_cycles` with `u_p_r_recommendations` to answer: "Which recommendations emerged from each review cycle, and what are their attributes?" For example, the row linking cycle `5082976` (status `completed`, outcome `adaptive-review-59`) to recommendation `3158134` (topic `education`, status `accepted`, priority `high`) shows how a completed cycle produced an accepted, high-priority education recommendation.

## View: Review Cycle to State

**View `v_u_p_r_review_cycle_state`**

```sql
CREATE VIEW v_u_p_r_review_cycle_state AS
SELECT a.id, a.cycle_id, a.session_date, a.reviewing_state, b.id AS state_id, b.state_code AS state_state_code, b.state_name AS state_state_name
FROM u_p_r_review_cycles a JOIN states b ON a.state_id = b.id;
```

| id | cycle_id | session_date | reviewing_state | state_id | state_state_code | state_state_name |
|---|---|---|---|---|---|---|
| 100 | 5082976 | 2022-09-11T20:24:00 | extended-reviewin-75 | 100 | 17788643 | Composite Protocol |
| 101 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-22T03:41:00 | integrated-reviewin-76 | 101 | 8350031 | Compact Programme A |
| 102 | 2618560 | 2024-07-06T10:58:00 | seasonal-reviewin-77 | 102 | 790483 | Legacy Standard |
| 103 | 2839528 | 2025-12-17T17:15:00 | regional-reviewin-78 | 103 | 8387549 | Regional Framework |

This view joins `u_p_r_review_cycles` with `states` to answer: "Which state was reviewed in each cycle, and what is its governance profile?" The row pairing cycle `27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3` (status `ongoing`) with state `8350031` (`Compact Programme A`, government `integrated-governme-82`, HRC status `suspended`) reveals an ongoing review of a suspended HRC member.

## View: Recommendation to Review Cycle

**View `v_u_p_r_recommendation_u_p_r_review_cycle`**

```sql
CREATE VIEW v_u_p_r_recommendation_u_p_r_review_cycle AS
SELECT a.id, a.recommendation_id, a.recommendation_text, a.topic_area, b.id AS cycle_id, b.cycle_id AS cycle_cycle_id, b.session_date AS cycle_session_date
FROM u_p_r_recommendations a JOIN u_p_r_review_cycles b ON a.u_p_r_review_cycle_id = b.id;
```

| id | recommendation_id | recommendation_text | topic_area | cycle_id | cycle_cycle_id | cycle_session_date |
|---|---|---|---|---|---|---|
| 1 | 3158134 | pilot-recommen-20 | education | 100 | 5082976 | 2022-09-11T20:24:00 |
| 2 | 4649 | extended-recommen-21 | health | 101 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-22T03:41:00 |
| 3 | 9fff478e-9bac-11eb-a8a2-19ed5c03f8d3 | integrated-recommen-22 | indigenous_rights | 102 | 2618560 | 2024-07-06T10:58:00 |
| 4 | 89820 | seasonal-recommen-23 | gender_based_violence | 103 | 2839528 | 2025-12-17T17:15:00 |

This view joins `u_p_r_recommendations` with `u_p_r_review_cycles` to answer: "From which review cycle did each recommendation originate, and what was the cycle's outcome?" The row linking recommendation `4649` (topic `health`, status `noted`) to cycle `2618560` (status `scheduled`, outcome `baseline-review-61`) shows a noted health recommendation arising from a scheduled baseline review.

## View: Recommendation to State

**View `v_u_p_r_recommendation_state`**

```sql
CREATE VIEW v_u_p_r_recommendation_state AS
SELECT a.id, a.recommendation_id, a.recommendation_text, a.topic_area, b.id AS state_id, b.state_code AS state_state_code, b.state_name AS state_state_name
FROM u_p_r_recommendations a JOIN states b ON a.state_id = b.id;
```

| id | recommendation_id | recommendation_text | topic_area | state_id | state_state_code | state_state_name |
|---|---|---|---|---|---|---|
| 1 | 3158134 | pilot-recommen-20 | education | 100 | 17788643 | Composite Protocol |
| 2 | 4649 | extended-recommen-21 | health | 101 | 8350031 | Compact Programme A |
| 3 | 9fff478e-9bac-11eb-a8a2-19ed5c03f8d3 | integrated-recommen-22 | indigenous_rights | 102 | 790483 | Legacy Standard |
| 4 | 89820 | seasonal-recommen-23 | gender_based_violence | 103 | 8387549 | Regional Framework |

This view joins `u_p_r_recommendations` with `states` to answer: "Which state made each recommendation, and what is that state's profile?" The row pairing recommendation `9fff478e-9bac-11eb-a8a2-19ed5c03f8d3` (topic `indigenous_rights`, status `rejected`) with state `790483` (`Legacy Standard`, government `seasonal-governme-83`, HRC status `withdrawn`) shows a rejected indigenous rights recommendation from a withdrawn state.

## View: Recommendation to Vulnerable Group

**View `v_u_p_r_recommendation_vulnerable_group`**

```sql
CREATE VIEW v_u_p_r_recommendation_vulnerable_group AS
SELECT a.id, a.recommendation_id, a.recommendation_text, a.topic_area, b.id AS group_id, b.group_identifier AS group_group_identifier, b.group_name AS group_group_name
FROM u_p_r_recommendations a JOIN vulnerable_groups b ON a.vulnerable_group_id = b.id;
```

| id | recommendation_id | recommendation_text | topic_area | group_id | group_group_identifier | group_group_name |
|---|---|---|---|---|---|---|
| 1 | 3158134 | pilot-recommen-20 | education | 100 | GRO-2079 | Baseline Corridor D |
| 2 | 4649 | extended-recommen-21 | health | 101 | GRO-2081 | Distributed Series |
| 3 | 9fff478e-9bac-11eb-a8a2-19ed5c03f8d3 | integrated-recommen-22 | indigenous_rights | 102 | GRO-2083 | Adaptive Assessment |
| 4 | 89820 | seasonal-recommen-23 | gender_based_violence | 103 | GRO-2085 | Primary Survey A |

This view joins `u_p_r_recommendations` with `vulnerable_groups` to answer: "Which vulnerable group is each recommendation targeting?" The row linking recommendation `89820` (topic `gender_based_violence`, priority `high`) to group `GRO-2085` (`Primary Survey A`, risk `discrimination`, population 56, distribution `rural`) shows a high-priority gender-based violence recommendation targeting a rural group of 56 members.

## View: State to Review Cycle

**View `v_state_u_p_r_review_cycle`**

```sql
CREATE VIEW v_state_u_p_r_review_cycle AS
SELECT a.id, a.state_code, a.state_name, a.government_type, b.id AS cycle_id, b.cycle_id AS cycle_cycle_id, b.session_date AS cycle_session_date
FROM states a JOIN u_p_r_review_cycles b ON a.u_p_r_review_cycle_id = b.id;
```

| id | state_code | state_name | government_type | cycle_id | cycle_cycle_id | cycle_session_date |
|---|---|---|---|---|---|---|
| 100 | 17788643 | Composite Protocol | extended-governme-81 | 100 | 5082976 | 2022-09-11T20:24:00 |
| 101 | 8350031 | Compact Programme A | integrated-governme-82 | 101 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-22T03:41:00 |
| 102 | 790483 | Legacy Standard | seasonal-governme-83 | 102 | 2618560 | 2024-07-06T10:58:00 |
| 103 | 8387549 | Regional Framework | regional-governme-84 | 103 | 2839528 | 2025-12-17T17:15:00 |

This view joins `states` with `u_p_r_review_cycles` to answer: "Which review cycle is each state associated with, and what is the cycle's status?" The row pairing state `17788643` (`Composite Protocol`, HRC status `active`) with cycle `5082976` (status `completed`, outcome `adaptive-review-59`) shows an active state that has completed its adaptive review.

## View: State to Recommendation Detail

**View `v_state_u_p_r_recommendation_detail`**

```sql
CREATE VIEW v_state_u_p_r_recommendation_detail AS
SELECT a.id, a.state_code, a.state_name, b.id AS recommendation_id, b.recommendation_id AS recommendation_recommendation_id, b.recommendation_text AS recommendation_recommendation_text
FROM states a
  JOIN states_recommendations j ON j.state_id = a.id
  JOIN u_p_r_recommendations b ON b.id = j.u_p_r_recommendation_id;
```

| id | state_code | state_name | recommendation_id | recommendation_recommendation_id | recommendation_recommendation_text |
|---|---|---|---|---|---|
| 100 | 17788643 | Composite Protocol | 1 | 3158134 | pilot-recommen-20 |
| 100 | 17788643 | Composite Protocol | 2 | 4649 | extended-recommen-21 |
| 101 | 8350031 | Compact Programme A | 2 | 4649 | extended-recommen-21 |
| 101 | 8350031 | Compact Programme A | 3 | 9fff478e-9bac-11eb-a8a2-19ed5c03f8d3 | integrated-recommen-22 |
| 102 | 790483 | Legacy Standard | 3 | 9fff478e-9bac-11eb-a8a2-19ed5c03f8d3 | integrated-recommen-22 |
| 102 | 790483 | Legacy Standard | 4 | 89820 | seasonal-recommen-23 |
| 103 | 8387549 | Regional Framework | 4 | 89820 | seasonal-recommen-23 |
| 103 | 8387549 | Regional Framework | 1 | 3158134 | pilot-recommen-20 |

This view joins `states` with `u_p_r_recommendations` to answer: "Which recommendations are associated with each state, and what are their attributes?" The row linking state `8350031` (`Compact Programme A`, government `integrated-governme-82`) to recommendation `3158134` (topic `education`, status `accepted`, priority `high`) shows an integrated government state associated with an accepted education recommendation.

## View: State to Vulnerable Group

**View `v_state_vulnerable_group`**

```sql
CREATE VIEW v_state_vulnerable_group AS
SELECT a.id, a.state_code, a.state_name, a.government_type, b.id AS group_id, b.group_identifier AS group_group_identifier, b.group_name AS group_group_name
FROM states a JOIN vulnerable_groups b ON a.vulnerable_group_id = b.id;
```

| id | state_code | state_name | government_type | group_id | group_group_identifier | group_group_name |
|---|---|---|---|---|---|---|
| 100 | 17788643 | Composite Protocol | extended-governme-81 | 100 | GRO-2079 | Baseline Corridor D |
| 101 | 8350031 | Compact Programme A | integrated-governme-82 | 101 | GRO-2081 | Distributed Series |
| 102 | 790483 | Legacy Standard | seasonal-governme-83 | 102 | GRO-2083 | Adaptive Assessment |
| 103 | 8387549 | Regional Framework | regional-governme-84 | 103 | GRO-2085 | Primary Survey A |

This view joins `states` with `vulnerable_groups` to answer: "Which vulnerable group is each state associated with?" The row pairing state `790483` (`Legacy Standard`, HRC status `withdrawn`) with group `GRO-2083` (`Adaptive Assessment`, risk `gender_based_violence`, population 49) shows a withdrawn state associated with a gender-based violence risk group.

## View: Vulnerable Group to Recommendation

**View `v_vulnerable_group_u_p_r_recommendation`**

```sql
CREATE VIEW v_vulnerable_group_u_p_r_recommendation AS
SELECT a.id, a.group_identifier, a.group_name, a.risk_category, b.id AS recommendation_id, b.recommendation_id AS recommendation_recommendation_id, b.recommendation_text AS recommendation_recommendation_text
FROM vulnerable_groups a JOIN u_p_r_recommendations b ON a.u_p_r_recommendation_id = b.id;
```

| id | group_identifier | group_name | risk_category | recommendation_id | recommendation_recommendation_id | recommendation_recommendation_text |
|---|---|---|---|---|---|---|
| 100 | GRO-2079 | Baseline Corridor D | education_disparity | 1 | 3158134 | pilot-recommen-20 |
| 101 | GRO-2081 | Distributed Series | healthcare_access | 2 | 4649 | extended-recommen-21 |
| 102 | GRO-2083 | Adaptive Assessment | gender_based_violence | 3 | 9fff478e-9bac-11eb-a8a2-19ed5c03f8d3 | integrated-recommen-22 |
| 103 | GRO-2085 | Primary Survey A | discrimination | 4 | 89820 | seasonal-recommen-23 |

This view joins `vulnerable_groups` with `u_p_r_recommendations` to answer: "Which recommendations target each vulnerable group?" The row linking group `GRO-2079` (`Baseline Corridor D`, risk `education_disparity`, population 35) to recommendation `3158134` (topic `education`, status `accepted`, priority `high`) shows an education disparity group targeted by an accepted, high-priority education recommendation.

## View: Vulnerable Group to State

**View `v_vulnerable_group_state`**

```sql
CREATE VIEW v_vulnerable_group_state AS
SELECT a.id, a.group_identifier, a.group_name, a.risk_category, b.id AS state_id, b.state_code AS state_state_code, b.state_name AS state_state_name
FROM vulnerable_groups a JOIN states b ON a.state_id = b.id;
```

| id | group_identifier | group_name | risk_category | state_id | state_state_code | state_state_name |
|---|---|---|---|---|---|---|
| 100 | GRO-2079 | Baseline Corridor D | education_disparity | 100 | 17788643 | Composite Protocol |
| 101 | GRO-2081 | Distributed Series | healthcare_access | 101 | 8350031 | Compact Programme A |
| 102 | GRO-2083 | Adaptive Assessment | gender_based_violence | 102 | 790483 | Legacy Standard |
| 103 | GRO-2085 | Primary Survey A | discrimination | 103 | 8387549 | Regional Framework |

This view joins `vulnerable_groups` with `states` to answer: "Which state is each vulnerable group associated with?" The row pairing group `GRO-2081` (`Distributed Series`, risk `healthcare_access`, population 42) with state `8350031` (`Compact Programme A`, government `integrated-governme-82`) shows a healthcare access group associated with an integrated government state.

## View: Vulnerable Group to Rights Barrier Detail

**View `v_vulnerable_group_rights_barrier_detail`**

```sql
CREATE VIEW v_vulnerable_group_rights_barrier_detail AS
SELECT a.id, a.group_identifier, a.group_name, b.rights_barrier_id AS barrier_rights_barrier_id, b.barrier_id AS barrier_barrier_id, b.barrier_type AS barrier_barrier_type
FROM vulnerable_groups a
  JOIN groups_barriers j ON j.vulnerable_group_id = a.id
  JOIN rights_barriers b ON b.rights_barrier_id = j.rights_barrier_id;
```

| id | group_identifier | group_name | barrier_rights_barrier_id | barrier_barrier_id | barrier_barrier_type |
|---|---|---|---|---|---|
| 100 | GRO-2079 | Baseline Corridor D | 100 | 9125631 | funding_disparity |
| 100 | GRO-2079 | Baseline Corridor D | 101 | 6969441 | discrimination |
| 101 | GRO-2081 | Distributed Series | 101 | 6969441 | discrimination |
| 101 | GRO-2081 | Distributed Series | 102 | gd_taxc_1122 | violence |
| 102 | GRO-2083 | Adaptive Assessment | 102 | gd_taxc_1122 | violence |
| 102 | GRO-2083 | Adaptive Assessment | 103 | 790474 | isolation |
| 103 | GRO-2085 | Primary Survey A | 103 | 790474 | isolation |
| 103 | GRO-2085 | Primary Survey A | 100 | 9125631 | funding_disparity |

This view joins `vulnerable_groups` with `rights_barriers` to answer: "Which rights barriers affect each vulnerable group, and what is the barrier's severity?" The row linking group `GRO-2079` (`Baseline Corridor D`, risk `education_disparity`) to barrier `9125631` (type `funding_disparity`, severity `critical`, status `unaddressed`) shows a critical, unaddressed funding disparity barrier affecting an education disparity group.

## View: Rights Barrier to Vulnerable Group

**View `v_rights_barrier_vulnerable_group`**

```sql
CREATE VIEW v_rights_barrier_vulnerable_group AS
SELECT a.rights_barrier_id, a.barrier_id, a.barrier_type, a.severity_level, b.id AS group_id, b.group_identifier AS group_group_identifier, b.group_name AS group_group_name
FROM rights_barriers a JOIN vulnerable_groups b ON a.vulnerable_group_id = b.id;
```

| rights_barrier_id | barrier_id | barrier_type | severity_level | group_id | group_group_identifier | group_group_name |
|---|---|---|---|---|---|---|
| 100 | 9125631 | funding_disparity | critical | 100 | GRO-2079 | Baseline Corridor D |
| 101 | 6969441 | discrimination | high | 101 | GRO-2081 | Distributed Series |
| 102 | gd_taxc_1122 | violence | medium | 102 | GRO-2083 | Adaptive Assessment |
| 103 | 790474 | isolation | low | 103 | GRO-2085 | Primary Survey A |

This view joins `rights_barriers` with `vulnerable_groups` to answer: "Which vulnerable group is affected by each rights barrier?" The row pairing barrier `6969441` (type `discrimination`, severity `high`, status `partially_addressed`) with group `GRO-2081` (`Distributed Series`, risk `healthcare_access`, population 42) shows a partially addressed high-severity discrimination barrier affecting a healthcare access group.

## View: Rights Barrier to Recommendation

**View `v_rights_barrier_u_p_r_recommendation`**

```sql
CREATE VIEW v_rights_barrier_u_p_r_recommendation AS
SELECT a.rights_barrier_id, a.barrier_id, a.barrier_type, a.severity_level, b.id AS recommendation_id, b.recommendation_id AS recommendation_recommendation_id, b.recommendation_text AS recommendation_recommendation_text
FROM rights_barriers a JOIN u_p_r_recommendations b ON a.u_p_r_recommendation_id = b.id;
```

| rights_barrier_id | barrier_id | barrier_type | severity_level | recommendation_id | recommendation_recommendation_id | recommendation_recommendation_text |
|---|---|---|---|---|---|---|
| 100 | 9125631 | funding_disparity | critical | 1 | 3158134 | pilot-recommen-20 |
| 101 | 6969441 | discrimination | high | 2 | 4649 | extended-recommen-21 |
| 102 | gd_taxc_1122 | violence | medium | 3 | 9fff478e-9bac-11eb-a8a2-19ed5c03f8d3 | integrated-recommen-22 |
| 103 | 790474 | isolation | low | 4 | 89820 | seasonal-recommen-23 |

This view joins `rights_barriers` with `u_p_r_recommendations` to answer: "Which recommendation is associated with each rights barrier?" The row linking barrier `gd_taxc_1122` (type `violence`, severity `medium`, status `fully_addressed`) to recommendation `9fff478e-9bac-11eb-a8a2-19ed5c03f8d3` (topic `indigenous_rights`, status `rejected`) shows a fully addressed violence barrier associated with a rejected indigenous rights recommendation.

## View: Rights Barrier to State

**View `v_rights_barrier_state`**

```sql
CREATE VIEW v_rights_barrier_state AS
SELECT a.rights_barrier_id, a.barrier_id, a.barrier_type, a.severity_level, b.id AS state_id, b.state_code AS state_state_code, b.state_name AS state_state_name
FROM rights_barriers a JOIN states b ON a.state_id = b.id;
```

| rights_barrier_id | barrier_id | barrier_type | severity_level | state_id | state_state_code | state_state_name |
|---|---|---|---|---|---|---|
| 100 | 9125631 | funding_disparity | critical | 100 | 17788643 | Composite Protocol |
| 101 | 6969441 | discrimination | high | 101 | 8350031 | Compact Programme A |
| 102 | gd_taxc_1122 | violence | medium | 102 | 790483 | Legacy Standard |
| 103 | 790474 | isolation | low | 103 | 8387549 | Regional Framework |

This view joins `rights_barriers` with `states` to answer: "Which state is associated with each rights barrier?" The row pairing barrier `790474` (type `isolation`, severity `low`, status `unaddressed`) with state `8387549` (`Regional Framework`, government `regional-governme-84`, HRC status `active`) shows an unaddressed isolation barrier associated with an active regional government state.

## View: NGO Coalition to Review Cycle

**View `v_n_g_o_coalition_u_p_r_review_cycle`**

```sql
CREATE VIEW v_n_g_o_coalition_u_p_r_review_cycle AS
SELECT a.n_g_o_coalition_id, a.coalition_id, a.coalition_name, a.submission_date, b.id AS cycle_id, b.cycle_id AS cycle_cycle_id, b.session_date AS cycle_session_date
FROM n_g_o_coalitions a JOIN u_p_r_review_cycles b ON a.u_p_r_review_cycle_id = b.id;
```

| n_g_o_coalition_id | coalition_id | coalition_name | submission_date | cycle_id | cycle_cycle_id | cycle_session_date |
|---|---|---|---|---|---|---|
| 1 | 392482 | Integrated Programme A | 2025-04-24T03:57:00 | 100 | 5082976 | 2022-09-11T20:24:00 |
| 2 | 46a41ee4-9bac-11eb-a8a2-19ed5c03f8d3 | Extended Standard | 2022-09-08T10:14:00 | 101 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-22T03:41:00 |
| 3 | 3355789 | Pilot Framework | 2023-02-19T17:31:00 | 102 | 2618560 | 2024-07-06T10:58:00 |
| 4 | 726056 | Baseline Protocol D | 2024-07-03T00:48:00 | 103 | 2839528 | 2025-12-17T17:15:00 |

This view joins `n_g_o_coalitions` with `u_p_r_review_cycles` to answer: "Which review cycle is each NGO coalition associated with?" The row linking coalition `392482` (`Integrated Programme A`, submission `oral_statement`, 2 signatories) to cycle `5082976` (status `completed`, outcome `adaptive-review-59`) shows a two-member oral coalition associated with a completed adaptive review.

## View: NGO Coalition to Member Detail

**View `v_n_g_o_coalition_n_g_o_member_detail`**

```sql
CREATE VIEW v_n_g_o_coalition_n_g_o_member_detail AS
SELECT a.n_g_o_coalition_id, a.coalition_id, a.coalition_name, b.n_g_o_member_id AS member_n_g_o_member_id, b.org_id AS member_org_id, b.org_name AS member_org_name
FROM n_g_o_coalitions a
  JOIN coalitions_members j ON j.n_g_o_coalition_id = a.n_g_o_coalition_id
  JOIN n_g_o_members b ON b.n_g_o_member_id = j.n_g_o_member_id;
```

| n_g_o_coalition_id | coalition_id | coalition_name | member_n_g_o_member_id | member_org_id | member_org_name |
|---|---|---|---|---|---|
| 1 | 392482 | Integrated Programme A | 1 | 790471 | Nancy Garrison |
| 1 | 392482 | Integrated Programme A | 2 | 1717 | Stephenie Meyer |
| 2 | 46a41ee4-9bac-11eb-a8a2-19ed5c03f8d3 | Extended Standard | 2 | 1717 | Stephenie Meyer |
| 2 | 46a41ee4-9bac-11eb-a8a2-19ed5c03f8d3 | Extended Standard | 3 | 69437 | Brian Hamilton |
| 3 | 3355789 | Pilot Framework | 3 | 69437 | Brian Hamilton |
| 3 | 3355789 | Pilot Framework | 4 | m16 | Doctor Bob |
| 4 | 726056 | Baseline Protocol D | 4 | m16 | Doctor Bob |
| 4 | 726056 | Baseline Protocol D | 1 | 790471 | Nancy Garrison |

This view joins `n_g_o_coalitions` with `n_g_o_members` through the `coalitions_members` junction table to answer: "Which NGO members belong to each coalition?" The row linking coalition `46a41ee4-9bac-11eb-a8a2-19ed5c03f8d3` (`Extended Standard`, submission `written_submission`, 13 signatories) to its members shows the composition of a large written submission coalition.

## View: NGO Coalition to Recommendation

**View `v_n_g_o_coalition_u_p_r_recommendation`**

```sql
CREATE VIEW v_n_g_o_coalition_u_p_r_recommendation AS
SELECT a.n_g_o_coalition_id, a.coalition_id, a.coalition_name, a.submission_date, b.id AS recommendation_id, b.recommendation_id AS recommendation_recommendation_id, b.recommendation_text AS recommendation_recommendation_text
FROM n_g_o_coalitions a JOIN u_p_r_recommendations b ON a.u_p_r_recommendation_id = b.id;
```

| n_g_o_coalition_id | coalition_id | coalition_name | submission_date | recommendation_id | recommendation_recommendation_id | recommendation_recommendation_text |
|---|---|---|---|---|---|---|
| 1 | 392482 | Integrated Programme A | 2025-04-24T03:57:00 | 1 | 3158134 | pilot-recommen-20 |
| 2 | 46a41ee4-9bac-11eb-a8a2-19ed5c03f8d3 | Extended Standard | 2022-09-08T10:14:00 | 2 | 4649 | extended-recommen-21 |
| 3 | 3355789 | Pilot Framework | 2023-02-19T17:31:00 | 3 | 9fff478e-9bac-11eb-a8a2-19ed5c03f8d3 | integrated-recommen-22 |
| 4 | 726056 | Baseline Protocol D | 2024-07-03T00:48:00 | 4 | 89820 | seasonal-recommen-23 |

This view joins `n_g_o_coalitions` with `u_p_r_recommendations` to answer: "Which recommendation is each NGO coalition associated with?" The row linking coalition `3355789` (`Pilot Framework`, submission `oral_statement`, 1 signatory) to recommendation `9fff478e-9bac-11eb-a8a2-19ed5c03f8d3` (topic `indigenous_rights`, status `rejected`) shows a single-member oral coalition associated with a rejected indigenous rights recommendation.

## View: NGO Member to Coalition

**View `v_n_g_o_member_n_g_o_coalition`**

```sql
CREATE VIEW v_n_g_o_member_n_g_o_coalition AS
SELECT a.n_g_o_member_id, a.org_id, a.org_name, a.org_type, b.n_g_o_coalition_id AS coalition_n_g_o_coalition_id, b.coalition_id AS coalition_coalition_id, b.coalition_name AS coalition_coalition_name
FROM n_g_o_members a JOIN n_g_o_coalitions b ON a.n_g_o_coalition_id = b.n_g_o_coalition_id;
```

| n_g_o_member_id | org_id | org_name | org_type | coalition_n_g_o_coalition_id | coalition_coalition_id | coalition_coalition_name |
|---|---|---|---|---|---|---|
| 1 | 790471 | Nancy Garrison | international | 1 | 392482 | Integrated Programme A |
| 2 | 1717 | Stephenie Meyer | national | 2 | 46a41ee4-9bac-11eb-a8a2-19ed5c03f8d3 | Extended Standard |
| 3 | 69437 | Brian Hamilton | local | 3 | 3355789 | Pilot Framework |
| 4 | m16 | Doctor Bob | international | 4 | 726056 | Baseline Protocol D |

This view joins `n_g_o_members` with `n_g_o_coalitions` through the `coalitions_members` junction table to answer: "Which coalition does each NGO member belong to?" The row linking an NGO member to coalition `726056` (`Baseline Protocol D`, submission `written_submission`, 4 signatories) shows the coalition membership of an individual organization.

## View: NGO Member to Recommendation

**View `v_n_g_o_member_u_p_r_recommendation`**

```sql
CREATE VIEW v_n_g_o_member_u_p_r_recommendation AS
SELECT a.n_g_o_member_id, a.org_id, a.org_name, a.org_type, b.id AS recommendation_id, b.recommendation_id AS recommendation_recommendation_id, b.recommendation_text AS recommendation_recommendation_text
FROM n_g_o_members a JOIN u_p_r_recommendations b ON a.u_p_r_recommendation_id = b.id;
```

| n_g_o_member_id | org_id | org_name | org_type | recommendation_id | recommendation_recommendation_id | recommendation_recommendation_text |
|---|---|---|---|---|---|---|
| 1 | 790471 | Nancy Garrison | international | 1 | 3158134 | pilot-recommen-20 |
| 2 | 1717 | Stephenie Meyer | national | 2 | 4649 | extended-recommen-21 |
| 3 | 69437 | Brian Hamilton | local | 3 | 9fff478e-9bac-11eb-a8a2-19ed5c03f8d3 | integrated-recommen-22 |
| 4 | m16 | Doctor Bob | international | 4 | 89820 | seasonal-recommen-23 |

This view joins `n_g_o_members` with `u_p_r_recommendations` to answer: "Which recommendation is each NGO member associated with?" The row linking an NGO member to recommendation `89820` (topic `gender_based_violence`, status `accepted`, priority `high`) shows a member associated with an accepted, high-priority gender-based violence recommendation.

## View: NGO Member to State

**View `v_n_g_o_member_state`**

```sql
CREATE VIEW v_n_g_o_member_state AS
SELECT a.n_g_o_member_id, a.org_id, a.org_name, a.org_type, b.id AS state_id, b.state_code AS state_state_code, b.state_name AS state_state_name
FROM n_g_o_members a JOIN states b ON a.state_id = b.id;
```

| n_g_o_member_id | org_id | org_name | org_type | state_id | state_state_code | state_state_name |
|---|---|---|---|---|---|---|
| 1 | 790471 | Nancy Garrison | international | 100 | 17788643 | Composite Protocol |
| 2 | 1717 | Stephenie Meyer | national | 101 | 8350031 | Compact Programme A |
| 3 | 69437 | Brian Hamilton | local | 102 | 790483 | Legacy Standard |
| 4 | m16 | Doctor Bob | international | 103 | 8387549 | Regional Framework |

This view joins `n_g_o_members` with `states` to answer: "Which state is each NGO member associated with?" The row linking an NGO member to state `17788643` (`Composite Protocol`, government `extended-governme-81`, HRC status `active`) shows a member associated with an active extended government state.

## Synthesis

The schema models the UPR domain as a network of interconnected entities: review cycles anchor temporal sessions, recommendations capture actionable outputs, states provide the sovereign context, vulnerable groups identify affected populations, rights barriers document obstacles, and NGO coalitions represent civil society participation. The seven base tables store the core entities with surrogate keys and business identifiers, while the four junction tables resolve many-to-many relationships into normalized binary associations. The twenty views materialize the most common join paths, each answering a specific domain question by reassembling the normalized facts into a single denormalized row. Together, the tables and views provide a complete relational representation of the UPR ecosystem, from the lifecycle of a review cycle through the targeting of recommendations to vulnerable groups and the documentation of the barriers they face.