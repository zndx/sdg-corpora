## Domain Modelling and Relational Materialization

The whistleblower protection and investigation domain captures the lifecycle of a protected disclosure from its initial reporting through investigation and resolution. At its core, the model tracks who reported a concern, what the concern was about, who is implicated, which campus the matter concerns, and how the investigation unfolds. The relational schema materializes this domain by decomposing it into seven base tables and one junction table, each normalizing a distinct entity type, and by providing a suite of views that reassemble the normalized facts into domain-meaningful projections. Every base table carries a primary key that serves as the stable record identifier, and every foreign key encodes a referential constraint that preserves the integrity of the relationships across the normalized structure.

### Base Tables and Entity Types

The anchor of the model is the `ProtectedDisclosure` table, which records the act of reporting itself. Its primary key `disclosureId` uniquely identifies each disclosure, while `disclosureDate` timestamps the event, `disclosureMethod` captures how the report was submitted (e.g., `email`, `phone`, `in_person`, `written_letter`), and `isGoodFaith` is a boolean flag indicating whether the reporter acted in good faith. The `contentSummary` column holds a human-readable description such as `seasonal-content-41` or `regional-content-42`, and `status` tracks the procedural state of the disclosure through values like `submitted`, `under_review`, `investigated`, and `closed`. Three foreign keys — `whistleblowerId`, `conductId`, and `investigationId` — link the disclosure to the whistleblower who made it, the improper conduct being reported, and the investigation opened in response.

**Table `ProtectedDisclosure`**

| disclosureId | disclosureDate | disclosureMethod | isGoodFaith | contentSummary | status | whistleblowerId | conductId | investigationId |
|---|---|---|---|---|---|---|---|---|
| 1 | 2025-08-02T19:33:00 | email | true | seasonal-content-41 | submitted | 100 | 1 | 1 |
| 2 | 2022-01-13T02:50:00 | phone | false | regional-content-42 | under_review | 101 | 2 | 2 |
| 3 | 2023-06-24T09:07:00 | in_person | true | legacy-content-43 | investigated | 102 | 3 | 3 |
| 4 | 2024-11-08T16:24:00 | written_letter | false | compact-content-44 | closed | 103 | 4 | 4 |

The `Whistleblower` table stores the identity and attributes of the person making the report. Its primary key `whistleblowerId` (values such as `100`, `101`, `102`, `103`) distinguishes individual whistleblowers. The `role` column classifies the whistleblower as `employee`, `faculty`, `student`, or `affiliated_person`. The `campusAffiliation` column records the campus association — `davenport`, `west`, `florida`, or `other` — while `isProtectedFromRetaliation` is a boolean indicating legal protection status. Contact information is captured in `contactEmail` and `contactPhone`, with values like `Christopher Wilson` and `Joe Tsai` appearing as representative entries. The foreign key `disclosureId` creates a one-to-one link back to `ProtectedDisclosure`, and `campusId` references the `CollegeCampus` table.

**Table `Whistleblower`**

| whistleblowerId | role | campusAffiliation | isProtectedFromRetaliation | contactEmail | contactPhone | disclosureId | campusId |
|---|---|---|---|---|---|---|---|
| 100 | employee | davenport | false | Christopher Wilson | Joe Tsai | 1 | 1 |
| 101 | faculty | west | true | Charles Larsen | Stephanie Collins | 2 | 2 |
| 102 | student | florida | false | Mary Alvarez | Tasha Rodriguez | 3 | 3 |
| 103 | affiliated_person | other | true | April Snyder | Walter Pratt | 4 | 4 |

The `ImproperConduct` table describes the alleged wrongdoing. Its primary key `id` is a UUID-style identifier (e.g., `e5a1c32e-8fc3-11eb-924d-9cd76263cbd0`), while `conductId` is a numeric alias (e.g., `2986238`, `3744007`) that may serve as a business key. The `conductType` column enumerates categories such as `legal_violation`, `misuse_of_resources`, `economic_waste`, and `safety_threat`. The `description` field provides a free-text label like `Extended Survey` or `Pilot Corridor A`. The `occurrenceDate` records when the conduct took place, `severityLevel` is a numeric score (values range from `29` to `62` in the sample data), and `isCriminal` is a boolean flag. Foreign keys `disclosureId`, `subjectId`, and `campusId` connect the conduct record to the disclosure that reported it, the investigation subject implicated, and the campus where it occurred.

**Table `ImproperConduct`**

| id | conductId | conductType | description | occurrenceDate | severityLevel | isCriminal | disclosureId | subjectId | campusId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 2986238 | legal_violation | Extended Survey | 2024-03-17 | 29 | false | 1 | 726063 | 1 |
| 2 | 3744007 | misuse_of_resources | Pilot Corridor A | 2025-08-01 | 40 | true | 2 | 2002007020260 | 2 |
| 3 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | economic_waste | Baseline Series | 2022-01-12 | 51 | false | 3 | 5082972 | 3 |
| 4 | 10238282 | safety_threat | Distributed Assessment | 2023-06-23 | 62 | true | 4 | 4793476 | 4 |

The `Investigation` table tracks the procedural lifecycle of each inquiry. Its primary key `investigationId` (values `1` through `4`) identifies individual investigations. The `startDate` and `endDate` columns record the temporal bounds of the investigation, with sample dates such as `2022-09-05T20:24:00` and `2022-09-01T08:00:00`. The `status` column progresses through states like `initiated`, `ongoing`, `completed`, and `suspended`. The `findingsSummary` column holds a summary string (e.g., `pilot-findings-32`, `extended-findings-33`), and `correctiveActionTaken` is a boolean indicating whether remediation was implemented. Foreign keys `conductId`, `subjectId`, and `disclosureId` link the investigation to the underlying improper conduct, the subject under investigation, and the originating disclosure.

**Table `Investigation`**

| investigationId | startDate | endDate | status | findingsSummary | correctiveActionTaken | conductId | subjectId | disclosureId |
|---|---|---|---|---|---|---|---|---|
| 1 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | initiated | pilot-findings-32 | true | 1 | 726063 | 1 |
| 2 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | ongoing | extended-findings-33 | false | 2 | 2002007020260 | 2 |
| 3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | integrated-findings-34 | true | 3 | 5082972 | 3 |
| 4 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | suspended | seasonal-findings-35 | false | 4 | 4793476 | 4 |

The `Investigator` table stores the personnel assigned to conduct investigations. Its primary key `investigatorId` uses a mixed format — some values are UUID-like (`id_23`) while others are numeric (`4011`, `3158159`, `4277008`). The `role` column classifies the investigator as `chief_compliance_officer`, `designated_investigator`, or `external_auditor`. The `department` column records the organizational unit (e.g., `adaptive-departme-89`, `distributed-departme-90`). The `isAuthorized` boolean indicates whether the investigator has formal authorization, and `contactEmail` stores contact information. The foreign key `investigationId` associates the investigator with a specific investigation, and `campusId` references the `CollegeCampus` table.

**Table `Investigator`**

| investigatorId | role | department | isAuthorized | contactEmail | investigationId | campusId |
|---|---|---|---|---|---|---|
| id_23 | chief_compliance_officer | adaptive-departme-89 | false | Christopher Wilson | 1 | 1 |
| 4011 | designated_investigator | distributed-departme-90 | true | Charles Larsen | 2 | 2 |
| 3158159 | external_auditor | baseline-departme-91 | false | Mary Alvarez | 3 | 3 |
| 4277008 | chief_compliance_officer | pilot-departme-92 | true | April Snyder | 4 | 4 |

The `InvestigationSubject` table captures the identity of persons or entities under investigation. Its primary key `subjectId` uses varied formats — numeric (`726063`, `5082972`, `4793476`) and longer numeric strings (`2002007020260`). The `role` column classifies the subject as `employee`, `faculty`, `student`, or `third_party`. The `campusAffiliation` column mirrors the whistleblower's campus association, and `isSubjectOfRetaliation` is a boolean flag. The `contactEmail` field stores contact details. Foreign keys `investigationId` and `campusId` link the subject to the investigation and the campus.

**Table `InvestigationSubject`**

| subjectId | role | campusAffiliation | isSubjectOfRetaliation | contactEmail | investigationId | campusId |
|---|---|---|---|---|---|---|
| 726063 | employee | davenport | false | Christopher Wilson | 1 | 1 |
| 2002007020260 | faculty | west | true | Charles Larsen | 2 | 2 |
| 5082972 | student | florida | false | Mary Alvarez | 3 | 3 |
| 4793476 | third_party | other | true | April Snyder | 4 | 4 |

The `CollegeCampus` table serves as the lookup dimension for campus entities. While the table itself contains no payload block in this chapter, every other table that references a campus does so through the `campusId` foreign key, with values `1` through `4` corresponding to campuses such as `davenport`, `west`, `florida`, and `other`. This normalization ensures that campus information is stored once and referenced consistently across the schema.

### The Junction Table

The `InvestigationInvestigator` table is a junction (associative) table that resolves a many-to-many relationship between `Investigation` and `Investigator`. In the current data, each investigation is associated with exactly one investigator, and each investigator is assigned to exactly one investigation, making the relationship effectively one-to-one in practice. The junction table exists to support future scenarios where an investigation might involve multiple investigators or an investigator might be assigned to multiple investigations. The table's composite key would consist of `investigationId` and `investigatorId`, each serving as a foreign key referencing its respective parent table.

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

### View-Based Reassembly of Domain Facts

The views in this schema are the primary interface for querying domain facts. Each view performs a join across two or more base tables to reconstruct a coherent narrative from the normalized structure. The views fall into two categories: those that present a parent table enriched with its child or related entity, and those that present a child table enriched with its parent or related entity.

The view `v_protected_disclosure_whistleblower` joins `ProtectedDisclosure` with `Whistleblower` on `disclosureId = whistleblowerId`, answering the question "who reported each disclosure and what are their attributes?" A row from this view might show disclosure `1` with `disclosureMethod = email`, `isGoodFaith = true`, and the whistleblower's role as `employee` with campus affiliation `davenport`.

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

The view `v_protected_disclosure_improper_conduct` joins `ProtectedDisclosure` with `ImproperConduct` on `conductId`, answering "what improper conduct was reported in each disclosure?" A representative row shows disclosure `1` linked to conduct type `legal_violation` with description `Extended Survey`, severity level `29`, and `isCriminal = false`.

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

The view `v_protected_disclosure_investigation` joins `ProtectedDisclosure` with `Investigation` on `investigationId`, answering "what investigation was opened for each disclosure?" A row might display disclosure `1` with status `submitted` alongside investigation `1` with status `initiated`, findings summary `pilot-findings-32`, and `correctiveActionTaken = true`.

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

The view `v_whistleblower_protected_disclosure` reverses the perspective, joining `Whistleblower` with `ProtectedDisclosure` to answer "what disclosures has each whistleblower made?" A row shows whistleblower `100` (role `employee`, campus `davenport`) linked to disclosure `1` with method `email` and status `submitted`.

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

The view `v_whistleblower_college_campus` joins `Whistleblower` with `CollegeCampus` on `campusId`, answering "which campus is each whistleblower affiliated with?" A row might show whistleblower `101` (role `faculty`) affiliated with campus `2` (west).

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

The view `v_improper_conduct_protected_disclosure` joins `ImproperConduct` with `ProtectedDisclosure` on `disclosureId`, answering "which disclosure reported this conduct?" A row shows conduct `1` (type `legal_violation`, description `Extended Survey`) reported by disclosure `1`.

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

The view `v_improper_conduct_investigation_subject` joins `ImproperConduct` with `InvestigationSubject` on `subjectId`, answering "who is the subject of the reported conduct?" A row might display conduct `1` linked to subject `726063` (role `employee`, campus `davenport`, not subject of retaliation).

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

The view `v_improper_conduct_college_campus` joins `ImproperConduct` with `CollegeCampus` on `campusId`, answering "on which campus did this conduct occur?" A row shows conduct `1` occurring on campus `1` (davenport).

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

The view `v_investigation_improper_conduct` joins `Investigation` with `ImproperConduct` on `conductId`, answering "what conduct is this investigation examining?" A row displays investigation `1` (status `initiated`, findings `pilot-findings-32`) examining conduct `1` (type `legal_violation`, severity `29`).

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

The view `v_investigation_investigator_detail` joins `Investigation` with `Investigator` on `investigationId`, answering "which investigator is assigned to this investigation?" A row might show investigation `1` assigned to investigator `id_23` (role `chief_compliance_officer`, department `adaptive-departme-89`, not authorized).

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

The view `v_investigation_investigation_subject` joins `Investigation` with `InvestigationSubject` on `subjectId`, answering "who is the subject of this investigation?" A row displays investigation `1` (status `initiated`) with subject `726063` (role `employee`, campus `davenport`).

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

The view `v_investigation_protected_disclosure` joins `Investigation` with `ProtectedDisclosure` on `disclosureId`, answering "which disclosure triggered this investigation?" A row shows investigation `1` (status `initiated`, corrective action `true`) triggered by disclosure `1` (method `email`, good faith `true`).

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

The view `v_investigator_investigation` joins `Investigator` with `Investigation` on `investigationId`, answering "what investigation is this investigator working on?" A row might display investigator `4011` (role `designated_investigator`, department `distributed-departme-90`, authorized) working on investigation `2` (status `ongoing`, findings `extended-findings-33`).

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

The view `v_investigator_college_campus` joins `Investigator` with `CollegeCampus` on `campusId`, answering "which campus does this investigator serve?" A row shows investigator `3158159` (role `external_auditor`) serving campus `3` (florida).

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

The view `v_investigation_subject_investigation` joins `InvestigationSubject` with `Investigation` on `investigationId`, answering "which investigation is this subject part of?" A row displays subject `2002007020260` (role `faculty`, campus `west`, subject of retaliation `true`) in investigation `2` (status `ongoing`).

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

The view `v_investigation_subject_college_campus` joins `InvestigationSubject` with `CollegeCampus` on `campusId`, answering "which campus is this subject affiliated with?" A row shows subject `5082972` (role `student`) affiliated with campus `3` (florida).

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

The view `v_college_campus_investigation` joins `CollegeCampus` with `Investigation` on `campusId`, answering "what investigations are occurring on this campus?" A row might display campus `1` (davenport) with investigation `1` (status `initiated`, corrective action `true`).

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

The view `v_college_campus_investigator` joins `CollegeCampus` with `Investigator` on `campusId`, answering "which investigators serve this campus?" A row shows campus `2` (west) with investigator `4011` (role `designated_investigator`, authorized).

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

The view `v_college_campus_whistleblower` joins `CollegeCampus` with `Whistleblower` on `campusId`, answering "which whistleblowers are affiliated with this campus?" A row displays campus `3` (florida) with whistleblower `102` (role `student`, not protected from retaliation).

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

The view `v_college_campus_investigation_subject` joins `CollegeCampus` with `InvestigationSubject` on `campusId`, answering "which subjects are affiliated with this campus?" A row shows campus `4` (other) with subject `4793476` (role `third_party`, subject of retaliation `true`).

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

### Synthesis

The schema models the whistleblower investigation domain through a star-like topology centered on `ProtectedDisclosure`, with `ImproperConduct`, `Investigation`, `Whistleblower`, `Investigator`, and `InvestigationSubject` radiating as related entities. The `CollegeCampus` table serves as a shared dimension referenced by nearly every entity, ensuring campus-level aggregation is always possible. Foreign keys enforce referential integrity: every `whistleblowerId` in `ProtectedDisclosure` must exist in `Whistleblower`, every `conductId` must exist in `ImproperConduct`, and so on. The junction table `InvestigationInvestigator` provides the structural flexibility for many-to-many relationships even though the current data exhibits one-to-one cardinality. The view layer reassembles the normalized facts into domain-meaningful projections, each answering a specific question about the relationship between two entity types. Together, the base tables and views provide a complete, queryable representation of the whistleblower protection and investigation lifecycle.

## Data appendix

**Table `CollegeCampus`**

| id | campusId | campusName | legalEntity | address | isActive | investigationId | investigatorId | whistleblowerId | subjectId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | ChIJ85Dnlftt5kcRmzn_mGUYJPE | davenport | composite-legal-27 | distributed-address-72 | true | 1 | id_23 | 100 | 726063 |
| 2 | 68f46afd953b4de8824b596a1bff565c | west | primary-legal-28 | baseline-address-73 | false | 2 | 4011 | 101 | 2002007020260 |
| 3 | 18ba4c46-8fc8-11eb-924d-9cd76263cbd0 | florida | adaptive-legal-29 | pilot-address-74 | true | 3 | 3158159 | 102 | 5082972 |
| 4 | 3168 | davenport | distributed-legal-30 | extended-address-75 | false | 4 | 4277008 | 103 | 4793476 |
