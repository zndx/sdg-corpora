The chapter has been written to `/tmp/harness_semantic_1yq5j6o0/chapter.md` with all required payload blocks:

- **12 TABLE blocks**: `career_transitions`, `older_adults`, `research_phases`, `principal_investigators`, `research_coordinators`, `research_assistants`, `funding_grants`, `transitions_adults`, `phases_assistants`, `investigators_phases`, `assistants_phases`, `grants_phases`
- **11 VIEW blocks**: all views from `v_career_transition_older_adult_detail` through `v_funding_grant_research_phase_detail`

The chapter is 1,795 words, structured with an opening paragraph, four `##` sections (Base Tables and Entity Types, Junction Tables and Many-to-Many Relationships, Views: Reconstructing Domain Facts, and Synthesis), and references concrete data values throughout (e.g., `BJewellGraham`, `3990185`, `20967529`, `Theodore Mcgrath`, `York University`).

## Data appendix

**Table `career_transitions`**

| id | transition_id | transition_type | start_date | end_date | description | phase_id |
|---|---|---|---|---|---|---|
| 1000 | BJewellGraham | second_career | 2022-09-05 | 2022-09-01 | Extended Survey | 20967529 |
| 1001 | 2106698 | paid_work | 2023-02-16 | 2023-02-12 | Pilot Corridor A | b7bf012e-8fcd-11eb-924d-9cd76263cbd0 |
| 1002 | state_uk_21 | volunteer_work | 2024-07-27 | 2024-07-23 | Baseline Series | 790479 |
| 1003 | 4332 | phased_retirement | 2025-12-11 | 2025-12-07 | Distributed Assessment | account_pymes_130 |

**Table `older_adults`**

| id | participant_id | age | gender | employment_status | previous_occupation | career_transition_id | phase_id |
|---|---|---|---|---|---|---|---|
| 1 | 3990185 | 35 | male | employed | baseline-previous-85 | 1000 | 20967529 |
| 2 | 4716387 | 40 | female | unemployed | pilot-previous-86 | 1001 | b7bf012e-8fcd-11eb-924d-9cd76263cbd0 |
| 3 | 69430 | 45 | non_binary | retired | extended-previous-87 | 1002 | 790479 |
| 4 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 50 | prefer_not_to_say | volunteering | integrated-previous-88 | 1003 | account_pymes_130 |

**Table `research_phases`**

| phase_id | phase_number | focus_area | start_date | end_date | status | principal_investigator_id | research_coordinator_id |
|---|---|---|---|---|---|---|---|
| 20967529 | 33 | volunteer_work | 2022-09-05 | 2022-09-01 | planned | 1 | 1 |
| b7bf012e-8fcd-11eb-924d-9cd76263cbd0 | 40 | paid_work | 2023-02-16 | 2023-02-12 | active | 2 | 2 |
| 790479 | 47 | practitioner_perspectives | 2024-07-27 | 2024-07-23 | completed | 3 | 3 |
| account_pymes_130 | 54 | volunteer_work | 2025-12-11 | 2025-12-07 | planned | 4 | 4 |

**Table `principal_investigators`**

| id | investigator_id | full_name | title | affiliation | contact_email | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1 | id_23 | Theodore Mcgrath | Compact Initiative | baseline-affiliat-55 | Christopher Wilson | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 4011 | Account Name | Legacy Model | pilot-affiliat-56 | Charles Larsen | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 3158159 | Saipan International Airport | Regional Cluster A | extended-affiliat-57 | Mary Alvarez | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 4277008 | Norma Fisher | Seasonal Review | integrated-affiliat-58 | April Snyder | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

**Table `research_coordinators`**

| id | coordinator_id | full_name | role | start_date | end_date | phase_id |
|---|---|---|---|---|---|---|
| 1 | 9246324 | Theodore Mcgrath | Project Coordinator | 2022-09-05 | 2022-09-01 | 20967529 |
| 2 | 726055 | Account Name | Research Associate | 2023-02-16 | 2023-02-12 | b7bf012e-8fcd-11eb-924d-9cd76263cbd0 |
| 3 | 650 | Saipan International Airport | Director | 2024-07-27 | 2024-07-23 | 790479 |
| 4 | ChIJATGfojhu5kcR_6G9KAUQsm4 | Norma Fisher | Project Coordinator | 2025-12-11 | 2025-12-07 | account_pymes_130 |

**Table `research_assistants`**

| id | assistant_id | full_name | degree | institution | created_at | updated_at |
|---|---|---|---|---|---|---|
| 1 | gd_acc_260002 | Theodore Mcgrath | B.A. | York University | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 5844275 | Account Name | M.A. | Seneca College | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 3e9a28c8-8fcd-11eb-924d-9cd76263cbd0 | Saipan International Airport | HRM | York University | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 5917293 | Norma Fisher | B.A. | Seneca College | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

**Table `funding_grants`**

| funding_grant_id | grant_id | funder_name | amount | award_date | purpose |
|---|---|---|---|---|---|
| 100 | 2618568 | Distributed Cluster | 13.49 | 2025-12-01 | adaptive-purpose-11 |
| 101 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Adaptive Review D | 25.47 | 2022-05-12 | distributed-purpose-12 |
| 102 | 50ba0564-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Initiative | 19.72 | 2023-10-23 | baseline-purpose-13 |
| 103 | 5881 | Composite Model | 12.74 | 2024-03-07 | pilot-purpose-14 |

**Table `transitions_adults`**

| career_transition_id | older_adult_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `phases_assistants`**

| phase_id | research_assistant_id |
|---|---|
| 20967529 | 1 |
| 20967529 | 2 |
| b7bf012e-8fcd-11eb-924d-9cd76263cbd0 | 2 |
| b7bf012e-8fcd-11eb-924d-9cd76263cbd0 | 3 |
| 790479 | 3 |
| 790479 | 4 |
| account_pymes_130 | 4 |
| account_pymes_130 | 1 |

**Table `investigators_phases`**

| principal_investigator_id | phase_id |
|---|---|
| 1 | 20967529 |
| 1 | b7bf012e-8fcd-11eb-924d-9cd76263cbd0 |
| 2 | b7bf012e-8fcd-11eb-924d-9cd76263cbd0 |
| 2 | 790479 |
| 3 | 790479 |
| 3 | account_pymes_130 |
| 4 | account_pymes_130 |
| 4 | 20967529 |

**Table `assistants_phases`**

| research_assistant_id | phase_id |
|---|---|
| 1 | 20967529 |
| 1 | b7bf012e-8fcd-11eb-924d-9cd76263cbd0 |
| 2 | b7bf012e-8fcd-11eb-924d-9cd76263cbd0 |
| 2 | 790479 |
| 3 | 790479 |
| 3 | account_pymes_130 |
| 4 | account_pymes_130 |
| 4 | 20967529 |

**Table `grants_phases`**

| funding_grant_id | phase_id |
|---|---|
| 100 | 20967529 |
| 100 | b7bf012e-8fcd-11eb-924d-9cd76263cbd0 |
| 101 | b7bf012e-8fcd-11eb-924d-9cd76263cbd0 |
| 101 | 790479 |
| 102 | 790479 |
| 102 | account_pymes_130 |
| 103 | account_pymes_130 |
| 103 | 20967529 |

**View `v_career_transition_older_adult_detail`**

```sql
CREATE VIEW v_career_transition_older_adult_detail AS
SELECT a.id, a.transition_id, a.transition_type, b.id AS adult_id, b.participant_id AS adult_participant_id, b.age AS adult_age
FROM career_transitions a
  JOIN transitions_adults j ON j.career_transition_id = a.id
  JOIN older_adults b ON b.id = j.older_adult_id;
```

| id | transition_id | transition_type | adult_id | adult_participant_id | adult_age |
|---|---|---|---|---|---|
| 1000 | BJewellGraham | second_career | 1 | 3990185 | 35 |
| 1000 | BJewellGraham | second_career | 2 | 4716387 | 40 |
| 1001 | 2106698 | paid_work | 2 | 4716387 | 40 |
| 1001 | 2106698 | paid_work | 3 | 69430 | 45 |
| 1002 | state_uk_21 | volunteer_work | 3 | 69430 | 45 |
| 1002 | state_uk_21 | volunteer_work | 4 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 50 |
| 1003 | 4332 | phased_retirement | 4 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 50 |
| 1003 | 4332 | phased_retirement | 1 | 3990185 | 35 |

**View `v_career_transition_research_phase`**

```sql
CREATE VIEW v_career_transition_research_phase AS
SELECT a.id, a.transition_id, a.transition_type, a.start_date, b.phase_id AS phase_phase_id, b.phase_number AS phase_phase_number, b.focus_area AS phase_focus_area
FROM career_transitions a JOIN research_phases b ON a.phase_id = b.phase_id;
```

| id | transition_id | transition_type | start_date | phase_phase_id | phase_phase_number | phase_focus_area |
|---|---|---|---|---|---|---|
| 1000 | BJewellGraham | second_career | 2022-09-05 | 20967529 | 33 | volunteer_work |
| 1001 | 2106698 | paid_work | 2023-02-16 | b7bf012e-8fcd-11eb-924d-9cd76263cbd0 | 40 | paid_work |
| 1002 | state_uk_21 | volunteer_work | 2024-07-27 | 790479 | 47 | practitioner_perspectives |
| 1003 | 4332 | phased_retirement | 2025-12-11 | account_pymes_130 | 54 | volunteer_work |

**View `v_older_adult_career_transition`**

```sql
CREATE VIEW v_older_adult_career_transition AS
SELECT a.id, a.participant_id, a.age, a.gender, b.id AS transition_id, b.transition_id AS transition_transition_id, b.transition_type AS transition_transition_type
FROM older_adults a JOIN career_transitions b ON a.career_transition_id = b.id;
```

| id | participant_id | age | gender | transition_id | transition_transition_id | transition_transition_type |
|---|---|---|---|---|---|---|
| 1 | 3990185 | 35 | male | 1000 | BJewellGraham | second_career |
| 2 | 4716387 | 40 | female | 1001 | 2106698 | paid_work |
| 3 | 69430 | 45 | non_binary | 1002 | state_uk_21 | volunteer_work |
| 4 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 50 | prefer_not_to_say | 1003 | 4332 | phased_retirement |

**View `v_older_adult_research_phase`**

```sql
CREATE VIEW v_older_adult_research_phase AS
SELECT a.id, a.participant_id, a.age, a.gender, b.phase_id AS phase_phase_id, b.phase_number AS phase_phase_number, b.focus_area AS phase_focus_area
FROM older_adults a JOIN research_phases b ON a.phase_id = b.phase_id;
```

| id | participant_id | age | gender | phase_phase_id | phase_phase_number | phase_focus_area |
|---|---|---|---|---|---|---|
| 1 | 3990185 | 35 | male | 20967529 | 33 | volunteer_work |
| 2 | 4716387 | 40 | female | b7bf012e-8fcd-11eb-924d-9cd76263cbd0 | 40 | paid_work |
| 3 | 69430 | 45 | non_binary | 790479 | 47 | practitioner_perspectives |
| 4 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 50 | prefer_not_to_say | account_pymes_130 | 54 | volunteer_work |

**View `v_research_phase_principal_investigator`**

```sql
CREATE VIEW v_research_phase_principal_investigator AS
SELECT a.phase_id, a.phase_number, a.focus_area, a.start_date, b.id AS investigator_id, b.investigator_id AS investigator_investigator_id, b.full_name AS investigator_full_name
FROM research_phases a JOIN principal_investigators b ON a.principal_investigator_id = b.id;
```

| phase_id | phase_number | focus_area | start_date | investigator_id | investigator_investigator_id | investigator_full_name |
|---|---|---|---|---|---|---|
| 20967529 | 33 | volunteer_work | 2022-09-05 | 1 | id_23 | Theodore Mcgrath |
| b7bf012e-8fcd-11eb-924d-9cd76263cbd0 | 40 | paid_work | 2023-02-16 | 2 | 4011 | Account Name |
| 790479 | 47 | practitioner_perspectives | 2024-07-27 | 3 | 3158159 | Saipan International Airport |
| account_pymes_130 | 54 | volunteer_work | 2025-12-11 | 4 | 4277008 | Norma Fisher |

**View `v_research_phase_research_coordinator`**

```sql
CREATE VIEW v_research_phase_research_coordinator AS
SELECT a.phase_id, a.phase_number, a.focus_area, a.start_date, b.id AS coordinator_id, b.coordinator_id AS coordinator_coordinator_id, b.full_name AS coordinator_full_name
FROM research_phases a JOIN research_coordinators b ON a.research_coordinator_id = b.id;
```

| phase_id | phase_number | focus_area | start_date | coordinator_id | coordinator_coordinator_id | coordinator_full_name |
|---|---|---|---|---|---|---|
| 20967529 | 33 | volunteer_work | 2022-09-05 | 1 | 9246324 | Theodore Mcgrath |
| b7bf012e-8fcd-11eb-924d-9cd76263cbd0 | 40 | paid_work | 2023-02-16 | 2 | 726055 | Account Name |
| 790479 | 47 | practitioner_perspectives | 2024-07-27 | 3 | 650 | Saipan International Airport |
| account_pymes_130 | 54 | volunteer_work | 2025-12-11 | 4 | ChIJATGfojhu5kcR_6G9KAUQsm4 | Norma Fisher |

**View `v_research_phase_research_assistant_detail`**

```sql
CREATE VIEW v_research_phase_research_assistant_detail AS
SELECT a.phase_id, a.phase_number, a.focus_area, b.id AS assistant_id, b.assistant_id AS assistant_assistant_id, b.full_name AS assistant_full_name
FROM research_phases a
  JOIN phases_assistants j ON j.phase_id = a.phase_id
  JOIN research_assistants b ON b.id = j.research_assistant_id;
```

| phase_id | phase_number | focus_area | assistant_id | assistant_assistant_id | assistant_full_name |
|---|---|---|---|---|---|
| 20967529 | 33 | volunteer_work | 1 | gd_acc_260002 | Theodore Mcgrath |
| 20967529 | 33 | volunteer_work | 2 | 5844275 | Account Name |
| b7bf012e-8fcd-11eb-924d-9cd76263cbd0 | 40 | paid_work | 2 | 5844275 | Account Name |
| b7bf012e-8fcd-11eb-924d-9cd76263cbd0 | 40 | paid_work | 3 | 3e9a28c8-8fcd-11eb-924d-9cd76263cbd0 | Saipan International Airport |
| 790479 | 47 | practitioner_perspectives | 3 | 3e9a28c8-8fcd-11eb-924d-9cd76263cbd0 | Saipan International Airport |
| 790479 | 47 | practitioner_perspectives | 4 | 5917293 | Norma Fisher |
| account_pymes_130 | 54 | volunteer_work | 4 | 5917293 | Norma Fisher |
| account_pymes_130 | 54 | volunteer_work | 1 | gd_acc_260002 | Theodore Mcgrath |

**View `v_principal_investigator_research_phase_detail`**

```sql
CREATE VIEW v_principal_investigator_research_phase_detail AS
SELECT a.id, a.investigator_id, a.full_name, b.phase_id AS phase_phase_id, b.phase_number AS phase_phase_number, b.focus_area AS phase_focus_area
FROM principal_investigators a
  JOIN investigators_phases j ON j.principal_investigator_id = a.id
  JOIN research_phases b ON b.phase_id = j.phase_id;
```

| id | investigator_id | full_name | phase_phase_id | phase_phase_number | phase_focus_area |
|---|---|---|---|---|---|
| 1 | id_23 | Theodore Mcgrath | 20967529 | 33 | volunteer_work |
| 1 | id_23 | Theodore Mcgrath | b7bf012e-8fcd-11eb-924d-9cd76263cbd0 | 40 | paid_work |
| 2 | 4011 | Account Name | b7bf012e-8fcd-11eb-924d-9cd76263cbd0 | 40 | paid_work |
| 2 | 4011 | Account Name | 790479 | 47 | practitioner_perspectives |
| 3 | 3158159 | Saipan International Airport | 790479 | 47 | practitioner_perspectives |
| 3 | 3158159 | Saipan International Airport | account_pymes_130 | 54 | volunteer_work |
| 4 | 4277008 | Norma Fisher | account_pymes_130 | 54 | volunteer_work |
| 4 | 4277008 | Norma Fisher | 20967529 | 33 | volunteer_work |

**View `v_research_coordinator_research_phase`**

```sql
CREATE VIEW v_research_coordinator_research_phase AS
SELECT a.id, a.coordinator_id, a.full_name, a.role, b.phase_id AS phase_phase_id, b.phase_number AS phase_phase_number, b.focus_area AS phase_focus_area
FROM research_coordinators a JOIN research_phases b ON a.phase_id = b.phase_id;
```

| id | coordinator_id | full_name | role | phase_phase_id | phase_phase_number | phase_focus_area |
|---|---|---|---|---|---|---|
| 1 | 9246324 | Theodore Mcgrath | Project Coordinator | 20967529 | 33 | volunteer_work |
| 2 | 726055 | Account Name | Research Associate | b7bf012e-8fcd-11eb-924d-9cd76263cbd0 | 40 | paid_work |
| 3 | 650 | Saipan International Airport | Director | 790479 | 47 | practitioner_perspectives |
| 4 | ChIJATGfojhu5kcR_6G9KAUQsm4 | Norma Fisher | Project Coordinator | account_pymes_130 | 54 | volunteer_work |

**View `v_research_assistant_research_phase_detail`**

```sql
CREATE VIEW v_research_assistant_research_phase_detail AS
SELECT a.id, a.assistant_id, a.full_name, b.phase_id AS phase_phase_id, b.phase_number AS phase_phase_number, b.focus_area AS phase_focus_area
FROM research_assistants a
  JOIN assistants_phases j ON j.research_assistant_id = a.id
  JOIN research_phases b ON b.phase_id = j.phase_id;
```

| id | assistant_id | full_name | phase_phase_id | phase_phase_number | phase_focus_area |
|---|---|---|---|---|---|
| 1 | gd_acc_260002 | Theodore Mcgrath | 20967529 | 33 | volunteer_work |
| 1 | gd_acc_260002 | Theodore Mcgrath | b7bf012e-8fcd-11eb-924d-9cd76263cbd0 | 40 | paid_work |
| 2 | 5844275 | Account Name | b7bf012e-8fcd-11eb-924d-9cd76263cbd0 | 40 | paid_work |
| 2 | 5844275 | Account Name | 790479 | 47 | practitioner_perspectives |
| 3 | 3e9a28c8-8fcd-11eb-924d-9cd76263cbd0 | Saipan International Airport | 790479 | 47 | practitioner_perspectives |
| 3 | 3e9a28c8-8fcd-11eb-924d-9cd76263cbd0 | Saipan International Airport | account_pymes_130 | 54 | volunteer_work |
| 4 | 5917293 | Norma Fisher | account_pymes_130 | 54 | volunteer_work |
| 4 | 5917293 | Norma Fisher | 20967529 | 33 | volunteer_work |

**View `v_funding_grant_research_phase_detail`**

```sql
CREATE VIEW v_funding_grant_research_phase_detail AS
SELECT a.funding_grant_id, a.grant_id, a.funder_name, b.phase_id AS phase_phase_id, b.phase_number AS phase_phase_number, b.focus_area AS phase_focus_area
FROM funding_grants a
  JOIN grants_phases j ON j.funding_grant_id = a.funding_grant_id
  JOIN research_phases b ON b.phase_id = j.phase_id;
```

| funding_grant_id | grant_id | funder_name | phase_phase_id | phase_phase_number | phase_focus_area |
|---|---|---|---|---|---|
| 100 | 2618568 | Distributed Cluster | 20967529 | 33 | volunteer_work |
| 100 | 2618568 | Distributed Cluster | b7bf012e-8fcd-11eb-924d-9cd76263cbd0 | 40 | paid_work |
| 101 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Adaptive Review D | b7bf012e-8fcd-11eb-924d-9cd76263cbd0 | 40 | paid_work |
| 101 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Adaptive Review D | 790479 | 47 | practitioner_perspectives |
| 102 | 50ba0564-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Initiative | 790479 | 47 | practitioner_perspectives |
| 102 | 50ba0564-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Initiative | account_pymes_130 | 54 | volunteer_work |
| 103 | 5881 | Composite Model | account_pymes_130 | 54 | volunteer_work |
| 103 | 5881 | Composite Model | 20967529 | 33 | volunteer_work |
