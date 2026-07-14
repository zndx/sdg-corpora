## Ontology-Grounded Relational Modelling: Corporate Governance and Performance Tracking

The domain under examination captures the organisational anatomy of a multi-brand enterprise, where corporate entities, leadership teams, executives, strategic goals, departments, performance assessments, and market conditions are modelled as interrelated concepts. At the heart of the schema lies a star-like topology: `Brand` anchors the model as the central business entity, with `LeadershipTeam`, `Executive`, `BrandGoal`, `Department`, `TeamAssessment`, and `MarketCondition` radiating outward as dependent entities. The `LeadershipTeamExecutive` junction table resolves a many-to-many relationship between leadership teams and executives, enabling flexible team compositions. This chapter explains how the ontology's entity types, attributes, and cardinality-bounded relationships materialise as a normalised relational schema, and how each view reconstructs a domain fact from the underlying tables through declarative joins.

### Base Tables and Entity Types

The `Brand` table serves as the primary entity, representing distinct business units or corporate brands within the enterprise. Each brand is identified by a `brandId` and carries descriptive attributes including `brandName`, `foundingYear`, `annualRevenue`, `totalStoreCount`, `headquartersLocation`, and `parentCompany`. The table also embeds foreign keys `teamId` and `conditionId` that link to `LeadershipTeam` and `MarketCondition` respectively, establishing direct associations from the brand to its operational team and prevailing market context.

**Table `Brand`**

| brandId | brandName | foundingYear | annualRevenue | totalStoreCount | headquartersLocation | parentCompany | teamId | conditionId |
|---|---|---|---|---|---|---|---|---|
| The GEO Group Inc. | The College-Ready Promise | 43 | 12,608 | 11 | composite-headquar-63 | Atlantic Richfield | 1450649 | 1 |
| Royal Saudi Air Force | General Foods | 48 | 56,418 | 81 | primary-headquar-64 | Diners Club Switzerland Ltd | 1437598 | 2 |
| Feedback Ratings | Navistar International | 53 | 16,254 | 147 | adaptive-headquar-65 | AFLAC Inc | id_14 | 3 |
| LDAP First Name Field | Root Inc. | 58 | 745,000 | 146 | distributed-headquar-66 | Maze Vietnam | 99701 | 4 |

Consider the first row: the brand `The GEO Group Inc.` was founded in year 43, generates an annual revenue of 12,608, operates 11 stores, is headquartered at `composite-headquar-63`, and is owned by `Atlantic Richfield`. Its associated leadership team is `1450649` and its market condition is `1`. The second row, `Royal Saudi Air Force` (a fictional brand in this domain), operates 81 stores with a revenue of 56,418 and is owned by `Diners Club Switzerland Ltd`. The third row, `Feedback Ratings`, has 147 stores and is owned by `AFLAC Inc`, while the fourth row, `LDAP First Name Field`, reports the highest revenue at 745,000 with 146 stores under `Maze Vietnam`.

The `LeadershipTeam` table captures the operational teams responsible for executing brand strategy. Each team is identified by `teamId` and carries attributes such as `teamName`, `assessmentDate`, `teamSize`, `assessmentScore`, and `teamStatus`. Foreign keys `brandId`, `assessmentId`, and `goalId` link the team to its parent brand, its assessment record, and its strategic goal respectively.

**Table `LeadershipTeam`**

| teamId | teamName | assessmentDate | teamSize | assessmentScore | teamStatus | brandId | assessmentId | goalId |
|---|---|---|---|---|---|---|---|---|
| 1450649 | Composite Model | 2022-05-10T04:24:00 | 19 | 11.20 | active | The GEO Group Inc. | 1 | 1 |
| 1437598 | Compact Cluster A | 2023-10-21T11:41:00 | 23 | 14.40 | inactive | Royal Saudi Air Force | 2 | 2 |
| id_14 | Legacy Review | 2024-03-05T18:58:00 | 27 | 17.60 | restructuring | Feedback Ratings | 3 | 3 |
| 99701 | Regional Initiative | 2025-08-16T01:15:00 | 31 | 20.80 | active | LDAP First Name Field | 4 | 4 |

The team `Composite Model` (id `1450649`) was assessed on 2022-05-10, comprises 19 members, scored 11.20, and holds an `active` status. The team `Compact Cluster A` (id `1437598`) was assessed on 2023-10-21, has 23 members, scored 14.40, and is marked `inactive`. The team `Legacy Review` (id `id_14`) is in `restructuring` status with 27 members and a score of 17.60, while `Regional Initiative` (id `99701`) is active with 31 members and the highest score of 20.80.

The `Executive` table models individual executives within the organisation. Each executive is identified by `executiveId` and carries attributes including `fullName`, `jobTitle`, `department`, `tenureYears`, `location`, and `isSenior`. Foreign keys `departmentId`, `teamId`, `goalId`, and `reportsToExecutiveId` establish relationships to the executive's department, team, strategic goal, and their reporting manager (self-referential).

**Table `Executive`**

| executiveId | fullName | jobTitle | department | tenureYears | location | isSenior | departmentId | teamId | goalId | reportsToExecutiveId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | Primary Initiative A | adaptive-departme-89 | 28 | extended-location-99 | false | 1 | 1450649 | 1 | 1 |
| 2 | Account Name | Composite Model | distributed-departme-90 | 35 | integrated-location-100 | true | 2 | 1437598 | 2 | 2 |
| 3 | Saipan International Airport | Compact Cluster | baseline-departme-91 | 42 | seasonal-location-101 | false | 3 | id_14 | 3 | 3 |
| 4 | Norma Fisher | Legacy Review D | pilot-departme-92 | 49 | regional-location-102 | true | 4 | 99701 | 4 | 4 |

Executive `1`, `Theodore Mcgrath`, holds the job title `Primary Initiative A`, works in `adaptive-departme-89`, has 28 years of tenure, is located at `extended-location-99`, and is not a senior executive (`isSenior = false`). Executive `2`, `Account Name`, is a senior executive (`isSenior = true`) with 35 years of tenure in `distributed-departme-90`. Executive `3`, `Saipan International Airport`, has 42 years of tenure in `baseline-departme-91`, while Executive `4`, `Norma Fisher`, is a senior executive with 49 years of tenure in `pilot-departme-92`.

The `BrandGoal` table encodes strategic objectives for each brand. Each goal is identified by `goalId` and carries attributes such as `goalDescription`, `targetYear`, `metricType`, `targetValue`, `currentValue`, and `isBenchmarked`. Foreign keys `brandId`, `executiveId`, and `benchmarkedAgainstGoalId` link the goal to its brand, the executive responsible, and optionally to another goal used as a benchmark.

**Table `BrandGoal`**

| goalId | goalDescription | targetYear | metricType | targetValue | currentValue | isBenchmarked | brandId | executiveId | benchmarkedAgainstGoalId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Distributed Standard | 10 | financial | 13.45 | 11.20 | false | The GEO Group Inc. | 1 | 1 |
| 2 | Adaptive Framework D | 19 | people | 15.90 | 14.40 | true | Royal Saudi Air Force | 2 | 2 |
| 3 | Primary Protocol | 28 | brand | 18.35 | 17.60 | false | Feedback Ratings | 3 | 3 |
| 4 | Composite Programme | 37 | operational | 20.80 | 20.80 | true | LDAP First Name Field | 4 | 4 |

Goal `1`, `Distributed Standard`, targets year 10 with a financial metric, a target value of 13.45, and a current value of 11.20; it is not benchmarked. Goal `2`, `Adaptive Framework D`, targets year 19 with a people metric, a target of 15.90 against a current value of 14.40, and is benchmarked. Goal `3`, `Primary Protocol`, targets year 28 with a brand metric (target 18.35, current 17.60), while Goal `4`, `Composite Programme`, targets year 37 with an operational metric where the target and current values are both 20.80, indicating full achievement.

The `Department` table models organisational departments. Each department is identified by `departmentId` and carries attributes including `deptId`, `deptName`, `headCount`, `budget`, `isSharedService`, and `operationalStatus`. Foreign keys `executiveId`, `brandId`, and `collaboratesWithDepartmentId` link the department to its executive head, its brand, and a collaborating department.

**Table `Department`**

| departmentId | deptId | deptName | headCount | budget | isSharedService | operationalStatus | executiveId | brandId | collaboratesWithDepartmentId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | IVC20Ndet40 | Legacy Review D | 49 | 35.45 | true | active | 1 | The GEO Group Inc. | 1 |
| 2 | 4543 | Regional Initiative | 0 | 18.47 | false | inactive | 2 | Royal Saudi Air Force | 2 |
| 3 | 103182 | Seasonal Model | 12 | 26.25 | true | merger | 3 | Feedback Ratings | 3 |
| 4 | 575216 | Integrated Cluster A | 1 | 17.12 | false | active | 4 | LDAP First Name Field | 4 |

Department `1` has `deptId` `IVC20Ndet40`, is named `Legacy Review D`, has 49 headcount, a budget of 35.45, is a shared service (`isSharedService = true`), is `active`, and collaborates with department `1`. Department `2` is named `Regional Initiative` with 0 headcount and a budget of 18.47, is not a shared service, and is `inactive`. Department `3`, `Seasonal Model`, has 12 headcount and a budget of 26.25, is a shared service, and is in `merger` status. Department `4`, `Integrated Cluster A`, has 1 headcount and a budget of 17.12, is not a shared service, and is `active`.

The `TeamAssessment` table records performance assessments conducted on leadership teams. Each assessment is identified by `id` and carries attributes such as `assessmentId`, `assessmentType`, `dateConducted`, `durationMinutes`, `modelUsed`, and `resultStatus`. Foreign keys `teamId` and `executiveId` link the assessment to the team being assessed and the executive conducting or overseeing it.

**Table `TeamAssessment`**

| id | assessmentId | assessmentType | dateConducted | durationMinutes | modelUsed | resultStatus | teamId | executiveId |
|---|---|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_20det40ind | survey | 2025-08-16T19:09:00 | 35 | distributed-model-12 | completed | 1450649 | 1 |
| 2 | 19508914 | interview | 2022-01-27T02:26:00 | 38 | baseline-model-13 | pending | 1437598 | 2 |
| 3 | 506000 | observation | 2023-06-11T09:43:00 | 41 | pilot-model-14 | failed | id_14 | 3 |
| 4 | 1204-0009-M | survey | 2024-11-22T16:00:00 | 44 | extended-model-15 | completed | 99701 | 4 |

Assessment `1` (id `1`) uses the `survey` type, was conducted on 2025-08-16, lasted 35 minutes, used `distributed-model-12`, and has a `completed` result status. Assessment `2` uses the `interview` type, was conducted on 2022-01-27, lasted 38 minutes, used `baseline-model-13`, and has a `pending` status. Assessment `3` used the `observation` type on 2023-06-11 for 41 minutes with `pilot-model-14` and has a `failed` status. Assessment `4` is a `survey` conducted on 2024-11-22 for 44 minutes using `extended-model-15` with a `completed` status.

The `MarketCondition` table captures the external market environment affecting brands. Although the full table is not enumerated here, the foreign key `conditionId` in `Brand` references this table, establishing that each brand operates within a specific market condition context.

**Table `MarketCondition`**

| conditionId | conditionName | impactLevel | trendDirection | measurementValue | lastUpdated | brandId | goalId | executiveId |
|---|---|---|---|---|---|---|---|---|
| 1 | Compact Standard | high | increasing | 14.45 | 2023-06-17T17:27:00 | The GEO Group Inc. | 1 | 1 |
| 2 | Legacy Framework | medium | decreasing | 17.90 | 2024-11-01T00:44:00 | Royal Saudi Air Force | 2 | 2 |
| 3 | Regional Protocol A | low | stable | 21.35 | 2025-04-12T07:01:00 | Feedback Ratings | 3 | 3 |
| 4 | Seasonal Programme | high | increasing | 24.80 | 2022-09-23T14:18:00 | LDAP First Name Field | 4 | 4 |

The `LeadershipTeamExecutive` junction table resolves the many-to-many relationship between `LeadershipTeam` and `Executive`, allowing executives to serve on multiple teams and teams to comprise multiple executives. This normalisation avoids data redundancy and supports flexible organisational structures.

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

### Views and Reconstructed Domain Facts

Views in this schema are declarative joins that reconstruct domain facts from the normalised base tables. Each view answers a specific analytical question by combining data from two or more tables.

The view `v_brand_leadership_team` joins `Brand` with `LeadershipTeam` on `brandId`, answering the question: "Which leadership team is associated with each brand?" The joined result pairs each brand with its operational team, enabling analysts to see, for example, that `The GEO Group Inc.` is managed by team `1450649` (`Composite Model`).

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

The view `v_brand_market_condition` joins `Brand` with `MarketCondition` on `conditionId`, answering: "What market condition does each brand operate in?" This view allows correlation of brand performance with external market factors. For instance, `The GEO Group Inc.` operates under market condition `1`, while `Royal Saudi Air Force` operates under condition `2`.

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

The view `v_leadership_team_brand` joins `LeadershipTeam` with `Brand` on `brandId`, answering: "Which brand does each leadership team serve?" This is the inverse of `v_brand_leadership_team` and provides a team-centric perspective. The team `Compact Cluster A` (id `1437598`) serves the brand `Royal Saudi Air Force`.

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

The view `v_leadership_team_executive_detail` joins `LeadershipTeam` with `Executive` on `teamId`, answering: "Which executives are associated with each leadership team?" This view reveals the executive composition of teams. For example, team `1450649` (`Composite Model`) is associated with executive `1` (`Theodore Mcgrath`).

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

The view `v_leadership_team_team_assessment` joins `LeadershipTeam` with `TeamAssessment` on `teamId`, answering: "What assessment has been conducted on each leadership team?" This view links teams to their performance evaluation records. Team `1450649` has assessment `1` with a `completed` status, while team `id_14` (`Legacy Review`) has assessment `3` with a `failed` status.

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

The view `v_leadership_team_brand_goal` joins `LeadershipTeam` with `BrandGoal` on `goalId`, answering: "What strategic goal is associated with each leadership team?" This view connects operational teams to their strategic objectives. Team `1450649` is linked to goal `1` (`Distributed Standard`), while team `99701` (`Regional Initiative`) is linked to goal `4` (`Composite Programme`).

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

The view `v_executive_department` joins `Executive` with `Department` on `departmentId`, answering: "Which department does each executive head?" This view maps executives to their organisational units. Executive `1` (`Theodore Mcgrath`) heads department `1` (`Legacy Review D`), while executive `4` (`Norma Fisher`) heads department `4` (`Integrated Cluster A`).

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

The view `v_executive_leadership_team` joins `Executive` with `LeadershipTeam` on `teamId`, answering: "Which leadership team is each executive associated with?" This view provides an executive-centric view of team membership. Executive `1` is associated with team `1450649` (`Composite Model`), and executive `3` is associated with team `id_14` (`Legacy Review`).

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

The view `v_executive_brand_goal` joins `Executive` with `BrandGoal` on `executiveId`, answering: "What strategic goal is each executive responsible for?" This view links individual executives to their assigned goals. Executive `1` is responsible for goal `1` (`Distributed Standard`), and executive `2` is responsible for goal `2` (`Adaptive Framework D`).

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

The view `v_executive_executive` joins `Executive` with itself on `reportsToExecutiveId`, answering: "Which executive reports to which other executive?" This self-join reveals the reporting hierarchy. Executive `1` reports to executive `1` (self-reporting or top-level), and executive `2` reports to executive `2`, indicating that each executive in this dataset reports to themselves, suggesting a flat or self-managed structure.

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

The view `v_brand_goal_brand` joins `BrandGoal` with `Brand` on `brandId`, answering: "Which brand is each strategic goal associated with?" This view connects goals to their parent brands. Goal `1` (`Distributed Standard`) belongs to brand `The GEO Group Inc.`, while goal `4` (`Composite Programme`) belongs to brand `LDAP First Name Field`.

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

The view `v_brand_goal_executive` joins `BrandGoal` with `Executive` on `executiveId`, answering: "Which executive is responsible for each strategic goal?" This view provides a goal-centric view of executive accountability. Goal `1` is overseen by executive `1` (`Theodore Mcgrath`), and goal `3` is overseen by executive `3` (`Saipan International Airport`).

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

The view `v_brand_goal_brand_goal` joins `BrandGoal` with itself on `benchmarkedAgainstGoalId`, answering: "Which goals are benchmarked against other goals?" This self-join reveals benchmarking relationships. Goal `1` is benchmarked against goal `1` (self-benchmarked), while goal `2` is benchmarked against goal `2`, indicating that each goal in this dataset is benchmarked against itself.

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

The view `v_department_executive` joins `Department` with `Executive` on `executiveId`, answering: "Which executive heads each department?" This view maps departments to their executive leaders. Department `1` (`Legacy Review D`) is headed by executive `1` (`Theodore Mcgrath`), and department `3` (`Seasonal Model`) is headed by executive `3` (`Saipan International Airport`).

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

The view `v_department_brand` joins `Department` with `Brand` on `brandId`, answering: "Which brand does each department belong to?" This view connects departments to their parent brands. Department `1` belongs to brand `The GEO Group Inc.`, and department `2` belongs to brand `Royal Saudi Air Force`.

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

The view `v_department_department` joins `Department` with itself on `collaboratesWithDepartmentId`, answering: "Which departments collaborate with other departments?" This self-join reveals inter-departmental collaboration. Department `1` collaborates with department `1` (self-collaboration), and department `4` collaborates with department `4`, indicating that each department in this dataset collaborates with itself.

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

The view `v_team_assessment_leadership_team` joins `TeamAssessment` with `LeadershipTeam` on `teamId`, answering: "Which leadership team was assessed in each assessment record?" This view links assessment records to their target teams. Assessment `1` was conducted on team `1450649` (`Composite Model`), and assessment `4` was conducted on team `99701` (`Regional Initiative`).

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

The view `v_team_assessment_executive` joins `TeamAssessment` with `Executive` on `executiveId`, answering: "Which executive conducted or oversaw each assessment?" This view links assessments to the responsible executives. Assessment `1` was overseen by executive `1` (`Theodore Mcgrath`), and assessment `3` was overseen by executive `3` (`Saipan International Airport`).

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

The view `v_market_condition_brand` joins `MarketCondition` with `Brand` on `conditionId`, answering: "Which brands operate under each market condition?" This view provides a market-condition-centric view of brand distribution. Market condition `1` covers brand `The GEO Group Inc.`, while market condition `2` covers brand `Royal Saudi Air Force`.

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

The view `v_market_condition_brand_goal` joins `MarketCondition` with `BrandGoal` through `Brand`, answering: "What strategic goals are associated with brands in each market condition?" This multi-table join reconstructs the relationship between market conditions and strategic goals. Brands under condition `1` have goal `1` (`Distributed Standard`), while brands under condition `4` have goal `4` (`Composite Programme`).

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

The view `v_market_condition_executive` joins `MarketCondition` with `Executive` through `Brand`, answering: "Which executives operate in brands under each market condition?" This view connects executives to their market context. Executive `1` operates in a brand under market condition `1`, and executive `4` operates in a brand under market condition `4`.

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

### Synthesis

The schema models a corporate governance domain where brands are the central entities, with leadership teams, executives, goals, departments, assessments, and market conditions forming a web of interrelated concepts. The normalised design avoids redundancy by storing each entity type in its own table and linking them through foreign keys. The `LeadershipTeamExecutive` junction table enables flexible team compositions, while self-referential foreign keys in `Executive`, `BrandGoal`, `Department`, and `TeamAssessment` capture hierarchical and benchmarking relationships. Each view materialises a specific analytical question by joining the appropriate tables, allowing analysts to reconstruct domain facts without writing complex queries. The result is a schema that faithfully represents the ontology's entity types and relationships while supporting efficient querying and clear semantic interpretation.