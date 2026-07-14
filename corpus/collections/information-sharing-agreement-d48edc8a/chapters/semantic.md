The domain of information-sharing governance in a multi-agency technology ecosystem is captured through a normalized relational schema that mirrors the ontology of six core entity types: agreements, chief information officers, governance boards, interoperability standards, information environments, and mission services. These entities are linked by cardinality-bounded relationships that materialize as foreign keys and junction tables, and they are reassembled by twelve view definitions that answer specific analytical questions about the governance landscape. The schema enforces a clear separation between the *who* (people and boards), the *what* (agreements and standards), and the *where* (environments and services), while the junction tables capture many-to-many associations that cannot be expressed through simple foreign keys.

## Core Entity Tables

The six base tables form the backbone of the model. `InformationSharingAgreement` stores the legal and policy instruments that bind organizations together. Each row carries an `agreementId` (e.g., `1000`), an `issueDate` such as `2023-02-01`, an `agreementType` drawn from values like *Memorandum of Agreement*, *Joint Strategy*, or *Policy Directive*, a `status` column with values *Draft*, *Signed*, *Active*, and *Superseded*, a `scope` indicating the organizational reach (*DoD*, *DNI*, or *Joint DoD-DNI*), and a `boardId` foreign key pointing to the overseeing `GovernanceBoard`. The four sample rows illustrate the lifecycle of agreements: agreement `1000` is a Draft *Memorandum of Agreement* scoped to DoD under board `1`, while agreement `1002` is an *Active* *Policy Directive* with a *Joint DoD-DNI* scope under board `3`.

**Table `InformationSharingAgreement`**

| agreementId | issueDate | agreementType | status | scope | boardId |
|---|---|---|---|---|---|
| 1000 | 2023-02-01 | Memorandum of Agreement | Draft | DoD | 1 |
| 1001 | 2024-07-12 | Joint Strategy | Signed | DNI | 2 |
| 1002 | 2025-12-23 | Policy Directive | Active | Joint DoD-DNI | 3 |
| 1003 | 2022-05-07 | Memorandum of Agreement | Superseded | DoD | 4 |

`ChiefInformationOfficer` records the individuals (or, in some data entries, organizational placeholders) who serve as the technology leadership for an agreement. The `officerId` (e.g., `1000`) identifies the row, `fullName` holds the person's name (*Theodore Mcgrath*, *Norma Fisher*), `organization` names the sponsoring body (*Department of Defense*, *Director of National Intelligence*), `rankOrTitle` captures the seniority level (*Assistant Secretary of Defense*, *Maj. Gen.*), `appointmentDate` records when the appointment took effect, and two foreign keys—`boardId` and `agreementId`—tie the officer to both a governance board and a specific agreement. The data reveals some irregularities: officer `1001` has the placeholder name *Account Name* and officer `1002` lists *Saipan International Airport* as a person's name, suggesting data-entry artifacts or anonymized test records.

**Table `ChiefInformationOfficer`**

| officerId | fullName | organization | rankOrTitle | appointmentDate | boardId | agreementId |
|---|---|---|---|---|---|---|
| 1000 | Theodore Mcgrath | Department of Defense | Assistant Secretary of Defense | 2022-05-03 | 1 | 1000 |
| 1001 | Account Name | Director of National Intelligence | Associate Director of National Intelligence | 2023-10-14 | 2 | 1001 |
| 1002 | Saipan International Airport | Department of Defense | Maj. Gen. | 2024-03-25 | 3 | 1002 |
| 1003 | Norma Fisher | Director of National Intelligence | Assistant Secretary of Defense | 2025-08-09 | 4 | 1003 |

`GovernanceBoard` is the central coordinating entity. Its primary key `id` (values `1` through `4`) is distinct from the `boardId` column, which holds external identifiers such as `ChIJH2V4UYBt5kcR5doeFwuU7Ns` and `168553`. The `establishmentDate` (e.g., `2024-07-11`), `governanceScope` (e.g., *DoD CIO/DNI CIO Standards*, *Interoperable Secure Infrastructure*), `meetingFrequency` (*Monthly*, *Quarterly*, *As Needed*), and `decisionAuthority` (*Joint*, *DoD*, *DNI*) describe the board's mandate. A foreign key `environmentId` links the board to an `InformationEnvironment`.

**Table `GovernanceBoard`**

| id | boardId | establishmentDate | governanceScope | meetingFrequency | decisionAuthority | environmentId |
|---|---|---|---|---|---|---|
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | 2024-07-11 | DoD CIO/DNI CIO Standards | Monthly | Joint | 1000 |
| 2 | 168553 | 2025-12-22 | Interoperable Secure Infrastructure | Quarterly | DoD | 1001 |
| 3 | 5006454 | 2022-05-06 | Business Services | As Needed | DNI | 1002 |
| 4 | 1437585 | 2023-10-17 | DoD CIO/DNI CIO Standards | Monthly | Joint | 1003 |

`InteroperabilityStandard` captures the technical specifications that govern system integration. The `id` column (`1`–`4`) is the surrogate key, while `standardId` holds external identifiers like `7119764`. The `standardName` (e.g., *Compact Framework*, *Legacy Protocol*, *Regional Programme A*), `version` (e.g., *seasonal-version-71*), `technologyType` (values include *Web Services*, *Service-Oriented Architecture*, *Secure Infrastructure*, *Enterprise Architecture*), `complianceLevel` (*Mandatory*, *Recommended*, *Optional*), and `effectiveDate` define the standard's properties. Foreign keys `boardId` and `environmentId` associate the standard with a governance board and an information environment.

**Table `InteroperabilityStandard`**

| id | standardId | standardName | version | technologyType | complianceLevel | effectiveDate | boardId | environmentId |
|---|---|---|---|---|---|---|---|---|
| 1 | 7119764 | Compact Framework | seasonal-version-71 | Web Services | Mandatory | 2023-02-14 | 1 | 1000 |
| 2 | 9125617 | Legacy Protocol | regional-version-72 | Service-Oriented Architecture | Recommended | 2024-07-25 | 2 | 1001 |
| 3 | 338526 | Regional Programme A | legacy-version-73 | Secure Infrastructure | Optional | 2025-12-09 | 3 | 1002 |
| 4 | 3717623 | Seasonal Standard | compact-version-74 | Enterprise Architecture | Mandatory | 2022-05-20 | 4 | 1003 |

`InformationEnvironment` represents the IT infrastructure layer. Its `id` column (`1000`–`1003`) is the surrogate key, `environmentId` holds external identifiers like `726050`, `environmentName` names the environment (*DoD Net-Centric Services Environment*, *DNI Information Environment*), `architectureType` describes the deployment model (*Service-Oriented Architecture*, *Stand-Alone Application*, *Hybrid*), `operationalStatus` tracks the lifecycle state (*Planned*, *Deployed*, *Operational*, *Decommissioned*), `visibilityLevel` indicates access scope (*Full*, *Partial*, *Restricted*), and `boardId` links the environment to its governing board.

**Table `InformationEnvironment`**

| id | environmentId | environmentName | architectureType | operationalStatus | visibilityLevel | boardId |
|---|---|---|---|---|---|---|
| 1000 | 726050 | DoD Net-Centric Services Environment | Service-Oriented Architecture | Planned | Full | 1 |
| 1001 | 1996940 | DNI Information Environment | Stand-Alone Application | Deployed | Partial | 2 |
| 1002 | 2986218 | DoD Net-Centric Services Environment | Hybrid | Operational | Restricted | 3 |
| 1003 | 8350020 | DNI Information Environment | Service-Oriented Architecture | Decommissioned | Full | 4 |

`MissionService` records the services hosted within environments. The `id` column (`100`–`103`) is the surrogate key, `serviceId` holds external identifiers (including a UUID `e29bafe2-8fd1-11eb-924d-9cd76263cbd0` for service `103`), `serviceName` names the service (*Distributed Initiative*, *Adaptive Model D*, *Primary Cluster*, *Composite Review*), `serviceCategory` classifies it (*Mission Service*, *Business Service*, *Infrastructure Service*), `securityClassification` assigns a clearance level (*Unclassified*, *Confidential*, *Secret*, *Top Secret*), `availabilityStatus` tracks readiness (*Available*, *Under Development*, *Deprecated*), `providerOrganization` names the sponsoring body (*DoD*, *DNI*, *Joint*), and `environmentId` ties the service to its hosting environment.

**Table `MissionService`**

| id | serviceId | serviceName | serviceCategory | securityClassification | availabilityStatus | providerOrganization | environmentId |
|---|---|---|---|---|---|---|---|
| 100 | 1996925 | Distributed Initiative | Mission Service | Unclassified | Available | DoD | 1000 |
| 101 | 3990164 | Adaptive Model D | Business Service | Confidential | Under Development | DNI | 1001 |
| 102 | 5844258 | Primary Cluster | Infrastructure Service | Secret | Deprecated | Joint | 1002 |
| 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | Mission Service | Top Secret | Available | DoD | 1003 |

## Junction Tables for Many-to-Many Relationships

Several entity pairs participate in many-to-many relationships that require dedicated junction tables. `InformationSharingAgreementInteroperabilityStandard` links agreements to the interoperability standards they reference. `InformationSharingAgreementChiefInformationOfficer` captures the agreement–officer association, providing an explicit many-to-many bridge alongside the direct `agreementId` foreign key in `ChiefInformationOfficer`. `GovernanceBoardChiefInformationOfficer` links officers to boards independently of their agreement affiliation. `GovernanceBoardInteroperabilityStandard` associates standards with boards.

**Table `InformationSharingAgreementInteroperabilityStandard`**

| agreementId | standardId |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `InformationSharingAgreementChiefInformationOfficer`**

| agreementId | officerId |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

**Table `GovernanceBoardChiefInformationOfficer`**

| boardId | officerId |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `GovernanceBoardInteroperabilityStandard`**

| boardId | standardId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The remaining junction tables connect standards, environments, and services. `InteroperabilityStandardMissionService` links standards to the mission services they govern. `InformationEnvironmentInteroperabilityStandard` associates environments with standards. `InformationEnvironmentMissionService` links environments to services. `MissionServiceInteroperabilityStandard` provides an alternative path from services to standards. `MissionServiceMissionService` captures intra-service dependencies, allowing one mission service to reference another.

**Table `InteroperabilityStandardMissionService`**

| standardId | serviceId |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `InformationEnvironmentInteroperabilityStandard`**

| environmentId | standardId |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `InformationEnvironmentMissionService`**

| environmentId | serviceId |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

**Table `MissionServiceInteroperabilityStandard`**

| serviceId | standardId |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `MissionServiceMissionService`**

| serviceId | usedByServiceId |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

## View Definitions and Their Analytical Purpose

The view layer reassembles the normalized data into analytical perspectives. Each view answers a specific question by joining the relevant base and junction tables.

The view `information_sharing_agreement_governance_board_view` joins `InformationSharingAgreement` to `GovernanceBoard` on `boardId`, answering the question: *Which governance board oversees each agreement?* A row from this view would show agreement `1000` (*Memorandum of Agreement*, scope *DoD*) linked to board `ChIJH2V4UYBt5kcR5doeFwuU7Ns` with governance scope *DoD CIO/DNI CIO Standards* and meeting frequency *Monthly*.

**View `information_sharing_agreement_governance_board_view`**

```sql
CREATE VIEW information_sharing_agreement_governance_board_view AS
SELECT a.agreementId, a.issueDate, a.agreementType, a.status, b.id AS board_id, b.boardId AS board_boardId, b.establishmentDate AS board_establishmentDate
FROM InformationSharingAgreement a JOIN GovernanceBoard b ON a.boardId = b.id;
```

| agreementId | issueDate | agreementType | status | board_id | board_boardId | board_establishmentDate |
|---|---|---|---|---|---|---|
| 1000 | 2023-02-01 | Memorandum of Agreement | Draft | 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | 2024-07-11 |
| 1001 | 2024-07-12 | Joint Strategy | Signed | 2 | 168553 | 2025-12-22 |
| 1002 | 2025-12-23 | Policy Directive | Active | 3 | 5006454 | 2022-05-06 |
| 1003 | 2022-05-07 | Memorandum of Agreement | Superseded | 4 | 1437585 | 2023-10-17 |

The view `information_sharing_agreement_interoperability_standard_detail_view` joins `InformationSharingAgreement` through `InformationSharingAgreementInteroperabilityStandard` to `InteroperabilityStandard`, answering: *Which interoperability standards are referenced by each agreement?* A sample row would pair agreement `1000` with standard *Compact Framework* (version *seasonal-version-71*, technology type *Web Services*, compliance level *Mandatory*).

**View `information_sharing_agreement_interoperability_standard_detail_view`**

```sql
CREATE VIEW information_sharing_agreement_interoperability_standard_detail_view AS
SELECT a.agreementId, a.issueDate, a.agreementType, b.id AS standard_id, b.standardId AS standard_standardId, b.standardName AS standard_standardName
FROM InformationSharingAgreement a
  JOIN InformationSharingAgreementInteroperabilityStandard j ON j.agreementId = a.agreementId
  JOIN InteroperabilityStandard b ON b.id = j.standardId;
```

| agreementId | issueDate | agreementType | standard_id | standard_standardId | standard_standardName |
|---|---|---|---|---|---|
| 1000 | 2023-02-01 | Memorandum of Agreement | 1 | 7119764 | Compact Framework |
| 1000 | 2023-02-01 | Memorandum of Agreement | 2 | 9125617 | Legacy Protocol |
| 1001 | 2024-07-12 | Joint Strategy | 2 | 9125617 | Legacy Protocol |
| 1001 | 2024-07-12 | Joint Strategy | 3 | 338526 | Regional Programme A |
| 1002 | 2025-12-23 | Policy Directive | 3 | 338526 | Regional Programme A |
| 1002 | 2025-12-23 | Policy Directive | 4 | 3717623 | Seasonal Standard |
| 1003 | 2022-05-07 | Memorandum of Agreement | 4 | 3717623 | Seasonal Standard |
| 1003 | 2022-05-07 | Memorandum of Agreement | 1 | 7119764 | Compact Framework |

The view `information_sharing_agreement_chief_information_officer_detail_view` joins `InformationSharingAgreement` through `InformationSharingAgreementChiefInformationOfficer` to `ChiefInformationOfficer`, answering: *Which CIOs are assigned to each agreement?* A row would show agreement `1000` paired with officer *Theodore Mcgrath* of the *Department of Defense*, holding the title *Assistant Secretary of Defense*.

**View `information_sharing_agreement_chief_information_officer_detail_view`**

```sql
CREATE VIEW information_sharing_agreement_chief_information_officer_detail_view AS
SELECT a.agreementId, a.issueDate, a.agreementType, b.officerId AS officer_officerId, b.fullName AS officer_fullName, b.organization AS officer_organization
FROM InformationSharingAgreement a
  JOIN InformationSharingAgreementChiefInformationOfficer j ON j.agreementId = a.agreementId
  JOIN ChiefInformationOfficer b ON b.officerId = j.officerId;
```

| agreementId | issueDate | agreementType | officer_officerId | officer_fullName | officer_organization |
|---|---|---|---|---|---|
| 1000 | 2023-02-01 | Memorandum of Agreement | 1000 | Theodore Mcgrath | Department of Defense |
| 1000 | 2023-02-01 | Memorandum of Agreement | 1001 | Account Name | Director of National Intelligence |
| 1001 | 2024-07-12 | Joint Strategy | 1001 | Account Name | Director of National Intelligence |
| 1001 | 2024-07-12 | Joint Strategy | 1002 | Saipan International Airport | Department of Defense |
| 1002 | 2025-12-23 | Policy Directive | 1002 | Saipan International Airport | Department of Defense |
| 1002 | 2025-12-23 | Policy Directive | 1003 | Norma Fisher | Director of National Intelligence |
| 1003 | 2022-05-07 | Memorandum of Agreement | 1003 | Norma Fisher | Director of National Intelligence |
| 1003 | 2022-05-07 | Memorandum of Agreement | 1000 | Theodore Mcgrath | Department of Defense |

The view `chief_information_officer_governance_board_view` joins `ChiefInformationOfficer` to `GovernanceBoard` on `boardId`, answering: *Which governance board is each CIO associated with?* A row would show officer *Theodore Mcgrath* linked to board `ChIJH2V4UYBt5kcR5doeFwuU7Ns` with governance scope *DoD CIO/DNI CIO Standards*.

**View `chief_information_officer_governance_board_view`**

```sql
CREATE VIEW chief_information_officer_governance_board_view AS
SELECT a.officerId, a.fullName, a.organization, a.rankOrTitle, b.id AS board_id, b.boardId AS board_boardId, b.establishmentDate AS board_establishmentDate
FROM ChiefInformationOfficer a JOIN GovernanceBoard b ON a.boardId = b.id;
```

| officerId | fullName | organization | rankOrTitle | board_id | board_boardId | board_establishmentDate |
|---|---|---|---|---|---|---|
| 1000 | Theodore Mcgrath | Department of Defense | Assistant Secretary of Defense | 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | 2024-07-11 |
| 1001 | Account Name | Director of National Intelligence | Associate Director of National Intelligence | 2 | 168553 | 2025-12-22 |
| 1002 | Saipan International Airport | Department of Defense | Maj. Gen. | 3 | 5006454 | 2022-05-06 |
| 1003 | Norma Fisher | Director of National Intelligence | Assistant Secretary of Defense | 4 | 1437585 | 2023-10-17 |

The view `chief_information_officer_information_sharing_agreement_view` joins `ChiefInformationOfficer` to `InformationSharingAgreement` on `agreementId`, answering: *Which agreement is each CIO assigned to?* A row would show officer *Theodore Mcgrath* (appointment date `2022-05-03`) linked to agreement `1000` (*Memorandum of Agreement*, status *Draft*).

**View `chief_information_officer_information_sharing_agreement_view`**

```sql
CREATE VIEW chief_information_officer_information_sharing_agreement_view AS
SELECT a.officerId, a.fullName, a.organization, a.rankOrTitle, b.agreementId AS agreement_agreementId, b.issueDate AS agreement_issueDate, b.agreementType AS agreement_agreementType
FROM ChiefInformationOfficer a JOIN InformationSharingAgreement b ON a.agreementId = b.agreementId;
```

| officerId | fullName | organization | rankOrTitle | agreement_agreementId | agreement_issueDate | agreement_agreementType |
|---|---|---|---|---|---|---|
| 1000 | Theodore Mcgrath | Department of Defense | Assistant Secretary of Defense | 1000 | 2023-02-01 | Memorandum of Agreement |
| 1001 | Account Name | Director of National Intelligence | Associate Director of National Intelligence | 1001 | 2024-07-12 | Joint Strategy |
| 1002 | Saipan International Airport | Department of Defense | Maj. Gen. | 1002 | 2025-12-23 | Policy Directive |
| 1003 | Norma Fisher | Director of National Intelligence | Assistant Secretary of Defense | 1003 | 2022-05-07 | Memorandum of Agreement |

The view `governance_board_chief_information_officer_detail_view` joins `GovernanceBoard` through `GovernanceBoardChiefInformationOfficer` to `ChiefInformationOfficer`, answering: *Which CIOs serve under each governance board?* A row would show board `ChIJH2V4UYBt5kcR5doeFwuU7Ns` (established `2024-07-11`, meeting *Monthly*) linked to officer *Theodore Mcgrath*.

**View `governance_board_chief_information_officer_detail_view`**

```sql
CREATE VIEW governance_board_chief_information_officer_detail_view AS
SELECT a.id, a.boardId, a.establishmentDate, b.officerId AS officer_officerId, b.fullName AS officer_fullName, b.organization AS officer_organization
FROM GovernanceBoard a
  JOIN GovernanceBoardChiefInformationOfficer j ON j.boardId = a.id
  JOIN ChiefInformationOfficer b ON b.officerId = j.officerId;
```

| id | boardId | establishmentDate | officer_officerId | officer_fullName | officer_organization |
|---|---|---|---|---|---|
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | 2024-07-11 | 1000 | Theodore Mcgrath | Department of Defense |
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | 2024-07-11 | 1001 | Account Name | Director of National Intelligence |
| 2 | 168553 | 2025-12-22 | 1001 | Account Name | Director of National Intelligence |
| 2 | 168553 | 2025-12-22 | 1002 | Saipan International Airport | Department of Defense |
| 3 | 5006454 | 2022-05-06 | 1002 | Saipan International Airport | Department of Defense |
| 3 | 5006454 | 2022-05-06 | 1003 | Norma Fisher | Director of National Intelligence |
| 4 | 1437585 | 2023-10-17 | 1003 | Norma Fisher | Director of National Intelligence |
| 4 | 1437585 | 2023-10-17 | 1000 | Theodore Mcgrath | Department of Defense |

The view `governance_board_interoperability_standard_detail_view` joins `GovernanceBoard` through `GovernanceBoardInteroperabilityStandard` to `InteroperabilityStandard`, answering: *Which interoperability standards does each governance board oversee?* A row would show board `ChIJH2V4UYBt5kcR5doeFwuU7Ns` linked to standard *Compact Framework* (compliance level *Mandatory*, effective date `2023-02-14`).

**View `governance_board_interoperability_standard_detail_view`**

```sql
CREATE VIEW governance_board_interoperability_standard_detail_view AS
SELECT a.id, a.boardId, a.establishmentDate, b.id AS standard_id, b.standardId AS standard_standardId, b.standardName AS standard_standardName
FROM GovernanceBoard a
  JOIN GovernanceBoardInteroperabilityStandard j ON j.boardId = a.id
  JOIN InteroperabilityStandard b ON b.id = j.standardId;
```

| id | boardId | establishmentDate | standard_id | standard_standardId | standard_standardName |
|---|---|---|---|---|---|
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | 2024-07-11 | 1 | 7119764 | Compact Framework |
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | 2024-07-11 | 2 | 9125617 | Legacy Protocol |
| 2 | 168553 | 2025-12-22 | 2 | 9125617 | Legacy Protocol |
| 2 | 168553 | 2025-12-22 | 3 | 338526 | Regional Programme A |
| 3 | 5006454 | 2022-05-06 | 3 | 338526 | Regional Programme A |
| 3 | 5006454 | 2022-05-06 | 4 | 3717623 | Seasonal Standard |
| 4 | 1437585 | 2023-10-17 | 4 | 3717623 | Seasonal Standard |
| 4 | 1437585 | 2023-10-17 | 1 | 7119764 | Compact Framework |

The view `governance_board_information_environment_view` joins `GovernanceBoard` to `InformationEnvironment` on `boardId`, answering: *Which information environments fall under each governance board?* A row would show board `ChIJH2V4UYBt5kcR5doeFwuU7Ns` linked to environment *DoD Net-Centric Services Environment* (architecture *Service-Oriented Architecture*, status *Planned*, visibility *Full*).

**View `governance_board_information_environment_view`**

```sql
CREATE VIEW governance_board_information_environment_view AS
SELECT a.id, a.boardId, a.establishmentDate, a.governanceScope, b.id AS environment_id, b.environmentId AS environment_environmentId, b.environmentName AS environment_environmentName
FROM GovernanceBoard a JOIN InformationEnvironment b ON a.environmentId = b.id;
```

| id | boardId | establishmentDate | governanceScope | environment_id | environment_environmentId | environment_environmentName |
|---|---|---|---|---|---|---|
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | 2024-07-11 | DoD CIO/DNI CIO Standards | 1000 | 726050 | DoD Net-Centric Services Environment |
| 2 | 168553 | 2025-12-22 | Interoperable Secure Infrastructure | 1001 | 1996940 | DNI Information Environment |
| 3 | 5006454 | 2022-05-06 | Business Services | 1002 | 2986218 | DoD Net-Centric Services Environment |
| 4 | 1437585 | 2023-10-17 | DoD CIO/DNI CIO Standards | 1003 | 8350020 | DNI Information Environment |

The view `interoperability_standard_governance_board_view` joins `InteroperabilityStandard` to `GovernanceBoard` on `boardId`, answering: *Which governance board governs each interoperability standard?* A row would show standard *Compact Framework* (technology type *Web Services*) linked to board `ChIJH2V4UYBt5kcR5doeFwuU7Ns` with decision authority *Joint*.

**View `interoperability_standard_governance_board_view`**

```sql
CREATE VIEW interoperability_standard_governance_board_view AS
SELECT a.id, a.standardId, a.standardName, a.version, b.id AS board_id, b.boardId AS board_boardId, b.establishmentDate AS board_establishmentDate
FROM InteroperabilityStandard a JOIN GovernanceBoard b ON a.boardId = b.id;
```

| id | standardId | standardName | version | board_id | board_boardId | board_establishmentDate |
|---|---|---|---|---|---|---|
| 1 | 7119764 | Compact Framework | seasonal-version-71 | 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | 2024-07-11 |
| 2 | 9125617 | Legacy Protocol | regional-version-72 | 2 | 168553 | 2025-12-22 |
| 3 | 338526 | Regional Programme A | legacy-version-73 | 3 | 5006454 | 2022-05-06 |
| 4 | 3717623 | Seasonal Standard | compact-version-74 | 4 | 1437585 | 2023-10-17 |

The view `interoperability_standard_information_environment_view` joins `InteroperabilityStandard` to `InformationEnvironment` on `environmentId`, answering: *In which information environment is each interoperability standard deployed?* A row would show standard *Compact Framework* linked to environment *DoD Net-Centric Services Environment* (operational status *Planned*).

**View `interoperability_standard_information_environment_view`**

```sql
CREATE VIEW interoperability_standard_information_environment_view AS
SELECT a.id, a.standardId, a.standardName, a.version, b.id AS environment_id, b.environmentId AS environment_environmentId, b.environmentName AS environment_environmentName
FROM InteroperabilityStandard a JOIN InformationEnvironment b ON a.environmentId = b.id;
```

| id | standardId | standardName | version | environment_id | environment_environmentId | environment_environmentName |
|---|---|---|---|---|---|---|
| 1 | 7119764 | Compact Framework | seasonal-version-71 | 1000 | 726050 | DoD Net-Centric Services Environment |
| 2 | 9125617 | Legacy Protocol | regional-version-72 | 1001 | 1996940 | DNI Information Environment |
| 3 | 338526 | Regional Programme A | legacy-version-73 | 1002 | 2986218 | DoD Net-Centric Services Environment |
| 4 | 3717623 | Seasonal Standard | compact-version-74 | 1003 | 8350020 | DNI Information Environment |

The view `interoperability_standard_mission_service_detail_view` joins `InteroperabilityStandard` through `InteroperabilityStandardMissionService` to `MissionService`, answering: *Which mission services are governed by each interoperability standard?* A row would show standard *Compact Framework* linked to service *Distributed Initiative* (category *Mission Service*, classification *Unclassified*, status *Available*).

**View `interoperability_standard_mission_service_detail_view`**

```sql
CREATE VIEW interoperability_standard_mission_service_detail_view AS
SELECT a.id, a.standardId, a.standardName, b.id AS service_id, b.serviceId AS service_serviceId, b.serviceName AS service_serviceName
FROM InteroperabilityStandard a
  JOIN InteroperabilityStandardMissionService j ON j.standardId = a.id
  JOIN MissionService b ON b.id = j.serviceId;
```

| id | standardId | standardName | service_id | service_serviceId | service_serviceName |
|---|---|---|---|---|---|
| 1 | 7119764 | Compact Framework | 100 | 1996925 | Distributed Initiative |
| 1 | 7119764 | Compact Framework | 101 | 3990164 | Adaptive Model D |
| 2 | 9125617 | Legacy Protocol | 101 | 3990164 | Adaptive Model D |
| 2 | 9125617 | Legacy Protocol | 102 | 5844258 | Primary Cluster |
| 3 | 338526 | Regional Programme A | 102 | 5844258 | Primary Cluster |
| 3 | 338526 | Regional Programme A | 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review |
| 4 | 3717623 | Seasonal Standard | 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review |
| 4 | 3717623 | Seasonal Standard | 100 | 1996925 | Distributed Initiative |

The view `information_environment_governance_board_view` joins `InformationEnvironment` to `GovernanceBoard` on `boardId`, answering: *Which governance board oversees each information environment?* A row would show environment *DoD Net-Centric Services Environment* linked to board `ChIJH2V4UYBt5kcR5doeFwuU7Ns` (governance scope *DoD CIO/DNI CIO Standards*, meeting frequency *Monthly*).

**View `information_environment_governance_board_view`**

```sql
CREATE VIEW information_environment_governance_board_view AS
SELECT a.id, a.environmentId, a.environmentName, a.architectureType, b.id AS board_id, b.boardId AS board_boardId, b.establishmentDate AS board_establishmentDate
FROM InformationEnvironment a JOIN GovernanceBoard b ON a.boardId = b.id;
```

| id | environmentId | environmentName | architectureType | board_id | board_boardId | board_establishmentDate |
|---|---|---|---|---|---|---|
| 1000 | 726050 | DoD Net-Centric Services Environment | Service-Oriented Architecture | 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | 2024-07-11 |
| 1001 | 1996940 | DNI Information Environment | Stand-Alone Application | 2 | 168553 | 2025-12-22 |
| 1002 | 2986218 | DoD Net-Centric Services Environment | Hybrid | 3 | 5006454 | 2022-05-06 |
| 1003 | 8350020 | DNI Information Environment | Service-Oriented Architecture | 4 | 1437585 | 2023-10-17 |

The view `information_environment_interoperability_standard_detail_view` joins `InformationEnvironment` through `InformationEnvironmentInteroperabilityStandard` to `InteroperabilityStandard`, answering: *Which interoperability standards apply to each information environment?* A row would show environment *DoD Net-Centric Services Environment* linked to standard *Compact Framework* (compliance level *Mandatory*).

**View `information_environment_interoperability_standard_detail_view`**

```sql
CREATE VIEW information_environment_interoperability_standard_detail_view AS
SELECT a.id, a.environmentId, a.environmentName, b.id AS standard_id, b.standardId AS standard_standardId, b.standardName AS standard_standardName
FROM InformationEnvironment a
  JOIN InformationEnvironmentInteroperabilityStandard j ON j.environmentId = a.id
  JOIN InteroperabilityStandard b ON b.id = j.standardId;
```

| id | environmentId | environmentName | standard_id | standard_standardId | standard_standardName |
|---|---|---|---|---|---|
| 1000 | 726050 | DoD Net-Centric Services Environment | 1 | 7119764 | Compact Framework |
| 1000 | 726050 | DoD Net-Centric Services Environment | 2 | 9125617 | Legacy Protocol |
| 1001 | 1996940 | DNI Information Environment | 2 | 9125617 | Legacy Protocol |
| 1001 | 1996940 | DNI Information Environment | 3 | 338526 | Regional Programme A |
| 1002 | 2986218 | DoD Net-Centric Services Environment | 3 | 338526 | Regional Programme A |
| 1002 | 2986218 | DoD Net-Centric Services Environment | 4 | 3717623 | Seasonal Standard |
| 1003 | 8350020 | DNI Information Environment | 4 | 3717623 | Seasonal Standard |
| 1003 | 8350020 | DNI Information Environment | 1 | 7119764 | Compact Framework |

The view `information_environment_mission_service_detail_view` joins `InformationEnvironment` through `InformationEnvironmentMissionService` to `MissionService`, answering: *Which mission services are hosted in each information environment?* A row would show environment *DoD Net-Centric Services Environment* linked to service *Distributed Initiative* (provider *DoD*, classification *Unclassified*).

**View `information_environment_mission_service_detail_view`**

```sql
CREATE VIEW information_environment_mission_service_detail_view AS
SELECT a.id, a.environmentId, a.environmentName, b.id AS service_id, b.serviceId AS service_serviceId, b.serviceName AS service_serviceName
FROM InformationEnvironment a
  JOIN InformationEnvironmentMissionService j ON j.environmentId = a.id
  JOIN MissionService b ON b.id = j.serviceId;
```

| id | environmentId | environmentName | service_id | service_serviceId | service_serviceName |
|---|---|---|---|---|---|
| 1000 | 726050 | DoD Net-Centric Services Environment | 100 | 1996925 | Distributed Initiative |
| 1000 | 726050 | DoD Net-Centric Services Environment | 101 | 3990164 | Adaptive Model D |
| 1001 | 1996940 | DNI Information Environment | 101 | 3990164 | Adaptive Model D |
| 1001 | 1996940 | DNI Information Environment | 102 | 5844258 | Primary Cluster |
| 1002 | 2986218 | DoD Net-Centric Services Environment | 102 | 5844258 | Primary Cluster |
| 1002 | 2986218 | DoD Net-Centric Services Environment | 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review |
| 1003 | 8350020 | DNI Information Environment | 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review |
| 1003 | 8350020 | DNI Information Environment | 100 | 1996925 | Distributed Initiative |

The view `mission_service_interoperability_standard_detail_view` joins `MissionService` through `MissionServiceInteroperabilityStandard` to `InteroperabilityStandard`, answering: *Which interoperability standards govern each mission service?* A row would show service *Distributed Initiative* linked to standard *Compact Framework* (technology type *Web Services*, compliance level *Mandatory*).

**View `mission_service_interoperability_standard_detail_view`**

```sql
CREATE VIEW mission_service_interoperability_standard_detail_view AS
SELECT a.id, a.serviceId, a.serviceName, b.id AS standard_id, b.standardId AS standard_standardId, b.standardName AS standard_standardName
FROM MissionService a
  JOIN MissionServiceInteroperabilityStandard j ON j.serviceId = a.id
  JOIN InteroperabilityStandard b ON b.id = j.standardId;
```

| id | serviceId | serviceName | standard_id | standard_standardId | standard_standardName |
|---|---|---|---|---|---|
| 100 | 1996925 | Distributed Initiative | 1 | 7119764 | Compact Framework |
| 100 | 1996925 | Distributed Initiative | 2 | 9125617 | Legacy Protocol |
| 101 | 3990164 | Adaptive Model D | 2 | 9125617 | Legacy Protocol |
| 101 | 3990164 | Adaptive Model D | 3 | 338526 | Regional Programme A |
| 102 | 5844258 | Primary Cluster | 3 | 338526 | Regional Programme A |
| 102 | 5844258 | Primary Cluster | 4 | 3717623 | Seasonal Standard |
| 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | 4 | 3717623 | Seasonal Standard |
| 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | 1 | 7119764 | Compact Framework |

The view `mission_service_information_environment_view` joins `MissionService` to `InformationEnvironment` on `environmentId`, answering: *In which information environment is each mission service hosted?* A row would show service *Distributed Initiative* (category *Mission Service*, classification *Unclassified*) linked to environment *DoD Net-Centric Services Environment* (architecture *Service-Oriented Architecture*, status *Planned*).

**View `mission_service_information_environment_view`**

```sql
CREATE VIEW mission_service_information_environment_view AS
SELECT a.id, a.serviceId, a.serviceName, a.serviceCategory, b.id AS environment_id, b.environmentId AS environment_environmentId, b.environmentName AS environment_environmentName
FROM MissionService a JOIN InformationEnvironment b ON a.environmentId = b.id;
```

| id | serviceId | serviceName | serviceCategory | environment_id | environment_environmentId | environment_environmentName |
|---|---|---|---|---|---|---|
| 100 | 1996925 | Distributed Initiative | Mission Service | 1000 | 726050 | DoD Net-Centric Services Environment |
| 101 | 3990164 | Adaptive Model D | Business Service | 1001 | 1996940 | DNI Information Environment |
| 102 | 5844258 | Primary Cluster | Infrastructure Service | 1002 | 2986218 | DoD Net-Centric Services Environment |
| 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | Mission Service | 1003 | 8350020 | DNI Information Environment |

The view `mission_service_mission_service_detail_view` joins `MissionService` to itself through `MissionServiceMissionService`, answering: *Which mission services depend on or reference other mission services?* A row from this self-join would show a service such as *Composite Review* (classification *Top Secret*, status *Available*) linked to a dependent service, revealing the intra-service dependency graph.

**View `mission_service_mission_service_detail_view`**

```sql
CREATE VIEW mission_service_mission_service_detail_view AS
SELECT a.id, a.serviceId, a.serviceName, b.id AS service_id, b.serviceId AS service_serviceId, b.serviceName AS service_serviceName
FROM MissionService a
  JOIN MissionServiceMissionService j ON j.serviceId = a.id
  JOIN MissionService b ON b.id = j.usedByServiceId;
```

| id | serviceId | serviceName | service_id | service_serviceId | service_serviceName |
|---|---|---|---|---|---|
| 100 | 1996925 | Distributed Initiative | 100 | 1996925 | Distributed Initiative |
| 100 | 1996925 | Distributed Initiative | 101 | 3990164 | Adaptive Model D |
| 101 | 3990164 | Adaptive Model D | 101 | 3990164 | Adaptive Model D |
| 101 | 3990164 | Adaptive Model D | 102 | 5844258 | Primary Cluster |
| 102 | 5844258 | Primary Cluster | 102 | 5844258 | Primary Cluster |
| 102 | 5844258 | Primary Cluster | 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review |
| 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review |
| 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | 100 | 1996925 | Distributed Initiative |

## Synthesis

The schema models a governance ecosystem where agreements, officers, and boards form the policy layer; standards define the technical constraints; and environments and services form the operational layer. Foreign keys in the base tables capture one-to-many relationships (e.g., one board governs many agreements), while the five junction tables capture many-to-many associations that require explicit bridge records. The twelve views provide read-optimized perspectives that reconstruct domain facts—such as which standards govern which services, or which officers serve under which boards—by joining the normalized tables along their foreign-key paths. The data itself, with its mix of structured identifiers, free-text names, and lifecycle status values, reflects a working governance registry where agreements move through drafts to active status, environments transition from planned to operational, and services evolve from development to availability or deprecation.