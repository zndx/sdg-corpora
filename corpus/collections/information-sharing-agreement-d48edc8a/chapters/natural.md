## Governance and Interoperability in Defense Information Architecture

Modern defense and intelligence enterprises depend on structured frameworks that align policy, technology, and operational capability across organizational boundaries. Information sharing agreements establish the legal and procedural foundation for data exchange between agencies. Governance boards provide the decision-making authority that oversees compliance and strategic direction. Chief information officers serve as the individual accountability points within each governance structure. Interoperability standards define the technical requirements that systems must satisfy to communicate effectively. Information environments represent the deployed technological infrastructure where services operate. Mission services deliver the actual functional capabilities—data processing, analysis, communication—that enable day-to-day operations. Together, these entities form an interconnected architecture where policy decisions cascade into technical requirements, and operational feedback informs governance. The records in this system capture every layer of that cascade, from the highest-level agreement to the specific service invocation.

**Table `InformationSharingAgreement`**

| agreementId | issueDate | agreementType | status | scope | boardId |
|---|---|---|---|---|---|
| 1000 | 2023-02-01 | Memorandum of Agreement | Draft | DoD | 1 |
| 1001 | 2024-07-12 | Joint Strategy | Signed | DNI | 2 |
| 1002 | 2025-12-23 | Policy Directive | Active | Joint DoD-DNI | 3 |
| 1003 | 2022-05-07 | Memorandum of Agreement | Superseded | DoD | 4 |

Information sharing agreements constitute the outermost policy layer. Each agreement carries a unique identifier, an issue date, a type classification, and a status reflecting its current standing. The scope field indicates whether the agreement applies to the Department of Defense, the Director of National Intelligence, or both. Agreement 1000, a Memorandum of Agreement issued on 2023-02-01 with DoD scope, remains in Draft status under board 1. Agreement 1001, a Joint Strategy between DoD and DNI dated 2024-07-12, has been Signed and is overseen by board 2. Agreement 1002, a Policy Directive with Joint DoD-DNI scope dated 2025-12-23, holds Active status under board 3. Agreement 1003, another Memorandum of Agreement with DoD scope issued on 2022-05-07, has been Superseded by board 4. The lifecycle progression from Draft through Signed to Active, and the eventual Superseded state, reflects the dynamic nature of inter-agency policy.

**Table `GovernanceBoard`**

| id | boardId | establishmentDate | governanceScope | meetingFrequency | decisionAuthority | environmentId |
|---|---|---|---|---|---|---|
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | 2024-07-11 | DoD CIO/DNI CIO Standards | Monthly | Joint | 1000 |
| 2 | 168553 | 2025-12-22 | Interoperable Secure Infrastructure | Quarterly | DoD | 1001 |
| 3 | 5006454 | 2022-05-06 | Business Services | As Needed | DNI | 1002 |
| 4 | 1437585 | 2023-10-17 | DoD CIO/DNI CIO Standards | Monthly | Joint | 1003 |

Governance boards translate agreement-level policy into operational oversight. Each board has an establishment date, a defined governance scope, a meeting frequency, and a decision authority level. Board ChIJH2V4UYBt5kcR5doeFwuU7Ns was established on 2024-07-11 with a scope covering DoD CIO and DNI CIO Standards, meets Monthly, and holds Joint decision authority. Board 168553, established later on 2025-12-22, focuses on Interoperable Secure Infrastructure with Quarterly meetings and DoD-level decision authority. Board 5006454, established earliest on 2022-05-06, addresses Business Services and operates on an As Needed meeting cadence under DNI authority. Board 1437585, established on 2023-10-17, also covers DoD CIO/DNI CIO Standards with Monthly meetings and Joint authority. The decision authority dimension—Joint, DoD, or DNI—determines whether a board can mandate actions across both agencies or is limited to one.

**Table `ChiefInformationOfficer`**

| officerId | fullName | organization | rankOrTitle | appointmentDate | boardId | agreementId |
|---|---|---|---|---|---|---|
| 1000 | Theodore Mcgrath | Department of Defense | Assistant Secretary of Defense | 2022-05-03 | 1 | 1000 |
| 1001 | Account Name | Director of National Intelligence | Associate Director of National Intelligence | 2023-10-14 | 2 | 1001 |
| 1002 | Saipan International Airport | Department of Defense | Maj. Gen. | 2024-03-25 | 3 | 1002 |
| 1003 | Norma Fisher | Director of National Intelligence | Assistant Secretary of Defense | 2025-08-09 | 4 | 1003 |

Chief information officers anchor the governance structure with named individuals responsible for execution. Officer 1000, Theodore Mcgrath of the Department of Defense, holds the title Assistant Secretary of Defense and was appointed on 2022-05-03. Officer 1001, listed under the organization Director of National Intelligence, carries the title Associate Director of National Intelligence and was appointed on 2023-10-14. Officer 1002, associated with Saipan International Airport, holds the military rank of Maj. Gen. and was appointed on 2024-03-25. Officer 1003, Norma Fisher of the Director of National Intelligence, holds the title Assistant Secretary of Defense and was appointed on 2025-08-09. Each officer is linked to a specific governance board and, where applicable, to a specific information sharing agreement, creating a chain of accountability from policy to individual.

**Table `InteroperabilityStandard`**

| id | standardId | standardName | version | technologyType | complianceLevel | effectiveDate | boardId | environmentId |
|---|---|---|---|---|---|---|---|---|
| 1 | 7119764 | Compact Framework | seasonal-version-71 | Web Services | Mandatory | 2023-02-14 | 1 | 1000 |
| 2 | 9125617 | Legacy Protocol | regional-version-72 | Service-Oriented Architecture | Recommended | 2024-07-25 | 2 | 1001 |
| 3 | 338526 | Regional Programme A | legacy-version-73 | Secure Infrastructure | Optional | 2025-12-09 | 3 | 1002 |
| 4 | 3717623 | Seasonal Standard | compact-version-74 | Enterprise Architecture | Mandatory | 2022-05-20 | 4 | 1003 |

Interoperability standards define the technical requirements that systems must satisfy. Each standard carries a name, a version identifier, a technology type, and a compliance level indicating how strictly it must be followed. Standard 7119764, Compact Framework, uses version seasonal-version-71, targets Web Services technology, and carries a Mandatory compliance level effective from 2023-02-14. Standard 9125617, Legacy Protocol, uses version regional-version-72, targets Service-Oriented Architecture, and carries a Recommended compliance level effective from 2024-07-25. Standard 338526, Regional Programme A, uses version legacy-version-73, targets Secure Infrastructure, and carries an Optional compliance level effective from 2025-12-09. Standard 3717623, Seasonal Standard, uses version compact-version-74, targets Enterprise Architecture, and carries a Mandatory compliance level effective from 2022-05-20. The compliance level directly influences how strictly systems must conform, with Mandatory standards requiring full adherence and Optional standards serving as guidance.

**Table `InformationEnvironment`**

| id | environmentId | environmentName | architectureType | operationalStatus | visibilityLevel | boardId |
|---|---|---|---|---|---|---|
| 1000 | 726050 | DoD Net-Centric Services Environment | Service-Oriented Architecture | Planned | Full | 1 |
| 1001 | 1996940 | DNI Information Environment | Stand-Alone Application | Deployed | Partial | 2 |
| 1002 | 2986218 | DoD Net-Centric Services Environment | Hybrid | Operational | Restricted | 3 |
| 1003 | 8350020 | DNI Information Environment | Service-Oriented Architecture | Decommissioned | Full | 4 |

Information environments represent the deployed technological infrastructure. Environment 726050, the DoD Net-Centric Services Environment, uses a Service-Oriented Architecture, is in Planned operational status, and provides Full visibility. Environment 1996940, the DNI Information Environment, runs as a Stand-Alone Application, is Deployed, and offers Partial visibility. Environment 2986218, also named DoD Net-Centric Services Environment, uses a Hybrid architecture, is Operational, and provides Restricted visibility. Environment 8350020, the DNI Information Environment, uses a Service-Oriented Architecture, is Decommissioned, and provides Full visibility. The operational status—Planned, Deployed, Operational, or Decommissioned—indicates the maturity of the infrastructure, while the visibility level determines which organizations can access it.

**Table `MissionService`**

| id | serviceId | serviceName | serviceCategory | securityClassification | availabilityStatus | providerOrganization | environmentId |
|---|---|---|---|---|---|---|---|
| 100 | 1996925 | Distributed Initiative | Mission Service | Unclassified | Available | DoD | 1000 |
| 101 | 3990164 | Adaptive Model D | Business Service | Confidential | Under Development | DNI | 1001 |
| 102 | 5844258 | Primary Cluster | Infrastructure Service | Secret | Deprecated | Joint | 1002 |
| 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | Mission Service | Top Secret | Available | DoD | 1003 |

Mission services deliver the actual functional capabilities within these environments. Service 1996925, Distributed Initiative, falls under the Mission Service category, is Unclassified, is Available, and is provided by the DoD within environment 1000. Service 3990164, Adaptive Model D, is a Business Service classified as Confidential, is Under Development, and is provided by the DNI within environment 1001. Service 5844258, Primary Cluster, is an Infrastructure Service classified as Secret, is Deprecated, and is provided by the Joint organization within environment 1002. Service e29bafe2-8fd1-11eb-924d-9cd76263cbd0, Composite Review, is a Mission Service classified as Top Secret, is Available, and is provided by the DoD within environment 1003. The service category indicates whether the capability is mission-focused, business-oriented, or infrastructure-dependent, while the availability status reflects its current operational state.

The relationships between these entities form the operational fabric of the system. Information sharing agreements connect to interoperability standards through the linking table that records which standards apply to which agreements, ensuring that policy requirements are reflected in technical specifications.

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

Agreements also connect to chief information officers through a dedicated linking table, establishing which officers are responsible for executing which agreements.

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

Governance boards link to chief information officers through their own association table, defining which officers report to which boards.

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

Governance boards similarly link to interoperability standards, indicating which standards fall under each board's oversight.

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

Interoperability standards connect to mission services, specifying which services must comply with which standards.

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

Information environments link to interoperability standards, defining the technical requirements for each deployed environment.

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

Information environments also link to mission services, indicating which services operate within which environments.

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

Mission services connect to interoperability standards through a direct association, reinforcing the compliance requirements for each service.

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

Mission services can also reference other mission services, enabling the modeling of service dependencies and composite capabilities.

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

These relationships are surfaced through a set of joined views that answer specific operational questions. The information sharing agreement governance board view reveals which governance boards oversee which agreements, providing a clear mapping of policy to oversight authority.

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

The information sharing agreement interoperability standard detail view answers which technical standards are required by each agreement, allowing compliance officers to verify that every agreement has corresponding technical specifications.

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

The information sharing agreement chief information officer detail view identifies which officers are responsible for executing each agreement, establishing clear lines of individual accountability.

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

The chief information officer governance board view shows which boards each officer serves, revealing the reporting structure within the governance hierarchy.

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

The chief information officer information sharing agreement view presents which agreements each officer is associated with, enabling workload assessment and responsibility tracking.

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

The governance board chief information officer detail view provides a board-centric perspective, listing all officers under each board's authority for resource planning and coordination.

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

The governance board interoperability standard detail view reveals which standards each board oversees, supporting compliance audits and standard lifecycle management.

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

The governance board information environment view connects boards to the environments they govern, enabling infrastructure-level oversight and capacity planning.

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

The interoperability standard governance board view presents a standard-centric perspective, showing which boards have authority over each standard for governance traceability.

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

The interoperability standard information environment view links standards to the environments where they must be implemented, supporting deployment planning and compliance verification.

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

The interoperability standard mission service detail view identifies which mission services must comply with each standard, enabling targeted compliance assessments and remediation planning.

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

The information environment governance board view shows which boards oversee each environment, providing an infrastructure governance perspective.

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

The information environment interoperability standard detail view reveals which standards apply to each environment, supporting infrastructure compliance and upgrade planning.

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

The information environment mission service detail view identifies which services operate within each environment, enabling capacity analysis and service dependency mapping.

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

The mission service interoperability standard detail view presents a service-centric compliance view, showing which standards each service must satisfy.

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

The mission service information environment view links services to their hosting environments, supporting infrastructure utilization analysis and service placement decisions.

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

The mission service mission service detail view reveals inter-service dependencies, enabling impact analysis when services are modified or decommissioned.

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

The architecture described here captures the full chain of accountability in defense and intelligence information sharing. Policy decisions encoded in information sharing agreements flow through governance boards to chief information officers, who ensure that interoperability standards are implemented within information environments to support mission services. The linking tables and joined views provide the operational visibility needed to audit compliance, plan upgrades, and assess the impact of changes at any level. When a standard's compliance level changes from Recommended to Mandatory, the system can trace that change through the governance board to the officers responsible, to the environments affected, and to the services that must be updated. When a mission service is deprecated, the system can identify which standards it satisfied, which environments hosted it, and which agreements it supported. This interconnected record structure ensures that no decision exists in isolation, and that every operational change can be understood in its full policy and technical context.