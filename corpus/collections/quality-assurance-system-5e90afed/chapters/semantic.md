## Ontology-Grounded Relational Modelling in Higher Education Quality Assurance

The domain under examination concerns the governance of academic quality across national and regional boundaries. Universities offer academic programmes that must satisfy quality benchmarks, each overseen by an expert panel and coordinated through a quality assurance system. Regional commissions exercise jurisdiction over institutions within defined territories, and the entire architecture is normalised into seven base tables linked by foreign keys, with twelve derived views that reconstruct the multidimensional relationships the ontology intends to capture. The following sections walk through the entity types, their attributes, the cardinality-bounded relationships that become columns and junction tables, and finally the views that answer concrete domain questions.

### Quality Assurance Systems as the Central Hub

The `quality_assurance_systems` table sits at the centre of the model. Each row represents a distinct quality assurance system identified by a human-readable `system_identifier` such as `SYS-2050` or `SYS-2053`, alongside an `implementation_date` (for example, `2024-11-14T10:06:00`), a `status` drawn from the set {`planned`, `in_progress`, `completed`, `deprecated`}, a `region` label like `distributed-region-12`, and a `framework_version` such as `adaptive-framewor-53`. The table also carries three foreign keys — `regional_commission_id`, `academic_program_id`, and `quality_benchmark_id` — that bind each system to exactly one regional commission, one academic programme, and one quality benchmark. This triple-pointer design encodes a many-to-one relationship from quality assurance systems to each of those three entity types, meaning that a single commission, programme, or benchmark can be referenced by multiple systems.

**Table `quality_assurance_systems`**

| quality_assurance_system_id | system_identifier | implementation_date | status | region | framework_version | regional_commission_id | academic_program_id | quality_benchmark_id |
|---|---|---|---|---|---|---|---|---|
| 1 | SYS-2050 | 2024-11-14T10:06:00 | planned | distributed-region-12 | adaptive-framewor-53 | 1 | 1 | 1 |
| 2 | SYS-2051 | 2025-04-25T17:23:00 | in_progress | baseline-region-13 | distributed-framewor-54 | 2 | 2 | 2 |
| 3 | SYS-2052 | 2022-09-09T00:40:00 | completed | pilot-region-14 | baseline-framewor-55 | 3 | 3 | 3 |
| 4 | SYS-2053 | 2023-02-20T07:57:00 | deprecated | extended-region-15 | pilot-framewor-56 | 4 | 4 | 4 |

The presence of these three foreign keys tells us that the ontology treats quality assurance systems as the primary integration point: every system is a fact that simultaneously references a commission, a programme, and a benchmark. In relational terms, the table enforces referential integrity on three separate dimensions, and any query that needs to answer "which commission is responsible for system `SYS-2051`?" simply joins on `regional_commission_id`.

### Regional Commissions and Their Jurisdictions

The `regional_commissions` table models the territorial authorities that oversee quality assurance. Each commission carries a `commission_code` (for instance, `195343` or the UUID-like `e878ea4c-8fd1-11eb-924d-9cd76263cbd0`), an `established_date`, a `jurisdiction` country such as `Kenya` or `Rwanda`, a `commission_type` of either `National` or `Regional`, and an `operational_status` of {`active`, `inactive`, `pending`}. Two foreign keys anchor the commission to the wider model: `quality_assurance_system_id` links back to the central hub, and `university_code` ties the commission to a specific institution. The `university_code` column uses heterogeneous identifiers — some rows store plain integers like `8387553`, others UUIDs like `8b4f86fa-8fcc-11eb-924d-9cd76263cbd0`, and one row stores the string `default_chart_a_tax_3` — reflecting the ontology's allowance for polymorphic entity references.

**Table `regional_commissions`**

| id | commission_code | established_date | jurisdiction | commission_type | operational_status | quality_assurance_system_id | university_code |
|---|---|---|---|---|---|---|---|
| 1 | 195343 | 2024-03-27 | Kenya | National | active | 1 | 8387553 |
| 2 | 2618575 | 2025-08-11 | Uganda | Regional | inactive | 2 | 2933457 |
| 3 | 8189504 | 2022-01-22 | Tanzania | National | pending | 3 | 8b4f86fa-8fcc-11eb-924d-9cd76263cbd0 |
| 4 | e878ea4c-8fd1-11eb-924d-9cd76263cbd0 | 2023-06-06 | Rwanda | Regional | active | 4 | default_chart_a_tax_3 |

The foreign key `quality_assurance_system_id` creates a one-to-one or one-to-many relationship from a commission to quality assurance systems, depending on whether the reverse pointer in `quality_assurance_systems` is unique. In the sample data, each commission id `1` through `4` maps to exactly one system, suggesting a one-to-one pairing in this snapshot. The `university_code` foreign key, by contrast, is a many-to-one relationship: a commission can oversee multiple universities, but each university row in the `universities` table references only one commission.

### Academic Programmes and Their Institutional Home

Academic programmes are captured in the `academic_programs` table. Each row describes a programme through a `program_code` (e.g., `191` or `flexible-thinking`), a `program_name` such as `Extended Review` or `Distributed Cluster`, a `qualification_level` (integer values `12`, `18`, `24`, `30`), `credit_hours` (floating-point values like `9.95` or `21.80`), an `accreditation_status` drawn from {`accredited`, `provisional`, `under_review`, `denied`}, a `learning_outcomes` descriptor like `extended-learning-69`, and a `university_code` foreign key that locates the programme within an institution. A `quality_assurance_system_id` foreign key links the programme to the central hub.

**Table `academic_programs`**

| academic_program_id | program_code | program_name | qualification_level | credit_hours | accreditation_status | learning_outcomes | university_code | quality_assurance_system_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 191 | Extended Review | 12 | 9.95 | accredited | extended-learning-69 | 8387553 | 1 |
| 2 | 1186082 | Pilot Initiative A | 18 | 13.90 | provisional | integrated-learning-70 | 2933457 | 2 |
| 3 | 3990187 | Baseline Model | 24 | 17.85 | under_review | seasonal-learning-71 | 8b4f86fa-8fcc-11eb-924d-9cd76263cbd0 | 3 |
| 4 | flexible-thinking | Distributed Cluster | 30 | 21.80 | denied | regional-learning-72 | default_chart_a_tax_3 | 4 |

The `university_code` column again exhibits polymorphic identifiers, mirroring the pattern seen in `regional_commissions`. The relationship from `academic_programs` to `universities` is many-to-one: multiple programmes can belong to the same university, as evidenced by the fact that the `universities_programs` junction table exists to manage this cardinality explicitly. The `quality_assurance_system_id` foreign key creates another many-to-one link back to the central hub, meaning a single quality assurance system can govern multiple programmes.

### Universities as Institutional Entities

The `universities` table stores institutional records. Each row contains a `university_code` (the polymorphic identifier discussed above), an `institution_name` such as `Extended Corridor` or `Distributed Survey`, a `country` (e.g., `Kenya`, `Uganda`), an `established_year` (integers `10` through `28`), an `institution_type` of {`public`, `private`}, a `qa_compliance_level` of {`full`, `partial`, `non_compliant`}, and two foreign keys: `quality_assurance_system_id` and `regional_commission_id`.

**Table `universities`**

| university_code | institution_name | country | established_year | institution_type | qa_compliance_level | quality_assurance_system_id | regional_commission_id |
|---|---|---|---|---|---|---|---|
| 8387553 | Extended Corridor | Kenya | 10 | public | full | 1 | 1 |
| 2933457 | Pilot Series A | Uganda | 16 | private | partial | 2 | 2 |
| 8b4f86fa-8fcc-11eb-924d-9cd76263cbd0 | Baseline Assessment | Tanzania | 22 | public | non_compliant | 3 | 3 |
| default_chart_a_tax_3 | Distributed Survey | Rwanda | 28 | private | full | 4 | 4 |

The `quality_assurance_system_id` foreign key creates a many-to-one relationship from universities to quality assurance systems — a single system can oversee multiple universities. The `regional_commission_id` foreign key creates a many-to-one relationship from universities to regional commissions, meaning a commission can oversee multiple universities. Together, these two foreign keys position universities as the second major integration point in the model, analogous to how quality assurance systems serve as the first.

### Quality Benchmarks and Expert Panels

The `quality_benchmarks` table captures evaluation standards. Each benchmark has an `id`, a `benchmark_id` (e.g., `7441141` or `gd_taxr_2`), a `metric_name` such as `Primary Programme A` or `Legacy Protocol D`, a `target_value` (floating-point numbers like `13.45` or `20.80`), a `measurement_unit` (e.g., `extended-measurem-87`), an `evaluation_frequency` of {`annual`, `biennial`, `ad_hoc`}, a `status` of {`active`, `draft`, `retired`}, and three foreign keys: `academic_program_id`, `regional_commission_id`, and `expert_panel_id`.

**Table `quality_benchmarks`**

| id | benchmark_id | metric_name | target_value | measurement_unit | evaluation_frequency | status | academic_program_id | regional_commission_id | expert_panel_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 7441141 | Primary Programme A | 13.45 | extended-measurem-87 | annual | active | 1 | 1 | 1 |
| 2 | default_chart_a_tax_code_21 | Composite Standard | 15.90 | integrated-measurem-88 | biennial | draft | 2 | 2 | 2 |
| 3 | 3717629 | Compact Framework | 18.35 | seasonal-measurem-89 | ad_hoc | retired | 3 | 3 | 3 |
| 4 | gd_taxr_2 | Legacy Protocol D | 20.80 | regional-measurem-90 | annual | active | 4 | 4 | 4 |

These three foreign keys make quality benchmarks a tertiary integration point: each benchmark is simultaneously associated with one academic programme, one regional commission, and one expert panel. The `expert_panels` table, in turn, stores panels identified by a `panel_id` (e.g., `2087758` or `9424910`), a `panel_name` such as `Integrated Programme A`, an `expertise_domain` (e.g., `seasonal-expertis-83`), a `commissioning_body` (e.g., `extended-commissi-57`), a `panel_status` of {`active`, `disbanded`}, and three foreign keys: `regional_commission_id`, `quality_benchmark_id`, and `university_code`.

**Table `expert_panels`**

| id | panel_id | panel_name | expertise_domain | commissioning_body | panel_status | regional_commission_id | quality_benchmark_id | university_code |
|---|---|---|---|---|---|---|---|---|
| 1 | 2087758 | Integrated Programme A | seasonal-expertis-83 | extended-commissi-57 | active | 1 | 1 | 8387553 |
| 2 | 4277009 | Extended Standard | regional-expertis-84 | integrated-commissi-58 | disbanded | 2 | 2 | 2933457 |
| 3 | 6926358 | Pilot Framework | legacy-expertis-85 | seasonal-commissi-59 | active | 3 | 3 | 8b4f86fa-8fcc-11eb-924d-9cd76263cbd0 |
| 4 | 9424910 | Baseline Protocol D | compact-expertis-86 | regional-commissi-60 | disbanded | 4 | 4 | default_chart_a_tax_3 |

The `regional_commission_id` foreign key in `expert_panels` creates a many-to-one relationship from panels to commissions. The `quality_benchmark_id` foreign key creates a many-to-one relationship from panels to benchmarks. The `university_code` foreign key creates a many-to-one relationship from panels to universities. This means an expert panel is always commissioned by a regional commission, evaluates one quality benchmark, and is associated with one university.

### The Universities-Programs Junction Table

The `universities_programs` table is a pure junction table that resolves the many-to-many relationship between universities and academic programmes. In the ontology, a university can offer many programmes, and a programme can be offered at many universities. The junction table materialises this by storing pairs of `university_code` and `academic_program_id`, thereby avoiding the need for polymorphic foreign keys in either the `universities` or `academic_programs` tables.

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

This design choice is significant: it separates the structural relationship (which university offers which programme) from the attribute-rich descriptions stored in the parent tables. The junction table itself carries no additional attributes beyond the two foreign key columns, making it a clean relational representation of a many-to-many cardinality.

### Views as Reconstructed Domain Facts

The twelve views in the schema each answer a specific domain question by joining two or more base tables. They do not introduce new data; they simply reconstruct the multidimensional relationships that the normalised tables encode across separate rows.

#### Views Centered on Quality Assurance Systems

The view `v_quality_assurance_system_regional_commission` joins `quality_assurance_systems` to `regional_commissions` on `regional_commission_id`, answering the question "which regional commission is responsible for each quality assurance system?" A row with `system_identifier` `SYS-2050` joined to commission `195343` in `Kenya` tells us that the commission with code `195343` oversees system `SYS-2050`.

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

The view `v_quality_assurance_system_academic_program` joins `quality_assurance_systems` to `academic_programs` on `academic_program_id`, answering "which academic programme is governed by each quality assurance system?" A row pairing `SYS-2051` with programme `Pilot Initiative A` at qualification level `18` reveals that system `SYS-2051` governs that specific programme.

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

The view `v_quality_assurance_system_quality_benchmark` joins `quality_assurance_systems` to `quality_benchmarks` on `quality_benchmark_id`, answering "which quality benchmark does each system reference?" A row linking `SYS-2052` to benchmark `Compact Framework` with target value `18.35` shows the benchmark that system `SYS-2052` is aligned with.

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

#### Views Centered on Regional Commissions

The view `v_regional_commission_quality_assurance_system` performs the reverse join of the first view, answering "which quality assurance systems are overseen by each regional commission?" A row showing commission `2618575` in `Uganda` linked to system `SYS-2051` tells us that commission `2618575` oversees system `SYS-2051`.

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

The view `v_regional_commission_university` joins `regional_commissions` to `universities` on `regional_commission_id`, answering "which universities fall under each commission's jurisdiction?" A row pairing commission `8189504` in `Tanzania` with university `Baseline Assessment` at compliance level `non_compliant` reveals the institutional oversight relationship.

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

#### Views Centered on Academic Programmes

The view `v_academic_program_university` joins `academic_programs` to `universities` on `university_code`, answering "which university offers each academic programme?" A row linking programme `Baseline Model` to university `Baseline Assessment` in `Tanzania` shows the institutional home of that programme.

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

The view `v_academic_program_quality_assurance_system` joins `academic_programs` to `quality_assurance_systems` on `quality_assurance_system_id`, answering "which quality assurance system governs each academic programme?" A row pairing programme `Distributed Cluster` with system `SYS-2053` reveals the governance relationship.

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

#### Views Centered on Universities

The view `v_university_quality_assurance_system` joins `universities` to `quality_assurance_systems` on `quality_assurance_system_id`, answering "which quality assurance system oversees each university?" A row linking university `Extended Corridor` to system `SYS-2050` shows the system responsible for that institution.

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

The view `v_university_academic_program_detail` joins `universities` to `academic_programs` on `university_code`, answering "what programmes are offered by each university?" A row pairing university `Pilot Series A` with programme `Pilot Initiative A` at credit hours `13.90` reveals the programme portfolio of that institution.

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

The view `v_university_regional_commission` joins `universities` to `regional_commissions` on `regional_commission_id`, answering "which regional commission has jurisdiction over each university?" A row linking university `Distributed Survey` to commission `e878ea4c-8fd1-11eb-924d-9cd76263cbd0` in `Rwanda` shows the territorial authority.

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

#### Views Centered on Quality Benchmarks

The view `v_quality_benchmark_academic_program` joins `quality_benchmarks` to `academic_programs` on `academic_program_id`, answering "which academic programme does each quality benchmark evaluate?" A row linking benchmark `Composite Standard` to programme `Pilot Initiative A` reveals the programme under evaluation.

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

The view `v_quality_benchmark_regional_commission` joins `quality_benchmarks` to `regional_commissions` on `regional_commission_id`, answering "which regional commission is associated with each quality benchmark?" A row pairing benchmark `Compact Framework` with commission `8189504` in `Tanzania` shows the territorial authority behind the benchmark.

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

The view `v_quality_benchmark_expert_panel` joins `quality_benchmarks` to `expert_panels` on `quality_benchmark_id`, answering "which expert panel evaluates each quality benchmark?" A row linking benchmark `Legacy Protocol D` to panel `Baseline Protocol D` reveals the evaluative relationship.

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

#### Views Centered on Expert Panels

The view `v_expert_panel_regional_commission` joins `expert_panels` to `regional_commissions` on `regional_commission_id`, answering "which regional commission commissions each expert panel?" A row linking panel `Integrated Programme A` to commission `195343` in `Kenya` shows the commissioning authority.

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

The view `v_expert_panel_quality_benchmark` joins `expert_panels` to `quality_benchmarks` on `quality_benchmark_id`, answering "which quality benchmark does each expert panel evaluate?" A row pairing panel `Extended Standard` with benchmark `Composite Standard` reveals the evaluation target.

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

The view `v_expert_panel_university` joins `expert_panels` to `universities` on `university_code`, answering "which university is associated with each expert panel?" A row linking panel `Pilot Framework` to university `Baseline Assessment` in `Tanzania` shows the institutional connection.

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

### Synthesis

The schema models a quality assurance domain where five core entity types — quality assurance systems, regional commissions, academic programmes, universities, and quality benchmarks — are interconnected through a sixth entity, expert panels, and a junction table, `universities_programs`, that resolves a many-to-many relationship. The foreign keys create a web of many-to-one relationships that, when traversed in either direction through the twelve views, reconstruct every pairwise relationship the ontology requires. Each view answers a single, well-scoped question by joining two tables on a shared key, and the collection of views together provides a complete relational projection of the domain's multidimensional structure. The use of polymorphic identifiers in columns like `university_code` and `commission_code` reflects an ontology that permits heterogeneous entity references, while the junction table `universities_programs` demonstrates a deliberate choice to separate structural relationships from attribute-rich entity descriptions.