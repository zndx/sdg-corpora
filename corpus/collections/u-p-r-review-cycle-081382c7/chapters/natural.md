## The Architecture of Universal Periodic Review

The Universal Periodic Review mechanism operates as a cyclical audit of human rights compliance, wherein each member state submits to peer examination and receives a structured set of recommendations. The process unfolds across discrete review cycles, each anchored to a specific calendar date and assigned a procedural posture—completed, ongoing, or scheduled. Within each cycle, states receive recommendations spanning topic areas such as education, health, indigenous rights, and gender-based violence. These recommendations carry acceptance statuses (accepted, noted, rejected) and priority levels (high, medium, low), forming the operational backbone of post-review accountability.

The review lifecycle begins when a state enters a defined session. Cycle `5082976`, for instance, was recorded on 2022-09-11 under the reviewing state label `extended-reviewin-75`, reached a `completed` status, and produced an outcome coded as `adaptive-review-59`. A subsequent cycle, `27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3`, initiated on 2023-02-22 under `integrated-reviewin-76`, remains `ongoing` with a `distributed-review-60` outcome. The third cycle, `2618560`, is `scheduled` for 2024-07-06 under `seasonal-reviewin-77` and carries a `baseline-review-61` outcome. The fourth, `2839528`, is `completed` as of 2025-12-17 under `regional-reviewin-78` with a `pilot-review-62` outcome. Each cycle is tied to a specific state through a foreign-key linkage, establishing the jurisdictional scope of the review.

**Table `u_p_r_review_cycles`**

| id | cycle_id | session_date | reviewing_state | review_status | review_outcome | state_id |
|---|---|---|---|---|---|---|
| 100 | 5082976 | 2022-09-11T20:24:00 | extended-reviewin-75 | completed | adaptive-review-59 | 100 |
| 101 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-22T03:41:00 | integrated-reviewin-76 | ongoing | distributed-review-60 | 101 |
| 102 | 2618560 | 2024-07-06T10:58:00 | seasonal-reviewin-77 | scheduled | baseline-review-61 | 102 |
| 103 | 2839528 | 2025-12-17T17:15:00 | regional-reviewin-78 | completed | pilot-review-62 | 103 |

Recommendations generated within these cycles form the actionable output of the review process. Recommendation `3158134`, categorized under `education`, carries an `accepted` status and `high` priority, directed at state `100` and linked to vulnerable group `100`. Recommendation `4649`, focused on `health`, is `noted` at `medium` priority for state `101` and group `101`. Recommendation `9fff478e-9bac-11eb-a8a2-19ed5c03f8d3`, addressing `indigenous_rights`, was `rejected` at `low` priority for state `102` and group `102`. Recommendation `89820`, on `gender_based_violence`, is `accepted` at `high` priority for state `103` and group `103`. Each recommendation references its originating review cycle, creating a traceable lineage from session to output.

**Table `u_p_r_recommendations`**

| id | recommendation_id | recommendation_text | topic_area | acceptance_status | priority_level | u_p_r_review_cycle_id | state_id | vulnerable_group_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 3158134 | pilot-recommen-20 | education | accepted | high | 100 | 100 | 100 |
| 2 | 4649 | extended-recommen-21 | health | noted | medium | 101 | 101 | 101 |
| 3 | 9fff478e-9bac-11eb-a8a2-19ed5c03f8d3 | integrated-recommen-22 | indigenous_rights | rejected | low | 102 | 102 | 102 |
| 4 | 89820 | seasonal-recommen-23 | gender_based_violence | accepted | high | 103 | 103 | 103 |

States participating in the review mechanism are catalogued with administrative identifiers, government classifications, and Human Rights Council membership statuses. State `17788643`, designated `Composite Protocol`, operates under `extended-governme-81` with `active` HRC membership; its last review date was 2022-09-03. State `8350031`, `Compact Programme A`, uses `integrated-governme-82`, has `suspended` HRC membership, and was last reviewed on 2023-02-14. State `790483`, `Legacy Standard`, follows `seasonal-governme-83`, has `withdrawn` HRC membership, and was last reviewed on 2024-07-25. State `8387549`, `Regional Framework`, employs `regional-governme-84`, maintains `active` HRC membership, and was last reviewed on 2025-12-09. Each state is linked to its corresponding review cycle and to the vulnerable groups within its jurisdiction.

**Table `states`**

| id | state_code | state_name | government_type | hrc_membership_status | last_review_date | u_p_r_review_cycle_id | vulnerable_group_id |
|---|---|---|---|---|---|---|---|
| 100 | 17788643 | Composite Protocol | extended-governme-81 | active | 2022-09-03T08:24:00 | 100 | 100 |
| 101 | 8350031 | Compact Programme A | integrated-governme-82 | suspended | 2023-02-14T15:41:00 | 101 | 101 |
| 102 | 790483 | Legacy Standard | seasonal-governme-83 | withdrawn | 2024-07-25T22:58:00 | 102 | 102 |
| 103 | 8387549 | Regional Framework | regional-governme-84 | active | 2025-12-09T05:15:00 | 103 | 103 |

Vulnerable groups represent the populations targeted by recommendations and rights assessments. Group `GRO-2079`, named `Baseline Corridor D`, falls under the `education_disparity` risk category, is distributed in `rural` areas, and has a recorded population of `35` individuals. Group `GRO-2081`, `Distributed Series`, addresses `healthcare_access` in `urban` settings with a population of `42`. Group `GRO-2083`, `Adaptive Assessment`, concerns `gender_based_violence` in `mixed` geographic areas, population `49`. Group `GRO-2085`, `Primary Survey A`, addresses `discrimination` in `rural` areas, population `56`. Each group is associated with a specific recommendation and state, forming the beneficiary layer of the review architecture.

**Table `vulnerable_groups`**

| id | group_identifier | group_name | risk_category | geographic_distribution | population_size | u_p_r_recommendation_id | state_id |
|---|---|---|---|---|---|---|---|
| 100 | GRO-2079 | Baseline Corridor D | education_disparity | rural | 35 | 1 | 100 |
| 101 | GRO-2081 | Distributed Series | healthcare_access | urban | 42 | 2 | 101 |
| 102 | GRO-2083 | Adaptive Assessment | gender_based_violence | mixed | 49 | 3 | 102 |
| 103 | GRO-2085 | Primary Survey A | discrimination | rural | 56 | 4 | 103 |

Rights barriers document the structural impediments that prevent vulnerable groups from accessing their entitled protections. Barrier `9125631`, classified as `funding_disparity`, carries a `critical` severity level, is documented under `extended-document-51`, and remains `unaddressed`. It is linked to vulnerable group `100`, recommendation `1`, and state `100`, with creation recorded on 2025-01-01 and last update on 2025-01-02. Barrier `6969441`, of type `discrimination`, is rated `high` severity, documented as `integrated-document-52`, and is `partially_addressed`; it connects group `101`, recommendation `2`, and state `101`, created 2025-02-06 and updated 2025-02-09. Barrier `gd_taxc_1122`, categorized as `violence`, has `medium` severity, is recorded in `seasonal-document-53`, and is `fully_addressed`; it ties group `102`, recommendation `3`, and state `102`, created 2025-03-11 and updated 2025-03-16. Barrier `790474`, of type `isolation`, carries `low` severity, is documented as `regional-document-54`, and remains `unaddressed`; it links group `103`, recommendation `4`, and state `103`, created 2025-04-16 and updated 2025-04-23.

**Table `rights_barriers`**

| rights_barrier_id | barrier_id | barrier_type | severity_level | documented_evidence | mitigation_status | vulnerable_group_id | u_p_r_recommendation_id | state_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 9125631 | funding_disparity | critical | extended-document-51 | unaddressed | 100 | 1 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 6969441 | discrimination | high | integrated-document-52 | partially_addressed | 101 | 2 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | gd_taxc_1122 | violence | medium | seasonal-document-53 | fully_addressed | 102 | 3 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 790474 | isolation | low | regional-document-54 | unaddressed | 103 | 4 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Non-governmental organizations participate in the review process through coalitions that submit formal inputs. Coalition `392482`, named `Integrated Programme A`, submitted an `oral_statement` on 2025-04-24 with `2` signatories, associated with review cycle `100` and recommendation `1`. Coalition `46a41ee4-9bac-11eb-a8a2-19ed5c03f8d3`, `Extended Standard`, submitted a `written_submission` on 2022-09-08 with `13` signatories, linked to cycle `101` and recommendation `2`. Coalition `3355789`, `Pilot Framework`, submitted an `oral_statement` on 2023-02-19 with `1` signatory, connected to cycle `102` and recommendation `3`. Coalition `726056`, `Baseline Protocol D`, submitted a `written_submission` on 2024-07-03 with `4` signatories, tied to cycle `103` and recommendation `4`.

**Table `n_g_o_coalitions`**

| n_g_o_coalition_id | coalition_id | coalition_name | submission_date | submission_type | signatory_count | u_p_r_review_cycle_id | u_p_r_recommendation_id |
|---|---|---|---|---|---|---|---|
| 1 | 392482 | Integrated Programme A | 2025-04-24T03:57:00 | oral_statement | 2 | 100 | 1 |
| 2 | 46a41ee4-9bac-11eb-a8a2-19ed5c03f8d3 | Extended Standard | 2022-09-08T10:14:00 | written_submission | 13 | 101 | 2 |
| 3 | 3355789 | Pilot Framework | 2023-02-19T17:31:00 | oral_statement | 1 | 102 | 3 |
| 4 | 726056 | Baseline Protocol D | 2024-07-03T00:48:00 | written_submission | 4 | 103 | 4 |

Coalitions are composed of member organizations, tracked through a membership registry that records each organization's affiliation. The membership structure ensures that coalition submissions carry verifiable organizational backing, with each member contributing to the collective signatory count.

**Table `n_g_o_members`**

| n_g_o_member_id | org_id | org_name | org_type | focus_area | registration_country | n_g_o_coalition_id | u_p_r_recommendation_id | state_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 790471 | Nancy Garrison | international | education | compact-registra-38 | 1 | 1 | 100 |
| 2 | 1717 | Stephenie Meyer | national | health | composite-registra-39 | 2 | 2 | 101 |
| 3 | 69437 | Brian Hamilton | local | women_rights | primary-registra-40 | 3 | 3 | 102 |
| 4 | m16 | Doctor Bob | international | indigenous_rights | adaptive-registra-41 | 4 | 4 | 103 |

Cross-cutting linkage tables formalize the many-to-many relationships between core entities. The `cycles_recommendations` table maps which recommendations originate from which review cycles, enabling traceability from session to output. The `states_recommendations` table records which states are the recipients of specific recommendations, grounding each recommendation in its jurisdictional context. The `groups_barriers` table associates vulnerable groups with the rights barriers they face, creating a direct link between population and impediment. The `coalitions_members` table documents which NGO organizations belong to which coalitions, supporting the accountability chain from individual organization to collective submission.

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

## Review Cycle and Recommendation Detail

The view `v_u_p_r_review_cycle_u_p_r_recommendation_detail` joins review cycles with their associated recommendations, answering the question: which recommendations were produced within each review cycle, and what are their acceptance and priority characteristics? Row `100` shows cycle `5082976` (session date `2022-09-11`, status `completed`, outcome `adaptive-review-59`) linked to recommendation `3158134` (topic `education`, status `accepted`, priority `high`). Row `101` shows cycle `27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3` (session date `2023-02-22`, status `ongoing`, outcome `distributed-review-60`) linked to recommendation `4649` (topic `health`, status `noted`, priority `medium`). This view enables practitioners to assess the output quality and acceptance rate of each review cycle.

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

The view `v_u_p_r_recommendation_u_p_r_review_cycle` inverts this relationship, answering: for each recommendation, which review cycle produced it, and what was the procedural posture of that cycle? Row `100` shows recommendation `3158134` (topic `education`, status `accepted`, priority `high`) originating from cycle `5082976` (session date `2022-09-11`, status `completed`, outcome `adaptive-review-59`). Row `101` shows recommendation `4649` (topic `health`, status `noted`, priority `medium`) from cycle `27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3` (session date `2023-02-22`, status `ongoing`, outcome `distributed-review-60`). This orientation supports retrospective analysis of recommendation outcomes relative to cycle characteristics.

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

## State-Centric Perspectives

The view `v_u_p_r_review_cycle_state` joins review cycles with their reviewing states, answering: which state underwent review in each cycle, and what is that state's administrative profile? Row `100` shows cycle `5082976` (session date `2022-09-11`, status `completed`, outcome `adaptive-review-59`) linked to state `17788643` (`Composite Protocol`, government `extended-governme-81`, HRC membership `active`, last review `2022-09-03`). Row `101` shows cycle `27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3` (session date `2023-02-22`, status `ongoing`, outcome `distributed-review-60`) linked to state `8350031` (`Compact Programme A`, government `integrated-governme-82`, HRC membership `suspended`, last review `2023-02-14`). This view supports compliance tracking across states with varying HRC membership postures.

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

The view `v_state_u_p_r_review_cycle` reverses this linkage, answering: for each state, which review cycle is associated with it, and what are the cycle's procedural attributes? Row `100` shows state `17788643` (`Composite Protocol`, government `extended-governme-81`, HRC membership `active`, last review `2022-09-03`) linked to cycle `5082976` (session date `2022-09-11`, status `completed`, outcome `adaptive-review-59`). Row `101` shows state `8350031` (`Compact Programme A`, government `integrated-governme-82`, HRC membership `suspended`, last review `2023-02-14`) linked to cycle `27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3` (session date `2023-02-22`, status `ongoing`, outcome `distributed-review-60`). This orientation supports state-level compliance dashboards.

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

The view `v_u_p_r_recommendation_state` joins recommendations with their recipient states, answering: which state is the target of each recommendation, and what is that state's administrative context? Row `100` shows recommendation `3158134` (topic `education`, status `accepted`, priority `high`) directed at state `17788643` (`Composite Protocol`, government `extended-governme-81`, HRC membership `active`, last review `2022-09-03`). Row `101` shows recommendation `4649` (topic `health`, status `noted`, priority `medium`) directed at state `8350031` (`Compact Programme A`, government `integrated-governme-82`, HRC membership `suspended`, last review `2023-02-14`). This view is essential for tracking recommendation implementation by jurisdiction.

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

The view `v_state_u_p_r_recommendation_detail` inverts this relationship, answering: for each state, which recommendations target it, and what are their characteristics? Row `100` shows state `17788643` (`Composite Protocol`, government `extended-governme-81`, HRC membership `active`, last review `2022-09-03`) linked to recommendation `3158134` (topic `education`, status `accepted`, priority `high`). Row `101` shows state `8350031` (`Compact Programme A`, government `integrated-governme-82`, HRC membership `suspended`, last review `2023-02-14`) linked to recommendation `4649` (topic `health`, status `noted`, priority `medium`). This view supports state-level recommendation inventories.

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

## Vulnerable Group and Rights Barrier Perspectives

The view `v_u_p_r_recommendation_vulnerable_group` joins recommendations with the vulnerable groups they target, answering: which population is the focus of each recommendation, and what are that group's risk characteristics? Row `100` shows recommendation `3158134` (topic `education`, status `accepted`, priority `high`) directed at group `GRO-2079` (`Baseline Corridor D`, risk category `education_disparity`, geographic distribution `rural`, population `35`). Row `101` shows recommendation `4649` (topic `health`, status `noted`, priority `medium`) directed at group `GRO-2081` (`Distributed Series`, risk category `healthcare_access`, geographic distribution `urban`, population `42`). This view connects policy output to beneficiary populations.

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

The view `v_vulnerable_group_u_p_r_recommendation` reverses this linkage, answering: for each vulnerable group, which recommendations address it, and what are those recommendations' acceptance and priority profiles? Row `100` shows group `GRO-2079` (`Baseline Corridor D`, risk category `education_disparity`, geographic distribution `rural`, population `35`) linked to recommendation `3158134` (topic `education`, status `accepted`, priority `high`). Row `101` shows group `GRO-2081` (`Distributed Series`, risk category `healthcare_access`, geographic distribution `urban`, population `42`) linked to recommendation `4649` (topic `health`, status `noted`, priority `medium`). This orientation supports beneficiary-centric impact assessments.

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

The view `v_state_vulnerable_group` joins states with the vulnerable groups within their jurisdiction, answering: which populations fall under each state's review, and what are their risk profiles? Row `100` shows state `17788643` (`Composite Protocol`, government `extended-governme-81`, HRC membership `active`, last review `2022-09-03`) linked to group `GRO-2079` (`Baseline Corridor D`, risk category `education_disparity`, geographic distribution `rural`, population `35`). Row `101` shows state `8350031` (`Compact Programme A`, government `integrated-governme-82`, HRC membership `suspended`, last review `2023-02-14`) linked to group `GRO-2081` (`Distributed Series`, risk category `healthcare_access`, geographic distribution `urban`, population `42`). This view supports jurisdictional vulnerability mapping.

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

The view `v_vulnerable_group_state` inverts this relationship, answering: for each vulnerable group, which state has jurisdiction over it, and what is that state's administrative profile? Row `100` shows group `GRO-2079` (`Baseline Corridor D`, risk category `education_disparity`, geographic distribution `rural`, population `35`) linked to state `17788643` (`Composite Protocol`, government `extended-governme-81`, HRC membership `active`, last review `2022-09-03`). Row `101` shows group `GRO-2081` (`Distributed Series`, risk category `healthcare_access`, geographic distribution `urban`, population `42`) linked to state `8350031` (`Compact Programme A`, government `integrated-governme-82`, HRC membership `suspended`, last review `2023-02-14`). This view supports population-centric jurisdictional queries.

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

The view `v_vulnerable_group_rights_barrier_detail` joins vulnerable groups with the rights barriers they face, answering: which structural impediments affect each group, and what is the severity and mitigation status of those barriers? Row `100` shows group `GRO-2079` (`Baseline Corridor D`, risk category `education_disparity`, geographic distribution `rural`, population `35`) linked to barrier `9125631` (type `funding_disparity`, severity `critical`, evidence `extended-document-51`, mitigation `unaddressed`, created `2025-01-01`, updated `2025-01-02`). Row `101` shows group `GRO-2081` (`Distributed Series`, risk category `healthcare_access`, geographic distribution `urban`, population `42`) linked to barrier `6969441` (type `discrimination`, severity `high`, evidence `integrated-document-52`, mitigation `partially_addressed`, created `2025-02-06`, updated `2025-02-09`). This view is critical for prioritizing intervention efforts.

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

The view `v_rights_barrier_vulnerable_group` reverses this linkage, answering: for each rights barrier, which vulnerable group does it affect, and what are that group's characteristics? Row `100` shows barrier `9125631` (type `funding_disparity`, severity `critical`, evidence `extended-document-51`, mitigation `unaddressed`, created `2025-01-01`, updated `2025-01-02`) linked to group `GRO-2079` (`Baseline Corridor D`, risk category `education_disparity`, geographic distribution `rural`, population `35`). Row `101` shows barrier `6969441` (type `discrimination`, severity `high`, evidence `integrated-document-52`, mitigation `partially_addressed`, created `2025-02-06`, updated `2025-02-09`) linked to group `GRO-2081` (`Distributed Series`, risk category `healthcare_access`, geographic distribution `urban`, population `42`). This orientation supports barrier-centric impact analysis.

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

The view `v_rights_barrier_u_p_r_recommendation` joins rights barriers with the recommendations that address them, answering: which recommendations target the populations affected by each barrier, and what are those recommendations' acceptance profiles? Row `100` shows barrier `9125631` (type `funding_disparity`, severity `critical`, evidence `extended-document-51`, mitigation `unaddressed`, created `2025-01-01`, updated `2025-01-02`) linked to recommendation `3158134` (topic `education`, status `accepted`, priority `high`). Row `101` shows barrier `6969441` (type `discrimination`, severity `high`, evidence `integrated-document-52`, mitigation `partially_addressed`, created `2025-02-06`, updated `2025-02-09`) linked to recommendation `4649` (topic `health`, status `noted`, priority `medium`). This view connects structural impediments to policy responses.

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

The view `v_rights_barrier_state` joins rights barriers with the states under whose jurisdiction they fall, answering: which state is responsible for addressing each barrier, and what is that state's administrative profile? Row `100` shows barrier `9125631` (type `funding_disparity`, severity `critical`, evidence `extended-document-51`, mitigation `unaddressed`, created `2025-01-01`, updated `2025-01-02`) linked to state `17788643` (`Composite Protocol`, government `extended-governme-81`, HRC membership `active`, last review `2022-09-03`). Row `101` shows barrier `6969441` (type `discrimination`, severity `high`, evidence `integrated-document-52`, mitigation `partially_addressed`, created `2025-02-06`, updated `2025-02-09`) linked to state `8350031` (`Compact Programme A`, government `integrated-governme-82`, HRC membership `suspended`, last review `2023-02-14`). This view supports state-level barrier accountability tracking.

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

## NGO Coalition and Member Perspectives

The view `v_n_g_o_coalition_u_p_r_review_cycle` joins NGO coalitions with their associated review cycles, answering: which review cycle did each coalition engage with, and what were the cycle's procedural characteristics? Row `100` shows coalition `392482` (`Integrated Programme A`, submission date `2025-04-24`, type `oral_statement`, signatory count `2`) linked to cycle `5082976` (session date `2022-09-11`, status `completed`, outcome `adaptive-review-59`). Row `101` shows coalition `46a41ee4-9bac-11eb-a8a2-19ed5c03f8d3` (`Extended Standard`, submission date `2022-09-08`, type `written_submission`, signatory count `13`) linked to cycle `27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3` (session date `2023-02-22`, status `ongoing`, outcome `distributed-review-60`). This view tracks civil society engagement across review cycles.

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

The view `v_n_g_o_coalition_n_g_o_member_detail` joins coalitions with their member organizations, answering: which organizations comprise each coalition, and how does membership contribute to the coalition's signatory count? Row `100` shows coalition `392482` (`Integrated Programme A`, submission date `2025-04-24`, type `oral_statement`, signatory count `2`) linked to member organization `100`. Row `101` shows coalition `46a41ee4-9bac-11eb-a8a2-19ed5c03f8d3` (`Extended Standard`, submission date `2022-09-08`, type `written_submission`, signatory count `13`) linked to member organization `101`. This view supports coalition composition analysis and organizational network mapping.

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

The view `v_n_g_o_coalition_u_p_r_recommendation` joins coalitions with the recommendations they addressed in their submissions, answering: which recommendations did each coalition engage with, and what are those recommendations' characteristics? Row `100` shows coalition `392482` (`Integrated Programme A`, submission date `2025-04-24`, type `oral_statement`, signatory count `2`) linked to recommendation `3158134` (topic `education`, status `accepted`, priority `high`). Row `101` shows coalition `46a41ee4-9bac-11eb-a8a2-19ed5c03f8d3` (`Extended Standard`, submission date `2022-09-08`, type `written_submission`, signatory count `13`) linked to recommendation `4649` (topic `health`, status `noted`, priority `medium`). This view connects civil society input to policy output.

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

The view `v_n_g_o_member_n_g_o_coalition` reverses the membership linkage, answering: for each NGO member organization, which coalition does it belong to, and what are that coalition's submission details? Row `100` shows member organization `100` linked to coalition `392482` (`Integrated Programme A`, submission date `2025-04-24`, type `oral_statement`, signatory count `2`). Row `101` shows member organization `101` linked to coalition `46a41ee4-9bac-11eb-a8a2-19ed5c03f8d3` (`Extended Standard`, submission date `2022-09-08`, type `written_submission`, signatory count `13`). This orientation supports organizational affiliation tracking.

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

The view `v_n_g_o_member_u_p_r_recommendation` joins NGO member organizations with the recommendations their coalitions addressed, answering: which recommendations did each member organization indirectly engage with through its coalition membership? Row `100` shows member organization `100` linked to recommendation `3158134` (topic `education`, status `accepted`, priority `high`). Row `101` shows member organization `101` linked to recommendation `4649` (topic `health`, status `noted`, priority `medium`). This view supports civil society impact attribution.

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

The view `v_n_g_o_member_state` joins NGO member organizations with the states their coalitions engaged with, answering: which states did each member organization indirectly engage with through its coalition membership? Row `100` shows member organization `100` linked to state `17788643` (`Composite Protocol`, government `extended-governme-81`, HRC membership `active`, last review `2022-09-03`). Row `101` shows member organization `101` linked to state `8350031` (`Compact Programme A`, government `integrated-governme-82`, HRC membership `suspended`, last review `2023-02-14`). This view supports geographic scope analysis of civil society engagement.

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

## Synthesis

The Universal Periodic Review ecosystem comprises interconnected layers: review cycles that anchor temporal sessions, states that serve as subjects of examination, vulnerable groups that define beneficiary populations, rights barriers that document structural impediments, recommendations that constitute policy outputs, and NGO coalitions that provide civil society input. The base tables capture each layer's core attributes, while the cross-cutting linkage tables formalize the relationships between them. The views provide multiple analytical orientations—cycle-centric, state-centric, group-centric, barrier-centric, and coalition-centric—each answering distinct operational questions. Together, they form a comprehensive record of human rights review operations, enabling practitioners to trace the flow of accountability from peer examination through recommendation to implementation tracking.