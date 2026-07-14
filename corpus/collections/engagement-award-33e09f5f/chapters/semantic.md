The research enterprise is a network of funded initiatives, each anchored by an award, steered by advisory councils, and producing tangible outputs. At the centre of this domain sit seven base tables that capture the lifecycle of a research project from its conception through to its dissemination, while a set of twelve materialised views reconstruct the multi-table joins that domain analysts query in day-to-day reporting. The schema is deliberately normalised: each real-world entity type is isolated in its own table, relationships are expressed through foreign keys and junction tables, and the views serve as denormalised lenses that reassemble the facts without duplicating storage.

## The Core Entity Types

The domain begins with `FundingAgency`, the source of financial authority. Each row represents a distinct funding body, identified by `agencyId` and described by `agencyName`, `foundingYear`, `agencyType`, `authorizationSource`, and `headquartersCity`. The agency `FSG Social Impact Advisors` (agencyId 100) is a non-profit founded in year 43, authorised by congress and headquartered in `seasonal-headquar-83`; `Whirlpool Corporation` (agencyId 101) is a government body with charter authorisation. Every agency also carries a `panelId` that links it to a `ReviewPanel` — the body that evaluates grant proposals.

`EngagementAward` records the concrete award decisions. Its primary key is `id`, and each row carries a business-level `awardId` (a UUID such as `e02275d4-8fd1-11eb-924d-9cd76263cbd0` for row 100, or a numeric string like `3012811` for row 101). The columns `awardAmount`, `awardDate`, `awardStatus`, `fundingProgram`, and `reviewOutcome` describe the financial and procedural state of the award. Three foreign keys anchor the award to the wider domain: `agencyId` points to `FundingAgency`, `projectId` points to `ResearchProject`, and `panelId` points to `ReviewPanel`. The row with id 100, for instance, awards 29.43 on 2025-12-01 under the `regional-funding-96` programme, with status `approved` and review outcome `selected`, linking agency 100, project 1000, and panel 1.

**Table `EngagementAward`**

| id | awardId | awardAmount | awardDate | awardStatus | fundingProgram | reviewOutcome | agencyId | projectId | panelId | createdAt |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | 29.43 | 2025-12-01 | approved | regional-funding-96 | selected | 100 | 1000 | 1 | 2025-01-01 00:14:00 |
| 101 | 3012811 | 35.57 | 2022-05-12 | pending | legacy-funding-97 | not_selected | 101 | 1001 | 2 | 2025-02-06 03:14:00 |
| 102 | 15493350 | 34.08 | 2023-10-23 | active | compact-funding-98 | under_review | 102 | 1002 | 3 | 2025-03-11 06:14:00 |
| 103 | state_uk_17 | 19.97 | 2024-03-07 | completed | composite-funding-99 | selected | 103 | 1003 | 4 | 2025-04-16 09:14:00 |

`ResearchProject` captures the scientific initiative itself. Its surrogate key is `projectId`, and the row with value 1000 corresponds to the project titled `Integrated Model A`, which began on 2022-09-05 and was originally scheduled to end on 2022-09-01 — a date inversion that reflects the planning-stage uncertainty of early projects. The columns `projectStatus` (values include `planning`, `active`, `completed`, `suspended`), `primaryObjective`, and `deliverableCount` describe the project's scope. The project row 1000 has a `deliverableCount` of 1 and an objective labelled `primary-primary-58`. A foreign key `awardId` links the project back to its funding award, and `outputId` links it to its primary `ResearchOutput`.

**Table `ResearchProject`**

| projectId | projectTitle | startDate | endDate | projectStatus | primaryObjective | deliverableCount | awardId | outputId | createdAt |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | Integrated Model A | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planning | primary-primary-58 | 1 | 100 | 1 | 2025-01-01 00:14:00 |
| 1001 | Extended Cluster | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | active | adaptive-primary-59 | 38 | 101 | 2 | 2025-02-06 03:14:00 |
| 1002 | Pilot Review | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | distributed-primary-60 | 27 | 102 | 3 | 2025-03-11 06:14:00 |
| 1003 | Baseline Initiative D | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | suspended | baseline-primary-61 | 75 | 103 | 4 | 2025-04-16 09:14:00 |

`AdvisoryCouncil` represents the governance bodies that oversee projects. Each council has a surrogate `id`, a business `councilId` (which may be a UUID or a free-text name such as `Bjornfant`), a `councilName` like `Legacy Standard D`, and an `organizationId` pointing to a `HealthcareOrganization`. The council's `establishmentDate`, `councilStatus` (`active`, `inactive`, `dissolved`, `forming`), `memberCount`, and `meetingFrequency` (values include `weekly`, `monthly`, `quarterly`, `ad_hoc`) describe its operational profile. The council row with id 1 was established on 2024-07-11, has 4 members, meets weekly, and is linked to project 1000 and organization 1000.

**Table `AdvisoryCouncil`**

| id | councilId | councilName | organizationId | establishmentDate | councilStatus | memberCount | meetingFrequency | projectId | advisesOrganizationId | outputId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Legacy Standard D | Shell Oil | 2024-07-11 | active | 4 | weekly | 1000 | 1000 | 1 |
| 2 | Bjornfant | Regional Framework | GlobalPlatform Inc. | 2025-12-22 | inactive | 17 | monthly | 1001 | 1001 | 2 |
| 3 | 726041 | Seasonal Protocol | Whatsapp Inc. | 2022-05-06 | dissolved | 9 | quarterly | 1002 | 1002 | 3 |
| 4 | 2a540c6d30d447058e7e4de6c68c2d6d | Integrated Programme A | American Institutes for Research | 2023-10-17 | forming | 0 | ad_hoc | 1003 | 1003 | 4 |

`HealthcareOrganization` models the institutional hosts of advisory councils. Its surrogate key is `id`, and each row carries an `orgId` (which may be numeric like `790471` or textual like `m16`), an `orgName`, an `orgType` (`hospital`, `clinic`, `health_system`, `non_profit`), geographic location columns (`locationCity`, `locationState`), a `foundedDate`, and a `bedCount`. The organization with id 1000 is named `Extended Review`, is of type `hospital`, has 19 beds, and was founded on 2024-03-15.

**Table `HealthcareOrganization`**

| id | orgId | orgName | orgType | locationCity | locationState | foundedDate | bedCount | outputId |
|---|---|---|---|---|---|---|---|---|
| 1000 | 790471 | Extended Review | hospital | seasonal-location-23 | composite-location-93 | 2024-03-15 | 19 | 1 |
| 1001 | 1717 | Pilot Initiative A | clinic | regional-location-24 | primary-location-94 | 2025-08-26 | 75 | 2 |
| 1002 | 69437 | Baseline Model | health_system | legacy-location-25 | adaptive-location-95 | 2022-01-10 | 2 | 3 |
| 1003 | m16 | Distributed Cluster | non_profit | compact-location-26 | distributed-location-96 | 2023-06-21 | 17 | 4 |

`ResearchOutput` captures the tangible products of research — tools, reports, datasets, frameworks. Its surrogate key is `id`, and each row carries an `outputId` (numeric or UUID), an `outputType`, a `creationDate`, a `versionNumber` (e.g. `VER-2245`), a `status` (`draft`, `review`, `published`, `archived`), and an `accessLevel` (`public`, `restricted`, `internal`). The output with id 1 is a `tool` created on 2022-01-13, at version `VER-2245`, in `draft` status with `public` access. Foreign keys `projectId` and `councilId` link the output to its originating project and advisory council.

**Table `ResearchOutput`**

| id | outputId | outputType | creationDate | versionNumber | status | accessLevel | projectId | councilId |
|---|---|---|---|---|---|---|---|---|
| 1 | 3717613 | tool | 2022-01-13 | VER-2245 | draft | public | 1000 | 1 |
| 2 | 937738 | report | 2023-06-24 | VER-2249 | review | restricted | 1001 | 2 |
| 3 | 974934 | dataset | 2024-11-08 | VER-2253 | published | internal | 1002 | 3 |
| 4 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | framework | 2025-04-19 | VER-2257 | archived | public | 1003 | 4 |

`FundingAgency` was introduced above; its full structure is:

**Table `FundingAgency`**

| agencyId | agencyName | foundingYear | agencyType | authorizationSource | headquartersCity | panelId |
|---|---|---|---|---|---|---|
| 100 | FSG Social Impact Advisors | 43 | non_profit | congress | seasonal-headquar-83 | 1 |
| 101 | Whirlpool Corporation | 48 | government | charter | regional-headquar-84 | 2 |
| 102 | Education Writers Association | 53 | private | private_founding | legacy-headquar-85 | 3 |
| 103 | Switch Card Services Ltd. | 58 | non_profit | congress | compact-headquar-86 | 4 |

`ReviewPanel` is the evaluation body referenced by both `EngagementAward` and `FundingAgency` through the `panelId` column. Each panel is identified by `id` and carries attributes such as `panelName`, `panelType`, `establishmentDate`, `panelStatus`, `memberCount`, and `meetingFrequency`. The panel with id 1 is named `Panel Alpha`, is of type `scientific`, was established on 2022-01-01, has status `active`, 10 members, and meets monthly.

**Table `ReviewPanel`**

| id | panelId | panelName | reviewDate | reviewCriteria | panelStatus | memberCount | awardId | agencyId | createdAt |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 2087758 | Integrated Programme A | 2024-11-03T22:54:00 | legacy-review-37 | active | 4 | 100 | 100 | 2025-01-01 00:14:00 |
| 2 | 4277009 | Extended Standard | 2025-04-14T05:11:00 | compact-review-38 | dissolved | 17 | 101 | 101 | 2025-02-06 03:14:00 |
| 3 | 6926358 | Pilot Framework | 2022-09-25T12:28:00 | composite-review-39 | reconstituted | 9 | 102 | 102 | 2025-03-11 06:14:00 |
| 4 | 9424910 | Baseline Protocol D | 2023-02-09T19:45:00 | primary-review-40 | active | 0 | 103 | 103 | 2025-04-16 09:14:00 |

## Junction Tables and Many-to-Many Relationships

Not all relationships are one-to-many. The schema uses explicit junction tables to model many-to-many associations. `ResearchProjectAdvisoryCouncil` links projects to councils, allowing a single project to be overseen by multiple councils and a single council to advise multiple projects. Its columns `projectId` and `councilId` form a composite foreign key referencing `ResearchProject` and `AdvisoryCouncil` respectively.

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

`HealthcareOrganizationAdvisoryCouncil` similarly links healthcare organisations to advisory councils, with `organizationId` and `councilId` as foreign keys.

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

`FundingAgencyEngagementAward` connects funding agencies to engagement awards, with `agencyId` and `awardId` as foreign keys, enabling an agency to sponsor multiple awards and an award to draw from multiple agencies.

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

## Materialised Views: Reconstructing Domain Facts

The base tables are normalised to third normal form, which means that answering a question like "which funding agency sponsored which engagement award?" requires a join. The materialised views pre-compute these joins, presenting denormalised result sets that analysts can query directly.

The view `v_engagement_award_funding_agency` joins `EngagementAward` to `FundingAgency` on `agencyId`, producing rows that pair each award with its sponsoring agency. The first row shows award `e02275d4-8fd1-11eb-924d-9cd76263cbd0` (amount 29.43, status `approved`) sponsored by `FSG Social Impact Advisors` (agencyType `non_profit`).

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

`v_engagement_award_research_project` joins `EngagementAward` to `ResearchProject` on `projectId`, answering which project each award funds. The row with award id 100 links to project `Integrated Model A` (status `planning`, 1 deliverable).

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

`v_engagement_award_review_panel` joins `EngagementAward` to `ReviewPanel` on `panelId`, revealing which panel evaluated each award. The award with id 100 was evaluated by `Panel Alpha` (type `scientific`, status `active`).

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

`v_research_project_engagement_award` is the inverse of `v_engagement_award_research_project`: it starts from the project side and shows the associated award. Project `Extended Cluster` (id 1001, status `active`, 38 deliverables) is linked to award id 101 (amount 35.57, status `pending`).

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

`v_research_project_advisory_council_detail` joins `ResearchProject` to `AdvisoryCouncil` on `projectId`, showing which council oversees each project. Project `Integrated Model A` is overseen by council `Legacy Standard D` (status `active`, 4 members, weekly meetings).

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

`v_research_project_research_output` joins `ResearchProject` to `ResearchOutput` on `outputId`, revealing the primary output of each project. Project `Pilot Review` (id 1002, status `completed`) produced output id 3, a `dataset` at version `VER-2253` with `internal` access.

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

`v_advisory_council_research_project` is the inverse of `v_research_project_advisory_council_detail`: it starts from the council side. Council `Regional Framework` (id 2, status `inactive`, 17 members) advises project `Extended Cluster` (id 1001).

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

`v_advisory_council_healthcare_organization` joins `AdvisoryCouncil` to `HealthcareOrganization` on `organizationId`, showing which organisation hosts each council. Council `Legacy Standard D` is hosted by `Extended Review` (orgType `hospital`, 19 beds).

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

`v_advisory_council_research_output` joins `AdvisoryCouncil` to `ResearchOutput` on `councilId`, revealing which output each council is associated with. Council `Seasonal Protocol` (id 3, status `dissolved`) is linked to output id 3, a `dataset`.

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

`v_healthcare_organization_advisory_council_detail` joins `HealthcareOrganization` to `AdvisoryCouncil` on `organizationId`, answering which councils a given organisation hosts. Organisation `Extended Review` (id 1000) hosts council `Legacy Standard D` (established 2024-07-11, weekly meetings).

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

`v_healthcare_organization_research_output` joins `HealthcareOrganization` to `ResearchOutput` on `outputId`, showing which research outputs are associated with each organisation. Organisation `Pilot Initiative A` (id 1001, type `clinic`, 75 beds) is linked to output id 2, a `report` at version `VER-2249` with `restricted` access.

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

`v_research_output_research_project` is the inverse of `v_research_project_research_output`: it starts from the output side. Output `3717613` (type `tool`, status `draft`, `public` access) was produced by project `Integrated Model A` (id 1000).

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

`v_research_output_advisory_council` joins `ResearchOutput` to `AdvisoryCouncil` on `councilId`, showing which council is associated with each output. Output `937738` (type `report`, status `review`) is associated with council `Regional Framework` (id 2).

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

`v_funding_agency_engagement_award_detail` joins `FundingAgency` to `EngagementAward` on `agencyId`, answering which awards each agency sponsors. Agency `Whirlpool Corporation` (id 101, type `government`) sponsors award id 101 (amount 35.57, status `pending`, review outcome `not_selected`).

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

`v_funding_agency_review_panel` joins `FundingAgency` to `ReviewPanel` on `panelId`, revealing which panel evaluates proposals from each agency. Agency `Education Writers Association` (id 102, type `private`) is linked to panel id 3 (`Panel Gamma`, type `policy`, status `active`).

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

`v_review_panel_engagement_award` is the inverse of `v_engagement_award_review_panel`: it starts from the panel side. Panel `Panel Alpha` (id 1, type `scientific`) evaluated award id 100 (amount 29.43, status `approved`).

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

`v_review_panel_funding_agency` is the inverse of `v_funding_agency_review_panel`: it starts from the panel side and shows which agencies it evaluates. Panel `Panel Beta` (id 2, type `technical`) evaluates proposals from agency `Whirlpool Corporation` (id 101).

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

## Synthesis

The schema models the research enterprise as a set of interlocking entities: funding agencies commission awards, awards fund projects, projects produce outputs, advisory councils govern projects and are hosted by healthcare organisations, and review panels evaluate both agencies and awards. The base tables enforce referential integrity through foreign keys — `EngagementAward.agencyId` → `FundingAgency.agencyId`, `EngagementAward.projectId` → `ResearchProject.projectId`, `EngagementAward.panelId` → `ReviewPanel.id`, `ResearchProject.awardId` → `EngagementAward.id`, `ResearchProject.outputId` → `ResearchOutput.id`, `AdvisoryCouncil.organizationId` → `HealthcareOrganization.id`, `AdvisoryCouncil.projectId` → `ResearchProject.projectId`, `AdvisoryCouncil.outputId` → `ResearchOutput.id`, `HealthcareOrganization.outputId` → `ResearchOutput.id`, `ResearchOutput.projectId` → `ResearchProject.projectId`, `ResearchOutput.councilId` → `AdvisoryCouncil.id`, and `FundingAgency.panelId` → `ReviewPanel.id`. The junction tables `ResearchProjectAdvisoryCouncil`, `HealthcareOrganizationAdvisoryCouncil`, and `FundingAgencyEngagementAward` handle the many-to-many relationships that cannot be expressed through simple foreign keys. The twelve materialised views then reassemble these normalised facts into query-ready denormalisations, each answering a specific analytical question by joining the relevant tables and presenting the result as a single flat table. This separation of concerns — normalised storage for correctness, denormalised views for usability — is the defining architectural pattern of the schema.