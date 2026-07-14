## The Architecture of Competitive Martial Arts Administration

Martial arts competition organizations operate as layered ecosystems where individual practitioners, coaching staff, and referees must navigate a web of credentials, affiliations, and eligibility requirements before stepping onto the mat. At the heart of this system lies a structured record-keeping framework that tracks every athlete's journey from initial registration through rank verification, background clearance, and ultimately, competition participation. The domain encompasses athletes holding black belt ranks ranging from modest beginnings to advanced mastery, memberships spanning athlete, coach, referee, and instructor categories, and competitions organized across state and national levels. Each entity carries precise timestamps, status flags, and cross-references that together form the operational backbone of tournament administration.

**Table `athletes`**

| id | athlete_id | first_name | last_name | date_of_birth | membership_status | citizenship_status | black_belt_rank | background_check_status | membership_id | competition_id | black_belt_verification_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 7441146 | Stephanie Collins | Paul Allen | 2025-04-02 | active | us_citizen | 37 | true | 100 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | ebdf79bc-8fd1-11eb-924d-9cd76263cbd0 | Janice Johnston | Heather Beasley | 2022-09-13 | inactive | resident | 43 | false | 101 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | Upal Saha | Audrey Taylor | 2023-02-24 | suspended | us_citizen | 49 | true | 102 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 89146 | Katherine Snyder | Susan Wagner | 2024-07-08 | active | resident | 55 | false | 103 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The athletes table serves as the primary registry of all individuals participating in or supporting the competitive ecosystem. Each record carries a unique internal identifier alongside a secondary athlete identifier that may take the form of a numeric code, a UUID, or a Google Places-style reference string. The personal data fields capture first and last names—Stephanie Collins and Paul Allen appear as the first recorded pair, while Upal Saha and Audrey Taylor follow—along with dates of birth spanning from 2022 through 2025. The membership_status column classifies each person as active, inactive, or suspended, directly influencing their eligibility to compete. Citizenship status distinguishes between full citizens and residents, while the black_belt_rank column assigns a numeric rank value, with observed entries ranging from 37 to 55. The boolean flags for background_check_status and the foreign key references to membership, competition, and black belt verification records tie each athlete to their compliance and participation history. Timestamps for creation and last update provide an audit trail of when records were first established and most recently modified.

**Table `memberships`**

| membership_id | membership_type | registration_date | fee_amount | expiration_date | is_eligible_for_competition | athlete_id | background_check_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | athlete | 2023-06-19T17:27:00 | 38.08 | 2025-08-18 | true | 1000 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | coach | 2024-11-03T00:44:00 | 18.47 | 2022-01-02 | false | 1001 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | referee | 2025-04-14T07:01:00 | 38.08 | 2023-06-13 | true | 1002 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | instructor | 2022-09-25T14:18:00 | 26.25 | 2024-11-24 | false | 1003 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Membership records formalize the contractual relationship between an individual and the governing organization. The membership_type column distinguishes between four distinct roles: athlete, coach, referee, and instructor. Each membership carries a registration date, a fee amount that varies between approximately 18 and 38 dollars, and an expiration date that may fall in the past or future relative to the current operational period. The critical eligibility flag, is_eligible_for_competition, determines whether the member's current standing permits tournament participation. For instance, the athlete membership held by record 1000 carries a fee of 38.08 and is marked eligible, while the coach membership at record 101, with a lower fee of 18.47, is explicitly ineligible. Each membership links to its corresponding athlete through the athlete_id column and to a background check through the background_check_id column, creating a direct compliance chain.

**Table `competitions`**

| id | competition_id | competition_name | competition_level | start_date | end_date | location | is_on_site_registration | state_association_id | qualifies_for_competition_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 4277014 | Compact Model | state | 2022-09-05 | 2022-09-01 | extended-location-99 | false | 1000 | 1 |
| 2 | 575210 | Legacy Cluster | national | 2023-02-16 | 2023-02-12 | integrated-location-100 | true | 1001 | 2 |
| 3 | 619 | Regional Review A | state | 2024-07-27 | 2024-07-23 | seasonal-location-101 | false | 1002 | 3 |
| 4 | 10449520 | Seasonal Initiative | national | 2025-12-11 | 2025-12-07 | regional-location-102 | true | 1003 | 4 |

Competitions represent the organized events where athletes demonstrate their skills. The competition_name column assigns descriptive titles such as Compact Model, Legacy Cluster, Regional Review A, and Seasonal Initiative. The competition_level column distinguishes between state-level and national-level events, with the data showing two entries at each tier. Start and end dates define the event window, and notably, the end dates in the sample data precede the start dates, suggesting a data entry convention or a scheduling anomaly that administrators must reconcile. The location field uses coded identifiers like extended-location-99 and integrated-location-100 to reference physical venues. The is_on_site_registration flag indicates whether participants can register at the venue itself, and the state_association_id column ties each competition to its governing regional body. The qualifies_for_competition_id column establishes a hierarchy, where one competition may serve as a qualifier for another.

**Table `competition_divisions`**

| division_id | division_name | age_category | rank_requirement | event_type | rule_set | head_contact_allowed | competition_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 89512 | Composite Protocol | cadet | distributed-rank-78 | sparring | grassroots | Peter Montgomery | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 10207146 | Compact Programme A | junior | baseline-rank-79 | poomsae | world_class | Michelle Kelley | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 212 | Legacy Standard | senior | pilot-rank-80 | sparring | grassroots | Michelle Kelley | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| id_14 | Regional Framework | cadet | extended-rank-81 | poomsae | world_class | Mary Alvarez | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Within each competition, athletes compete in specialized divisions that group participants by age, rank, and discipline. The division_name column assigns names such as Composite Protocol, Compact Programme A, Legacy Standard, and Regional Framework. The age_category column categorizes divisions as cadet, junior, or senior, ensuring age-appropriate competition. The rank_requirement field specifies the minimum rank needed to enter, with values like distributed-rank-78 and baseline-rank-79 indicating tiered access levels. The event_type column distinguishes between sparring and poomsae disciplines, while the rule_set column classifies the governing rules as either grassroots or world_class. The head_contact_allowed column contains what appear to be named individuals—Peter Montgomery, Michelle Kelley, and Mary Alvarez—rather than simple boolean values, suggesting these names designate the officials or coordinators responsible for head-contact policy enforcement. Each division is linked to its parent competition through the competition_id column.

**Table `state_associations`**

| state_association_id | association_id | association_name | state_code | contact_email | contact_phone | black_belt_verification_id |
|---|---|---|---|---|---|---|
| 1000 | id_20 | Primary Framework A | 17788643 | Christopher Wilson | Joe Tsai | 1 |
| 1001 | 10782172 | Composite Protocol | 8350031 | Charles Larsen | Stephanie Collins | 2 |
| 1002 | 8387550 | Compact Programme | 790483 | Mary Alvarez | Tasha Rodriguez | 3 |
| 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Legacy Standard D | 8387549 | April Snyder | Walter Pratt | 4 |

State associations function as the regional governance bodies that oversee competitions and verify credentials within their jurisdictions. The association_name column provides formal names such as Primary Framework A, Composite Protocol, Compact Programme, and Legacy Standard D. The state_code column carries numeric identifiers like 17788643 and 8350031, which may correspond to internal state or region codes. Contact information is maintained through the contact_email and contact_phone columns, with entries listing names like Christopher Wilson, Charles Larsen, and Mary Alvarez as points of contact. The black_belt_verification_id column links each association to its credential verification authority, ensuring that rank certifications are processed through a recognized channel.

**Table `black_belt_verifications`**

| id | verification_id | verification_date | verification_method | is_verified | issuing_organization | athlete_id | state_association_id |
|---|---|---|---|---|---|---|---|
| 1 | 2986233 | 2024-07-24T06:18:00 | uploaded | true | Alphabet Inc Class A | 1000 | 1000 |
| 2 | 778548 | 2025-12-08T13:35:00 | physical_copy | false | ITT Industries | 1001 | 1001 |
| 3 | 32828 | 2022-05-19T20:52:00 | form | true | Switch Card Services Ltd. | 1002 | 1002 |
| 4 | e429623c-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-10-03T03:09:00 | uploaded | false | Buypass AS | 1003 | 1003 |

Black belt verification records document the formal authentication of an athlete's advanced rank. Each verification carries a unique identifier, a verification_date timestamp, and a verification_method that specifies how the rank was confirmed—through uploaded documentation, a physical copy of credentials, or a submitted form. The is_verified flag indicates whether the verification was successful, with the sample data showing two confirmed verifications and two pending or rejected ones. The issuing_organization column names the certifying body, ranging from Alphabet Inc Class A to ITT Industries, Switch Card Services Ltd., and Buypass AS. Each verification links to both the athlete whose rank was verified and the state association responsible for the verification process.

**Table `background_checks`**

| background_check_id | check_id | check_date | check_status | required_for_role | membership_id | state_association_id |
|---|---|---|---|---|---|---|
| 100 | 611510 | 2025-08-21T07:57:00 | pending | coach | 100 | 1000 |
| 101 | 974935 | 2022-01-05T14:14:00 | passed | referee | 101 | 1001 |
| 102 | 9fff03be-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-06-16T21:31:00 | failed | instructor | 102 | 1002 |
| 103 | b_VB-EC-12 | 2024-11-27T04:48:00 | pending | club_owner | 103 | 1003 |

Background checks provide the compliance layer that ensures all participants meet safety and conduct standards. The table records the check status for each individual, with boolean values indicating whether the background check has been completed and cleared. These records are referenced by both the athletes table and the memberships table, creating a dual verification path that ensures no participant can compete without an associated clearance.

**Table `competitions_divisions`**

| competition_id | division_id |
|---|---|
| 1 | 89512 |
| 1 | 10207146 |
| 2 | 10207146 |
| 2 | 212 |
| 3 | 212 |
| 3 | id_14 |
| 4 | id_14 |
| 4 | 89512 |

The competitions_divisions table serves as a cross-reference linking competitions to their constituent divisions. This junction table resolves the many-to-many relationship that may arise when divisions are shared across events or when a competition hosts multiple overlapping division structures.

**Table `divisions_athletes`**

| division_id | athlete_id |
|---|---|
| 89512 | 1000 |
| 89512 | 1001 |
| 10207146 | 1001 |
| 10207146 | 1002 |
| 212 | 1002 |
| 212 | 1003 |
| id_14 | 1003 |
| id_14 | 1000 |

The divisions_athletes table records which athletes have registered for which divisions within a competition. This enrollment record is essential for tournament bracketing, scoring, and award distribution. It connects the athlete's identity to a specific division and, by extension, to the competition hosting that division.

**Table `associations_competitions`**

| state_association_id | competition_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The associations_competitions table maps state associations to the competitions they govern or sanction. This relationship ensures that each competition has a clear regional authority and that the appropriate association is responsible for oversight, credential verification, and dispute resolution.

### Membership and Athlete Records

**View `vw_athlete_membership`**

```sql
CREATE VIEW vw_athlete_membership AS
SELECT a.id, a.athlete_id, a.first_name, a.last_name, b.membership_id AS membership_membership_id, b.membership_type AS membership_membership_type, b.registration_date AS membership_registration_date
FROM athletes a JOIN memberships b ON a.membership_id = b.membership_id;
```

| id | athlete_id | first_name | last_name | membership_membership_id | membership_membership_type | membership_registration_date |
|---|---|---|---|---|---|---|
| 1000 | 7441146 | Stephanie Collins | Paul Allen | 100 | athlete | 2023-06-19T17:27:00 |
| 1001 | ebdf79bc-8fd1-11eb-924d-9cd76263cbd0 | Janice Johnston | Heather Beasley | 101 | coach | 2024-11-03T00:44:00 |
| 1002 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | Upal Saha | Audrey Taylor | 102 | referee | 2025-04-14T07:01:00 |
| 1003 | 89146 | Katherine Snyder | Susan Wagner | 103 | instructor | 2022-09-25T14:18:00 |

The vw_athlete_membership view joins the athletes table with the memberships table to present a unified profile of each individual's competitive standing. This view answers the fundamental question of whether a given person holds a valid, eligible membership. Reading the first row, Stephanie Collins (athlete_id 7441146) appears with an athlete-type membership (membership_id 100) that is active and eligible for competition, with a registration date of 2023-06-19 and a fee of 38.08. The second row shows Janice Johnston (ebdf79bc-8fd1-11eb-924d-9cd76263cbd0) holding a coach membership (101) that is inactive and ineligible, registered on 2024-11-03 with a fee of 18.47. This view enables administrators to quickly identify which athletes have current standing and which have lapsed or been suspended.

**View `vw_athlete_competition`**

```sql
CREATE VIEW vw_athlete_competition AS
SELECT a.id, a.athlete_id, a.first_name, a.last_name, b.id AS competition_id, b.competition_id AS competition_competition_id, b.competition_name AS competition_competition_name
FROM athletes a JOIN competitions b ON a.competition_id = b.id;
```

| id | athlete_id | first_name | last_name | competition_id | competition_competition_id | competition_competition_name |
|---|---|---|---|---|---|---|
| 1000 | 7441146 | Stephanie Collins | Paul Allen | 1 | 4277014 | Compact Model |
| 1001 | ebdf79bc-8fd1-11eb-924d-9cd76263cbd0 | Janice Johnston | Heather Beasley | 2 | 575210 | Legacy Cluster |
| 1002 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | Upal Saha | Audrey Taylor | 3 | 619 | Regional Review A |
| 1003 | 89146 | Katherine Snyder | Susan Wagner | 4 | 10449520 | Seasonal Initiative |

The vw_athlete_competition view links athletes to the competitions they are registered for or qualified to enter. This join reveals the participation pipeline: which athletes are associated with which events and at what level. The first row connects athlete 1000 (Stephanie Collins) to competition 1 (Compact Model, a state-level event), while the second row links athlete 1001 (Janice Johnston) to competition 2 (Legacy Cluster, national level). This view is essential for tracking qualification pathways and ensuring that athletes are entered at the correct competitive tier.

**View `vw_athlete_black_belt_verification`**

```sql
CREATE VIEW vw_athlete_black_belt_verification AS
SELECT a.id, a.athlete_id, a.first_name, a.last_name, b.id AS verification_id, b.verification_id AS verification_verification_id, b.verification_date AS verification_verification_date
FROM athletes a JOIN black_belt_verifications b ON a.black_belt_verification_id = b.id;
```

| id | athlete_id | first_name | last_name | verification_id | verification_verification_id | verification_verification_date |
|---|---|---|---|---|---|---|
| 1000 | 7441146 | Stephanie Collins | Paul Allen | 1 | 2986233 | 2024-07-24T06:18:00 |
| 1001 | ebdf79bc-8fd1-11eb-924d-9cd76263cbd0 | Janice Johnston | Heather Beasley | 2 | 778548 | 2025-12-08T13:35:00 |
| 1002 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | Upal Saha | Audrey Taylor | 3 | 32828 | 2022-05-19T20:52:00 |
| 1003 | 89146 | Katherine Snyder | Susan Wagner | 4 | e429623c-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-10-03T03:09:00 |

The vw_athlete_black_belt_verification view combines athlete records with their black belt verification status, providing a clear picture of rank credentialing. The first row shows athlete 1000 with a verified black belt (is_verified true) using the uploaded method, issued by Alphabet Inc Class A on 2024-07-24. The second row reveals athlete 1001 with an unverified rank (is_verified false) submitted via physical_copy from ITT Industries on 2025-12-08. This view allows competition organizers to confirm that participants meet the rank requirements for their entered divisions before tournament registration closes.

### Membership Compliance and Background Clearance

**View `vw_membership_athlete`**

```sql
CREATE VIEW vw_membership_athlete AS
SELECT a.membership_id, a.membership_type, a.registration_date, a.fee_amount, b.id AS athlete_id, b.athlete_id AS athlete_athlete_id, b.first_name AS athlete_first_name
FROM memberships a JOIN athletes b ON a.athlete_id = b.id;
```

| membership_id | membership_type | registration_date | fee_amount | athlete_id | athlete_athlete_id | athlete_first_name |
|---|---|---|---|---|---|---|
| 100 | athlete | 2023-06-19T17:27:00 | 38.08 | 1000 | 7441146 | Stephanie Collins |
| 101 | coach | 2024-11-03T00:44:00 | 18.47 | 1001 | ebdf79bc-8fd1-11eb-924d-9cd76263cbd0 | Janice Johnston |
| 102 | referee | 2025-04-14T07:01:00 | 38.08 | 1002 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | Upal Saha |
| 103 | instructor | 2022-09-25T14:18:00 | 26.25 | 1003 | 89146 | Katherine Snyder |

The vw_membership_athlete view presents the membership-centric perspective, showing each membership record alongside its associated athlete's details. This orientation is useful for membership administration tasks such as fee collection, renewal notifications, and status changes. The first row displays membership 100 (athlete type, fee 38.08, eligible) linked to athlete 1000 (Stephanie Collins, active status, black_belt_rank 37). The fourth row shows membership 103 (instructor type, fee 26.25, ineligible) linked to athlete 1003 (Katherine Snyder, active status, black_belt_rank 55). The apparent paradox of an active instructor being ineligible for competition highlights the distinction between organizational membership and competitive eligibility.

**View `vw_membership_background_check`**

```sql
CREATE VIEW vw_membership_background_check AS
SELECT a.membership_id, a.membership_type, a.registration_date, a.fee_amount, b.background_check_id AS check_background_check_id, b.check_id AS check_check_id, b.check_date AS check_check_date
FROM memberships a JOIN background_checks b ON a.background_check_id = b.background_check_id;
```

| membership_id | membership_type | registration_date | fee_amount | check_background_check_id | check_check_id | check_check_date |
|---|---|---|---|---|---|---|
| 100 | athlete | 2023-06-19T17:27:00 | 38.08 | 100 | 611510 | 2025-08-21T07:57:00 |
| 101 | coach | 2024-11-03T00:44:00 | 18.47 | 101 | 974935 | 2022-01-05T14:14:00 |
| 102 | referee | 2025-04-14T07:01:00 | 38.08 | 102 | 9fff03be-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-06-16T21:31:00 |
| 103 | instructor | 2022-09-25T14:18:00 | 26.25 | 103 | b_VB-EC-12 | 2024-11-27T04:48:00 |

The vw_membership_background_check view joins membership records with their associated background check status, providing a compliance dashboard for administrators. This view answers the question of whether a member's background clearance is current and cleared. The first row shows membership 100 with a background check status of true, while the second row shows membership 101 with a status of false. This direct linkage ensures that no membership can be considered fully active until its background check is cleared, creating a mandatory compliance gate.

### Competition Structure and Regional Governance

**View `vw_competition_state_association`**

```sql
CREATE VIEW vw_competition_state_association AS
SELECT a.id, a.competition_id, a.competition_name, a.competition_level, b.state_association_id AS association_state_association_id, b.association_id AS association_association_id, b.association_name AS association_association_name
FROM competitions a JOIN state_associations b ON a.state_association_id = b.state_association_id;
```

| id | competition_id | competition_name | competition_level | association_state_association_id | association_association_id | association_association_name |
|---|---|---|---|---|---|---|
| 1 | 4277014 | Compact Model | state | 1000 | id_20 | Primary Framework A |
| 2 | 575210 | Legacy Cluster | national | 1001 | 10782172 | Composite Protocol |
| 3 | 619 | Regional Review A | state | 1002 | 8387550 | Compact Programme |
| 4 | 10449520 | Seasonal Initiative | national | 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Legacy Standard D |

The vw_competition_state_association view links competitions to their governing state associations, establishing the regional authority structure. The first row connects competition 1 (Compact Model, state level) to state association 1000 (Primary Framework A, state code 17788643). The second row links competition 2 (Legacy Cluster, national level) to state association 1001 (Composite Protocol, state code 8350031). This view clarifies which regional body is responsible for each event and ensures that competitions are properly sanctioned by their appropriate authority.

**View `vw_competition_competition`**

```sql
CREATE VIEW vw_competition_competition AS
SELECT a.id, a.competition_id, a.competition_name, a.competition_level, b.id AS competition_id, b.competition_id AS competition_competition_id, b.competition_name AS competition_competition_name
FROM competitions a JOIN competitions b ON a.qualifies_for_competition_id = b.id;
```

| id | competition_id | competition_name | competition_level | competition_id | competition_competition_id | competition_competition_name |
|---|---|---|---|---|---|---|
| 1 | 4277014 | Compact Model | state | 1 | 4277014 | Compact Model |
| 2 | 575210 | Legacy Cluster | national | 2 | 575210 | Legacy Cluster |
| 3 | 619 | Regional Review A | state | 3 | 619 | Regional Review A |
| 4 | 10449520 | Seasonal Initiative | national | 4 | 10449520 | Seasonal Initiative |

The vw_competition_competition view provides a self-referential or enriched view of competition records, potentially adding derived fields or cross-references that enhance the base competition data. This view may include qualification hierarchies, where one competition serves as a qualifier for another, as indicated by the qualifies_for_competition_id column in the base table. The first row shows competition 1 qualifying for competition 1, while the second row shows competition 2 qualifying for competition 2, suggesting a self-referential structure that may represent standalone events or events with internal qualification pathways.

**View `vw_competition_competition_division_detail`**

```sql
CREATE VIEW vw_competition_competition_division_detail AS
SELECT a.id, a.competition_id, a.competition_name, b.division_id AS division_division_id, b.division_name AS division_division_name, b.age_category AS division_age_category
FROM competitions a
  JOIN competitions_divisions j ON j.competition_id = a.id
  JOIN competition_divisions b ON b.division_id = j.division_id;
```

| id | competition_id | competition_name | division_division_id | division_division_name | division_age_category |
|---|---|---|---|---|---|
| 1 | 4277014 | Compact Model | 89512 | Composite Protocol | cadet |
| 1 | 4277014 | Compact Model | 10207146 | Compact Programme A | junior |
| 2 | 575210 | Legacy Cluster | 10207146 | Compact Programme A | junior |
| 2 | 575210 | Legacy Cluster | 212 | Legacy Standard | senior |
| 3 | 619 | Regional Review A | 212 | Legacy Standard | senior |
| 3 | 619 | Regional Review A | id_14 | Regional Framework | cadet |
| 4 | 10449520 | Seasonal Initiative | id_14 | Regional Framework | cadet |
| 4 | 10449520 | Seasonal Initiative | 89512 | Composite Protocol | cadet |

The vw_competition_competition_division_detail view joins competition records with their divisions, presenting a complete picture of each event's structure. The first row shows competition 1 (Compact Model) with division 89512 (Composite Protocol, cadet age category, sparring event type, grassroots rule set). The second row links competition 2 (Legacy Cluster) with division 10207146 (Compact Programme A, junior age category, poomsae event type, world_class rule set). This view enables tournament organizers to see the full division lineup for any given competition and verify that age categories and rule sets are appropriate for the event level.

**View `vw_competition_division_competition`**

```sql
CREATE VIEW vw_competition_division_competition AS
SELECT a.division_id, a.division_name, a.age_category, a.rank_requirement, b.id AS competition_id, b.competition_id AS competition_competition_id, b.competition_name AS competition_competition_name
FROM competition_divisions a JOIN competitions b ON a.competition_id = b.id;
```

| division_id | division_name | age_category | rank_requirement | competition_id | competition_competition_id | competition_competition_name |
|---|---|---|---|---|---|---|
| 89512 | Composite Protocol | cadet | distributed-rank-78 | 1 | 4277014 | Compact Model |
| 10207146 | Compact Programme A | junior | baseline-rank-79 | 2 | 575210 | Legacy Cluster |
| 212 | Legacy Standard | senior | pilot-rank-80 | 3 | 619 | Regional Review A |
| id_14 | Regional Framework | cadet | extended-rank-81 | 4 | 10449520 | Seasonal Initiative |

The vw_competition_division_competition view presents the division-centric perspective, showing each division alongside its parent competition details. This orientation is useful for division administrators who need to understand the broader context of their event. The first row shows division 89512 (Composite Protocol) under competition 1 (Compact Model, state level, extended-location-99), while the fourth row shows division id_14 (Regional Framework) under competition 4 (Seasonal Initiative, national level, regional-location-102). This view ensures that division-level decisions align with competition-level policies and scheduling.

**View `vw_competition_division_athlete_detail`**

```sql
CREATE VIEW vw_competition_division_athlete_detail AS
SELECT a.division_id, a.division_name, a.age_category, b.id AS athlete_id, b.athlete_id AS athlete_athlete_id, b.first_name AS athlete_first_name
FROM competition_divisions a
  JOIN divisions_athletes j ON j.division_id = a.division_id
  JOIN athletes b ON b.id = j.athlete_id;
```

| division_id | division_name | age_category | athlete_id | athlete_athlete_id | athlete_first_name |
|---|---|---|---|---|---|
| 89512 | Composite Protocol | cadet | 1000 | 7441146 | Stephanie Collins |
| 89512 | Composite Protocol | cadet | 1001 | ebdf79bc-8fd1-11eb-924d-9cd76263cbd0 | Janice Johnston |
| 10207146 | Compact Programme A | junior | 1001 | ebdf79bc-8fd1-11eb-924d-9cd76263cbd0 | Janice Johnston |
| 10207146 | Compact Programme A | junior | 1002 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | Upal Saha |
| 212 | Legacy Standard | senior | 1002 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | Upal Saha |
| 212 | Legacy Standard | senior | 1003 | 89146 | Katherine Snyder |
| id_14 | Regional Framework | cadet | 1003 | 89146 | Katherine Snyder |
| id_14 | Regional Framework | cadet | 1000 | 7441146 | Stephanie Collins |

The vw_competition_division_athlete_detail view joins divisions with the athletes enrolled in them, providing a complete registration roster for each division. This view answers the operational question of which athletes are competing in which divisions, enabling bracket generation, scoring, and award management. The first row would show an athlete registered in division 89512 (Composite Protocol, cadet sparring), while subsequent rows would populate with additional athletes as registrations are processed. This is the primary view used by tournament directors on competition day.

### State Association Oversight and Credential Verification

**View `vw_state_association_competition_detail`**

```sql
CREATE VIEW vw_state_association_competition_detail AS
SELECT a.state_association_id, a.association_id, a.association_name, b.id AS competition_id, b.competition_id AS competition_competition_id, b.competition_name AS competition_competition_name
FROM state_associations a
  JOIN associations_competitions j ON j.state_association_id = a.state_association_id
  JOIN competitions b ON b.id = j.competition_id;
```

| state_association_id | association_id | association_name | competition_id | competition_competition_id | competition_competition_name |
|---|---|---|---|---|---|
| 1000 | id_20 | Primary Framework A | 1 | 4277014 | Compact Model |
| 1000 | id_20 | Primary Framework A | 2 | 575210 | Legacy Cluster |
| 1001 | 10782172 | Composite Protocol | 2 | 575210 | Legacy Cluster |
| 1001 | 10782172 | Composite Protocol | 3 | 619 | Regional Review A |
| 1002 | 8387550 | Compact Programme | 3 | 619 | Regional Review A |
| 1002 | 8387550 | Compact Programme | 4 | 10449520 | Seasonal Initiative |
| 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Legacy Standard D | 4 | 10449520 | Seasonal Initiative |
| 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Legacy Standard D | 1 | 4277014 | Compact Model |

The vw_state_association_competition_detail view links state associations to their competitions, providing a governance dashboard for regional administrators. The first row shows state association 1000 (Primary Framework A) overseeing competition 1 (Compact Model, state level), while the fourth row shows state association 1003 (Legacy Standard D) overseeing competition 4 (Seasonal Initiative, national level). This view enables regional directors to monitor all events under their jurisdiction and ensure compliance with regional policies.

**View `vw_state_association_black_belt_verification`**

```sql
CREATE VIEW vw_state_association_black_belt_verification AS
SELECT a.state_association_id, a.association_id, a.association_name, a.state_code, b.id AS verification_id, b.verification_id AS verification_verification_id, b.verification_date AS verification_verification_date
FROM state_associations a JOIN black_belt_verifications b ON a.black_belt_verification_id = b.id;
```

| state_association_id | association_id | association_name | state_code | verification_id | verification_verification_id | verification_verification_date |
|---|---|---|---|---|---|---|
| 1000 | id_20 | Primary Framework A | 17788643 | 1 | 2986233 | 2024-07-24T06:18:00 |
| 1001 | 10782172 | Composite Protocol | 8350031 | 2 | 778548 | 2025-12-08T13:35:00 |
| 1002 | 8387550 | Compact Programme | 790483 | 3 | 32828 | 2022-05-19T20:52:00 |
| 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Legacy Standard D | 8387549 | 4 | e429623c-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-10-03T03:09:00 |

The vw_state_association_black_belt_verification view connects state associations with the black belt verifications they process, providing a credential management tool for regional authorities. The first row links state association 1000 to verification 1 (verified true, uploaded method, issued by Alphabet Inc Class A), while the second row links state association 1001 to verification 2 (verified false, physical_copy method, issued by ITT Industries). This view allows regional administrators to track the volume and status of verifications they have processed and identify any pending or rejected credentials that require follow-up.

### Verification and Compliance Cross-References

**View `vw_black_belt_verification_athlete`**

```sql
CREATE VIEW vw_black_belt_verification_athlete AS
SELECT a.id, a.verification_id, a.verification_date, a.verification_method, b.id AS athlete_id, b.athlete_id AS athlete_athlete_id, b.first_name AS athlete_first_name
FROM black_belt_verifications a JOIN athletes b ON a.athlete_id = b.id;
```

| id | verification_id | verification_date | verification_method | athlete_id | athlete_athlete_id | athlete_first_name |
|---|---|---|---|---|---|---|
| 1 | 2986233 | 2024-07-24T06:18:00 | uploaded | 1000 | 7441146 | Stephanie Collins |
| 2 | 778548 | 2025-12-08T13:35:00 | physical_copy | 1001 | ebdf79bc-8fd1-11eb-924d-9cd76263cbd0 | Janice Johnston |
| 3 | 32828 | 2022-05-19T20:52:00 | form | 1002 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | Upal Saha |
| 4 | e429623c-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-10-03T03:09:00 | uploaded | 1003 | 89146 | Katherine Snyder |

The vw_black_belt_verification_athlete view presents the verification-centric perspective, showing each black belt verification alongside its associated athlete's details. This orientation is useful for credential auditors who need to verify that rank certifications are properly linked to the correct individuals. The first row shows verification 1 (2986233, verified true, uploaded method) linked to athlete 1000 (Stephanie Collins, black_belt_rank 37, active status). The fourth row shows verification 4 (e429623c-9bac-11eb-a8a2-19ed5c03f8d3, verified false, uploaded method) linked to athlete 1003 (Katherine Snyder, black_belt_rank 55, active status). This view highlights the importance of maintaining accurate verification records, as even active athletes with high ranks may have pending verifications.

**View `vw_black_belt_verification_state_association`**

```sql
CREATE VIEW vw_black_belt_verification_state_association AS
SELECT a.id, a.verification_id, a.verification_date, a.verification_method, b.state_association_id AS association_state_association_id, b.association_id AS association_association_id, b.association_name AS association_association_name
FROM black_belt_verifications a JOIN state_associations b ON a.state_association_id = b.state_association_id;
```

| id | verification_id | verification_date | verification_method | association_state_association_id | association_association_id | association_association_name |
|---|---|---|---|---|---|---|
| 1 | 2986233 | 2024-07-24T06:18:00 | uploaded | 1000 | id_20 | Primary Framework A |
| 2 | 778548 | 2025-12-08T13:35:00 | physical_copy | 1001 | 10782172 | Composite Protocol |
| 3 | 32828 | 2022-05-19T20:52:00 | form | 1002 | 8387550 | Compact Programme |
| 4 | e429623c-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-10-03T03:09:00 | uploaded | 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Legacy Standard D |

The vw_black_belt_verification_state_association view joins verification records with their governing state associations, providing a regional credential audit trail. The first row shows verification 1 linked to state association 1000 (Primary Framework A), while the fourth row shows verification 4 linked to state association 1003 (Legacy Standard D). This view enables regional administrators to review all verifications processed under their authority and ensure that the issuing organizations are properly accredited.

**View `vw_background_check_membership`**

```sql
CREATE VIEW vw_background_check_membership AS
SELECT a.background_check_id, a.check_id, a.check_date, a.check_status, b.membership_id AS membership_membership_id, b.membership_type AS membership_membership_type, b.registration_date AS membership_registration_date
FROM background_checks a JOIN memberships b ON a.membership_id = b.membership_id;
```

| background_check_id | check_id | check_date | check_status | membership_membership_id | membership_membership_type | membership_registration_date |
|---|---|---|---|---|---|---|
| 100 | 611510 | 2025-08-21T07:57:00 | pending | 100 | athlete | 2023-06-19T17:27:00 |
| 101 | 974935 | 2022-01-05T14:14:00 | passed | 101 | coach | 2024-11-03T00:44:00 |
| 102 | 9fff03be-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-06-16T21:31:00 | failed | 102 | referee | 2025-04-14T07:01:00 |
| 103 | b_VB-EC-12 | 2024-11-27T04:48:00 | pending | 103 | instructor | 2022-09-25T14:18:00 |

The vw_background_check_membership view links background check records to their associated memberships, providing a compliance verification tool. This view answers the question of whether a member's background clearance is current and matches their membership status. The first row shows background check 100 linked to membership 100 (athlete type, eligible), while the second row shows background check 101 linked to membership 101 (coach type, ineligible). This view is essential for ensuring that all active memberships have corresponding cleared background checks.

**View `vw_background_check_state_association`**

```sql
CREATE VIEW vw_background_check_state_association AS
SELECT a.background_check_id, a.check_id, a.check_date, a.check_status, b.state_association_id AS association_state_association_id, b.association_id AS association_association_id, b.association_name AS association_association_name
FROM background_checks a JOIN state_associations b ON a.state_association_id = b.state_association_id;
```

| background_check_id | check_id | check_date | check_status | association_state_association_id | association_association_id | association_association_name |
|---|---|---|---|---|---|---|
| 100 | 611510 | 2025-08-21T07:57:00 | pending | 1000 | id_20 | Primary Framework A |
| 101 | 974935 | 2022-01-05T14:14:00 | passed | 1001 | 10782172 | Composite Protocol |
| 102 | 9fff03be-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-06-16T21:31:00 | failed | 1002 | 8387550 | Compact Programme |
| 103 | b_VB-EC-12 | 2024-11-27T04:48:00 | pending | 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Legacy Standard D |

The vw_background_check_state_association view connects background check records to their governing state associations, providing a regional compliance overview. This view enables state association administrators to monitor the background check status of all individuals under their jurisdiction, ensuring that regional events are staffed and attended only by cleared participants. The view creates a direct line of accountability from individual compliance to regional oversight.

### Synthesis

The competitive martial arts administration domain operates as an interconnected system of credentials, memberships, and events. Athletes must maintain active memberships, cleared background checks, and verified black belt ranks to participate in competitions organized by state associations. The views presented here provide multiple perspectives on this ecosystem, allowing administrators, tournament directors, and regional authorities to access the information they need for their specific operational roles. From the athlete's journey through registration and verification to the competition day roster, every record serves a purpose in maintaining the integrity and safety of the competitive environment. The precise timestamps, status flags, and cross-references ensure that no participant can operate outside the established framework, creating a system where eligibility is transparent, verifiable, and enforceable.