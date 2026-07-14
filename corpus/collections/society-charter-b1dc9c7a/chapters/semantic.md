## Domain Modelling and Relational Materialisation

The domain under consideration concerns the governance and professional lifecycle of medical societies. At its core, a society is a legally chartered entity that defines membership categories, convenes meetings, and sponsors fellowship programmes through which individual medical professionals advance their qualifications. The data model captures this ecosystem across five base tables and seven derived views, each serving a distinct role in the normalisation of organisational, professional, and programme data. The model is deliberately third-normal-form: entity types are separated into their own tables, relationships are expressed through foreign keys, and analytical queries are assembled via views that join the normalised pieces back together. This chapter walks through the entity types, their attributes, the cardinality-bounded relationships that bind them, and the view-level joins that reconstruct domain facts for reporting.

**Table `SocietyCharter`**

| id | legalName | principalOfficeAddress | registeredOfficeAddress | jurisdictionState | charitablePurposeStatement |
|---|---|---|---|---|---|
| 1 | Adaptive Model | pilot-principa-14 | regional-register-90 | seasonal-jurisdic-35 | primary-charitab-82 |
| 2 | Primary Cluster | extended-principa-15 | legacy-register-91 | regional-jurisdic-36 | adaptive-charitab-83 |
| 3 | Composite Review D | integrated-principa-16 | compact-register-92 | legacy-jurisdic-37 | distributed-charitab-84 |
| 4 | Compact Initiative | seasonal-principa-17 | composite-register-93 | compact-jurisdic-38 | baseline-charitab-85 |

The `SocietyCharter` table is the organisational root of the domain. Each row represents a legally chartered medical society, identified by a surrogate integer `id` and distinguished by a `legalName` such as `Adaptive Model`, `Primary Cluster`, `Composite Review D`, and `Compact Initiative`. The table carries two address columns — `principalOfficeAddress` and `registeredOfficeAddress` — which hold values like `pilot-principa-14` and `regional-register-90` for the first charter, and a `jurisdictionState` column (e.g. `seasonal-jurisdic-35`) that records the state of incorporation. The `charitablePurposeStatement` column stores a free-text description of the society's mission. Because every other entity in the model ultimately traces its authority back to a charter, `SocietyCharter.id` is referenced as a foreign key by `MembershipCategory`, `SocietyMeeting`, and `FellowshipProgram`, establishing a one-to-many relationship: a single charter sponsors many membership categories, convenes many meetings, and funds many fellowship programmes.

**Table `MembershipCategory`**

| id | categoryName | requiresMedicalLicense | requiresBoardCertification | requiresFellowshipTraining | requiresPeerRecommendations | requiresPublications | charterId |
|---|---|---|---|---|---|---|---|
| 1 | Charter Member | true | true | true | 35 | 43 | 1 |
| 2 | Member | false | false | false | 38 | 49 | 2 |
| 3 | Associate Member | true | true | true | 41 | 55 | 3 |
| 4 | Member Emeritus | false | false | false | 44 | 61 | 4 |

The `MembershipCategory` table enumerates the tiers of membership that a charter authorises. Each row is identified by `id` and named via `categoryName` — `Charter Member`, `Member`, `Associate Member`, and `Member Emeritus` in the four rows of the sample data. The table encodes eligibility requirements as a set of boolean flags: `requiresMedicalLicense`, `requiresBoardCertification`, `requiresFellowshipTraining`, and two integer columns, `requiresPeerRecommendations` and `requiresPublications`, which store minimum counts (e.g. `35` peer recommendations and `43` publications for the `Charter Member` tier). The foreign key `charterId` links each category back to its sponsoring `SocietyCharter`. This is a classic one-to-many relationship: the charter with `id = 1` (`Adaptive Model`) sponsors the `Charter Member` category, while the charter with `id = 2` (`Primary Cluster`) sponsors the `Member` category. The boolean flags are not FKs but rather constraints that the application layer evaluates when assessing a professional's eligibility for a given tier.

**Table `MedicalProfessional`**

| id | licenseState | boardCertificationBody | pediatricPracticePercentage | yearsPostFellowship | peerReviewPublicationsCount | meetsEligibilityCriteria | categoryId | meetingId |
|---|---|---|---|---|---|---|---|---|
| 100 | compact-license-86 | American Board of Otolaryngology | 10.20 | 39 | 19 | false | 1 | 1 |
| 101 | composite-license-87 | Royal College of Surgeons (Canada) | 14.40 | 44 | 18 | true | 2 | 2 |
| 102 | primary-license-88 | Royal College of Physicians and Surgeons of Canada | 18.60 | 49 | 33 | false | 3 | 3 |
| 103 | adaptive-license-89 | American Board of Otolaryngology | 22.80 | 54 | 9 | true | 4 | 4 |

The `MedicalProfessional` table is the central person entity. Each row represents an individual practitioner, identified by `id` (e.g. `100`, `101`, `102`, `103`). The table captures professional credentials through `licenseState` (e.g. `compact-license-86`), `boardCertificationBody` (e.g. `American Board of Otolaryngology`, `Royal College of Surgeons (Canada)`), and `pediatricPracticePercentage`, a decimal column recording the proportion of the professional's practice devoted to paediatric otolaryngology (values range from `10.20` to `22.80`). The `yearsPostFellowship` column stores an integer count of years elapsed since fellowship completion, while `peerReviewPublicationsCount` records the number of peer-reviewed publications. The boolean `meetsEligibilityCriteria` column is a derived flag that the application computes by comparing the professional's credentials against the requirements of their assigned `MembershipCategory`. Two foreign keys anchor the professional to the rest of the model: `categoryId` references `MembershipCategory.id`, and `meetingId` references `SocietyMeeting.id`. The `categoryId` FK expresses a many-to-one relationship — many professionals belong to the same membership category — while `meetingId` expresses a many-to-one relationship to a specific society meeting.

**Table `SocietyMeeting`**

| id | meetingDate | meetingType | location | isEligibilityRequirement | charterId | professionalId |
|---|---|---|---|---|---|---|
| 1 | 2023-10-23T21:39:00 | Postgraduate Meeting | extended-location-99 | false | 1 | 100 |
| 2 | 2024-03-07T04:56:00 | Seminar | integrated-location-100 | true | 2 | 101 |
| 3 | 2025-08-18T11:13:00 | Organizational Meeting | seasonal-location-101 | false | 3 | 102 |
| 4 | 2022-01-02T18:30:00 | Postgraduate Meeting | regional-location-102 | true | 4 | 103 |

The `SocietyMeeting` table records individual meetings convened by a charter. Each row carries an `id`, a `meetingDate` (ISO 8601 timestamps such as `2023-10-23T21:39:00`), a `meetingType` (e.g. `Postgraduate Meeting`, `Seminar`, `Organizational Meeting`), and a `location` column (e.g. `extended-location-99`). The boolean `isEligibilityRequirement` flag indicates whether attendance at this meeting is mandatory for membership eligibility. Two foreign keys are present: `charterId` references `SocietyCharter.id`, establishing that a charter convenes many meetings, and `professionalId` references `MedicalProfessional.id`, establishing that a meeting is associated with a specific professional. The latter is a many-to-one relationship in the current data — each meeting row points to one professional — though the schema could support a many-to-many relationship if the FK were moved to a junction table. In the current design, the `professionalId` FK on `SocietyMeeting` effectively pairs each meeting with a single attendee or presenter.

**Table `FellowshipProgram`**

| id | programName | durationYears | isPediatricOtolaryngology | completionDate | professionalId | charterId |
|---|---|---|---|---|---|---|
| 1 | Extended Review | 14 | true | 2024-03-14 | 100 | 1 |
| 2 | Pilot Initiative A | 18 | false | 2025-08-25 | 101 | 2 |
| 3 | Baseline Model | 22 | true | 2022-01-09 | 102 | 3 |
| 4 | Distributed Cluster | 26 | false | 2023-06-20 | 103 | 4 |

The `FellowshipProgram` table captures the fellowship programmes that charters sponsor and professionals complete. Each row is identified by `id` and named via `programName` (e.g. `Extended Review`, `Pilot Initiative A`, `Baseline Model`, `Distributed Cluster`). The `durationYears` column stores an integer (values of `14`, `18`, `22`, `26` in the sample data), and the boolean `isPediatricOtolaryngology` flag indicates whether the programme is specialised in paediatric otolaryngology. The `completionDate` column records the date the professional completed the programme (e.g. `2024-03-14`). Two foreign keys anchor the programme: `professionalId` references `MedicalProfessional.id`, expressing that a professional completes many fellowship programmes, and `charterId` references `SocietyCharter.id`, expressing that a charter sponsors many fellowship programmes. This table thus sits at the intersection of the person and organisational dimensions of the model.

The five base tables together form a star-like schema centred on `SocietyCharter`. The foreign key topology can be summarised as follows: `MembershipCategory.charterId → SocietyCharter.id`, `MedicalProfessional.categoryId → MembershipCategory.id`, `MedicalProfessional.meetingId → SocietyMeeting.id`, `SocietyMeeting.charterId → SocietyCharter.id`, `SocietyMeeting.professionalId → MedicalProfessional.id`, `FellowshipProgram.professionalId → MedicalProfessional.id`, and `FellowshipProgram.charterId → SocietyCharter.id`. Every FK is a many-to-one relationship from the referencing table to the referenced table, and the normalisation eliminates redundancy by storing each entity's attributes in exactly one place.

The views materialise analytical joins that reconstruct domain facts from the normalised tables. Each view answers a specific question by bringing together two base tables.

**View `v_membership_category_society_charter`**

```sql
CREATE VIEW v_membership_category_society_charter AS
SELECT a.id, a.categoryName, a.requiresMedicalLicense, a.requiresBoardCertification, b.id AS charter_id, b.legalName AS charter_legalName, b.principalOfficeAddress AS charter_principalOfficeAddress
FROM MembershipCategory a JOIN SocietyCharter b ON a.charterId = b.id;
```

| id | categoryName | requiresMedicalLicense | requiresBoardCertification | charter_id | charter_legalName | charter_principalOfficeAddress |
|---|---|---|---|---|---|---|
| 1 | Charter Member | true | true | 1 | Adaptive Model | pilot-principa-14 |
| 2 | Member | false | false | 2 | Primary Cluster | extended-principa-15 |
| 3 | Associate Member | true | true | 3 | Composite Review D | integrated-principa-16 |
| 4 | Member Emeritus | false | false | 4 | Compact Initiative | seasonal-principa-17 |

The view `v_membership_category_society_charter` joins `MembershipCategory` with `SocietyCharter` on `charterId = id`, producing a denormalised row per membership category that includes the category's eligibility flags alongside the charter's legal name and principal office address. The view answers the question: "For each membership category, which charter sponsors it, and what are the charter's identifying details?" Reading the first row as evidence, the `Charter Member` category (which requires a medical license, board certification, fellowship training, at least `35` peer recommendations, and `43` publications) is sponsored by the charter with `legalName = Adaptive Model` and `principalOfficeAddress = pilot-principa-14`. The second row shows that the `Member` category — which requires no license, no board certification, and no fellowship training, but demands `38` peer recommendations and `49` publications — is sponsored by `Primary Cluster`. This view is useful for compliance reporting, where a regulator or auditor needs to see each category's requirements in the context of its sponsoring organisation.

**View `v_medical_professional_membership_category`**

```sql
CREATE VIEW v_medical_professional_membership_category AS
SELECT a.id, a.licenseState, a.boardCertificationBody, a.pediatricPracticePercentage, b.id AS category_id, b.categoryName AS category_categoryName, b.requiresMedicalLicense AS category_requiresMedicalLicense
FROM MedicalProfessional a JOIN MembershipCategory b ON a.categoryId = b.id;
```

| id | licenseState | boardCertificationBody | pediatricPracticePercentage | category_id | category_categoryName | category_requiresMedicalLicense |
|---|---|---|---|---|---|---|
| 100 | compact-license-86 | American Board of Otolaryngology | 10.20 | 1 | Charter Member | true |
| 101 | composite-license-87 | Royal College of Surgeons (Canada) | 14.40 | 2 | Member | false |
| 102 | primary-license-88 | Royal College of Physicians and Surgeons of Canada | 18.60 | 3 | Associate Member | true |
| 103 | adaptive-license-89 | American Board of Otolaryngology | 22.80 | 4 | Member Emeritus | false |

The view `v_medical_professional_membership_category` joins `MedicalProfessional` with `MembershipCategory` on `categoryId = id`, producing a row per professional that includes the professional's credentials alongside the membership category's eligibility requirements. This view answers: "Which membership category does each professional belong to, and what are that category's requirements?" The first row shows professional `100` (licensed in `compact-license-86`, certified by the `American Board of Otolaryngology`, with `10.20`% paediatric practice and `19` publications) belongs to the `Charter Member` category, which requires a medical license, board certification, fellowship training, `35` peer recommendations, and `43` publications. Notably, the professional's `meetsEligibilityCriteria` flag is `false`, indicating that despite belonging to this category, the professional does not currently satisfy all of its requirements — perhaps because the publication count of `19` falls short of the required `43`. The second row shows professional `101` (certified by the `Royal College of Surgeons (Canada)`, with `14.40`% paediatric practice and `18` publications) belongs to the `Member` category and has `meetsEligibilityCriteria = true`, suggesting all of that category's requirements are satisfied.

**View `v_medical_professional_society_meeting`**

```sql
CREATE VIEW v_medical_professional_society_meeting AS
SELECT a.id, a.licenseState, a.boardCertificationBody, a.pediatricPracticePercentage, b.id AS meeting_id, b.meetingDate AS meeting_meetingDate, b.meetingType AS meeting_meetingType
FROM MedicalProfessional a JOIN SocietyMeeting b ON a.meetingId = b.id;
```

| id | licenseState | boardCertificationBody | pediatricPracticePercentage | meeting_id | meeting_meetingDate | meeting_meetingType |
|---|---|---|---|---|---|---|
| 100 | compact-license-86 | American Board of Otolaryngology | 10.20 | 1 | 2023-10-23T21:39:00 | Postgraduate Meeting |
| 101 | composite-license-87 | Royal College of Surgeons (Canada) | 14.40 | 2 | 2024-03-07T04:56:00 | Seminar |
| 102 | primary-license-88 | Royal College of Physicians and Surgeons of Canada | 18.60 | 3 | 2025-08-18T11:13:00 | Organizational Meeting |
| 103 | adaptive-license-89 | American Board of Otolaryngology | 22.80 | 4 | 2022-01-02T18:30:00 | Postgraduate Meeting |

The view `v_medical_professional_society_meeting` joins `MedicalProfessional` with `SocietyMeeting` on `meetingId = id`, producing a row per professional that includes the meeting's date, type, location, and eligibility flag. This view answers: "Which meeting is each professional associated with, and what are the meeting's details?" The first row pairs professional `100` with the meeting held on `2023-10-23T21:39:00`, a `Postgraduate Meeting` at `extended-location-99` that is not an eligibility requirement (`isEligibilityRequirement = false`). The second row pairs professional `101` with a `Seminar` held on `2024-03-07T04:56:00` at `integrated-location-100`, which is an eligibility requirement (`isEligibilityRequirement = true`). This view is useful for tracking professional engagement with society events and for identifying which meetings are mandatory for membership maintenance.

**View `v_society_meeting_society_charter`**

```sql
CREATE VIEW v_society_meeting_society_charter AS
SELECT a.id, a.meetingDate, a.meetingType, a.location, b.id AS charter_id, b.legalName AS charter_legalName, b.principalOfficeAddress AS charter_principalOfficeAddress
FROM SocietyMeeting a JOIN SocietyCharter b ON a.charterId = b.id;
```

| id | meetingDate | meetingType | location | charter_id | charter_legalName | charter_principalOfficeAddress |
|---|---|---|---|---|---|---|
| 1 | 2023-10-23T21:39:00 | Postgraduate Meeting | extended-location-99 | 1 | Adaptive Model | pilot-principa-14 |
| 2 | 2024-03-07T04:56:00 | Seminar | integrated-location-100 | 2 | Primary Cluster | extended-principa-15 |
| 3 | 2025-08-18T11:13:00 | Organizational Meeting | seasonal-location-101 | 3 | Composite Review D | integrated-principa-16 |
| 4 | 2022-01-02T18:30:00 | Postgraduate Meeting | regional-location-102 | 4 | Compact Initiative | seasonal-principa-17 |

The view `v_society_meeting_society_charter` joins `SocietyMeeting` with `SocietyCharter` on `charterId = id`, producing a row per meeting that includes the charter's legal name and principal office address. This view answers: "Which charter convenes each meeting, and what are the charter's identifying details?" The first row shows that the meeting on `2023-10-23T21:39:00` (a `Postgraduate Meeting` at `extended-location-99`) is convened by the charter with `legalName = Adaptive Model` and `principalOfficeAddress = pilot-principa-14`. The fourth row shows that the meeting on `2022-01-02T18:30:00` (a `Postgraduate Meeting` at `regional-location-102`) is convened by `Compact Initiative` (`seasonal-principa-17`). This view supports event-level reporting by attributing each meeting to its sponsoring organisation.

**View `v_society_meeting_medical_professional`**

```sql
CREATE VIEW v_society_meeting_medical_professional AS
SELECT a.id, a.meetingDate, a.meetingType, a.location, b.id AS professional_id, b.licenseState AS professional_licenseState, b.boardCertificationBody AS professional_boardCertificationBody
FROM SocietyMeeting a JOIN MedicalProfessional b ON a.professionalId = b.id;
```

| id | meetingDate | meetingType | location | professional_id | professional_licenseState | professional_boardCertificationBody |
|---|---|---|---|---|---|---|
| 1 | 2023-10-23T21:39:00 | Postgraduate Meeting | extended-location-99 | 100 | compact-license-86 | American Board of Otolaryngology |
| 2 | 2024-03-07T04:56:00 | Seminar | integrated-location-100 | 101 | composite-license-87 | Royal College of Surgeons (Canada) |
| 3 | 2025-08-18T11:13:00 | Organizational Meeting | seasonal-location-101 | 102 | primary-license-88 | Royal College of Physicians and Surgeons of Canada |
| 4 | 2022-01-02T18:30:00 | Postgraduate Meeting | regional-location-102 | 103 | adaptive-license-89 | American Board of Otolaryngology |

The view `v_society_meeting_medical_professional` joins `SocietyMeeting` with `MedicalProfessional` on `professionalId = id`, producing a row per meeting that includes the professional's license state, board certification body, and paediatric practice percentage. This view answers: "Which professional is associated with each meeting, and what are that professional's credentials?" The first row shows that the meeting on `2023-10-23T21:39:00` is associated with professional `100`, who holds a `compact-license-86`, is certified by the `American Board of Otolaryngology`, and has a `10.20`% paediatric practice. The third row shows that the meeting on `2025-08-18T11:13:00` (an `Organizational Meeting` at `seasonal-location-101`) is associated with professional `102`, who holds a `primary-license-88`, is certified by the `Royal College of Physicians and Surgeons of Canada`, and has an `18.60`% paediatric practice. This view is useful for understanding the professional composition of society meetings.

**View `v_fellowship_program_medical_professional`**

```sql
CREATE VIEW v_fellowship_program_medical_professional AS
SELECT a.id, a.programName, a.durationYears, a.isPediatricOtolaryngology, b.id AS professional_id, b.licenseState AS professional_licenseState, b.boardCertificationBody AS professional_boardCertificationBody
FROM FellowshipProgram a JOIN MedicalProfessional b ON a.professionalId = b.id;
```

| id | programName | durationYears | isPediatricOtolaryngology | professional_id | professional_licenseState | professional_boardCertificationBody |
|---|---|---|---|---|---|---|
| 1 | Extended Review | 14 | true | 100 | compact-license-86 | American Board of Otolaryngology |
| 2 | Pilot Initiative A | 18 | false | 101 | composite-license-87 | Royal College of Surgeons (Canada) |
| 3 | Baseline Model | 22 | true | 102 | primary-license-88 | Royal College of Physicians and Surgeons of Canada |
| 4 | Distributed Cluster | 26 | false | 103 | adaptive-license-89 | American Board of Otolaryngology |

The view `v_fellowship_program_medical_professional` joins `FellowshipProgram` with `MedicalProfessional` on `professionalId = id`, producing a row per fellowship programme that includes the professional's credentials and the programme's completion date. This view answers: "Which professional completed which fellowship programme, and what are the programme's characteristics?" The first row shows that professional `100` completed the `Extended Review` programme (a `14`-year paediatric otolaryngology programme) on `2024-03-14`. The third row shows that professional `102` completed the `Baseline Model` programme (a `22`-year paediatric otolaryngology programme) on `2022-01-09`. This view supports career progression reporting by linking professionals to their fellowship completions.

**View `v_fellowship_program_society_charter`**

```sql
CREATE VIEW v_fellowship_program_society_charter AS
SELECT a.id, a.programName, a.durationYears, a.isPediatricOtolaryngology, b.id AS charter_id, b.legalName AS charter_legalName, b.principalOfficeAddress AS charter_principalOfficeAddress
FROM FellowshipProgram a JOIN SocietyCharter b ON a.charterId = b.id;
```

| id | programName | durationYears | isPediatricOtolaryngology | charter_id | charter_legalName | charter_principalOfficeAddress |
|---|---|---|---|---|---|---|
| 1 | Extended Review | 14 | true | 1 | Adaptive Model | pilot-principa-14 |
| 2 | Pilot Initiative A | 18 | false | 2 | Primary Cluster | extended-principa-15 |
| 3 | Baseline Model | 22 | true | 3 | Composite Review D | integrated-principa-16 |
| 4 | Distributed Cluster | 26 | false | 4 | Compact Initiative | seasonal-principa-17 |

The view `v_fellowship_program_society_charter` joins `FellowshipProgram` with `SocietyCharter` on `charterId = id`, producing a row per fellowship programme that includes the charter's legal name and principal office address. This view answers: "Which charter sponsors each fellowship programme, and what are the charter's identifying details?" The first row shows that the `Extended Review` programme is sponsored by `Adaptive Model` (`pilot-principa-14`). The fourth row shows that the `Distributed Cluster` programme is sponsored by `Compact Initiative` (`seasonal-principa-17`). This view supports programme-level reporting by attributing each fellowship to its sponsoring organisation.

The seven views collectively cover all pairwise joins between the base tables that are semantically meaningful. The view `v_membership_category_society_charter` connects the organisational and membership dimensions; `v_medical_professional_membership_category` connects the person and membership dimensions; `v_medical_professional_society_meeting` and `v_society_meeting_medical_professional` connect the person and meeting dimensions (in opposite directions); `v_society_meeting_society_charter` connects the meeting and organisational dimensions; and `v_fellowship_program_medical_professional` and `v_fellowship_program_society_charter` connect the programme dimension to both the person and organisational dimensions. Together, these views provide a complete set of analytical lenses through which the normalised data can be queried without denormalising the base tables. The model is thus both normalised for data integrity and denormalised for analytical convenience, with the views serving as the bridge between the two paradigms.