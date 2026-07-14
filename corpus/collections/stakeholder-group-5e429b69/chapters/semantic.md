## Ontology-Grounded Relational Modelling in Higher Education IT Governance

The domain under examination concerns the governance of information technology within higher education institutions, where reform initiatives are decomposed into sub-projects, each governed by structured IT processes that respond to stakeholder needs. The ontology behind this domain distinguishes six core entity types—`StakeholderGroup`, `StakeholderNeed`, `ITGovernanceProcess`, `HigherEducationInstitution`, `ReformInitiative`, and `ITSubProject`—and a set of many-to-many association classes that materialise as junction tables. The relational schema is a normalised third-normal-form design in which every entity type becomes a base table, every cardinality-bounded relationship becomes a foreign key column, and every many-to-many relationship becomes a junction table with two foreign keys. Views then re-join these tables to reconstruct domain facts for reporting.

**Table `StakeholderGroup`**

| groupId | identifier | groupName | description | priorityLevel | influenceScore |
|---|---|---|---|---|---|
| 1000 | IDE-2086 | Julian Brown | Extended Survey | 22 | 20.45 |
| 1001 | IDE-2091 | Devin Wise | Pilot Corridor A | 25 | 24.90 |
| 1002 | IDE-2096 | Terry Pratchett | Baseline Series | 28 | 29.35 |
| 1003 | IDE-2101 | Joshua Harris | Distributed Assessment | 31 | 33.80 |

The `StakeholderGroup` table captures the people and organisations that exert influence over IT governance decisions. Its primary key `groupId` is a surrogate integer (values 1000–1003 in the sample), while the business identifier `identifier` carries a UUID-like prefix such as `IDE-2086`. The column `groupName` stores a human-readable label—`Julian Brown`, `Devin Wise`, `Terry Pratchett`, `Joshua Harris`—and `description` provides contextual detail like `Extended Survey` or `Pilot Corridor A`. Two numeric attributes, `priorityLevel` (22, 25, 28, 31) and `influenceScore` (20.45, 24.90, 29.35, 33.80), quantify the group's standing. These columns are all atomic and single-valued, so no denormalisation is needed.

**Table `StakeholderNeed`**

| id | needId | needDescription | urgencyLevel | satisfactionStatus | lastAssessedDate | processId |
|---|---|---|---|---|---|---|
| 1000 | 10966213 | Baseline Series D | low | unmet | 2022-05-01T16:48:00 | 1 |
| 1001 | 619 | Distributed Assessment | medium | partially_met | 2023-10-12T23:05:00 | 2 |
| 1002 | 92841674-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Survey | high | fully_met | 2024-03-23T06:22:00 | 3 |
| 1003 | 15426389 | Primary Corridor A | critical | unmet | 2025-08-07T13:39:00 | 4 |

`StakeholderNeed` records the specific requirements that stakeholders express. Its surrogate key `id` runs 1000–1003, and the business identifier `needId` carries a mix of short integers (`619`), long integers (`10966213`), and UUIDs (`92841674-9bad-11eb-a8a2-19ed5c03f8d3`). The text column `needDescription` holds values such as `Baseline Series D` and `Adaptive Survey`. The ordinal column `urgencyLevel` is constrained to the domain `low | medium | high | critical`, while `satisfactionStatus` takes `unmet | partially_met | fully_met`. The timestamp column `lastAssessedDate` records the most recent review, e.g. `2022-05-01T16:48:00`. Crucially, the foreign key `processId` links each need to an `ITGovernanceProcess`, establishing a cardinality-bounded one-to-many relationship: one process governs many needs.

**Table `ITGovernanceProcess`**

| id | processId | processName | framework | maturityLevel | lastAuditDate | complianceStatus | institutionId |
|---|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_art15 | Distributed Review | extended-framewor-75 | 22 | 2023-10-23 | non_compliant | 1 |
| 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Adaptive Initiative D | integrated-framewor-76 | 32 | 2024-03-07 | partially_compliant | 2 |
| 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Primary Model | seasonal-framewor-77 | 42 | 2025-08-18 | compliant | 3 |
| 4 | 1205-0002-XL | Composite Cluster | regional-framewor-78 | 52 | 2022-01-02 | non_compliant | 4 |

The `ITGovernanceProcess` table is the central process entity. Its surrogate key `id` (1–4) is distinct from the business identifier `processId`, which carries values like `template_ivacode_pagata_art15` and `27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3`. The column `processName` stores names such as `Distributed Review` and `Adaptive Initiative D`. The `framework` column encodes the governance framework variant (`extended-framewor-75`, `integrated-framewor-76`, `seasonal-framewor-77`, `regional-framewor-78`), while `maturityLevel` is a numeric score (22, 32, 42, 52). The date column `lastAuditDate` and the categorical column `complianceStatus` (`non_compliant | partially_compliant | compliant`) provide audit metadata. The foreign key `institutionId` binds each process to a `HigherEducationInstitution`, forming another one-to-many relationship.

**Table `HigherEducationInstitution`**

| institutionId | institutionName | locationCity | establishmentYear | fundingSource | governanceStatus |
|---|---|---|---|---|---|
| 1 | Extended Corridor | seasonal-location-23 | 26 | baseline-funding-73 | low |
| 2 | Pilot Series A | regional-location-24 | 31 | pilot-funding-74 | moderate |
| 3 | Baseline Assessment | legacy-location-25 | 36 | extended-funding-75 | high |
| 4 | Distributed Survey | compact-location-26 | 41 | integrated-funding-76 | low |

`HigherEducationInstitution` is the organisational anchor. Its surrogate key `institutionId` (1–4) maps to the business name `institutionName` (`Extended Corridor`, `Pilot Series A`, `Baseline Assessment`, `Distributed Survey`). The `locationCity` column carries synthetic location codes such as `seasonal-location-23`, and `establishmentYear` is a numeric year offset (26, 31, 36, 41). The `fundingSource` column stores codes like `baseline-funding-73`, and `governanceStatus` is categorical (`low | moderate | high`). This table has no incoming foreign keys from other base tables; it is a root entity in the hierarchy.

**Table `ReformInitiative`**

| id | initiativeId | initiativeName | startDate | endDate | budgetAmount | fundingAgency | completionStatus | projectId | createdAt |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | compta | Baseline Corridor D | 2022-09-05 | 2022-09-01 | 43.48 | Alaska Air Group Inc | planned | 1 | 2025-01-01 00:14:00 |
| 1001 | f209107c-8fcd-11eb-924d-9cd76263cbd0 | Distributed Series | 2023-02-16 | 2023-02-12 | 37.54 | General Foods | ongoing | 2 | 2025-02-06 03:14:00 |
| 1002 | 8928495 | Adaptive Assessment | 2024-07-27 | 2024-07-23 | 35.57 | Oscar Health Inc. | completed | 3 | 2025-03-11 06:14:00 |
| 1003 | 392495 | Primary Survey A | 2025-12-11 | 2025-12-07 | 19.95 | Mastercard International | cancelled | 4 | 2025-04-16 09:14:00 |

`ReformInitiative` captures the top-level reform programmes. Its surrogate key `id` (1000–1003) is distinct from the business identifier `initiativeId`, which carries short codes (`compta`) and UUIDs. The `initiativeName` column stores values like `Baseline Corridor D` and `Distributed Series`. The date range is captured by `startDate` and `endDate` (e.g. `2022-09-05` to `2022-09-01`), and `budgetAmount` is a decimal (43.48, 37.54, 35.57, 19.95). The `fundingAgency` column names the sponsoring body (`Alaska Air Group Inc`, `General Foods`, `Oscar Health Inc.`, `Mastercard International`). The categorical column `completionStatus` takes `planned | ongoing | completed | cancelled`, and the foreign key `projectId` links to another entity (not shown as a base table here). The initiative entity is the parent of `ITSubProject` via a one-to-many relationship.

**Table `ITSubProject`**

| id | subProjectId | subProjectName | budgetAllocation | implementationPhase | technologyStack | successMetric | initiativeId | processId |
|---|---|---|---|---|---|---|---|---|
| 1 | 1450665 | Pilot Series | 446.22 | 39 | adaptive-technolo-29 | regional-success-18 | 1000 | 1 |
| 2 | 10449523 | Baseline Assessment | 763.46 | 48 | distributed-technolo-30 | legacy-success-19 | 1001 | 2 |
| 3 | 3158142 | Distributed Survey A | 12.34 | 57 | baseline-technolo-31 | compact-success-20 | 1002 | 3 |
| 4 | 974946 | Adaptive Corridor | 1,737 | 66 | pilot-technolo-32 | composite-success-21 | 1003 | 4 |

`ITSubProject` is the child of `ReformInitiative`. Its surrogate key `id` (1–4) maps to the business identifier `subProjectId` (`1450665`, `10449523`, `3158142`, `974946`) and the name `subProjectName` (`Pilot Series`, `Baseline Assessment`, `Distributed Survey A`, `Adaptive Corridor`). The columns `budgetAllocation` (446.22, 763.46, 12.34, 1,737), `implementationPhase` (39, 48, 57, 66), `technologyStack` (`adaptive-technolo-29`, `distributed-technolo-30`, `baseline-technolo-31`, `pilot-technolo-32`), and `successMetric` (`regional-success-18`, `legacy-success-19`, `compact-success-20`, `composite-success-21`) are all atomic attributes. The foreign key `initiativeId` binds each sub-project to its parent `ReformInitiative`, and the foreign key `processId` binds it to an `ITGovernanceProcess`, making `ITSubProject` a hub that connects reform initiatives to governance processes.

The many-to-many relationships in the domain are modelled as explicit junction tables, each carrying two foreign keys and no additional attributes beyond the composite key.

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

This junction table links `StakeholderGroup` to `StakeholderNeed`. Its composite primary key consists of the foreign keys `groupId` (referencing `StakeholderGroup.groupId`) and `needId` (referencing `StakeholderNeed.id`). Each row asserts that a particular stakeholder group has a particular need.

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

This is the symmetric counterpart to the previous junction table, linking `StakeholderNeed` back to `StakeholderGroup`. Its composite key comprises `needId` and `groupId`, referencing the same two base tables. The presence of both directions in the schema reflects the ontology's bidirectional association, even though semantically they represent the same relationship.

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

This junction table connects `ITGovernanceProcess` to `StakeholderNeed`. Its composite key is formed by `processId` (referencing `ITGovernanceProcess.id`) and `needId` (referencing `StakeholderNeed.id`), asserting that a governance process addresses a specific need.

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

This junction table links `HigherEducationInstitution` to `ITGovernanceProcess`. Its composite key consists of `institutionId` (referencing `HigherEducationInstitution.institutionId`) and `processId` (referencing `ITGovernanceProcess.id`), capturing the assignment of governance processes to institutions.

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

This junction table connects `HigherEducationInstitution` to `StakeholderGroup`. Its composite key is formed by `institutionId` and `groupId`, asserting that a stakeholder group operates within a particular institution.

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

This junction table links `ReformInitiative` to `HigherEducationInstitution`. Its composite key comprises `initiativeId` (referencing `ReformInitiative.id`) and `institutionId` (referencing `HigherEducationInstitution.institutionId`), capturing which institutions participate in which reform initiatives.

The views in the schema are materialised joins that reconstruct domain facts from the normalised tables. Each view answers a specific analytical question by joining two or more base tables.

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

This view joins `StakeholderGroup` with `StakeholderGroupStakeholderNeed` and `StakeholderNeed` to produce a flat record per group–need pairing. It answers the question: "Which stakeholder groups are associated with which needs, and what are the details of those needs?" A sample row would show `groupId = 1000`, `groupName = Julian Brown`, `needId = 1000`, and `needDescription = Baseline Series D`, making it straightforward to audit which groups own which needs.

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

This is the symmetric counterpart, joining `StakeholderNeed` with `StakeholderNeedStakeholderGroup` and `StakeholderGroup`. It answers: "For each need, which stakeholder groups are responsible?" A row with `needId = 1001`, `needDescription = Distributed Assessment`, and `groupName = Devin Wise` demonstrates the reverse perspective on the same association.

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

This view joins `StakeholderNeed` with `ITGovernanceProcessStakeholderNeed` and `ITGovernanceProcess` to answer: "Which governance processes address which needs, and what is the compliance posture of those processes?" A row showing `needDescription = Adaptive Survey` linked to `processName = Primary Model` with `complianceStatus = compliant` illustrates how the view surfaces the governance coverage of individual needs.

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

This view joins `ITGovernanceProcess` with `ITGovernanceProcessStakeholderNeed` and `StakeholderNeed` to answer: "For each governance process, which needs does it address?" A row with `processName = Distributed Review`, `complianceStatus = non_compliant`, and `needDescription = Baseline Series D` (urgency `low`) reveals the inverse mapping from process to need, useful for identifying under-served needs within a process.

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

This view joins `ITGovernanceProcess` with `HigherEducationInstitutionITGovernanceProcess` and `HigherEducationInstitution` to answer: "Which institutions host which governance processes, and what is the maturity of those processes?" A row showing `institutionName = Extended Corridor`, `processName = Distributed Review`, and `maturityLevel = 22` demonstrates how the view surfaces the institutional deployment of governance processes.

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

This is the symmetric counterpart, joining `HigherEducationInstitution` with `HigherEducationInstitutionITGovernanceProcess` and `ITGovernanceProcess`. It answers: "For each institution, which governance processes are in place?" A row with `institutionName = Pilot Series A`, `governanceStatus = moderate`, and `processName = Adaptive Initiative D` provides the institutional perspective on governance coverage.

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

This view joins `HigherEducationInstitution` with `HigherEducationInstitutionStakeholderGroup` and `StakeholderGroup` to answer: "Which stakeholder groups operate within each institution?" A row showing `institutionName = Baseline Assessment` with `governanceStatus = high` alongside `groupName = Terry Pratchett` and `influenceScore = 29.35` illustrates the institutional–stakeholder mapping.

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

This view joins `ReformInitiative` with `ReformInitiativeHigherEducationInstitution` and `HigherEducationInstitution` to answer: "Which institutions participate in which reform initiatives, and what is the completion status of those initiatives?" A row with `initiativeName = Baseline Corridor D`, `completionStatus = planned`, `budgetAmount = 43.48`, and `institutionName = Extended Corridor` demonstrates how the view surfaces the institutional footprint of reform programmes.

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

This view joins `ReformInitiative` with `ITSubProject` to answer: "Which sub-projects belong to which reform initiatives?" A row showing `initiativeName = Baseline Corridor D` alongside `subProjectName = Pilot Series` with `budgetAllocation = 446.22` and `implementationPhase = 39` illustrates the initiative-to-sub-project decomposition.

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

This is the symmetric counterpart, joining `ITSubProject` with `ReformInitiative` to answer: "For each sub-project, which reform initiative does it belong to?" A row with `subProjectName = Baseline Assessment`, `technologyStack = distributed-technolo-30`, and `initiativeName = Distributed Series` provides the sub-project perspective on initiative membership.

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

This view joins `ITSubProject` with `ITGovernanceProcess` on the shared `processId` column to answer: "Which governance process governs which sub-project?" A row showing `subProjectName = Distributed Survey A`, `technologyStack = baseline-technolo-31`, and `processName = Primary Model` with `complianceStatus = compliant` demonstrates how the view surfaces the governance oversight of individual sub-projects.

The relational schema presented here is a direct materialisation of an ontology in which entity types become tables, attributes become columns, and relationships become foreign keys or junction tables. The six base tables capture the core domain concepts with atomic, single-valued attributes. The six junction tables capture the many-to-many associations that the ontology expresses as association classes. The twelve views re-join these normalised tables to produce flat, report-ready records that answer specific analytical questions about stakeholder–need coverage, governance process deployment, institutional participation, and reform initiative decomposition. Every view name encodes its join semantics: the prefix table is the driving entity, and the suffix describes the related entity or detail being surfaced. This design ensures that the database schema is both a faithful representation of the domain ontology and a practical foundation for querying and reporting.