## Domain Modelling and Relational Materialization in the Intelligence Information System

The intelligence information system captures, stores, and cross-references analytical products produced by a distributed network of repositories, units, analysts, and partner agencies. At its core, the domain revolves around the `IntelligenceReport` — the primary artefact of analytical work — which is produced by analysts, filed within repositories, associated with subjects of interest, and shared with partner agencies. The relational schema materializes this domain through a combination of seven base tables, eight junction tables that resolve many-to-many relationships, and thirty denormalized views that reconstruct domain facts for query. The following sections walk through the entity types, their attributes, the foreign-key topology, and the view layer that stitches normalized rows back into readable domain narratives.

### Core Entity Types and Their Attributes

The schema's backbone is the `IntelligenceReport` table, which stores each analytical product as a single row. Its primary key is `id`, and it carries a human-readable `reportIdentifier` such as `REP-2544` or `REP-2547`. The `reportDate` column records when the report was authored — for instance, `2024-03-02T02:54:00` for report `REP-2544` — while `classificationLevel` constrains the report to values like `Unclassified`, `Law Enforcement Sensitive`, `Confidential`, or `Secret`. The `threatCategory` column categorizes the subject matter, with examples including `Terrorism`, `Homegrown Violent Extremist`, `Lone Offender`, and `Drug Trafficking`. A `status` column tracks the report's lifecycle stage (`Draft`, `Under Review`, `Approved`, `Disseminated`), and `complianceStandard` records the regulatory framework, typically `CHRIA` or `28 CFR Part 23`.

**Table `IntelligenceReport`**

| id | reportIdentifier | reportDate | classificationLevel | threatCategory | status | complianceStandard | repositoryId | analystId | interestId | agencyId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | REP-2544 | 2024-03-02T02:54:00 | Unclassified | Terrorism | Draft | CHRIA | 100 | 1 | 1 | 1000 |
| 1001 | REP-2545 | 2025-08-13T09:11:00 | Law Enforcement Sensitive | Homegrown Violent Extremist | Under Review | 28 CFR Part 23 | 101 | 2 | 2 | 1001 |
| 1002 | REP-2546 | 2022-01-24T16:28:00 | Confidential | Lone Offender | Approved | CHRIA | 102 | 3 | 3 | 1002 |
| 1003 | REP-2547 | 2023-06-08T23:45:00 | Secret | Drug Trafficking | Disseminated | 28 CFR Part 23 | 103 | 4 | 4 | 1003 |

Each report row also carries four foreign-key columns — `repositoryId`, `analystId`, `interestId`, and `agencyId` — that anchor the report to its producing repository, its authoring analyst, its primary subject of interest, and its originating partner agency. These columns form the first layer of referential integrity, though the schema also provides dedicated junction tables for more flexible many-to-many associations, as discussed later.

The `IntelligenceRepository` table models the physical and organizational facilities where reports are stored and managed. Its primary key is `repositoryId`, and each row carries a `facilityIdentifier` (e.g., `FAC-2066`), a `facilityName` such as `Integrated Protocol A` or `Baseline Framework D`, and geographic columns `locationCity` and `locationState` with values like `seasonal-location-23` and `composite-location-93`. The `operationalStatus` column constrains the facility to `Active`, `Inactive`, or `Under Maintenance`, while `jurisdictionCoverage` indicates the scope of authority — `Regional`, `State`, `Federal`, or `Local`. A `unitId` foreign key links the repository to its parent `IntelligenceUnit`, and `createdAt` records the facility's creation timestamp.

**Table `IntelligenceRepository`**

| repositoryId | facilityIdentifier | facilityName | locationCity | locationState | operationalStatus | jurisdictionCoverage | unitId | createdAt |
|---|---|---|---|---|---|---|---|---|
| 100 | FAC-2066 | Integrated Protocol A | seasonal-location-23 | composite-location-93 | Active | Regional | 1000 | 2025-01-01 00:14:00 |
| 101 | FAC-2067 | Extended Programme | regional-location-24 | primary-location-94 | Inactive | State | 1001 | 2025-02-06 03:14:00 |
| 102 | FAC-2068 | Pilot Standard | legacy-location-25 | adaptive-location-95 | Under Maintenance | Federal | 1002 | 2025-03-11 06:14:00 |
| 103 | FAC-2069 | Baseline Framework D | compact-location-26 | distributed-location-96 | Active | Local | 1003 | 2025-04-16 09:14:00 |

The `IntelligenceUnit` table represents organizational sub-units within the intelligence enterprise. Its primary key is `id`, and each row carries a `unitCode` (e.g., `16375765` for the Compact Series), a `unitName` such as `Compact Series` or `Seasonal Corridor`, and a `parentOrganization` column referencing the broader parent body — `Dow Chemical`, `LDAP First Name Field`, `Standard Chartered`, or `The Library of Congress`. The `missionScope` column constrains the unit's operational focus to values like `All Crimes`, `All Threats`, `All Hazards`, or `Counter-Terrorism`. The `establishmentDate` records when the unit was formed, while `repositoryId` and `agencyId` foreign keys link the unit to its hosting repository and its originating partner agency.

**Table `IntelligenceUnit`**

| id | unitCode | unitName | parentOrganization | missionScope | establishmentDate | repositoryId | agencyId | createdAt |
|---|---|---|---|---|---|---|---|---|
| 1000 | 16375765 | Compact Series | Dow Chemical | All Crimes | 2024-07-11 | 100 | 1000 | 2025-01-01 00:14:00 |
| 1001 | 43197173 | Legacy Assessment | LDAP First Name Field | All Threats | 2025-12-22 | 101 | 1001 | 2025-02-06 03:14:00 |
| 1002 | 1186104 | Regional Survey A | Standard Chartered | All Hazards | 2022-05-06 | 102 | 1002 | 2025-03-11 06:14:00 |
| 1003 | 69419 | Seasonal Corridor | The Library of Congress | Counter-Terrorism | 2023-10-17 | 103 | 1003 | 2025-04-16 09:14:00 |

The `IntelligenceAnalyst` table stores individual analysts who produce reports. Its primary key is `analystId`, and each row carries an `analystBadgeNumber` (e.g., `ANA-2730`), an `analystName` such as `Seasonal Survey` or `Pilot Assessment`, and an `agencyAffiliation` column indicating the analyst's home organization — `Philadelphia Police Department`, `FBI`, `State Police`, or `Federal Partner`. The `clearanceLevel` column constrains the analyst's access to `Public`, `Law Enforcement Sensitive`, `Confidential`, or `Secret`. The `assignmentDate` records when the analyst was assigned, `status` tracks their current state (`Active`, `On Leave`, `Inactive`), and foreign keys `unitId`, `repositoryId`, and `agencyId` anchor the analyst to their organizational home. Timestamps `createdAt` and `updatedAt` provide audit trails.

**Table `IntelligenceAnalyst`**

| analystId | analystBadgeNumber | analystName | agencyAffiliation | clearanceLevel | assignmentDate | status | unitId | repositoryId | agencyId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ANA-2730 | Seasonal Survey | Philadelphia Police Department | Public | 2024-11-03 | Active | 1000 | 100 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | ANA-2732 | Integrated Corridor | FBI | Law Enforcement Sensitive | 2025-04-14 | On Leave | 1001 | 101 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | ANA-2734 | Extended Series D | State Police | Confidential | 2022-09-25 | Inactive | 1002 | 102 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | ANA-2736 | Pilot Assessment | Federal Partner | Secret | 2023-02-09 | Active | 1003 | 103 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `PartnerAgency` table models the external and internal agencies that participate in the intelligence ecosystem. Its primary key is `agencyId`, and each row carries an `agencyIdentifier` (e.g., `Hinduja Group`), an `agencyName` such as `FSG Social Impact Advisors` or `Switch Card Services Ltd.`, and an `agencyType` column constraining the entity to `Federal`, `State`, `Local`, or `Private Sector`. The `jurisdictionRegion` column specifies the geographic area — `Southeastern Pennsylvania`, `Southern New Jersey`, `Northern Delaware`, or `Northeastern Maryland` — while `contactEmail` stores a point-of-contact address. Foreign keys `unitId` and `sharesDataWithAgencyId` link the agency to its hosting unit and to a self-referential partner agency, enabling the representation of data-sharing relationships between agencies.

**Table `PartnerAgency`**

| agencyId | agencyIdentifier | agencyName | agencyType | jurisdictionRegion | contactEmail | unitId | sharesDataWithAgencyId |
|---|---|---|---|---|---|---|---|
| 1000 | Hinduja Group | FSG Social Impact Advisors | Federal | Southeastern Pennsylvania | Christopher Wilson | 1000 | 1000 |
| 1001 | Arcimoto Inc. | Whirlpool Corporation | State | Southern New Jersey | Charles Larsen | 1001 | 1001 |
| 1002 | McDonnell Douglas | Education Writers Association | Local | Northern Delaware | Mary Alvarez | 1002 | 1002 |
| 1003 | Sa Proton World International N.V. | Switch Card Services Ltd. | Private Sector | Northeastern Maryland | April Snyder | 1003 | 1003 |

The `SubjectOfInterest` table captures the entities — individuals, organizations, groups, or other entities — that are the focus of intelligence analysis. Its primary key is `interestId`, and each row carries a `subjectIdentifier` (e.g., `SUB-2370`), a `subjectName` such as `Baseline Framework D` or `Primary Standard A`, and a `subjectType` column constraining the entity to `Individual`, `Organization`, `Group`, or `Entity`. The `riskLevel` column assigns a severity rating of `Low`, `Medium`, `High`, or `Critical`, while `lastKnownLocation` and `associatedThreats` columns provide contextual intelligence. Foreign keys `unitId` and `reportId` anchor the subject to its hosting unit and to its primary report.

**Table `SubjectOfInterest`**

| interestId | subjectIdentifier | subjectName | subjectType | riskLevel | lastKnownLocation | associatedThreats | unitId | reportId |
|---|---|---|---|---|---|---|---|---|
| 1 | SUB-2370 | Baseline Framework D | Individual | Low | pilot-last-26 | Terrorism | 1000 | 1 |
| 2 | SUB-2374 | Distributed Protocol | Organization | Medium | extended-last-27 | Drug Trafficking | 1001 | 2 |
| 3 | SUB-2378 | Adaptive Programme | Group | High | integrated-last-28 | Cyber Crime | 1002 | 3 |
| 4 | SUB-2382 | Primary Standard A | Entity | Critical | seasonal-last-29 | Human Trafficking | 1003 | 4 |

The `SuspiciousActivityReport` table, though not populated with sample rows in the reference data, represents a parallel class of reports focused on suspicious activities. It participates in the same join network as `IntelligenceReport`, linking to intelligence units, subjects of interest, intelligence reports, and partner agencies through its own set of foreign keys.

**Table `SuspiciousActivityReport`**

| id | sarIdentifier | reportDate | activityType | reviewStatus | privacyComplianceCheck | reviewingAnalystID | unitId | interestId | reportId | agencyId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | SAR-2786 | 2024-03-02T02:54:00 | Surveillance | Pending Review | false | REV-2363 | 1000 | 1 | 1000 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | SAR-2790 | 2025-08-13T09:11:00 | Procurement of Weapons | Approved for Dissemination | true | REV-2367 | 1001 | 2 | 1001 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | SAR-2794 | 2022-01-24T16:28:00 | Unusual Financial Activity | Rejected | false | REV-2371 | 1002 | 3 | 1002 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | SAR-2798 | 2023-06-08T23:45:00 | Behavioral Anomaly | Under Investigation | true | REV-2375 | 1003 | 4 | 1003 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

### Junction Tables and Many-to-Many Relationships

While the base tables carry direct foreign-key columns for their primary associations, the schema also defines eight junction tables that resolve many-to-many relationships between entities. These junction tables are the materialization of the domain's flexible association model, allowing a single report to be linked to multiple repositories, analysts, subjects, and agencies without denormalizing the base tables.

The `IntelligenceRepositoryIntelligenceReport` junction table links repositories to reports, enabling a report to be filed across multiple facilities and a facility to host multiple reports. Similarly, `IntelligenceRepositoryIntelligenceAnalyst` resolves the many-to-many relationship between repositories and analysts, allowing analysts to work across multiple facilities and facilities to employ multiple analysts.

**Table `IntelligenceRepositoryIntelligenceReport`**

| repositoryId | reportId |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |
**Table `IntelligenceRepositoryIntelligenceAnalyst`**

| repositoryId | analystId |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `IntelligenceUnitIntelligenceAnalyst` junction table links units to analysts, supporting the organizational reality that analysts may be assigned to multiple units and units may comprise multiple analysts. The `IntelligenceUnitIntelligenceReport` junction table performs the same function for the unit-report relationship.

**Table `IntelligenceUnitIntelligenceAnalyst`**

| unitId | analystId |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |
**Table `IntelligenceUnitIntelligenceReport`**

| unitId | reportId |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

The `IntelligenceAnalystIntelligenceReport` junction table enables analysts to author multiple reports and reports to be co-authored by multiple analysts. The `PartnerAgencyIntelligenceReport` and `PartnerAgencyIntelligenceAnalyst` junction tables extend this pattern to the partner agency dimension, allowing agencies to be associated with multiple reports and analysts.

**Table `IntelligenceAnalystIntelligenceReport`**

| analystId | reportId |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |
**Table `PartnerAgencyIntelligenceReport`**

| agencyId | reportId |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |
**Table `PartnerAgencyIntelligenceAnalyst`**

| agencyId | analystId |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

Finally, the `SubjectOfInterestIntelligenceReport` junction table links subjects to reports, supporting the scenario where a single subject is referenced across multiple reports and a single report covers multiple subjects.

**Table `SubjectOfInterestIntelligenceReport`**

| interestId | reportId |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

### View Layer: Reconstructing Domain Facts

The view layer materializes the normalized schema into queryable denormalized representations. Each view performs a specific join across the base and junction tables to answer a particular domain question. The following sections describe each view and illustrate its output with concrete rows from the data.

The view `v_intelligence_report_intelligence_repository` joins `IntelligenceReport` with `IntelligenceRepository` to answer the question: "Which repository hosts which report?" A row from this view might show report `REP-2544` (classification `Unclassified`, threat category `Terrorism`) hosted at repository `FAC-2066` (`Integrated Protocol A`, operational status `Active`, jurisdiction `Regional`).

**View `v_intelligence_report_intelligence_repository`**

```sql
CREATE VIEW v_intelligence_report_intelligence_repository AS
SELECT a.id, a.reportIdentifier, a.reportDate, a.classificationLevel, b.repositoryId AS repository_repositoryId, b.facilityIdentifier AS repository_facilityIdentifier, b.facilityName AS repository_facilityName
FROM IntelligenceReport a JOIN IntelligenceRepository b ON a.repositoryId = b.repositoryId;
```

| id | reportIdentifier | reportDate | classificationLevel | repository_repositoryId | repository_facilityIdentifier | repository_facilityName |
|---|---|---|---|---|---|---|
| 1000 | REP-2544 | 2024-03-02T02:54:00 | Unclassified | 100 | FAC-2066 | Integrated Protocol A |
| 1001 | REP-2545 | 2025-08-13T09:11:00 | Law Enforcement Sensitive | 101 | FAC-2067 | Extended Programme |
| 1002 | REP-2546 | 2022-01-24T16:28:00 | Confidential | 102 | FAC-2068 | Pilot Standard |
| 1003 | REP-2547 | 2023-06-08T23:45:00 | Secret | 103 | FAC-2069 | Baseline Framework D |

The view `v_intelligence_report_intelligence_analyst` joins `IntelligenceReport` with `IntelligenceAnalyst` to answer: "Which analyst authored which report?" A representative row shows report `REP-2544` authored by analyst `ANA-2730` (`Seasonal Survey`, affiliation `Philadelphia Police Department`, clearance `Public`, status `Active`).

**View `v_intelligence_report_intelligence_analyst`**

```sql
CREATE VIEW v_intelligence_report_intelligence_analyst AS
SELECT a.id, a.reportIdentifier, a.reportDate, a.classificationLevel, b.analystId AS analyst_analystId, b.analystBadgeNumber AS analyst_analystBadgeNumber, b.analystName AS analyst_analystName
FROM IntelligenceReport a JOIN IntelligenceAnalyst b ON a.analystId = b.analystId;
```

| id | reportIdentifier | reportDate | classificationLevel | analyst_analystId | analyst_analystBadgeNumber | analyst_analystName |
|---|---|---|---|---|---|---|
| 1000 | REP-2544 | 2024-03-02T02:54:00 | Unclassified | 1 | ANA-2730 | Seasonal Survey |
| 1001 | REP-2545 | 2025-08-13T09:11:00 | Law Enforcement Sensitive | 2 | ANA-2732 | Integrated Corridor |
| 1002 | REP-2546 | 2022-01-24T16:28:00 | Confidential | 3 | ANA-2734 | Extended Series D |
| 1003 | REP-2547 | 2023-06-08T23:45:00 | Secret | 4 | ANA-2736 | Pilot Assessment |

The view `v_intelligence_report_subject_of_interest` joins `IntelligenceReport` with `SubjectOfInterest` to answer: "Which subject is associated with which report?" A row from this view links report `REP-2544` to subject `SUB-2370` (`Baseline Framework D`, type `Individual`, risk level `Low`, associated threat `Terrorism`).

**View `v_intelligence_report_subject_of_interest`**

```sql
CREATE VIEW v_intelligence_report_subject_of_interest AS
SELECT a.id, a.reportIdentifier, a.reportDate, a.classificationLevel, b.interestId AS interest_interestId, b.subjectIdentifier AS interest_subjectIdentifier, b.subjectName AS interest_subjectName
FROM IntelligenceReport a JOIN SubjectOfInterest b ON a.interestId = b.interestId;
```

| id | reportIdentifier | reportDate | classificationLevel | interest_interestId | interest_subjectIdentifier | interest_subjectName |
|---|---|---|---|---|---|---|
| 1000 | REP-2544 | 2024-03-02T02:54:00 | Unclassified | 1 | SUB-2370 | Baseline Framework D |
| 1001 | REP-2545 | 2025-08-13T09:11:00 | Law Enforcement Sensitive | 2 | SUB-2374 | Distributed Protocol |
| 1002 | REP-2546 | 2022-01-24T16:28:00 | Confidential | 3 | SUB-2378 | Adaptive Programme |
| 1003 | REP-2547 | 2023-06-08T23:45:00 | Secret | 4 | SUB-2382 | Primary Standard A |

The view `v_intelligence_report_partner_agency` joins `IntelligenceReport` with `PartnerAgency` to answer: "Which partner agency originated which report?" A representative row shows report `REP-2544` originating from agency `Hinduja Group` (`FSG Social Impact Advisors`, type `Federal`, jurisdiction `Southeastern Pennsylvania`, contact `Christopher Wilson`).

**View `v_intelligence_report_partner_agency`**

```sql
CREATE VIEW v_intelligence_report_partner_agency AS
SELECT a.id, a.reportIdentifier, a.reportDate, a.classificationLevel, b.agencyId AS agency_agencyId, b.agencyIdentifier AS agency_agencyIdentifier, b.agencyName AS agency_agencyName
FROM IntelligenceReport a JOIN PartnerAgency b ON a.agencyId = b.agencyId;
```

| id | reportIdentifier | reportDate | classificationLevel | agency_agencyId | agency_agencyIdentifier | agency_agencyName |
|---|---|---|---|---|---|---|
| 1000 | REP-2544 | 2024-03-02T02:54:00 | Unclassified | 1000 | Hinduja Group | FSG Social Impact Advisors |
| 1001 | REP-2545 | 2025-08-13T09:11:00 | Law Enforcement Sensitive | 1001 | Arcimoto Inc. | Whirlpool Corporation |
| 1002 | REP-2546 | 2022-01-24T16:28:00 | Confidential | 1002 | McDonnell Douglas | Education Writers Association |
| 1003 | REP-2547 | 2023-06-08T23:45:00 | Secret | 1003 | Sa Proton World International N.V. | Switch Card Services Ltd. |

The view `v_intelligence_repository_intelligence_unit` joins `IntelligenceRepository` with `IntelligenceUnit` to answer: "Which unit governs which repository?" A row from this view links repository `FAC-2066` (`Integrated Protocol A`, status `Active`, jurisdiction `Regional`) to unit `16375765` (`Compact Series`, parent `Dow Chemical`, mission scope `All Crimes`, established `2024-07-11`).

**View `v_intelligence_repository_intelligence_unit`**

```sql
CREATE VIEW v_intelligence_repository_intelligence_unit AS
SELECT a.repositoryId, a.facilityIdentifier, a.facilityName, a.locationCity, b.id AS unit_id, b.unitCode AS unit_unitCode, b.unitName AS unit_unitName
FROM IntelligenceRepository a JOIN IntelligenceUnit b ON a.unitId = b.id;
```

| repositoryId | facilityIdentifier | facilityName | locationCity | unit_id | unit_unitCode | unit_unitName |
|---|---|---|---|---|---|---|
| 100 | FAC-2066 | Integrated Protocol A | seasonal-location-23 | 1000 | 16375765 | Compact Series |
| 101 | FAC-2067 | Extended Programme | regional-location-24 | 1001 | 43197173 | Legacy Assessment |
| 102 | FAC-2068 | Pilot Standard | legacy-location-25 | 1002 | 1186104 | Regional Survey A |
| 103 | FAC-2069 | Baseline Framework D | compact-location-26 | 1003 | 69419 | Seasonal Corridor |

The view `v_intelligence_repository_intelligence_report_detail` provides a detailed join of `IntelligenceRepository` with `IntelligenceReport`, answering: "What is the full detail of each report within its hosting repository?" A representative row shows repository `FAC-2066` (`Integrated Protocol A`, `Active`, `Regional`) hosting report `REP-2544` (`Unclassified`, `Terrorism`, `Draft`, `CHRIA`).

**View `v_intelligence_repository_intelligence_report_detail`**

```sql
CREATE VIEW v_intelligence_repository_intelligence_report_detail AS
SELECT a.repositoryId, a.facilityIdentifier, a.facilityName, b.id AS report_id, b.reportIdentifier AS report_reportIdentifier, b.reportDate AS report_reportDate
FROM IntelligenceRepository a
  JOIN IntelligenceRepositoryIntelligenceReport j ON j.repositoryId = a.repositoryId
  JOIN IntelligenceReport b ON b.id = j.reportId;
```

| repositoryId | facilityIdentifier | facilityName | report_id | report_reportIdentifier | report_reportDate |
|---|---|---|---|---|---|
| 100 | FAC-2066 | Integrated Protocol A | 1000 | REP-2544 | 2024-03-02T02:54:00 |
| 100 | FAC-2066 | Integrated Protocol A | 1001 | REP-2545 | 2025-08-13T09:11:00 |
| 101 | FAC-2067 | Extended Programme | 1001 | REP-2545 | 2025-08-13T09:11:00 |
| 101 | FAC-2067 | Extended Programme | 1002 | REP-2546 | 2022-01-24T16:28:00 |
| 102 | FAC-2068 | Pilot Standard | 1002 | REP-2546 | 2022-01-24T16:28:00 |
| 102 | FAC-2068 | Pilot Standard | 1003 | REP-2547 | 2023-06-08T23:45:00 |
| 103 | FAC-2069 | Baseline Framework D | 1003 | REP-2547 | 2023-06-08T23:45:00 |
| 103 | FAC-2069 | Baseline Framework D | 1000 | REP-2544 | 2024-03-02T02:54:00 |

The view `v_intelligence_repository_intelligence_analyst_detail` joins `IntelligenceRepository` with `IntelligenceAnalyst`, answering: "Which analysts are associated with which repository?" A row from this view links repository `FAC-2066` (`Integrated Protocol A`, `Active`) to analyst `ANA-2730` (`Seasonal Survey`, `Philadelphia Police Department`, clearance `Public`, status `Active`).

**View `v_intelligence_repository_intelligence_analyst_detail`**

```sql
CREATE VIEW v_intelligence_repository_intelligence_analyst_detail AS
SELECT a.repositoryId, a.facilityIdentifier, a.facilityName, b.analystId AS analyst_analystId, b.analystBadgeNumber AS analyst_analystBadgeNumber, b.analystName AS analyst_analystName
FROM IntelligenceRepository a
  JOIN IntelligenceRepositoryIntelligenceAnalyst j ON j.repositoryId = a.repositoryId
  JOIN IntelligenceAnalyst b ON b.analystId = j.analystId;
```

| repositoryId | facilityIdentifier | facilityName | analyst_analystId | analyst_analystBadgeNumber | analyst_analystName |
|---|---|---|---|---|---|
| 100 | FAC-2066 | Integrated Protocol A | 1 | ANA-2730 | Seasonal Survey |
| 100 | FAC-2066 | Integrated Protocol A | 2 | ANA-2732 | Integrated Corridor |
| 101 | FAC-2067 | Extended Programme | 2 | ANA-2732 | Integrated Corridor |
| 101 | FAC-2067 | Extended Programme | 3 | ANA-2734 | Extended Series D |
| 102 | FAC-2068 | Pilot Standard | 3 | ANA-2734 | Extended Series D |
| 102 | FAC-2068 | Pilot Standard | 4 | ANA-2736 | Pilot Assessment |
| 103 | FAC-2069 | Baseline Framework D | 4 | ANA-2736 | Pilot Assessment |
| 103 | FAC-2069 | Baseline Framework D | 1 | ANA-2730 | Seasonal Survey |

The view `v_intelligence_unit_intelligence_repository` joins `IntelligenceUnit` with `IntelligenceRepository`, answering: "Which repositories are governed by which unit?" A representative row shows unit `16375765` (`Compact Series`, `Dow Chemical`, `All Crimes`) governing repository `FAC-2066` (`Integrated Protocol A`, `Active`, `Regional`).

**View `v_intelligence_unit_intelligence_repository`**

```sql
CREATE VIEW v_intelligence_unit_intelligence_repository AS
SELECT a.id, a.unitCode, a.unitName, a.parentOrganization, b.repositoryId AS repository_repositoryId, b.facilityIdentifier AS repository_facilityIdentifier, b.facilityName AS repository_facilityName
FROM IntelligenceUnit a JOIN IntelligenceRepository b ON a.repositoryId = b.repositoryId;
```

| id | unitCode | unitName | parentOrganization | repository_repositoryId | repository_facilityIdentifier | repository_facilityName |
|---|---|---|---|---|---|---|
| 1000 | 16375765 | Compact Series | Dow Chemical | 100 | FAC-2066 | Integrated Protocol A |
| 1001 | 43197173 | Legacy Assessment | LDAP First Name Field | 101 | FAC-2067 | Extended Programme |
| 1002 | 1186104 | Regional Survey A | Standard Chartered | 102 | FAC-2068 | Pilot Standard |
| 1003 | 69419 | Seasonal Corridor | The Library of Congress | 103 | FAC-2069 | Baseline Framework D |

The view `v_intelligence_unit_intelligence_analyst_detail` joins `IntelligenceUnit` with `IntelligenceAnalyst`, answering: "Which analysts belong to which unit?" A row from this view links unit `16375765` (`Compact Series`, `All Crimes`) to analyst `ANA-2730` (`Seasonal Survey`, `Philadelphia Police Department`, clearance `Public`, status `Active`).

**View `v_intelligence_unit_intelligence_analyst_detail`**

```sql
CREATE VIEW v_intelligence_unit_intelligence_analyst_detail AS
SELECT a.id, a.unitCode, a.unitName, b.analystId AS analyst_analystId, b.analystBadgeNumber AS analyst_analystBadgeNumber, b.analystName AS analyst_analystName
FROM IntelligenceUnit a
  JOIN IntelligenceUnitIntelligenceAnalyst j ON j.unitId = a.id
  JOIN IntelligenceAnalyst b ON b.analystId = j.analystId;
```

| id | unitCode | unitName | analyst_analystId | analyst_analystBadgeNumber | analyst_analystName |
|---|---|---|---|---|---|
| 1000 | 16375765 | Compact Series | 1 | ANA-2730 | Seasonal Survey |
| 1000 | 16375765 | Compact Series | 2 | ANA-2732 | Integrated Corridor |
| 1001 | 43197173 | Legacy Assessment | 2 | ANA-2732 | Integrated Corridor |
| 1001 | 43197173 | Legacy Assessment | 3 | ANA-2734 | Extended Series D |
| 1002 | 1186104 | Regional Survey A | 3 | ANA-2734 | Extended Series D |
| 1002 | 1186104 | Regional Survey A | 4 | ANA-2736 | Pilot Assessment |
| 1003 | 69419 | Seasonal Corridor | 4 | ANA-2736 | Pilot Assessment |
| 1003 | 69419 | Seasonal Corridor | 1 | ANA-2730 | Seasonal Survey |

The view `v_intelligence_unit_partner_agency` joins `IntelligenceUnit` with `PartnerAgency`, answering: "Which partner agencies are associated with which unit?" A representative row shows unit `16375765` (`Compact Series`, `All Crimes`) associated with agency `Hinduja Group` (`FSG Social Impact Advisors`, `Federal`, `Southeastern Pennsylvania`).

**View `v_intelligence_unit_partner_agency`**

```sql
CREATE VIEW v_intelligence_unit_partner_agency AS
SELECT a.id, a.unitCode, a.unitName, a.parentOrganization, b.agencyId AS agency_agencyId, b.agencyIdentifier AS agency_agencyIdentifier, b.agencyName AS agency_agencyName
FROM IntelligenceUnit a JOIN PartnerAgency b ON a.agencyId = b.agencyId;
```

| id | unitCode | unitName | parentOrganization | agency_agencyId | agency_agencyIdentifier | agency_agencyName |
|---|---|---|---|---|---|---|
| 1000 | 16375765 | Compact Series | Dow Chemical | 1000 | Hinduja Group | FSG Social Impact Advisors |
| 1001 | 43197173 | Legacy Assessment | LDAP First Name Field | 1001 | Arcimoto Inc. | Whirlpool Corporation |
| 1002 | 1186104 | Regional Survey A | Standard Chartered | 1002 | McDonnell Douglas | Education Writers Association |
| 1003 | 69419 | Seasonal Corridor | The Library of Congress | 1003 | Sa Proton World International N.V. | Switch Card Services Ltd. |

The view `v_intelligence_unit_intelligence_report_detail` joins `IntelligenceUnit` with `IntelligenceReport`, answering: "Which reports are produced under which unit?" A row from this view links unit `16375765` (`Compact Series`, `All Crimes`) to report `REP-2544` (`Unclassified`, `Terrorism`, `Draft`, `CHRIA`).

**View `v_intelligence_unit_intelligence_report_detail`**

```sql
CREATE VIEW v_intelligence_unit_intelligence_report_detail AS
SELECT a.id, a.unitCode, a.unitName, b.id AS report_id, b.reportIdentifier AS report_reportIdentifier, b.reportDate AS report_reportDate
FROM IntelligenceUnit a
  JOIN IntelligenceUnitIntelligenceReport j ON j.unitId = a.id
  JOIN IntelligenceReport b ON b.id = j.reportId;
```

| id | unitCode | unitName | report_id | report_reportIdentifier | report_reportDate |
|---|---|---|---|---|---|
| 1000 | 16375765 | Compact Series | 1000 | REP-2544 | 2024-03-02T02:54:00 |
| 1000 | 16375765 | Compact Series | 1001 | REP-2545 | 2025-08-13T09:11:00 |
| 1001 | 43197173 | Legacy Assessment | 1001 | REP-2545 | 2025-08-13T09:11:00 |
| 1001 | 43197173 | Legacy Assessment | 1002 | REP-2546 | 2022-01-24T16:28:00 |
| 1002 | 1186104 | Regional Survey A | 1002 | REP-2546 | 2022-01-24T16:28:00 |
| 1002 | 1186104 | Regional Survey A | 1003 | REP-2547 | 2023-06-08T23:45:00 |
| 1003 | 69419 | Seasonal Corridor | 1003 | REP-2547 | 2023-06-08T23:45:00 |
| 1003 | 69419 | Seasonal Corridor | 1000 | REP-2544 | 2024-03-02T02:54:00 |

The view `v_intelligence_analyst_intelligence_unit` joins `IntelligenceAnalyst` with `IntelligenceUnit`, answering: "Which unit does each analyst belong to?" A representative row shows analyst `ANA-2730` (`Seasonal Survey`, `Philadelphia Police Department`, clearance `Public`) belonging to unit `16375765` (`Compact Series`, `Dow Chemical`, `All Crimes`).

**View `v_intelligence_analyst_intelligence_unit`**

```sql
CREATE VIEW v_intelligence_analyst_intelligence_unit AS
SELECT a.analystId, a.analystBadgeNumber, a.analystName, a.agencyAffiliation, b.id AS unit_id, b.unitCode AS unit_unitCode, b.unitName AS unit_unitName
FROM IntelligenceAnalyst a JOIN IntelligenceUnit b ON a.unitId = b.id;
```

| analystId | analystBadgeNumber | analystName | agencyAffiliation | unit_id | unit_unitCode | unit_unitName |
|---|---|---|---|---|---|---|
| 1 | ANA-2730 | Seasonal Survey | Philadelphia Police Department | 1000 | 16375765 | Compact Series |
| 2 | ANA-2732 | Integrated Corridor | FBI | 1001 | 43197173 | Legacy Assessment |
| 3 | ANA-2734 | Extended Series D | State Police | 1002 | 1186104 | Regional Survey A |
| 4 | ANA-2736 | Pilot Assessment | Federal Partner | 1003 | 69419 | Seasonal Corridor |

The view `v_intelligence_analyst_intelligence_repository` joins `IntelligenceAnalyst` with `IntelligenceRepository`, answering: "Which repository is each analyst associated with?" A row from this view links analyst `ANA-2730` (`Seasonal Survey`, `Public`, `Active`) to repository `FAC-2066` (`Integrated Protocol A`, `Active`, `Regional`).

**View `v_intelligence_analyst_intelligence_repository`**

```sql
CREATE VIEW v_intelligence_analyst_intelligence_repository AS
SELECT a.analystId, a.analystBadgeNumber, a.analystName, a.agencyAffiliation, b.repositoryId AS repository_repositoryId, b.facilityIdentifier AS repository_facilityIdentifier, b.facilityName AS repository_facilityName
FROM IntelligenceAnalyst a JOIN IntelligenceRepository b ON a.repositoryId = b.repositoryId;
```

| analystId | analystBadgeNumber | analystName | agencyAffiliation | repository_repositoryId | repository_facilityIdentifier | repository_facilityName |
|---|---|---|---|---|---|---|
| 1 | ANA-2730 | Seasonal Survey | Philadelphia Police Department | 100 | FAC-2066 | Integrated Protocol A |
| 2 | ANA-2732 | Integrated Corridor | FBI | 101 | FAC-2067 | Extended Programme |
| 3 | ANA-2734 | Extended Series D | State Police | 102 | FAC-2068 | Pilot Standard |
| 4 | ANA-2736 | Pilot Assessment | Federal Partner | 103 | FAC-2069 | Baseline Framework D |

The view `v_intelligence_analyst_intelligence_report_detail` joins `IntelligenceAnalyst` with `IntelligenceReport`, answering: "Which reports has each analyst produced?" A representative row shows analyst `ANA-2730` (`Seasonal Survey`, `Public`, `Active`) having produced report `REP-2544` (`Unclassified`, `Terrorism`, `Draft`, `CHRIA`).

**View `v_intelligence_analyst_intelligence_report_detail`**

```sql
CREATE VIEW v_intelligence_analyst_intelligence_report_detail AS
SELECT a.analystId, a.analystBadgeNumber, a.analystName, b.id AS report_id, b.reportIdentifier AS report_reportIdentifier, b.reportDate AS report_reportDate
FROM IntelligenceAnalyst a
  JOIN IntelligenceAnalystIntelligenceReport j ON j.analystId = a.analystId
  JOIN IntelligenceReport b ON b.id = j.reportId;
```

| analystId | analystBadgeNumber | analystName | report_id | report_reportIdentifier | report_reportDate |
|---|---|---|---|---|---|
| 1 | ANA-2730 | Seasonal Survey | 1000 | REP-2544 | 2024-03-02T02:54:00 |
| 1 | ANA-2730 | Seasonal Survey | 1001 | REP-2545 | 2025-08-13T09:11:00 |
| 2 | ANA-2732 | Integrated Corridor | 1001 | REP-2545 | 2025-08-13T09:11:00 |
| 2 | ANA-2732 | Integrated Corridor | 1002 | REP-2546 | 2022-01-24T16:28:00 |
| 3 | ANA-2734 | Extended Series D | 1002 | REP-2546 | 2022-01-24T16:28:00 |
| 3 | ANA-2734 | Extended Series D | 1003 | REP-2547 | 2023-06-08T23:45:00 |
| 4 | ANA-2736 | Pilot Assessment | 1003 | REP-2547 | 2023-06-08T23:45:00 |
| 4 | ANA-2736 | Pilot Assessment | 1000 | REP-2544 | 2024-03-02T02:54:00 |

The view `v_intelligence_analyst_partner_agency` joins `IntelligenceAnalyst` with `PartnerAgency`, answering: "Which partner agency is each analyst affiliated with?" A row from this view links analyst `ANA-2730` (`Seasonal Survey`, `Philadelphia Police Department`, `Public`) to agency `Hinduja Group` (`FSG Social Impact Advisors`, `Federal`, `Southeastern Pennsylvania`).

**View `v_intelligence_analyst_partner_agency`**

```sql
CREATE VIEW v_intelligence_analyst_partner_agency AS
SELECT a.analystId, a.analystBadgeNumber, a.analystName, a.agencyAffiliation, b.agencyId AS agency_agencyId, b.agencyIdentifier AS agency_agencyIdentifier, b.agencyName AS agency_agencyName
FROM IntelligenceAnalyst a JOIN PartnerAgency b ON a.agencyId = b.agencyId;
```

| analystId | analystBadgeNumber | analystName | agencyAffiliation | agency_agencyId | agency_agencyIdentifier | agency_agencyName |
|---|---|---|---|---|---|---|
| 1 | ANA-2730 | Seasonal Survey | Philadelphia Police Department | 1000 | Hinduja Group | FSG Social Impact Advisors |
| 2 | ANA-2732 | Integrated Corridor | FBI | 1001 | Arcimoto Inc. | Whirlpool Corporation |
| 3 | ANA-2734 | Extended Series D | State Police | 1002 | McDonnell Douglas | Education Writers Association |
| 4 | ANA-2736 | Pilot Assessment | Federal Partner | 1003 | Sa Proton World International N.V. | Switch Card Services Ltd. |

The view `v_partner_agency_intelligence_unit` joins `PartnerAgency` with `IntelligenceUnit`, answering: "Which unit is each partner agency associated with?" A representative row shows agency `Hinduja Group` (`FSG Social Impact Advisors`, `Federal`, `Southeastern Pennsylvania`) associated with unit `16375765` (`Compact Series`, `Dow Chemical`, `All Crimes`).

**View `v_partner_agency_intelligence_unit`**

```sql
CREATE VIEW v_partner_agency_intelligence_unit AS
SELECT a.agencyId, a.agencyIdentifier, a.agencyName, a.agencyType, b.id AS unit_id, b.unitCode AS unit_unitCode, b.unitName AS unit_unitName
FROM PartnerAgency a JOIN IntelligenceUnit b ON a.unitId = b.id;
```

| agencyId | agencyIdentifier | agencyName | agencyType | unit_id | unit_unitCode | unit_unitName |
|---|---|---|---|---|---|---|
| 1000 | Hinduja Group | FSG Social Impact Advisors | Federal | 1000 | 16375765 | Compact Series |
| 1001 | Arcimoto Inc. | Whirlpool Corporation | State | 1001 | 43197173 | Legacy Assessment |
| 1002 | McDonnell Douglas | Education Writers Association | Local | 1002 | 1186104 | Regional Survey A |
| 1003 | Sa Proton World International N.V. | Switch Card Services Ltd. | Private Sector | 1003 | 69419 | Seasonal Corridor |

The view `v_partner_agency_intelligence_report_detail` joins `PartnerAgency` with `IntelligenceReport`, answering: "Which reports has each partner agency originated?" A row from this view links agency `Hinduja Group` (`FSG Social Impact Advisors`, `Federal`) to report `REP-2544` (`Unclassified`, `Terrorism`, `Draft`, `CHRIA`).

**View `v_partner_agency_intelligence_report_detail`**

```sql
CREATE VIEW v_partner_agency_intelligence_report_detail AS
SELECT a.agencyId, a.agencyIdentifier, a.agencyName, b.id AS report_id, b.reportIdentifier AS report_reportIdentifier, b.reportDate AS report_reportDate
FROM PartnerAgency a
  JOIN PartnerAgencyIntelligenceReport j ON j.agencyId = a.agencyId
  JOIN IntelligenceReport b ON b.id = j.reportId;
```

| agencyId | agencyIdentifier | agencyName | report_id | report_reportIdentifier | report_reportDate |
|---|---|---|---|---|---|
| 1000 | Hinduja Group | FSG Social Impact Advisors | 1000 | REP-2544 | 2024-03-02T02:54:00 |
| 1000 | Hinduja Group | FSG Social Impact Advisors | 1001 | REP-2545 | 2025-08-13T09:11:00 |
| 1001 | Arcimoto Inc. | Whirlpool Corporation | 1001 | REP-2545 | 2025-08-13T09:11:00 |
| 1001 | Arcimoto Inc. | Whirlpool Corporation | 1002 | REP-2546 | 2022-01-24T16:28:00 |
| 1002 | McDonnell Douglas | Education Writers Association | 1002 | REP-2546 | 2022-01-24T16:28:00 |
| 1002 | McDonnell Douglas | Education Writers Association | 1003 | REP-2547 | 2023-06-08T23:45:00 |
| 1003 | Sa Proton World International N.V. | Switch Card Services Ltd. | 1003 | REP-2547 | 2023-06-08T23:45:00 |
| 1003 | Sa Proton World International N.V. | Switch Card Services Ltd. | 1000 | REP-2544 | 2024-03-02T02:54:00 |

The view `v_partner_agency_intelligence_analyst_detail` joins `PartnerAgency` with `IntelligenceAnalyst`, answering: "Which analysts are associated with each partner agency?" A representative row shows agency `Hinduja Group` (`FSG Social Impact Advisors`, `Federal`) associated with analyst `ANA-2730` (`Seasonal Survey`, `Philadelphia Police Department`, `Public`, `Active`).

**View `v_partner_agency_intelligence_analyst_detail`**

```sql
CREATE VIEW v_partner_agency_intelligence_analyst_detail AS
SELECT a.agencyId, a.agencyIdentifier, a.agencyName, b.analystId AS analyst_analystId, b.analystBadgeNumber AS analyst_analystBadgeNumber, b.analystName AS analyst_analystName
FROM PartnerAgency a
  JOIN PartnerAgencyIntelligenceAnalyst j ON j.agencyId = a.agencyId
  JOIN IntelligenceAnalyst b ON b.analystId = j.analystId;
```

| agencyId | agencyIdentifier | agencyName | analyst_analystId | analyst_analystBadgeNumber | analyst_analystName |
|---|---|---|---|---|---|
| 1000 | Hinduja Group | FSG Social Impact Advisors | 1 | ANA-2730 | Seasonal Survey |
| 1000 | Hinduja Group | FSG Social Impact Advisors | 2 | ANA-2732 | Integrated Corridor |
| 1001 | Arcimoto Inc. | Whirlpool Corporation | 2 | ANA-2732 | Integrated Corridor |
| 1001 | Arcimoto Inc. | Whirlpool Corporation | 3 | ANA-2734 | Extended Series D |
| 1002 | McDonnell Douglas | Education Writers Association | 3 | ANA-2734 | Extended Series D |
| 1002 | McDonnell Douglas | Education Writers Association | 4 | ANA-2736 | Pilot Assessment |
| 1003 | Sa Proton World International N.V. | Switch Card Services Ltd. | 4 | ANA-2736 | Pilot Assessment |
| 1003 | Sa Proton World International N.V. | Switch Card Services Ltd. | 1 | ANA-2730 | Seasonal Survey |

The view `v_partner_agency_partner_agency` joins `PartnerAgency` with itself via the `sharesDataWithAgencyId` self-reference, answering: "Which partner agencies share data with which other agencies?" A row from this view shows agency `Hinduja Group` (`FSG Social Impact Advisors`, `Federal`) sharing data with agency `Hinduja Group` itself, indicating a self-referential data-sharing relationship.

**View `v_partner_agency_partner_agency`**

```sql
CREATE VIEW v_partner_agency_partner_agency AS
SELECT a.agencyId, a.agencyIdentifier, a.agencyName, a.agencyType, b.agencyId AS agency_agencyId, b.agencyIdentifier AS agency_agencyIdentifier, b.agencyName AS agency_agencyName
FROM PartnerAgency a JOIN PartnerAgency b ON a.sharesDataWithAgencyId = b.agencyId;
```

| agencyId | agencyIdentifier | agencyName | agencyType | agency_agencyId | agency_agencyIdentifier | agency_agencyName |
|---|---|---|---|---|---|---|
| 1000 | Hinduja Group | FSG Social Impact Advisors | Federal | 1000 | Hinduja Group | FSG Social Impact Advisors |
| 1001 | Arcimoto Inc. | Whirlpool Corporation | State | 1001 | Arcimoto Inc. | Whirlpool Corporation |
| 1002 | McDonnell Douglas | Education Writers Association | Local | 1002 | McDonnell Douglas | Education Writers Association |
| 1003 | Sa Proton World International N.V. | Switch Card Services Ltd. | Private Sector | 1003 | Sa Proton World International N.V. | Switch Card Services Ltd. |

The view `v_subject_of_interest_intelligence_unit` joins `SubjectOfInterest` with `IntelligenceUnit`, answering: "Which unit is each subject of interest associated with?" A representative row shows subject `SUB-2370` (`Baseline Framework D`, `Individual`, risk `Low`, threat `Terrorism`) associated with unit `16375765` (`Compact Series`, `All Crimes`).

**View `v_subject_of_interest_intelligence_unit`**

```sql
CREATE VIEW v_subject_of_interest_intelligence_unit AS
SELECT a.interestId, a.subjectIdentifier, a.subjectName, a.subjectType, b.id AS unit_id, b.unitCode AS unit_unitCode, b.unitName AS unit_unitName
FROM SubjectOfInterest a JOIN IntelligenceUnit b ON a.unitId = b.id;
```

| interestId | subjectIdentifier | subjectName | subjectType | unit_id | unit_unitCode | unit_unitName |
|---|---|---|---|---|---|---|
| 1 | SUB-2370 | Baseline Framework D | Individual | 1000 | 16375765 | Compact Series |
| 2 | SUB-2374 | Distributed Protocol | Organization | 1001 | 43197173 | Legacy Assessment |
| 3 | SUB-2378 | Adaptive Programme | Group | 1002 | 1186104 | Regional Survey A |
| 4 | SUB-2382 | Primary Standard A | Entity | 1003 | 69419 | Seasonal Corridor |

The view `v_subject_of_interest_intelligence_report_detail` joins `SubjectOfInterest` with `IntelligenceReport`, answering: "Which reports reference each subject of interest?" A row from this view links subject `SUB-2370` (`Baseline Framework D`, `Individual`, `Low`) to report `REP-2544` (`Unclassified`, `Terrorism`, `Draft`, `CHRIA`).

**View `v_subject_of_interest_intelligence_report_detail`**

```sql
CREATE VIEW v_subject_of_interest_intelligence_report_detail AS
SELECT a.interestId, a.subjectIdentifier, a.subjectName, b.id AS report_id, b.reportIdentifier AS report_reportIdentifier, b.reportDate AS report_reportDate
FROM SubjectOfInterest a
  JOIN SubjectOfInterestIntelligenceReport j ON j.interestId = a.interestId
  JOIN IntelligenceReport b ON b.id = j.reportId;
```

| interestId | subjectIdentifier | subjectName | report_id | report_reportIdentifier | report_reportDate |
|---|---|---|---|---|---|
| 1 | SUB-2370 | Baseline Framework D | 1000 | REP-2544 | 2024-03-02T02:54:00 |
| 1 | SUB-2370 | Baseline Framework D | 1001 | REP-2545 | 2025-08-13T09:11:00 |
| 2 | SUB-2374 | Distributed Protocol | 1001 | REP-2545 | 2025-08-13T09:11:00 |
| 2 | SUB-2374 | Distributed Protocol | 1002 | REP-2546 | 2022-01-24T16:28:00 |
| 3 | SUB-2378 | Adaptive Programme | 1002 | REP-2546 | 2022-01-24T16:28:00 |
| 3 | SUB-2378 | Adaptive Programme | 1003 | REP-2547 | 2023-06-08T23:45:00 |
| 4 | SUB-2382 | Primary Standard A | 1003 | REP-2547 | 2023-06-08T23:45:00 |
| 4 | SUB-2382 | Primary Standard A | 1000 | REP-2544 | 2024-03-02T02:54:00 |

The view `v_subject_of_interest_suspicious_activity_report` joins `SubjectOfInterest` with `SuspiciousActivityReport`, answering: "Which suspicious activity reports are associated with each subject?" This view enables cross-referencing between standard intelligence reports and suspicious activity reports through their shared subject associations.

**View `v_subject_of_interest_suspicious_activity_report`**

```sql
CREATE VIEW v_subject_of_interest_suspicious_activity_report AS
SELECT a.interestId, a.subjectIdentifier, a.subjectName, a.subjectType, b.id AS report_id, b.sarIdentifier AS report_sarIdentifier, b.reportDate AS report_reportDate
FROM SubjectOfInterest a JOIN SuspiciousActivityReport b ON a.reportId = b.id;
```

| interestId | subjectIdentifier | subjectName | subjectType | report_id | report_sarIdentifier | report_reportDate |
|---|---|---|---|---|---|---|
| 1 | SUB-2370 | Baseline Framework D | Individual | 1 | SAR-2786 | 2024-03-02T02:54:00 |
| 2 | SUB-2374 | Distributed Protocol | Organization | 2 | SAR-2790 | 2025-08-13T09:11:00 |
| 3 | SUB-2378 | Adaptive Programme | Group | 3 | SAR-2794 | 2022-01-24T16:28:00 |
| 4 | SUB-2382 | Primary Standard A | Entity | 4 | SAR-2798 | 2023-06-08T23:45:00 |

The view `v_suspicious_activity_report_intelligence_unit` joins `SuspiciousActivityReport` with `IntelligenceUnit`, answering: "Which unit is each suspicious activity report associated with?" This view reconstructs the organizational context for suspicious activity reports.

**View `v_suspicious_activity_report_intelligence_unit`**

```sql
CREATE VIEW v_suspicious_activity_report_intelligence_unit AS
SELECT a.id, a.sarIdentifier, a.reportDate, a.activityType, b.id AS unit_id, b.unitCode AS unit_unitCode, b.unitName AS unit_unitName
FROM SuspiciousActivityReport a JOIN IntelligenceUnit b ON a.unitId = b.id;
```

| id | sarIdentifier | reportDate | activityType | unit_id | unit_unitCode | unit_unitName |
|---|---|---|---|---|---|---|
| 1 | SAR-2786 | 2024-03-02T02:54:00 | Surveillance | 1000 | 16375765 | Compact Series |
| 2 | SAR-2790 | 2025-08-13T09:11:00 | Procurement of Weapons | 1001 | 43197173 | Legacy Assessment |
| 3 | SAR-2794 | 2022-01-24T16:28:00 | Unusual Financial Activity | 1002 | 1186104 | Regional Survey A |
| 4 | SAR-2798 | 2023-06-08T23:45:00 | Behavioral Anomaly | 1003 | 69419 | Seasonal Corridor |

The view `v_suspicious_activity_report_subject_of_interest` joins `SuspiciousActivityReport` with `SubjectOfInterest`, answering: "Which subject is each suspicious activity report about?" This view links suspicious activity reports to their subjects of interest.

**View `v_suspicious_activity_report_subject_of_interest`**

```sql
CREATE VIEW v_suspicious_activity_report_subject_of_interest AS
SELECT a.id, a.sarIdentifier, a.reportDate, a.activityType, b.interestId AS interest_interestId, b.subjectIdentifier AS interest_subjectIdentifier, b.subjectName AS interest_subjectName
FROM SuspiciousActivityReport a JOIN SubjectOfInterest b ON a.interestId = b.interestId;
```

| id | sarIdentifier | reportDate | activityType | interest_interestId | interest_subjectIdentifier | interest_subjectName |
|---|---|---|---|---|---|---|
| 1 | SAR-2786 | 2024-03-02T02:54:00 | Surveillance | 1 | SUB-2370 | Baseline Framework D |
| 2 | SAR-2790 | 2025-08-13T09:11:00 | Procurement of Weapons | 2 | SUB-2374 | Distributed Protocol |
| 3 | SAR-2794 | 2022-01-24T16:28:00 | Unusual Financial Activity | 3 | SUB-2378 | Adaptive Programme |
| 4 | SAR-2798 | 2023-06-08T23:45:00 | Behavioral Anomaly | 4 | SUB-2382 | Primary Standard A |

The view `v_suspicious_activity_report_intelligence_report` joins `SuspiciousActivityReport` with `IntelligenceReport`, answering: "Which standard intelligence reports are related to each suspicious activity report?" This view enables cross-referencing between the two report types.

**View `v_suspicious_activity_report_intelligence_report`**

```sql
CREATE VIEW v_suspicious_activity_report_intelligence_report AS
SELECT a.id, a.sarIdentifier, a.reportDate, a.activityType, b.id AS report_id, b.reportIdentifier AS report_reportIdentifier, b.reportDate AS report_reportDate
FROM SuspiciousActivityReport a JOIN IntelligenceReport b ON a.reportId = b.id;
```

| id | sarIdentifier | reportDate | activityType | report_id | report_reportIdentifier | report_reportDate |
|---|---|---|---|---|---|---|
| 1 | SAR-2786 | 2024-03-02T02:54:00 | Surveillance | 1000 | REP-2544 | 2024-03-02T02:54:00 |
| 2 | SAR-2790 | 2025-08-13T09:11:00 | Procurement of Weapons | 1001 | REP-2545 | 2025-08-13T09:11:00 |
| 3 | SAR-2794 | 2022-01-24T16:28:00 | Unusual Financial Activity | 1002 | REP-2546 | 2022-01-24T16:28:00 |
| 4 | SAR-2798 | 2023-06-08T23:45:00 | Behavioral Anomaly | 1003 | REP-2547 | 2023-06-08T23:45:00 |

The view `v_suspicious_activity_report_partner_agency` joins `SuspiciousActivityReport` with `PartnerAgency`, answering: "Which partner agency originated each suspicious activity report?" This view reconstructs the agency context for suspicious activity reports.

**View `v_suspicious_activity_report_partner_agency`**

```sql
CREATE VIEW v_suspicious_activity_report_partner_agency AS
SELECT a.id, a.sarIdentifier, a.reportDate, a.activityType, b.agencyId AS agency_agencyId, b.agencyIdentifier AS agency_agencyIdentifier, b.agencyName AS agency_agencyName
FROM SuspiciousActivityReport a JOIN PartnerAgency b ON a.agencyId = b.agencyId;
```

| id | sarIdentifier | reportDate | activityType | agency_agencyId | agency_agencyIdentifier | agency_agencyName |
|---|---|---|---|---|---|---|
| 1 | SAR-2786 | 2024-03-02T02:54:00 | Surveillance | 1000 | Hinduja Group | FSG Social Impact Advisors |
| 2 | SAR-2790 | 2025-08-13T09:11:00 | Procurement of Weapons | 1001 | Arcimoto Inc. | Whirlpool Corporation |
| 3 | SAR-2794 | 2022-01-24T16:28:00 | Unusual Financial Activity | 1002 | McDonnell Douglas | Education Writers Association |
| 4 | SAR-2798 | 2023-06-08T23:45:00 | Behavioral Anomaly | 1003 | Sa Proton World International N.V. | Switch Card Services Ltd. |

### Synthesis

The intelligence information system's relational schema is a carefully layered model that separates entity definition from relationship resolution. The seven base tables — `IntelligenceReport`, `IntelligenceRepository`, `IntelligenceUnit`, `IntelligenceAnalyst`, `PartnerAgency`, `SubjectOfInterest`, and `SuspiciousActivityReport` — capture the core domain entities with their attributes and primary foreign-key associations. The eight junction tables — `IntelligenceRepositoryIntelligenceReport`, `IntelligenceRepositoryIntelligenceAnalyst`, `IntelligenceUnitIntelligenceAnalyst`, `IntelligenceUnitIntelligenceReport`, `IntelligenceAnalystIntelligenceReport`, `PartnerAgencyIntelligenceReport`, `PartnerAgencyIntelligenceAnalyst`, and `SubjectOfInterestIntelligenceReport` — resolve the many-to-many relationships that the base tables' direct foreign keys cannot express alone. The thirty views — from `v_intelligence_report_intelligence_repository` through `v_suspicious_activity_report_partner_agency` — materialize the normalized schema into queryable denormalized representations, each answering a specific domain question by joining the appropriate base and junction tables. Together, this three-tier architecture — base tables, junction tables, and views — provides both the data integrity of a normalized relational model and the query convenience of denormalized views, enabling analysts and systems to reconstruct any domain fact from the underlying normalized rows.