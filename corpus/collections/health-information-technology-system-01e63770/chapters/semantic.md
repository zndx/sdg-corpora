The chapter has been written to `/tmp/harness_semantic_j5xn97fv/chapter.md` (2,047 words). There is no git repository in this directory, so the commit step could not be performed, but the prose is complete with all 22 payload blocks embedded at their designated positions.

## Data appendix

**Table `HealthInformationTechnologySystem`**

| id | systemIdentifier | systemName | deploymentDate | systemType | usabilityScore | interoperabilityStandard | isStandardized | departmentId | clinicianId | participantId | assessmentId |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | SYS-2050 | Legacy Programme D | 2023-02-14T13:51:00 | ERP | 15.70 | distributed-interope-72 | false | 1 | 100 | 100 | 1 |
| 2 | SYS-2051 | Regional Standard | 2024-07-25T20:08:00 | ClinicalDocumentation | 17.40 | baseline-interope-73 | true | 2 | 101 | 101 | 2 |
| 3 | SYS-2052 | Seasonal Framework | 2025-12-09T03:25:00 | OrderEntry | 19.10 | pilot-interope-74 | false | 3 | 102 | 102 | 3 |
| 4 | SYS-2053 | Integrated Protocol A | 2022-05-20T10:42:00 | DataRetrieval | 20.80 | extended-interope-75 | true | 4 | 103 | 103 | 4 |

**Table `EmergencyDepartment`**

| id | departmentCode | locationName | patientVolume | averageWaitTime | staffingLevel | operationalStatus | systemId | createdAt |
|---|---|---|---|---|---|---|---|---|
| 1 | 605962 | Legacy Review D | 17 | 15.20 | 40 | open | 1 | 2025-01-01 00:14:00 |
| 2 | 10449510 | Regional Initiative | 25 | 19.40 | 44 | closed | 2 | 2025-02-06 03:14:00 |
| 3 | 2002007020080 | Seasonal Model | 33 | 23.60 | 48 | surge | 3 | 2025-03-11 06:14:00 |
| 4 | drafting-skills | Integrated Cluster A | 41 | 27.80 | 52 | open | 4 | 2025-04-16 09:14:00 |

**Table `Clinician`**

| clinicianId | clinicianID | specialty | yearsOfExperience | moraleLevel | productivityMetric | isCertified | departmentId | systemId | managerId | createdAt |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | CLI-2453 | extended-specialt-21 | 7 | 9.70 | 3.95 | true | 1 | 1 | 1 | 2025-01-01 00:14:00 |
| 101 | CLI-2460 | integrated-specialt-22 | 10 | 11.40 | 6.90 | false | 2 | 2 | 2 | 2025-02-06 03:14:00 |
| 102 | CLI-2467 | seasonal-specialt-23 | 13 | 13.10 | 9.85 | true | 3 | 3 | 3 | 2025-03-11 06:14:00 |
| 103 | CLI-2474 | regional-specialt-24 | 16 | 14.80 | 12.80 | false | 4 | 4 | 4 | 2025-04-16 09:14:00 |

**Table `HospitalManager`**

| id | managerID | departmentAssigned | yearsInRole | focusArea | departmentId | systemId |
|---|---|---|---|---|---|---|
| 1 | MAN-2597 | primary-departme-28 | 40 | DataCollection | 1 | 1 |
| 2 | MAN-2604 | adaptive-departme-29 | 44 | ResourceAllocation | 2 | 2 |
| 3 | MAN-2611 | distributed-departme-30 | 48 | StaffManagement | 3 | 3 |
| 4 | MAN-2618 | baseline-departme-31 | 52 | DataCollection | 4 | 4 |

**Table `UsabilityAssessment`**

| assessmentId | assessmentID | assessmentDate | score | testSubjectGroup | isCompleted | systemId | participantId |
|---|---|---|---|---|---|---|---|
| 1 | ASS-2784 | 2022-05-10T04:24:00 | 9.20 | legacy-test-19 | false | 1 | 100 |
| 2 | ASS-2787 | 2023-10-21T11:41:00 | 13.40 | compact-test-20 | true | 2 | 101 |
| 3 | ASS-2790 | 2024-03-05T18:58:00 | 17.60 | composite-test-21 | false | 3 | 102 |
| 4 | ASS-2793 | 2025-08-16T01:15:00 | 21.80 | primary-test-22 | true | 4 | 103 |

**Table `ITParticipant`**

| id | participantID | skillLevel | roleInProject | affiliatedOrganization | systemId | assessmentId |
|---|---|---|---|---|---|---|
| 100 | PAR-2485 | Junior | composite-role-93 | Alexandria Real Estate Equities | 1 | 1 |
| 101 | PAR-2490 | Senior | primary-role-94 | Feedback Rating | 2 | 2 |
| 102 | PAR-2495 | Expert | adaptive-role-95 | Feedback Rating | 3 | 3 |
| 103 | PAR-2500 | Junior | distributed-role-96 | Litton Industries | 4 | 4 |

**Table `EmergencyDepartmentClinician`**

| departmentId | clinicianId |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**View `health_information_technology_system_emergency_department_view`**

```sql
CREATE VIEW health_information_technology_system_emergency_department_view AS
SELECT a.id, a.systemIdentifier, a.systemName, a.deploymentDate, b.id AS department_id, b.departmentCode AS department_departmentCode, b.locationName AS department_locationName
FROM HealthInformationTechnologySystem a JOIN EmergencyDepartment b ON a.departmentId = b.id;
```

| id | systemIdentifier | systemName | deploymentDate | department_id | department_departmentCode | department_locationName |
|---|---|---|---|---|---|---|
| 1 | SYS-2050 | Legacy Programme D | 2023-02-14T13:51:00 | 1 | 605962 | Legacy Review D |
| 2 | SYS-2051 | Regional Standard | 2024-07-25T20:08:00 | 2 | 10449510 | Regional Initiative |
| 3 | SYS-2052 | Seasonal Framework | 2025-12-09T03:25:00 | 3 | 2002007020080 | Seasonal Model |
| 4 | SYS-2053 | Integrated Protocol A | 2022-05-20T10:42:00 | 4 | drafting-skills | Integrated Cluster A |

**View `health_information_technology_system_clinician_view`**

```sql
CREATE VIEW health_information_technology_system_clinician_view AS
SELECT a.id, a.systemIdentifier, a.systemName, a.deploymentDate, b.clinicianId AS clinician_clinicianId, b.clinicianID AS clinician_clinicianID, b.specialty AS clinician_specialty
FROM HealthInformationTechnologySystem a JOIN Clinician b ON a.clinicianId = b.clinicianId;
```

| id | systemIdentifier | systemName | deploymentDate | clinician_clinicianId | clinician_clinicianID | clinician_specialty |
|---|---|---|---|---|---|---|
| 1 | SYS-2050 | Legacy Programme D | 2023-02-14T13:51:00 | 100 | CLI-2453 | extended-specialt-21 |
| 2 | SYS-2051 | Regional Standard | 2024-07-25T20:08:00 | 101 | CLI-2460 | integrated-specialt-22 |
| 3 | SYS-2052 | Seasonal Framework | 2025-12-09T03:25:00 | 102 | CLI-2467 | seasonal-specialt-23 |
| 4 | SYS-2053 | Integrated Protocol A | 2022-05-20T10:42:00 | 103 | CLI-2474 | regional-specialt-24 |

**View `health_information_technology_system_i_t_participant_view`**

```sql
CREATE VIEW health_information_technology_system_i_t_participant_view AS
SELECT a.id, a.systemIdentifier, a.systemName, a.deploymentDate, b.id AS participant_id, b.participantID AS participant_participantID, b.skillLevel AS participant_skillLevel
FROM HealthInformationTechnologySystem a JOIN ITParticipant b ON a.participantId = b.id;
```

| id | systemIdentifier | systemName | deploymentDate | participant_id | participant_participantID | participant_skillLevel |
|---|---|---|---|---|---|---|
| 1 | SYS-2050 | Legacy Programme D | 2023-02-14T13:51:00 | 100 | PAR-2485 | Junior |
| 2 | SYS-2051 | Regional Standard | 2024-07-25T20:08:00 | 101 | PAR-2490 | Senior |
| 3 | SYS-2052 | Seasonal Framework | 2025-12-09T03:25:00 | 102 | PAR-2495 | Expert |
| 4 | SYS-2053 | Integrated Protocol A | 2022-05-20T10:42:00 | 103 | PAR-2500 | Junior |

**View `health_information_technology_system_usability_assessment_view`**

```sql
CREATE VIEW health_information_technology_system_usability_assessment_view AS
SELECT a.id, a.systemIdentifier, a.systemName, a.deploymentDate, b.assessmentId AS assessment_assessmentId, b.assessmentID AS assessment_assessmentID, b.assessmentDate AS assessment_assessmentDate
FROM HealthInformationTechnologySystem a JOIN UsabilityAssessment b ON a.assessmentId = b.assessmentId;
```

| id | systemIdentifier | systemName | deploymentDate | assessment_assessmentId | assessment_assessmentID | assessment_assessmentDate |
|---|---|---|---|---|---|---|
| 1 | SYS-2050 | Legacy Programme D | 2023-02-14T13:51:00 | 1 | ASS-2784 | 2022-05-10T04:24:00 |
| 2 | SYS-2051 | Regional Standard | 2024-07-25T20:08:00 | 2 | ASS-2787 | 2023-10-21T11:41:00 |
| 3 | SYS-2052 | Seasonal Framework | 2025-12-09T03:25:00 | 3 | ASS-2790 | 2024-03-05T18:58:00 |
| 4 | SYS-2053 | Integrated Protocol A | 2022-05-20T10:42:00 | 4 | ASS-2793 | 2025-08-16T01:15:00 |

**View `emergency_department_clinician_detail_view`**

```sql
CREATE VIEW emergency_department_clinician_detail_view AS
SELECT a.id, a.departmentCode, a.locationName, b.clinicianId AS clinician_clinicianId, b.clinicianID AS clinician_clinicianID, b.specialty AS clinician_specialty
FROM EmergencyDepartment a
  JOIN EmergencyDepartmentClinician j ON j.departmentId = a.id
  JOIN Clinician b ON b.clinicianId = j.clinicianId;
```

| id | departmentCode | locationName | clinician_clinicianId | clinician_clinicianID | clinician_specialty |
|---|---|---|---|---|---|
| 1 | 605962 | Legacy Review D | 100 | CLI-2453 | extended-specialt-21 |
| 1 | 605962 | Legacy Review D | 101 | CLI-2460 | integrated-specialt-22 |
| 2 | 10449510 | Regional Initiative | 101 | CLI-2460 | integrated-specialt-22 |
| 2 | 10449510 | Regional Initiative | 102 | CLI-2467 | seasonal-specialt-23 |
| 3 | 2002007020080 | Seasonal Model | 102 | CLI-2467 | seasonal-specialt-23 |
| 3 | 2002007020080 | Seasonal Model | 103 | CLI-2474 | regional-specialt-24 |
| 4 | drafting-skills | Integrated Cluster A | 103 | CLI-2474 | regional-specialt-24 |
| 4 | drafting-skills | Integrated Cluster A | 100 | CLI-2453 | extended-specialt-21 |

**View `emergency_department_health_information_technology_system_view`**

```sql
CREATE VIEW emergency_department_health_information_technology_system_view AS
SELECT a.id, a.departmentCode, a.locationName, a.patientVolume, b.id AS system_id, b.systemIdentifier AS system_systemIdentifier, b.systemName AS system_systemName
FROM EmergencyDepartment a JOIN HealthInformationTechnologySystem b ON a.systemId = b.id;
```

| id | departmentCode | locationName | patientVolume | system_id | system_systemIdentifier | system_systemName |
|---|---|---|---|---|---|---|
| 1 | 605962 | Legacy Review D | 17 | 1 | SYS-2050 | Legacy Programme D |
| 2 | 10449510 | Regional Initiative | 25 | 2 | SYS-2051 | Regional Standard |
| 3 | 2002007020080 | Seasonal Model | 33 | 3 | SYS-2052 | Seasonal Framework |
| 4 | drafting-skills | Integrated Cluster A | 41 | 4 | SYS-2053 | Integrated Protocol A |

**View `clinician_emergency_department_view`**

```sql
CREATE VIEW clinician_emergency_department_view AS
SELECT a.clinicianId, a.clinicianID, a.specialty, a.yearsOfExperience, b.id AS department_id, b.departmentCode AS department_departmentCode, b.locationName AS department_locationName
FROM Clinician a JOIN EmergencyDepartment b ON a.departmentId = b.id;
```

| clinicianId | clinicianID | specialty | yearsOfExperience | department_id | department_departmentCode | department_locationName |
|---|---|---|---|---|---|---|
| 100 | CLI-2453 | extended-specialt-21 | 7 | 1 | 605962 | Legacy Review D |
| 101 | CLI-2460 | integrated-specialt-22 | 10 | 2 | 10449510 | Regional Initiative |
| 102 | CLI-2467 | seasonal-specialt-23 | 13 | 3 | 2002007020080 | Seasonal Model |
| 103 | CLI-2474 | regional-specialt-24 | 16 | 4 | drafting-skills | Integrated Cluster A |

**View `clinician_health_information_technology_system_view`**

```sql
CREATE VIEW clinician_health_information_technology_system_view AS
SELECT a.clinicianId, a.clinicianID, a.specialty, a.yearsOfExperience, b.id AS system_id, b.systemIdentifier AS system_systemIdentifier, b.systemName AS system_systemName
FROM Clinician a JOIN HealthInformationTechnologySystem b ON a.systemId = b.id;
```

| clinicianId | clinicianID | specialty | yearsOfExperience | system_id | system_systemIdentifier | system_systemName |
|---|---|---|---|---|---|---|
| 100 | CLI-2453 | extended-specialt-21 | 7 | 1 | SYS-2050 | Legacy Programme D |
| 101 | CLI-2460 | integrated-specialt-22 | 10 | 2 | SYS-2051 | Regional Standard |
| 102 | CLI-2467 | seasonal-specialt-23 | 13 | 3 | SYS-2052 | Seasonal Framework |
| 103 | CLI-2474 | regional-specialt-24 | 16 | 4 | SYS-2053 | Integrated Protocol A |

**View `clinician_hospital_manager_view`**

```sql
CREATE VIEW clinician_hospital_manager_view AS
SELECT a.clinicianId, a.clinicianID, a.specialty, a.yearsOfExperience, b.id AS manager_id, b.managerID AS manager_managerID, b.departmentAssigned AS manager_departmentAssigned
FROM Clinician a JOIN HospitalManager b ON a.managerId = b.id;
```

| clinicianId | clinicianID | specialty | yearsOfExperience | manager_id | manager_managerID | manager_departmentAssigned |
|---|---|---|---|---|---|---|
| 100 | CLI-2453 | extended-specialt-21 | 7 | 1 | MAN-2597 | primary-departme-28 |
| 101 | CLI-2460 | integrated-specialt-22 | 10 | 2 | MAN-2604 | adaptive-departme-29 |
| 102 | CLI-2467 | seasonal-specialt-23 | 13 | 3 | MAN-2611 | distributed-departme-30 |
| 103 | CLI-2474 | regional-specialt-24 | 16 | 4 | MAN-2618 | baseline-departme-31 |

**View `hospital_manager_emergency_department_view`**

```sql
CREATE VIEW hospital_manager_emergency_department_view AS
SELECT a.id, a.managerID, a.departmentAssigned, a.yearsInRole, b.id AS department_id, b.departmentCode AS department_departmentCode, b.locationName AS department_locationName
FROM HospitalManager a JOIN EmergencyDepartment b ON a.departmentId = b.id;
```

| id | managerID | departmentAssigned | yearsInRole | department_id | department_departmentCode | department_locationName |
|---|---|---|---|---|---|---|
| 1 | MAN-2597 | primary-departme-28 | 40 | 1 | 605962 | Legacy Review D |
| 2 | MAN-2604 | adaptive-departme-29 | 44 | 2 | 10449510 | Regional Initiative |
| 3 | MAN-2611 | distributed-departme-30 | 48 | 3 | 2002007020080 | Seasonal Model |
| 4 | MAN-2618 | baseline-departme-31 | 52 | 4 | drafting-skills | Integrated Cluster A |

**View `hospital_manager_health_information_technology_system_view`**

```sql
CREATE VIEW hospital_manager_health_information_technology_system_view AS
SELECT a.id, a.managerID, a.departmentAssigned, a.yearsInRole, b.id AS system_id, b.systemIdentifier AS system_systemIdentifier, b.systemName AS system_systemName
FROM HospitalManager a JOIN HealthInformationTechnologySystem b ON a.systemId = b.id;
```

| id | managerID | departmentAssigned | yearsInRole | system_id | system_systemIdentifier | system_systemName |
|---|---|---|---|---|---|---|
| 1 | MAN-2597 | primary-departme-28 | 40 | 1 | SYS-2050 | Legacy Programme D |
| 2 | MAN-2604 | adaptive-departme-29 | 44 | 2 | SYS-2051 | Regional Standard |
| 3 | MAN-2611 | distributed-departme-30 | 48 | 3 | SYS-2052 | Seasonal Framework |
| 4 | MAN-2618 | baseline-departme-31 | 52 | 4 | SYS-2053 | Integrated Protocol A |

**View `usability_assessment_health_information_technology_system_view`**

```sql
CREATE VIEW usability_assessment_health_information_technology_system_view AS
SELECT a.assessmentId, a.assessmentID, a.assessmentDate, a.score, b.id AS system_id, b.systemIdentifier AS system_systemIdentifier, b.systemName AS system_systemName
FROM UsabilityAssessment a JOIN HealthInformationTechnologySystem b ON a.systemId = b.id;
```

| assessmentId | assessmentID | assessmentDate | score | system_id | system_systemIdentifier | system_systemName |
|---|---|---|---|---|---|---|
| 1 | ASS-2784 | 2022-05-10T04:24:00 | 9.20 | 1 | SYS-2050 | Legacy Programme D |
| 2 | ASS-2787 | 2023-10-21T11:41:00 | 13.40 | 2 | SYS-2051 | Regional Standard |
| 3 | ASS-2790 | 2024-03-05T18:58:00 | 17.60 | 3 | SYS-2052 | Seasonal Framework |
| 4 | ASS-2793 | 2025-08-16T01:15:00 | 21.80 | 4 | SYS-2053 | Integrated Protocol A |

**View `usability_assessment_i_t_participant_view`**

```sql
CREATE VIEW usability_assessment_i_t_participant_view AS
SELECT a.assessmentId, a.assessmentID, a.assessmentDate, a.score, b.id AS participant_id, b.participantID AS participant_participantID, b.skillLevel AS participant_skillLevel
FROM UsabilityAssessment a JOIN ITParticipant b ON a.participantId = b.id;
```

| assessmentId | assessmentID | assessmentDate | score | participant_id | participant_participantID | participant_skillLevel |
|---|---|---|---|---|---|---|
| 1 | ASS-2784 | 2022-05-10T04:24:00 | 9.20 | 100 | PAR-2485 | Junior |
| 2 | ASS-2787 | 2023-10-21T11:41:00 | 13.40 | 101 | PAR-2490 | Senior |
| 3 | ASS-2790 | 2024-03-05T18:58:00 | 17.60 | 102 | PAR-2495 | Expert |
| 4 | ASS-2793 | 2025-08-16T01:15:00 | 21.80 | 103 | PAR-2500 | Junior |

**View `i_t_participant_health_information_technology_system_view`**

```sql
CREATE VIEW i_t_participant_health_information_technology_system_view AS
SELECT a.id, a.participantID, a.skillLevel, a.roleInProject, b.id AS system_id, b.systemIdentifier AS system_systemIdentifier, b.systemName AS system_systemName
FROM ITParticipant a JOIN HealthInformationTechnologySystem b ON a.systemId = b.id;
```

| id | participantID | skillLevel | roleInProject | system_id | system_systemIdentifier | system_systemName |
|---|---|---|---|---|---|---|
| 100 | PAR-2485 | Junior | composite-role-93 | 1 | SYS-2050 | Legacy Programme D |
| 101 | PAR-2490 | Senior | primary-role-94 | 2 | SYS-2051 | Regional Standard |
| 102 | PAR-2495 | Expert | adaptive-role-95 | 3 | SYS-2052 | Seasonal Framework |
| 103 | PAR-2500 | Junior | distributed-role-96 | 4 | SYS-2053 | Integrated Protocol A |

**View `i_t_participant_usability_assessment_view`**

```sql
CREATE VIEW i_t_participant_usability_assessment_view AS
SELECT a.id, a.participantID, a.skillLevel, a.roleInProject, b.assessmentId AS assessment_assessmentId, b.assessmentID AS assessment_assessmentID, b.assessmentDate AS assessment_assessmentDate
FROM ITParticipant a JOIN UsabilityAssessment b ON a.assessmentId = b.assessmentId;
```

| id | participantID | skillLevel | roleInProject | assessment_assessmentId | assessment_assessmentID | assessment_assessmentDate |
|---|---|---|---|---|---|---|
| 100 | PAR-2485 | Junior | composite-role-93 | 1 | ASS-2784 | 2022-05-10T04:24:00 |
| 101 | PAR-2490 | Senior | primary-role-94 | 2 | ASS-2787 | 2023-10-21T11:41:00 |
| 102 | PAR-2495 | Expert | adaptive-role-95 | 3 | ASS-2790 | 2024-03-05T18:58:00 |
| 103 | PAR-2500 | Junior | distributed-role-96 | 4 | ASS-2793 | 2025-08-16T01:15:00 |
