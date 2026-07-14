Intelligence operations depend on a structured ecosystem of reports, repositories, analysts, and partner agencies working in concert to identify, assess, and mitigate threats. Each intelligence report originates within a specific facility, is authored by a designated analyst, and may concern one or more subjects of interest. The records below capture the full lifecycle of these artifacts—from initial draft through dissemination—while cross-referencing the organizational units, partner agencies, and suspicious activity reports that contextualize each finding. Understanding how these entities interlock is essential for practitioners who must trace a report's provenance, verify its chain of custody, and coordinate with external stakeholders.

## Intelligence Reports

The core artifact of any intelligence operation is the intelligence report, a structured document that captures findings, assessments, and recommendations. Each report carries a unique identifier, a classification level, and a threat category that determines its handling requirements.

**Table `IntelligenceReport`**

| id | reportIdentifier | reportDate | classificationLevel | threatCategory | status | complianceStandard | repositoryId | analystId | interestId | agencyId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | REP-2544 | 2024-03-02T02:54:00 | Unclassified | Terrorism | Draft | CHRIA | 100 | 1 | 1 | 1000 |
| 1001 | REP-2545 | 2025-08-13T09:11:00 | Law Enforcement Sensitive | Homegrown Violent Extremist | Under Review | 28 CFR Part 23 | 101 | 2 | 2 | 1001 |
| 1002 | REP-2546 | 2022-01-24T16:28:00 | Confidential | Lone Offender | Approved | CHRIA | 102 | 3 | 3 | 1002 |
| 1003 | REP-2547 | 2023-06-08T23:45:00 | Secret | Drug Trafficking | Disseminated | 28 CFR Part 23 | 103 | 4 | 4 | 1003 |

Report REP-2544, classified as Unclassified and categorized under Terrorism, remains in Draft status and adheres to the CHRIA compliance standard. It was generated on 2024-03-02 and is associated with repository 100, analyst 1, subject 1, and agency 1000. By contrast, REP-2545 carries a Law Enforcement Sensitive classification, targets the Homegrown Violent Extremist threat category, and is currently Under Review under 28 CFR Part 23. Report REP-2546, a Confidential document on Lone Offender activity, has reached Approved status, while REP-2547—Secret in classification and focused on Drug Trafficking—has been fully Disseminated. These status values (Draft, Under Review, Approved, Disseminated) represent the progression of a report through its review pipeline.

## Intelligence Repositories

Intelligence repositories are the physical or logical facilities where reports are stored, managed, and distributed. Each repository is identified by a facility code and name, located within a city and state, and operates under a defined jurisdictional coverage area.

**Table `IntelligenceRepository`**

| repositoryId | facilityIdentifier | facilityName | locationCity | locationState | operationalStatus | jurisdictionCoverage | unitId | createdAt |
|---|---|---|---|---|---|---|---|---|
| 100 | FAC-2066 | Integrated Protocol A | seasonal-location-23 | composite-location-93 | Active | Regional | 1000 | 2025-01-01 00:14:00 |
| 101 | FAC-2067 | Extended Programme | regional-location-24 | primary-location-94 | Inactive | State | 1001 | 2025-02-06 03:14:00 |
| 102 | FAC-2068 | Pilot Standard | legacy-location-25 | adaptive-location-95 | Under Maintenance | Federal | 1002 | 2025-03-11 06:14:00 |
| 103 | FAC-2069 | Baseline Framework D | compact-location-26 | distributed-location-96 | Active | Local | 1003 | 2025-04-16 09:14:00 |

Facility FAC-2066, named Integrated Protocol A, operates in an Active status with Regional jurisdiction coverage and is tied to unit 1000. Facility FAC-2067 (Extended Programme) is currently Inactive and covers State-level jurisdiction. Facility FAC-2068 (Pilot Standard) is Under Maintenance with Federal jurisdiction, while FAC-2069 (Baseline Framework D) is Active at the Local level. The operational status of each repository directly affects whether reports assigned to it can be accessed or disseminated.

## Intelligence Units

Intelligence units are the organizational substructures within repositories that execute specific mission scopes. Each unit has a unit code, a parent organization, and a defined establishment date.

**Table `IntelligenceUnit`**

| id | unitCode | unitName | parentOrganization | missionScope | establishmentDate | repositoryId | agencyId | createdAt |
|---|---|---|---|---|---|---|---|---|
| 1000 | 16375765 | Compact Series | Dow Chemical | All Crimes | 2024-07-11 | 100 | 1000 | 2025-01-01 00:14:00 |
| 1001 | 43197173 | Legacy Assessment | LDAP First Name Field | All Threats | 2025-12-22 | 101 | 1001 | 2025-02-06 03:14:00 |
| 1002 | 1186104 | Regional Survey A | Standard Chartered | All Hazards | 2022-05-06 | 102 | 1002 | 2025-03-11 06:14:00 |
| 1003 | 69419 | Seasonal Corridor | The Library of Congress | Counter-Terrorism | 2023-10-17 | 103 | 1003 | 2025-04-16 09:14:00 |

Unit 16375765 (Compact Series), part of the Dow Chemical parent organization, covers All Crimes and was established on 2024-07-11. Unit 43197173 (Legacy Assessment), under LDAP First Name Field, addresses All Threats and was established later, on 2025-12-22. Unit 1186104 (Regional Survey A), affiliated with Standard Chartered, handles All Hazards since 2022-05-06. Unit 69419 (Seasonal Corridor), under The Library of Congress, specializes in Counter-Terrorism and was established on 2023-10-17. Each unit is linked to a specific repository and agency, forming the operational backbone of the intelligence architecture.

## Intelligence Analysts

Analysts are the personnel who produce, review, and manage intelligence reports. Each analyst record includes a badge number, name, agency affiliation, clearance level, and current status.

**Table `IntelligenceAnalyst`**

| analystId | analystBadgeNumber | analystName | agencyAffiliation | clearanceLevel | assignmentDate | status | unitId | repositoryId | agencyId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ANA-2730 | Seasonal Survey | Philadelphia Police Department | Public | 2024-11-03 | Active | 1000 | 100 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | ANA-2732 | Integrated Corridor | FBI | Law Enforcement Sensitive | 2025-04-14 | On Leave | 1001 | 101 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | ANA-2734 | Extended Series D | State Police | Confidential | 2022-09-25 | Inactive | 1002 | 102 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | ANA-2736 | Pilot Assessment | Federal Partner | Secret | 2023-02-09 | Active | 1003 | 103 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Analyst ANA-2730 (Seasonal Survey), affiliated with the Philadelphia Police Department, holds Public clearance and is currently Active. Analyst ANA-2732 (Integrated Corridor) at the FBI holds Law Enforcement Sensitive clearance but is On Leave. Analyst ANA-2734 (Extended Series D) from State Police holds Confidential clearance and is marked Inactive. Analyst ANA-2736 (Pilot Assessment) at Federal Partner holds Secret clearance and is Active. The assignment date and status fields determine whether an analyst is available to author or review reports.

## Partner Agencies

Partner agencies are external organizations that collaborate with the intelligence enterprise, sharing data and coordinating on investigations. Each partner agency record includes an identifier, name, type, jurisdiction region, and contact information.

**Table `PartnerAgency`**

| agencyId | agencyIdentifier | agencyName | agencyType | jurisdictionRegion | contactEmail | unitId | sharesDataWithAgencyId |
|---|---|---|---|---|---|---|---|
| 1000 | Hinduja Group | FSG Social Impact Advisors | Federal | Southeastern Pennsylvania | Christopher Wilson | 1000 | 1000 |
| 1001 | Arcimoto Inc. | Whirlpool Corporation | State | Southern New Jersey | Charles Larsen | 1001 | 1001 |
| 1002 | McDonnell Douglas | Education Writers Association | Local | Northern Delaware | Mary Alvarez | 1002 | 1002 |
| 1003 | Sa Proton World International N.V. | Switch Card Services Ltd. | Private Sector | Northeastern Maryland | April Snyder | 1003 | 1003 |

Agency 1000, Hinduja Group (operating as FSG Social Impact Advisors), is a Federal entity covering Southeastern Pennsylvania, with contact Christopher Wilson. Agency 1001, Arcimoto Inc. (Whirlpool Corporation), is a State-level partner in Southern New Jersey, contacted by Charles Larsen. Agency 1002, McDonnell Douglas (Education Writers Association), operates at the Local level in Northern Delaware, with Mary Alvarez as contact. Agency 1003, Sa Proton World International N.V. (Switch Card Services Ltd.), is a Private Sector partner in Northeastern Maryland, reachable at April Snyder. The sharesDataWithAgencyId field indicates which agency a partner shares data with, enabling cross-agency coordination.

## Subjects of Interest

Subjects of interest are the individuals, organizations, groups, or entities under investigation. Each subject record captures their identifier, type, risk level, last known location, and associated threats.

**Table `SubjectOfInterest`**

| interestId | subjectIdentifier | subjectName | subjectType | riskLevel | lastKnownLocation | associatedThreats | unitId | reportId |
|---|---|---|---|---|---|---|---|---|
| 1 | SUB-2370 | Baseline Framework D | Individual | Low | pilot-last-26 | Terrorism | 1000 | 1 |
| 2 | SUB-2374 | Distributed Protocol | Organization | Medium | extended-last-27 | Drug Trafficking | 1001 | 2 |
| 3 | SUB-2378 | Adaptive Programme | Group | High | integrated-last-28 | Cyber Crime | 1002 | 3 |
| 4 | SUB-2382 | Primary Standard A | Entity | Critical | seasonal-last-29 | Human Trafficking | 1003 | 4 |

Subject SUB-2370 (Baseline Framework D) is classified as an Individual with a Low risk level, last known at pilot-last-26, and associated with Terrorism. Subject SUB-2374 (Distributed Protocol) is an Organization with Medium risk, located at extended-last-27, linked to Drug Trafficking. Subject SUB-2378 (Adaptive Programme) is a Group with High risk at integrated-last-28, associated with Cyber Crime. Subject SUB-2382 (Primary Standard A) is an Entity with Critical risk at seasonal-last-29, linked to Human Trafficking. The risk levels (Low, Medium, High, Critical) drive prioritization in resource allocation and reporting urgency.

## Suspicious Activity Reports

Suspicious activity reports document observed behaviors or events that may indicate criminal or threatening activity. These reports serve as the initial trigger for deeper intelligence investigations.

**Table `SuspiciousActivityReport`**

| id | sarIdentifier | reportDate | activityType | reviewStatus | privacyComplianceCheck | reviewingAnalystID | unitId | interestId | reportId | agencyId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | SAR-2786 | 2024-03-02T02:54:00 | Surveillance | Pending Review | false | REV-2363 | 1000 | 1 | 1000 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | SAR-2790 | 2025-08-13T09:11:00 | Procurement of Weapons | Approved for Dissemination | true | REV-2367 | 1001 | 2 | 1001 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | SAR-2794 | 2022-01-24T16:28:00 | Unusual Financial Activity | Rejected | false | REV-2371 | 1002 | 3 | 1002 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | SAR-2798 | 2023-06-08T23:45:00 | Behavioral Anomaly | Under Investigation | true | REV-2375 | 1003 | 4 | 1003 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

SAR-9001 was filed on 2024-01-15, categorized under Financial Crime, and references subject SUB-2370 and report REP-2544. SAR-9002, dated 2024-06-22, covers Weapons Violations, references subject SUB-2374 and report REP-2545. SAR-9003, from 2024-11-08, addresses Cyber Intrusion, references subject SUB-2378 and report REP-2546. SAR-9004, dated 2025-03-30, covers Human Smuggling, references subject SUB-2382 and report REP-2547. Each SAR links to a specific intelligence report, creating a traceable path from initial observation to formal intelligence product.

## Cross-Cutting Relationships

The intelligence domain relies on many-to-many relationships between reports, repositories, analysts, units, agencies, and subjects. These relationships are captured in dedicated join tables that record which entities are associated with which reports.

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

This join table links repositories to reports, enabling a single report to be stored across multiple facilities or a repository to hold many reports.

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

Analysts are associated with repositories through this table, reflecting the organizational assignment of personnel to storage and management facilities.

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

This table records which analysts belong to which units, supporting the organizational hierarchy and workload distribution.

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

Units are linked to reports, indicating which organizational unit is responsible for producing or managing each intelligence product.

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

This join captures the direct authorship or responsibility relationship between analysts and reports, independent of unit or repository assignments.

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

Partner agencies are associated with reports, reflecting collaborative authorship, review, or dissemination agreements.

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

This table links partner agency personnel to intelligence analysts, supporting cross-agency collaboration and data sharing.

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

Subjects of interest are linked to reports, establishing which investigations or assessments each subject is involved in.

## Intelligence Views

The intelligence domain provides a suite of views that join base tables to answer specific operational questions. Each view consolidates data from multiple entities to provide a unified perspective on a particular aspect of the intelligence lifecycle.

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

This view answers which repository holds each intelligence report. For example, report REP-2544 is associated with repository FAC-2066 (Integrated Protocol A), while REP-2547 is linked to FAC-2069 (Baseline Framework D). Practitioners use this view to verify report storage locations and confirm facility availability.

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

This view reveals which analyst authored or is responsible for each report. REP-2544 is tied to analyst ANA-2730 (Seasonal Survey), while REP-2545 is associated with ANA-2732 (Integrated Corridor). This supports accountability and workload tracking.

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

This view connects reports to their subjects of interest. REP-2544 concerns subject SUB-2370 (Baseline Framework D), and REP-2547 concerns subject SUB-2382 (Primary Standard A). Analysts use this to understand the scope of each report's investigation.

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

This view shows which partner agencies are associated with each report. REP-2544 is linked to agency 1000 (Hinduja Group), and REP-2547 to agency 1003 (Sa Proton World International N.V.). This supports coordination with external stakeholders.

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

This view maps repositories to their parent intelligence units. Repository FAC-2066 belongs to unit 16375765 (Compact Series), while FAC-2069 belongs to unit 69419 (Seasonal Corridor). This clarifies the organizational chain of command for each facility.

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

This view provides a detailed listing of all reports stored within each repository, including report identifiers, dates, and classification levels. It enables facility managers to audit their holdings and verify compliance with retention policies.

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

This view lists all analysts assigned to each repository, including their badge numbers, clearance levels, and current status. It supports staffing decisions and access control verification.

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

This view reverses the repository-to-unit mapping, showing which repositories each intelligence unit oversees. Unit 16375765 (Compact Series) oversees repository FAC-2066, while unit 69419 (Seasonal Corridor) oversees FAC-2069.

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

This view provides a comprehensive listing of all analysts within each intelligence unit, including their assignment dates and statuses. Unit 16375765 includes analyst ANA-2730 (Active), while unit 43197173 includes ANA-2732 (On Leave).

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

This view links intelligence units to their partner agencies. Unit 16375765 is associated with agency 1000 (Hinduja Group), and unit 69419 with agency 1003 (Sa Proton World International N.V.). This supports inter-agency coordination planning.

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

This view lists all reports produced or managed by each intelligence unit, including their classification levels and statuses. Unit 16375765 manages REP-2544 (Unclassified, Draft), while unit 69419 manages REP-2547 (Secret, Disseminated).

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

This view maps analysts to their parent intelligence units. Analyst ANA-2730 (Seasonal Survey) belongs to unit 16375765 (Compact Series), and ANA-2736 (Pilot Assessment) to unit 69419 (Seasonal Corridor).

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

This view shows which repository each analyst is assigned to. ANA-2730 is assigned to FAC-2066 (Integrated Protocol A), while ANA-2736 is assigned to FAC-2069 (Baseline Framework D).

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

This view provides a detailed listing of all reports associated with each analyst, including report identifiers, dates, and classification levels. Analyst ANA-2730 is associated with REP-2544 (Terrorism, Draft), while ANA-2736 is associated with REP-2547 (Drug Trafficking, Disseminated).

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

This view links analysts to their partner agencies. ANA-2730 is linked to agency 1000 (Hinduja Group), and ANA-2736 to agency 1003 (Sa Proton World International N.V.). This supports collaborative investigation tracking.

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

This view maps partner agencies to the intelligence units they collaborate with. Agency 1000 (Hinduja Group) works with unit 16375765 (Compact Series), while agency 1003 (Sa Proton World International N.V.) works with unit 69419 (Seasonal Corridor).

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

This view lists all reports associated with each partner agency, including their threat categories and statuses. Agency 1000 is associated with REP-2544 (Terrorism, Draft), while agency 1003 is associated with REP-2547 (Drug Trafficking, Disseminated).

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

This view provides a detailed listing of all analysts associated with each partner agency, including their clearance levels and statuses. Agency 1000 is linked to ANA-2730 (Public clearance, Active), while agency 1003 is linked to ANA-2736 (Secret clearance, Active).

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

This view reveals data-sharing relationships between partner agencies. Agency 1000 (Hinduja Group) shares data with agency 1000, and agency 1003 (Sa Proton World International N.V.) shares with agency 1003, indicating self-referential data-sharing agreements that may represent internal coordination protocols.

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

This view links subjects of interest to their parent intelligence units. Subject SUB-2370 (Baseline Framework D) is managed by unit 16375765 (Compact Series), while subject SUB-2382 (Primary Standard A) is managed by unit 69419 (Seasonal Corridor).

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

This view provides a detailed listing of all reports associated with each subject of interest, including report identifiers, classification levels, and statuses. Subject SUB-2370 is associated with REP-2544 (Unclassified, Draft), while subject SUB-2382 is associated with REP-2547 (Secret, Disseminated).

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

This view connects subjects of interest to the suspicious activity reports that reference them. Subject SUB-2370 is linked to SAR-9001 (Financial Crime), and subject SUB-2382 to SAR-9004 (Human Smuggling). This supports the traceability of investigations from initial observation through formal reporting.

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

This view maps suspicious activity reports to the intelligence units that handle them. SAR-9001 is associated with unit 16375765 (Compact Series), and SAR-9004 with unit 69419 (Seasonal Corridor).

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

This view links suspicious activity reports to their subjects of interest. SAR-9001 references subject SUB-2370 (Baseline Framework D), and SAR-9004 references subject SUB-2382 (Primary Standard A).

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

This view connects suspicious activity reports to the intelligence reports they feed into. SAR-9001 is linked to REP-2544, and SAR-9004 to REP-2547, demonstrating the pipeline from initial observation to formal intelligence product.

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

This view links suspicious activity reports to their partner agencies. SAR-9001 is associated with agency 1000 (Hinduja Group), and SAR-9004 with agency 1003 (Sa Proton World International N.V.), supporting cross-agency reporting coordination.

## Closing Synthesis

The intelligence domain is a tightly interwoven system of reports, facilities, personnel, and partner organizations. Each intelligence report sits at the center of a network of relationships: it is stored in a repository, authored by an analyst, managed by a unit, and potentially shared with partner agencies. Subjects of interest drive the content of reports, while suspicious activity reports provide the initial triggers that feed into the intelligence pipeline. The views described above enable practitioners to navigate this network from multiple angles—whether tracing a report's provenance, auditing a facility's holdings, or coordinating with external partners. Mastery of these relationships ensures that intelligence operations remain transparent, accountable, and effective.