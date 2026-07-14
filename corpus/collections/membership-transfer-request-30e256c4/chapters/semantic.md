The membership transfer management domain captures the lifecycle of benefit-program transitions when individuals leave or retain their organizational affiliations. At its core, the system tracks *requests*—each representing a single transfer event—alongside the people who submit them, the members whose benefits are affected, and the benefit programs involved. The relational model normalizes these concepts into seven base tables, linked by foreign keys and junction tables, and then reassembles them through six materialized views that answer the domain's natural questions.

**Table `membership_transfer_requests`**

| id | request_id | submission_date | status | transfer_reason | processing_days | request_submitter_id | b_p_r_o_member_id | involves_recipient_b_p_r_o_member_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 2087732 | 2025-04-24T03:57:00 | pending | transfer_to_non_member | 6 | 1000 | 1000 | 1000 |
| 2 | 575213 | 2022-09-08T10:14:00 | processing | retain_by_departing_employee | 12 | 1001 | 1001 | 1001 |
| 3 | 103167 | 2023-02-19T17:31:00 | completed | transfer_to_non_member | 18 | 1002 | 1002 | 1002 |
| 4 | 611510 | 2024-07-03T00:48:00 | failed | retain_by_departing_employee | 24 | 1003 | 1003 | 1003 |

The `membership_transfer_requests` table is the central fact table of the schema. Each row records a transfer request identified by a surrogate primary key `id` and a business-level `request_id` (for example, `2087732` or `575213`). The `submission_date` column timestamps when the request was filed—`2025-04-24T03:57:00` for request `2087732`, `2022-09-08T10:14:00` for `575213`—while the `status` column tracks its current state through the pipeline: `pending`, `processing`, `completed`, or `failed`. The `transfer_reason` column encodes the business motive, taking values such as `transfer_to_non_member` or `retain_by_departing_employee`. The `processing_days` column measures how long the request has been in flight, ranging from `6` days for the first record to `24` days for the fourth. Three foreign-key columns anchor the request to the rest of the domain: `request_submitter_id` points to the person who filed the request, `b_p_r_o_member_id` identifies the departing member, and `involves_recipient_b_p_r_o_member_id` identifies the recipient member who will receive the transferred benefits. In the sample data, all three foreign keys share the same value within a row (e.g., `1000` for the first request), indicating that the submitter, departing member, and recipient can be the same entity in certain scenarios.

**Table `request_submitters`**

| id | submitter_name | submitter_email | created_at |
|---|---|---|---|
| 1000 | Baseline Standard D | seasonal-submitte-53 | 2025-01-01 00:14:00 |
| 1001 | Distributed Framework | regional-submitte-54 | 2025-02-06 03:14:00 |
| 1002 | Adaptive Protocol | legacy-submitte-55 | 2025-03-11 06:14:00 |
| 1003 | Primary Programme A | compact-submitte-56 | 2025-04-16 09:14:00 |

The `request_submitters` table stores the identity of the individuals who initiate transfer requests. Its primary key `id` matches the `request_submitter_id` foreign key in `membership_transfer_requests`. Each submitter has a `submitter_name` (such as `Baseline Standard D` or `Distributed Framework`), a `submitter_email` (such as `seasonal-submitte-53` or `regional-submitte-54`), and a `created_at` timestamp recording when the submitter record was established. The submitter table is a simple one-to-many relationship with requests: a single submitter can file multiple requests, as evidenced by submitter `1000` appearing in the junction table `submitters_requests` for both request `1` and request `2`.

**Table `b_p_r_o_members`**

| id | member_name | member_email | is_former_member | membership_duration_months | membership_type | membership_transfer_request_id | is_recipient_of_membership_transfer_request_id |
|---|---|---|---|---|---|---|---|
| 1000 | Stephanie Higgins | composite-member-87 | true | 29 | individual | 1 | 1 |
| 1001 | Stephanie Sutton | primary-member-88 | false | 36 | lifetime | 2 | 2 |
| 1002 | Michael Oconnell | adaptive-member-89 | true | 43 | individual | 3 | 3 |
| 1003 | Theodore Mcgrath | distributed-member-90 | false | 50 | lifetime | 4 | 4 |

The `b_p_r_o_members` table models the people whose benefit coverage is the subject of a transfer. Its primary key `id` is referenced by both `b_p_r_o_member_id` and `involves_recipient_b_p_r_o_member_id` in `membership_transfer_requests`, as well as by `membership_transfer_request_id` and `is_recipient_of_membership_transfer_request_id` in this table itself, creating a bidirectional relationship. Each member record carries a `member_name` (e.g., `Stephanie Higgins`, `Stephanie Sutton`, `Michael Oconnell`, `Theodore Mcgrath`), a `member_email` (e.g., `composite-member-87`, `primary-member-88`), a boolean `is_former_member` flag, a `membership_duration_months` integer (ranging from `29` to `50`), and a `membership_type` that is either `individual` or `lifetime`. The two foreign-key columns in this table—`membership_transfer_request_id` and `is_recipient_of_membership_transfer_request_id`—allow a member to appear as both the departing party and the recipient in different requests, or in the same request if the data permits.

**Table `benefit_programs`**

| benefit_program_id | program_code | program_name |
|---|---|---|
| 1 | 191 | Auxiliary Grant |
| 2 | 1186082 | Energy Assistance |
| 3 | 3990187 | Foster Care & Adoption Assistance |
| 4 | flexible-thinking | Fraud |

The `benefit_programs` table catalogs the benefit programs that can be transferred. Its primary key `benefit_program_id` is a small integer (1 through 4 in the sample data), while the `program_code` column holds a business identifier that varies in format—numeric codes like `191` and `1186082` alongside alphanumeric codes like `flexible-thinking`. The `program_name` column provides a human-readable label: `Auxiliary Grant`, `Energy Assistance`, `Foster Care & Adoption Assistance`, and `Fraud`. This table participates in many-to-many relationships with requests through two junction tables.

**Table `requests_programs`**

| membership_transfer_request_id | benefit_program_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `requests_programs` junction table materializes the many-to-many relationship between `membership_transfer_requests` and `benefit_programs`. Each row pairs a `membership_transfer_request_id` with a `benefit_program_id`, indicating that the given request involves the given program. Request `1` is associated with programs `1` and `2` (Auxiliary Grant and Energy Assistance), while request `4` is associated with programs `4` and `1` (Fraud and Auxiliary Grant). This table enables a single transfer request to span multiple benefit programs, reflecting the reality that a departing member's coverage may be split across several programs.

**Table `submitters_requests`**

| request_submitter_id | membership_transfer_request_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `submitters_requests` junction table captures the many-to-many relationship between `request_submitters` and `membership_transfer_requests`. A submitter can file multiple requests, and a request can be associated with multiple submitters (perhaps representing co-signers or delegated authority). In the sample data, submitter `1000` is linked to requests `1` and `2`, submitter `1001` to requests `2` and `3`, submitter `1002` to requests `3` and `4`, and submitter `1003` to requests `4` and `1`. This overlapping pattern suggests that submitters collaborate across requests, and each request may have multiple authorized submitters.

**Table `programs_requests`**

| benefit_program_id | membership_transfer_request_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `programs_requests` table is a second junction table linking `benefit_programs` to `membership_transfer_requests`. Its structure mirrors `requests_programs` with columns `membership_transfer_request_id` and `benefit_program_id`, and it contains the same eight rows of data. This redundancy may serve a specific querying or access-control purpose in the application layer, providing an alternate join path from the program side to the request side.

With the base tables and junction tables in place, the schema defines six materialized views that reassemble the normalized data into domain-meaningful perspectives. Each view answers a specific question by joining the fact table with one or more dimension tables.

**View `vw_membership_transfer_request_request_submitter`**

```sql
CREATE VIEW vw_membership_transfer_request_request_submitter AS
SELECT a.id, a.request_id, a.submission_date, a.status, b.id AS submitter_id, b.submitter_name AS submitter_submitter_name, b.submitter_email AS submitter_submitter_email
FROM membership_transfer_requests a JOIN request_submitters b ON a.request_submitter_id = b.id;
```

| id | request_id | submission_date | status | submitter_id | submitter_submitter_name | submitter_submitter_email |
|---|---|---|---|---|---|---|
| 1 | 2087732 | 2025-04-24T03:57:00 | pending | 1000 | Baseline Standard D | seasonal-submitte-53 |
| 2 | 575213 | 2022-09-08T10:14:00 | processing | 1001 | Distributed Framework | regional-submitte-54 |
| 3 | 103167 | 2023-02-19T17:31:00 | completed | 1002 | Adaptive Protocol | legacy-submitte-55 |
| 4 | 611510 | 2024-07-03T00:48:00 | failed | 1003 | Primary Programme A | compact-submitte-56 |

The view `vw_membership_transfer_request_request_submitter` joins `membership_transfer_requests` to `request_submitters` on the `request_submitter_id` foreign key. It answers the question: *Who submitted each transfer request, and what is the current status of that request?* Reading the first row, we see that submitter `1000` (Baseline Standard D, email `seasonal-submitte-53`) filed request `2087732`, which is currently `pending` and involves a `transfer_to_non_member` reason. The second row shows that submitter `1001` (Distributed Framework, email `regional-submitte-54`) filed request `575213`, which is in `processing` status with a `retain_by_departing_employee` reason. This view is the primary operational dashboard for tracking which submitter is responsible for which request and its progress.

**View `vw_membership_transfer_request_b_p_r_o_member`**

```sql
CREATE VIEW vw_membership_transfer_request_b_p_r_o_member AS
SELECT a.id, a.request_id, a.submission_date, a.status, b.id AS member_id, b.member_name AS member_member_name, b.member_email AS member_member_email
FROM membership_transfer_requests a JOIN b_p_r_o_members b ON a.b_p_r_o_member_id = b.id;
```

| id | request_id | submission_date | status | member_id | member_member_name | member_member_email |
|---|---|---|---|---|---|---|
| 1 | 2087732 | 2025-04-24T03:57:00 | pending | 1000 | Stephanie Higgins | composite-member-87 |
| 2 | 575213 | 2022-09-08T10:14:00 | processing | 1001 | Stephanie Sutton | primary-member-88 |
| 3 | 103167 | 2023-02-19T17:31:00 | completed | 1002 | Michael Oconnell | adaptive-member-89 |
| 4 | 611510 | 2024-07-03T00:48:00 | failed | 1003 | Theodore Mcgrath | distributed-member-90 |

The view `vw_membership_transfer_request_b_p_r_o_member` joins `membership_transfer_requests` to `b_p_r_o_members` on the `b_p_r_o_member_id` foreign key. It answers: *Which member's benefits are being transferred in each request, and what are their membership characteristics?* The first row reveals that member `1000` (Stephanie Higgins, email `composite-member-87`, a former member with `29` months of `individual` membership) is the subject of request `2087732`. The second row shows member `1001` (Stephanie Sutton, email `primary-member-88`, a current member with `36` months of `lifetime` membership) for request `575213`. This view allows administrators to assess the membership profile of each transfer subject at a glance.

**View `vw_membership_transfer_request_benefit_program_detail`**

```sql
CREATE VIEW vw_membership_transfer_request_benefit_program_detail AS
SELECT a.id, a.request_id, a.submission_date, b.benefit_program_id AS program_benefit_program_id, b.program_code AS program_program_code, b.program_name AS program_program_name
FROM membership_transfer_requests a
  JOIN requests_programs j ON j.membership_transfer_request_id = a.id
  JOIN benefit_programs b ON b.benefit_program_id = j.benefit_program_id;
```

| id | request_id | submission_date | program_benefit_program_id | program_program_code | program_program_name |
|---|---|---|---|---|---|
| 1 | 2087732 | 2025-04-24T03:57:00 | 1 | 191 | Auxiliary Grant |
| 1 | 2087732 | 2025-04-24T03:57:00 | 2 | 1186082 | Energy Assistance |
| 2 | 575213 | 2022-09-08T10:14:00 | 2 | 1186082 | Energy Assistance |
| 2 | 575213 | 2022-09-08T10:14:00 | 3 | 3990187 | Foster Care & Adoption Assistance |
| 3 | 103167 | 2023-02-19T17:31:00 | 3 | 3990187 | Foster Care & Adoption Assistance |
| 3 | 103167 | 2023-02-19T17:31:00 | 4 | flexible-thinking | Fraud |
| 4 | 611510 | 2024-07-03T00:48:00 | 4 | flexible-thinking | Fraud |
| 4 | 611510 | 2024-07-03T00:48:00 | 1 | 191 | Auxiliary Grant |

The view `vw_membership_transfer_request_benefit_program_detail` joins `membership_transfer_requests` to `benefit_programs` through the `requests_programs` junction table. It answers: *Which benefit programs are involved in each transfer request?* Because of the many-to-many relationship, a single request can produce multiple rows in this view. Request `1` (submitted on `2025-04-24`, status `pending`) appears twice: once linked to program `1` (Auxiliary Grant, code `191`) and once to program `2` (Energy Assistance, code `1186082`). Request `3` (completed, `transfer_to_non_member`, `18` processing days) is linked to program `3` (Foster Care & Adoption Assistance, code `3990187`) and program `4` (Fraud, code `flexible-thinking`). This view is essential for auditing which programs are affected by each transfer.

**View `vw_request_submitter_membership_transfer_request_detail`**

```sql
CREATE VIEW vw_request_submitter_membership_transfer_request_detail AS
SELECT a.id, a.submitter_name, a.submitter_email, b.id AS request_id, b.request_id AS request_request_id, b.submission_date AS request_submission_date
FROM request_submitters a
  JOIN submitters_requests j ON j.request_submitter_id = a.id
  JOIN membership_transfer_requests b ON b.id = j.membership_transfer_request_id;
```

| id | submitter_name | submitter_email | request_id | request_request_id | request_submission_date |
|---|---|---|---|---|---|
| 1000 | Baseline Standard D | seasonal-submitte-53 | 1 | 2087732 | 2025-04-24T03:57:00 |
| 1000 | Baseline Standard D | seasonal-submitte-53 | 2 | 575213 | 2022-09-08T10:14:00 |
| 1001 | Distributed Framework | regional-submitte-54 | 2 | 575213 | 2022-09-08T10:14:00 |
| 1001 | Distributed Framework | regional-submitte-54 | 3 | 103167 | 2023-02-19T17:31:00 |
| 1002 | Adaptive Protocol | legacy-submitte-55 | 3 | 103167 | 2023-02-19T17:31:00 |
| 1002 | Adaptive Protocol | legacy-submitte-55 | 4 | 611510 | 2024-07-03T00:48:00 |
| 1003 | Primary Programme A | compact-submitte-56 | 4 | 611510 | 2024-07-03T00:48:00 |
| 1003 | Primary Programme A | compact-submitte-56 | 1 | 2087732 | 2025-04-24T03:57:00 |

The view `vw_request_submitter_membership_transfer_request_detail` joins `request_submitters` to `membership_transfer_requests` through the `submitters_requests` junction table. It answers: *For each submitter, which requests have they filed, and what are the details of those requests?* The many-to-many join means each submitter-request pair produces one row. Submitter `1000` (Baseline Standard D) appears in two rows: one for request `1` (status `pending`, reason `transfer_to_non_member`) and one for request `2` (status `processing`, reason `retain_by_departing_employee`). Submitter `1003` (Primary Programme A) appears for request `4` (status `failed`, reason `retain_by_departing_employee`) and request `1` (status `pending`). This view supports workload analysis by showing how many requests each submitter has initiated and their outcomes.

**View `vw_b_p_r_o_member_membership_transfer_request`**

```sql
CREATE VIEW vw_b_p_r_o_member_membership_transfer_request AS
SELECT a.id, a.member_name, a.member_email, a.is_former_member, b.id AS request_id, b.request_id AS request_request_id, b.submission_date AS request_submission_date
FROM b_p_r_o_members a JOIN membership_transfer_requests b ON a.membership_transfer_request_id = b.id;
```

| id | member_name | member_email | is_former_member | request_id | request_request_id | request_submission_date |
|---|---|---|---|---|---|---|
| 1000 | Stephanie Higgins | composite-member-87 | true | 1 | 2087732 | 2025-04-24T03:57:00 |
| 1001 | Stephanie Sutton | primary-member-88 | false | 2 | 575213 | 2022-09-08T10:14:00 |
| 1002 | Michael Oconnell | adaptive-member-89 | true | 3 | 103167 | 2023-02-19T17:31:00 |
| 1003 | Theodore Mcgrath | distributed-member-90 | false | 4 | 611510 | 2024-07-03T00:48:00 |

The view `vw_b_p_r_o_member_membership_transfer_request` joins `b_p_r_o_members` to `membership_transfer_requests` on the `membership_transfer_request_id` foreign key in the members table. It answers: *For each member, which transfer request involves them, and what is the request's status?* The first row shows that member `1000` (Stephanie Higgins, former member, `29` months `individual` membership) is involved in request `1` (status `pending`, reason `transfer_to_non_member`). The fourth row shows member `1003` (Theodore Mcgrath, current member, `50` months `lifetime` membership) in request `4` (status `failed`, reason `retain_by_departing_employee`). This view is useful for member-facing communications, allowing the system to notify members about the status of their transfer requests.

**View `vw_benefit_program_membership_transfer_request_detail`**

```sql
CREATE VIEW vw_benefit_program_membership_transfer_request_detail AS
SELECT a.benefit_program_id, a.program_code, a.program_name, b.id AS request_id, b.request_id AS request_request_id, b.submission_date AS request_submission_date
FROM benefit_programs a
  JOIN programs_requests j ON j.benefit_program_id = a.benefit_program_id
  JOIN membership_transfer_requests b ON b.id = j.membership_transfer_request_id;
```

| benefit_program_id | program_code | program_name | request_id | request_request_id | request_submission_date |
|---|---|---|---|---|---|
| 1 | 191 | Auxiliary Grant | 1 | 2087732 | 2025-04-24T03:57:00 |
| 1 | 191 | Auxiliary Grant | 2 | 575213 | 2022-09-08T10:14:00 |
| 2 | 1186082 | Energy Assistance | 2 | 575213 | 2022-09-08T10:14:00 |
| 2 | 1186082 | Energy Assistance | 3 | 103167 | 2023-02-19T17:31:00 |
| 3 | 3990187 | Foster Care & Adoption Assistance | 3 | 103167 | 2023-02-19T17:31:00 |
| 3 | 3990187 | Foster Care & Adoption Assistance | 4 | 611510 | 2024-07-03T00:48:00 |
| 4 | flexible-thinking | Fraud | 4 | 611510 | 2024-07-03T00:48:00 |
| 4 | flexible-thinking | Fraud | 1 | 2087732 | 2025-04-24T03:57:00 |

The view `vw_benefit_program_membership_transfer_request_detail` joins `benefit_programs` to `membership_transfer_requests` through the `programs_requests` junction table. It answers: *For each benefit program, which transfer requests involve it?* This view provides the program-centric perspective, complementing `vw_membership_transfer_request_benefit_program_detail` which provides the request-centric perspective. Program `1` (Auxiliary Grant, code `191`) appears in two rows: linked to request `1` (status `pending`, `transfer_to_non_member`) and request `4` (status `failed`, `retain_by_departing_employee`). Program `4` (Fraud, code `flexible-thinking`) appears for request `3` (completed, `transfer_to_non_member`) and request `4` (failed, `retain_by_departing_employee`). This view supports program administrators in understanding which transfer requests affect their program's coverage.

The schema's design reflects a careful balance between normalization and query convenience. The core fact table `membership_transfer_requests` captures the primary business event with all its attributes, while the dimension tables (`request_submitters`, `b_p_r_o_members`, `benefit_programs`) store entity-specific details in separate rows to avoid duplication. The junction tables (`submitters_requests`, `requests_programs`, `programs_requests`) resolve the many-to-many relationships that arise naturally in this domain: a submitter can file multiple requests, a request can involve multiple programs, and a member can be both a departing party and a recipient across different requests. The six materialized views then reassemble these normalized pieces into the specific join patterns that application queries require, each view answering a distinct question about the domain without requiring the application developer to manually construct the joins. This pattern—base tables for storage, junction tables for relationships, and views for query convenience—is a well-established relational design practice that keeps the schema maintainable while providing efficient access paths for the most common domain queries.