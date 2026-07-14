## Governing Technology Across the Higher Education Enterprise

Higher education institutions operate as complex ecosystems where technology decisions ripple across academic programs, administrative functions, and student services. At the center of this complexity sits a structured governance framework that connects stakeholder groups with their operational needs, maps those needs to formal governance processes, and anchors everything within the institutional context of reform initiatives and sub-projects. The records captured in this domain describe how universities and colleges organize their technology oversight, track the satisfaction of stakeholder requirements, and execute reform programs under defined budgets and timelines.

**Table `StakeholderGroup`**

| groupId | identifier | groupName | description | priorityLevel | influenceScore |
|---|---|---|---|---|---|
| 1000 | IDE-2086 | Julian Brown | Extended Survey | 22 | 20.45 |
| 1001 | IDE-2091 | Devin Wise | Pilot Corridor A | 25 | 24.90 |
| 1002 | IDE-2096 | Terry Pratchett | Baseline Series | 28 | 29.35 |
| 1003 | IDE-2101 | Joshua Harris | Distributed Assessment | 31 | 33.80 |

Stakeholder groups form the human layer of the governance architecture. Each group carries a unique identifier such as `IDE-2086` or `IDE-2091`, a descriptive name like Julian Brown or Devin Wise, and a narrative description that contextualizes its scope—Extended Survey, Pilot Corridor A, Baseline Series, or Distributed Assessment. The `priorityLevel` column assigns a numeric ranking, with values ranging from 22 to 31 in the current dataset, while `influenceScore` quantifies the group's sway over governance decisions, spanning from 20.45 to 33.80. These two metrics together allow administrators to triage which stakeholder voices require the most attention during planning cycles.

**Table `StakeholderNeed`**

| id | needId | needDescription | urgencyLevel | satisfactionStatus | lastAssessedDate | processId |
|---|---|---|---|---|---|---|
| 1000 | 10966213 | Baseline Series D | low | unmet | 2022-05-01T16:48:00 | 1 |
| 1001 | 619 | Distributed Assessment | medium | partially_met | 2023-10-12T23:05:00 | 2 |
| 1002 | 92841674-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Survey | high | fully_met | 2024-03-23T06:22:00 | 3 |
| 1003 | 15426389 | Primary Corridor A | critical | unmet | 2025-08-07T13:39:00 | 4 |

Stakeholder needs represent the specific requirements that these groups bring to the governance table. Each need record carries a long-form identifier—`10966213`, `619`, `92841674-9bad-11eb-a8a2-19ed5c03f8d3`, or `15426389`—alongside a description such as Baseline Series D, Distributed Assessment, Adaptive Survey, or Primary Corridor A. The `urgencyLevel` column classifies each need as low, medium, high, or critical, providing a clear signal for resource allocation. The `satisfactionStatus` column tracks whether the need has been fully met, partially met, or remains unmet, while `lastAssessedDate` records the most recent evaluation timestamp. Each need is also linked to a `processId` that ties it to a specific governance process, creating the first bridge between human requirements and institutional procedures.

**Table `ITGovernanceProcess`**

| id | processId | processName | framework | maturityLevel | lastAuditDate | complianceStatus | institutionId |
|---|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_art15 | Distributed Review | extended-framewor-75 | 22 | 2023-10-23 | non_compliant | 1 |
| 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Initiative D | integrated-framewor-76 | 32 | 2024-03-07 | partially_compliant | 2 |
| 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Model | seasonal-framewor-77 | 42 | 2025-08-18 | compliant | 3 |
| 4 | 1205-0002-XL | Composite Cluster | regional-framewor-78 | 52 | 2022-01-02 | non_compliant | 4 |

IT governance processes are the formal mechanisms through which institutions manage technology decisions. Each process has a `processId` that serves as a stable reference—for example, `template_ivacode_pagata_art15` for Distributed Review or `27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3` for Adaptive Initiative D. The `processName` column provides a human-readable label, while the `framework` column identifies the governing methodology, such as extended-framewor-75, integrated-framewor-76, seasonal-framewor-77, or regional-framewor-78. The `maturityLevel` assigns a numeric score to the process's development stage, ranging from 22 to 52 in the current data. Compliance status—non_compliant, partially_compliant, or compliant—offers a snapshot of regulatory adherence, and `lastAuditDate` records when the process was last reviewed. The `institutionId` column anchors each process to a specific higher education institution.

**Table `HigherEducationInstitution`**

| institutionId | institutionName | locationCity | establishmentYear | fundingSource | governanceStatus |
|---|---|---|---|---|---|
| 1 | Extended Corridor | seasonal-location-23 | 26 | baseline-funding-73 | low |
| 2 | Pilot Series A | regional-location-24 | 31 | pilot-funding-74 | moderate |
| 3 | Baseline Assessment | legacy-location-25 | 36 | extended-funding-75 | high |
| 4 | Distributed Survey | compact-location-26 | 41 | integrated-funding-76 | low |

Higher education institutions provide the organizational container for all governance activity. The dataset includes institutions such as Extended Corridor, Pilot Series A, Baseline Assessment, and Distributed Survey, each located in a distinct region identified by codes like seasonal-location-23 or regional-location-24. The `establishmentYear` column records how long each institution has been operating, with values spanning from 26 to 41 years in the current records. Funding sources—baseline-funding-73, pilot-funding-74, extended-funding-75, integrated-funding-76—indicate the financial model supporting each institution, while `governanceStatus` (low, moderate, or high) reflects the maturity of its oversight structures.

**Table `ReformInitiative`**

| id | initiativeId | initiativeName | startDate | endDate | budgetAmount | fundingAgency | completionStatus | projectId | createdAt |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | compta | Baseline Corridor D | 2022-09-05 | 2022-09-01 | 43.48 | Alaska Air Group Inc | planned | 1 | 2025-01-01 00:14:00 |
| 1001 | f209107c-8fcd-11eb-924d-9cd76263cbd0 | Distributed Series | 2023-02-16 | 2023-02-12 | 37.54 | General Foods | ongoing | 2 | 2025-02-06 03:14:00 |
| 1002 | 8928495 | Adaptive Assessment | 2024-07-27 | 2024-07-23 | 35.57 | Oscar Health Inc. | completed | 3 | 2025-03-11 06:14:00 |
| 1003 | 392495 | Primary Survey A | 2025-12-11 | 2025-12-07 | 19.95 | Mastercard International | cancelled | 4 | 2025-04-16 09:14:00 |

Reform initiatives represent the strategic programs through which institutions drive change. Each initiative carries a unique identifier such as `compta` or `f209107c-8fcd-11eb-924d-9cd76263cbd0`, a name like Baseline Corridor D or Distributed Series, and a defined date range from `startDate` to `endDate`. Budget amounts vary significantly, from 19.95 for Primary Survey A to 43.48 for Baseline Corridor D, with funding agencies including Alaska Air Group Inc, General Foods, Oscar Health Inc., and Mastercard International. The `completionStatus` column tracks whether an initiative is planned, ongoing, completed, or cancelled, providing a real-time view of the reform portfolio. Each initiative is also associated with a `projectId` that links it to its parent program.

**Table `ITSubProject`**

| id | subProjectId | subProjectName | budgetAllocation | implementationPhase | technologyStack | successMetric | initiativeId | processId |
|---|---|---|---|---|---|---|---|---|
| 1 | 1450665 | Pilot Series | 446.22 | 39 | adaptive-technolo-29 | regional-success-18 | 1000 | 1 |
| 2 | 10449523 | Baseline Assessment | 763.46 | 48 | distributed-technolo-30 | legacy-success-19 | 1001 | 2 |
| 3 | 3158142 | Distributed Survey A | 12.34 | 57 | baseline-technolo-31 | compact-success-20 | 1002 | 3 |
| 4 | 974946 | Adaptive Corridor | 1,737 | 66 | pilot-technolo-32 | composite-success-21 | 1003 | 4 |

IT sub-projects are the tactical execution units that operationalize reform initiatives. Each sub-project has a distinct identifier—`1450665`, `10449523`, `3158142`, or `974946`—and a name such as Pilot Series, Baseline Assessment, Distributed Survey A, or Adaptive Corridor. Budget allocations range from 12.34 for Distributed Survey A to 1,737 for Adaptive Corridor, reflecting the varying scale of implementation efforts. The `implementationPhase` column assigns a numeric phase indicator, while `technologyStack` identifies the technical approach, including adaptive-technolo-29, distributed-technolo-30, baseline-technolo-31, and pilot-technolo-32. Success metrics—regional-success-18, legacy-success-19, compact-success-20, composite-success-21—define how progress is measured. Each sub-project is linked to both an `initiativeId` and a `processId`, connecting it to its strategic parent and its governing process.

The junction tables establish the many-to-many relationships that make this domain flexible enough to model real-world complexity. `StakeholderGroupStakeholderNeed` and `StakeholderNeedStakeholderGroup` both capture the associations between stakeholder groups and their needs, allowing any group to claim multiple needs and any need to be shared across groups. `ITGovernanceProcessStakeholderNeed` links governance processes to the needs they are designed to address. `HigherEducationInstitutionITGovernanceProcess` maps institutions to the governance processes they operate. `HigherEducationInstitutionStakeholderGroup` connects institutions to the stakeholder groups active within their jurisdiction. `ReformInitiativeHigherEducationInstitution` ties reform initiatives to the institutions that sponsor or host them.

**View `v_stakeholder_group_stakeholder_need_detail`**

```sql
CREATE VIEW v_stakeholder_group_stakeholder_need_detail AS
SELECT a.groupId, a.identifier, a.groupName, b.id AS need_id, b.needId AS need_needId, b.needDescription AS need_needDescription
FROM StakeholderGroup a
  JOIN StakeholderGroupStakeholderNeed j ON j.groupId = a.groupId
  JOIN StakeholderNeed b ON b.id = j.needId;
```

| groupId | identifier | groupName | need_id | need_needId | need_needDescription |
|---|---|---|---|---|---|
| 1000 | IDE-2086 | Julian Brown | 1000 | 10966213 | Baseline Series D |
| 1000 | IDE-2086 | Julian Brown | 1001 | 619 | Distributed Assessment |
| 1001 | IDE-2091 | Devin Wise | 1001 | 619 | Distributed Assessment |
| 1001 | IDE-2091 | Devin Wise | 1002 | 92841674-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Survey |
| 1002 | IDE-2096 | Terry Pratchett | 1002 | 92841674-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Survey |
| 1002 | IDE-2096 | Terry Pratchett | 1003 | 15426389 | Primary Corridor A |
| 1003 | IDE-2101 | Joshua Harris | 1003 | 15426389 | Primary Corridor A |
| 1003 | IDE-2101 | Joshua Harris | 1000 | 10966213 | Baseline Series D |

This view joins stakeholder groups with their associated needs, answering the question of which groups are responsible for which requirements. A row from this view might show the stakeholder group Julian Brown (identifier `IDE-2086`, priority level 22, influence score 20.45) linked to the need Baseline Series D (urgency level low, satisfaction status unmet, last assessed on 2022-05-01). Another row could pair Devin Wise (identifier `IDE-2091`, priority level 25, influence score 24.90) with Distributed Assessment (urgency level medium, satisfaction status partially_met, last assessed on 2023-10-12). This join enables administrators to see at a glance whether high-influence groups have their critical needs addressed or whether gaps exist that require intervention.

**View `v_stakeholder_need_stakeholder_group_detail`**

```sql
CREATE VIEW v_stakeholder_need_stakeholder_group_detail AS
SELECT a.id, a.needId, a.needDescription, b.groupId AS group_groupId, b.identifier AS group_identifier, b.groupName AS group_groupName
FROM StakeholderNeed a
  JOIN StakeholderNeedStakeholderGroup j ON j.needId = a.id
  JOIN StakeholderGroup b ON b.groupId = j.groupId;
```

| id | needId | needDescription | group_groupId | group_identifier | group_groupName |
|---|---|---|---|---|---|
| 1000 | 10966213 | Baseline Series D | 1000 | IDE-2086 | Julian Brown |
| 1000 | 10966213 | Baseline Series D | 1001 | IDE-2091 | Devin Wise |
| 1001 | 619 | Distributed Assessment | 1001 | IDE-2091 | Devin Wise |
| 1001 | 619 | Distributed Assessment | 1002 | IDE-2096 | Terry Pratchett |
| 1002 | 92841674-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Survey | 1002 | IDE-2096 | Terry Pratchett |
| 1002 | 92841674-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Survey | 1003 | IDE-2101 | Joshua Harris |
| 1003 | 15426389 | Primary Corridor A | 1003 | IDE-2101 | Joshua Harris |
| 1003 | 15426389 | Primary Corridor A | 1000 | IDE-2086 | Julian Brown |

The inverse perspective of the previous view, this join presents needs as the primary entity with their associated stakeholder groups attached. A representative row might display the need Adaptive Survey (identifier `92841674-9bad-11eb-a8a2-19ed5c03f8d3`, urgency level high, satisfaction status fully_met) alongside the stakeholder group Terry Pratchett (identifier `IDE-2096`, priority level 28, influence score 29.35). Another row could show Primary Corridor A (identifier `15426389`, urgency level critical, satisfaction status unmet) linked to Joshua Harris (identifier `IDE-2101`, priority level 31, influence score 33.80). This orientation is particularly useful for needs managers who must prioritize which requirements to address first based on the influence of the groups that claim them.

**View `v_stakeholder_need_i_t_governance_process`**

```sql
CREATE VIEW v_stakeholder_need_i_t_governance_process AS
SELECT a.id, a.needId, a.needDescription, a.urgencyLevel, b.id AS process_id, b.processId AS process_processId, b.processName AS process_processName
FROM StakeholderNeed a JOIN ITGovernanceProcess b ON a.processId = b.id;
```

| id | needId | needDescription | urgencyLevel | process_id | process_processId | process_processName |
|---|---|---|---|---|---|---|
| 1000 | 10966213 | Baseline Series D | low | 1 | template_ivacode_pagata_art15 | Distributed Review |
| 1001 | 619 | Distributed Assessment | medium | 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Initiative D |
| 1002 | 92841674-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Survey | high | 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Model |
| 1003 | 15426389 | Primary Corridor A | critical | 4 | 1205-0002-XL | Composite Cluster |

This view connects stakeholder needs to the governance processes designed to satisfy them. A row might pair the need Baseline Series D (urgency level low, satisfaction status unmet) with the governance process Distributed Review (framework extended-framewor-75, maturity level 22, compliance status non_compliant). Another row could link the need Adaptive Survey (urgency level high, satisfaction status fully_met) to the process Primary Model (framework seasonal-framewor-77, maturity level 42, compliance status compliant). The relationship between need satisfaction and process maturity is evident here: needs associated with higher-maturity, compliant processes tend toward full satisfaction, while those tied to lower-maturity, non-compliant processes remain unmet.

**View `v_i_t_governance_process_stakeholder_need_detail`**

```sql
CREATE VIEW v_i_t_governance_process_stakeholder_need_detail AS
SELECT a.id, a.processId, a.processName, b.id AS need_id, b.needId AS need_needId, b.needDescription AS need_needDescription
FROM ITGovernanceProcess a
  JOIN ITGovernanceProcessStakeholderNeed j ON j.processId = a.id
  JOIN StakeholderNeed b ON b.id = j.needId;
```

| id | processId | processName | need_id | need_needId | need_needDescription |
|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_art15 | Distributed Review | 1000 | 10966213 | Baseline Series D |
| 1 | template_ivacode_pagata_art15 | Distributed Review | 1001 | 619 | Distributed Assessment |
| 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Initiative D | 1001 | 619 | Distributed Assessment |
| 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Initiative D | 1002 | 92841674-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Survey |
| 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Model | 1002 | 92841674-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Survey |
| 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Model | 1003 | 15426389 | Primary Corridor A |
| 4 | 1205-0002-XL | Composite Cluster | 1003 | 15426389 | Primary Corridor A |
| 4 | 1205-0002-XL | Composite Cluster | 1000 | 10966213 | Baseline Series D |

This view presents governance processes as the primary entity with their associated needs joined in. A row might show the governance process Adaptive Initiative D (framework integrated-framewor-76, maturity level 32, compliance status partially_compliant) linked to the need Distributed Assessment (urgency level medium, satisfaction status partially_met). Another row could display the process Composite Cluster (framework regional-framewor-78, maturity level 52, compliance status non_compliant) paired with the need Primary Corridor A (urgency level critical, satisfaction status unmet). This perspective helps process owners understand the demand placed on their governance mechanisms and whether the current maturity and compliance posture is sufficient to meet stakeholder expectations.

**View `v_i_t_governance_process_higher_education_institution`**

```sql
CREATE VIEW v_i_t_governance_process_higher_education_institution AS
SELECT a.id, a.processId, a.processName, a.framework, b.institutionId AS institution_institutionId, b.institutionName AS institution_institutionName, b.locationCity AS institution_locationCity
FROM ITGovernanceProcess a JOIN HigherEducationInstitution b ON a.institutionId = b.institutionId;
```

| id | processId | processName | framework | institution_institutionId | institution_institutionName | institution_locationCity |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_art15 | Distributed Review | extended-framewor-75 | 1 | Extended Corridor | seasonal-location-23 |
| 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Initiative D | integrated-framewor-76 | 2 | Pilot Series A | regional-location-24 |
| 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Model | seasonal-framewor-77 | 3 | Baseline Assessment | legacy-location-25 |
| 4 | 1205-0002-XL | Composite Cluster | regional-framewor-78 | 4 | Distributed Survey | compact-location-26 |

This join maps governance processes to the institutions that operate them. A row might show the governance process Distributed Review (framework extended-framewor-75, maturity level 22, compliance status non_compliant) associated with the institution Extended Corridor (location seasonal-location-23, governance status low). Another row could link the process Primary Model (framework seasonal-framewor-77, maturity level 42, compliance status compliant) to the institution Baseline Assessment (location legacy-location-25, governance status high). The correlation between institutional governance status and process compliance is notable: institutions with high governance status tend to host compliant processes, while those with low governance status host non-compliant ones.

**View `v_higher_education_institution_i_t_governance_process_detail`**

```sql
CREATE VIEW v_higher_education_institution_i_t_governance_process_detail AS
SELECT a.institutionId, a.institutionName, a.locationCity, b.id AS process_id, b.processId AS process_processId, b.processName AS process_processName
FROM HigherEducationInstitution a
  JOIN HigherEducationInstitutionITGovernanceProcess j ON j.institutionId = a.institutionId
  JOIN ITGovernanceProcess b ON b.id = j.processId;
```

| institutionId | institutionName | locationCity | process_id | process_processId | process_processName |
|---|---|---|---|---|---|
| 1 | Extended Corridor | seasonal-location-23 | 1 | template_ivacode_pagata_art15 | Distributed Review |
| 1 | Extended Corridor | seasonal-location-23 | 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Initiative D |
| 2 | Pilot Series A | regional-location-24 | 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Initiative D |
| 2 | Pilot Series A | regional-location-24 | 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Model |
| 3 | Baseline Assessment | legacy-location-25 | 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Model |
| 3 | Baseline Assessment | legacy-location-25 | 4 | 1205-0002-XL | Composite Cluster |
| 4 | Distributed Survey | compact-location-26 | 4 | 1205-0002-XL | Composite Cluster |
| 4 | Distributed Survey | compact-location-26 | 1 | template_ivacode_pagata_art15 | Distributed Review |

Presenting institutions as the primary entity with their governance processes joined, this view answers which processes each institution manages. A row might display the institution Pilot Series A (location regional-location-24, establishment year 31, funding source pilot-funding-74, governance status moderate) alongside the governance process Adaptive Initiative D (framework integrated-framewor-76, maturity level 32, compliance status partially_compliant). Another row could show Distributed Survey (location compact-location-26, establishment year 41, funding source integrated-funding-76, governance status low) paired with the process Composite Cluster (framework regional-framewor-78, maturity level 52, compliance status non_compliant). This view is essential for institutional leaders who need to assess the governance posture of their technology operations.

**View `v_higher_education_institution_stakeholder_group_detail`**

```sql
CREATE VIEW v_higher_education_institution_stakeholder_group_detail AS
SELECT a.institutionId, a.institutionName, a.locationCity, b.groupId AS group_groupId, b.identifier AS group_identifier, b.groupName AS group_groupName
FROM HigherEducationInstitution a
  JOIN HigherEducationInstitutionStakeholderGroup j ON j.institutionId = a.institutionId
  JOIN StakeholderGroup b ON b.groupId = j.groupId;
```

| institutionId | institutionName | locationCity | group_groupId | group_identifier | group_groupName |
|---|---|---|---|---|---|
| 1 | Extended Corridor | seasonal-location-23 | 1000 | IDE-2086 | Julian Brown |
| 1 | Extended Corridor | seasonal-location-23 | 1001 | IDE-2091 | Devin Wise |
| 2 | Pilot Series A | regional-location-24 | 1001 | IDE-2091 | Devin Wise |
| 2 | Pilot Series A | regional-location-24 | 1002 | IDE-2096 | Terry Pratchett |
| 3 | Baseline Assessment | legacy-location-25 | 1002 | IDE-2096 | Terry Pratchett |
| 3 | Baseline Assessment | legacy-location-25 | 1003 | IDE-2101 | Joshua Harris |
| 4 | Distributed Survey | compact-location-26 | 1003 | IDE-2101 | Joshua Harris |
| 4 | Distributed Survey | compact-location-26 | 1000 | IDE-2086 | Julian Brown |

This view connects institutions to the stakeholder groups active within their boundaries. A row might show the institution Extended Corridor (location seasonal-location-23, governance status low) linked to the stakeholder group Julian Brown (identifier `IDE-2086`, priority level 22, influence score 20.45). Another row could pair Baseline Assessment (location legacy-location-25, governance status high) with the stakeholder group Terry Pratchett (identifier `IDE-2096`, priority level 28, influence score 29.35). This join helps institutional administrators understand which stakeholder voices they must engage and whether the groups' influence levels align with the institution's governance maturity.

**View `v_reform_initiative_higher_education_institution_detail`**

```sql
CREATE VIEW v_reform_initiative_higher_education_institution_detail AS
SELECT a.id, a.initiativeId, a.initiativeName, b.institutionId AS institution_institutionId, b.institutionName AS institution_institutionName, b.locationCity AS institution_locationCity
FROM ReformInitiative a
  JOIN ReformInitiativeHigherEducationInstitution j ON j.initiativeId = a.id
  JOIN HigherEducationInstitution b ON b.institutionId = j.institutionId;
```

| id | initiativeId | initiativeName | institution_institutionId | institution_institutionName | institution_locationCity |
|---|---|---|---|---|---|
| 1000 | compta | Baseline Corridor D | 1 | Extended Corridor | seasonal-location-23 |
| 1000 | compta | Baseline Corridor D | 2 | Pilot Series A | regional-location-24 |
| 1001 | f209107c-8fcd-11eb-924d-9cd76263cbd0 | Distributed Series | 2 | Pilot Series A | regional-location-24 |
| 1001 | f209107c-8fcd-11eb-924d-9cd76263cbd0 | Distributed Series | 3 | Baseline Assessment | legacy-location-25 |
| 1002 | 8928495 | Adaptive Assessment | 3 | Baseline Assessment | legacy-location-25 |
| 1002 | 8928495 | Adaptive Assessment | 4 | Distributed Survey | compact-location-26 |
| 1003 | 392495 | Primary Survey A | 4 | Distributed Survey | compact-location-26 |
| 1003 | 392495 | Primary Survey A | 1 | Extended Corridor | seasonal-location-23 |

This view links reform initiatives to the institutions that sponsor or host them. A row might display the initiative Baseline Corridor D (budget 43.48, funding agency Alaska Air Group Inc, completion status planned) associated with an institution. Another row could show the initiative Adaptive Assessment (budget 35.57, funding agency Oscar Health Inc., completion status completed) linked to a different institution. The completion status column provides a portfolio-level view: some initiatives remain planned, others are ongoing, some have reached completion, and a few have been cancelled. This view enables executives to track the progress of reform programs across the institutional landscape.

**View `v_reform_initiative_i_t_sub_project`**

```sql
CREATE VIEW v_reform_initiative_i_t_sub_project AS
SELECT a.id, a.initiativeId, a.initiativeName, a.startDate, b.id AS project_id, b.subProjectId AS project_subProjectId, b.subProjectName AS project_subProjectName
FROM ReformInitiative a JOIN ITSubProject b ON a.projectId = b.id;
```

| id | initiativeId | initiativeName | startDate | project_id | project_subProjectId | project_subProjectName |
|---|---|---|---|---|---|---|
| 1000 | compta | Baseline Corridor D | 2022-09-05 | 1 | 1450665 | Pilot Series |
| 1001 | f209107c-8fcd-11eb-924d-9cd76263cbd0 | Distributed Series | 2023-02-16 | 2 | 10449523 | Baseline Assessment |
| 1002 | 8928495 | Adaptive Assessment | 2024-07-27 | 3 | 3158142 | Distributed Survey A |
| 1003 | 392495 | Primary Survey A | 2025-12-11 | 4 | 974946 | Adaptive Corridor |

This join connects reform initiatives to their constituent IT sub-projects. A row might show the initiative Baseline Corridor D (budget 43.48, completion status planned) linked to the sub-project Pilot Series (budget allocation 446.22, implementation phase 39, technology stack adaptive-technolo-29, success metric regional-success-18). Another row could pair the initiative Distributed Series (budget 37.54, completion status ongoing) with the sub-project Baseline Assessment (budget allocation 763.46, implementation phase 48, technology stack distributed-technolo-30, success metric legacy-success-19). This view is critical for program managers who need to understand the breakdown of initiative budgets into sub-project allocations and track implementation progress at the tactical level.

**View `v_i_t_sub_project_reform_initiative`**

```sql
CREATE VIEW v_i_t_sub_project_reform_initiative AS
SELECT a.id, a.subProjectId, a.subProjectName, a.budgetAllocation, b.id AS initiative_id, b.initiativeId AS initiative_initiativeId, b.initiativeName AS initiative_initiativeName
FROM ITSubProject a JOIN ReformInitiative b ON a.initiativeId = b.id;
```

| id | subProjectId | subProjectName | budgetAllocation | initiative_id | initiative_initiativeId | initiative_initiativeName |
|---|---|---|---|---|---|---|
| 1 | 1450665 | Pilot Series | 446.22 | 1000 | compta | Baseline Corridor D |
| 2 | 10449523 | Baseline Assessment | 763.46 | 1001 | f209107c-8fcd-11eb-924d-9cd76263cbd0 | Distributed Series |
| 3 | 3158142 | Distributed Survey A | 12.34 | 1002 | 8928495 | Adaptive Assessment |
| 4 | 974946 | Adaptive Corridor | 1,737 | 1003 | 392495 | Primary Survey A |

The inverse perspective, this view presents sub-projects as the primary entity with their parent initiatives joined. A row might display the sub-project Distributed Survey A (budget allocation 12.34, implementation phase 57, technology stack baseline-technolo-31, success metric compact-success-20) linked to the initiative Adaptive Assessment (budget 35.57, completion status completed). Another row could show the sub-project Adaptive Corridor (budget allocation 1,737, implementation phase 66, technology stack pilot-technolo-32, success metric composite-success-21) paired with the initiative Primary Survey A (budget 19.95, completion status cancelled). This orientation is useful for project managers who need to understand how their sub-projects contribute to broader initiative goals and whether the parent initiative's status affects their own priorities.

**View `v_i_t_sub_project_i_t_governance_process`**

```sql
CREATE VIEW v_i_t_sub_project_i_t_governance_process AS
SELECT a.id, a.subProjectId, a.subProjectName, a.budgetAllocation, b.id AS process_id, b.processId AS process_processId, b.processName AS process_processName
FROM ITSubProject a JOIN ITGovernanceProcess b ON a.processId = b.id;
```

| id | subProjectId | subProjectName | budgetAllocation | process_id | process_processId | process_processName |
|---|---|---|---|---|---|---|
| 1 | 1450665 | Pilot Series | 446.22 | 1 | template_ivacode_pagata_art15 | Distributed Review |
| 2 | 10449523 | Baseline Assessment | 763.46 | 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Initiative D |
| 3 | 3158142 | Distributed Survey A | 12.34 | 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Model |
| 4 | 974946 | Adaptive Corridor | 1,737 | 4 | 1205-0002-XL | Composite Cluster |

This final view connects IT sub-projects to the governance processes that oversee them. A row might show the sub-project Pilot Series (budget allocation 446.22, implementation phase 39) governed by the process Distributed Review (framework extended-framewor-75, maturity level 22, compliance status non_compliant). Another row could link the sub-project Adaptive Corridor (budget allocation 1,737, implementation phase 66) to the process Composite Cluster (framework regional-framewor-78, maturity level 52, compliance status non_compliant). This join reveals whether sub-projects with larger budgets and later implementation phases are receiving adequate governance oversight, and whether non-compliant processes pose risks to the execution of high-value sub-projects.

The domain records collectively describe a governance ecosystem where stakeholder groups articulate needs, those needs are addressed through formal governance processes, processes are operated within institutions, and reform initiatives drive change through IT sub-projects. The junction tables ensure that relationships are flexible and many-to-many, reflecting the reality that stakeholders have multiple needs, institutions operate multiple processes, and initiatives contain multiple sub-projects. The views provide pre-joined perspectives that answer the most common analytical questions: which groups claim which needs, which processes serve which needs, which institutions host which processes, which initiatives contain which sub-projects, and how governance maturity correlates with need satisfaction. Together, these records form the operational backbone of technology governance in higher education, enabling administrators to track compliance, allocate resources, and measure the effectiveness of reform programs across a complex institutional landscape.

## Data appendix

**Table `StakeholderGroupStakeholderNeed`**

| groupId | needId |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

**Table `StakeholderNeedStakeholderGroup`**

| needId | groupId |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

**Table `ITGovernanceProcessStakeholderNeed`**

| processId | needId |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `HigherEducationInstitutionITGovernanceProcess`**

| institutionId | processId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `HigherEducationInstitutionStakeholderGroup`**

| institutionId | groupId |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `ReformInitiativeHigherEducationInstitution`**

| initiativeId | institutionId |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |
