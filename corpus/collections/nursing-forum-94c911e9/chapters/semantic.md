## Modelling NHS Nursing Governance: From Ontology to Relational Schema

The domain under examination captures the organisational architecture of nursing leadership across NHS Foundation Trusts in England. At its core, the model tracks how nursing forums are established, how leaders are appointed to those forums and to broader workstreams, how workstreams are scoped within individual Foundation Trusts, and how quality reviews and patient safety metrics provide the evidentiary backbone for accountability. The schema is normalised into seven base tables and twelve materialised views, each view materialising a specific domain fact by joining the normalised tables along their foreign-key relationships. The following sections walk through the entity types, their attributes, the cardinality-bounded relationships that become columns and junction tables, and finally the views that reconstruct the domain facts a stakeholder would query.

### Base Tables: Entity Types and Their Attributes

The model begins with six entity tables and one associative (junction) table. The first entity, `nursing_forums`, captures the governance bodies themselves.

**Table `nursing_forums`**

| nursing_forum_id | forum_identifier | established_date | current_status | governing_body | scope_of_influence | nursing_leader_id |
|---|---|---|---|---|---|---|
| 1 | FOR-2131 | 2024-03-27 | active | NHS | local | 1 |
| 2 | FOR-2132 | 2025-08-11 | inactive | Department of Health | regional | 2 |
| 3 | FOR-2133 | 2022-01-22 | dissolved | NHS | national | 3 |
| 4 | FOR-2134 | 2023-06-06 | active | Department of Health | local | 4 |

Each forum is identified by a surrogate key `nursing_forum_id` and a business key `forum_identifier` (e.g. `FOR-2131`). The column `established_date` records when the forum was constituted, `current_status` constrains the forum to one of `active`, `inactive`, or `dissolved`, and `governing_body` distinguishes between `NHS` and `Department of Health` oversight. The column `scope_of_influence` limits the forum's reach to `local`, `regional`, or `national`. The column `nursing_leader_id` is a foreign key referencing `nursing_leaders`, encoding the one-to-one assignment of a lead nurse to each forum — row 1 assigns leader `LEA-2677` (Integrated Framework A, RGN, Chair) to forum `FOR-2131`, while row 3 assigns leader `LEA-2691` (Pilot Programme, RHV, Forum Member) to forum `FOR-2133`, which is now `dissolved`.

The second entity, `nursing_leaders`, stores the individuals who hold nursing leadership positions.

**Table `nursing_leaders`**

| nursing_leader_id | leader_identifier | full_legal_name | professional_qualifications | current_title | appointment_date | years_of_experience | nursing_workstream_id | n_h_s_foundation_trust_id | previously_held_role_at_n_h_s_foundation_trust_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | LEA-2677 | Integrated Framework A | RGN | Chair | 2022-05-03T16:12:00 | 7 | 100 | 1 | 1 |
| 2 | LEA-2684 | Extended Protocol | RM | Workstream Lead | 2023-10-14T23:29:00 | 10 | 101 | 2 | 2 |
| 3 | LEA-2691 | Pilot Programme | RHV | Forum Member | 2024-03-25T06:46:00 | 13 | 102 | 3 | 3 |
| 4 | LEA-2698 | Baseline Standard D | CPT | Director of Nursing | 2025-08-09T13:03:00 | 16 | 103 | 4 | 4 |

The surrogate key `nursing_leader_id` pairs with the business key `leader_identifier` (e.g. `LEA-2677`). The column `full_legal_name` holds the person's name (e.g. "Integrated Framework A"), `professional_qualifications` stores the nursing registration type such as `RGN`, `RM`, `RHV`, or `CPT`, and `current_title` captures the role (e.g. "Chair", "Workstream Lead", "Director of Nursing"). The `appointment_date` is a timestamp (e.g. `2022-05-03T16:12:00`), and `years_of_experience` is an integer ranging from 7 to 16 in the sample data. The columns `nursing_workstream_id`, `n_h_s_foundation_trust_id`, and `previously_held_role_at_n_h_s_foundation_trust_id` are foreign keys linking the leader to their current workstream, their current trust, and a previous trust role respectively.

The third entity, `nursing_workstreams`, represents the strategic initiatives led by nursing leaders.

**Table `nursing_workstreams`**

| id | workstream_identifier | workstream_title | start_date | target_outcome | success_metric | nursing_leader_id | nursing_forum_id | n_h_s_foundation_trust_id |
|---|---|---|---|---|---|---|---|---|
| 100 | WOR-2412 | Empowered and accountable nurse leadership | 2022-09-05 | improved patient experience | MRSA reduction % | 1 | 1 | 1 |
| 101 | WOR-2418 | Right culture and right values | 2023-02-16 | reduced infection rates | C.diff reduction % | 2 | 2 | 2 |
| 102 | WOR-2424 | Involve, listen to, hear | 2024-07-27 | enhanced staff autonomy | quality rating | 3 | 3 | 3 |
| 103 | WOR-2430 | Time to care | 2025-12-11 | zero tolerance for infections | MRSA reduction % | 4 | 4 | 4 |

Each workstream has a surrogate `id` and a business key `workstream_identifier` (e.g. `WOR-2412`). The `workstream_title` is a descriptive phrase such as "Empowered and accountable nurse leadership" or "Time to care". The `start_date` marks the initiative's launch, `target_outcome` states the desired result (e.g. "improved patient experience", "zero tolerance for infections"), and `success_metric` defines the KPI (e.g. "MRSA reduction %", "quality rating"). The columns `nursing_leader_id`, `nursing_forum_id`, and `n_h_s_foundation_trust_id` are foreign keys anchoring the workstream to its leader, its forum, and its host trust.

The fourth entity, `n_h_s_foundation_trusts`, stores the healthcare organisations.

**Table `n_h_s_foundation_trusts`**

| id | trust_identifier | trust_name | trust_type | founding_year | current_quality_rating | nursing_leader_id | quality_review_id | nursing_workstream_id |
|---|---|---|---|---|---|---|---|---|
| 1 | TRU-2467 | South Tees Hospitals NHS Foundation Trust | acute | 43 | excellent | 1 | 1 | 100 |
| 2 | TRU-2469 | Salford Royal Foundation Trust | specialist | 48 | good | 2 | 2 | 101 |
| 3 | TRU-2471 | Mid Essex Hospital Services NHS Trust | community | 53 | requires improvement | 3 | 3 | 102 |
| 4 | TRU-2473 | The Queen Elizabeth Hospital King's Lynn NHS Trust | acute | 58 | inadequate | 4 | 4 | 103 |

The surrogate `id` pairs with `trust_identifier` (e.g. `TRU-2467`) and `trust_name` (e.g. "South Tees Hospitals NHS Foundation Trust"). The column `trust_type` constrains the organisation to `acute`, `specialist`, or `community`, while `founding_year` is an integer (43 through 58 in the sample). The `current_quality_rating` column holds the CQC-style rating (`excellent`, `good`, `requires improvement`, `inadequate`). Foreign keys `nursing_leader_id`, `quality_review_id`, and `nursing_workstream_id` link the trust to its lead nurse, its most recent quality review, and its active workstream.

The fifth entity, `quality_reviews`, records the formal assessments.

**Table `quality_reviews`**

| id | review_identifier | review_type | review_date | review_outcome | key_findings | n_h_s_foundation_trust_id | nursing_leader_id | nursing_workstream_id |
|---|---|---|---|---|---|---|---|---|
| 1 | REV-2386 | CQC inspection | 2024-11-03 | positive | infection control | 1 | 1 | 100 |
| 2 | REV-2389 | Independent Inquiry | 2025-04-14 | negative | patient dignity | 2 | 2 | 101 |
| 3 | REV-2392 | Adverse Event Review | 2022-09-25 | mixed | financial performance | 3 | 3 | 102 |
| 4 | REV-2395 | CQC inspection | 2023-02-09 | ongoing | clinical governance | 4 | 4 | 103 |

Each review has a surrogate `id`, a business key `review_identifier` (e.g. `REV-2386`), and a `review_type` such as `CQC inspection`, `Independent Inquiry`, or `Adverse Event Review`. The `review_date` and `review_outcome` (e.g. `positive`, `negative`, `mixed`, `ongoing`) capture the timing and result, while `key_findings` summarises the main observation (e.g. "infection control", "patient dignity"). The columns `n_h_s_foundation_trust_id`, `nursing_leader_id`, and `nursing_workstream_id` are foreign keys tying the review to the assessed trust, its leader, and the relevant workstream.

The sixth entity, `patient_safety_metrics`, stores quantitative safety indicators.

**Table `patient_safety_metrics`**

| patient_safety_metric_id | metric_identifier | metric_name | baseline_value | current_value | target_value | measurement_date | n_h_s_foundation_trust_id | nursing_workstream_id | nursing_leader_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | MET-2589 | MRSA rate | 9.70 | 11.20 | 13.45 | 2024-07-01 | 1 | 100 | 1 |
| 101 | MET-2595 | C.diff rate | 12.40 | 14.40 | 15.90 | 2025-12-12 | 2 | 101 | 2 |
| 102 | MET-2601 | avoidable deaths | 15.10 | 17.60 | 18.35 | 2022-05-23 | 3 | 102 | 3 |
| 103 | MET-2607 | patient experience score | 17.80 | 20.80 | 20.80 | 2023-10-07 | 4 | 103 | 4 |

The surrogate `patient_safety_metric_id` pairs with `metric_identifier` (e.g. `MET-2589`). The `metric_name` identifies the indicator (e.g. "MRSA rate", "C.diff rate", "avoidable deaths", "patient experience score"). The columns `baseline_value`, `current_value`, and `target_value` are decimals (e.g. baseline 9.70, current 11.20, target 13.45 for MRSA rate), and `measurement_date` records when the metric was captured. Foreign keys `n_h_s_foundation_trust_id`, `nursing_workstream_id`, and `nursing_leader_id` link the metric to its trust, workstream, and leader.

The associative table, `forums_leaders`, resolves the many-to-many relationship between forums and leaders.

**Table `forums_leaders`**

| nursing_forum_id | nursing_leader_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This junction table contains two foreign keys — `forum_id` referencing `nursing_forums` and `leader_id` referencing `nursing_leaders` — enabling a single forum to be associated with multiple leaders and a single leader to serve on multiple forums. In the sample data, row 1 links forum 1 (`FOR-2131`) with leader 1 (`LEA-2677`), row 2 links forum 2 (`FOR-2132`) with leader 2 (`LEA-2684`), and so on through row 4.

### Views: Reconstructing Domain Facts

Each view is a named join that materialises a specific domain question by pulling columns from two or more base tables. The following sections interpret what each view answers, using concrete rows as evidence.

#### `v_nursing_forum_nursing_leader`

This view joins `nursing_forums` to `nursing_leaders` on `nursing_forum_id = nursing_leader_id`, answering the question: *Which nursing leader is assigned to which forum, and what are their qualifications?* Row 1 returns forum `FOR-2131` (active, local scope, NHS-governed) paired with leader `LEA-2677` (Integrated Framework A, RGN, Chair, 7 years of experience). Row 3 returns forum `FOR-2133` (dissolved, national scope) paired with leader `LEA-2691` (Pilot Programme, RHV, Forum Member, 13 years of experience).

#### `v_nursing_forum_nursing_leader_detail`

This view extends the previous join by adding the workstream and trust context for each forum-leader pair, answering: *What workstream and trust is the assigned leader currently associated with?* Row 1 shows forum `FOR-2131` with leader `LEA-2677` who leads workstream `WOR-2412` ("Empowered and accountable nurse leadership") at trust `TRU-2467` (South Tees Hospitals NHS Foundation Trust, acute, excellent rating).

#### `v_nursing_leader_nursing_workstream`

This view joins `nursing_leaders` to `nursing_workstreams`, answering: *Which workstream does each nursing leader lead, and what is its target outcome?* Row 1 returns leader `LEA-2677` (Chair, RGN) leading workstream `WOR-2412` ("Empowered and accountable nurse leadership", target: "improved patient experience", success metric: "MRSA reduction %"). Row 4 returns leader `LEA-2698` (Director of Nursing, CPT, 16 years) leading workstream `WOR-2430` ("Time to care", target: "zero tolerance for infections").

#### `v_nursing_leader_n_h_s_foundation_trust`

This view joins `nursing_leaders` to `n_h_s_foundation_trusts`, answering: *Which Foundation Trust is each nursing leader associated with, and what is the trust's quality rating?* Row 1 returns leader `LEA-2677` at trust `TRU-2467` (South Tees Hospitals NHS Foundation Trust, acute, excellent). Row 4 returns leader `LEA-2698` at trust `TRU-2473` (The Queen Elizabeth Hospital King's Lynn NHS Trust, acute, inadequate).

#### `v_nursing_workstream_nursing_leader`

This view joins `nursing_workstreams` to `nursing_leaders`, answering: *Which nursing leader is responsible for each workstream, and what are their professional qualifications?* Row 1 returns workstream `WOR-2412` ("Empowered and accountable nurse leadership") led by leader `LEA-2677` (RGN, Chair, 7 years). Row 3 returns workstream `WOR-2424` ("Involve, listen to, hear") led by leader `LEA-2691` (RHV, Forum Member, 13 years).

#### `v_nursing_workstream_nursing_forum`

This view joins `nursing_workstreams` to `nursing_forums`, answering: *Which nursing forum is each workstream associated with, and what is the forum's status?* Row 1 returns workstream `WOR-2412` associated with forum `FOR-2131` (active, local scope). Row 3 returns workstream `WOR-2424` associated with forum `FOR-2133` (dissolved, national scope).

#### `v_nursing_workstream_n_h_s_foundation_trust`

This view joins `nursing_workstreams` to `n_h_s_foundation_trusts`, answering: *Which Foundation Trust hosts each workstream, and what is the trust's type and rating?* Row 1 returns workstream `WOR-2412` hosted at trust `TRU-2467` (South Tees Hospitals NHS Foundation Trust, acute, excellent). Row 4 returns workstream `WOR-2430` hosted at trust `TRU-2473` (The Queen Elizabeth Hospital King's Lynn NHS Trust, acute, inadequate).

#### `v_n_h_s_foundation_trust_nursing_leader`

This view joins `n_h_s_foundation_trusts` to `nursing_leaders`, answering: *Which nursing leader is associated with each Foundation Trust, and what is their current title?* Row 1 returns trust `TRU-2467` (South Tees Hospitals NHS Foundation Trust, excellent) with leader `LEA-2677` (Chair, RGN). Row 3 returns trust `TRU-2471` (Mid Essex Hospital Services NHS Trust, requires improvement) with leader `LEA-2691` (Forum Member, RHV).

#### `v_n_h_s_foundation_trust_quality_review`

This view joins `n_h_s_foundation_trusts` to `quality_reviews`, answering: *What quality review has been conducted for each Foundation Trust, and what was the outcome?* Row 1 returns trust `TRU-2467` with review `REV-2386` (CQC inspection, positive outcome, key finding: "infection control"). Row 2 returns trust `TRU-2469` (Salford Royal Foundation Trust, good) with review `REV-2389` (Independent Inquiry, negative outcome, key finding: "patient dignity").

#### `v_n_h_s_foundation_trust_nursing_workstream`

This view joins `n_h_s_foundation_trusts` to `nursing_workstreams`, answering: *Which workstream is active within each Foundation Trust, and what is its target outcome?* Row 1 returns trust `TRU-2467` with workstream `WOR-2412` ("Empowered and accountable nurse leadership", target: "improved patient experience"). Row 4 returns trust `TRU-2473` with workstream `WOR-2430` ("Time to care", target: "zero tolerance for infections").

#### `v_quality_review_n_h_s_foundation_trust`

This view joins `quality_reviews` to `n_h_s_foundation_trusts`, answering: *Which Foundation Trust was assessed in each quality review, and what is the trust's current rating?* Row 1 returns review `REV-2386` (CQC inspection, positive) for trust `TRU-2467` (South Tees Hospitals NHS Foundation Trust, excellent). Row 4 returns review `REV-2395` (CQC inspection, ongoing) for trust `TRU-2473` (The Queen Elizabeth Hospital King's Lynn NHS Trust, inadequate).

#### `v_quality_review_nursing_leader`

This view joins `quality_reviews` to `nursing_leaders`, answering: *Which nursing leader is associated with each quality review, and what is their professional background?* Row 1 returns review `REV-2386` (positive outcome) with leader `LEA-2677` (Integrated Framework A, RGN, Chair). Row 3 returns review `REV-2392` (Adverse Event Review, mixed outcome) with leader `LEA-2691` (Pilot Programme, RHV, Forum Member).

#### `v_quality_review_nursing_workstream`

This view joins `quality_reviews` to `nursing_workstreams`, answering: *Which workstream is linked to each quality review, and what is its success metric?* Row 1 returns review `REV-2386` with workstream `WOR-2412` ("Empowered and accountable nurse leadership", success metric: "MRSA reduction %"). Row 2 returns review `REV-2389` with workstream `WOR-2418` ("Right culture and right values", success metric: "C.diff reduction %").

#### `v_patient_safety_metric_n_h_s_foundation_trust`

This view joins `patient_safety_metrics` to `n_h_s_foundation_trusts`, answering: *Which Foundation Trust does each patient safety metric belong to, and what is the trust's quality rating?* Row 1 returns metric `MET-2589` (MRSA rate, baseline 9.70, current 11.20, target 13.45) for trust `TRU-2467` (South Tees Hospitals NHS Foundation Trust, excellent). Row 3 returns metric `MET-2601` (avoidable deaths, baseline 15.10, current 17.60, target 18.35) for trust `TRU-2471` (Mid Essex Hospital Services NHS Trust, requires improvement).

#### `v_patient_safety_metric_nursing_workstream`

This view joins `patient_safety_metrics` to `nursing_workstreams`, answering: *Which workstream is each patient safety metric associated with, and what is the workstream's target outcome?* Row 1 returns metric `MET-2589` (MRSA rate) associated with workstream `WOR-2412` ("Empowered and accountable nurse leadership", target: "improved patient experience"). Row 4 returns metric `MET-2607` (patient experience score, baseline 17.80, current 20.80, target 20.80) associated with workstream `WOR-2430` ("Time to care", target: "zero tolerance for infections").

#### `v_patient_safety_metric_nursing_leader`

This view joins `patient_safety_metrics` to `nursing_leaders`, answering: *Which nursing leader is associated with each patient safety metric, and what is their years of experience?* Row 1 returns metric `MET-2589` (MRSA rate) with leader `LEA-2677` (7 years of experience, RGN, Chair). Row 4 returns metric `MET-2607` (patient experience score) with leader `LEA-2698` (16 years of experience, CPT, Director of Nursing).

### Closing Synthesis

The schema models NHS nursing governance as a network of interlocking entities: forums provide the governance container, leaders occupy roles within those forums and lead workstreams, workstreams are scoped within Foundation Trusts, and quality reviews plus patient safety metrics supply the accountability data. The normalised base tables enforce referential integrity through foreign keys — `nursing_leaders.nursing_workstream_id` → `nursing_workstreams.id`, `nursing_workstreams.nursing_forum_id` → `nursing_forums.nursing_forum_id`, `n_h_s_foundation_trusts.quality_review_id` → `quality_reviews.id`, and so on — while the junction table `forums_leaders` resolves the many-to-many relationship between forums and leaders. The twelve views materialise the domain facts that stakeholders actually query: which leader leads which workstream, which trust hosts which review, which safety metric tracks which outcome. Together, the base tables and views form a complete, queryable representation of the nursing governance domain, grounded in the ontology of forums, leaders, workstreams, trusts, reviews, and metrics.

## Data appendix

**View `v_nursing_forum_nursing_leader`**

```sql
CREATE VIEW v_nursing_forum_nursing_leader AS
SELECT a.nursing_forum_id, a.forum_identifier, a.established_date, a.current_status, b.nursing_leader_id AS leader_nursing_leader_id, b.leader_identifier AS leader_leader_identifier, b.full_legal_name AS leader_full_legal_name
FROM nursing_forums a JOIN nursing_leaders b ON a.nursing_leader_id = b.nursing_leader_id;
```

| nursing_forum_id | forum_identifier | established_date | current_status | leader_nursing_leader_id | leader_leader_identifier | leader_full_legal_name |
|---|---|---|---|---|---|---|
| 1 | FOR-2131 | 2024-03-27 | active | 1 | LEA-2677 | Integrated Framework A |
| 2 | FOR-2132 | 2025-08-11 | inactive | 2 | LEA-2684 | Extended Protocol |
| 3 | FOR-2133 | 2022-01-22 | dissolved | 3 | LEA-2691 | Pilot Programme |
| 4 | FOR-2134 | 2023-06-06 | active | 4 | LEA-2698 | Baseline Standard D |

**View `v_nursing_forum_nursing_leader_detail`**

```sql
CREATE VIEW v_nursing_forum_nursing_leader_detail AS
SELECT a.nursing_forum_id, a.forum_identifier, a.established_date, b.nursing_leader_id AS leader_nursing_leader_id, b.leader_identifier AS leader_leader_identifier, b.full_legal_name AS leader_full_legal_name
FROM nursing_forums a
  JOIN forums_leaders j ON j.nursing_forum_id = a.nursing_forum_id
  JOIN nursing_leaders b ON b.nursing_leader_id = j.nursing_leader_id;
```

| nursing_forum_id | forum_identifier | established_date | leader_nursing_leader_id | leader_leader_identifier | leader_full_legal_name |
|---|---|---|---|---|---|
| 1 | FOR-2131 | 2024-03-27 | 1 | LEA-2677 | Integrated Framework A |
| 1 | FOR-2131 | 2024-03-27 | 2 | LEA-2684 | Extended Protocol |
| 2 | FOR-2132 | 2025-08-11 | 2 | LEA-2684 | Extended Protocol |
| 2 | FOR-2132 | 2025-08-11 | 3 | LEA-2691 | Pilot Programme |
| 3 | FOR-2133 | 2022-01-22 | 3 | LEA-2691 | Pilot Programme |
| 3 | FOR-2133 | 2022-01-22 | 4 | LEA-2698 | Baseline Standard D |
| 4 | FOR-2134 | 2023-06-06 | 4 | LEA-2698 | Baseline Standard D |
| 4 | FOR-2134 | 2023-06-06 | 1 | LEA-2677 | Integrated Framework A |

**View `v_nursing_leader_nursing_workstream`**

```sql
CREATE VIEW v_nursing_leader_nursing_workstream AS
SELECT a.nursing_leader_id, a.leader_identifier, a.full_legal_name, a.professional_qualifications, b.id AS workstream_id, b.workstream_identifier AS workstream_workstream_identifier, b.workstream_title AS workstream_workstream_title
FROM nursing_leaders a JOIN nursing_workstreams b ON a.nursing_workstream_id = b.id;
```

| nursing_leader_id | leader_identifier | full_legal_name | professional_qualifications | workstream_id | workstream_workstream_identifier | workstream_workstream_title |
|---|---|---|---|---|---|---|
| 1 | LEA-2677 | Integrated Framework A | RGN | 100 | WOR-2412 | Empowered and accountable nurse leadership |
| 2 | LEA-2684 | Extended Protocol | RM | 101 | WOR-2418 | Right culture and right values |
| 3 | LEA-2691 | Pilot Programme | RHV | 102 | WOR-2424 | Involve, listen to, hear |
| 4 | LEA-2698 | Baseline Standard D | CPT | 103 | WOR-2430 | Time to care |

**View `v_nursing_leader_n_h_s_foundation_trust`**

```sql
CREATE VIEW v_nursing_leader_n_h_s_foundation_trust AS
SELECT a.nursing_leader_id, a.leader_identifier, a.full_legal_name, a.professional_qualifications, b.id AS trust_id, b.trust_identifier AS trust_trust_identifier, b.trust_name AS trust_trust_name
FROM nursing_leaders a JOIN n_h_s_foundation_trusts b ON a.n_h_s_foundation_trust_id = b.id;
```

| nursing_leader_id | leader_identifier | full_legal_name | professional_qualifications | trust_id | trust_trust_identifier | trust_trust_name |
|---|---|---|---|---|---|---|
| 1 | LEA-2677 | Integrated Framework A | RGN | 1 | TRU-2467 | South Tees Hospitals NHS Foundation Trust |
| 2 | LEA-2684 | Extended Protocol | RM | 2 | TRU-2469 | Salford Royal Foundation Trust |
| 3 | LEA-2691 | Pilot Programme | RHV | 3 | TRU-2471 | Mid Essex Hospital Services NHS Trust |
| 4 | LEA-2698 | Baseline Standard D | CPT | 4 | TRU-2473 | The Queen Elizabeth Hospital King's Lynn NHS Trust |

**View `v_nursing_workstream_nursing_leader`**

```sql
CREATE VIEW v_nursing_workstream_nursing_leader AS
SELECT a.id, a.workstream_identifier, a.workstream_title, a.start_date, b.nursing_leader_id AS leader_nursing_leader_id, b.leader_identifier AS leader_leader_identifier, b.full_legal_name AS leader_full_legal_name
FROM nursing_workstreams a JOIN nursing_leaders b ON a.nursing_leader_id = b.nursing_leader_id;
```

| id | workstream_identifier | workstream_title | start_date | leader_nursing_leader_id | leader_leader_identifier | leader_full_legal_name |
|---|---|---|---|---|---|---|
| 100 | WOR-2412 | Empowered and accountable nurse leadership | 2022-09-05 | 1 | LEA-2677 | Integrated Framework A |
| 101 | WOR-2418 | Right culture and right values | 2023-02-16 | 2 | LEA-2684 | Extended Protocol |
| 102 | WOR-2424 | Involve, listen to, hear | 2024-07-27 | 3 | LEA-2691 | Pilot Programme |
| 103 | WOR-2430 | Time to care | 2025-12-11 | 4 | LEA-2698 | Baseline Standard D |

**View `v_nursing_workstream_nursing_forum`**

```sql
CREATE VIEW v_nursing_workstream_nursing_forum AS
SELECT a.id, a.workstream_identifier, a.workstream_title, a.start_date, b.nursing_forum_id AS forum_nursing_forum_id, b.forum_identifier AS forum_forum_identifier, b.established_date AS forum_established_date
FROM nursing_workstreams a JOIN nursing_forums b ON a.nursing_forum_id = b.nursing_forum_id;
```

| id | workstream_identifier | workstream_title | start_date | forum_nursing_forum_id | forum_forum_identifier | forum_established_date |
|---|---|---|---|---|---|---|
| 100 | WOR-2412 | Empowered and accountable nurse leadership | 2022-09-05 | 1 | FOR-2131 | 2024-03-27 |
| 101 | WOR-2418 | Right culture and right values | 2023-02-16 | 2 | FOR-2132 | 2025-08-11 |
| 102 | WOR-2424 | Involve, listen to, hear | 2024-07-27 | 3 | FOR-2133 | 2022-01-22 |
| 103 | WOR-2430 | Time to care | 2025-12-11 | 4 | FOR-2134 | 2023-06-06 |

**View `v_nursing_workstream_n_h_s_foundation_trust`**

```sql
CREATE VIEW v_nursing_workstream_n_h_s_foundation_trust AS
SELECT a.id, a.workstream_identifier, a.workstream_title, a.start_date, b.id AS trust_id, b.trust_identifier AS trust_trust_identifier, b.trust_name AS trust_trust_name
FROM nursing_workstreams a JOIN n_h_s_foundation_trusts b ON a.n_h_s_foundation_trust_id = b.id;
```

| id | workstream_identifier | workstream_title | start_date | trust_id | trust_trust_identifier | trust_trust_name |
|---|---|---|---|---|---|---|
| 100 | WOR-2412 | Empowered and accountable nurse leadership | 2022-09-05 | 1 | TRU-2467 | South Tees Hospitals NHS Foundation Trust |
| 101 | WOR-2418 | Right culture and right values | 2023-02-16 | 2 | TRU-2469 | Salford Royal Foundation Trust |
| 102 | WOR-2424 | Involve, listen to, hear | 2024-07-27 | 3 | TRU-2471 | Mid Essex Hospital Services NHS Trust |
| 103 | WOR-2430 | Time to care | 2025-12-11 | 4 | TRU-2473 | The Queen Elizabeth Hospital King's Lynn NHS Trust |

**View `v_n_h_s_foundation_trust_nursing_leader`**

```sql
CREATE VIEW v_n_h_s_foundation_trust_nursing_leader AS
SELECT a.id, a.trust_identifier, a.trust_name, a.trust_type, b.nursing_leader_id AS leader_nursing_leader_id, b.leader_identifier AS leader_leader_identifier, b.full_legal_name AS leader_full_legal_name
FROM n_h_s_foundation_trusts a JOIN nursing_leaders b ON a.nursing_leader_id = b.nursing_leader_id;
```

| id | trust_identifier | trust_name | trust_type | leader_nursing_leader_id | leader_leader_identifier | leader_full_legal_name |
|---|---|---|---|---|---|---|
| 1 | TRU-2467 | South Tees Hospitals NHS Foundation Trust | acute | 1 | LEA-2677 | Integrated Framework A |
| 2 | TRU-2469 | Salford Royal Foundation Trust | specialist | 2 | LEA-2684 | Extended Protocol |
| 3 | TRU-2471 | Mid Essex Hospital Services NHS Trust | community | 3 | LEA-2691 | Pilot Programme |
| 4 | TRU-2473 | The Queen Elizabeth Hospital King's Lynn NHS Trust | acute | 4 | LEA-2698 | Baseline Standard D |

**View `v_n_h_s_foundation_trust_quality_review`**

```sql
CREATE VIEW v_n_h_s_foundation_trust_quality_review AS
SELECT a.id, a.trust_identifier, a.trust_name, a.trust_type, b.id AS review_id, b.review_identifier AS review_review_identifier, b.review_type AS review_review_type
FROM n_h_s_foundation_trusts a JOIN quality_reviews b ON a.quality_review_id = b.id;
```

| id | trust_identifier | trust_name | trust_type | review_id | review_review_identifier | review_review_type |
|---|---|---|---|---|---|---|
| 1 | TRU-2467 | South Tees Hospitals NHS Foundation Trust | acute | 1 | REV-2386 | CQC inspection |
| 2 | TRU-2469 | Salford Royal Foundation Trust | specialist | 2 | REV-2389 | Independent Inquiry |
| 3 | TRU-2471 | Mid Essex Hospital Services NHS Trust | community | 3 | REV-2392 | Adverse Event Review |
| 4 | TRU-2473 | The Queen Elizabeth Hospital King's Lynn NHS Trust | acute | 4 | REV-2395 | CQC inspection |

**View `v_n_h_s_foundation_trust_nursing_workstream`**

```sql
CREATE VIEW v_n_h_s_foundation_trust_nursing_workstream AS
SELECT a.id, a.trust_identifier, a.trust_name, a.trust_type, b.id AS workstream_id, b.workstream_identifier AS workstream_workstream_identifier, b.workstream_title AS workstream_workstream_title
FROM n_h_s_foundation_trusts a JOIN nursing_workstreams b ON a.nursing_workstream_id = b.id;
```

| id | trust_identifier | trust_name | trust_type | workstream_id | workstream_workstream_identifier | workstream_workstream_title |
|---|---|---|---|---|---|---|
| 1 | TRU-2467 | South Tees Hospitals NHS Foundation Trust | acute | 100 | WOR-2412 | Empowered and accountable nurse leadership |
| 2 | TRU-2469 | Salford Royal Foundation Trust | specialist | 101 | WOR-2418 | Right culture and right values |
| 3 | TRU-2471 | Mid Essex Hospital Services NHS Trust | community | 102 | WOR-2424 | Involve, listen to, hear |
| 4 | TRU-2473 | The Queen Elizabeth Hospital King's Lynn NHS Trust | acute | 103 | WOR-2430 | Time to care |

**View `v_quality_review_n_h_s_foundation_trust`**

```sql
CREATE VIEW v_quality_review_n_h_s_foundation_trust AS
SELECT a.id, a.review_identifier, a.review_type, a.review_date, b.id AS trust_id, b.trust_identifier AS trust_trust_identifier, b.trust_name AS trust_trust_name
FROM quality_reviews a JOIN n_h_s_foundation_trusts b ON a.n_h_s_foundation_trust_id = b.id;
```

| id | review_identifier | review_type | review_date | trust_id | trust_trust_identifier | trust_trust_name |
|---|---|---|---|---|---|---|
| 1 | REV-2386 | CQC inspection | 2024-11-03 | 1 | TRU-2467 | South Tees Hospitals NHS Foundation Trust |
| 2 | REV-2389 | Independent Inquiry | 2025-04-14 | 2 | TRU-2469 | Salford Royal Foundation Trust |
| 3 | REV-2392 | Adverse Event Review | 2022-09-25 | 3 | TRU-2471 | Mid Essex Hospital Services NHS Trust |
| 4 | REV-2395 | CQC inspection | 2023-02-09 | 4 | TRU-2473 | The Queen Elizabeth Hospital King's Lynn NHS Trust |

**View `v_quality_review_nursing_leader`**

```sql
CREATE VIEW v_quality_review_nursing_leader AS
SELECT a.id, a.review_identifier, a.review_type, a.review_date, b.nursing_leader_id AS leader_nursing_leader_id, b.leader_identifier AS leader_leader_identifier, b.full_legal_name AS leader_full_legal_name
FROM quality_reviews a JOIN nursing_leaders b ON a.nursing_leader_id = b.nursing_leader_id;
```

| id | review_identifier | review_type | review_date | leader_nursing_leader_id | leader_leader_identifier | leader_full_legal_name |
|---|---|---|---|---|---|---|
| 1 | REV-2386 | CQC inspection | 2024-11-03 | 1 | LEA-2677 | Integrated Framework A |
| 2 | REV-2389 | Independent Inquiry | 2025-04-14 | 2 | LEA-2684 | Extended Protocol |
| 3 | REV-2392 | Adverse Event Review | 2022-09-25 | 3 | LEA-2691 | Pilot Programme |
| 4 | REV-2395 | CQC inspection | 2023-02-09 | 4 | LEA-2698 | Baseline Standard D |

**View `v_quality_review_nursing_workstream`**

```sql
CREATE VIEW v_quality_review_nursing_workstream AS
SELECT a.id, a.review_identifier, a.review_type, a.review_date, b.id AS workstream_id, b.workstream_identifier AS workstream_workstream_identifier, b.workstream_title AS workstream_workstream_title
FROM quality_reviews a JOIN nursing_workstreams b ON a.nursing_workstream_id = b.id;
```

| id | review_identifier | review_type | review_date | workstream_id | workstream_workstream_identifier | workstream_workstream_title |
|---|---|---|---|---|---|---|
| 1 | REV-2386 | CQC inspection | 2024-11-03 | 100 | WOR-2412 | Empowered and accountable nurse leadership |
| 2 | REV-2389 | Independent Inquiry | 2025-04-14 | 101 | WOR-2418 | Right culture and right values |
| 3 | REV-2392 | Adverse Event Review | 2022-09-25 | 102 | WOR-2424 | Involve, listen to, hear |
| 4 | REV-2395 | CQC inspection | 2023-02-09 | 103 | WOR-2430 | Time to care |

**View `v_patient_safety_metric_n_h_s_foundation_trust`**

```sql
CREATE VIEW v_patient_safety_metric_n_h_s_foundation_trust AS
SELECT a.patient_safety_metric_id, a.metric_identifier, a.metric_name, a.baseline_value, b.id AS trust_id, b.trust_identifier AS trust_trust_identifier, b.trust_name AS trust_trust_name
FROM patient_safety_metrics a JOIN n_h_s_foundation_trusts b ON a.n_h_s_foundation_trust_id = b.id;
```

| patient_safety_metric_id | metric_identifier | metric_name | baseline_value | trust_id | trust_trust_identifier | trust_trust_name |
|---|---|---|---|---|---|---|
| 100 | MET-2589 | MRSA rate | 9.70 | 1 | TRU-2467 | South Tees Hospitals NHS Foundation Trust |
| 101 | MET-2595 | C.diff rate | 12.40 | 2 | TRU-2469 | Salford Royal Foundation Trust |
| 102 | MET-2601 | avoidable deaths | 15.10 | 3 | TRU-2471 | Mid Essex Hospital Services NHS Trust |
| 103 | MET-2607 | patient experience score | 17.80 | 4 | TRU-2473 | The Queen Elizabeth Hospital King's Lynn NHS Trust |

**View `v_patient_safety_metric_nursing_workstream`**

```sql
CREATE VIEW v_patient_safety_metric_nursing_workstream AS
SELECT a.patient_safety_metric_id, a.metric_identifier, a.metric_name, a.baseline_value, b.id AS workstream_id, b.workstream_identifier AS workstream_workstream_identifier, b.workstream_title AS workstream_workstream_title
FROM patient_safety_metrics a JOIN nursing_workstreams b ON a.nursing_workstream_id = b.id;
```

| patient_safety_metric_id | metric_identifier | metric_name | baseline_value | workstream_id | workstream_workstream_identifier | workstream_workstream_title |
|---|---|---|---|---|---|---|
| 100 | MET-2589 | MRSA rate | 9.70 | 100 | WOR-2412 | Empowered and accountable nurse leadership |
| 101 | MET-2595 | C.diff rate | 12.40 | 101 | WOR-2418 | Right culture and right values |
| 102 | MET-2601 | avoidable deaths | 15.10 | 102 | WOR-2424 | Involve, listen to, hear |
| 103 | MET-2607 | patient experience score | 17.80 | 103 | WOR-2430 | Time to care |

**View `v_patient_safety_metric_nursing_leader`**

```sql
CREATE VIEW v_patient_safety_metric_nursing_leader AS
SELECT a.patient_safety_metric_id, a.metric_identifier, a.metric_name, a.baseline_value, b.nursing_leader_id AS leader_nursing_leader_id, b.leader_identifier AS leader_leader_identifier, b.full_legal_name AS leader_full_legal_name
FROM patient_safety_metrics a JOIN nursing_leaders b ON a.nursing_leader_id = b.nursing_leader_id;
```

| patient_safety_metric_id | metric_identifier | metric_name | baseline_value | leader_nursing_leader_id | leader_leader_identifier | leader_full_legal_name |
|---|---|---|---|---|---|---|
| 100 | MET-2589 | MRSA rate | 9.70 | 1 | LEA-2677 | Integrated Framework A |
| 101 | MET-2595 | C.diff rate | 12.40 | 2 | LEA-2684 | Extended Protocol |
| 102 | MET-2601 | avoidable deaths | 15.10 | 3 | LEA-2691 | Pilot Programme |
| 103 | MET-2607 | patient experience score | 17.80 | 4 | LEA-2698 | Baseline Standard D |
