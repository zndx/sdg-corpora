## Accreditation Governance and Course Unit Lifecycle Management

The administration of accredited training programmes demands a structured approach to tracking the full lifecycle of each course unit—from initial accreditation through active operation to eventual expiry. Within this domain, every training unit carries a unique identifier, a title, a training type classification, and an accreditation status that reflects its current standing. The system records effective and expiry dates to enforce temporal boundaries, flags whether a unit carries operational restrictions, and links each unit to its overseeing recognition authority, applicable currency period, active restrictions, and designated contact details. Practitioners responsible for compliance, programme coordination, and regulatory reporting rely on a unified data model that captures all these dimensions in a single coherent framework.

**Table `CourseUnit`**

| id | unitCode | unitTitle | trainingTypeCode | trainingTypeName | accreditationStatus | currentEffectiveDate | expiryDate | isRestricted | authorityId | periodId | restrictionId | detailId |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 16375765 | Integrated Framework A | 2882 | Regional Initiative | accredited | 2023-02-04T13:51:00 | 2023-10-24T21:15:00 | false | 1000 | 1 | 1 | 1 |
| 2 | 43197173 | Extended Protocol | Waktu | Seasonal Model D | suspended | 2024-07-15T20:08:00 | 2024-03-08T04:32:00 | true | 1001 | 2 | 2 | 2 |
| 3 | 1186104 | Pilot Programme | 9736915 | Integrated Cluster | withdrawn | 2025-12-26T03:25:00 | 2025-08-19T11:49:00 | false | 1002 | 3 | 3 | 3 |
| 4 | 69419 | Baseline Standard D | e6f1c698-8fc3-11eb-924d-9cd76263cbd0 | Extended Review | accredited | 2022-05-10T10:42:00 | 2022-01-03T18:06:00 | true | 1003 | 4 | 4 | 4 |

The core entity in this framework is the course unit itself, catalogued with a numeric identifier, a code, and a descriptive title. Training types range from coded classifications such as `2882` and `9736915` to free-text labels like `Waktu` and `Extended Review`, reflecting the diversity of programme formats in the portfolio. Accreditation statuses—`accredited`, `suspended`, and `withdrawn`—provide an at-a-glance view of each unit's regulatory standing. For instance, unit `16375765`, titled "Integrated Framework A," holds an accredited status with an effective date of 2023-02-04 and an expiry date of 2023-10-24. By contrast, unit `43197173`, "Extended Protocol," is currently suspended and carries a restriction flag, indicating that additional operational constraints apply. The temporal fields, `currentEffectiveDate` and `expiryDate`, establish the window during which the unit's accreditation is valid, while the `isRestricted` boolean signals whether supplementary conditions—such as enrollment caps or geographic limitations—must be enforced.

Each course unit is further contextualized through four supporting entities: the recognition authority that grants or oversees its accreditation, the currency period during which its terms remain current, any active restrictions that constrain its delivery, and the contact details through which stakeholders can reach the responsible parties. These relationships are captured in dedicated tables, each serving a distinct operational purpose.

**Table `RecognitionAuthority`**

| id | authorityName | legalBasis | jurisdiction | accreditationStartDate | unitId |
|---|---|---|---|---|---|
| 1000 | Sean Green | primary-legal-52 | regional-jurisdic-30 | 2025-04-12T15:09:00 | 1 |
| 1001 | Elizabeth Woods | adaptive-legal-53 | legacy-jurisdic-31 | 2022-09-23T22:26:00 | 2 |
| 1002 | Kimberly Smith | distributed-legal-54 | compact-jurisdic-32 | 2023-02-07T05:43:00 | 3 |
| 1003 | Kimberly Smith | baseline-legal-55 | composite-jurisdic-33 | 2024-07-18T12:00:00 | 4 |

The recognition authority table records the individuals or bodies vested with the power to accredit and supervise training units. Each authority is identified by a unique integer, a name, a legal basis string, a jurisdiction classification, and an accreditation start date. The legal basis values—such as `primary-legal-52`, `adaptive-legal-53`, and `baseline-legal-55`—encode the statutory or regulatory framework under which the authority operates. Jurisdictions follow a similar pattern, with entries like `regional-jurisdic-30` and `compact-jurisdic-32` delineating the geographic or institutional scope of authority. The `accreditationStartDate` marks when the authority's oversight of a specific unit commenced. Notably, Kimberly Smith appears as the authority for two distinct units (IDs 1002 and 1003), each under a different legal basis and jurisdiction, illustrating that a single authority may oversee multiple programmes across separate regulatory frameworks.

**Table `CurrencyPeriod`**

| periodId | periodStartDate | periodEndDate | legislativeReference | isCurrentPeriod | unitId | authorityId |
|---|---|---|---|---|---|---|
| 1 | 2023-06-19T05:27:00 | 2023-06-23T05:27:00 | regional-legislat-30 | false | 1 | 1000 |
| 2 | 2024-11-03T12:44:00 | 2024-11-07T12:44:00 | legacy-legislat-31 | true | 2 | 1001 |
| 3 | 2025-04-14T19:01:00 | 2025-04-18T19:01:00 | compact-legislat-32 | false | 3 | 1002 |
| 4 | 2022-09-25T02:18:00 | 2022-09-02T02:18:00 | composite-legislat-33 | true | 4 | 1003 |

Currency periods define the temporal windows during which a course unit's accreditation terms are considered current and enforceable. Each period is anchored by a start date and an end date, a legislative reference that ties the period to a specific regulatory instrument, and a boolean flag indicating whether the period is the active one. Period 1, associated with unit 1, spans from 2023-06-19 to 2023-06-23 and references `regional-legislat-30`; it is marked as not current. Period 2, linked to unit 2, runs from 2024-11-03 to 2024-11-07 under `legacy-legislat-31` and is flagged as the current period. The legislative reference field provides an audit trail, enabling practitioners to trace the regulatory basis for any given period. The `isCurrentPeriod` flag is particularly useful for dashboards and compliance reports, as it highlights which period's terms are in force at any point in time.

**Table `Restriction`**

| id | restrictionType | restrictionDescription | restrictionStartDate | restrictionEndDate | isActive | unitId |
|---|---|---|---|---|---|---|
| 1 | prerequisite | Adaptive Framework | 2024-03-01T02:06:00 | 2022-09-22T08:36:00 | true | 1 |
| 2 | enrollment_limit | Primary Protocol | 2025-08-12T09:23:00 | 2023-02-06T15:53:00 | false | 2 |
| 3 | geographic | Composite Programme D | 2022-01-23T16:40:00 | 2024-07-17T22:10:00 | true | 3 |
| 4 | delivery_mode | Compact Standard | 2023-06-07T23:57:00 | 2025-12-01T05:27:00 | false | 4 |

Restrictions impose operational constraints on course units, governing conditions such as prerequisites, enrollment limits, geographic delivery zones, and mode-of-delivery requirements. The `restrictionType` field categorizes the nature of the constraint, with values including `prerequisite`, `enrollment_limit`, `geographic`, and `delivery_mode`. Each restriction carries a descriptive label—for example, "Adaptive Framework" for the prerequisite on unit 1, or "Compact Standard" for the delivery mode constraint on unit 4. Start and end dates define the validity window of the restriction, while the `isActive` flag indicates whether the restriction is currently enforceable. Unit 2's restriction, an enrollment limit titled "Primary Protocol," is marked as inactive, suggesting that the cap has been lifted or has expired. Conversely, unit 3's geographic restriction, "Composite Programme D," remains active, meaning that delivery of this unit is subject to location-based conditions.

**Table `ContactDetail`**

| id | contactType | contactValue | contactStartDate | contactEndDate | isPrimary | unitId |
|---|---|---|---|---|---|---|
| 1 | email | Jennifer Summers | 2024-07-16T18:30:00 | 2025-04-23T15:57:00 | true | 1 |
| 2 | phone | Friedrich Nietzsche | 2025-12-27T01:47:00 | 2022-09-07T22:14:00 | false | 2 |
| 3 | address | Theodore Mcgrath | 2022-05-11T08:04:00 | 2023-02-18T05:31:00 | true | 3 |
| 4 | web | Tasha Rodriguez | 2023-10-22T15:21:00 | 2024-07-02T12:48:00 | false | 4 |

Contact details provide the operational lifeline between course units and the individuals or channels through which inquiries, coordination, and compliance reporting occur. Each contact record specifies a type—`email`, `phone`, `address`, or `web`—along with a value that may represent a person's name, an email address, a physical location, or a web resource. The `contactStartDate` and `contactEndDate` fields establish the validity window for each contact method, and the `isPrimary` flag designates the preferred point of contact. For unit 1, the primary contact is Jennifer Summers via email, active from 2024-07-16 to 2025-04-23. Unit 3's primary contact is Theodore Mcgrath, listed under the address type, valid from 2022-05-11 to 2023-02-18. The contact detail table thus serves as a dynamic directory, ensuring that the correct point of contact is always identifiable and time-bound.

With the base tables established, the system provides a set of joined views that synthesize information across entities, enabling practitioners to answer complex operational questions without manual cross-referencing. Each view is designed around a specific analytical lens, combining the course unit's core attributes with the relevant supporting data.

**View `course_unit_recognition_authority_view`**

```sql
CREATE VIEW course_unit_recognition_authority_view AS
SELECT a.id, a.unitCode, a.unitTitle, a.trainingTypeCode, b.id AS authority_id, b.authorityName AS authority_authorityName, b.legalBasis AS authority_legalBasis
FROM CourseUnit a JOIN RecognitionAuthority b ON a.authorityId = b.id;
```

| id | unitCode | unitTitle | trainingTypeCode | authority_id | authority_authorityName | authority_legalBasis |
|---|---|---|---|---|---|---|
| 1 | 16375765 | Integrated Framework A | 2882 | 1000 | Sean Green | primary-legal-52 |
| 2 | 43197173 | Extended Protocol | Waktu | 1001 | Elizabeth Woods | adaptive-legal-53 |
| 3 | 1186104 | Pilot Programme | 9736915 | 1002 | Kimberly Smith | distributed-legal-54 |
| 4 | 69419 | Baseline Standard D | e6f1c698-8fc3-11eb-924d-9cd76263cbd0 | 1003 | Kimberly Smith | baseline-legal-55 |

The course unit recognition authority view answers the question: which authority oversees each course unit, and under what legal framework? By joining the course unit table with the recognition authority table on the authority identifier, this view produces a unified record that pairs each unit's code and title with the name and legal basis of its overseeing authority. Row 1 shows that unit `16375765` ("Integrated Framework A") is overseen by Sean Green under the `primary-legal-52` framework. Row 3 reveals that Kimberly Smith, under `distributed-legal-54`, oversees unit `1186104` ("Pilot Programme"). This view is essential for compliance officers who need to verify that each unit's accreditation is backed by a valid legal basis and that the responsible authority is correctly assigned.

**View `course_unit_currency_period_view`**

```sql
CREATE VIEW course_unit_currency_period_view AS
SELECT a.id, a.unitCode, a.unitTitle, a.trainingTypeCode, b.periodId AS period_periodId, b.periodStartDate AS period_periodStartDate, b.periodEndDate AS period_periodEndDate
FROM CourseUnit a JOIN CurrencyPeriod b ON a.periodId = b.periodId;
```

| id | unitCode | unitTitle | trainingTypeCode | period_periodId | period_periodStartDate | period_periodEndDate |
|---|---|---|---|---|---|---|
| 1 | 16375765 | Integrated Framework A | 2882 | 1 | 2023-06-19T05:27:00 | 2023-06-23T05:27:00 |
| 2 | 43197173 | Extended Protocol | Waktu | 2 | 2024-11-03T12:44:00 | 2024-11-07T12:44:00 |
| 3 | 1186104 | Pilot Programme | 9736915 | 3 | 2025-04-14T19:01:00 | 2025-04-18T19:01:00 |
| 4 | 69419 | Baseline Standard D | e6f1c698-8fc3-11eb-924d-9cd76263cbd0 | 4 | 2022-09-25T02:18:00 | 2022-09-02T02:18:00 |

The course unit currency period view addresses the question: during which legislative period is each course unit's accreditation current, and what is the status of that period? The join between the course unit and currency period tables, linked through the unit identifier, produces records that include the period's start and end dates, its legislative reference, and whether it is the active period. For unit 2, the view shows that period 2 (2024-11-03 to 2024-11-07, referencing `legacy-legislat-31`) is the current period, which is critical for determining which terms govern the unit at any given time. This view supports audit trails and regulatory reporting by making the temporal and legislative context of each unit immediately visible.

**View `course_unit_restriction_view`**

```sql
CREATE VIEW course_unit_restriction_view AS
SELECT a.id, a.unitCode, a.unitTitle, a.trainingTypeCode, b.id AS restriction_id, b.restrictionType AS restriction_restrictionType, b.restrictionDescription AS restriction_restrictionDescription
FROM CourseUnit a JOIN Restriction b ON a.restrictionId = b.id;
```

| id | unitCode | unitTitle | trainingTypeCode | restriction_id | restriction_restrictionType | restriction_restrictionDescription |
|---|---|---|---|---|---|---|
| 1 | 16375765 | Integrated Framework A | 2882 | 1 | prerequisite | Adaptive Framework |
| 2 | 43197173 | Extended Protocol | Waktu | 2 | enrollment_limit | Primary Protocol |
| 3 | 1186104 | Pilot Programme | 9736915 | 3 | geographic | Composite Programme D |
| 4 | 69419 | Baseline Standard D | e6f1c698-8fc3-11eb-924d-9cd76263cbd0 | 4 | delivery_mode | Compact Standard |

The course unit restriction view answers: what operational constraints apply to each course unit, and are those constraints currently active? By joining the course unit table with the restriction table, this view surfaces the restriction type, description, validity dates, and active status alongside the unit's identifying information. Row 2 indicates that unit `43197173` ("Extended Protocol") carries an `enrollment_limit` restriction titled "Primary Protocol," which is currently inactive. Row 4 shows that unit `69419` ("Baseline Standard D") is subject to a `delivery_mode` restriction ("Compact Standard"), also inactive. This view enables programme coordinators to quickly assess which units have active constraints and to plan delivery accordingly.

**View `course_unit_contact_detail_view`**

```sql
CREATE VIEW course_unit_contact_detail_view AS
SELECT a.id, a.unitCode, a.unitTitle, a.trainingTypeCode, b.id AS detail_id, b.contactType AS detail_contactType, b.contactValue AS detail_contactValue
FROM CourseUnit a JOIN ContactDetail b ON a.detailId = b.id;
```

| id | unitCode | unitTitle | trainingTypeCode | detail_id | detail_contactType | detail_contactValue |
|---|---|---|---|---|---|---|
| 1 | 16375765 | Integrated Framework A | 2882 | 1 | email | Jennifer Summers |
| 2 | 43197173 | Extended Protocol | Waktu | 2 | phone | Friedrich Nietzsche |
| 3 | 1186104 | Pilot Programme | 9736915 | 3 | address | Theodore Mcgrath |
| 4 | 69419 | Baseline Standard D | e6f1c698-8fc3-11eb-924d-9cd76263cbd0 | 4 | web | Tasha Rodriguez |

The course unit contact detail view resolves the question: who is the designated contact for each course unit, and through what channel? The join between the course unit and contact detail tables produces records that include the contact type, value, validity dates, and primary status. For unit 1, the view identifies Jennifer Summers as the primary email contact, valid from 2024-07-16 to 2025-04-23. For unit 3, Theodore Mcgrath is listed as the primary address contact, valid from 2022-05-11 to 2023-02-18. This view is indispensable for stakeholder communication, ensuring that the correct contact method is always accessible and time-relevant.

The remaining views invert the perspective, starting from the supporting entity and revealing which course units fall under its scope. These reverse-lookup views are particularly valuable for authorities, period administrators, and restriction managers who need to understand the breadth of their responsibilities.

**View `recognition_authority_course_unit_view`**

```sql
CREATE VIEW recognition_authority_course_unit_view AS
SELECT a.id, a.authorityName, a.legalBasis, a.jurisdiction, b.id AS unit_id, b.unitCode AS unit_unitCode, b.unitTitle AS unit_unitTitle
FROM RecognitionAuthority a JOIN CourseUnit b ON a.unitId = b.id;
```

| id | authorityName | legalBasis | jurisdiction | unit_id | unit_unitCode | unit_unitTitle |
|---|---|---|---|---|---|---|
| 1000 | Sean Green | primary-legal-52 | regional-jurisdic-30 | 1 | 16375765 | Integrated Framework A |
| 1001 | Elizabeth Woods | adaptive-legal-53 | legacy-jurisdic-31 | 2 | 43197173 | Extended Protocol |
| 1002 | Kimberly Smith | distributed-legal-54 | compact-jurisdic-32 | 3 | 1186104 | Pilot Programme |
| 1003 | Kimberly Smith | baseline-legal-55 | composite-jurisdic-33 | 4 | 69419 | Baseline Standard D |

This view answers: which course units are overseen by a given recognition authority? By joining the recognition authority table with the course unit table, it produces records that pair each authority's name and legal basis with the units under its purview. Kimberly Smith, for instance, appears in two rows, overseeing units with codes `1186104` and `69419` under different legal frameworks (`distributed-legal-54` and `baseline-legal-55`, respectively). This view supports workload assessment and accountability mapping for authority administrators.

**View `currency_period_course_unit_view`**

```sql
CREATE VIEW currency_period_course_unit_view AS
SELECT a.periodId, a.periodStartDate, a.periodEndDate, a.legislativeReference, b.id AS unit_id, b.unitCode AS unit_unitCode, b.unitTitle AS unit_unitTitle
FROM CurrencyPeriod a JOIN CourseUnit b ON a.unitId = b.id;
```

| periodId | periodStartDate | periodEndDate | legislativeReference | unit_id | unit_unitCode | unit_unitTitle |
|---|---|---|---|---|---|---|
| 1 | 2023-06-19T05:27:00 | 2023-06-23T05:27:00 | regional-legislat-30 | 1 | 16375765 | Integrated Framework A |
| 2 | 2024-11-03T12:44:00 | 2024-11-07T12:44:00 | legacy-legislat-31 | 2 | 43197173 | Extended Protocol |
| 3 | 2025-04-14T19:01:00 | 2025-04-18T19:01:00 | compact-legislat-32 | 3 | 1186104 | Pilot Programme |
| 4 | 2022-09-25T02:18:00 | 2022-09-02T02:18:00 | composite-legislat-33 | 4 | 69419 | Baseline Standard D |

The currency period course unit view addresses: which course units are governed by a specific currency period? The join between the currency period and course unit tables produces records that include the period's legislative reference, its current status, and the associated unit's code and title. Period 2, referencing `legacy-legislat-31` and marked as current, is linked to unit `43197173` ("Extended Protocol"). This view enables period administrators to verify that the correct units are associated with each active period and to identify any discrepancies in period-unit assignments.

**View `currency_period_recognition_authority_view`**

```sql
CREATE VIEW currency_period_recognition_authority_view AS
SELECT a.periodId, a.periodStartDate, a.periodEndDate, a.legislativeReference, b.id AS authority_id, b.authorityName AS authority_authorityName, b.legalBasis AS authority_legalBasis
FROM CurrencyPeriod a JOIN RecognitionAuthority b ON a.authorityId = b.id;
```

| periodId | periodStartDate | periodEndDate | legislativeReference | authority_id | authority_authorityName | authority_legalBasis |
|---|---|---|---|---|---|---|
| 1 | 2023-06-19T05:27:00 | 2023-06-23T05:27:00 | regional-legislat-30 | 1000 | Sean Green | primary-legal-52 |
| 2 | 2024-11-03T12:44:00 | 2024-11-07T12:44:00 | legacy-legislat-31 | 1001 | Elizabeth Woods | adaptive-legal-53 |
| 3 | 2025-04-14T19:01:00 | 2025-04-18T19:01:00 | compact-legislat-32 | 1002 | Kimberly Smith | distributed-legal-54 |
| 4 | 2022-09-25T02:18:00 | 2022-09-02T02:18:00 | composite-legislat-33 | 1003 | Kimberly Smith | baseline-legal-55 |

This view answers: which recognition authorities are associated with a given currency period? By joining the currency period table with the recognition authority table, it produces records that pair each period's legislative reference and current status with the name and legal basis of the overseeing authority. Period 4, referencing `composite-legislat-33` and marked as current, is linked to Kimberly Smith under `baseline-legal-55`. This view is useful for cross-referencing the regulatory and temporal dimensions of accreditation, ensuring that the authority overseeing a unit is aligned with the active legislative period.

**View `restriction_course_unit_view`**

```sql
CREATE VIEW restriction_course_unit_view AS
SELECT a.id, a.restrictionType, a.restrictionDescription, a.restrictionStartDate, b.id AS unit_id, b.unitCode AS unit_unitCode, b.unitTitle AS unit_unitTitle
FROM Restriction a JOIN CourseUnit b ON a.unitId = b.id;
```

| id | restrictionType | restrictionDescription | restrictionStartDate | unit_id | unit_unitCode | unit_unitTitle |
|---|---|---|---|---|---|---|
| 1 | prerequisite | Adaptive Framework | 2024-03-01T02:06:00 | 1 | 16375765 | Integrated Framework A |
| 2 | enrollment_limit | Primary Protocol | 2025-08-12T09:23:00 | 2 | 43197173 | Extended Protocol |
| 3 | geographic | Composite Programme D | 2022-01-23T16:40:00 | 3 | 1186104 | Pilot Programme |
| 4 | delivery_mode | Compact Standard | 2023-06-07T23:57:00 | 4 | 69419 | Baseline Standard D |

The restriction course unit view resolves: which course units are subject to a specific restriction, and what are the details of that restriction? The join between the restriction and course unit tables produces records that include the restriction type, description, active status, and validity dates alongside the unit's code and title. Unit `1186104` ("Pilot Programme") is subject to a `geographic` restriction titled "Composite Programme D," which is currently active. This view enables restriction managers to assess the impact of each constraint across the programme portfolio and to plan for any necessary updates or expirations.

**View `contact_detail_course_unit_view`**

```sql
CREATE VIEW contact_detail_course_unit_view AS
SELECT a.id, a.contactType, a.contactValue, a.contactStartDate, b.id AS unit_id, b.unitCode AS unit_unitCode, b.unitTitle AS unit_unitTitle
FROM ContactDetail a JOIN CourseUnit b ON a.unitId = b.id;
```

| id | contactType | contactValue | contactStartDate | unit_id | unit_unitCode | unit_unitTitle |
|---|---|---|---|---|---|---|
| 1 | email | Jennifer Summers | 2024-07-16T18:30:00 | 1 | 16375765 | Integrated Framework A |
| 2 | phone | Friedrich Nietzsche | 2025-12-27T01:47:00 | 2 | 43197173 | Extended Protocol |
| 3 | address | Theodore Mcgrath | 2022-05-11T08:04:00 | 3 | 1186104 | Pilot Programme |
| 4 | web | Tasha Rodriguez | 2023-10-22T15:21:00 | 4 | 69419 | Baseline Standard D |

This view answers: which course units are associated with a specific contact detail, and what is the nature of that contact? The join between the contact detail and course unit tables produces records that include the contact type, value, primary status, and validity dates alongside the unit's code and title. For unit `43197173` ("Extended Protocol"), the view shows a phone contact for Friedrich Nietzsche, valid from 2025-12-27 to 2022-09-07, marked as non-primary. This view supports contact management by providing a clear mapping between contact records and the units they serve, enabling administrators to update or retire contact information as needed.

The integration of these base tables and views forms a comprehensive framework for managing the accreditation lifecycle of training units. Each table captures a distinct dimension of the domain—unit identity, authority oversight, temporal validity, operational constraints, and stakeholder contact—while the views synthesize these dimensions into actionable insights. Practitioners can use the base tables for granular record-keeping and the views for higher-level analysis, such as verifying legal compliance, assessing restriction impact, or identifying the correct point of contact for any given unit. The system's design ensures that no critical information is siloed; instead, every record is connected to its supporting context, enabling efficient governance and transparent accountability across the entire programme portfolio.