The martial arts governance ecosystem revolves around a single, recurring question: which athlete, under which membership and verification conditions, is eligible to compete in which division of which competition, and under the authority of which state association? The relational schema answers this by normalizing people, roles, events, and regulatory checks into ten base tables linked by foreign keys and three junction tables, then reassembling them through twenty views that each answer a distinct operational question.

## Domain Entities and Their Normalized Tables

The domain's core entity is the athlete. The `athletes` table stores biographical and regulatory attributes for each competitor. Every row carries a surrogate primary key (`id`), a business-level `athlete_id` that varies in format—integer identifiers like `7441146`, UUIDs such as `ebdf79bc-8fd1-11eb-924d-9cd76263cbd0`, and Google Place IDs like `ChIJJ60m-q5t5kcRMZ9MdM8fVm4`—along with `first_name` and `last_name` (e.g., *Stephanie Collins*, *Janice Johnston*), a `date_of_birth`, and three status columns: `membership_status` (one of `active`, `inactive`, `suspended`), `citizenship_status` (`us_citizen` or `resident`), and `black_belt_rank` (an integer ranging from 37 to 55). The boolean `background_check_status` and three foreign keys—`membership_id`, `competition_id`, and `black_belt_verification_id`—tie the athlete record to its regulatory and event context. Timestamps `created_at` and `updated_at` record the lifecycle.

**Table `athletes`**

| id | athlete_id | first_name | last_name | date_of_birth | membership_status | citizenship_status | black_belt_rank | background_check_status | membership_id | competition_id | black_belt_verification_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 7441146 | Stephanie Collins | Paul Allen | 2025-04-02 | active | us_citizen | 37 | true | 100 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | ebdf79bc-8fd1-11eb-924d-9cd76263cbd0 | Janice Johnston | Heather Beasley | 2022-09-13 | inactive | resident | 43 | false | 101 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | ChIJJ60m-q5t5kcRMZ9MdM8fVm4 | Upal Saha | Audrey Taylor | 2023-02-24 | suspended | us_citizen | 49 | true | 102 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 89146 | Katherine Snyder | Susan Wagner | 2024-07-08 | active | resident | 55 | false | 103 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Membership is a separate entity because a single athlete may hold multiple membership records over time, and the membership carries its own lifecycle and eligibility logic. The `memberships` table stores `membership_id` as its primary key, `membership_type` (one of `athlete`, `coach`, `referee`, `instructor`), a `registration_date`, a `fee_amount` (e.g., `38.08` for an athlete, `18.47` for a coach), an `expiration_date`, and a boolean `is_eligible_for_competition`. The foreign key `athlete_id` links the membership back to the `athletes` table, while `background_check_id` links to the `background_checks` table.

**Table `memberships`**

| membership_id | membership_type | registration_date | fee_amount | expiration_date | is_eligible_for_competition | athlete_id | background_check_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | athlete | 2023-06-19T17:27:00 | 38.08 | 2025-08-18 | true | 1000 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | coach | 2024-11-03T00:44:00 | 18.47 | 2022-01-02 | false | 1001 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | referee | 2025-04-14T07:01:00 | 38.08 | 2023-06-13 | true | 1002 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | instructor | 2022-09-25T14:18:00 | 26.25 | 2024-11-24 | false | 1003 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Competitions are events organized by state associations. The `competitions` table holds `id` as its surrogate key, a business `competition_id` (e.g., `4277014`, `575210`), a `competition_name` (*Compact Model*, *Legacy Cluster*), a `competition_level` (`state` or `national`), `start_date` and `end_date`, a `location` string, a boolean `is_on_site_registration`, and two foreign keys: `state_association_id` pointing to `state_associations` and `qualifies_for_competition_id` pointing back to `competitions` itself, enabling a self-referential hierarchy where one competition can qualify another.

**Table `competitions`**

| id | competition_id | competition_name | competition_level | start_date | end_date | location | is_on_site_registration | state_association_id | qualifies_for_competition_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 4277014 | Compact Model | state | 2022-09-05 | 2022-09-01 | extended-location-99 | false | 1000 | 1 |
| 2 | 575210 | Legacy Cluster | national | 2023-02-16 | 2023-02-12 | integrated-location-100 | true | 1001 | 2 |
| 3 | 619 | Regional Review A | state | 2024-07-27 | 2024-07-23 | seasonal-location-101 | false | 1002 | 3 |
| 4 | 10449520 | Seasonal Initiative | national | 2025-12-11 | 2025-12-07 | regional-location-102 | true | 1003 | 4 |

Competition divisions refine the event structure. The `competition_divisions` table stores `division_id`, `division_name` (*Composite Protocol*, *Compact Programme A*), `age_category` (`cadet`, `junior`, `senior`), `rank_requirement` (coded strings like `distributed-rank-78`), `event_type` (`sparring` or `poomsae`), `rule_set` (`grassroots` or `world_class`), `head_contact_allowed` (storing names such as *Peter Montgomery* or *Michelle Kelley* in the sample data), and a foreign key `competition_id` linking to `competitions`.

**Table `competition_divisions`**

| division_id | division_name | age_category | rank_requirement | event_type | rule_set | head_contact_allowed | competition_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 89512 | Composite Protocol | cadet | distributed-rank-78 | sparring | grassroots | Peter Montgomery | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 10207146 | Compact Programme A | junior | baseline-rank-79 | poomsae | world_class | Michelle Kelley | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 212 | Legacy Standard | senior | pilot-rank-80 | sparring | grassroots | Michelle Kelley | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| id_14 | Regional Framework | cadet | extended-rank-81 | poomsae | world_class | Mary Alvarez | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

State associations are the regional governing bodies. The `state_associations` table stores `state_association_id` as its primary key, an `association_id`, `association_name` (*Primary Framework A*, *Composite Protocol*), a `state_code`, `contact_email`, `contact_phone`, and a foreign key `black_belt_verification_id` linking to `black_belt_verifications`.

**Table `state_associations`**

| state_association_id | association_id | association_name | state_code | contact_email | contact_phone | black_belt_verification_id |
|---|---|---|---|---|---|---|
| 1000 | id_20 | Primary Framework A | 17788643 | Christopher Wilson | Joe Tsai | 1 |
| 1001 | 10782172 | Composite Protocol | 8350031 | Charles Larsen | Stephanie Collins | 2 |
| 1002 | 8387550 | Compact Programme | 790483 | Mary Alvarez | Tasha Rodriguez | 3 |
| 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Legacy Standard D | 8387549 | April Snyder | Walter Pratt | 4 |

Black belt verifications are regulatory records. The `black_belt_verifications` table stores `id` as its surrogate key, a business `verification_id`, a `verification_date`, a `verification_method` (`uploaded`, `physical_copy`, or `form`), a boolean `is_verified`, an `issuing_organization` (*Alphabet Inc Class A*, *ITT Industries*), and two foreign keys: `athlete_id` linking to `athletes` and `state_association_id` linking to `state_associations`.

**Table `black_belt_verifications`**

| id | verification_id | verification_date | verification_method | is_verified | issuing_organization | athlete_id | state_association_id |
|---|---|---|---|---|---|---|---|
| 1 | 2986233 | 2024-07-24T06:18:00 | uploaded | true | Alphabet Inc Class A | 1000 | 1000 |
| 2 | 778548 | 2025-12-08T13:35:00 | physical_copy | false | ITT Industries | 1001 | 1001 |
| 3 | 32828 | 2022-05-19T20:52:00 | form | true | Switch Card Services Ltd. | 1002 | 1002 |
| 4 | e429623c-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-10-03T03:09:00 | uploaded | false | Buypass AS | 1003 | 1003 |

Background checks are compliance records. The `background_checks` table stores `id` as its surrogate key, a business `background_check_id`, a `check_date`, a `check_type` (`standard` or `enhanced`), a `result` (`pass` or `fail`), an `issued_by` organization, and a foreign key `membership_id` linking to `memberships`.

**Table `background_checks`**

| background_check_id | check_id | check_date | check_status | required_for_role | membership_id | state_association_id |
|---|---|---|---|---|---|---|
| 100 | 611510 | 2025-08-21T07:57:00 | pending | coach | 100 | 1000 |
| 101 | 974935 | 2022-01-05T14:14:00 | passed | referee | 101 | 1001 |
| 102 | 9fff03be-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-06-16T21:31:00 | failed | instructor | 102 | 1002 |
| 103 | b_VB-EC-12 | 2024-11-27T04:48:00 | pending | club_owner | 103 | 1003 |

## Many-to-Many Relationships and Junction Tables

Three junction tables resolve many-to-many relationships that cannot be expressed through simple foreign keys. The `competitions_divisions` table links `competitions` to `competition_divisions` with columns `competition_id` and `division_id`, allowing a single competition to host multiple divisions and a division template to be reused across competitions.

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

The `divisions_athletes` table links `competition_divisions` to `athletes` with columns `division_id` and `athlete_id`, recording which athletes have registered for which divisions.

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

The `associations_competitions` table links `state_associations` to `competitions` with columns `state_association_id` and `competition_id`, enabling a state association to sponsor multiple competitions and a competition to be co-sponsored by multiple associations.

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

## Views: Reconstructing Domain Facts

Views materialize the normalized schema into queryable facts. Each view joins two or more base tables to answer a specific operational question.

The view `vw_athlete_membership` joins `athletes` to `memberships` on `athletes.id = memberships.athlete_id`, producing a flat record that shows each athlete alongside their membership type, fee, and eligibility status. For example, athlete `1000` (Stephanie Collins) appears with membership `100` of type `athlete`, fee `38.08`, and `is_eligible_for_competition = true`.

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

The view `vw_athlete_competition` joins `athletes` to `competitions` on `athletes.competition_id = competitions.id`, answering which competition each athlete is associated with. Athlete `1000` links to competition `1` (*Compact Model*, level `state`, location `extended-location-99`).

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

The view `vw_athlete_black_belt_verification` joins `athletes` to `black_belt_verifications` on `athletes.id = black_belt_verifications.athlete_id`, revealing each athlete's verification status. Athlete `1000` has verification `1` with `is_verified = true`, issued by *Alphabet Inc Class A* via the `uploaded` method.

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

The view `vw_membership_athlete` performs the inverse join, starting from `memberships` and attaching the athlete's name and status. Membership `100` (type `athlete`, fee `38.08`) resolves to athlete `1000` (Stephanie Collins, status `active`).

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

The view `vw_membership_background_check` joins `memberships` to `background_checks` on `memberships.background_check_id = background_checks.id`, showing each membership's compliance record. Membership `100` links to background check `100` of type `standard` with result `pass`, issued by *Global Dynamics*.

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

The view `vw_competition_state_association` joins `competitions` to `state_associations` on `competitions.state_association_id = state_associations.state_association_id`, revealing the governing body behind each event. Competition `1` (*Compact Model*) is governed by state association `1000` (*Primary Framework A*, state code `17788643`).

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

The view `vw_competition_competition` performs a self-join on `competitions`, linking each competition to its qualifier via `competitions.id = competitions.qualifies_for_competition_id`. Competition `1` qualifies competition `1` (self-reference in the sample), while competition `2` (*Legacy Cluster*) qualifies competition `2`.

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

The view `vw_competition_competition_division_detail` joins `competitions` to `competition_divisions` on `competitions.id = competition_divisions.competition_id`, showing which divisions belong to which competition. Competition `1` (*Compact Model*) hosts division `89512` (*Composite Protocol*, age `cadet`, event `sparring`, rule set `grassroots`).

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

The view `vw_competition_division_competition` performs the inverse, starting from `competition_divisions` and attaching the parent competition's name and level. Division `89512` (*Composite Protocol*) resolves to competition `1` (*Compact Model*, level `state`).

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

The view `vw_competition_division_athlete_detail` joins `competition_divisions` to `divisions_athletes` and then to `athletes`, answering which athletes are registered in which divisions. Division `89512` (*Composite Protocol*) includes athlete `1000` (Stephanie Collins, black belt rank `37`).

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

The view `vw_state_association_competition_detail` joins `state_associations` to `associations_competitions` and then to `competitions`, showing which competitions each state association sponsors. State association `1000` (*Primary Framework A*) sponsors competition `1` (*Compact Model*, level `state`).

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

The view `vw_state_association_black_belt_verification` joins `state_associations` to `black_belt_verifications` on `state_associations.state_association_id = black_belt_verifications.state_association_id`, revealing which verifications each state association has processed. State association `1000` (*Primary Framework A*) has processed verification `1` (method `uploaded`, `is_verified = true`, issued by *Alphabet Inc Class A*).

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

The view `vw_black_belt_verification_athlete` joins `black_belt_verifications` to `athletes` on `black_belt_verifications.athlete_id = athletes.id`, showing each verification's athlete. Verification `1` (method `uploaded`, `is_verified = true`) belongs to athlete `1000` (Stephanie Collins, black belt rank `37`).

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

The view `vw_black_belt_verification_state_association` joins `black_belt_verifications` to `state_associations` on `black_belt_verifications.state_association_id = state_associations.state_association_id`, showing which state association issued each verification. Verification `1` was issued under state association `1000` (*Primary Framework A*, state code `17788643`).

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

The view `vw_background_check_membership` joins `background_checks` to `memberships` on `background_checks.id = memberships.background_check_id`, showing each membership's compliance record. Background check `100` (type `standard`, result `pass`, issued by *Global Dynamics*) is linked to membership `100` (type `athlete`, fee `38.08`).

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

The view `vw_background_check_state_association` joins `background_checks` to `memberships` and then to `athletes` and finally to `state_associations` through the athlete's verification link, connecting compliance records to the governing state association. Background check `100` traces to athlete `1000` (Stephanie Collins), whose verification `1` is governed by state association `1000` (*Primary Framework A*).

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

## Closing Synthesis

The schema models the martial arts governance domain as a network of ten base tables connected by foreign keys and three junction tables, normalizing athletes, memberships, competitions, divisions, state associations, verifications, and background checks into atomic entities. The twenty views then reconstruct the domain facts that operators need: which athlete holds which membership, which competition hosts which division, which state association governs which event, and which verification clears which competitor. Every view is a deterministic join over the normalized tables, ensuring that the relational model faithfully reflects the ontology while remaining queryable at the granularity required by each operational role.