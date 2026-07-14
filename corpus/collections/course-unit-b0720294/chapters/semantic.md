## Ontology-Grounded Relational Modelling of the Course Unit Recognition Domain

The course unit recognition domain captures the lifecycle of educational or training programmes as they move through accreditation, regulatory oversight, temporal validity, and stakeholder contact. At the conceptual level, a `CourseUnit` is the central entity — a named programme with a code, a training type, an accreditation status, and a validity window defined by effective and expiry dates. Surrounding this core are four supporting entity types: the `RecognitionAuthority` that grants legal standing, the `CurrencyPeriod` that defines temporal windows of legislative relevance, the `Restriction` that constrains participation or delivery, and the `ContactDetail` that records how stakeholders reach the programme administrators. Each of these entities is modelled as a separate relational table, and the relationships between them are materialised through foreign keys that bind a single authority, a single currency period, a single restriction, and a single contact detail to each course unit.

**Table `CourseUnit`**

| id | unitCode | unitTitle | trainingTypeCode | trainingTypeName | accreditationStatus | currentEffectiveDate | expiryDate | isRestricted | authorityId | periodId | restrictionId | detailId |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 16375765 | Integrated Framework A | 2882 | Regional Initiative | accredited | 2023-02-04T13:51:00 | 2023-10-24T21:15:00 | false | 1000 | 1 | 1 | 1 |
| 2 | 43197173 | Extended Protocol | Waktu | Seasonal Model D | suspended | 2024-07-15T20:08:00 | 2024-03-08T04:32:00 | true | 1001 | 2 | 2 | 2 |
| 3 | 1186104 | Pilot Programme | 9736915 | Integrated Cluster | withdrawn | 2025-12-26T03:25:00 | 2025-08-19T11:49:00 | false | 1002 | 3 | 3 | 3 |
| 4 | 69419 | Baseline Standard D | e6f1c698-8fc3-11eb-924d-9cd76263cbd0 | Extended Review | accredited | 2022-05-10T10:42:00 | 2022-01-03T18:06:00 | true | 1003 | 4 | 4 | 4 |

The `CourseUnit` table is the anchor of the schema. Its primary key is `id`, a surrogate integer that uniquely identifies each programme record. The business-identifying column is `unitCode`, which in the sample data takes values such as `16375765` for "Integrated Framework A" and `69419` for "Baseline Standard D". The `unitTitle` column carries human-readable names like "Extended Protocol" and "Pilot Programme". The `trainingTypeCode` and `trainingTypeName` columns together describe the programme's classification — for instance, code `2882` maps to "Regional Initiative", while code `9736915` maps to "Integrated Cluster", and one record carries a UUID-style code `e6f1c698-8fc3-11eb-924d-9cd76263cbd0` for "Extended Review". The `accreditationStatus` column is a categorical flag with values `accredited`, `suspended`, and `withdrawn`, indicating the current standing of the programme. Temporal validity is captured by `currentEffectiveDate` and `expiryDate`, which together define the window during which the unit is considered active; for example, "Integrated Framework A" is effective from `2023-02-04T13:51:00` through `2023-10-24T21:15:00`. The boolean column `isRestricted` signals whether the unit is subject to any constraint.

Critically, `CourseUnit` carries four foreign-key columns — `authorityId`, `periodId`, `restrictionId`, and `detailId` — each pointing to a row in one of the four supporting tables. These columns enforce a one-to-one cardinality: each course unit references exactly one recognition authority, one currency period, one restriction, and one contact detail. This design choice reflects the domain rule that a programme has a single governing authority, a single active currency period, a single active restriction regime, and a single primary contact point at any given time.

**Table `RecognitionAuthority`**

| id | authorityName | legalBasis | jurisdiction | accreditationStartDate | unitId |
|---|---|---|---|---|---|
| 1000 | Sean Green | primary-legal-52 | regional-jurisdic-30 | 2025-04-12T15:09:00 | 1 |
| 1001 | Elizabeth Woods | adaptive-legal-53 | legacy-jurisdic-31 | 2022-09-23T22:26:00 | 2 |
| 1002 | Kimberly Smith | distributed-legal-54 | compact-jurisdic-32 | 2023-02-07T05:43:00 | 3 |
| 1003 | Kimberly Smith | baseline-legal-55 | composite-jurisdic-33 | 2024-07-18T12:00:00 | 4 |

The `RecognitionAuthority` table stores the regulatory bodies or individuals that grant legal standing to course units. Its primary key is `id`, which coincides with the values referenced by `CourseUnit.authorityId`. The sample data includes authorities named "Sean Green" (id `1000`), "Elizabeth Woods" (id `1001`), and "Kimberly Smith" (appearing twice, for ids `1002` and `1003`). The `legalBasis` column records the statutory or policy foundation for recognition, with values such as `primary-legal-52`, `adaptive-legal-53`, `distributed-legal-54`, and `baseline-legal-55`. The `jurisdiction` column identifies the geographic or administrative scope — `regional-jurisdic-30`, `legacy-jurisdic-31`, `compact-jurisdic-32`, and `composite-jurisdic-33` — while `accreditationStartDate` records when the authority's recognition took effect. The `unitId` column provides a reverse reference back to the course unit, enabling bidirectional navigation.

**Table `CurrencyPeriod`**

| periodId | periodStartDate | periodEndDate | legislativeReference | isCurrentPeriod | unitId | authorityId |
|---|---|---|---|---|---|---|
| 1 | 2023-06-19T05:27:00 | 2023-06-23T05:27:00 | regional-legislat-30 | false | 1 | 1000 |
| 2 | 2024-11-03T12:44:00 | 2024-11-07T12:44:00 | legacy-legislat-31 | true | 2 | 1001 |
| 3 | 2025-04-14T19:01:00 | 2025-04-18T19:01:00 | compact-legislat-32 | false | 3 | 1002 |
| 4 | 2022-09-25T02:18:00 | 2022-09-02T02:18:00 | composite-legislat-33 | true | 4 | 1003 |

The `CurrencyPeriod` table captures the temporal windows during which legislative references remain in force for a given course unit and authority combination. Its primary key is `periodId`, which aligns with `CourseUnit.periodId`. Each row defines a `periodStartDate` and `periodEndDate` — for example, period `1` spans from `2023-06-19T05:27:00` to `2023-06-23T05:27:00`, a four-day window. The `legislativeReference` column (values like `regional-legislat-30` and `legacy-legislat-31`) identifies the governing legislation, while `isCurrentPeriod` is a boolean flag indicating whether the period is the active one. The table also carries `unitId` and `authorityId` columns, which together form a composite foreign key referencing both `CourseUnit` and `RecognitionAuthority`, ensuring that each currency period is scoped to a specific programme and authority.

**Table `Restriction`**

| id | restrictionType | restrictionDescription | restrictionStartDate | restrictionEndDate | isActive | unitId |
|---|---|---|---|---|---|---|
| 1 | prerequisite | Adaptive Framework | 2024-03-01T02:06:00 | 2022-09-22T08:36:00 | true | 1 |
| 2 | enrollment_limit | Primary Protocol | 2025-08-12T09:23:00 | 2023-02-06T15:53:00 | false | 2 |
| 3 | geographic | Composite Programme D | 2022-01-23T16:40:00 | 2024-07-17T22:10:00 | true | 3 |
| 4 | delivery_mode | Compact Standard | 2023-06-07T23:57:00 | 2025-12-01T05:27:00 | false | 4 |

The `Restriction` table encodes constraints that limit or condition participation in a course unit. Its primary key is `id`, matching `CourseUnit.restrictionId`. The `restrictionType` column categorises the constraint — sample values include `prerequisite`, `enrollment_limit`, `geographic`, and `delivery_mode`. The `restrictionDescription` column provides a human-readable label such as "Adaptive Framework", "Primary Protocol", "Composite Programme D", and "Compact Standard". Temporal bounds are given by `restrictionStartDate` and `restrictionEndDate`, and the `isActive` boolean indicates whether the restriction is currently in force. For instance, the restriction on "Integrated Framework A" (id `1`) is of type `prerequisite` and is marked `isActive = true`, whereas the `enrollment_limit` restriction on "Extended Protocol" (id `2`) is `isActive = false`. As with the other supporting tables, `unitId` provides a reverse reference to the course unit.

**Table `ContactDetail`**

| id | contactType | contactValue | contactStartDate | contactEndDate | isPrimary | unitId |
|---|---|---|---|---|---|---|
| 1 | email | Jennifer Summers | 2024-07-16T18:30:00 | 2025-04-23T15:57:00 | true | 1 |
| 2 | phone | Friedrich Nietzsche | 2025-12-27T01:47:00 | 2022-09-07T22:14:00 | false | 2 |
| 3 | address | Theodore Mcgrath | 2022-05-11T08:04:00 | 2023-02-18T05:31:00 | true | 3 |
| 4 | web | Tasha Rodriguez | 2023-10-22T15:21:00 | 2024-07-02T12:48:00 | false | 4 |

The `ContactDetail` table stores the contact information associated with each course unit. Its primary key is `id`, matching `CourseUnit.detailId`. The `contactType` column distinguishes between `email`, `phone`, `address`, and `web` entries. The `contactValue` column holds the actual contact data — in the sample, these are personal names such as "Jennifer Summers" for an email entry, "Friedrich Nietzsche" for a phone entry, "Theodore Mcgrath" for an address, and "Tasha Rodriguez" for a web entry. Temporal validity is captured by `contactStartDate` and `contactEndDate`, and the `isPrimary` boolean flags the preferred contact method. For example, the email contact for "Integrated Framework A" (id `1`) is marked as primary, while the phone contact for "Extended Protocol" (id `2`) is not. The `unitId` column again provides a reverse reference.

The foreign-key relationships between these five tables form a star topology: `CourseUnit` sits at the centre, and each of the four supporting tables is linked by a single-column foreign key from `CourseUnit`. This normalised structure eliminates redundancy — the authority name "Kimberly Smith" is stored once in `RecognitionAuthority` and referenced by two different course units — while preserving the ability to reconstruct full domain facts through joins.

### Reconstructing Domain Facts Through Views

The relational schema is materialised as a set of views that join the normalised tables back into flat, query-ready result sets. Each view answers a specific analytical question by combining the central `CourseUnit` entity with one or more of its supporting entities.

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

The `course_unit_recognition_authority_view` joins `CourseUnit` with `RecognitionAuthority` on the `authorityId` foreign key. This view answers the question: "Which recognition authority is associated with each course unit, and under what legal basis?" Reading the first row, we see that course unit `16375765` ("Integrated Framework A") with training type code `2882` is governed by authority `1000` ("Sean Green") under the legal basis `primary-legal-52`. The second row shows that "Extended Protocol" (code `43197173`, training type `Waktu`) is overseen by "Elizabeth Woods" (id `1001`) under `adaptive-legal-53`. The view effectively flattens the authority relationship, making it immediately visible which authority is responsible for which programme without requiring the consumer to perform the join manually.

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

The `course_unit_currency_period_view` joins `CourseUnit` with `CurrencyPeriod` on the `periodId` foreign key. This view answers: "What is the current currency period for each course unit, and which legislative reference applies?" The first row reveals that course unit `16375765` is associated with a currency period whose legislative reference is `regional-legislat-30`, spanning from `2023-06-19T05:27:00` to `2023-06-23T05:27:00`, and this period is not the current one (`isCurrentPeriod = false`). The second row shows that "Extended Protocol" (unit `43197173`) has a currency period with reference `legacy-legislat-31` that is marked as current (`isCurrentPeriod = true`), running from `2024-11-03T12:44:00` to `2024-11-07T12:44:00`. This view is particularly useful for compliance queries that need to identify which legislative framework is active for a given programme.

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

The `course_unit_restriction_view` joins `CourseUnit` with `Restriction` on the `restrictionId` foreign key. This view answers: "What restrictions apply to each course unit, and are they currently active?" The first row shows that "Integrated Framework A" (unit `16375765`) is subject to a `prerequisite` restriction described as "Adaptive Framework", which is currently active (`isActive = true`). The second row reveals that "Extended Protocol" (unit `43197173`) has an `enrollment_limit` restriction ("Primary Protocol") that is not active (`isActive = false`). The third row shows a `geographic` restriction ("Composite Programme D") on "Pilot Programme" that is active, and the fourth row shows a `delivery_mode` restriction ("Compact Standard") on "Baseline Standard D" that is inactive. This view enables administrators to quickly assess which programmes have active constraints.

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

The `course_unit_contact_detail_view` joins `CourseUnit` with `ContactDetail` on the `detailId` foreign key. This view answers: "What is the primary contact method for each course unit?" The first row shows that "Integrated Framework A" (unit `16375765`) has an `email` contact for "Jennifer Summers" that is marked as primary (`isPrimary = true`). The second row shows that "Extended Protocol" (unit `43197173`) has a `phone` contact for "Friedrich Nietzsche" that is not primary. The third row shows an `address` contact for "Theodore Mcgrath" on "Pilot Programme" that is primary, and the fourth row shows a `web` contact for "Tasha Rodriguez" on "Baseline Standard D" that is not primary. This view consolidates contact information alongside the programme details it pertains to.

The remaining views reverse the join direction or combine supporting tables without the central `CourseUnit`, enabling queries that start from the supporting entity and navigate outward.

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

The `recognition_authority_course_unit_view` joins `RecognitionAuthority` with `CourseUnit`, answering: "Which course units are governed by each recognition authority?" The first row shows that authority "Sean Green" (id `1000`) governs course unit `16375765` ("Integrated Framework A") with training type code `2882` and accreditation status `accredited`. The second row shows "Elizabeth Woods" (id `1001`) governing "Extended Protocol" (unit `43197173`) with status `suspended`. The third and fourth rows both show "Kimberly Smith" (ids `1002` and `1003`) governing "Pilot Programme" and "Baseline Standard D" respectively, both under different legal bases (`distributed-legal-54` and `baseline-legal-55`). This view is useful for authority-level reporting, such as determining how many programmes each authority oversees.

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

The `currency_period_course_unit_view` joins `CurrencyPeriod` with `CourseUnit`, answering: "Which course units fall within each currency period?" The first row shows that currency period with reference `regional-legislat-30` (period `1`) covers course unit `16375765` ("Integrated Framework A"), which has training type code `2882` and is `accredited`. The second row shows period `2` (reference `legacy-legislat-31`, marked as current) covering "Extended Protocol" (unit `43197173`, training type `Waktu`, status `suspended`). This view enables temporal analysis of which programmes are subject to which legislative windows.

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

The `currency_period_recognition_authority_view` joins `CurrencyPeriod` with `RecognitionAuthority`, answering: "Which recognition authority is associated with each currency period?" The first row shows that period `1` (reference `regional-legislat-30`) is associated with authority "Sean Green" (id `1000`) under legal basis `primary-legal-52`. The second row links period `2` (`legacy-legislat-31`) to "Elizabeth Woods" (id `1001`) under `adaptive-legal-53`. The third and fourth rows both link to "Kimberly Smith" (ids `1002` and `1003`) under `distributed-legal-54` and `baseline-legal-55` respectively. This view is particularly valuable for compliance auditing, as it directly associates legislative periods with the authorities that issued them.

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

The `restriction_course_unit_view` joins `Restriction` with `CourseUnit`, answering: "Which course units are subject to each restriction?" The first row shows that the `prerequisite` restriction ("Adaptive Framework", id `1`, currently active) applies to course unit `16375765` ("Integrated Framework A"), which is `accredited` and has training type code `2882`. The second row shows the `enrollment_limit` restriction ("Primary Protocol", id `2`, inactive) on "Extended Protocol" (unit `43197173`, `suspended`, training type `Waktu`). The third row links the `geographic` restriction ("Composite Programme D", id `3`, active) to "Pilot Programme" (unit `1186104`, `withdrawn`, training type `9736915`), and the fourth row links the `delivery_mode` restriction ("Compact Standard", id `4`, inactive) to "Baseline Standard D" (unit `69419`, `accredited`, training type `e6f1c698-8fc3-11eb-924d-9cd76263cbd0`). This view supports restriction-level analysis, such as identifying all programmes affected by a particular type of constraint.

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

The `contact_detail_course_unit_view` joins `ContactDetail` with `CourseUnit`, answering: "Which course units are associated with each contact detail?" The first row shows that the `email` contact for "Jennifer Summers" (id `1`, primary) is associated with course unit `16375765` ("Integrated Framework A"), which is `accredited` and has training type code `2882`. The second row links the `phone` contact for "Friedrich Nietzsche" (id `2`, not primary) to "Extended Protocol" (unit `43197173`, `suspended`, training type `Waktu`). The third row shows the `address` contact for "Theodore Mcgrath" (id `3`, primary) on "Pilot Programme" (unit `1186104`, `withdrawn`, training type `9736915`), and the fourth row links the `web` contact for "Tasha Rodriguez" (id `4`, not primary) to "Baseline Standard D" (unit `69419`, `accredited`, training type `e6f1c698-8fc3-11eb-924d-9cd76263cbd0`). This view is useful for contact management and stakeholder outreach.

### Synthesis

The relational schema for the course unit recognition domain demonstrates a clean normalised design where a central `CourseUnit` entity is enriched by four supporting tables, each capturing a distinct dimension of the domain: regulatory authority, temporal currency, participation constraints, and stakeholder contact. The foreign keys from `CourseUnit` to each supporting table enforce a one-to-one cardinality that reflects the domain's business rules. The nine views materialise the schema in multiple orientations, allowing analysts to query from the perspective of any entity in the star topology without manually constructing joins. This approach — ontology-grounded modelling followed by view-based denormalisation — ensures that the underlying data remains consistent and non-redundant while remaining accessible for a wide range of analytical queries.