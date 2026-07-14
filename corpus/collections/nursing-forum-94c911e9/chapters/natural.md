# Nursing Governance and Quality Assurance in the NHS Foundation Trust Ecosystem

The modern National Health Service operates as a layered architecture of regional forums, professional workstreams, and foundation trusts, each accountable for distinct dimensions of patient safety and clinical quality. At the centre of this structure sit nursing leaders—registered professionals whose appointments, qualifications, and years of experience anchor the governance chain that links strategic policy to bedside delivery. This chapter documents the principal entities that compose the nursing governance data model: the forums that set local and national priorities, the leaders who execute them, the workstreams that operationalise specific outcomes, the foundation trusts that host clinical services, the quality reviews that assess performance, and the patient safety metrics that quantify progress. Together these records form a coherent picture of how nursing leadership is organised, measured, and held to account across the English health system.

## Nursing Forums and Their Governance

Nursing forums serve as the primary coordination bodies through which policy priorities are translated into regional and national action. Each forum carries a unique identifier, an established date, a current status, and a governing body that determines its scope of influence.

**Table `nursing_forums`**

| nursing_forum_id | forum_identifier | established_date | current_status | governing_body | scope_of_influence | nursing_leader_id |
|---|---|---|---|---|---|---|
| 1 | FOR-2131 | 2024-03-27 | active | NHS | local | 1 |
| 2 | FOR-2132 | 2025-08-11 | inactive | Department of Health | regional | 2 |
| 3 | FOR-2133 | 2022-01-22 | dissolved | NHS | national | 3 |
| 4 | FOR-2134 | 2023-06-06 | active | Department of Health | local | 4 |

The forum registry contains four active records, each reflecting a different governance posture. Forum FOR-2131, established on 2024-03-27 under NHS governance with local scope, remains active and is linked to nursing leader LEA-2677. Forum FOR-2132, governed by the Department of Health at the regional level and established more recently on 2025-08-11, is currently inactive and associated with leader LEA-2684. Forum FOR-2133, the earliest of the four (2022-01-22), operated under NHS governance at the national level but has since been dissolved, with its leadership assigned to LEA-2691. Forum FOR-2134, established on 2023-06-06 under Department of Health governance with local scope, is active and tied to leader LEA-2698. The governing bodies alternate between NHS and the Department of Health, while the scope of influence spans local, regional, and national tiers, reflecting the multi-level governance model that characterises the system.

## Nursing Leaders and Their Professional Profiles

Nursing leaders are the individuals who carry the operational weight of governance. Their records capture legal identity, professional qualifications, current titles, appointment dates, and years of experience, alongside their affiliations to workstreams, trusts, and previously held roles.

**Table `nursing_leaders`**

| nursing_leader_id | leader_identifier | full_legal_name | professional_qualifications | current_title | appointment_date | years_of_experience | nursing_workstream_id | n_h_s_foundation_trust_id | previously_held_role_at_n_h_s_foundation_trust_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | LEA-2677 | Integrated Framework A | RGN | Chair | 2022-05-03T16:12:00 | 7 | 100 | 1 | 1 |
| 2 | LEA-2684 | Extended Protocol | RM | Workstream Lead | 2023-10-14T23:29:00 | 10 | 101 | 2 | 2 |
| 3 | LEA-2691 | Pilot Programme | RHV | Forum Member | 2024-03-25T06:46:00 | 13 | 102 | 3 | 3 |
| 4 | LEA-2698 | Baseline Standard D | CPT | Director of Nursing | 2025-08-09T13:03:00 | 16 | 103 | 4 | 4 |

The leader registry presents four professionals, each distinguished by a unique identifier and a set of credentials. Leader LEA-2677, legally named Integrated Framework A, holds RGN qualifications and serves as Chair with seven years of experience; appointed on 2022-05-03, this leader is associated with workstream 100, trust 1, and previously held a role at trust 1. Leader LEA-2684, Extended Protocol, is an RM with ten years of experience who serves as Workstream Lead, appointed on 2023-10-14, and is linked to workstream 101, trust 2, and a prior role at trust 2. Leader LEA-2691, Pilot Programme, holds RHV qualifications and serves as Forum Member with thirteen years of experience, appointed on 2024-03-25, connected to workstream 102, trust 3, and a prior role at trust 3. Leader LEA-2698, Baseline Standard D, is a CPT with sixteen years of experience serving as Director of Nursing, appointed on 2025-08-09, and associated with workstream 103, trust 4, and a prior role at trust 4. The professional qualifications span RGN, RM, RHV, and CPT designations, while the titles range from Chair to Director of Nursing, illustrating the diversity of leadership roles within the governance framework.

## Nursing Workstreams and Their Target Outcomes

Workstreams are the operational vehicles through which nursing leaders pursue specific, measurable outcomes. Each workstream carries a title, a start date, a target outcome, a success metric, and explicit links to its sponsoring leader, forum, and foundation trust.

**Table `nursing_workstreams`**

| id | workstream_identifier | workstream_title | start_date | target_outcome | success_metric | nursing_leader_id | nursing_forum_id | n_h_s_foundation_trust_id |
|---|---|---|---|---|---|---|---|---|
| 100 | WOR-2412 | Empowered and accountable nurse leadership | 2022-09-05 | improved patient experience | MRSA reduction % | 1 | 1 | 1 |
| 101 | WOR-2418 | Right culture and right values | 2023-02-16 | reduced infection rates | C.diff reduction % | 2 | 2 | 2 |
| 102 | WOR-2424 | Involve, listen to, hear | 2024-07-27 | enhanced staff autonomy | quality rating | 3 | 3 | 3 |
| 103 | WOR-2430 | Time to care | 2025-12-11 | zero tolerance for infections | MRSA reduction % | 4 | 4 | 4 |

The workstream registry contains four entries, each anchored to a distinct strategic objective. Workstream WOR-2412, titled "Empowered and accountable nurse leadership," commenced on 2022-09-05 with the target outcome of improved patient experience, measured by MRSA reduction percentage; it is led by nursing leader 1, operates under forum 1, and is hosted by trust 1. Workstream WOR-2418, "Right culture and right values," began on 2023-02-16 aiming to reduce infection rates, with C.diff reduction percentage as its success metric, led by leader 2, forum 2, and trust 2. Workstream WOR-2424, "Involve, listen to, hear," started on 2024-07-27 with the goal of enhanced staff autonomy, measured by quality rating, led by leader 3, forum 3, and trust 3. Workstream WOR-2430, "Time to care," is the most recently scheduled at 2025-12-11, targeting zero tolerance for infections via MRSA reduction percentage, led by leader 4, forum 4, and trust 4. The success metrics alternate between MRSA reduction and C.diff reduction percentages, with quality rating serving as the sole non-infection metric, underscoring the infection-control focus of the governance agenda.

## NHS Foundation Trusts and Their Quality Posture

Foundation trusts are the organisational units that deliver clinical services and serve as the institutional home for nursing leaders, workstreams, and quality reviews. Each trust record includes its identifier, legal name, type, founding year, current quality rating, and foreign-key links to its assigned leader, quality review, and workstream.

**Table `n_h_s_foundation_trusts`**

| id | trust_identifier | trust_name | trust_type | founding_year | current_quality_rating | nursing_leader_id | quality_review_id | nursing_workstream_id |
|---|---|---|---|---|---|---|---|---|
| 1 | TRU-2467 | South Tees Hospitals NHS Foundation Trust | acute | 43 | excellent | 1 | 1 | 100 |
| 2 | TRU-2469 | Salford Royal Foundation Trust | specialist | 48 | good | 2 | 2 | 101 |
| 3 | TRU-2471 | Mid Essex Hospital Services NHS Trust | community | 53 | requires improvement | 3 | 3 | 102 |
| 4 | TRU-2473 | The Queen Elizabeth Hospital King's Lynn NHS Trust | acute | 58 | inadequate | 4 | 4 | 103 |

The trust registry lists four organisations, each with a distinct profile. Trust TRU-2467, South Tees Hospitals NHS Foundation Trust, is an acute provider founded 43 years ago, currently rated excellent, with nursing leader 1, quality review 1, and workstream 100 assigned. Trust TRU-2469, Salford Royal Foundation Trust, is a specialist provider founded 48 years ago with a good rating, linked to leader 2, review 2, and workstream 101. Trust TRU-2471, Mid Essex Hospital Services NHS Trust, is a community provider founded 53 years ago rated as requires improvement, associated with leader 3, review 3, and workstream 102. Trust TRU-2473, The Queen Elizabeth Hospital King's Lynn NHS Trust, is an acute provider founded 58 years ago rated inadequate, connected to leader 4, review 4, and workstream 103. The quality ratings range from excellent to inadequate, providing a clear performance gradient across the trust portfolio.

## Quality Reviews and Their Findings

Quality reviews are the formal assessments that evaluate trust performance and generate actionable findings. Each review records its type, date, outcome, key findings, and its association with a trust, a nursing leader, and a workstream.

**Table `quality_reviews`**

| id | review_identifier | review_type | review_date | review_outcome | key_findings | n_h_s_foundation_trust_id | nursing_leader_id | nursing_workstream_id |
|---|---|---|---|---|---|---|---|---|
| 1 | REV-2386 | CQC inspection | 2024-11-03 | positive | infection control | 1 | 1 | 100 |
| 2 | REV-2389 | Independent Inquiry | 2025-04-14 | negative | patient dignity | 2 | 2 | 101 |
| 3 | REV-2392 | Adverse Event Review | 2022-09-25 | mixed | financial performance | 3 | 3 | 102 |
| 4 | REV-2395 | CQC inspection | 2023-02-09 | ongoing | clinical governance | 4 | 4 | 103 |

The review registry contains four assessments. Review REV-2386, a CQC inspection conducted on 2024-11-03, produced a positive outcome with infection control identified as the key finding; it is associated with trust 1, leader 1, and workstream 100. Review REV-2389, an Independent Inquiry dated 2025-04-14, yielded a negative outcome centred on patient dignity, linked to trust 2, leader 2, and workstream 101. Review REV-2392, an Adverse Event Review from 2022-09-25, produced a mixed outcome with financial performance as the key finding, connected to trust 3, leader 3, and workstream 102. Review REV-2395, another CQC inspection on 2023-02-09, remains ongoing with clinical governance as its key finding, tied to trust 4, leader 4, and workstream 103. The review types include CQC inspections, Independent Inquiries, and Adverse Event Reviews, while outcomes span positive, negative, mixed, and ongoing categories.

## Patient Safety Metrics and Their Trajectories

Patient safety metrics provide the quantitative backbone of the governance system, tracking baseline values, current performance, and targets across defined measurement dates. Each metric is tied to a trust, a workstream, and a nursing leader, enabling traceability from data point to accountable individual.

**Table `patient_safety_metrics`**

| patient_safety_metric_id | metric_identifier | metric_name | baseline_value | current_value | target_value | measurement_date | n_h_s_foundation_trust_id | nursing_workstream_id | nursing_leader_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | MET-2589 | MRSA rate | 9.70 | 11.20 | 13.45 | 2024-07-01 | 1 | 100 | 1 |
| 101 | MET-2595 | C.diff rate | 12.40 | 14.40 | 15.90 | 2025-12-12 | 2 | 101 | 2 |
| 102 | MET-2601 | avoidable deaths | 15.10 | 17.60 | 18.35 | 2022-05-23 | 3 | 102 | 3 |
| 103 | MET-2607 | patient experience score | 17.80 | 20.80 | 20.80 | 2023-10-07 | 4 | 103 | 4 |

The metrics registry presents four safety indicators. Metric MET-2589, the MRSA rate, recorded a baseline of 9.70, a current value of 11.20, and a target of 13.45 as of 2024-07-01, associated with trust 1, workstream 100, and leader 1. Metric MET-2595, the C.diff rate, shows a baseline of 12.40, a current value of 14.40, and a target of 15.90 measured on 2025-12-12, linked to trust 2, workstream 101, and leader 2. Metric MET-2601, tracking avoidable deaths, has a baseline of 15.10, a current value of 17.60, and a target of 18.35 from 2022-05-23, connected to trust 3, workstream 102, and leader 3. Metric MET-2607, the patient experience score, records a baseline of 17.80, a current value of 20.80, and a target of 20.80 as of 2023-10-07, associated with trust 4, workstream 103, and leader 4. Notably, the current value for MET-2607 has already reached its target, while the other three metrics show current values below their respective targets, indicating areas where performance improvement is still required.

## The Forum–Leader Junction

The forums_leaders table captures the explicit many-to-many relationship between nursing forums and nursing leaders, allowing a single leader to participate in multiple forums and a single forum to involve multiple leaders.

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

This junction table resolves the forum-to-leader associations that the base tables reference through their foreign keys. Each row in forums_leaders establishes a direct link between a forum and a leader, enabling queries that answer questions such as which leaders are responsible for which forums and which forums a given leader participates in. The presence of this junction table indicates that the governance model supports flexible assignment of leaders to forums beyond the single-assignment pattern seen in the base tables.

## View: Nursing Forum and Nursing Leader

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

This view joins nursing forums with nursing leaders to answer the question: which nursing leader is associated with each forum, and what are their professional credentials? Reading the first row as evidence, forum FOR-2131 (active, NHS-governed, local scope) is linked to leader LEA-2677 (Integrated Framework A, RGN, Chair, 7 years of experience). The second row shows forum FOR-2132 (inactive, Department of Health, regional) paired with leader LEA-2684 (Extended Protocol, RM, Workstream Lead, 10 years of experience). This view provides a quick reference for understanding the leadership composition of each forum.

## View: Nursing Forum and Nursing Leader Detail

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

This enriched view extends the basic forum–leader join by including additional contextual columns such as workstream assignments, trust affiliations, and quality ratings. The first row reveals that forum FOR-2131, under leader LEA-2677, operates within trust TRU-2467 (South Tees Hospitals NHS Foundation Trust, excellent rating) through workstream WOR-2412 (Empowered and accountable nurse leadership). The third row shows forum FOR-2133 (dissolved, national scope) under leader LEA-2691 (Pilot Programme, Forum Member) is associated with trust TRU-2471 (Mid Essex Hospital Services NHS Trust, requires improvement) and workstream WOR-2424 (Involve, listen to, hear). This view is particularly useful for auditors and managers who need a holistic snapshot of forum leadership in context.

## View: Nursing Leader and Nursing Workstream

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

This view maps nursing leaders to the workstreams they lead, answering the question: which workstream is each nursing leader responsible for, and what is its target outcome? The first row shows leader LEA-2677 (Chair, RGN) leading workstream WOR-2412 (Empowered and accountable nurse leadership) with the target outcome of improved patient experience. The fourth row shows leader LEA-2698 (Director of Nursing, CPT) leading workstream WOR-2430 (Time to care) with the target outcome of zero tolerance for infections. This view clarifies the accountability chain from individual leader to strategic objective.

## View: Nursing Leader and NHS Foundation Trust

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

This view links nursing leaders to the foundation trusts they serve, answering: which trust is each nursing leader associated with, and what is that trust's quality posture? The first row connects leader LEA-2677 to trust TRU-2467 (South Tees Hospitals NHS Foundation Trust, acute, excellent rating). The fourth row connects leader LEA-2698 to trust TRU-2473 (The Queen Elizabeth Hospital King's Lynn NHS Trust, acute, inadequate rating). This view is essential for understanding the geographic and organisational distribution of nursing leadership across the trust portfolio.

## View: Nursing Workstream and Nursing Leader

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

This view presents the workstream-to-leader relationship from the workstream's perspective, answering: which nursing leader is assigned to each workstream, and what are their qualifications? The first row shows workstream WOR-2412 (Empowered and accountable nurse leadership) is led by LEA-2677 (Integrated Framework A, RGN, Chair). The third row shows workstream WOR-2424 (Involve, listen to, hear) is led by LEA-2691 (Pilot Programme, RHV, Forum Member). This view is useful for workstream managers who need to identify their responsible leaders and assess their professional backgrounds.

## View: Nursing Workstream and Nursing Forum

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

This view connects nursing workstreams to their sponsoring forums, answering: which forum oversees each workstream, and what is the forum's governance posture? The first row links workstream WOR-2412 to forum FOR-2131 (active, NHS, local scope). The second row links workstream WOR-2418 to forum FOR-2132 (inactive, Department of Health, regional). This view helps trace the governance lineage from forum policy to workstream execution.

## View: Nursing Workstream and NHS Foundation Trust

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

This view maps nursing workstreams to the foundation trusts that host them, answering: which trust is each workstream implemented within, and what is that trust's type and rating? The first row shows workstream WOR-2412 is hosted by trust TRU-2467 (South Tees Hospitals NHS Foundation Trust, acute, excellent). The third row shows workstream WOR-2424 is hosted by trust TRU-2471 (Mid Essex Hospital Services NHS Trust, community, requires improvement). This view is critical for understanding the operational deployment of workstreams across the trust estate.

## View: NHS Foundation Trust and Nursing Leader

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

This view presents the trust-to-leader relationship from the trust's perspective, answering: which nursing leader is assigned to each trust, and what is their title and experience level? The first row shows trust TRU-2467 (South Tees Hospitals NHS Foundation Trust) is served by leader LEA-2677 (Integrated Framework A, Chair, 7 years of experience). The fourth row shows trust TRU-2473 (The Queen Elizabeth Hospital King's Lynn NHS Trust) is served by leader LEA-2698 (Baseline Standard D, Director of Nursing, 16 years of experience). This view supports trust-level governance reviews by surfacing the leadership profile at each site.

## View: NHS Foundation Trust and Quality Review

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

This view joins foundation trusts with their quality reviews, answering: which quality review has been conducted for each trust, and what was its outcome and key finding? The first row links trust TRU-2467 to review REV-2386 (CQC inspection, positive outcome, infection control finding). The third row links trust TRU-2471 to review REV-2392 (Adverse Event Review, mixed outcome, financial performance finding). This view is essential for trust boards and regulators who need to track the status and findings of quality assessments.

## View: NHS Foundation Trust and Nursing Workstream

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

This view connects foundation trusts to their active nursing workstreams, answering: which workstream is each trust currently pursuing, and what is its target outcome and success metric? The first row shows trust TRU-2467 is pursuing workstream WOR-2412 (Empowered and accountable nurse leadership, target: improved patient experience, metric: MRSA reduction %). The second row shows trust TRU-2469 is pursuing workstream WOR-2418 (Right culture and right values, target: reduced infection rates, metric: C.diff reduction %). This view provides a trust-level summary of the nursing governance agenda.

## View: Quality Review and NHS Foundation Trust

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

This view presents the quality review-to-trust relationship from the review's perspective, answering: which trust was assessed in each quality review, and what is that trust's current quality rating? The first row shows review REV-2386 (CQC inspection, positive) assessed trust TRU-2467 (South Tees Hospitals NHS Foundation Trust, excellent rating). The fourth row shows review REV-2395 (CQC inspection, ongoing) assessed trust TRU-2473 (The Queen Elizabeth Hospital King's Lynn NHS Trust, inadequate rating). This view is useful for auditors who need to correlate review outcomes with trust ratings.

## View: Quality Review and Nursing Leader

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

This view links quality reviews to the nursing leaders associated with them, answering: which nursing leader is accountable for the trust assessed in each review, and what is their professional background? The first row connects review REV-2386 (positive outcome) to leader LEA-2677 (Integrated Framework A, RGN, Chair). The second row connects review REV-2389 (negative outcome) to leader LEA-2684 (Extended Protocol, RM, Workstream Lead). This view supports accountability analysis by identifying the leaders responsible for trusts with specific review outcomes.

## View: Quality Review and Nursing Workstream

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

This view associates quality reviews with the nursing workstreams active at the reviewed trusts, answering: which workstream is being evaluated alongside each quality review, and what is its target outcome? The first row links review REV-2386 to workstream WOR-2412 (Empowered and accountable nurse leadership, target: improved patient experience). The third row links review REV-2392 to workstream WOR-2424 (Involve, listen to, hear, target: enhanced staff autonomy). This view helps quality assurance teams understand the strategic context of each review.

## View: Patient Safety Metric and NHS Foundation Trust

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

This view connects patient safety metrics to the foundation trusts they measure, answering: which trust is each metric tracking, and what is that trust's quality rating? The first row shows metric MET-2589 (MRSA rate, current: 11.20, target: 13.45) is tracked at trust TRU-2467 (South Tees Hospitals NHS Foundation Trust, excellent). The fourth row shows metric MET-2607 (patient experience score, current: 20.80, target: 20.80) is tracked at trust TRU-2473 (The Queen Elizabeth Hospital King's Lynn NHS Trust, inadequate). This view enables trust-level safety performance dashboards.

## View: Patient Safety Metric and Nursing Workstream

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

This view links patient safety metrics to the nursing workstreams they evaluate, answering: which workstream is each metric associated with, and what is its success metric definition? The first row connects metric MET-2589 (MRSA rate) to workstream WOR-2412 (Empowered and accountable nurse leadership, success metric: MRSA reduction %). The second row connects metric MET-2595 (C.diff rate) to workstream WOR-2418 (Right culture and right values, success metric: C.diff reduction %). This view ensures that safety data is traceable to the strategic initiatives it is meant to evaluate.

## View: Patient Safety Metric and Nursing Leader

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

This view associates patient safety metrics with the nursing leaders accountable for them, answering: which leader is responsible for each safety metric, and what is their title and years of experience? The first row shows metric MET-2589 (MRSA rate) is overseen by leader LEA-2677 (Integrated Framework A, Chair, 7 years of experience). The third row shows metric MET-2601 (avoidable deaths) is overseen by leader LEA-2691 (Pilot Programme, Forum Member, 13 years of experience). This view is critical for performance management, as it directly ties quantitative safety outcomes to individual leaders.

## Closing Synthesis

The nursing governance data model presented here captures a complete chain of accountability: from national and local forums that set priorities, through nursing leaders who carry professional authority, to workstreams that define measurable outcomes, foundation trusts that host clinical delivery, quality reviews that assess performance, and patient safety metrics that quantify results. The foreign-key relationships between these entities ensure that every data point can be traced back to a responsible leader, a sponsoring forum, an active workstream, and a specific trust. The views derived from these base tables provide multiple analytical lenses—forum-centric, leader-centric, workstream-centric, trust-centric, review-centric, and metric-centric—each answering a distinct operational question. Practitioners who understand these relationships can navigate the governance landscape with precision, identifying where performance is strong, where improvement is needed, and who holds accountability at every level.