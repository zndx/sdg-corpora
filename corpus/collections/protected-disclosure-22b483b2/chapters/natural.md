# Compliance Investigations at Academic Institutions

College campuses operate as complex ecosystems where the integrity of operations depends on transparent reporting, rigorous investigation, and accountable resolution. When concerns arise—whether involving financial waste, safety threats, or legal violations—the institution must track every step from initial disclosure through final corrective action. The records maintained across these systems form a complete audit trail: who reported a concern, what the concern was about, who is implicated, who investigates, and what outcome was reached. This chapter documents the structure and relationships of that record-keeping apparatus, drawing on concrete examples from active cases across multiple campuses including Davenport, West, Florida, and an unaffiliated campus.

## Protected Disclosures and Whistleblowers

The entry point for every compliance matter is the protected disclosure. This table captures when and how a concern was raised, whether the reporter acted in good faith, and the current procedural status of the report. Disclosures are submitted through multiple channels—email, phone, in-person meetings, or written letters—and each carries a content summary and a status that moves through the lifecycle from `submitted` to `under_review`, `investigated`, and finally `closed`.

**Table `ProtectedDisclosure`**

| disclosureId | disclosureDate | disclosureMethod | isGoodFaith | contentSummary | status | whistleblowerId | conductId | investigationId |
|---|---|---|---|---|---|---|---|---|
| 1 | 2025-08-02T19:33:00 | email | true | seasonal-content-41 | submitted | 100 | 1 | 1 |
| 2 | 2022-01-13T02:50:00 | phone | false | regional-content-42 | under_review | 101 | 2 | 2 |
| 3 | 2023-06-24T09:07:00 | in_person | true | legacy-content-43 | investigated | 102 | 3 | 3 |
| 4 | 2024-11-08T16:24:00 | written_letter | false | compact-content-44 | closed | 103 | 4 | 4 |

Consider the first disclosure in the system, filed on August 2, 2025, via email by whistleblower ID 100. The report, summarized as `seasonal-content-41`, was submitted in good faith and is currently in `submitted` status. It references conduct ID 1 and has triggered investigation ID 1. By contrast, disclosure ID 2 was filed by phone on January 13, 2022, by whistleblower ID 101, and was not made in good faith; it remains `under_review` and is tied to conduct ID 2 and investigation ID 2. The diversity of submission methods and statuses reflects the varied circumstances under which concerns surface across an institution.

**View `v_protected_disclosure_whistleblower`**

```sql
CREATE VIEW v_protected_disclosure_whistleblower AS
SELECT a.disclosureId, a.disclosureDate, a.disclosureMethod, a.isGoodFaith, b.whistleblowerId AS whistleblower_whistleblowerId, b.role AS whistleblower_role, b.campusAffiliation AS whistleblower_campusAffiliation
FROM ProtectedDisclosure a JOIN Whistleblower b ON a.whistleblowerId = b.whistleblowerId;
```

| disclosureId | disclosureDate | disclosureMethod | isGoodFaith | whistleblower_whistleblowerId | whistleblower_role | whistleblower_campusAffiliation |
|---|---|---|---|---|---|---|
| 1 | 2025-08-02T19:33:00 | email | true | 100 | employee | davenport |
| 2 | 2022-01-13T02:50:00 | phone | false | 101 | faculty | west |
| 3 | 2023-06-24T09:07:00 | in_person | true | 102 | student | florida |
| 4 | 2024-11-08T16:24:00 | written_letter | false | 103 | affiliated_person | other |

This joined view answers the question of which whistleblower filed each disclosure and what their role entails. Row 1 reveals that whistleblower ID 100, an employee at Davenport, submitted disclosure ID 1. Row 3 shows that whistleblower ID 102, a student at Florida, filed disclosure ID 3 in good faith. The view makes it immediately clear that whistleblowers span the full spectrum of campus roles—employees, faculty, students, and affiliated persons—each bringing concerns from their unique vantage point.

**View `v_protected_disclosure_improper_conduct`**

```sql
CREATE VIEW v_protected_disclosure_improper_conduct AS
SELECT a.disclosureId, a.disclosureDate, a.disclosureMethod, a.isGoodFaith, b.id AS conduct_id, b.conductId AS conduct_conductId, b.conductType AS conduct_conductType
FROM ProtectedDisclosure a JOIN ImproperConduct b ON a.conductId = b.id;
```

| disclosureId | disclosureDate | disclosureMethod | isGoodFaith | conduct_id | conduct_conductId | conduct_conductType |
|---|---|---|---|---|---|---|
| 1 | 2025-08-02T19:33:00 | email | true | 1 | 2986238 | legal_violation |
| 2 | 2022-01-13T02:50:00 | phone | false | 2 | 3744007 | misuse_of_resources |
| 3 | 2023-06-24T09:07:00 | in_person | true | 3 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | economic_waste |
| 4 | 2024-11-08T16:24:00 | written_letter | false | 4 | 10238282 | safety_threat |

Linking disclosures to the underlying improper conduct they reference, this view connects each report to the specific violation it alleges. Row 1 shows that disclosure ID 1 (`seasonal-content-41`) references conduct ID 2986238, classified as a `legal_violation` with a severity level of 29. Row 4 ties disclosure ID 4 (`compact-content-44`) to conduct ID 10238282, a `safety_threat` rated at severity level 62—the highest in the dataset. The severity scale ranges from 29 to 62 across the four records, providing a quantitative dimension to the qualitative summaries.

**View `v_protected_disclosure_investigation`**

```sql
CREATE VIEW v_protected_disclosure_investigation AS
SELECT a.disclosureId, a.disclosureDate, a.disclosureMethod, a.isGoodFaith, b.investigationId AS investigation_investigationId, b.startDate AS investigation_startDate, b.endDate AS investigation_endDate
FROM ProtectedDisclosure a JOIN Investigation b ON a.investigationId = b.investigationId;
```

| disclosureId | disclosureDate | disclosureMethod | isGoodFaith | investigation_investigationId | investigation_startDate | investigation_endDate |
|---|---|---|---|---|---|---|
| 1 | 2025-08-02T19:33:00 | email | true | 1 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 |
| 2 | 2022-01-13T02:50:00 | phone | false | 2 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 |
| 3 | 2023-06-24T09:07:00 | in_person | true | 3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 |
| 4 | 2024-11-08T16:24:00 | written_letter | false | 4 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 |

This view maps each disclosure to the investigation it spawned. Row 1 confirms that disclosure ID 1 initiated investigation ID 1, while row 4 shows disclosure ID 4 led to investigation ID 4, which is currently `suspended`. The linkage ensures that every disclosure can be traced to its investigative outcome, and every investigation can be traced back to its originating report.

## Whistleblowers and Their Campus Affiliations

Whistleblowers are not anonymous entities; they are individuals with defined roles and campus connections. The whistleblower table records their role (employee, faculty, student, or affiliated_person), their campus affiliation, whether they are protected from retaliation, and their contact information.

**Table `Whistleblower`**

| whistleblowerId | role | campusAffiliation | isProtectedFromRetaliation | contactEmail | contactPhone | disclosureId | campusId |
|---|---|---|---|---|---|---|---|
| 100 | employee | davenport | false | Christopher Wilson | Joe Tsai | 1 | 1 |
| 101 | faculty | west | true | Charles Larsen | Stephanie Collins | 2 | 2 |
| 102 | student | florida | false | Mary Alvarez | Tasha Rodriguez | 3 | 3 |
| 103 | affiliated_person | other | true | April Snyder | Walter Pratt | 4 | 4 |

Whistleblower ID 100 is an employee at Davenport who is not protected from retaliation. Whistleblower ID 101, a faculty member at West, is protected from retaliation. Whistleblower ID 102 is a student at Florida without protection, while ID 103 is an affiliated person at an `other` campus who is protected. The contact fields store names—Christopher Wilson and Joe Tsai for ID 100, Charles Larsen and Stephanie Collins for ID 101—suggesting dual points of contact or perhaps a primary and secondary contact for each whistleblower.

**View `v_whistleblower_protected_disclosure`**

```sql
CREATE VIEW v_whistleblower_protected_disclosure AS
SELECT a.whistleblowerId, a.role, a.campusAffiliation, a.isProtectedFromRetaliation, b.disclosureId AS disclosure_disclosureId, b.disclosureDate AS disclosure_disclosureDate, b.disclosureMethod AS disclosure_disclosureMethod
FROM Whistleblower a JOIN ProtectedDisclosure b ON a.disclosureId = b.disclosureId;
```

| whistleblowerId | role | campusAffiliation | isProtectedFromRetaliation | disclosure_disclosureId | disclosure_disclosureDate | disclosure_disclosureMethod |
|---|---|---|---|---|---|---|
| 100 | employee | davenport | false | 1 | 2025-08-02T19:33:00 | email |
| 101 | faculty | west | true | 2 | 2022-01-13T02:50:00 | phone |
| 102 | student | florida | false | 3 | 2023-06-24T09:07:00 | in_person |
| 103 | affiliated_person | other | true | 4 | 2024-11-08T16:24:00 | written_letter |

This view pairs each whistleblower with the disclosure they filed. Row 1 shows that employee Christopher Wilson (whistleblower ID 100) filed disclosure ID 1. Row 2 links faculty member Charles Larsen (ID 101) to disclosure ID 2. The view confirms the one-to-one relationship between whistleblowers and their disclosures in this dataset, with each individual having submitted exactly one report.

**View `v_whistleblower_college_campus`**

```sql
CREATE VIEW v_whistleblower_college_campus AS
SELECT a.whistleblowerId, a.role, a.campusAffiliation, a.isProtectedFromRetaliation, b.id AS campus_id, b.campusId AS campus_campusId, b.campusName AS campus_campusName
FROM Whistleblower a JOIN CollegeCampus b ON a.campusId = b.id;
```

| whistleblowerId | role | campusAffiliation | isProtectedFromRetaliation | campus_id | campus_campusId | campus_campusName |
|---|---|---|---|---|---|---|
| 100 | employee | davenport | false | 1 | ChIJ85Dnlftt5kcRmzn_mGUYJPE | davenport |
| 101 | faculty | west | true | 2 | 68f46afd953b4de8824b596a1bff565c | west |
| 102 | student | florida | false | 3 | 18ba4c46-8fc8-11eb-924d-9cd76263cbd0 | florida |
| 103 | affiliated_person | other | true | 4 | 3168 | davenport |

By joining whistleblowers to their campuses, this view clarifies the institutional context of each report. Row 1 places whistleblower ID 100 at campus ID 1 (Davenport), row 2 at campus ID 2 (West), row 3 at campus ID 3 (Florida), and row 4 at campus ID 4 (other). The geographic and institutional spread of whistleblowers underscores that compliance concerns arise across all levels and locations of the university system.

## Improper Conduct

The improper conduct table documents the specific violations that trigger investigations. Each record carries a conduct identifier, a type (such as `legal_violation`, `misuse_of_resources`, `economic_waste`, or `safety_threat`), a description, the date the conduct occurred, a severity level on a numeric scale, and a flag indicating whether the conduct constitutes a criminal act.

**Table `ImproperConduct`**

| id | conductId | conductType | description | occurrenceDate | severityLevel | isCriminal | disclosureId | subjectId | campusId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 2986238 | legal_violation | Extended Survey | 2024-03-17 | 29 | false | 1 | 726063 | 1 |
| 2 | 3744007 | misuse_of_resources | Pilot Corridor A | 2025-08-01 | 40 | true | 2 | 2002007020260 | 2 |
| 3 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | economic_waste | Baseline Series | 2022-01-12 | 51 | false | 3 | 5082972 | 3 |
| 4 | 10238282 | safety_threat | Distributed Assessment | 2023-06-23 | 62 | true | 4 | 4793476 | 4 |

Conduct ID 2986238 is a `legal_violation` described as `Extended Survey`, occurring on March 17, 2024, with severity level 29 and no criminal component. Conduct ID 3744007, labeled `Pilot Corridor A`, is a `misuse_of_resources` classified as criminal, with severity level 40. Conduct ID `e5a1c32e-8fc3-11eb-924d-9cd76263cbd0` represents `economic_waste` (`Baseline Series`) at severity 51, while conduct ID 10238282 is a `safety_threat` (`Distributed Assessment`) at severity 62, also criminal. The conduct types span the full range of compliance concerns, and the criminal flag distinguishes the two most serious cases.

**View `v_improper_conduct_protected_disclosure`**

```sql
CREATE VIEW v_improper_conduct_protected_disclosure AS
SELECT a.id, a.conductId, a.conductType, a.description, b.disclosureId AS disclosure_disclosureId, b.disclosureDate AS disclosure_disclosureDate, b.disclosureMethod AS disclosure_disclosureMethod
FROM ImproperConduct a JOIN ProtectedDisclosure b ON a.disclosureId = b.disclosureId;
```

| id | conductId | conductType | description | disclosure_disclosureId | disclosure_disclosureDate | disclosure_disclosureMethod |
|---|---|---|---|---|---|---|
| 1 | 2986238 | legal_violation | Extended Survey | 1 | 2025-08-02T19:33:00 | email |
| 2 | 3744007 | misuse_of_resources | Pilot Corridor A | 2 | 2022-01-13T02:50:00 | phone |
| 3 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | economic_waste | Baseline Series | 3 | 2023-06-24T09:07:00 | in_person |
| 4 | 10238282 | safety_threat | Distributed Assessment | 4 | 2024-11-08T16:24:00 | written_letter |

This view connects each improper conduct record to the disclosure that reported it. Row 1 shows that conduct ID 2986238 was reported via disclosure ID 1, and row 4 links conduct ID 10238282 to disclosure ID 4. The view confirms that every conduct record in the system has an originating disclosure, establishing a clear chain of accountability from report to violation.

**View `v_improper_conduct_investigation_subject`**

```sql
CREATE VIEW v_improper_conduct_investigation_subject AS
SELECT a.id, a.conductId, a.conductType, a.description, b.subjectId AS subject_subjectId, b.role AS subject_role, b.campusAffiliation AS subject_campusAffiliation
FROM ImproperConduct a JOIN InvestigationSubject b ON a.subjectId = b.subjectId;
```

| id | conductId | conductType | description | subject_subjectId | subject_role | subject_campusAffiliation |
|---|---|---|---|---|---|---|
| 1 | 2986238 | legal_violation | Extended Survey | 726063 | employee | davenport |
| 2 | 3744007 | misuse_of_resources | Pilot Corridor A | 2002007020260 | faculty | west |
| 3 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | economic_waste | Baseline Series | 5082972 | student | florida |
| 4 | 10238282 | safety_threat | Distributed Assessment | 4793476 | third_party | other |

Linking conduct to the individuals implicated, this view pairs each improper conduct record with its subject. Row 1 connects conduct ID 2986238 to subject ID 726063, while row 2 links conduct ID 3744007 to subject ID 2002007020260. The subject identifiers range from simple numeric IDs to longer alphanumeric strings, reflecting the diversity of individuals involved.

**View `v_improper_conduct_college_campus`**

```sql
CREATE VIEW v_improper_conduct_college_campus AS
SELECT a.id, a.conductId, a.conductType, a.description, b.id AS campus_id, b.campusId AS campus_campusId, b.campusName AS campus_campusName
FROM ImproperConduct a JOIN CollegeCampus b ON a.campusId = b.id;
```

| id | conductId | conductType | description | campus_id | campus_campusId | campus_campusName |
|---|---|---|---|---|---|---|
| 1 | 2986238 | legal_violation | Extended Survey | 1 | ChIJ85Dnlftt5kcRmzn_mGUYJPE | davenport |
| 2 | 3744007 | misuse_of_resources | Pilot Corridor A | 2 | 68f46afd953b4de8824b596a1bff565c | west |
| 3 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | economic_waste | Baseline Series | 3 | 18ba4c46-8fc8-11eb-924d-9cd76263cbd0 | florida |
| 4 | 10238282 | safety_threat | Distributed Assessment | 4 | 3168 | davenport |

This view situates each improper conduct record within its campus context. Row 1 places conduct ID 2986238 at campus ID 1, row 2 at campus ID 2, and so on. The one-to-one mapping between conduct records and campuses in this dataset indicates that each violation is associated with a single institutional location.

## Investigations

Investigations are the institutional response to reported misconduct. The investigation table records the timeline (start and end dates), current status, findings summary, and whether corrective action was taken. Each investigation is linked to the underlying conduct, the subject under investigation, and the originating disclosure.

**Table `Investigation`**

| investigationId | startDate | endDate | status | findingsSummary | correctiveActionTaken | conductId | subjectId | disclosureId |
|---|---|---|---|---|---|---|---|---|
| 1 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | initiated | pilot-findings-32 | true | 1 | 726063 | 1 |
| 2 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | ongoing | extended-findings-33 | false | 2 | 2002007020260 | 2 |
| 3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | integrated-findings-34 | true | 3 | 5082972 | 3 |
| 4 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | suspended | seasonal-findings-35 | false | 4 | 4793476 | 4 |

Investigation ID 1 began on September 5, 2022, and is in `initiated` status, with findings summarized as `pilot-findings-32` and corrective action confirmed as taken. Investigation ID 2, started February 16, 2023, remains `ongoing` with `extended-findings-33` and no corrective action yet. Investigation ID 3, initiated July 27, 2024, is `completed` with `integrated-findings-34` and corrective action taken. Investigation ID 4, started December 11, 2025, is `suspended` with `seasonal-findings-35` and no corrective action. The statuses—`initiated`, `ongoing`, `completed`, and `suspended`—capture the full range of investigative states.

**View `v_investigation_improper_conduct`**

```sql
CREATE VIEW v_investigation_improper_conduct AS
SELECT a.investigationId, a.startDate, a.endDate, a.status, b.id AS conduct_id, b.conductId AS conduct_conductId, b.conductType AS conduct_conductType
FROM Investigation a JOIN ImproperConduct b ON a.conductId = b.id;
```

| investigationId | startDate | endDate | status | conduct_id | conduct_conductId | conduct_conductType |
|---|---|---|---|---|---|---|
| 1 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | initiated | 1 | 2986238 | legal_violation |
| 2 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | ongoing | 2 | 3744007 | misuse_of_resources |
| 3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | 3 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | economic_waste |
| 4 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | suspended | 4 | 10238282 | safety_threat |

This view ties each investigation to the specific conduct it examines. Row 1 shows investigation ID 1 addresses conduct ID 1, and row 4 shows investigation ID 4 addresses conduct ID 4. The direct linkage ensures that every investigative effort can be traced to its underlying allegation.

**View `v_investigation_investigator_detail`**

```sql
CREATE VIEW v_investigation_investigator_detail AS
SELECT a.investigationId, a.startDate, a.endDate, b.investigatorId AS investigator_investigatorId, b.role AS investigator_role, b.department AS investigator_department
FROM Investigation a
  JOIN InvestigationInvestigator j ON j.investigationId = a.investigationId
  JOIN Investigator b ON b.investigatorId = j.investigatorId;
```

| investigationId | startDate | endDate | investigator_investigatorId | investigator_role | investigator_department |
|---|---|---|---|---|---|
| 1 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | id_23 | chief_compliance_officer | adaptive-departme-89 |
| 1 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 4011 | designated_investigator | distributed-departme-90 |
| 2 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 4011 | designated_investigator | distributed-departme-90 |
| 2 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 3158159 | external_auditor | baseline-departme-91 |
| 3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3158159 | external_auditor | baseline-departme-91 |
| 3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 4277008 | chief_compliance_officer | pilot-departme-92 |
| 4 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4277008 | chief_compliance_officer | pilot-departme-92 |
| 4 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | id_23 | chief_compliance_officer | adaptive-departme-89 |

This view connects investigations to the investigators assigned to them. Row 1 links investigation ID 1 to investigator ID `id_23`, a chief compliance officer. Row 2 connects investigation ID 2 to investigator ID 4011, a designated investigator. The view reveals the assignment of specific personnel to specific cases, forming the basis for accountability in the investigative process.

**View `v_investigation_investigation_subject`**

```sql
CREATE VIEW v_investigation_investigation_subject AS
SELECT a.investigationId, a.startDate, a.endDate, a.status, b.subjectId AS subject_subjectId, b.role AS subject_role, b.campusAffiliation AS subject_campusAffiliation
FROM Investigation a JOIN InvestigationSubject b ON a.subjectId = b.subjectId;
```

| investigationId | startDate | endDate | status | subject_subjectId | subject_role | subject_campusAffiliation |
|---|---|---|---|---|---|---|
| 1 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | initiated | 726063 | employee | davenport |
| 2 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | ongoing | 2002007020260 | faculty | west |
| 3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | 5082972 | student | florida |
| 4 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | suspended | 4793476 | third_party | other |

Pairing investigations with their subjects, this view answers who is under investigation. Row 1 shows that investigation ID 1 concerns subject ID 726063, while row 3 links investigation ID 3 to subject ID 5082972. The view confirms the one-to-one mapping between investigations and subjects in this dataset.

**View `v_investigation_protected_disclosure`**

```sql
CREATE VIEW v_investigation_protected_disclosure AS
SELECT a.investigationId, a.startDate, a.endDate, a.status, b.disclosureId AS disclosure_disclosureId, b.disclosureDate AS disclosure_disclosureDate, b.disclosureMethod AS disclosure_disclosureMethod
FROM Investigation a JOIN ProtectedDisclosure b ON a.disclosureId = b.disclosureId;
```

| investigationId | startDate | endDate | status | disclosure_disclosureId | disclosure_disclosureDate | disclosure_disclosureMethod |
|---|---|---|---|---|---|---|
| 1 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | initiated | 1 | 2025-08-02T19:33:00 | email |
| 2 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | ongoing | 2 | 2022-01-13T02:50:00 | phone |
| 3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | 3 | 2023-06-24T09:07:00 | in_person |
| 4 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | suspended | 4 | 2024-11-08T16:24:00 | written_letter |

This view traces each investigation back to its originating disclosure. Row 1 connects investigation ID 1 to disclosure ID 1, and row 4 links investigation ID 4 to disclosure ID 4. The complete chain—from disclosure through investigation—ensures that no case exists without a documented origin.

## Investigators and Their Assignments

Investigators are the personnel responsible for examining reported misconduct. The investigator table records their role (chief compliance officer, designated investigator, or external auditor), their department, whether they are authorized to conduct investigations, and their contact information.

**Table `Investigator`**

| investigatorId | role | department | isAuthorized | contactEmail | investigationId | campusId |
|---|---|---|---|---|---|---|
| id_23 | chief_compliance_officer | adaptive-departme-89 | false | Christopher Wilson | 1 | 1 |
| 4011 | designated_investigator | distributed-departme-90 | true | Charles Larsen | 2 | 2 |
| 3158159 | external_auditor | baseline-departme-91 | false | Mary Alvarez | 3 | 3 |
| 4277008 | chief_compliance_officer | pilot-departme-92 | true | April Snyder | 4 | 4 |

Investigator ID `id_23` is a chief compliance officer in the `adaptive-departme-89` department, not currently authorized, with contact name Christopher Wilson. Investigator ID 4011 is a designated investigator in `distributed-departme-90`, authorized, contacted via Charles Larsen. Investigator ID 3158159 is an external auditor in `baseline-departme-91`, not authorized, with contact Mary Alvarez. Investigator ID 4277008 is a chief compliance officer in `pilot-departme-92`, authorized, contacted via April Snyder. The authorization flag varies across investigators, indicating that not all personnel with investigator records are currently cleared to conduct investigations.

**View `v_investigator_investigation`**

```sql
CREATE VIEW v_investigator_investigation AS
SELECT a.investigatorId, a.role, a.department, a.isAuthorized, b.investigationId AS investigation_investigationId, b.startDate AS investigation_startDate, b.endDate AS investigation_endDate
FROM Investigator a JOIN Investigation b ON a.investigationId = b.investigationId;
```

| investigatorId | role | department | isAuthorized | investigation_investigationId | investigation_startDate | investigation_endDate |
|---|---|---|---|---|---|---|
| id_23 | chief_compliance_officer | adaptive-departme-89 | false | 1 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 |
| 4011 | designated_investigator | distributed-departme-90 | true | 2 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 |
| 3158159 | external_auditor | baseline-departme-91 | false | 3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 |
| 4277008 | chief_compliance_officer | pilot-departme-92 | true | 4 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 |

This view pairs each investigator with the investigation they are assigned to. Row 1 links investigator ID `id_23` to investigation ID 1, row 2 links ID 4011 to investigation ID 2, and so on. The one-to-one mapping in this dataset suggests that each investigation has a single assigned investigator, though the underlying relationship structure could support multiple investigators per case.

**View `v_investigator_college_campus`**

```sql
CREATE VIEW v_investigator_college_campus AS
SELECT a.investigatorId, a.role, a.department, a.isAuthorized, b.id AS campus_id, b.campusId AS campus_campusId, b.campusName AS campus_campusName
FROM Investigator a JOIN CollegeCampus b ON a.campusId = b.id;
```

| investigatorId | role | department | isAuthorized | campus_id | campus_campusId | campus_campusName |
|---|---|---|---|---|---|---|
| id_23 | chief_compliance_officer | adaptive-departme-89 | false | 1 | ChIJ85Dnlftt5kcRmzn_mGUYJPE | davenport |
| 4011 | designated_investigator | distributed-departme-90 | true | 2 | 68f46afd953b4de8824b596a1bff565c | west |
| 3158159 | external_auditor | baseline-departme-91 | false | 3 | 18ba4c46-8fc8-11eb-924d-9cd76263cbd0 | florida |
| 4277008 | chief_compliance_officer | pilot-departme-92 | true | 4 | 3168 | davenport |

Situating investigators within their campuses, this view shows that investigator ID `id_23` operates at campus ID 1, ID 4011 at campus ID 2, ID 3158159 at campus ID 3, and ID 4277008 at campus ID 4. The geographic alignment of investigators with campuses reflects the decentralized nature of compliance operations across the university system.

## Investigation Subjects

Investigation subjects are the individuals or entities against whom allegations are made. The subject table records their role (employee, faculty, student, or third_party), their campus affiliation, whether they are themselves subjects of retaliation, and their contact information.

**Table `InvestigationSubject`**

| subjectId | role | campusAffiliation | isSubjectOfRetaliation | contactEmail | investigationId | campusId |
|---|---|---|---|---|---|---|
| 726063 | employee | davenport | false | Christopher Wilson | 1 | 1 |
| 2002007020260 | faculty | west | true | Charles Larsen | 2 | 2 |
| 5082972 | student | florida | false | Mary Alvarez | 3 | 3 |
| 4793476 | third_party | other | true | April Snyder | 4 | 4 |

Subject ID 726063 is an employee at Davenport, not subject to retaliation. Subject ID 2002007020260 is a faculty member at West who is subject to retaliation. Subject ID 5082972 is a student at Florida, not subject to retaliation. Subject ID 4793476 is a third party at an `other` campus who is subject to retaliation. The retaliation flag distinguishes subjects who may themselves be victims of reprisal, adding a layer of complexity to the investigative process.

**View `v_investigation_subject_investigation`**

```sql
CREATE VIEW v_investigation_subject_investigation AS
SELECT a.subjectId, a.role, a.campusAffiliation, a.isSubjectOfRetaliation, b.investigationId AS investigation_investigationId, b.startDate AS investigation_startDate, b.endDate AS investigation_endDate
FROM InvestigationSubject a JOIN Investigation b ON a.investigationId = b.investigationId;
```

| subjectId | role | campusAffiliation | isSubjectOfRetaliation | investigation_investigationId | investigation_startDate | investigation_endDate |
|---|---|---|---|---|---|---|
| 726063 | employee | davenport | false | 1 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 |
| 2002007020260 | faculty | west | true | 2 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 |
| 5082972 | student | florida | false | 3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 |
| 4793476 | third_party | other | true | 4 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 |

This view connects each subject to the investigation they are part of. Row 1 shows subject ID 726063 is under investigation ID 1, and row 4 links subject ID 4793476 to investigation ID 4. The view confirms that each subject is associated with exactly one investigation in this dataset.

**View `v_investigation_subject_college_campus`**

```sql
CREATE VIEW v_investigation_subject_college_campus AS
SELECT a.subjectId, a.role, a.campusAffiliation, a.isSubjectOfRetaliation, b.id AS campus_id, b.campusId AS campus_campusId, b.campusName AS campus_campusName
FROM InvestigationSubject a JOIN CollegeCampus b ON a.campusId = b.id;
```

| subjectId | role | campusAffiliation | isSubjectOfRetaliation | campus_id | campus_campusId | campus_campusName |
|---|---|---|---|---|---|---|
| 726063 | employee | davenport | false | 1 | ChIJ85Dnlftt5kcRmzn_mGUYJPE | davenport |
| 2002007020260 | faculty | west | true | 2 | 68f46afd953b4de8824b596a1bff565c | west |
| 5082972 | student | florida | false | 3 | 18ba4c46-8fc8-11eb-924d-9cd76263cbd0 | florida |
| 4793476 | third_party | other | true | 4 | 3168 | davenport |

Situating subjects within their campuses, this view shows subject ID 726063 at campus ID 1, ID 2002007020260 at campus ID 2, ID 5082972 at campus ID 3, and ID 4793476 at campus ID 4. The campus alignment mirrors that of investigators and disclosures, reinforcing the institutional structure of the compliance system.

## College Campuses

The college campus table provides the institutional context for all other records. Each campus has a unique identifier and serves as the anchor for whistleblowers, investigators, subjects, conduct records, and investigations.

**Table `CollegeCampus`**

| id | campusId | campusName | legalEntity | address | isActive | investigationId | investigatorId | whistleblowerId | subjectId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | ChIJ85Dnlftt5kcRmzn_mGUYJPE | davenport | composite-legal-27 | distributed-address-72 | true | 1 | id_23 | 100 | 726063 |
| 2 | 68f46afd953b4de8824b596a1bff565c | west | primary-legal-28 | baseline-address-73 | false | 2 | 4011 | 101 | 2002007020260 |
| 3 | 18ba4c46-8fc8-11eb-924d-9cd76263cbd0 | florida | adaptive-legal-29 | pilot-address-74 | true | 3 | 3158159 | 102 | 5082972 |
| 4 | 3168 | davenport | distributed-legal-30 | extended-address-75 | false | 4 | 4277008 | 103 | 4793476 |

Campus ID 1 corresponds to Davenport, ID 2 to West, ID 3 to Florida, and ID 4 to an `other` campus. These four institutions form the operational footprint of the compliance system, with each campus maintaining its own set of disclosures, investigations, and personnel.

**View `v_college_campus_investigation`**

```sql
CREATE VIEW v_college_campus_investigation AS
SELECT a.id, a.campusId, a.campusName, a.legalEntity, b.investigationId AS investigation_investigationId, b.startDate AS investigation_startDate, b.endDate AS investigation_endDate
FROM CollegeCampus a JOIN Investigation b ON a.investigationId = b.investigationId;
```

| id | campusId | campusName | legalEntity | investigation_investigationId | investigation_startDate | investigation_endDate |
|---|---|---|---|---|---|---|
| 1 | ChIJ85Dnlftt5kcRmzn_mGUYJPE | davenport | composite-legal-27 | 1 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 |
| 2 | 68f46afd953b4de8824b596a1bff565c | west | primary-legal-28 | 2 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 |
| 3 | 18ba4c46-8fc8-11eb-924d-9cd76263cbd0 | florida | adaptive-legal-29 | 3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 |
| 4 | 3168 | davenport | distributed-legal-30 | 4 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 |

This view links campuses to their investigations. Row 1 shows campus ID 1 hosts investigation ID 1, row 2 shows campus ID 2 hosts investigation ID 2, and so on. The view confirms that each campus in the system has exactly one active investigation record.

**View `v_college_campus_investigator`**

```sql
CREATE VIEW v_college_campus_investigator AS
SELECT a.id, a.campusId, a.campusName, a.legalEntity, b.investigatorId AS investigator_investigatorId, b.role AS investigator_role, b.department AS investigator_department
FROM CollegeCampus a JOIN Investigator b ON a.investigatorId = b.investigatorId;
```

| id | campusId | campusName | legalEntity | investigator_investigatorId | investigator_role | investigator_department |
|---|---|---|---|---|---|---|
| 1 | ChIJ85Dnlftt5kcRmzn_mGUYJPE | davenport | composite-legal-27 | id_23 | chief_compliance_officer | adaptive-departme-89 |
| 2 | 68f46afd953b4de8824b596a1bff565c | west | primary-legal-28 | 4011 | designated_investigator | distributed-departme-90 |
| 3 | 18ba4c46-8fc8-11eb-924d-9cd76263cbd0 | florida | adaptive-legal-29 | 3158159 | external_auditor | baseline-departme-91 |
| 4 | 3168 | davenport | distributed-legal-30 | 4277008 | chief_compliance_officer | pilot-departme-92 |

Pairing campuses with their investigators, this view shows campus ID 1 is served by investigator ID `id_23`, campus ID 2 by ID 4011, campus ID 3 by ID 3158159, and campus ID 4 by ID 4277008. The one-to-one mapping suggests a dedicated investigator per campus in this dataset.

**View `v_college_campus_whistleblower`**

```sql
CREATE VIEW v_college_campus_whistleblower AS
SELECT a.id, a.campusId, a.campusName, a.legalEntity, b.whistleblowerId AS whistleblower_whistleblowerId, b.role AS whistleblower_role, b.campusAffiliation AS whistleblower_campusAffiliation
FROM CollegeCampus a JOIN Whistleblower b ON a.whistleblowerId = b.whistleblowerId;
```

| id | campusId | campusName | legalEntity | whistleblower_whistleblowerId | whistleblower_role | whistleblower_campusAffiliation |
|---|---|---|---|---|---|---|
| 1 | ChIJ85Dnlftt5kcRmzn_mGUYJPE | davenport | composite-legal-27 | 100 | employee | davenport |
| 2 | 68f46afd953b4de8824b596a1bff565c | west | primary-legal-28 | 101 | faculty | west |
| 3 | 18ba4c46-8fc8-11eb-924d-9cd76263cbd0 | florida | adaptive-legal-29 | 102 | student | florida |
| 4 | 3168 | davenport | distributed-legal-30 | 103 | affiliated_person | other |

This view connects campuses to their whistleblowers. Row 1 links campus ID 1 to whistleblower ID 100, row 2 to ID 101, and so on. The view confirms that each campus has exactly one whistleblower on record.

**View `v_college_campus_investigation_subject`**

```sql
CREATE VIEW v_college_campus_investigation_subject AS
SELECT a.id, a.campusId, a.campusName, a.legalEntity, b.subjectId AS subject_subjectId, b.role AS subject_role, b.campusAffiliation AS subject_campusAffiliation
FROM CollegeCampus a JOIN InvestigationSubject b ON a.subjectId = b.subjectId;
```

| id | campusId | campusName | legalEntity | subject_subjectId | subject_role | subject_campusAffiliation |
|---|---|---|---|---|---|---|
| 1 | ChIJ85Dnlftt5kcRmzn_mGUYJPE | davenport | composite-legal-27 | 726063 | employee | davenport |
| 2 | 68f46afd953b4de8824b596a1bff565c | west | primary-legal-28 | 2002007020260 | faculty | west |
| 3 | 18ba4c46-8fc8-11eb-924d-9cd76263cbd0 | florida | adaptive-legal-29 | 5082972 | student | florida |
| 4 | 3168 | davenport | distributed-legal-30 | 4793476 | third_party | other |

Situating subjects within their campuses, this view shows campus ID 1 hosts subject ID 726063, campus ID 2 hosts ID 2002007020260, campus ID 3 hosts ID 5082972, and campus ID 4 hosts ID 4793476. The consistent one-to-one mapping across all views reinforces the tightly coupled structure of this compliance system.

## Cross-Cutting Relationships

The investigation-investigator junction table, `InvestigationInvestigator`, formalizes the assignment of investigators to investigations. While the current dataset shows a one-to-one mapping, the junction table structure allows for many-to-many relationships, supporting scenarios where multiple investigators collaborate on a single case or a single investigator handles multiple cases over time.

The views collectively form a comprehensive analytical framework. The `v_protected_disclosure_whistleblower` view answers who reported what; `v_improper_conduct_investigation_subject` answers who is implicated in what violation; `v_investigation_investigator_detail` answers who is investigating what case; and `v_college_campus_investigation` answers which campus is dealing with which investigation. Together, these views enable stakeholders to trace any compliance matter from its origin through its resolution, ensuring transparency and accountability at every step.

## Synthesis

The compliance investigation system documented here captures the full lifecycle of institutional misconduct reporting: from the initial protected disclosure through the identification of improper conduct, the assignment of investigators, the investigation of subjects, and the determination of corrective action. Each record—whether a disclosure filed by a student at Florida, a safety threat at severity level 62, or an external auditor from baseline-departme-91—contributes to a coherent audit trail. The campus-centric structure ensures that investigations remain grounded in their institutional context, while the flexible junction tables and comprehensive views support both simple and complex analytical queries. For practitioners, this system provides not only a mechanism for managing individual cases but also a foundation for organizational learning, pattern detection, and continuous improvement in institutional integrity.

## Data appendix

**Table `InvestigationInvestigator`**

| investigationId | investigatorId |
|---|---|
| 1 | id_23 |
| 1 | 4011 |
| 2 | 4011 |
| 2 | 3158159 |
| 3 | 3158159 |
| 3 | 4277008 |
| 4 | 4277008 |
| 4 | id_23 |
