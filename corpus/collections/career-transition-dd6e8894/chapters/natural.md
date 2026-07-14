## The Architecture of Longitudinal Career Research

Longitudinal studies of career transitions among older adults require a structured data environment capable of tracking individuals across multiple research phases, each governed by distinct principal investigators, coordinated by dedicated staff, and supported by research assistants and funding grants. The domain under examination models this ecosystem as a network of interrelated records: career transitions serve as the central phenomenon, older adults are the participants whose trajectories are followed, and research phases provide the temporal and organizational scaffolding within which data collection occurs. Principal investigators lead each phase, research coordinators manage day-to-day operations, and research assistants contribute to execution. Funding grants underwrite the work. The following reference describes the entities, their attributes, and the relationships that bind them into a coherent research management system.

### Career Transitions and Participant Profiles

The career transitions table records each observed transition event, assigning a unique identifier, a transition type, and a date range that defines the observation window. Transition types include second_career, paid_work, volunteer_work, and phased_retirement, reflecting the diverse pathways older adults may pursue. Each transition carries a description—such as Extended Survey, Pilot Corridor A, Baseline Series, or Distributed Assessment—and is linked to a research phase, anchoring the transition within a specific study period.

**Table `career_transitions`**

| id | transition_id | transition_type | start_date | end_date | description | phase_id |
|---|---|---|---|---|---|---|
| 1000 | BJewellGraham | second_career | 2022-09-05 | 2022-09-01 | Extended Survey | 20967529 |
| 1001 | 2106698 | paid_work | 2023-02-16 | 2023-02-12 | Pilot Corridor A | b7bf012e-8fcd-11eb-924d-9cd76263cbd0 |
| 1002 | state_uk_21 | volunteer_work | 2024-07-27 | 2024-07-23 | Baseline Series | 790479 |
| 1003 | 4332 | phased_retirement | 2025-12-11 | 2025-12-07 | Distributed Assessment | account_pymes_130 |

For example, the transition identified as BJewellGraham represents a second_career event spanning from 2022-09-05 to 2022-09-01, described as an Extended Survey and associated with phase 20967529. The transition 4332 captures a phased_retirement event in the Distributed Assessment phase, dated 2025-12-11 through 2025-12-07, and linked to phase account_pymes_130. These records form the backbone of the domain, as every participant's career movement is cataloged through this lens.

The older_adults table documents individual participants, recording their participant_id, age, gender, employment_status, and previous_occupation. Each older adult is linked to a career_transition_id and a phase_id, establishing the connection between the person and the transition event being studied. Ages in the dataset range from 35 to 50, and employment statuses include employed, unemployed, retired, and volunteering. Gender categories encompass male, female, non_binary, and prefer_not_to_say, reflecting the inclusive design of the study.

**Table `older_adults`**

| id | participant_id | age | gender | employment_status | previous_occupation | career_transition_id | phase_id |
|---|---|---|---|---|---|---|---|
| 1 | 3990185 | 35 | male | employed | baseline-previous-85 | 1000 | 20967529 |
| 2 | 4716387 | 40 | female | unemployed | pilot-previous-86 | 1001 | b7bf012e-8fcd-11eb-924d-9cd76263cbd0 |
| 3 | 69430 | 45 | non_binary | retired | extended-previous-87 | 1002 | 790479 |
| 4 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 50 | prefer_not_to_say | volunteering | integrated-previous-88 | 1003 | account_pymes_130 |

Participant 3990185, aged 35 and male, is employed and was previously in baseline-previous-85. This individual is linked to career transition 1000 and research phase 20967529. Participant c7460a44-8fcc-11eb-924d-9cd76263cbd0, aged 50 and identifying as prefer_not_to_say, is engaged in volunteering and was previously in integrated-previous-88, connected to transition 1003 and phase account_pymes_130. The older_adults table thus provides the demographic and occupational context for each transition event.

The transitions_adults table serves as a junction record, explicitly mapping the relationship between career transitions and older adult participants. This many-to-many linkage ensures that a single transition can be associated with multiple participants and that a single participant can be tracked across multiple transitions over time.

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

### Research Phases and Organizational Structure

Research phases constitute the operational framework of the study. Each phase is identified by a phase_id, assigned a phase_number, and characterized by a focus_area, a start_date, an end_date, and a status. The focus_area often mirrors the transition type—volunteer_work, paid_work, practitioner_perspectives—indicating the thematic emphasis of the phase. Status values include planned, active, and completed, providing a real-time indicator of each phase's progress.

**Table `research_phases`**

| phase_id | phase_number | focus_area | start_date | end_date | status | principal_investigator_id | research_coordinator_id |
|---|---|---|---|---|---|---|---|
| 20967529 | 33 | volunteer_work | 2022-09-05 | 2022-09-01 | planned | 1 | 1 |
| b7bf012e-8fcd-11eb-924d-9cd76263cbd0 | 40 | paid_work | 2023-02-16 | 2023-02-12 | active | 2 | 2 |
| 790479 | 47 | practitioner_perspectives | 2024-07-27 | 2024-07-23 | completed | 3 | 3 |
| account_pymes_130 | 54 | volunteer_work | 2025-12-11 | 2025-12-07 | planned | 4 | 4 |

Phase 20967529, numbered 33, focuses on volunteer_work and is currently in the planned status, with a date range from 2022-09-05 to 2022-09-01. Phase b7bf012e-8fcd-11eb-924d-9cd76263cbd0, numbered 40, centers on paid_work and is marked active, running from 2023-02-16 to 2023-02-12. Phase 790479, numbered 47, addresses practitioner_perspectives and has reached completed status, spanning 2024-07-27 to 2024-07-23. Phase account_pymes_130, numbered 54, returns to a volunteer_work focus and remains planned, dated 2025-12-11 to 2025-12-07.

Each research phase is assigned a principal_investigator_id and a research_coordinator_id, linking the phase to the individuals responsible for its leadership and management. The investigators_phases table formalizes the relationship between principal investigators and the phases they lead, while the assistants_phases table records which research assistants are assigned to which phases.

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

The phases_assistants table provides an additional junction between research phases and research assistants, ensuring that the assignment of assistant personnel to specific phases is explicitly tracked and queryable.

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

### Principal Investigators and Research Coordinators

Principal investigators are the senior researchers responsible for the scientific direction of each phase. The principal_investigators table records their investigator_id, full_name, title, affiliation, contact_email, and timestamps for creation and last update. Titles in the dataset include Compact Initiative, Legacy Model, Regional Cluster A, and Seasonal Review, while affiliations range from baseline-affiliat-55 to integrated-affiliat-58.

**Table `principal_investigators`**

| id | investigator_id | full_name | title | affiliation | contact_email | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1 | id_23 | Theodore Mcgrath | Compact Initiative | baseline-affiliat-55 | Christopher Wilson | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 4011 | Account Name | Legacy Model | pilot-affiliat-56 | Charles Larsen | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 3158159 | Saipan International Airport | Regional Cluster A | extended-affiliat-57 | Mary Alvarez | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 4277008 | Norma Fisher | Seasonal Review | integrated-affiliat-58 | April Snyder | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Investigator id_23, named Theodore Mcgrath, holds the title Compact Initiative and is affiliated with baseline-affiliat-55. Contact is through Christopher Wilson. This investigator was created on 2025-01-01 and last updated on 2025-01-02. Investigator 4277008, Norma Fisher, holds the title Seasonal Review, is affiliated with integrated-affiliat-58, and is contacted through April Snyder, with records created on 2025-04-16 and updated on 2025-04-23.

Research coordinators manage the operational execution of each phase. The research_coordinators table captures their coordinator_id, full_name, role, start_date, end_date, and phase_id. Roles include Project Coordinator, Research Associate, and Director. The coordinator records are phase-specific, meaning a coordinator's tenure is bounded by the start and end dates of the phase they support.

**Table `research_coordinators`**

| id | coordinator_id | full_name | role | start_date | end_date | phase_id |
|---|---|---|---|---|---|---|
| 1 | 9246324 | Theodore Mcgrath | Project Coordinator | 2022-09-05 | 2022-09-01 | 20967529 |
| 2 | 726055 | Account Name | Research Associate | 2023-02-16 | 2023-02-12 | b7bf012e-8fcd-11eb-924d-9cd76263cbd0 |
| 3 | 650 | Saipan International Airport | Director | 2024-07-27 | 2024-07-23 | 790479 |
| 4 | ChIJATGfojhu5kcR_6G9KAUQsm4 | Norma Fisher | Project Coordinator | 2025-12-11 | 2025-12-07 | account_pymes_130 |

Coordinator 9246324, Theodore Mcgrath, serves as a Project Coordinator for phase 20967529, with a tenure from 2022-09-05 to 2022-09-01. Coordinator ChIJATGfojhu5kcR_6G9KAUQsm4, Norma Fisher, also holds the Project Coordinator role for phase account_pymes_130, spanning 2025-12-11 to 2025-12-07. The coordinator_id 650, Saipan International Airport, serves as Director for phase 790479, reflecting the organizational diversity of the research team.

### Research Assistants and Funding Grants

Research assistants support the data collection and analysis activities within each phase. The research_assistants table records their assistant_id, full_name, degree, institution, and timestamps. Degrees range from B.A. to M.A. to HRM, and institutions include York University and Seneca College.

**Table `research_assistants`**

| id | assistant_id | full_name | degree | institution | created_at | updated_at |
|---|---|---|---|---|---|---|
| 1 | gd_acc_260002 | Theodore Mcgrath | B.A. | York University | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 5844275 | Account Name | M.A. | Seneca College | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 3e9a28c8-8fcd-11eb-924d-9cd76263cbd0 | Saipan International Airport | HRM | York University | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 5917293 | Norma Fisher | B.A. | Seneca College | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Assistant gd_acc_260002, Theodore Mcgrath, holds a B.A. from York University and was created on 2025-01-01. Assistant 5844275, Account Name, holds an M.A. from Seneca College, with records created on 2025-02-06 and updated on 2025-02-09. Assistant 3e9a28c8-8fcd-11eb-924d-9cd76263cbd0, Saipan International Airport, holds an HRM degree from York University, created on 2025-03-11.

Funding grants provide the financial foundation for the research. The funding_grants table captures grant identifiers and their associated details, linking financial resources to the research phases they support. The grants_phases table formalizes the relationship between grants and phases, ensuring that each phase's funding source is explicitly documented.

**Table `funding_grants`**

| funding_grant_id | grant_id | funder_name | amount | award_date | purpose |
|---|---|---|---|---|---|
| 100 | 2618568 | Distributed Cluster | 13.49 | 2025-12-01 | adaptive-purpose-11 |
| 101 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Adaptive Review D | 25.47 | 2022-05-12 | distributed-purpose-12 |
| 102 | 50ba0564-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Initiative | 19.72 | 2023-10-23 | baseline-purpose-13 |
| 103 | 5881 | Composite Model | 12.74 | 2024-03-07 | pilot-purpose-14 |

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

### Joined Views and Analytical Perspectives

The domain's analytical power emerges from its joined views, which synthesize data across multiple tables to answer specific research and management questions. Each view represents a curated perspective on the underlying records.

The view v_career_transition_older_adult_detail combines career transitions with older adult participant records, providing a comprehensive profile of each transition alongside the demographic and occupational characteristics of the associated participants. This view answers the question: what are the participant profiles associated with each career transition?

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

In this view, a row linking transition BJewellGraham (second_career, Extended Survey) with participant 3990185 (age 35, male, employed, baseline-previous-85) illustrates how a specific transition event is contextualized by the participant's attributes. The view enables researchers to analyze transition patterns across demographic segments.

The view v_career_transition_research_phase joins career transitions with research phases, revealing which transitions are conducted within which phases. This view answers: which career transitions are associated with each research phase?

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

A row connecting transition 2106698 (paid_work, Pilot Corridor A) with phase b7bf012e-8fcd-11eb-924d-9cd76263cbd0 (phase_number 40, paid_work, active) demonstrates the alignment between transition focus and phase focus. Such alignment supports quality assurance and thematic coherence across the study.

The view v_older_adult_career_transition links older adult participants directly to their career transitions, providing a participant-centric view of their transition history. This view answers: which career transitions has each older adult experienced?

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

A row showing participant 69430 (age 45, non_binary, retired, extended-previous-87) linked to transition state_uk_21 (volunteer_work, Baseline Series) enables longitudinal tracking of individual participants across their career trajectories.

The view v_older_adult_research_phase connects older adult participants to the research phases in which they are enrolled, answering: which research phases include each older adult participant?

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

Participant c7460a44-8fcc-11eb-924d-9cd76263cbd0 (age 50, volunteering, integrated-previous-88) appears in phase account_pymes_130 (phase_number 54, volunteer_work, planned), illustrating the enrollment of participants within specific phase contexts.

The view v_research_phase_principal_investigator joins research phases with their assigned principal investigators, answering: which principal investigator leads each research phase?

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

Phase 20967529 (volunteer_work, planned) is led by investigator id_23, Theodore Mcgrath, of Compact Initiative affiliation. Phase b7bf012e-8fcd-11eb-924d-9cd76263cbd0 (paid_work, active) is led by investigator 4011, Account Name, of Legacy Model affiliation. This view supports accountability and resource allocation analysis.

The view v_research_phase_research_coordinator links research phases with their assigned research coordinators, answering: which research coordinator manages each phase?

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

Phase 790479 (practitioner_perspectives, completed) is managed by coordinator 650, Saipan International Airport, serving as Director. Phase account_pymes_130 (volunteer_work, planned) is managed by coordinator ChIJATGfojhu5kcR_6G9KAUQsm4, Norma Fisher, as Project Coordinator. This view is essential for operational oversight.

The view v_research_phase_research_assistant_detail combines research phases with their assigned research assistants, answering: which research assistants are deployed in each phase?

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

Phase 20967529 includes assistant gd_acc_260002, Theodore Mcgrath, holding a B.A. from York University. Phase b7bf012e-8fcd-11eb-924d-9cd76263cbd0 includes assistant 5844275, Account Name, holding an M.A. from Seneca College. This view supports staffing analysis and workload distribution.

The view v_principal_investigator_research_phase_detail provides a principal investigator-centric perspective, listing all phases led by each investigator along with phase-level details. This view answers: which phases does each principal investigator lead, and what are their characteristics?

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

Investigator 3158159, Saipan International Airport, of Regional Cluster A affiliation, leads phase 790479 (practitioner_perspectives, completed). This view is valuable for evaluating investigator workload and phase outcomes by leadership.

The view v_research_coordinator_research_phase links research coordinators to their assigned phases, providing a coordinator-centric view of their assignments. This view answers: which phases is each research coordinator assigned to?

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

Coordinator 9246324, Theodore Mcgrath, serves as Project Coordinator for phase 20967529. Coordinator 726055, Account Name, serves as Research Associate for phase b7bf012e-8fcd-11eb-924d-9cd76263cbd0. This view supports coordination capacity planning.

The view v_research_assistant_research_phase_detail combines research assistants with their assigned phases, providing an assistant-centric view of their deployments. This view answers: which phases is each research assistant assigned to?

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

Assistant 3e9a28c8-8fcd-11eb-924d-9cd76263cbd0, Saipan International Airport, with an HRM degree from York University, is assigned to a specific phase. Assistant 5917293, Norma Fisher, with a B.A. from Seneca College, is similarly linked. This view supports assistant workload and qualification analysis.

The view v_funding_grant_research_phase_detail joins funding grants with research phases, answering: which funding grants support each research phase?

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

This view is critical for financial oversight, linking each phase to its funding source and enabling budget tracking across the research portfolio.

### Synthesis

The domain models a comprehensive research management ecosystem in which career transitions among older adults are observed, documented, and analyzed within the structured context of research phases. Principal investigators provide scientific leadership, research coordinators ensure operational execution, and research assistants contribute to data activities. Funding grants underwrite the work, and junction tables like transitions_adults, investigators_phases, assistants_phases, phases_assistants, and grants_phases formalize the many-to-many relationships that characterize real-world research organizations. The joined views—v_career_transition_older_adult_detail, v_career_transition_research_phase, v_older_adult_career_transition, v_older_adult_research_phase, v_research_phase_principal_investigator, v_research_phase_research_coordinator, v_research_phase_research_assistant_detail, v_principal_investigator_research_phase_detail, v_research_coordinator_research_phase, v_research_assistant_research_phase_detail, and v_funding_grant_research_phase_detail—provide the analytical lenses through which stakeholders can query the system from participant, transition, phase, investigator, coordinator, assistant, and funding perspectives. Together, these entities and views form a coherent, queryable record of longitudinal career research operations.