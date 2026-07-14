The architecture of modern research administration rests on a network of interlocking commitments: funding agencies allocate resources, review panels evaluate proposals, healthcare organizations host the work, advisory councils provide governance, and research outputs crystallize the results. Every engagement award sits at the nexus of these forces, translating strategic intent into measurable deliverables. The records below capture this ecosystem in its operational form, preserving the full chain of accountability from agency authorization through project execution to published output.

**Table `EngagementAward`**

| id | awardId | awardAmount | awardDate | awardStatus | fundingProgram | reviewOutcome | agencyId | projectId | panelId | createdAt |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | 29.43 | 2025-12-01 | approved | regional-funding-96 | selected | 100 | 1000 | 1 | 2025-01-01 00:14:00 |
| 101 | 3012811 | 35.57 | 2022-05-12 | pending | legacy-funding-97 | not_selected | 101 | 1001 | 2 | 2025-02-06 03:14:00 |
| 102 | 15493350 | 34.08 | 2023-10-23 | active | compact-funding-98 | under_review | 102 | 1002 | 3 | 2025-03-11 06:14:00 |
| 103 | state_uk_17 | 19.97 | 2024-03-07 | completed | composite-funding-99 | selected | 103 | 1003 | 4 | 2025-04-16 09:14:00 |

An engagement award is the primary instrument of resource allocation within the research ecosystem. Each award carries a unique identifier—such as `e02275d4-8fd1-11eb-924d-9cd76263cbd0` or the numeric `3012811`—and records a monetary commitment, an award date, and a current status. The `awardAmount` column captures the financial scale of the award; values in the dataset range from `19.97` for the state-level award `state_uk_17` to `35.57` for the legacy program award `3012811`. The `awardStatus` field tracks the lifecycle stage, with observed values of `approved`, `pending`, `active`, and `completed`. The `fundingProgram` column classifies the source program, including designations like `regional-funding-96`, `legacy-funding-97`, `compact-funding-98`, and `composite-funding-99`. The `reviewOutcome` column records the panel's verdict: `selected`, `not_selected`, or `under_review`. Each award is anchored to three foreign keys: `agencyId` points to the `FundingAgency` that authorized the funds, `projectId` references the `ResearchProject` that receives the award, and `panelId` identifies the `ReviewPanel` that rendered the outcome. The `createdAt` timestamp records when the award record was first entered, with entries spanning from January 2025 through April 2025.

**Table `ResearchProject`**

| projectId | projectTitle | startDate | endDate | projectStatus | primaryObjective | deliverableCount | awardId | outputId | createdAt |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | Integrated Model A | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planning | primary-primary-58 | 1 | 100 | 1 | 2025-01-01 00:14:00 |
| 1001 | Extended Cluster | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | active | adaptive-primary-59 | 38 | 101 | 2 | 2025-02-06 03:14:00 |
| 1002 | Pilot Review | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | distributed-primary-60 | 27 | 102 | 3 | 2025-03-11 06:14:00 |
| 1003 | Baseline Initiative D | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | suspended | baseline-primary-61 | 75 | 103 | 4 | 2025-04-16 09:14:00 |

Research projects are the operational units of scientific work. Each project has a `projectId`, a `projectTitle`, and a defined temporal scope captured by `startDate` and `endDate`. The dataset includes projects such as `Integrated Model A` (project `1000`), `Extended Cluster` (project `1001`), `Pilot Review` (project `1002`), and `Baseline Initiative D` (project `1003`). The `projectStatus` field reflects the current phase: `planning`, `active`, `completed`, or `suspended`. The `primaryObjective` column encodes the strategic focus, with values like `primary-primary-58`, `adaptive-primary-59`, `distributed-primary-60`, and `baseline-primary-61`. The `deliverableCount` quantifies the scope of expected outputs, ranging from a single deliverable for `Integrated Model A` to `75` deliverables for `Baseline Initiative D`. Each project is linked to an `awardId` that ties it to its funding award and to an `outputId` that connects it to its primary research output.

**Table `AdvisoryCouncil`**

| id | councilId | councilName | organizationId | establishmentDate | councilStatus | memberCount | meetingFrequency | projectId | advisesOrganizationId | outputId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Legacy Standard D | Shell Oil | 2024-07-11 | active | 4 | weekly | 1000 | 1000 | 1 |
| 2 | Bjornfant | Regional Framework | GlobalPlatform Inc. | 2025-12-22 | inactive | 17 | monthly | 1001 | 1001 | 2 |
| 3 | 726041 | Seasonal Protocol | Whatsapp Inc. | 2022-05-06 | dissolved | 9 | quarterly | 1002 | 1002 | 3 |
| 4 | 2a540c6d30d447058e7e4de6c68c2d6d | Integrated Programme A | American Institutes for Research | 2023-10-17 | forming | 0 | ad_hoc | 1003 | 1003 | 4 |

Advisory councils provide governance and oversight for research initiatives. Each council has a unique `id`, a `councilId` (which may be a UUID such as `ae409270-8fcd-11eb-924d-9cd76263cbd0` or a short string like `Bjornfant`), and a `councilName` such as `Legacy Standard D`, `Regional Framework`, `Seasonal Protocol`, or `Integrated Programme A`. The `organizationId` column links the council to its sponsoring `HealthcareOrganization`, while `projectId` ties it to the research project it advises. The `establishmentDate` records when the council was formed, and `councilStatus` captures its current state: `active`, `inactive`, `dissolved`, or `forming`. The `memberCount` field indicates the number of council members, ranging from `0` for the forming `Integrated Programme A` to `17` for the inactive `Regional Framework`. The `meetingFrequency` column describes how often the council convenes, with observed values of `weekly`, `monthly`, `quarterly`, and `ad_hoc`. Each council is also linked to an `outputId` that associates it with a specific research output.

**Table `HealthcareOrganization`**

| id | orgId | orgName | orgType | locationCity | locationState | foundedDate | bedCount | outputId |
|---|---|---|---|---|---|---|---|---|
| 1000 | 790471 | Extended Review | hospital | seasonal-location-23 | composite-location-93 | 2024-03-15 | 19 | 1 |
| 1001 | 1717 | Pilot Initiative A | clinic | regional-location-24 | primary-location-94 | 2025-08-26 | 75 | 2 |
| 1002 | 69437 | Baseline Model | health_system | legacy-location-25 | adaptive-location-95 | 2022-01-10 | 2 | 3 |
| 1003 | m16 | Distributed Cluster | non_profit | compact-location-26 | distributed-location-96 | 2023-06-21 | 17 | 4 |

Healthcare organizations serve as the institutional hosts for research activities. Each organization has an `id`, an `orgId` (which may be numeric like `790471` or alphanumeric like `m16`), and an `orgName` such as `Extended Review`, `Pilot Initiative A`, `Baseline Model`, or `Distributed Cluster`. The `orgType` column classifies the organization as a `hospital`, `clinic`, `health_system`, or `non_profit`. The `locationCity` and `locationState` columns record geographic placement, with values like `seasonal-location-23` and `composite-location-93`. The `foundedDate` captures the organization's founding, and `bedCount` indicates capacity, ranging from `2` beds for `Baseline Model` to `75` beds for `Pilot Initiative A`. Each organization is linked to an `outputId` that associates it with a research output.

**Table `ResearchOutput`**

| id | outputId | outputType | creationDate | versionNumber | status | accessLevel | projectId | councilId |
|---|---|---|---|---|---|---|---|---|
| 1 | 3717613 | tool | 2022-01-13 | VER-2245 | draft | public | 1000 | 1 |
| 2 | 937738 | report | 2023-06-24 | VER-2249 | review | restricted | 1001 | 2 |
| 3 | 974934 | dataset | 2024-11-08 | VER-2253 | published | internal | 1002 | 3 |
| 4 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | framework | 2025-04-19 | VER-2257 | archived | public | 1003 | 4 |

Research outputs are the tangible products of scientific work. Each output has an `id`, an `outputId` (which may be numeric like `3717613` or a UUID like `5f8f9bda-8fcd-11eb-924d-9cd76263cbd0`), and an `outputType` that classifies the deliverable as a `tool`, `report`, `dataset`, or `framework`. The `creationDate` records when the output was produced, and `versionNumber` tracks revisions, with values such as `VER-2245`, `VER-2249`, `VER-2253`, and `VER-2257`. The `status` column indicates the publication state: `draft`, `review`, `published`, or `archived`. The `accessLevel` column controls visibility, with values of `public`, `restricted`, and `internal`. Each output is linked to a `projectId` that identifies the research project that produced it and to a `councilId` that identifies the advisory council that oversaw its development.

**Table `FundingAgency`**

| agencyId | agencyName | foundingYear | agencyType | authorizationSource | headquartersCity | panelId |
|---|---|---|---|---|---|---|
| 100 | FSG Social Impact Advisors | 43 | non_profit | congress | seasonal-headquar-83 | 1 |
| 101 | Whirlpool Corporation | 48 | government | charter | regional-headquar-84 | 2 |
| 102 | Education Writers Association | 53 | private | private_founding | legacy-headquar-85 | 3 |
| 103 | Switch Card Services Ltd. | 58 | non_profit | congress | compact-headquar-86 | 4 |

Funding agencies are the financial engines of the research ecosystem. Each agency has an `agencyId`, an `agencyName`, a `foundingYear`, and an `agencyType` that classifies it as `non_profit`, `government`, or `private`. The dataset includes agencies such as `FSG Social Impact Advisors` (agency `100`), `Whirlpool Corporation` (agency `101`), `Education Writers Association` (agency `102`), and `Switch Card Services Ltd.` (agency `103`). The `foundingYear` records the agency's establishment, with values ranging from `43` to `58`. The `authorizationSource` column identifies the body that authorized the agency, with values of `congress`, `charter`, and `private_founding`. The `headquartersCity` records the agency's location, with values like `seasonal-headquar-83` and `regional-headquar-84`. Each agency is linked to a `panelId` that identifies the review panel it uses for evaluation.

**Table `ReviewPanel`**

| id | panelId | panelName | reviewDate | reviewCriteria | panelStatus | memberCount | awardId | agencyId | createdAt |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 2087758 | Integrated Programme A | 2024-11-03T22:54:00 | legacy-review-37 | active | 4 | 100 | 100 | 2025-01-01 00:14:00 |
| 2 | 4277009 | Extended Standard | 2025-04-14T05:11:00 | compact-review-38 | dissolved | 17 | 101 | 101 | 2025-02-06 03:14:00 |
| 3 | 6926358 | Pilot Framework | 2022-09-25T12:28:00 | composite-review-39 | reconstituted | 9 | 102 | 102 | 2025-03-11 06:14:00 |
| 4 | 9424910 | Baseline Protocol D | 2023-02-09T19:45:00 | primary-review-40 | active | 0 | 103 | 103 | 2025-04-16 09:14:00 |

Review panels are the evaluative bodies that assess funding proposals. Each panel has a `panelId`, a `panelName`, a `panelType`, and a `reviewStatus` that tracks its current operational state. The dataset includes panels such as `Panel Alpha` (panel `1`), `Panel Beta` (panel `2`), `Panel Gamma` (panel `3`), and `Panel Delta` (panel `4`). The `panelType` column classifies the panel, with observed values of `technical`, `scientific`, `financial`, and `strategic`. The `reviewStatus` field captures the panel's current state: `active`, `inactive`, `pending`, or `completed`. Each panel is linked to a `fundingAgencyId` that identifies the agency it serves and to an `engagementAwardId` that identifies the awards it has evaluated.

The relationships between these base tables form a coherent chain of accountability. An engagement award connects a funding agency to a research project through a review panel. A research project produces a research output under the oversight of an advisory council. An advisory council is sponsored by a healthcare organization. This chain ensures that every dollar of funding can be traced to a specific project, output, and institutional host.

**View `v_engagement_award_funding_agency`**

```sql
CREATE VIEW v_engagement_award_funding_agency AS
SELECT a.id, a.awardId, a.awardAmount, a.awardDate, b.agencyId AS agency_agencyId, b.agencyName AS agency_agencyName, b.foundingYear AS agency_foundingYear
FROM EngagementAward a JOIN FundingAgency b ON a.agencyId = b.agencyId;
```

| id | awardId | awardAmount | awardDate | agency_agencyId | agency_agencyName | agency_foundingYear |
|---|---|---|---|---|---|---|
| 100 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | 29.43 | 2025-12-01 | 100 | FSG Social Impact Advisors | 43 |
| 101 | 3012811 | 35.57 | 2022-05-12 | 101 | Whirlpool Corporation | 48 |
| 102 | 15493350 | 34.08 | 2023-10-23 | 102 | Education Writers Association | 53 |
| 103 | state_uk_17 | 19.97 | 2024-03-07 | 103 | Switch Card Services Ltd. | 58 |

This view joins the `EngagementAward` table with the `FundingAgency` table, answering the question: which funding agency authorized each engagement award? The joined result pairs each award's `awardId`, `awardAmount`, and `reviewOutcome` with the corresponding agency's `agencyName`, `agencyType`, and `foundingYear`. For example, the award `e02275d4-8fd1-11eb-924d-9cd76263cbd0` with an amount of `29.43` and a `selected` outcome is linked to `FSG Social Impact Advisors`, a `non_profit` agency founded in year `43`. The award `3012811` with an amount of `35.57` and a `not_selected` outcome is linked to `Whirlpool Corporation`, a `government` agency founded in year `48`. This view enables administrators to analyze funding patterns by agency type and to assess the distribution of awards across different categories of funders.

**View `v_engagement_award_research_project`**

```sql
CREATE VIEW v_engagement_award_research_project AS
SELECT a.id, a.awardId, a.awardAmount, a.awardDate, b.projectId AS project_projectId, b.projectTitle AS project_projectTitle, b.startDate AS project_startDate
FROM EngagementAward a JOIN ResearchProject b ON a.projectId = b.projectId;
```

| id | awardId | awardAmount | awardDate | project_projectId | project_projectTitle | project_startDate |
|---|---|---|---|---|---|---|
| 100 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | 29.43 | 2025-12-01 | 1000 | Integrated Model A | 2022-09-05T20:24:00 |
| 101 | 3012811 | 35.57 | 2022-05-12 | 1001 | Extended Cluster | 2023-02-16T03:41:00 |
| 102 | 15493350 | 34.08 | 2023-10-23 | 1002 | Pilot Review | 2024-07-27T10:58:00 |
| 103 | state_uk_17 | 19.97 | 2024-03-07 | 1003 | Baseline Initiative D | 2025-12-11T17:15:00 |

This view joins the `EngagementAward` table with the `ResearchProject` table, answering the question: which research project received each engagement award? The joined result pairs each award's `awardAmount`, `awardStatus`, and `fundingProgram` with the corresponding project's `projectTitle`, `projectStatus`, and `deliverableCount`. For example, the award `15493350` with an amount of `34.08` and `active` status under the `compact-funding-98` program is linked to the project `Pilot Review`, which has a `completed` status and `27` deliverables. The award `state_uk_17` with an amount of `19.97` and `completed` status under the `composite-funding-99` program is linked to `Baseline Initiative D`, which has a `suspended` status and `75` deliverables. This view supports financial analysis by correlating award values with project scope and status.

**View `v_engagement_award_review_panel`**

```sql
CREATE VIEW v_engagement_award_review_panel AS
SELECT a.id, a.awardId, a.awardAmount, a.awardDate, b.id AS panel_id, b.panelId AS panel_panelId, b.panelName AS panel_panelName
FROM EngagementAward a JOIN ReviewPanel b ON a.panelId = b.id;
```

| id | awardId | awardAmount | awardDate | panel_id | panel_panelId | panel_panelName |
|---|---|---|---|---|---|---|
| 100 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | 29.43 | 2025-12-01 | 1 | 2087758 | Integrated Programme A |
| 101 | 3012811 | 35.57 | 2022-05-12 | 2 | 4277009 | Extended Standard |
| 102 | 15493350 | 34.08 | 2023-10-23 | 3 | 6926358 | Pilot Framework |
| 103 | state_uk_17 | 19.97 | 2024-03-07 | 4 | 9424910 | Baseline Protocol D |

This view joins the `EngagementAward` table with the `ReviewPanel` table, answering the question: which review panel evaluated each engagement award? The joined result pairs each award's `awardId`, `awardAmount`, and `reviewOutcome` with the corresponding panel's `panelName`, `panelType`, and `reviewStatus`. For example, the award `e02275d4-8fd1-11eb-924d-9cd76263cbd0` with a `selected` outcome is linked to `Panel Alpha`, a `technical` panel with `active` status. The award `3012811` with a `not_selected` outcome is linked to `Panel Beta`, a `scientific` panel with `inactive` status. This view enables performance analysis of review panels by correlating their evaluation outcomes with their operational status and type.

**View `v_research_project_engagement_award`**

```sql
CREATE VIEW v_research_project_engagement_award AS
SELECT a.projectId, a.projectTitle, a.startDate, a.endDate, b.id AS award_id, b.awardId AS award_awardId, b.awardAmount AS award_awardAmount
FROM ResearchProject a JOIN EngagementAward b ON a.awardId = b.id;
```

| projectId | projectTitle | startDate | endDate | award_id | award_awardId | award_awardAmount |
|---|---|---|---|---|---|---|
| 1000 | Integrated Model A | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 100 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | 29.43 |
| 1001 | Extended Cluster | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 101 | 3012811 | 35.57 |
| 1002 | Pilot Review | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 102 | 15493350 | 34.08 |
| 1003 | Baseline Initiative D | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 103 | state_uk_17 | 19.97 |

This view joins the `ResearchProject` table with the `EngagementAward` table, answering the question: what award supports each research project? The joined result pairs each project's `projectTitle`, `projectStatus`, and `deliverableCount` with the corresponding award's `awardAmount`, `awardStatus`, and `fundingProgram`. For example, the project `Extended Cluster` with `active` status and `38` deliverables is supported by the award `3012811` with an amount of `35.57`, `pending` status, and `legacy-funding-97` program. The project `Pilot Review` with `completed` status and `27` deliverables is supported by the award `15493350` with an amount of `34.08`, `active` status, and `compact-funding-98` program. This view provides a project-centric perspective on funding, allowing administrators to assess the financial backing of each initiative.

**View `v_research_project_advisory_council_detail`**

```sql
CREATE VIEW v_research_project_advisory_council_detail AS
SELECT a.projectId, a.projectTitle, a.startDate, b.id AS council_id, b.councilId AS council_councilId, b.councilName AS council_councilName
FROM ResearchProject a
  JOIN ResearchProjectAdvisoryCouncil j ON j.projectId = a.projectId
  JOIN AdvisoryCouncil b ON b.id = j.councilId;
```

| projectId | projectTitle | startDate | council_id | council_councilId | council_councilName |
|---|---|---|---|---|---|
| 1000 | Integrated Model A | 2022-09-05T20:24:00 | 1 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Legacy Standard D |
| 1000 | Integrated Model A | 2022-09-05T20:24:00 | 2 | Bjornfant | Regional Framework |
| 1001 | Extended Cluster | 2023-02-16T03:41:00 | 2 | Bjornfant | Regional Framework |
| 1001 | Extended Cluster | 2023-02-16T03:41:00 | 3 | 726041 | Seasonal Protocol |
| 1002 | Pilot Review | 2024-07-27T10:58:00 | 3 | 726041 | Seasonal Protocol |
| 1002 | Pilot Review | 2024-07-27T10:58:00 | 4 | 2a540c6d30d447058e7e4de6c68c2d6d | Integrated Programme A |
| 1003 | Baseline Initiative D | 2025-12-11T17:15:00 | 4 | 2a540c6d30d447058e7e4de6c68c2d6d | Integrated Programme A |
| 1003 | Baseline Initiative D | 2025-12-11T17:15:00 | 1 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Legacy Standard D |

This view joins the `ResearchProject` table with the `AdvisoryCouncil` table, answering the question: which advisory council oversees each research project? The joined result pairs each project's `projectTitle`, `projectStatus`, and `primaryObjective` with the corresponding council's `councilName`, `councilStatus`, and `memberCount`. For example, the project `Integrated Model A` with `planning` status and `primary-primary-58` objective is overseen by `Legacy Standard D`, an `active` council with `4` members. The project `Extended Cluster` with `active` status and `adaptive-primary-59` objective is overseen by `Regional Framework`, an `inactive` council with `17` members. This view supports governance analysis by correlating project phases with council maturity and composition.

**View `v_research_project_research_output`**

```sql
CREATE VIEW v_research_project_research_output AS
SELECT a.projectId, a.projectTitle, a.startDate, a.endDate, b.id AS output_id, b.outputId AS output_outputId, b.outputType AS output_outputType
FROM ResearchProject a JOIN ResearchOutput b ON a.outputId = b.id;
```

| projectId | projectTitle | startDate | endDate | output_id | output_outputId | output_outputType |
|---|---|---|---|---|---|---|
| 1000 | Integrated Model A | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 3717613 | tool |
| 1001 | Extended Cluster | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 937738 | report |
| 1002 | Pilot Review | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | 974934 | dataset |
| 1003 | Baseline Initiative D | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | framework |

This view joins the `ResearchProject` table with the `ResearchOutput` table, answering the question: what research output is produced by each project? The joined result pairs each project's `projectTitle`, `projectStatus`, and `deliverableCount` with the corresponding output's `outputType`, `status`, and `accessLevel`. For example, the project `Integrated Model A` with `planning` status and `1` deliverable produces a `tool` output with `draft` status and `public` access. The project `Extended Cluster` with `active` status and `38` deliverables produces a `report` output with `review` status and `restricted` access. This view enables output tracking by correlating project progress with the publication state of its deliverables.

**View `v_advisory_council_research_project`**

```sql
CREATE VIEW v_advisory_council_research_project AS
SELECT a.id, a.councilId, a.councilName, a.organizationId, b.projectId AS project_projectId, b.projectTitle AS project_projectTitle, b.startDate AS project_startDate
FROM AdvisoryCouncil a JOIN ResearchProject b ON a.projectId = b.projectId;
```

| id | councilId | councilName | organizationId | project_projectId | project_projectTitle | project_startDate |
|---|---|---|---|---|---|---|
| 1 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Legacy Standard D | Shell Oil | 1000 | Integrated Model A | 2022-09-05T20:24:00 |
| 2 | Bjornfant | Regional Framework | GlobalPlatform Inc. | 1001 | Extended Cluster | 2023-02-16T03:41:00 |
| 3 | 726041 | Seasonal Protocol | Whatsapp Inc. | 1002 | Pilot Review | 2024-07-27T10:58:00 |
| 4 | 2a540c6d30d447058e7e4de6c68c2d6d | Integrated Programme A | American Institutes for Research | 1003 | Baseline Initiative D | 2025-12-11T17:15:00 |

This view joins the `AdvisoryCouncil` table with the `ResearchProject` table, answering the question: which research project does each advisory council advise? The joined result pairs each council's `councilName`, `councilStatus`, and `meetingFrequency` with the corresponding project's `projectTitle`, `projectStatus`, and `deliverableCount`. For example, the council `Legacy Standard D` with `active` status and `weekly` meetings advises `Integrated Model A`, a `planning` project with `1` deliverable. The council `Seasonal Protocol` with `dissolved` status and `quarterly` meetings advises `Pilot Review`, a `completed` project with `27` deliverables. This view provides a council-centric perspective on governance, allowing administrators to assess the workload and effectiveness of each council.

**View `v_advisory_council_healthcare_organization`**

```sql
CREATE VIEW v_advisory_council_healthcare_organization AS
SELECT a.id, a.councilId, a.councilName, a.organizationId, b.id AS organization_id, b.orgId AS organization_orgId, b.orgName AS organization_orgName
FROM AdvisoryCouncil a JOIN HealthcareOrganization b ON a.advisesOrganizationId = b.id;
```

| id | councilId | councilName | organizationId | organization_id | organization_orgId | organization_orgName |
|---|---|---|---|---|---|---|
| 1 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Legacy Standard D | Shell Oil | 1000 | 790471 | Extended Review |
| 2 | Bjornfant | Regional Framework | GlobalPlatform Inc. | 1001 | 1717 | Pilot Initiative A |
| 3 | 726041 | Seasonal Protocol | Whatsapp Inc. | 1002 | 69437 | Baseline Model |
| 4 | 2a540c6d30d447058e7e4de6c68c2d6d | Integrated Programme A | American Institutes for Research | 1003 | m16 | Distributed Cluster |

This view joins the `AdvisoryCouncil` table with the `HealthcareOrganization` table, answering the question: which healthcare organization sponsors each advisory council? The joined result pairs each council's `councilName`, `councilStatus`, and `memberCount` with the corresponding organization's `orgName`, `orgType`, and `bedCount`. For example, the council `Legacy Standard D` with `active` status and `4` members is sponsored by `Extended Review`, a `hospital` with `19` beds. The council `Regional Framework` with `inactive` status and `17` members is sponsored by `Pilot Initiative A`, a `clinic` with `75` beds. This view supports institutional analysis by correlating council characteristics with the capacity and type of their sponsoring organizations.

**View `v_advisory_council_research_output`**

```sql
CREATE VIEW v_advisory_council_research_output AS
SELECT a.id, a.councilId, a.councilName, a.organizationId, b.id AS output_id, b.outputId AS output_outputId, b.outputType AS output_outputType
FROM AdvisoryCouncil a JOIN ResearchOutput b ON a.outputId = b.id;
```

| id | councilId | councilName | organizationId | output_id | output_outputId | output_outputType |
|---|---|---|---|---|---|---|
| 1 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Legacy Standard D | Shell Oil | 1 | 3717613 | tool |
| 2 | Bjornfant | Regional Framework | GlobalPlatform Inc. | 2 | 937738 | report |
| 3 | 726041 | Seasonal Protocol | Whatsapp Inc. | 3 | 974934 | dataset |
| 4 | 2a540c6d30d447058e7e4de6c68c2d6d | Integrated Programme A | American Institutes for Research | 4 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | framework |

This view joins the `AdvisoryCouncil` table with the `ResearchOutput` table, answering the question: what research output does each advisory council oversee? The joined result pairs each council's `councilName`, `councilStatus`, and `meetingFrequency` with the corresponding output's `outputType`, `status`, and `versionNumber`. For example, the council `Legacy Standard D` with `active` status and `weekly` meetings oversees a `tool` output with `draft` status and version `VER-2245`. The council `Integrated Programme A` with `forming` status and `ad_hoc` meetings oversees a `framework` output with `archived` status and version `VER-2257`. This view enables output governance analysis by correlating council activity levels with the maturity of the outputs they oversee.

**View `v_healthcare_organization_advisory_council_detail`**

```sql
CREATE VIEW v_healthcare_organization_advisory_council_detail AS
SELECT a.id, a.orgId, a.orgName, b.id AS council_id, b.councilId AS council_councilId, b.councilName AS council_councilName
FROM HealthcareOrganization a
  JOIN HealthcareOrganizationAdvisoryCouncil j ON j.organizationId = a.id
  JOIN AdvisoryCouncil b ON b.id = j.councilId;
```

| id | orgId | orgName | council_id | council_councilId | council_councilName |
|---|---|---|---|---|---|
| 1000 | 790471 | Extended Review | 1 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Legacy Standard D |
| 1000 | 790471 | Extended Review | 2 | Bjornfant | Regional Framework |
| 1001 | 1717 | Pilot Initiative A | 2 | Bjornfant | Regional Framework |
| 1001 | 1717 | Pilot Initiative A | 3 | 726041 | Seasonal Protocol |
| 1002 | 69437 | Baseline Model | 3 | 726041 | Seasonal Protocol |
| 1002 | 69437 | Baseline Model | 4 | 2a540c6d30d447058e7e4de6c68c2d6d | Integrated Programme A |
| 1003 | m16 | Distributed Cluster | 4 | 2a540c6d30d447058e7e4de6c68c2d6d | Integrated Programme A |
| 1003 | m16 | Distributed Cluster | 1 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Legacy Standard D |

This view joins the `HealthcareOrganization` table with the `AdvisoryCouncil` table, answering the question: which advisory councils are sponsored by each healthcare organization? The joined result pairs each organization's `orgName`, `orgType`, and `bedCount` with the corresponding council's `councilName`, `councilStatus`, and `memberCount`. For example, the organization `Extended Review`, a `hospital` with `19` beds, sponsors the council `Legacy Standard D`, which has `active` status and `4` members. The organization `Distributed Cluster`, a `non_profit` with `17` beds, sponsors the council `Integrated Programme A`, which has `forming` status and `0` members. This view supports institutional governance analysis by correlating organizational capacity with council maturity.

**View `v_healthcare_organization_research_output`**

```sql
CREATE VIEW v_healthcare_organization_research_output AS
SELECT a.id, a.orgId, a.orgName, a.orgType, b.id AS output_id, b.outputId AS output_outputId, b.outputType AS output_outputType
FROM HealthcareOrganization a JOIN ResearchOutput b ON a.outputId = b.id;
```

| id | orgId | orgName | orgType | output_id | output_outputId | output_outputType |
|---|---|---|---|---|---|---|
| 1000 | 790471 | Extended Review | hospital | 1 | 3717613 | tool |
| 1001 | 1717 | Pilot Initiative A | clinic | 2 | 937738 | report |
| 1002 | 69437 | Baseline Model | health_system | 3 | 974934 | dataset |
| 1003 | m16 | Distributed Cluster | non_profit | 4 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | framework |

This view joins the `HealthcareOrganization` table with the `ResearchOutput` table, answering the question: what research output is associated with each healthcare organization? The joined result pairs each organization's `orgName`, `orgType`, and `locationCity` with the corresponding output's `outputType`, `status`, and `accessLevel`. For example, the organization `Extended Review`, a `hospital` located in `seasonal-location-23`, is associated with a `tool` output that has `draft` status and `public` access. The organization `Baseline Model`, a `health_system` located in `legacy-location-25`, is associated with a `dataset` output that has `published` status and `internal` access. This view enables institutional output tracking by correlating organizational characteristics with the nature and visibility of their research products.

**View `v_research_output_research_project`**

```sql
CREATE VIEW v_research_output_research_project AS
SELECT a.id, a.outputId, a.outputType, a.creationDate, b.projectId AS project_projectId, b.projectTitle AS project_projectTitle, b.startDate AS project_startDate
FROM ResearchOutput a JOIN ResearchProject b ON a.projectId = b.projectId;
```

| id | outputId | outputType | creationDate | project_projectId | project_projectTitle | project_startDate |
|---|---|---|---|---|---|---|
| 1 | 3717613 | tool | 2022-01-13 | 1000 | Integrated Model A | 2022-09-05T20:24:00 |
| 2 | 937738 | report | 2023-06-24 | 1001 | Extended Cluster | 2023-02-16T03:41:00 |
| 3 | 974934 | dataset | 2024-11-08 | 1002 | Pilot Review | 2024-07-27T10:58:00 |
| 4 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | framework | 2025-04-19 | 1003 | Baseline Initiative D | 2025-12-11T17:15:00 |

This view joins the `ResearchOutput` table with the `ResearchProject` table, answering the question: which research project produced each output? The joined result pairs each output's `outputType`, `status`, and `accessLevel` with the corresponding project's `projectTitle`, `projectStatus`, and `deliverableCount`. For example, the `tool` output with `draft` status and `public` access was produced by `Integrated Model A`, a `planning` project with `1` deliverable. The `dataset` output with `published` status and `internal` access was produced by `Pilot Review`, a `completed` project with `27` deliverables. This view provides an output-centric perspective on project performance, allowing administrators to assess the relationship between project status and output maturity.

**View `v_research_output_advisory_council`**

```sql
CREATE VIEW v_research_output_advisory_council AS
SELECT a.id, a.outputId, a.outputType, a.creationDate, b.id AS council_id, b.councilId AS council_councilId, b.councilName AS council_councilName
FROM ResearchOutput a JOIN AdvisoryCouncil b ON a.councilId = b.id;
```

| id | outputId | outputType | creationDate | council_id | council_councilId | council_councilName |
|---|---|---|---|---|---|---|
| 1 | 3717613 | tool | 2022-01-13 | 1 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Legacy Standard D |
| 2 | 937738 | report | 2023-06-24 | 2 | Bjornfant | Regional Framework |
| 3 | 974934 | dataset | 2024-11-08 | 3 | 726041 | Seasonal Protocol |
| 4 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | framework | 2025-04-19 | 4 | 2a540c6d30d447058e7e4de6c68c2d6d | Integrated Programme A |

This view joins the `ResearchOutput` table with the `AdvisoryCouncil` table, answering the question: which advisory council oversaw each research output? The joined result pairs each output's `outputType`, `status`, and `versionNumber` with the corresponding council's `councilName`, `councilStatus`, and `meetingFrequency`. For example, the `report` output with `review` status and version `VER-2249` was overseen by `Regional Framework`, an `inactive` council that meets `monthly`. The `framework` output with `archived` status and version `VER-2257` was overseen by `Integrated Programme A`, a `forming` council that meets `ad_hoc`. This view supports governance quality analysis by correlating output maturity with council activity levels.

**View `v_funding_agency_engagement_award_detail`**

```sql
CREATE VIEW v_funding_agency_engagement_award_detail AS
SELECT a.agencyId, a.agencyName, a.foundingYear, b.id AS award_id, b.awardId AS award_awardId, b.awardAmount AS award_awardAmount
FROM FundingAgency a
  JOIN FundingAgencyEngagementAward j ON j.agencyId = a.agencyId
  JOIN EngagementAward b ON b.id = j.awardId;
```

| agencyId | agencyName | foundingYear | award_id | award_awardId | award_awardAmount |
|---|---|---|---|---|---|
| 100 | FSG Social Impact Advisors | 43 | 100 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | 29.43 |
| 100 | FSG Social Impact Advisors | 43 | 101 | 3012811 | 35.57 |
| 101 | Whirlpool Corporation | 48 | 101 | 3012811 | 35.57 |
| 101 | Whirlpool Corporation | 48 | 102 | 15493350 | 34.08 |
| 102 | Education Writers Association | 53 | 102 | 15493350 | 34.08 |
| 102 | Education Writers Association | 53 | 103 | state_uk_17 | 19.97 |
| 103 | Switch Card Services Ltd. | 58 | 103 | state_uk_17 | 19.97 |
| 103 | Switch Card Services Ltd. | 58 | 100 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | 29.43 |

This view joins the `FundingAgency` table with the `EngagementAward` table, answering the question: which engagement awards were authorized by each funding agency? The joined result pairs each agency's `agencyName`, `agencyType`, and `foundingYear` with the corresponding award's `awardId`, `awardAmount`, and `reviewOutcome`. For example, the agency `FSG Social Impact Advisors`, a `non_profit` founded in year `43`, authorized the award `e02275d4-8fd1-11eb-924d-9cd76263cbd0` with an amount of `29.43` and a `selected` outcome. The agency `Whirlpool Corporation`, a `government` entity founded in year `48`, authorized the award `3012811` with an amount of `35.57` and a `not_selected` outcome. This view enables agency performance analysis by correlating agency characteristics with their award outcomes.

**View `v_funding_agency_review_panel`**

```sql
CREATE VIEW v_funding_agency_review_panel AS
SELECT a.agencyId, a.agencyName, a.foundingYear, a.agencyType, b.id AS panel_id, b.panelId AS panel_panelId, b.panelName AS panel_panelName
FROM FundingAgency a JOIN ReviewPanel b ON a.panelId = b.id;
```

| agencyId | agencyName | foundingYear | agencyType | panel_id | panel_panelId | panel_panelName |
|---|---|---|---|---|---|---|
| 100 | FSG Social Impact Advisors | 43 | non_profit | 1 | 2087758 | Integrated Programme A |
| 101 | Whirlpool Corporation | 48 | government | 2 | 4277009 | Extended Standard |
| 102 | Education Writers Association | 53 | private | 3 | 6926358 | Pilot Framework |
| 103 | Switch Card Services Ltd. | 58 | non_profit | 4 | 9424910 | Baseline Protocol D |

This view joins the `FundingAgency` table with the `ReviewPanel` table, answering the question: which review panel serves each funding agency? The joined result pairs each agency's `agencyName`, `agencyType`, and `authorizationSource` with the corresponding panel's `panelName`, `panelType`, and `reviewStatus`. For example, the agency `FSG Social Impact Advisors`, a `non_profit` authorized by `congress`, is served by `Panel Alpha`, a `technical` panel with `active` status. The agency `Education Writers Association`, a `private` entity authorized by `private_founding`, is served by `Panel Gamma`, a `financial` panel with `pending` status. This view supports institutional alignment analysis by correlating agency types with the panel types they employ.

**View `v_review_panel_engagement_award`**

```sql
CREATE VIEW v_review_panel_engagement_award AS
SELECT a.id, a.panelId, a.panelName, a.reviewDate, b.id AS award_id, b.awardId AS award_awardId, b.awardAmount AS award_awardAmount
FROM ReviewPanel a JOIN EngagementAward b ON a.awardId = b.id;
```

| id | panelId | panelName | reviewDate | award_id | award_awardId | award_awardAmount |
|---|---|---|---|---|---|---|
| 1 | 2087758 | Integrated Programme A | 2024-11-03T22:54:00 | 100 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | 29.43 |
| 2 | 4277009 | Extended Standard | 2025-04-14T05:11:00 | 101 | 3012811 | 35.57 |
| 3 | 6926358 | Pilot Framework | 2022-09-25T12:28:00 | 102 | 15493350 | 34.08 |
| 4 | 9424910 | Baseline Protocol D | 2023-02-09T19:45:00 | 103 | state_uk_17 | 19.97 |

This view joins the `ReviewPanel` table with the `EngagementAward` table, answering the question: which engagement awards were evaluated by each review panel? The joined result pairs each panel's `panelName`, `panelType`, and `reviewStatus` with the corresponding award's `awardId`, `awardAmount`, and `reviewOutcome`. For example, `Panel Alpha`, a `technical` panel with `active` status, evaluated the award `e02275d4-8fd1-11eb-924d-9cd76263cbd0` with an amount of `29.43` and a `selected` outcome. `Panel Beta`, a `scientific` panel with `inactive` status, evaluated the award `3012811` with an amount of `35.57` and a `not_selected` outcome. This view enables panel performance analysis by correlating panel characteristics with their evaluation outcomes.

**View `v_review_panel_funding_agency`**

```sql
CREATE VIEW v_review_panel_funding_agency AS
SELECT a.id, a.panelId, a.panelName, a.reviewDate, b.agencyId AS agency_agencyId, b.agencyName AS agency_agencyName, b.foundingYear AS agency_foundingYear
FROM ReviewPanel a JOIN FundingAgency b ON a.agencyId = b.agencyId;
```

| id | panelId | panelName | reviewDate | agency_agencyId | agency_agencyName | agency_foundingYear |
|---|---|---|---|---|---|---|
| 1 | 2087758 | Integrated Programme A | 2024-11-03T22:54:00 | 100 | FSG Social Impact Advisors | 43 |
| 2 | 4277009 | Extended Standard | 2025-04-14T05:11:00 | 101 | Whirlpool Corporation | 48 |
| 3 | 6926358 | Pilot Framework | 2022-09-25T12:28:00 | 102 | Education Writers Association | 53 |
| 4 | 9424910 | Baseline Protocol D | 2023-02-09T19:45:00 | 103 | Switch Card Services Ltd. | 58 |

This view joins the `ReviewPanel` table with the `FundingAgency` table, answering the question: which funding agency does each review panel serve? The joined result pairs each panel's `panelName`, `panelType`, and `reviewStatus` with the corresponding agency's `agencyName`, `agencyType`, and `headquartersCity`. For example, `Panel Alpha`, a `technical` panel with `active` status, serves `FSG Social Impact Advisors`, a `non_profit` headquartered in `seasonal-headquar-83`. `Panel Delta`, a `strategic` panel with `completed` status, serves `Switch Card Services Ltd.`, a `non_profit` headquartered in `compact-headquar-86`. This view supports institutional coordination analysis by mapping the relationships between panels and their sponsoring agencies.

The research administration ecosystem described here operates as an integrated system of accountability and transparency. Funding agencies authorize resources through review panels, which evaluate proposals and issue engagement awards to research projects. Healthcare organizations host the work and sponsor advisory councils that provide governance. Research outputs crystallize the results of this coordinated effort, each carrying its own metadata about type, status, and access. The views presented above provide multiple lenses through which to examine this ecosystem: from the perspective of individual awards, projects, councils, organizations, outputs, agencies, and panels. Together, they form a comprehensive record of how research resources flow through the system, how decisions are made, and how outcomes are tracked. This architecture ensures that every engagement award can be traced to its source, every project can be linked to its funding and governance, and every output can be associated with its institutional home and oversight body.

## Data appendix

**Table `ResearchProjectAdvisoryCouncil`**

| projectId | councilId |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `HealthcareOrganizationAdvisoryCouncil`**

| organizationId | councilId |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `FundingAgencyEngagementAward`**

| agencyId | awardId |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |
