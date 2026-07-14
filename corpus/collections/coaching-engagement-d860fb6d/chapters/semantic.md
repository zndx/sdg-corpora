## Domain Modelling and Relational Materialisation

The coaching management domain captures the lifecycle of professional coaching engagements, linking coaches to clients through structured sessions governed by defined topics and professional credentials. At its core, the domain revolves around a central fact: a coaching engagement. Each engagement is a bounded period during which a coach works with a client toward a stated goal, progressing through a series of sessions and ultimately yielding feedback. The relational schema normalises this reality into six base tables and ten materialised views, ensuring that every domain fact can be reconstructed through precise joins.

**Table `coaching_engagements`**

| coaching_engagement_id | engagement_id | start_date | end_date | status | session_count | coaching_goal | coach_id | client_id | coaching_topic_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 3717629 | 2022-09-05 | 2022-09-01 | planned | 44 | extended-coaching-99 | 1 | 1 | 1 |
| 2 | 1562852 | 2023-02-16 | 2023-02-12 | active | 0 | integrated-coaching-100 | 2 | 2 | 2 |
| 3 | 9246331 | 2024-07-27 | 2024-07-23 | completed | 72 | seasonal-coaching-101 | 3 | 3 | 3 |
| 4 | 32827 | 2025-12-11 | 2025-12-07 | cancelled | 69 | regional-coaching-102 | 4 | 4 | 4 |

The `coaching_engagements` table is the operational nucleus of the schema. Each row represents a single engagement, identified by a surrogate primary key `coaching_engagement_id` and a business-level `engagement_id` such as `3717629` or `32827`. Temporal boundaries are captured by `start_date` and `end_date` — for instance, engagement `3717629` spans from `2022-09-05` to `2022-09-01`, while engagement `9246331` runs from `2024-07-27` to `2024-07-23`. The `status` column tracks the lifecycle state with values like `planned`, `active`, `completed`, and `cancelled`. Session volume is recorded in `session_count`, which ranges from `0` for the newly initiated engagement `1562852` to `72` for the completed engagement `9246331`. The `coaching_goal` column stores a human-readable objective such as `extended-coaching-99` or `seasonal-coaching-101`.

Three foreign keys anchor each engagement to its participating entities. The `coach_id` column references the `coaches` table, the `client_id` column references the `clients` table, and the `coaching_topic_id` column references the `coaching_topics` table. This design enforces referential integrity: every engagement must be associated with exactly one coach, one client, and one coaching topic. The cardinality is one-to-one from the engagement's perspective, though a single coach or client may appear in multiple engagements across the dataset.

**Table `coaches`**

| id | coach_id | full_name | qualifications | years_experience | specialization | contact_email | contact_phone | professional_membership_id |
|---|---|---|---|---|---|---|---|---|
| 1 | ba1aea88-8fd1-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | baseline-qualific-43 | 16 | legacy-speciali-13 | Christopher Wilson | Joe Tsai | 1 |
| 2 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | Account Name | pilot-qualific-44 | 22 | compact-speciali-14 | Charles Larsen | Stephanie Collins | 2 |
| 3 | 937724 | Saipan International Airport | extended-qualific-45 | 28 | composite-speciali-15 | Mary Alvarez | Tasha Rodriguez | 3 |
| 4 | 0000000000000 | Norma Fisher | integrated-qualific-46 | 34 | primary-speciali-16 | April Snyder | Walter Pratt | 4 |

The `coaches` table stores the professional profiles of the coaches. Each row is identified by a surrogate `id` and a business `coach_id`, which is a UUID such as `ba1aea88-8fd1-11eb-924d-9cd76263cbd0` or `922ad118-9bad-11eb-a8a2-19ed5c03f8d3`. The `full_name` column holds the coach's name — `Theodore Mcgrath`, `Account Name`, `Saipan International Airport`, and `Norma Fisher` appear in the dataset. Professional credentials are captured in `qualifications` (e.g., `baseline-qualific-43`, `pilot-qualific-44`) and `specialization` (e.g., `legacy-speciali-13`, `compact-speciali-14`). Experience is quantified by `years_experience`, ranging from `16` years for Theodore Mcgrath to `34` years for Norma Fisher.

Contact information is stored in `contact_email` and `contact_phone`, with values such as `Christopher Wilson` and `Joe Tsai` for the first coach. The `professional_membership_id` column is a foreign key pointing to the `professional_memberships` table, establishing a one-to-one relationship between a coach and their primary professional credential. This means each coach row carries exactly one membership reference, while a membership can theoretically be associated with at most one coach in this normalised design.

**Table `clients`**

| id | client_id | full_name | occupation | industry | coaching_needs | client_since | coaching_engagement_id |
|---|---|---|---|---|---|---|---|
| 1 | Erin Olson | Theodore Mcgrath | legacy-occupati-37 | composite-industry-99 | integrated-coaching-28 | 2024-11-25 | 1 |
| 2 | Jorge Sullivan | Account Name | compact-occupati-38 | primary-industry-100 | seasonal-coaching-29 | 2025-04-09 | 2 |
| 3 | Kimberly Maynard | Saipan International Airport | composite-occupati-39 | adaptive-industry-101 | regional-coaching-30 | 2022-09-20 | 3 |
| 4 | Michelle Kelley | Norma Fisher | primary-occupati-40 | distributed-industry-102 | legacy-coaching-31 | 2023-02-04 | 4 |

The `clients` table mirrors the structure of `coaches` in its use of surrogate and business identifiers. The surrogate `id` and the business `client_id` distinguish each client record. The `full_name` column contains names like `Erin Olson`, `Jorge Sullivan`, `Kimberly Maynard`, and `Michelle Kelley`. Professional context is captured through `occupation` (e.g., `legacy-occupati-37`, `compact-occupati-38`) and `industry` (e.g., `composite-industry-99`, `primary-industry-100`). The `coaching_needs` column describes the client's stated requirements, with values such as `integrated-coaching-28` and `seasonal-coaching-29`.

The `client_since` column records the date the client first entered the system, ranging from `2022-09-20` for Kimberly Maynard to `2025-04-09` for Jorge Sullivan. The `coaching_engagement_id` column is a foreign key referencing `coaching_engagements`, creating a one-to-one link between a client and their primary engagement. This design choice means each client row is associated with exactly one engagement, though in practice a client might participate in multiple engagements over time — a scenario that would require a junction table for full normalisation.

**Table `coaching_topics`**

| id | topic_id | topic_name | description | category | coaching_engagement_id |
|---|---|---|---|---|---|
| 1 | lu_tax_code_template_b_VB-IC-Tab | Regional Model | Extended Survey | personal | 1 |
| 2 | 8387534 | Seasonal Cluster D | Pilot Corridor A | professional | 2 |
| 3 | 2933463 | Integrated Review | Baseline Series | wellness | 3 |
| 4 | 2839516 | Extended Initiative | Distributed Assessment | personal | 4 |

The `coaching_topics` table defines the subject matter categories under which engagements are organised. Each row has a surrogate `id`, a business `topic_id` (such as `lu_tax_code_template_b_VB-IC-Tab` or `8387534`), a `topic_name` (e.g., `Regional Model`, `Seasonal Cluster D`), and a `description` (e.g., `Extended Survey`, `Pilot Corridor A`). The `category` column classifies the topic into one of four domains: `personal`, `professional`, `wellness`, or `personal` again. The `coaching_engagement_id` column is a foreign key linking the topic to its associated engagement, enforcing the constraint that each topic is associated with exactly one engagement.

**Table `professional_memberships`**

| id | membership_id | organization_name | certification_level | issue_date | expiry_date | coach_id |
|---|---|---|---|---|---|---|
| 1 | 1152667 | Staples Inc. | seasonal-certific-59 | 2023-02-01 | 2023-10-24 | 1 |
| 2 | IVC20Iind | Oscar Health Inc. | regional-certific-60 | 2024-07-12 | 2024-03-08 | 2 |
| 3 | state_uk_8 | Atlantic Richfield | legacy-certific-61 | 2025-12-23 | 2025-08-19 | 3 |
| 4 | gd_acc_260002 | Port Loko | compact-certific-62 | 2022-05-07 | 2022-01-03 | 4 |

The `professional_memberships` table stores the credentialing information for coaches. Each row is identified by a surrogate `id` and a business `membership_id` (e.g., `1152667`, `IVC20Iind`, `state_uk_8`). The `organization_name` column names the certifying body, with values including `Staples Inc.`, `Oscar Health Inc.`, `Atlantic Richfield`, and `Port Loko`. The `certification_level` column captures the tier of certification, with values such as `seasonal-certific-59`, `regional-certific-60`, `legacy-certific-61`, and `compact-certific-62`.

Temporal validity is tracked through `issue_date` and `expiry_date`. For example, membership `1152667` was issued on `2023-02-01` and expires on `2023-10-24`, while membership `state_uk_8` was issued on `2025-12-23` and expires on `2025-08-19`. The `coach_id` column is a foreign key referencing the `coaches` table, establishing a one-to-one relationship where each membership is associated with exactly one coach.

**Table `client_feedbacks`**

| client_feedback_id | feedback_id | feedback_date | rating | testimonial | sentiment | client_id | coaching_engagement_id |
|---|---|---|---|---|---|---|---|
| 1 | 8189492 | 2022-05-14 | 24 | seasonal-testimon-83 | positive | 1 | 1 |
| 2 | L907 | 2023-10-25 | 29 | regional-testimon-84 | neutral | 2 | 2 |
| 3 | 1437575 | 2024-03-09 | 34 | legacy-testimon-85 | negative | 3 | 3 |
| 4 | gd_taxp_st_2_1 | 2025-08-20 | 39 | compact-testimon-86 | positive | 4 | 4 |

The `client_feedbacks` table captures post-engagement evaluations. Each row has a surrogate `client_feedback_id` and a business `feedback_id` (e.g., `8189492`, `L907`, `1437575`). The `feedback_date` records when the feedback was submitted, ranging from `2022-05-14` to `2025-08-20`. The `rating` column stores a numeric score, with values of `24`, `29`, `34`, and `39` appearing in the dataset. The `testimonial` column contains free-text comments such as `seasonal-testimon-83` and `regional-testimon-84`.

The `sentiment` column classifies the feedback as `positive`, `neutral`, or `negative`. Engagement `3717629` received a `positive` sentiment with testimonial `seasonal-testimon-83`, while engagement `9246331` received a `negative` sentiment with testimonial `legacy-testimon-85`. Two foreign keys anchor each feedback row: `client_id` references the `clients` table, and `coaching_engagement_id` references the `coaching_engagements` table. This dual foreign key design allows feedback to be traced back to both the client who provided it and the specific engagement it evaluates.

**Table `coaches_engagements`**

| coach_id | coaching_engagement_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `coaches_engagements` table serves as a junction table, resolving the many-to-many relationship between coaches and coaching engagements. While the `coaching_engagements` table already contains a `coach_id` foreign key suggesting a direct association, the presence of this junction table indicates that the schema supports a more flexible mapping — potentially allowing a coach to be associated with multiple engagements through intermediate records, or capturing additional metadata about the coach-engagement pairing that is not stored in the engagement table itself.

## Materialised Views

The schema provides ten materialised views that pre-join the normalised tables into denormalised result sets, each answering a specific analytical question. These views eliminate the need for application-level joins and provide a consistent interface for reporting and querying.

**View `v_coaching_engagement_coach`**

```sql
CREATE VIEW v_coaching_engagement_coach AS
SELECT a.coaching_engagement_id, a.engagement_id, a.start_date, a.end_date, b.id AS coach_id, b.coach_id AS coach_coach_id, b.full_name AS coach_full_name
FROM coaching_engagements a JOIN coaches b ON a.coach_id = b.id;
```

| coaching_engagement_id | engagement_id | start_date | end_date | coach_id | coach_coach_id | coach_full_name |
|---|---|---|---|---|---|---|
| 1 | 3717629 | 2022-09-05 | 2022-09-01 | 1 | ba1aea88-8fd1-11eb-924d-9cd76263cbd0 | Theodore Mcgrath |
| 2 | 1562852 | 2023-02-16 | 2023-02-12 | 2 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | Account Name |
| 3 | 9246331 | 2024-07-27 | 2024-07-23 | 3 | 937724 | Saipan International Airport |
| 4 | 32827 | 2025-12-11 | 2025-12-07 | 4 | 0000000000000 | Norma Fisher |

The view `v_coaching_engagement_coach` joins `coaching_engagements` with `coaches` to present each engagement alongside its assigned coach's full profile. This view answers the question: "Which coach is responsible for each engagement, and what are their qualifications?" For engagement `3717629`, the view would show coach `Theodore Mcgrath` with `16` years of experience and `baseline-qualific-43` qualifications. For engagement `9246331`, it would show coach `Saipan International Airport` with `28` years of experience and `extended-qualific-45` qualifications. The join is performed on the `coach_id` column, matching the foreign key in `coaching_engagements` to the primary key in `coaches`.

**View `v_coaching_engagement_client`**

```sql
CREATE VIEW v_coaching_engagement_client AS
SELECT a.coaching_engagement_id, a.engagement_id, a.start_date, a.end_date, b.id AS client_id, b.client_id AS client_client_id, b.full_name AS client_full_name
FROM coaching_engagements a JOIN clients b ON a.client_id = b.id;
```

| coaching_engagement_id | engagement_id | start_date | end_date | client_id | client_client_id | client_full_name |
|---|---|---|---|---|---|---|
| 1 | 3717629 | 2022-09-05 | 2022-09-01 | 1 | Erin Olson | Theodore Mcgrath |
| 2 | 1562852 | 2023-02-16 | 2023-02-12 | 2 | Jorge Sullivan | Account Name |
| 3 | 9246331 | 2024-07-27 | 2024-07-23 | 3 | Kimberly Maynard | Saipan International Airport |
| 4 | 32827 | 2025-12-11 | 2025-12-07 | 4 | Michelle Kelley | Norma Fisher |

The view `v_coaching_engagement_client` joins `coaching_engagements` with `clients` to present each engagement alongside its assigned client's full profile. This view answers: "Which client is receiving coaching, and what is their professional context?" For engagement `3717629`, the view would show client `Erin Olson` with occupation `legacy-occupati-37` and industry `composite-industry-99`. For engagement `1562852`, it would show client `Jorge Sullivan` with occupation `compact-occupati-38` and industry `primary-industry-100`. The join is performed on the `client_id` column.

**View `v_coaching_engagement_coaching_topic`**

```sql
CREATE VIEW v_coaching_engagement_coaching_topic AS
SELECT a.coaching_engagement_id, a.engagement_id, a.start_date, a.end_date, b.id AS topic_id, b.topic_id AS topic_topic_id, b.topic_name AS topic_topic_name
FROM coaching_engagements a JOIN coaching_topics b ON a.coaching_topic_id = b.id;
```

| coaching_engagement_id | engagement_id | start_date | end_date | topic_id | topic_topic_id | topic_topic_name |
|---|---|---|---|---|---|---|
| 1 | 3717629 | 2022-09-05 | 2022-09-01 | 1 | lu_tax_code_template_b_VB-IC-Tab | Regional Model |
| 2 | 1562852 | 2023-02-16 | 2023-02-12 | 2 | 8387534 | Seasonal Cluster D |
| 3 | 9246331 | 2024-07-27 | 2024-07-23 | 3 | 2933463 | Integrated Review |
| 4 | 32827 | 2025-12-11 | 2025-12-07 | 4 | 2839516 | Extended Initiative |

The view `v_coaching_engagement_coaching_topic` joins `coaching_engagements` with `coaching_topics` to present each engagement alongside its governing topic. This view answers: "What topic is each engagement focused on, and how is it categorised?" For engagement `3717629`, the view would show topic `Regional Model` in the `personal` category with description `Extended Survey`. For engagement `1562852`, it would show topic `Seasonal Cluster D` in the `professional` category with description `Pilot Corridor A`. The join is performed on the `coaching_topic_id` column.

**View `v_coach_professional_membership`**

```sql
CREATE VIEW v_coach_professional_membership AS
SELECT a.id, a.coach_id, a.full_name, a.qualifications, b.id AS membership_id, b.membership_id AS membership_membership_id, b.organization_name AS membership_organization_name
FROM coaches a JOIN professional_memberships b ON a.professional_membership_id = b.id;
```

| id | coach_id | full_name | qualifications | membership_id | membership_membership_id | membership_organization_name |
|---|---|---|---|---|---|---|
| 1 | ba1aea88-8fd1-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | baseline-qualific-43 | 1 | 1152667 | Staples Inc. |
| 2 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | Account Name | pilot-qualific-44 | 2 | IVC20Iind | Oscar Health Inc. |
| 3 | 937724 | Saipan International Airport | extended-qualific-45 | 3 | state_uk_8 | Atlantic Richfield |
| 4 | 0000000000000 | Norma Fisher | integrated-qualific-46 | 4 | gd_acc_260002 | Port Loko |

The view `v_coach_professional_membership` joins `coaches` with `professional_memberships` to present each coach alongside their professional credential. This view answers: "What professional membership does each coach hold, and is it currently valid?" For coach `Theodore Mcgrath`, the view would show membership at `Staples Inc.` with certification level `seasonal-certific-59`, issued on `2023-02-01` and expiring on `2023-10-24`. For coach `Norma Fisher`, it would show membership at `Port Loko` with certification level `compact-certific-62`, issued on `2022-05-07` and expiring on `2022-01-03`. The join is performed on the `professional_membership_id` column in `coaches` matching the primary key in `professional_memberships`.

**View `v_coach_coaching_engagement_detail`**

```sql
CREATE VIEW v_coach_coaching_engagement_detail AS
SELECT a.id, a.coach_id, a.full_name, b.coaching_engagement_id AS engagement_coaching_engagement_id, b.engagement_id AS engagement_engagement_id, b.start_date AS engagement_start_date
FROM coaches a
  JOIN coaches_engagements j ON j.coach_id = a.id
  JOIN coaching_engagements b ON b.coaching_engagement_id = j.coaching_engagement_id;
```

| id | coach_id | full_name | engagement_coaching_engagement_id | engagement_engagement_id | engagement_start_date |
|---|---|---|---|---|---|
| 1 | ba1aea88-8fd1-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | 1 | 3717629 | 2022-09-05 |
| 1 | ba1aea88-8fd1-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | 2 | 1562852 | 2023-02-16 |
| 2 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | Account Name | 2 | 1562852 | 2023-02-16 |
| 2 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | Account Name | 3 | 9246331 | 2024-07-27 |
| 3 | 937724 | Saipan International Airport | 3 | 9246331 | 2024-07-27 |
| 3 | 937724 | Saipan International Airport | 4 | 32827 | 2025-12-11 |
| 4 | 0000000000000 | Norma Fisher | 4 | 32827 | 2025-12-11 |
| 4 | 0000000000000 | Norma Fisher | 1 | 3717629 | 2022-09-05 |

The view `v_coach_coaching_engagement_detail` joins `coaches` with `coaching_engagements` to present a coach-centric view of all their engagements. This view answers: "What engagements is each coach currently managing, and what are the engagement details?" For coach `Theodore Mcgrath`, the view would show engagement `3717629` with status `planned`, `44` sessions, and coaching goal `extended-coaching-99`. For coach `Saipan International Airport`, it would show engagement `9246331` with status `completed`, `72` sessions, and coaching goal `seasonal-coaching-101`. The join is performed on the `coach_id` column.

**View `v_client_coaching_engagement`**

```sql
CREATE VIEW v_client_coaching_engagement AS
SELECT a.id, a.client_id, a.full_name, a.occupation, b.coaching_engagement_id AS engagement_coaching_engagement_id, b.engagement_id AS engagement_engagement_id, b.start_date AS engagement_start_date
FROM clients a JOIN coaching_engagements b ON a.coaching_engagement_id = b.coaching_engagement_id;
```

| id | client_id | full_name | occupation | engagement_coaching_engagement_id | engagement_engagement_id | engagement_start_date |
|---|---|---|---|---|---|---|
| 1 | Erin Olson | Theodore Mcgrath | legacy-occupati-37 | 1 | 3717629 | 2022-09-05 |
| 2 | Jorge Sullivan | Account Name | compact-occupati-38 | 2 | 1562852 | 2023-02-16 |
| 3 | Kimberly Maynard | Saipan International Airport | composite-occupati-39 | 3 | 9246331 | 2024-07-27 |
| 4 | Michelle Kelley | Norma Fisher | primary-occupati-40 | 4 | 32827 | 2025-12-11 |

The view `v_client_coaching_engagement` joins `clients` with `coaching_engagements` to present a client-centric view of their engagements. This view answers: "What engagements is each client participating in, and what are the engagement parameters?" For client `Erin Olson`, the view would show engagement `3717629` with start date `2022-09-05`, end date `2022-09-01`, and status `planned`. For client `Michelle Kelley`, it would show engagement `32827` with start date `2025-12-11`, end date `2025-12-07`, and status `cancelled`. The join is performed on the `client_id` column.

**View `v_coaching_topic_coaching_engagement`**

```sql
CREATE VIEW v_coaching_topic_coaching_engagement AS
SELECT a.id, a.topic_id, a.topic_name, a.description, b.coaching_engagement_id AS engagement_coaching_engagement_id, b.engagement_id AS engagement_engagement_id, b.start_date AS engagement_start_date
FROM coaching_topics a JOIN coaching_engagements b ON a.coaching_engagement_id = b.coaching_engagement_id;
```

| id | topic_id | topic_name | description | engagement_coaching_engagement_id | engagement_engagement_id | engagement_start_date |
|---|---|---|---|---|---|---|
| 1 | lu_tax_code_template_b_VB-IC-Tab | Regional Model | Extended Survey | 1 | 3717629 | 2022-09-05 |
| 2 | 8387534 | Seasonal Cluster D | Pilot Corridor A | 2 | 1562852 | 2023-02-16 |
| 3 | 2933463 | Integrated Review | Baseline Series | 3 | 9246331 | 2024-07-27 |
| 4 | 2839516 | Extended Initiative | Distributed Assessment | 4 | 32827 | 2025-12-11 |

The view `v_coaching_topic_coaching_engagement` joins `coaching_topics` with `coaching_engagements` to present a topic-centric view of all engagements under each topic. This view answers: "Which engagements are governed by each coaching topic?" For topic `Regional Model` in the `personal` category, the view would show engagement `3717629` with status `planned` and `44` sessions. For topic `Integrated Review` in the `wellness` category, it would show engagement `9246331` with status `completed` and `72` sessions. The join is performed on the `coaching_engagement_id` column in `coaching_topics` matching the primary key in `coaching_engagements`.

**View `v_professional_membership_coach`**

```sql
CREATE VIEW v_professional_membership_coach AS
SELECT a.id, a.membership_id, a.organization_name, a.certification_level, b.id AS coach_id, b.coach_id AS coach_coach_id, b.full_name AS coach_full_name
FROM professional_memberships a JOIN coaches b ON a.coach_id = b.id;
```

| id | membership_id | organization_name | certification_level | coach_id | coach_coach_id | coach_full_name |
|---|---|---|---|---|---|---|
| 1 | 1152667 | Staples Inc. | seasonal-certific-59 | 1 | ba1aea88-8fd1-11eb-924d-9cd76263cbd0 | Theodore Mcgrath |
| 2 | IVC20Iind | Oscar Health Inc. | regional-certific-60 | 2 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | Account Name |
| 3 | state_uk_8 | Atlantic Richfield | legacy-certific-61 | 3 | 937724 | Saipan International Airport |
| 4 | gd_acc_260002 | Port Loko | compact-certific-62 | 4 | 0000000000000 | Norma Fisher |

The view `v_professional_membership_coach` is the inverse of `v_coach_professional_membership`, joining `professional_memberships` with `coaches` to present each membership alongside its associated coach. This view answers: "Which coach holds each professional membership?" For membership `1152667` at `Staples Inc.`, the view would show coach `Theodore Mcgrath` with `16` years of experience. For membership `state_uk_8` at `Atlantic Richfield`, it would show coach `Saipan International Airport` with `28` years of experience. The join is performed on the `coach_id` column in `professional_memberships` matching the primary key in `coaches`.

**View `v_client_feedback_client`**

```sql
CREATE VIEW v_client_feedback_client AS
SELECT a.client_feedback_id, a.feedback_id, a.feedback_date, a.rating, b.id AS client_id, b.client_id AS client_client_id, b.full_name AS client_full_name
FROM client_feedbacks a JOIN clients b ON a.client_id = b.id;
```

| client_feedback_id | feedback_id | feedback_date | rating | client_id | client_client_id | client_full_name |
|---|---|---|---|---|---|---|
| 1 | 8189492 | 2022-05-14 | 24 | 1 | Erin Olson | Theodore Mcgrath |
| 2 | L907 | 2023-10-25 | 29 | 2 | Jorge Sullivan | Account Name |
| 3 | 1437575 | 2024-03-09 | 34 | 3 | Kimberly Maynard | Saipan International Airport |
| 4 | gd_taxp_st_2_1 | 2025-08-20 | 39 | 4 | Michelle Kelley | Norma Fisher |

The view `v_client_feedback_client` joins `client_feedbacks` with `clients` to present each feedback alongside the client who provided it. This view answers: "Which client submitted each feedback, and what is their professional background?" For feedback `8189492` with rating `24` and sentiment `positive`, the view would show client `Erin Olson` with occupation `legacy-occupati-37`. For feedback `1437575` with rating `34` and sentiment `negative`, it would show client `Kimberly Maynard` with occupation `composite-occupati-39`. The join is performed on the `client_id` column.

**View `v_client_feedback_coaching_engagement`**

```sql
CREATE VIEW v_client_feedback_coaching_engagement AS
SELECT a.client_feedback_id, a.feedback_id, a.feedback_date, a.rating, b.coaching_engagement_id AS engagement_coaching_engagement_id, b.engagement_id AS engagement_engagement_id, b.start_date AS engagement_start_date
FROM client_feedbacks a JOIN coaching_engagements b ON a.coaching_engagement_id = b.coaching_engagement_id;
```

| client_feedback_id | feedback_id | feedback_date | rating | engagement_coaching_engagement_id | engagement_engagement_id | engagement_start_date |
|---|---|---|---|---|---|---|
| 1 | 8189492 | 2022-05-14 | 24 | 1 | 3717629 | 2022-09-05 |
| 2 | L907 | 2023-10-25 | 29 | 2 | 1562852 | 2023-02-16 |
| 3 | 1437575 | 2024-03-09 | 34 | 3 | 9246331 | 2024-07-27 |
| 4 | gd_taxp_st_2_1 | 2025-08-20 | 39 | 4 | 32827 | 2025-12-11 |

The view `v_client_feedback_coaching_engagement` joins `client_feedbacks` with `coaching_engagements` to present each feedback alongside the engagement it evaluates. This view answers: "Which engagement received this feedback, and what is its current status?" For feedback `8189492` with sentiment `positive`, the view would show engagement `3717629` with status `planned` and coaching goal `extended-coaching-99`. For feedback `1437575` with sentiment `negative`, it would show engagement `9246331` with status `completed` and coaching goal `seasonal-coaching-101`. The join is performed on the `coaching_engagement_id` column.

## Synthesis

The coaching management schema demonstrates a disciplined approach to relational modelling. The six base tables capture the domain's core entities — engagements, coaches, clients, topics, memberships, and feedback — each normalised to eliminate redundancy while preserving referential integrity through foreign keys. The `coaching_engagements` table serves as the central hub, with three foreign keys linking to coaches, clients, and topics, while `client_feedbacks` provides a many-to-one link back to both clients and engagements. The `coaches_engagements` junction table suggests an additional layer of flexibility in the coach-engagement relationship.

The ten materialised views transform this normalised structure into a set of denormalised, query-ready result sets. Each view answers a specific analytical question by joining two or more base tables, pre-computing the relationships that would otherwise require application-level joins. Together, the base tables and views provide a complete, queryable representation of the coaching domain, from the granular level of individual feedback ratings to the holistic view of a coach's professional profile and engagement portfolio.