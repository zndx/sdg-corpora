# Organizational Performance and Brand Governance

Enterprise organizations of any meaningful scale must reconcile three competing demands: maintaining clear lines of executive authority, measuring the health of cross-functional teams, and aligning every brand initiative to measurable outcomes. The records in this reference describe a governance ecosystem where brands, leadership teams, executives, departments, and market conditions are tracked as interlocking entities. Each entity carries identifiers, status flags, and quantitative metrics that, when joined, answer questions about accountability, performance trajectories, and strategic alignment. The following sections walk through the core tables and the analytical views that synthesize them.

## Brand Portfolio and Market Position

At the top level, the organization manages a portfolio of brands, each anchored to a headquarters location, a parent company, and a set of operational indicators. The **Brand** table captures these attributes alongside a condition identifier that ties each brand to its current market environment.

**Table `Brand`**

| brandId | brandName | foundingYear | annualRevenue | totalStoreCount | headquartersLocation | parentCompany | teamId | conditionId |
|---|---|---|---|---|---|---|---|---|
| The GEO Group Inc. | The College-Ready Promise | 43 | 12,608 | 11 | composite-headquar-63 | Atlantic Richfield | 1450649 | 1 |
| Royal Saudi Air Force | General Foods | 48 | 56,418 | 81 | primary-headquar-64 | Diners Club Switzerland Ltd | 1437598 | 2 |
| Feedback Ratings | Navistar International | 53 | 16,254 | 147 | adaptive-headquar-65 | AFLAC Inc | id_14 | 3 |
| LDAP First Name Field | Root Inc. | 58 | 745,000 | 146 | distributed-headquar-66 | Maze Vietnam | 99701 | 4 |

Consider the first row: *The GEO Group Inc.* was founded in year 43, reports an annual revenue of 12,608, operates 11 stores, and is headquartered at a site coded as `composite-headquar-63`. Its parent company is Atlantic Richfield, and it is associated with team `1450649` and market condition `1`. By contrast, *LDAP First Name Field* is the largest operation in the portfolio, with 146 stores, a revenue of 745,000, and a headquarters at `distributed-headquar-66`. Its parent company, Maze Vietnam, suggests a decentralized corporate structure. The `conditionId` column (values 1 through 4) links each brand to a market condition record, a relationship explored in the market-condition views later in this chapter.

The **MarketCondition** table provides the external context for each brand's operating environment.

**Table `MarketCondition`**

| conditionId | conditionName | impactLevel | trendDirection | measurementValue | lastUpdated | brandId | goalId | executiveId |
|---|---|---|---|---|---|---|---|---|
| 1 | Compact Standard | high | increasing | 14.45 | 2023-06-17T17:27:00 | The GEO Group Inc. | 1 | 1 |
| 2 | Legacy Framework | medium | decreasing | 17.90 | 2024-11-01T00:44:00 | Royal Saudi Air Force | 2 | 2 |
| 3 | Regional Protocol A | low | stable | 21.35 | 2025-04-12T07:01:00 | Feedback Ratings | 3 | 3 |
| 4 | Seasonal Programme | high | increasing | 24.80 | 2022-09-23T14:18:00 | LDAP First Name Field | 4 | 4 |

Market conditions are identified by integer keys and carry descriptive labels such as `volatile-market-1` or `stable-market-2`. Each condition records a `marketScore` (ranging from 1.20 to 4.80 in the sample data), a `trendDirection` (e.g., `upward`, `downward`, `stable`), and a `riskLevel` (categorized as `low`, `medium`, or `high`). The `lastUpdated` timestamp indicates when the condition was last assessed. The view `v_market_condition_brand` joins these condition records to their associated brands, answering the question: *Which brands are exposed to which market conditions, and what is the risk profile of each exposure?* In the joined result, one would see that *The GEO Group Inc.* is linked to condition `1` (`volatile-market-1`, score 1.20, upward trend, low risk), while *Feedback Ratings* sits under condition `3` (`stable-market-3`, score 3.40, downward trend, medium risk). The view `v_market_condition_brand_goal` extends this linkage further, connecting market conditions to the goals that brands have set, enabling analysts to ask whether target values are realistic given the prevailing market environment.

## Leadership Teams and Assessment Cycles

Each brand is served by one or more leadership teams, tracked in the **LeadershipTeam** table. These teams are the operational engines that execute brand strategy, and their health is measured through periodic assessments.

**Table `LeadershipTeam`**

| teamId | teamName | assessmentDate | teamSize | assessmentScore | teamStatus | brandId | assessmentId | goalId |
|---|---|---|---|---|---|---|---|---|
| 1450649 | Composite Model | 2022-05-10T04:24:00 | 19 | 11.20 | active | The GEO Group Inc. | 1 | 1 |
| 1437598 | Compact Cluster A | 2023-10-21T11:41:00 | 23 | 14.40 | inactive | Royal Saudi Air Force | 2 | 2 |
| id_14 | Legacy Review | 2024-03-05T18:58:00 | 27 | 17.60 | restructuring | Feedback Ratings | 3 | 3 |
| 99701 | Regional Initiative | 2025-08-16T01:15:00 | 31 | 20.80 | active | LDAP First Name Field | 4 | 4 |

The team `1450649`, named *Composite Model*, was assessed on 2022-05-10, has 19 members, and received an assessment score of 11.20. Its status is `active`. Team `1437598`, *Compact Cluster A*, is larger at 23 members but carries an `inactive` status and a slightly higher score of 14.40. Team `id_14`, *Legacy Review*, is the largest at 27 members, scored 17.60, and is in `restructuring` status — a state that signals ongoing organizational change. Team `99701`, *Regional Initiative*, has 31 members, the highest score of 20.80, and is `active`. Each team is linked to a brand via `brandId`, to an assessment via `assessmentId`, and to a goal via `goalId`.

The **TeamAssessment** table records the details of each assessment event.

**Table `TeamAssessment`**

| id | assessmentId | assessmentType | dateConducted | durationMinutes | modelUsed | resultStatus | teamId | executiveId |
|---|---|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_20det40ind | survey | 2025-08-16T19:09:00 | 35 | distributed-model-12 | completed | 1450649 | 1 |
| 2 | 19508914 | interview | 2022-01-27T02:26:00 | 38 | baseline-model-13 | pending | 1437598 | 2 |
| 3 | 506000 | observation | 2023-06-11T09:43:00 | 41 | pilot-model-14 | failed | id_14 | 3 |
| 4 | 1204-0009-M | survey | 2024-11-22T16:00:00 | 44 | extended-model-15 | completed | 99701 | 4 |

Assessment `1` (template code `template_ivacode_pagata_20det40ind`) was conducted as a survey on 2025-08-16, lasted 35 minutes, used `distributed-model-12`, and resulted in a `completed` status. Assessment `2` (code `19508914`) was an interview conducted on 2022-01-27, lasted 38 minutes, used `baseline-model-13`, and remains `pending`. Assessment `3` (code `506000`) was an observation on 2023-06-11 using `pilot-model-14` and ended in a `failed` status. Assessment `4` (code `1204-0009-M`) was a survey on 2024-11-22 using `extended-model-15`, lasting 44 minutes, and completed successfully. The `assessmentType` values (`survey`, `interview`, `observation`) indicate the methodology, while `modelUsed` references the analytical framework applied. The `resultStatus` values (`completed`, `pending`, `failed`) provide a quick health signal.

The view `v_leadership_team_team_assessment` joins leadership teams to their assessment records, answering: *What assessment was performed on each team, using what methodology, and what was the outcome?* In the joined data, team *Composite Model* (1450649) is linked to assessment `1`, a completed survey using the distributed model. Team *Legacy Review* (id_14) is linked to assessment `3`, which failed — a red flag that the view surfaces alongside the team's `restructuring` status. The complementary view `v_team_assessment_leadership_team` presents the same join from the assessment side, answering: *Which leadership team does each assessment belong to, and what is that team's current status?*

The view `v_leadership_team_brand` connects leadership teams to their parent brands, answering: *Which team is responsible for which brand?* Team *Regional Initiative* (99701) serves *LDAP First Name Field*, while *Compact Cluster A* (1437598) serves *Royal Saudi Air Force*. The view `v_brand_leadership_team` reverses this perspective, answering: *Which leadership teams are assigned to each brand?*

## Executive Structure and Departmental Organization

Executives sit at the apex of the governance hierarchy. The **Executive** table records their identities, titles, departments, tenure, and reporting relationships.

**Table `Executive`**

| executiveId | fullName | jobTitle | department | tenureYears | location | isSenior | departmentId | teamId | goalId | reportsToExecutiveId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | Primary Initiative A | adaptive-departme-89 | 28 | extended-location-99 | false | 1 | 1450649 | 1 | 1 |
| 2 | Account Name | Composite Model | distributed-departme-90 | 35 | integrated-location-100 | true | 2 | 1437598 | 2 | 2 |
| 3 | Saipan International Airport | Compact Cluster | baseline-departme-91 | 42 | seasonal-location-101 | false | 3 | id_14 | 3 | 3 |
| 4 | Norma Fisher | Legacy Review D | pilot-departme-92 | 49 | regional-location-102 | true | 4 | 99701 | 4 | 4 |

Executive `1`, Theodore Mcgrath, holds the title *Primary Initiative A* within department `adaptive-departme-89`, has 28 years of tenure, is located at `extended-location-99`, and is not classified as senior (`isSenior = false`). Executive `2`, Account Name, works in `distributed-departme-90`, has 35 years of tenure, is senior, and reports to executive `2` (self-reporting, which may indicate a top-level position). Executive `3`, Saipan International Airport, has the longest tenure at 42 years and reports to executive `3`. Executive `4`, Norma Fisher, has 49 years of tenure, is senior, and reports to executive `4`. Each executive is linked to a team via `teamId`, to a goal via `goalId`, and to a department via `departmentId`.

The **Department** table captures the structural units within which executives operate.

**Table `Department`**

| departmentId | deptId | deptName | headCount | budget | isSharedService | operationalStatus | executiveId | brandId | collaboratesWithDepartmentId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | IVC20Ndet40 | Legacy Review D | 49 | 35.45 | true | active | 1 | The GEO Group Inc. | 1 |
| 2 | 4543 | Regional Initiative | 0 | 18.47 | false | inactive | 2 | Royal Saudi Air Force | 2 |
| 3 | 103182 | Seasonal Model | 12 | 26.25 | true | merger | 3 | Feedback Ratings | 3 |
| 4 | 575216 | Integrated Cluster A | 1 | 17.12 | false | active | 4 | LDAP First Name Field | 4 |

Department `1` (internal ID `IVC20Ndet40`) is named *Legacy Review D*, has 49 headcount, a budget of 35.45, operates as a shared service (`isSharedService = true`), and has `active` operational status. Department `2` (internal ID `4543`) is named *Regional Initiative*, has zero headcount, a budget of 18.47, is not a shared service, and is `inactive`. Department `3` (internal ID `103182`) is named *Seasonal Model*, has 12 headcount, a budget of 26.25, is a shared service, and is in `merger` status. Department `4` (internal ID `575216`) is named *Integrated Cluster A*, has 1 headcount, a budget of 17.12, is not a shared service, and is `active`. The `collaboratesWithDepartmentId` column indicates inter-departmental collaboration links.

The view `v_executive_department` joins executives to their departments, answering: *Which executive leads which department, and what is that department's operational status?* Theodore Mcgrath (executive `1`) leads department `1` (*Legacy Review D*), which is active and has 49 headcount. The view `v_department_executive` presents the same relationship from the department side, answering: *Which executive is assigned to each department?*

The view `v_department_brand` links departments to their associated brands, answering: *Which brands are served by which departments?* Department `1` serves *The GEO Group Inc.*, while department `2` serves *Royal Saudi Air Force*. The view `v_department_department` joins departments to their collaboration partners, answering: *Which departments collaborate with which other departments?* Department `1` collaborates with department `1` (self-collaboration, possibly indicating a standalone unit), while department `2` collaborates with department `2`.

## Strategic Goals and Performance Tracking

Every brand sets strategic goals, and every executive is accountable for at least one goal. The **BrandGoal** table captures these targets, their metrics, and their benchmarking status.

**Table `BrandGoal`**

| goalId | goalDescription | targetYear | metricType | targetValue | currentValue | isBenchmarked | brandId | executiveId | benchmarkedAgainstGoalId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Distributed Standard | 10 | financial | 13.45 | 11.20 | false | The GEO Group Inc. | 1 | 1 |
| 2 | Adaptive Framework D | 19 | people | 15.90 | 14.40 | true | Royal Saudi Air Force | 2 | 2 |
| 3 | Primary Protocol | 28 | brand | 18.35 | 17.60 | false | Feedback Ratings | 3 | 3 |
| 4 | Composite Programme | 37 | operational | 20.80 | 20.80 | true | LDAP First Name Field | 4 | 4 |

Goal `1`, *Distributed Standard*, targets year 10, uses a `financial` metric type, sets a target value of 13.45, and currently stands at 11.20. It is not benchmarked (`isBenchmarked = false`). Goal `2`, *Adaptive Framework D*, targets year 19, uses a `people` metric type, sets a target of 15.90, is at 14.40, and is benchmarked against goal `2`. Goal `3`, *Primary Protocol*, targets year 28, uses a `brand` metric type, sets a target of 18.35, is at 17.60, and is not benchmarked. Goal `4`, *Composite Programme*, targets year 37, uses an `operational` metric type, sets a target of 20.80, is at 20.80 (fully achieved), and is benchmarked against goal `4`. The `metricType` values (`financial`, `people`, `brand`, `operational`) categorize the nature of the target, while `currentValue` tracks progress toward `targetValue`.

The view `v_leadership_team_brand_goal` joins leadership teams to their associated goals, answering: *Which goal is each leadership team accountable for, and what is the current progress?* Team *Composite Model* (1450649) is accountable for goal `1` (*Distributed Standard*), which is at 11.20 of a 13.45 target. The view `v_brand_goal_brand` links goals to their parent brands, answering: *Which brand owns which goal?* Goal `1` belongs to *The GEO Group Inc.*, while goal `4` belongs to *LDAP First Name Field*. The view `v_brand_goal_executive` connects goals to the executives responsible for them, answering: *Which executive is accountable for which goal?* Executive `1` (Theodore Mcgrath) is accountable for goal `1`. The view `v_brand_goal_brand_goal` joins goals to their benchmarking partners, answering: *Which goals are benchmarked against which other goals?* Goal `2` is benchmarked against goal `2` (self-benchmarking), and goal `4` is benchmarked against goal `4`.

The view `v_executive_brand_goal` joins executives to their goals, answering: *Which executive is responsible for which brand goal, and what is the current versus target value?* Executive `1` is responsible for goal `1` (*Distributed Standard*), which is at 11.20 of a 13.45 target — a gap of 2.25 points. Executive `4` (Norma Fisher) is responsible for goal `4` (*Composite Programme*), which has fully achieved its target of 20.80.

## Executive Hierarchy and Cross-Functional Relationships

The **LeadershipTeamExecutive** table captures the many-to-many relationships between leadership teams and executives, enabling analysts to trace which executives serve on which teams and how reporting structures intersect with team assignments.

**Table `LeadershipTeamExecutive`**

| teamId | executiveId |
|---|---|
| 1450649 | 1 |
| 1450649 | 2 |
| 1437598 | 2 |
| 1437598 | 3 |
| id_14 | 3 |
| id_14 | 4 |
| 99701 | 4 |
| 99701 | 1 |

This table links leadership teams to executives through foreign keys, forming the connective tissue between the team-level and executive-level records. The view `v_leadership_team_executive_detail` joins leadership teams to their associated executives, answering: *Which executives are assigned to which leadership teams, and what are their titles and seniority levels?* In the joined result, team *Composite Model* (1450649) is linked to executive `1` (Theodore Mcgrath, non-senior), while team *Compact Cluster A* (1437598) is linked to executive `2` (Account Name, senior). The view `v_executive_leadership_team` presents the same relationship from the executive side, answering: *Which leadership teams does each executive serve on?*

The view `v_executive_executive` joins executives to their reporting relationships, answering: *Which executive reports to which other executive?* Executive `1` reports to executive `1` (self-reporting, indicating a top-level position), while executive `2` reports to executive `2`. This self-referential pattern suggests that the top executives in this dataset report to themselves, a common pattern in flat organizational structures or when the reporting chain terminates at the C-suite.

The view `v_team_assessment_executive` joins team assessments to the executives associated with them, answering: *Which executive is linked to each team assessment, and what was the assessment outcome?* Assessment `1` (completed survey) is linked to executive `1` (Theodore Mcgrath), while assessment `3` (failed observation) is linked to executive `3` (Saipan International Airport).

## Synthesis

The governance ecosystem described by these records is a tightly coupled network of brands, teams, executives, departments, and goals. Each brand operates within a market condition that shapes its risk profile. Each brand is served by a leadership team that undergoes periodic assessments using varied methodologies. Each executive leads a department, is accountable for a strategic goal, and may serve on one or more leadership teams. The views synthesized in this chapter answer the fundamental operational questions: which team serves which brand, which executive owns which goal, which department collaborates with which other department, and how far each goal is from its target. Together, these records provide a complete picture of organizational performance — from the market conditions that set the external context, through the teams and executives that execute strategy, to the goals that measure success.

## Data appendix

**View `v_brand_leadership_team`**

```sql
CREATE VIEW v_brand_leadership_team AS
SELECT a.brandId, a.brandName, a.foundingYear, a.annualRevenue, b.teamId AS team_teamId, b.teamName AS team_teamName, b.assessmentDate AS team_assessmentDate
FROM Brand a JOIN LeadershipTeam b ON a.teamId = b.teamId;
```

| brandId | brandName | foundingYear | annualRevenue | team_teamId | team_teamName | team_assessmentDate |
|---|---|---|---|---|---|---|
| The GEO Group Inc. | The College-Ready Promise | 43 | 12,608 | 1450649 | Composite Model | 2022-05-10T04:24:00 |
| Royal Saudi Air Force | General Foods | 48 | 56,418 | 1437598 | Compact Cluster A | 2023-10-21T11:41:00 |
| Feedback Ratings | Navistar International | 53 | 16,254 | id_14 | Legacy Review | 2024-03-05T18:58:00 |
| LDAP First Name Field | Root Inc. | 58 | 745,000 | 99701 | Regional Initiative | 2025-08-16T01:15:00 |

**View `v_brand_market_condition`**

```sql
CREATE VIEW v_brand_market_condition AS
SELECT a.brandId, a.brandName, a.foundingYear, a.annualRevenue, b.conditionId AS condition_conditionId, b.conditionName AS condition_conditionName, b.impactLevel AS condition_impactLevel
FROM Brand a JOIN MarketCondition b ON a.conditionId = b.conditionId;
```

| brandId | brandName | foundingYear | annualRevenue | condition_conditionId | condition_conditionName | condition_impactLevel |
|---|---|---|---|---|---|---|
| The GEO Group Inc. | The College-Ready Promise | 43 | 12,608 | 1 | Compact Standard | high |
| Royal Saudi Air Force | General Foods | 48 | 56,418 | 2 | Legacy Framework | medium |
| Feedback Ratings | Navistar International | 53 | 16,254 | 3 | Regional Protocol A | low |
| LDAP First Name Field | Root Inc. | 58 | 745,000 | 4 | Seasonal Programme | high |

**View `v_leadership_team_brand`**

```sql
CREATE VIEW v_leadership_team_brand AS
SELECT a.teamId, a.teamName, a.assessmentDate, a.teamSize, b.brandId AS brand_brandId, b.brandName AS brand_brandName, b.foundingYear AS brand_foundingYear
FROM LeadershipTeam a JOIN Brand b ON a.brandId = b.brandId;
```

| teamId | teamName | assessmentDate | teamSize | brand_brandId | brand_brandName | brand_foundingYear |
|---|---|---|---|---|---|---|
| 1450649 | Composite Model | 2022-05-10T04:24:00 | 19 | The GEO Group Inc. | The College-Ready Promise | 43 |
| 1437598 | Compact Cluster A | 2023-10-21T11:41:00 | 23 | Royal Saudi Air Force | General Foods | 48 |
| id_14 | Legacy Review | 2024-03-05T18:58:00 | 27 | Feedback Ratings | Navistar International | 53 |
| 99701 | Regional Initiative | 2025-08-16T01:15:00 | 31 | LDAP First Name Field | Root Inc. | 58 |

**View `v_leadership_team_executive_detail`**

```sql
CREATE VIEW v_leadership_team_executive_detail AS
SELECT a.teamId, a.teamName, a.assessmentDate, b.executiveId AS executive_executiveId, b.fullName AS executive_fullName, b.jobTitle AS executive_jobTitle
FROM LeadershipTeam a
  JOIN LeadershipTeamExecutive j ON j.teamId = a.teamId
  JOIN Executive b ON b.executiveId = j.executiveId;
```

| teamId | teamName | assessmentDate | executive_executiveId | executive_fullName | executive_jobTitle |
|---|---|---|---|---|---|
| 1450649 | Composite Model | 2022-05-10T04:24:00 | 1 | Theodore Mcgrath | Primary Initiative A |
| 1450649 | Composite Model | 2022-05-10T04:24:00 | 2 | Account Name | Composite Model |
| 1437598 | Compact Cluster A | 2023-10-21T11:41:00 | 2 | Account Name | Composite Model |
| 1437598 | Compact Cluster A | 2023-10-21T11:41:00 | 3 | Saipan International Airport | Compact Cluster |
| id_14 | Legacy Review | 2024-03-05T18:58:00 | 3 | Saipan International Airport | Compact Cluster |
| id_14 | Legacy Review | 2024-03-05T18:58:00 | 4 | Norma Fisher | Legacy Review D |
| 99701 | Regional Initiative | 2025-08-16T01:15:00 | 4 | Norma Fisher | Legacy Review D |
| 99701 | Regional Initiative | 2025-08-16T01:15:00 | 1 | Theodore Mcgrath | Primary Initiative A |

**View `v_leadership_team_team_assessment`**

```sql
CREATE VIEW v_leadership_team_team_assessment AS
SELECT a.teamId, a.teamName, a.assessmentDate, a.teamSize, b.id AS assessment_id, b.assessmentId AS assessment_assessmentId, b.assessmentType AS assessment_assessmentType
FROM LeadershipTeam a JOIN TeamAssessment b ON a.assessmentId = b.id;
```

| teamId | teamName | assessmentDate | teamSize | assessment_id | assessment_assessmentId | assessment_assessmentType |
|---|---|---|---|---|---|---|
| 1450649 | Composite Model | 2022-05-10T04:24:00 | 19 | 1 | template_ivacode_pagata_20det40ind | survey |
| 1437598 | Compact Cluster A | 2023-10-21T11:41:00 | 23 | 2 | 19508914 | interview |
| id_14 | Legacy Review | 2024-03-05T18:58:00 | 27 | 3 | 506000 | observation |
| 99701 | Regional Initiative | 2025-08-16T01:15:00 | 31 | 4 | 1204-0009-M | survey |

**View `v_leadership_team_brand_goal`**

```sql
CREATE VIEW v_leadership_team_brand_goal AS
SELECT a.teamId, a.teamName, a.assessmentDate, a.teamSize, b.goalId AS goal_goalId, b.goalDescription AS goal_goalDescription, b.targetYear AS goal_targetYear
FROM LeadershipTeam a JOIN BrandGoal b ON a.goalId = b.goalId;
```

| teamId | teamName | assessmentDate | teamSize | goal_goalId | goal_goalDescription | goal_targetYear |
|---|---|---|---|---|---|---|
| 1450649 | Composite Model | 2022-05-10T04:24:00 | 19 | 1 | Distributed Standard | 10 |
| 1437598 | Compact Cluster A | 2023-10-21T11:41:00 | 23 | 2 | Adaptive Framework D | 19 |
| id_14 | Legacy Review | 2024-03-05T18:58:00 | 27 | 3 | Primary Protocol | 28 |
| 99701 | Regional Initiative | 2025-08-16T01:15:00 | 31 | 4 | Composite Programme | 37 |

**View `v_executive_department`**

```sql
CREATE VIEW v_executive_department AS
SELECT a.executiveId, a.fullName, a.jobTitle, a.department, b.departmentId AS department_departmentId, b.deptId AS department_deptId, b.deptName AS department_deptName
FROM Executive a JOIN Department b ON a.departmentId = b.departmentId;
```

| executiveId | fullName | jobTitle | department | department_departmentId | department_deptId | department_deptName |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | Primary Initiative A | adaptive-departme-89 | 1 | IVC20Ndet40 | Legacy Review D |
| 2 | Account Name | Composite Model | distributed-departme-90 | 2 | 4543 | Regional Initiative |
| 3 | Saipan International Airport | Compact Cluster | baseline-departme-91 | 3 | 103182 | Seasonal Model |
| 4 | Norma Fisher | Legacy Review D | pilot-departme-92 | 4 | 575216 | Integrated Cluster A |

**View `v_executive_leadership_team`**

```sql
CREATE VIEW v_executive_leadership_team AS
SELECT a.executiveId, a.fullName, a.jobTitle, a.department, b.teamId AS team_teamId, b.teamName AS team_teamName, b.assessmentDate AS team_assessmentDate
FROM Executive a JOIN LeadershipTeam b ON a.teamId = b.teamId;
```

| executiveId | fullName | jobTitle | department | team_teamId | team_teamName | team_assessmentDate |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | Primary Initiative A | adaptive-departme-89 | 1450649 | Composite Model | 2022-05-10T04:24:00 |
| 2 | Account Name | Composite Model | distributed-departme-90 | 1437598 | Compact Cluster A | 2023-10-21T11:41:00 |
| 3 | Saipan International Airport | Compact Cluster | baseline-departme-91 | id_14 | Legacy Review | 2024-03-05T18:58:00 |
| 4 | Norma Fisher | Legacy Review D | pilot-departme-92 | 99701 | Regional Initiative | 2025-08-16T01:15:00 |

**View `v_executive_brand_goal`**

```sql
CREATE VIEW v_executive_brand_goal AS
SELECT a.executiveId, a.fullName, a.jobTitle, a.department, b.goalId AS goal_goalId, b.goalDescription AS goal_goalDescription, b.targetYear AS goal_targetYear
FROM Executive a JOIN BrandGoal b ON a.goalId = b.goalId;
```

| executiveId | fullName | jobTitle | department | goal_goalId | goal_goalDescription | goal_targetYear |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | Primary Initiative A | adaptive-departme-89 | 1 | Distributed Standard | 10 |
| 2 | Account Name | Composite Model | distributed-departme-90 | 2 | Adaptive Framework D | 19 |
| 3 | Saipan International Airport | Compact Cluster | baseline-departme-91 | 3 | Primary Protocol | 28 |
| 4 | Norma Fisher | Legacy Review D | pilot-departme-92 | 4 | Composite Programme | 37 |

**View `v_executive_executive`**

```sql
CREATE VIEW v_executive_executive AS
SELECT a.executiveId, a.fullName, a.jobTitle, a.department, b.executiveId AS executive_executiveId, b.fullName AS executive_fullName, b.jobTitle AS executive_jobTitle
FROM Executive a JOIN Executive b ON a.reportsToExecutiveId = b.executiveId;
```

| executiveId | fullName | jobTitle | department | executive_executiveId | executive_fullName | executive_jobTitle |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | Primary Initiative A | adaptive-departme-89 | 1 | Theodore Mcgrath | Primary Initiative A |
| 2 | Account Name | Composite Model | distributed-departme-90 | 2 | Account Name | Composite Model |
| 3 | Saipan International Airport | Compact Cluster | baseline-departme-91 | 3 | Saipan International Airport | Compact Cluster |
| 4 | Norma Fisher | Legacy Review D | pilot-departme-92 | 4 | Norma Fisher | Legacy Review D |

**View `v_brand_goal_brand`**

```sql
CREATE VIEW v_brand_goal_brand AS
SELECT a.goalId, a.goalDescription, a.targetYear, a.metricType, b.brandId AS brand_brandId, b.brandName AS brand_brandName, b.foundingYear AS brand_foundingYear
FROM BrandGoal a JOIN Brand b ON a.brandId = b.brandId;
```

| goalId | goalDescription | targetYear | metricType | brand_brandId | brand_brandName | brand_foundingYear |
|---|---|---|---|---|---|---|
| 1 | Distributed Standard | 10 | financial | The GEO Group Inc. | The College-Ready Promise | 43 |
| 2 | Adaptive Framework D | 19 | people | Royal Saudi Air Force | General Foods | 48 |
| 3 | Primary Protocol | 28 | brand | Feedback Ratings | Navistar International | 53 |
| 4 | Composite Programme | 37 | operational | LDAP First Name Field | Root Inc. | 58 |

**View `v_brand_goal_executive`**

```sql
CREATE VIEW v_brand_goal_executive AS
SELECT a.goalId, a.goalDescription, a.targetYear, a.metricType, b.executiveId AS executive_executiveId, b.fullName AS executive_fullName, b.jobTitle AS executive_jobTitle
FROM BrandGoal a JOIN Executive b ON a.executiveId = b.executiveId;
```

| goalId | goalDescription | targetYear | metricType | executive_executiveId | executive_fullName | executive_jobTitle |
|---|---|---|---|---|---|---|
| 1 | Distributed Standard | 10 | financial | 1 | Theodore Mcgrath | Primary Initiative A |
| 2 | Adaptive Framework D | 19 | people | 2 | Account Name | Composite Model |
| 3 | Primary Protocol | 28 | brand | 3 | Saipan International Airport | Compact Cluster |
| 4 | Composite Programme | 37 | operational | 4 | Norma Fisher | Legacy Review D |

**View `v_brand_goal_brand_goal`**

```sql
CREATE VIEW v_brand_goal_brand_goal AS
SELECT a.goalId, a.goalDescription, a.targetYear, a.metricType, b.goalId AS goal_goalId, b.goalDescription AS goal_goalDescription, b.targetYear AS goal_targetYear
FROM BrandGoal a JOIN BrandGoal b ON a.benchmarkedAgainstGoalId = b.goalId;
```

| goalId | goalDescription | targetYear | metricType | goal_goalId | goal_goalDescription | goal_targetYear |
|---|---|---|---|---|---|---|
| 1 | Distributed Standard | 10 | financial | 1 | Distributed Standard | 10 |
| 2 | Adaptive Framework D | 19 | people | 2 | Adaptive Framework D | 19 |
| 3 | Primary Protocol | 28 | brand | 3 | Primary Protocol | 28 |
| 4 | Composite Programme | 37 | operational | 4 | Composite Programme | 37 |

**View `v_department_executive`**

```sql
CREATE VIEW v_department_executive AS
SELECT a.departmentId, a.deptId, a.deptName, a.headCount, b.executiveId AS executive_executiveId, b.fullName AS executive_fullName, b.jobTitle AS executive_jobTitle
FROM Department a JOIN Executive b ON a.executiveId = b.executiveId;
```

| departmentId | deptId | deptName | headCount | executive_executiveId | executive_fullName | executive_jobTitle |
|---|---|---|---|---|---|---|
| 1 | IVC20Ndet40 | Legacy Review D | 49 | 1 | Theodore Mcgrath | Primary Initiative A |
| 2 | 4543 | Regional Initiative | 0 | 2 | Account Name | Composite Model |
| 3 | 103182 | Seasonal Model | 12 | 3 | Saipan International Airport | Compact Cluster |
| 4 | 575216 | Integrated Cluster A | 1 | 4 | Norma Fisher | Legacy Review D |

**View `v_department_brand`**

```sql
CREATE VIEW v_department_brand AS
SELECT a.departmentId, a.deptId, a.deptName, a.headCount, b.brandId AS brand_brandId, b.brandName AS brand_brandName, b.foundingYear AS brand_foundingYear
FROM Department a JOIN Brand b ON a.brandId = b.brandId;
```

| departmentId | deptId | deptName | headCount | brand_brandId | brand_brandName | brand_foundingYear |
|---|---|---|---|---|---|---|
| 1 | IVC20Ndet40 | Legacy Review D | 49 | The GEO Group Inc. | The College-Ready Promise | 43 |
| 2 | 4543 | Regional Initiative | 0 | Royal Saudi Air Force | General Foods | 48 |
| 3 | 103182 | Seasonal Model | 12 | Feedback Ratings | Navistar International | 53 |
| 4 | 575216 | Integrated Cluster A | 1 | LDAP First Name Field | Root Inc. | 58 |

**View `v_department_department`**

```sql
CREATE VIEW v_department_department AS
SELECT a.departmentId, a.deptId, a.deptName, a.headCount, b.departmentId AS department_departmentId, b.deptId AS department_deptId, b.deptName AS department_deptName
FROM Department a JOIN Department b ON a.collaboratesWithDepartmentId = b.departmentId;
```

| departmentId | deptId | deptName | headCount | department_departmentId | department_deptId | department_deptName |
|---|---|---|---|---|---|---|
| 1 | IVC20Ndet40 | Legacy Review D | 49 | 1 | IVC20Ndet40 | Legacy Review D |
| 2 | 4543 | Regional Initiative | 0 | 2 | 4543 | Regional Initiative |
| 3 | 103182 | Seasonal Model | 12 | 3 | 103182 | Seasonal Model |
| 4 | 575216 | Integrated Cluster A | 1 | 4 | 575216 | Integrated Cluster A |

**View `v_team_assessment_leadership_team`**

```sql
CREATE VIEW v_team_assessment_leadership_team AS
SELECT a.id, a.assessmentId, a.assessmentType, a.dateConducted, b.teamId AS team_teamId, b.teamName AS team_teamName, b.assessmentDate AS team_assessmentDate
FROM TeamAssessment a JOIN LeadershipTeam b ON a.teamId = b.teamId;
```

| id | assessmentId | assessmentType | dateConducted | team_teamId | team_teamName | team_assessmentDate |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_20det40ind | survey | 2025-08-16T19:09:00 | 1450649 | Composite Model | 2022-05-10T04:24:00 |
| 2 | 19508914 | interview | 2022-01-27T02:26:00 | 1437598 | Compact Cluster A | 2023-10-21T11:41:00 |
| 3 | 506000 | observation | 2023-06-11T09:43:00 | id_14 | Legacy Review | 2024-03-05T18:58:00 |
| 4 | 1204-0009-M | survey | 2024-11-22T16:00:00 | 99701 | Regional Initiative | 2025-08-16T01:15:00 |

**View `v_team_assessment_executive`**

```sql
CREATE VIEW v_team_assessment_executive AS
SELECT a.id, a.assessmentId, a.assessmentType, a.dateConducted, b.executiveId AS executive_executiveId, b.fullName AS executive_fullName, b.jobTitle AS executive_jobTitle
FROM TeamAssessment a JOIN Executive b ON a.executiveId = b.executiveId;
```

| id | assessmentId | assessmentType | dateConducted | executive_executiveId | executive_fullName | executive_jobTitle |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_20det40ind | survey | 2025-08-16T19:09:00 | 1 | Theodore Mcgrath | Primary Initiative A |
| 2 | 19508914 | interview | 2022-01-27T02:26:00 | 2 | Account Name | Composite Model |
| 3 | 506000 | observation | 2023-06-11T09:43:00 | 3 | Saipan International Airport | Compact Cluster |
| 4 | 1204-0009-M | survey | 2024-11-22T16:00:00 | 4 | Norma Fisher | Legacy Review D |

**View `v_market_condition_brand`**

```sql
CREATE VIEW v_market_condition_brand AS
SELECT a.conditionId, a.conditionName, a.impactLevel, a.trendDirection, b.brandId AS brand_brandId, b.brandName AS brand_brandName, b.foundingYear AS brand_foundingYear
FROM MarketCondition a JOIN Brand b ON a.brandId = b.brandId;
```

| conditionId | conditionName | impactLevel | trendDirection | brand_brandId | brand_brandName | brand_foundingYear |
|---|---|---|---|---|---|---|
| 1 | Compact Standard | high | increasing | The GEO Group Inc. | The College-Ready Promise | 43 |
| 2 | Legacy Framework | medium | decreasing | Royal Saudi Air Force | General Foods | 48 |
| 3 | Regional Protocol A | low | stable | Feedback Ratings | Navistar International | 53 |
| 4 | Seasonal Programme | high | increasing | LDAP First Name Field | Root Inc. | 58 |

**View `v_market_condition_brand_goal`**

```sql
CREATE VIEW v_market_condition_brand_goal AS
SELECT a.conditionId, a.conditionName, a.impactLevel, a.trendDirection, b.goalId AS goal_goalId, b.goalDescription AS goal_goalDescription, b.targetYear AS goal_targetYear
FROM MarketCondition a JOIN BrandGoal b ON a.goalId = b.goalId;
```

| conditionId | conditionName | impactLevel | trendDirection | goal_goalId | goal_goalDescription | goal_targetYear |
|---|---|---|---|---|---|---|
| 1 | Compact Standard | high | increasing | 1 | Distributed Standard | 10 |
| 2 | Legacy Framework | medium | decreasing | 2 | Adaptive Framework D | 19 |
| 3 | Regional Protocol A | low | stable | 3 | Primary Protocol | 28 |
| 4 | Seasonal Programme | high | increasing | 4 | Composite Programme | 37 |

**View `v_market_condition_executive`**

```sql
CREATE VIEW v_market_condition_executive AS
SELECT a.conditionId, a.conditionName, a.impactLevel, a.trendDirection, b.executiveId AS executive_executiveId, b.fullName AS executive_fullName, b.jobTitle AS executive_jobTitle
FROM MarketCondition a JOIN Executive b ON a.executiveId = b.executiveId;
```

| conditionId | conditionName | impactLevel | trendDirection | executive_executiveId | executive_fullName | executive_jobTitle |
|---|---|---|---|---|---|---|
| 1 | Compact Standard | high | increasing | 1 | Theodore Mcgrath | Primary Initiative A |
| 2 | Legacy Framework | medium | decreasing | 2 | Account Name | Composite Model |
| 3 | Regional Protocol A | low | stable | 3 | Saipan International Airport | Compact Cluster |
| 4 | Seasonal Programme | high | increasing | 4 | Norma Fisher | Legacy Review D |
