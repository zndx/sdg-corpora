## Higher Education Quality Assurance: Systems, Benchmarks, and Oversight

Higher education quality assurance operates as a multi-layered governance ecosystem in which regional commissions, universities, academic programs, and expert panels converge around standardized evaluation frameworks. Each institution submits to periodic review against measurable targets, and every review is anchored to a quality assurance system that tracks implementation status, framework version, and regional jurisdiction. The records below capture the full lifecycle of these evaluations—from initial planning through completion or deprecation—alongside the benchmarks and expert panels that give each assessment its authority.

**Table `quality_assurance_systems`**

| quality_assurance_system_id | system_identifier | implementation_date | status | region | framework_version | regional_commission_id | academic_program_id | quality_benchmark_id |
|---|---|---|---|---|---|---|---|---|
| 1 | SYS-2050 | 2024-11-14T10:06:00 | planned | distributed-region-12 | adaptive-framewor-53 | 1 | 1 | 1 |
| 2 | SYS-2051 | 2025-04-25T17:23:00 | in_progress | baseline-region-13 | distributed-framewor-54 | 2 | 2 | 2 |
| 3 | SYS-2052 | 2022-09-09T00:40:00 | completed | pilot-region-14 | baseline-framewor-55 | 3 | 3 | 3 |
| 4 | SYS-2053 | 2023-02-20T07:57:00 | deprecated | extended-region-15 | pilot-framewor-56 | 4 | 4 | 4 |

The `quality_assurance_systems` table is the central ledger for every quality assurance engagement. Each row identifies a system by a human-readable `system_identifier` such as `SYS-2050` or `SYS-2053`, records the `implementation_date` when the review cycle began, and tracks the current `status` through the stages `planned`, `in_progress`, `completed`, and `deprecated`. The `region` column (for example, `distributed-region-12` or `baseline-region-13`) ties the system to a geographic or administrative zone, while `framework_version` (e.g., `adaptive-framewor-53`) indicates which evaluation methodology is in use. Foreign keys `regional_commission_id`, `academic_program_id`, and `quality_benchmark_id` link each system to the commission exercising oversight, the academic program under review, and the benchmark against which performance is measured.

**Table `regional_commissions`**

| id | commission_code | established_date | jurisdiction | commission_type | operational_status | quality_assurance_system_id | university_code |
|---|---|---|---|---|---|---|---|
| 1 | 195343 | 2024-03-27 | Kenya | National | active | 1 | 8387553 |
| 2 | 2618575 | 2025-08-11 | Uganda | Regional | inactive | 2 | 2933457 |
| 3 | 8189504 | 2022-01-22 | Tanzania | National | pending | 3 | 8b4f86fa-8fcc-11eb-924d-9cd76263cbd0 |
| 4 | e878ea4c-8fd1-11eb-924d-9cd76263cbd0 | 2023-06-06 | Rwanda | Regional | active | 4 | default_chart_a_tax_3 |

Regional commissions serve as the authoritative bodies that establish, fund, and enforce quality assurance mandates. The `regional_commissions` table records each commission's `commission_code` (such as `195343` or `e878ea4c-8fd1-11eb-924d-9cd76263cbd0`), its `established_date`, and the `jurisdiction` country it covers—Kenya, Uganda, Tanzania, and Rwanda in the current dataset. The `commission_type` distinguishes between `National` and `Regional` bodies, while `operational_status` reflects whether the commission is `active`, `inactive`, or `pending`. Each commission is associated with a `quality_assurance_system_id` and a `university_code`, anchoring its oversight responsibilities to specific institutions and review cycles.

**Table `academic_programs`**

| academic_program_id | program_code | program_name | qualification_level | credit_hours | accreditation_status | learning_outcomes | university_code | quality_assurance_system_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 191 | Extended Review | 12 | 9.95 | accredited | extended-learning-69 | 8387553 | 1 |
| 2 | 1186082 | Pilot Initiative A | 18 | 13.90 | provisional | integrated-learning-70 | 2933457 | 2 |
| 3 | 3990187 | Baseline Model | 24 | 17.85 | under_review | seasonal-learning-71 | 8b4f86fa-8fcc-11eb-924d-9cd76263cbd0 | 3 |
| 4 | flexible-thinking | Distributed Cluster | 30 | 21.80 | denied | regional-learning-72 | default_chart_a_tax_3 | 4 |

Academic programs are the units of study that undergo quality review. The `academic_programs` table captures each program's `program_code` (ranging from numeric identifiers like `191` to descriptive labels such as `flexible-thinking`), its `program_name` (for instance, `Extended Review` or `Distributed Cluster`), and the `qualification_level` it confers. The `credit_hours` column quantifies the program's workload, while `accreditation_status` tracks whether the program is `accredited`, `provisional`, `under_review`, or `denied`. The `learning_outcomes` field (e.g., `extended-learning-69`) describes the intended competencies. Each program is linked to a `university_code` and a `quality_assurance_system_id`, establishing the institutional and evaluative context.

**Table `universities`**

| university_code | institution_name | country | established_year | institution_type | qa_compliance_level | quality_assurance_system_id | regional_commission_id |
|---|---|---|---|---|---|---|---|
| 8387553 | Extended Corridor | Kenya | 10 | public | full | 1 | 1 |
| 2933457 | Pilot Series A | Uganda | 16 | private | partial | 2 | 2 |
| 8b4f86fa-8fcc-11eb-924d-9cd76263cbd0 | Baseline Assessment | Tanzania | 22 | public | non_compliant | 3 | 3 |
| default_chart_a_tax_3 | Distributed Survey | Rwanda | 28 | private | full | 4 | 4 |

Universities are the institutional entities responsible for maintaining compliance with quality assurance standards. The `universities` table records each institution's `university_code` (such as `8387553` or `default_chart_a_tax_3`), its `institution_name` (e.g., `Extended Corridor` or `Distributed Survey`), and the `country` in which it operates. The `established_year` provides historical context, while `institution_type` distinguishes `public` from `private` organizations. The `qa_compliance_level` column—taking values `full`, `partial`, or `non_compliant`—summarizes the institution's standing with respect to quality assurance requirements. Each university references a `quality_assurance_system_id` and a `regional_commission_id`, situating it within the broader oversight architecture.

**Table `quality_benchmarks`**

| id | benchmark_id | metric_name | target_value | measurement_unit | evaluation_frequency | status | academic_program_id | regional_commission_id | expert_panel_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 7441141 | Primary Programme A | 13.45 | extended-measurem-87 | annual | active | 1 | 1 | 1 |
| 2 | default_chart_a_tax_code_21 | Composite Standard | 15.90 | integrated-measurem-88 | biennial | draft | 2 | 2 | 2 |
| 3 | 3717629 | Compact Framework | 18.35 | seasonal-measurem-89 | ad_hoc | retired | 3 | 3 | 3 |
| 4 | gd_taxr_2 | Legacy Protocol D | 20.80 | regional-measurem-90 | annual | active | 4 | 4 | 4 |

Quality benchmarks define the measurable criteria against which programs and institutions are evaluated. The `quality_benchmarks` table stores each benchmark's `benchmark_id` (for example, `7441141` or `gd_taxr_2`), a descriptive `metric_name` such as `Primary Programme A` or `Legacy Protocol D`, and a `target_value` that represents the desired performance threshold. The `measurement_unit` (e.g., `extended-measurem-87`) specifies how the metric is quantified, while `evaluation_frequency` indicates whether reviews occur `annual`, `biennial`, or on an `ad_hoc` basis. The `status` column tracks whether a benchmark is `active`, in `draft`, or `retired`. Each benchmark is associated with an `academic_program_id`, a `regional_commission_id`, and an `expert_panel_id`, forming the evaluative triad.

**Table `expert_panels`**

| id | panel_id | panel_name | expertise_domain | commissioning_body | panel_status | regional_commission_id | quality_benchmark_id | university_code |
|---|---|---|---|---|---|---|---|---|
| 1 | 2087758 | Integrated Programme A | seasonal-expertis-83 | extended-commissi-57 | active | 1 | 1 | 8387553 |
| 2 | 4277009 | Extended Standard | regional-expertis-84 | integrated-commissi-58 | disbanded | 2 | 2 | 2933457 |
| 3 | 6926358 | Pilot Framework | legacy-expertis-85 | seasonal-commissi-59 | active | 3 | 3 | 8b4f86fa-8fcc-11eb-924d-9cd76263cbd0 |
| 4 | 9424910 | Baseline Protocol D | compact-expertis-86 | regional-commissi-60 | disbanded | 4 | 4 | default_chart_a_tax_3 |

Expert panels provide the human expertise that validates and interprets quality assessments. The `expert_panels` table records each panel's `panel_id` (such as `2087758` or `9424910`), its `panel_name` (e.g., `Integrated Programme A` or `Baseline Protocol D`), and the `expertise_domain` it covers (like `seasonal-expertis-83`). The `commissioning_body` identifies the organization that convened the panel, while `panel_status` reflects whether the panel is `active` or `disbanded`. Each panel is linked to a `regional_commission_id`, a `quality_benchmark_id`, and a `university_code`, ensuring that expertise is aligned with jurisdiction, evaluation criteria, and institutional context.

**Table `universities_programs`**

| university_code | academic_program_id |
|---|---|
| 8387553 | 1 |
| 8387553 | 2 |
| 2933457 | 2 |
| 2933457 | 3 |
| 8b4f86fa-8fcc-11eb-924d-9cd76263cbd0 | 3 |
| 8b4f86fa-8fcc-11eb-924d-9cd76263cbd0 | 4 |
| default_chart_a_tax_3 | 4 |
| default_chart_a_tax_3 | 1 |

The `universities_programs` table serves as the enrollment matrix connecting universities to the academic programs they offer. This junction table resolves the many-to-many relationship between institutions and programs, enabling a single university to host multiple programs and a program to be offered across multiple campuses. Each row records a `university_code` and an `academic_program_id`, forming the foundational link for institutional-program reporting.

## Cross-Referenced Views

The relational structure above gains analytical power through a set of joined views that answer specific operational questions. Each view combines records from two or more base tables to produce a unified perspective on the quality assurance ecosystem.

**View `v_quality_assurance_system_regional_commission`**

```sql
CREATE VIEW v_quality_assurance_system_regional_commission AS
SELECT a.quality_assurance_system_id, a.system_identifier, a.implementation_date, a.status, b.id AS commission_id, b.commission_code AS commission_commission_code, b.established_date AS commission_established_date
FROM quality_assurance_systems a JOIN regional_commissions b ON a.regional_commission_id = b.id;
```

| quality_assurance_system_id | system_identifier | implementation_date | status | commission_id | commission_commission_code | commission_established_date |
|---|---|---|---|---|---|---|
| 1 | SYS-2050 | 2024-11-14T10:06:00 | planned | 1 | 195343 | 2024-03-27 |
| 2 | SYS-2051 | 2025-04-25T17:23:00 | in_progress | 2 | 2618575 | 2025-08-11 |
| 3 | SYS-2052 | 2022-09-09T00:40:00 | completed | 3 | 8189504 | 2022-01-22 |
| 4 | SYS-2053 | 2023-02-20T07:57:00 | deprecated | 4 | e878ea4c-8fd1-11eb-924d-9cd76263cbd0 | 2023-06-06 |

This view pairs every quality assurance system with its overseeing regional commission, answering the question of which commission is responsible for which review cycle. A row linking `SYS-2050` to commission code `195343` in Kenya demonstrates how a planned system maps to a specific national authority.

**View `v_quality_assurance_system_academic_program`**

```sql
CREATE VIEW v_quality_assurance_system_academic_program AS
SELECT a.quality_assurance_system_id, a.system_identifier, a.implementation_date, a.status, b.academic_program_id AS program_academic_program_id, b.program_code AS program_program_code, b.program_name AS program_program_name
FROM quality_assurance_systems a JOIN academic_programs b ON a.academic_program_id = b.academic_program_id;
```

| quality_assurance_system_id | system_identifier | implementation_date | status | program_academic_program_id | program_program_code | program_program_name |
|---|---|---|---|---|---|---|
| 1 | SYS-2050 | 2024-11-14T10:06:00 | planned | 1 | 191 | Extended Review |
| 2 | SYS-2051 | 2025-04-25T17:23:00 | in_progress | 2 | 1186082 | Pilot Initiative A |
| 3 | SYS-2052 | 2022-09-09T00:40:00 | completed | 3 | 3990187 | Baseline Model |
| 4 | SYS-2053 | 2023-02-20T07:57:00 | deprecated | 4 | flexible-thinking | Distributed Cluster |

By joining quality assurance systems with academic programs, this view reveals which programs are subject to which evaluation frameworks. The pairing of `SYS-2050` with the `Extended Review` program (code `191`) shows a direct system-to-program assignment.

**View `v_quality_assurance_system_quality_benchmark`**

```sql
CREATE VIEW v_quality_assurance_system_quality_benchmark AS
SELECT a.quality_assurance_system_id, a.system_identifier, a.implementation_date, a.status, b.id AS benchmark_id, b.benchmark_id AS benchmark_benchmark_id, b.metric_name AS benchmark_metric_name
FROM quality_assurance_systems a JOIN quality_benchmarks b ON a.quality_benchmark_id = b.id;
```

| quality_assurance_system_id | system_identifier | implementation_date | status | benchmark_id | benchmark_benchmark_id | benchmark_metric_name |
|---|---|---|---|---|---|---|
| 1 | SYS-2050 | 2024-11-14T10:06:00 | planned | 1 | 7441141 | Primary Programme A |
| 2 | SYS-2051 | 2025-04-25T17:23:00 | in_progress | 2 | default_chart_a_tax_code_21 | Composite Standard |
| 3 | SYS-2052 | 2022-09-09T00:40:00 | completed | 3 | 3717629 | Compact Framework |
| 4 | SYS-2053 | 2023-02-20T07:57:00 | deprecated | 4 | gd_taxr_2 | Legacy Protocol D |

This view connects quality assurance systems to the benchmarks they employ, clarifying the evaluation criteria behind each review. The association of `SYS-2050` with benchmark `7441141` (Primary Programme A) illustrates how a system operationalizes a specific metric.

**View `v_regional_commission_quality_assurance_system`**

```sql
CREATE VIEW v_regional_commission_quality_assurance_system AS
SELECT a.id, a.commission_code, a.established_date, a.jurisdiction, b.quality_assurance_system_id AS system_quality_assurance_system_id, b.system_identifier AS system_system_identifier, b.implementation_date AS system_implementation_date
FROM regional_commissions a JOIN quality_assurance_systems b ON a.quality_assurance_system_id = b.quality_assurance_system_id;
```

| id | commission_code | established_date | jurisdiction | system_quality_assurance_system_id | system_system_identifier | system_implementation_date |
|---|---|---|---|---|---|---|
| 1 | 195343 | 2024-03-27 | Kenya | 1 | SYS-2050 | 2024-11-14T10:06:00 |
| 2 | 2618575 | 2025-08-11 | Uganda | 2 | SYS-2051 | 2025-04-25T17:23:00 |
| 3 | 8189504 | 2022-01-22 | Tanzania | 3 | SYS-2052 | 2022-09-09T00:40:00 |
| 4 | e878ea4c-8fd1-11eb-924d-9cd76263cbd0 | 2023-06-06 | Rwanda | 4 | SYS-2053 | 2023-02-20T07:57:00 |

The inverse of the first view, this perspective starts from the commission and enumerates the systems under its purview. Commission `195343` overseeing system `SYS-2050` confirms the bidirectional nature of the relationship.

**View `v_regional_commission_university`**

```sql
CREATE VIEW v_regional_commission_university AS
SELECT a.id, a.commission_code, a.established_date, a.jurisdiction, b.university_code AS university_university_code, b.institution_name AS university_institution_name, b.country AS university_country
FROM regional_commissions a JOIN universities b ON a.university_code = b.university_code;
```

| id | commission_code | established_date | jurisdiction | university_university_code | university_institution_name | university_country |
|---|---|---|---|---|---|---|
| 1 | 195343 | 2024-03-27 | Kenya | 8387553 | Extended Corridor | Kenya |
| 2 | 2618575 | 2025-08-11 | Uganda | 2933457 | Pilot Series A | Uganda |
| 3 | 8189504 | 2022-01-22 | Tanzania | 8b4f86fa-8fcc-11eb-924d-9cd76263cbd0 | Baseline Assessment | Tanzania |
| 4 | e878ea4c-8fd1-11eb-924d-9cd76263cbd0 | 2023-06-06 | Rwanda | default_chart_a_tax_3 | Distributed Survey | Rwanda |

This view maps regional commissions to the universities within their jurisdiction. Commission `195343` linked to university `8387553` (Extended Corridor) in Kenya shows the geographic and administrative alignment between oversight body and institution.

**View `v_academic_program_university`**

```sql
CREATE VIEW v_academic_program_university AS
SELECT a.academic_program_id, a.program_code, a.program_name, a.qualification_level, b.university_code AS university_university_code, b.institution_name AS university_institution_name, b.country AS university_country
FROM academic_programs a JOIN universities b ON a.university_code = b.university_code;
```

| academic_program_id | program_code | program_name | qualification_level | university_university_code | university_institution_name | university_country |
|---|---|---|---|---|---|---|
| 1 | 191 | Extended Review | 12 | 8387553 | Extended Corridor | Kenya |
| 2 | 1186082 | Pilot Initiative A | 18 | 2933457 | Pilot Series A | Uganda |
| 3 | 3990187 | Baseline Model | 24 | 8b4f86fa-8fcc-11eb-924d-9cd76263cbd0 | Baseline Assessment | Tanzania |
| 4 | flexible-thinking | Distributed Cluster | 30 | default_chart_a_tax_3 | Distributed Survey | Rwanda |

The academic program–university view identifies which institution hosts each program. Program `191` (Extended Review) at university `8387553` (Extended Corridor) demonstrates the institutional home of a given curriculum.

**View `v_academic_program_quality_assurance_system`**

```sql
CREATE VIEW v_academic_program_quality_assurance_system AS
SELECT a.academic_program_id, a.program_code, a.program_name, a.qualification_level, b.quality_assurance_system_id AS system_quality_assurance_system_id, b.system_identifier AS system_system_identifier, b.implementation_date AS system_implementation_date
FROM academic_programs a JOIN quality_assurance_systems b ON a.quality_assurance_system_id = b.quality_assurance_system_id;
```

| academic_program_id | program_code | program_name | qualification_level | system_quality_assurance_system_id | system_system_identifier | system_implementation_date |
|---|---|---|---|---|---|---|
| 1 | 191 | Extended Review | 12 | 1 | SYS-2050 | 2024-11-14T10:06:00 |
| 2 | 1186082 | Pilot Initiative A | 18 | 2 | SYS-2051 | 2025-04-25T17:23:00 |
| 3 | 3990187 | Baseline Model | 24 | 3 | SYS-2052 | 2022-09-09T00:40:00 |
| 4 | flexible-thinking | Distributed Cluster | 30 | 4 | SYS-2053 | 2023-02-20T07:57:00 |

This view pairs academic programs with the quality assurance systems that evaluate them. The `Extended Review` program (code `191`) under system `SYS-2050` confirms the evaluative relationship from the program's perspective.

**View `v_university_quality_assurance_system`**

```sql
CREATE VIEW v_university_quality_assurance_system AS
SELECT a.university_code, a.institution_name, a.country, a.established_year, b.quality_assurance_system_id AS system_quality_assurance_system_id, b.system_identifier AS system_system_identifier, b.implementation_date AS system_implementation_date
FROM universities a JOIN quality_assurance_systems b ON a.quality_assurance_system_id = b.quality_assurance_system_id;
```

| university_code | institution_name | country | established_year | system_quality_assurance_system_id | system_system_identifier | system_implementation_date |
|---|---|---|---|---|---|---|
| 8387553 | Extended Corridor | Kenya | 10 | 1 | SYS-2050 | 2024-11-14T10:06:00 |
| 2933457 | Pilot Series A | Uganda | 16 | 2 | SYS-2051 | 2025-04-25T17:23:00 |
| 8b4f86fa-8fcc-11eb-924d-9cd76263cbd0 | Baseline Assessment | Tanzania | 22 | 3 | SYS-2052 | 2022-09-09T00:40:00 |
| default_chart_a_tax_3 | Distributed Survey | Rwanda | 28 | 4 | SYS-2053 | 2023-02-20T07:57:00 |

Universities linked to their quality assurance systems reveal which institutional review cycles are active. University `8387553` (Extended Corridor) associated with system `SYS-2050` shows a public Kenyan institution under a planned review cycle.

**View `v_university_academic_program_detail`**

```sql
CREATE VIEW v_university_academic_program_detail AS
SELECT a.university_code, a.institution_name, a.country, b.academic_program_id AS program_academic_program_id, b.program_code AS program_program_code, b.program_name AS program_program_name
FROM universities a
  JOIN universities_programs j ON j.university_code = a.university_code
  JOIN academic_programs b ON b.academic_program_id = j.academic_program_id;
```

| university_code | institution_name | country | program_academic_program_id | program_program_code | program_program_name |
|---|---|---|---|---|---|
| 8387553 | Extended Corridor | Kenya | 1 | 191 | Extended Review |
| 8387553 | Extended Corridor | Kenya | 2 | 1186082 | Pilot Initiative A |
| 2933457 | Pilot Series A | Uganda | 2 | 1186082 | Pilot Initiative A |
| 2933457 | Pilot Series A | Uganda | 3 | 3990187 | Baseline Model |
| 8b4f86fa-8fcc-11eb-924d-9cd76263cbd0 | Baseline Assessment | Tanzania | 3 | 3990187 | Baseline Model |
| 8b4f86fa-8fcc-11eb-924d-9cd76263cbd0 | Baseline Assessment | Tanzania | 4 | flexible-thinking | Distributed Cluster |
| default_chart_a_tax_3 | Distributed Survey | Rwanda | 4 | flexible-thinking | Distributed Cluster |
| default_chart_a_tax_3 | Distributed Survey | Rwanda | 1 | 191 | Extended Review |

This enriched view combines university and academic program data to present a comprehensive institutional-program profile. The record for Extended Corridor hosting the Extended Review program provides a complete snapshot of institutional capacity and curriculum.

**View `v_university_regional_commission`**

```sql
CREATE VIEW v_university_regional_commission AS
SELECT a.university_code, a.institution_name, a.country, a.established_year, b.id AS commission_id, b.commission_code AS commission_commission_code, b.established_date AS commission_established_date
FROM universities a JOIN regional_commissions b ON a.regional_commission_id = b.id;
```

| university_code | institution_name | country | established_year | commission_id | commission_commission_code | commission_established_date |
|---|---|---|---|---|---|---|
| 8387553 | Extended Corridor | Kenya | 10 | 1 | 195343 | 2024-03-27 |
| 2933457 | Pilot Series A | Uganda | 16 | 2 | 2618575 | 2025-08-11 |
| 8b4f86fa-8fcc-11eb-924d-9cd76263cbd0 | Baseline Assessment | Tanzania | 22 | 3 | 8189504 | 2022-01-22 |
| default_chart_a_tax_3 | Distributed Survey | Rwanda | 28 | 4 | e878ea4c-8fd1-11eb-924d-9cd76263cbd0 | 2023-06-06 |

The university–commission view clarifies which regional body exercises oversight over each institution. University `8387553` (Extended Corridor) falls under commission `195343`, confirming the jurisdictional chain.

**View `v_quality_benchmark_academic_program`**

```sql
CREATE VIEW v_quality_benchmark_academic_program AS
SELECT a.id, a.benchmark_id, a.metric_name, a.target_value, b.academic_program_id AS program_academic_program_id, b.program_code AS program_program_code, b.program_name AS program_program_name
FROM quality_benchmarks a JOIN academic_programs b ON a.academic_program_id = b.academic_program_id;
```

| id | benchmark_id | metric_name | target_value | program_academic_program_id | program_program_code | program_program_name |
|---|---|---|---|---|---|---|
| 1 | 7441141 | Primary Programme A | 13.45 | 1 | 191 | Extended Review |
| 2 | default_chart_a_tax_code_21 | Composite Standard | 15.90 | 2 | 1186082 | Pilot Initiative A |
| 3 | 3717629 | Compact Framework | 18.35 | 3 | 3990187 | Baseline Model |
| 4 | gd_taxr_2 | Legacy Protocol D | 20.80 | 4 | flexible-thinking | Distributed Cluster |

This view connects benchmarks to the academic programs they measure. Benchmark `7441141` (Primary Programme A) applied to program `191` (Extended Review) shows the metric-to-curriculum linkage.

**View `v_quality_benchmark_regional_commission`**

```sql
CREATE VIEW v_quality_benchmark_regional_commission AS
SELECT a.id, a.benchmark_id, a.metric_name, a.target_value, b.id AS commission_id, b.commission_code AS commission_commission_code, b.established_date AS commission_established_date
FROM quality_benchmarks a JOIN regional_commissions b ON a.regional_commission_id = b.id;
```

| id | benchmark_id | metric_name | target_value | commission_id | commission_commission_code | commission_established_date |
|---|---|---|---|---|---|---|
| 1 | 7441141 | Primary Programme A | 13.45 | 1 | 195343 | 2024-03-27 |
| 2 | default_chart_a_tax_code_21 | Composite Standard | 15.90 | 2 | 2618575 | 2025-08-11 |
| 3 | 3717629 | Compact Framework | 18.35 | 3 | 8189504 | 2022-01-22 |
| 4 | gd_taxr_2 | Legacy Protocol D | 20.80 | 4 | e878ea4c-8fd1-11eb-924d-9cd76263cbd0 | 2023-06-06 |

Benchmarks mapped to regional commissions reveal which evaluation criteria each commission enforces. Commission `195343` enforcing benchmark `7441141` demonstrates the regulatory alignment.

**View `v_quality_benchmark_expert_panel`**

```sql
CREATE VIEW v_quality_benchmark_expert_panel AS
SELECT a.id, a.benchmark_id, a.metric_name, a.target_value, b.id AS panel_id, b.panel_id AS panel_panel_id, b.panel_name AS panel_panel_name
FROM quality_benchmarks a JOIN expert_panels b ON a.expert_panel_id = b.id;
```

| id | benchmark_id | metric_name | target_value | panel_id | panel_panel_id | panel_panel_name |
|---|---|---|---|---|---|---|
| 1 | 7441141 | Primary Programme A | 13.45 | 1 | 2087758 | Integrated Programme A |
| 2 | default_chart_a_tax_code_21 | Composite Standard | 15.90 | 2 | 4277009 | Extended Standard |
| 3 | 3717629 | Compact Framework | 18.35 | 3 | 6926358 | Pilot Framework |
| 4 | gd_taxr_2 | Legacy Protocol D | 20.80 | 4 | 9424910 | Baseline Protocol D |

This view pairs benchmarks with the expert panels that validate them. Benchmark `7441141` evaluated by panel `2087758` (Integrated Programme A) shows the human expertise behind each metric.

**View `v_expert_panel_regional_commission`**

```sql
CREATE VIEW v_expert_panel_regional_commission AS
SELECT a.id, a.panel_id, a.panel_name, a.expertise_domain, b.id AS commission_id, b.commission_code AS commission_commission_code, b.established_date AS commission_established_date
FROM expert_panels a JOIN regional_commissions b ON a.regional_commission_id = b.id;
```

| id | panel_id | panel_name | expertise_domain | commission_id | commission_commission_code | commission_established_date |
|---|---|---|---|---|---|---|
| 1 | 2087758 | Integrated Programme A | seasonal-expertis-83 | 1 | 195343 | 2024-03-27 |
| 2 | 4277009 | Extended Standard | regional-expertis-84 | 2 | 2618575 | 2025-08-11 |
| 3 | 6926358 | Pilot Framework | legacy-expertis-85 | 3 | 8189504 | 2022-01-22 |
| 4 | 9424910 | Baseline Protocol D | compact-expertis-86 | 4 | e878ea4c-8fd1-11eb-924d-9cd76263cbd0 | 2023-06-06 |

Expert panels linked to regional commissions clarify which bodies convene which review teams. Panel `2087758` commissioned by commission `195343` confirms the organizational chain.

**View `v_expert_panel_quality_benchmark`**

```sql
CREATE VIEW v_expert_panel_quality_benchmark AS
SELECT a.id, a.panel_id, a.panel_name, a.expertise_domain, b.id AS benchmark_id, b.benchmark_id AS benchmark_benchmark_id, b.metric_name AS benchmark_metric_name
FROM expert_panels a JOIN quality_benchmarks b ON a.quality_benchmark_id = b.id;
```

| id | panel_id | panel_name | expertise_domain | benchmark_id | benchmark_benchmark_id | benchmark_metric_name |
|---|---|---|---|---|---|---|
| 1 | 2087758 | Integrated Programme A | seasonal-expertis-83 | 1 | 7441141 | Primary Programme A |
| 2 | 4277009 | Extended Standard | regional-expertis-84 | 2 | default_chart_a_tax_code_21 | Composite Standard |
| 3 | 6926358 | Pilot Framework | legacy-expertis-85 | 3 | 3717629 | Compact Framework |
| 4 | 9424910 | Baseline Protocol D | compact-expertis-86 | 4 | gd_taxr_2 | Legacy Protocol D |

This view connects expert panels to the benchmarks they assess. Panel `2087758` (Integrated Programme A) evaluating benchmark `7441141` (Primary Programme A) illustrates the expertise-to-metric relationship.

**View `v_expert_panel_university`**

```sql
CREATE VIEW v_expert_panel_university AS
SELECT a.id, a.panel_id, a.panel_name, a.expertise_domain, b.university_code AS university_university_code, b.institution_name AS university_institution_name, b.country AS university_country
FROM expert_panels a JOIN universities b ON a.university_code = b.university_code;
```

| id | panel_id | panel_name | expertise_domain | university_university_code | university_institution_name | university_country |
|---|---|---|---|---|---|---|
| 1 | 2087758 | Integrated Programme A | seasonal-expertis-83 | 8387553 | Extended Corridor | Kenya |
| 2 | 4277009 | Extended Standard | regional-expertis-84 | 2933457 | Pilot Series A | Uganda |
| 3 | 6926358 | Pilot Framework | legacy-expertis-85 | 8b4f86fa-8fcc-11eb-924d-9cd76263cbd0 | Baseline Assessment | Tanzania |
| 4 | 9424910 | Baseline Protocol D | compact-expertis-86 | default_chart_a_tax_3 | Distributed Survey | Rwanda |

The expert panel–university view identifies which institutions are subject to which panel reviews. Panel `2087758` reviewing university `8387553` (Extended Corridor) shows the institutional scope of expert evaluation.

## Synthesis

The quality assurance ecosystem described by these tables and views operates as an interconnected network of oversight, evaluation, and compliance. Regional commissions establish jurisdiction and convene expert panels; universities maintain institutional compliance and host academic programs; programs undergo structured review against measurable benchmarks; and quality assurance systems track the lifecycle of each engagement from planning through completion. The foreign-key relationships—linking systems to commissions, programs, and benchmarks; commissions to universities and panels; benchmarks to programs, commissions, and panels; and panels to commissions, benchmarks, and universities—create a fully navigable graph of accountability. Practitioners can query any of the twenty-one views to answer specific operational questions: which commission oversees a given university, which benchmark measures a specific program, which panel validates a particular metric, or which system tracks a program's compliance status. Together, these records form the authoritative reference for higher education quality assurance in the regions of Kenya, Uganda, Tanzania, and Rwanda.