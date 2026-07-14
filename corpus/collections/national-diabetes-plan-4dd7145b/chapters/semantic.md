National diabetes surveillance and policy management spans a complex ecosystem of jurisdictions, population segments, and health interventions. Each jurisdiction—whether national, regional, or local—administers its own diabetes plans, allocates healthcare expenditures, deploys preventive policies, and delivers health services. Surveillance frameworks collect metrics across population segments, producing a multi-dimensional picture of disease burden and service effectiveness. The relational schema captures this ecosystem through eight base tables that store atomic facts about plans, expenditures, metrics, policies, services, jurisdictions, population segments, and surveillance frameworks, and fourteen views that reassemble these facts into domain-meaningful joins. Every table is anchored by a surrogate primary key, and foreign-key columns bind related entities together so that a single query can reconstruct a complete picture of any jurisdiction's diabetes landscape.

## Jurisdictions: the administrative backbone

The `jurisdictions` table is the central hub of the schema. It stores one row per administrative unit and carries the columns `id`, `jurisdiction_id`, `jurisdiction_name`, `country_code`, `administrative_level`, `population_count`, `area_code`, `population_segment_id`, `policy_id`, and `health_service_id`. The `administrative_level` column distinguishes national, regional, and local tiers; for example, jurisdiction `8387534` named "Pilot Cluster" sits at the `national` level with a `population_count` of 15021, while jurisdiction `99654` named "Baseline Review" is `regional` with only 10 residents recorded. The `population_segment_id` column links each jurisdiction to a demographic cohort, and the `policy_id` and `health_service_id` columns point to the primary preventive policy and health service assigned to that jurisdiction.

**Table `jurisdictions`**

| id | jurisdiction_id | jurisdiction_name | country_code | administrative_level | population_count | area_code | population_segment_id | policy_id | health_service_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 8387534 | Pilot Cluster | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | national | 15021 | 1996912 | 1000 | 5844252 | 1 |
| 2 | 99654 | Baseline Review | lu_tax_code_template_m_I_2 | regional | 10 | 17788643 | 1001 | 10207142 | 2 |
| 3 | lu_tax_code_template_m_I_4 | Distributed Initiative A | default_chart_a_account_57 | local | 18 | 4793470 | 1002 | 1562847 | 3 |
| 4 | 1186090 | Adaptive Model | 727045 | national | 50 | 8843760 | 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | 4 |

Every other fact table in the schema references `jurisdictions` through a `jurisdiction_id` foreign key. This design means that plans, expenditures, policies, and services are all scoped to a specific administrative unit, and the `jurisdictions` table itself carries denormalized pointers back to the population segment, policy, and service that define each jurisdiction's operational profile.

## Diabetes plans and preventive policies

Diabetes policy is captured in two parallel tables. The `national_diabetes_plans` table records formal adoption events with columns `id`, `plan_identifier`, `jurisdiction_name`, `implementation_status`, `adoption_date`, `policy_scope`, `responsible_agency`, and `jurisdiction_id`. Each plan is identified by a code such as `PLA-2674` and is tied to a jurisdiction through `jurisdiction_id`. The `implementation_status` column takes values like `developing`, `partially_implemented`, `fully_implemented`, or `not_adopted`; the plan `PLA-2678` for "Distributed Initiative A" reached `fully_implemented` status on 2023-06-07 under the `baseline-policy-43` scope, while `PLA-2680` for "Adaptive Model" remains `not_adopted` as of 2024-11-18. The `responsible_agency` column names the organization overseeing implementation, ranging from "General Telephone & Electronics" to "National University of Singapore."

**Table `national_diabetes_plans`**

| id | plan_identifier | jurisdiction_name | implementation_status | adoption_date | policy_scope | responsible_agency | jurisdiction_id |
|---|---|---|---|---|---|---|---|
| 1 | PLA-2674 | Pilot Cluster | developing | 2025-08-12 | adaptive-policy-41 | General Telephone & Electronics | 1 |
| 2 | PLA-2676 | Baseline Review | partially_implemented | 2022-01-23 | distributed-policy-42 | New Mexico Business Roundtable for Educational Excellence | 2 |
| 3 | PLA-2678 | Distributed Initiative A | fully_implemented | 2023-06-07 | baseline-policy-43 | Senseonics Holdings Inc. | 3 |
| 4 | PLA-2680 | Adaptive Model | not_adopted | 2024-11-18 | pilot-policy-44 | National University of Singapore | 4 |

The `preventive_policies` table stores the regulatory instruments that operate within jurisdictions. Its columns are `policy_id`, `policy_name`, `policy_type`, `implementation_status`, `target_demographic`, `effective_date`, `enforcing_body`, and `jurisdiction_id`. Policy types include `voluntary_agreement`, `regulation`, `promotion`, and `ban`. The policy "Regional Series" (`policy_id` 5844252) is a `voluntary_agreement` targeting `regional-target-84` with an effective date of 2023-02-14, enforced by `seasonal-enforcin-59`. The policy "Extended Corridor" (`policy_id` ChIJkzsYUIBt5kcRM6_JHx26ONk) is a `ban` that is `not_adopted` and targets `composite-target-87`.

**Table `preventive_policies`**

| policy_id | policy_name | policy_type | implementation_status | target_demographic | effective_date | enforcing_body | jurisdiction_id |
|---|---|---|---|---|---|---|---|
| 5844252 | Regional Series | voluntary_agreement | developing | regional-target-84 | 2023-02-14 | seasonal-enforcin-59 | 1 |
| 10207142 | Seasonal Assessment D | regulation | partially_implemented | legacy-target-85 | 2024-07-25 | regional-enforcin-60 | 2 |
| 1562847 | Integrated Survey | promotion | fully_implemented | compact-target-86 | 2025-12-09 | legacy-enforcin-61 | 3 |
| ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor | ban | not_adopted | composite-target-87 | 2022-05-20 | compact-enforcin-62 | 4 |

Both tables carry a `jurisdiction_id` foreign key, so each plan and each policy is scoped to exactly one jurisdiction. The `jurisdictions` table also stores a `policy_id` column that points to the primary preventive policy for that jurisdiction, creating a bidirectional link between the administrative unit and its governing instrument.

## Healthcare expenditures

Financial allocation is recorded in `healthcare_expenditures`, which has columns `expenditure_id`, `currency_code`, `amount_per_person`, `total_amount`, `fiscal_year`, `coverage_percentage`, `allocation_region`, and `jurisdiction_id`. The `expenditure_id` is a natural identifier that can be a UUID, a numeric code, or an alphanumeric string. The `currency_code` column holds codes such as `gd_fp_eu_acc3` or `managing-resources`, while `amount_per_person` and `total_amount` quantify spending in per-capita and aggregate terms. The `fiscal_year` column stores a compact integer (17, 20, 23, 26 in the sample data), and `coverage_percentage` expresses the proportion of costs covered, ranging from 2.45% to 9.80%. The `allocation_region` column names the geographic allocation zone, such as `legacy-allocati-37` or `primary-allocati-40`.

**Table `healthcare_expenditures`**

| expenditure_id | currency_code | amount_per_person | total_amount | fiscal_year | coverage_percentage | allocation_region | jurisdiction_id |
|---|---|---|---|---|---|---|---|
| default_chart_a_tax_code_21 | gd_fp_eu_acc3 | 30.51 | 112.11 | 17 | 2.45 | legacy-allocati-37 | 1 |
| 7441141 | managing-resources | 19.95 | 1,979 | 20 | 4.90 | compact-allocati-38 | 2 |
| 46bceece-8fc2-11eb-924d-9cd76263cbd0 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 33.06 | 15,418 | 23 | 7.35 | composite-allocati-39 | 3 |
| L331 | 10445649 | 12.74 | 12,579 | 26 | 9.80 | primary-allocati-40 | 4 |

Each expenditure row is bound to a jurisdiction via `jurisdiction_id`, enabling per-jurisdiction budget analysis. The `allocation_region` column provides an additional geographic dimension that may span multiple jurisdictions or subdivide a single one.

## Surveillance metrics, frameworks, and population segments

Surveillance data is the most structurally rich part of the schema. The `surveillance_metrics` table stores individual measurements with columns `id`, `metric_id`, `metric_type`, `value`, `unit`, `measurement_date`, `population_age_range`, `data_source`, `population_segment_id`, and `surveillance_framework_id`. The `metric_type` column takes values such as `incidence`, `prevalence`, `mortality`, and `undiagnosed_cases`. The `value` column holds the numeric measurement (19.95, 21.90, 23.85, 25.80 in the sample), and `unit` names the measurement unit, e.g., `distributed-unit-18` or `baseline-unit-19`. The `population_age_range` column describes the age cohort, such as `pilot-populati-86` or `seasonal-populati-89`. The `data_source` column names the origin of the data, and the two foreign-key columns `population_segment_id` and `surveillance_framework_id` bind each metric to a specific demographic segment and a surveillance framework respectively.

**Table `surveillance_metrics`**

| id | metric_id | metric_type | value | unit | measurement_date | population_age_range | data_source | population_segment_id | surveillance_framework_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 3744010 | incidence | 19.95 | distributed-unit-18 | 2024-07-01 | pilot-populati-86 | pilot-data-38 | 1000 | 1000 |
| 2 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | prevalence | 21.90 | baseline-unit-19 | 2025-12-12 | extended-populati-87 | extended-data-39 | 1001 | 1001 |
| 3 | 2986226 | mortality | 23.85 | pilot-unit-20 | 2022-05-23 | integrated-populati-88 | integrated-data-40 | 1002 | 1002 |
| 4 | 2002007020010 | undiagnosed_cases | 25.80 | extended-unit-21 | 2023-10-07 | seasonal-populati-89 | seasonal-data-41 | 1003 | 1003 |

The `surveillance_frameworks` table defines the overarching monitoring structures. Its columns are `id`, `framework_id`, `framework_name`, `framework_type`, `description`, `start_date`, `end_date`, `status`, and `jurisdiction_id`. Each framework is scoped to a jurisdiction through `jurisdiction_id`, and frameworks collect metrics via the `surveillance_framework_id` foreign key in `surveillance_metrics`.

**Table `surveillance_frameworks`**

| id | framework_id | framework_name | adoption_status | frequency | scope | last_review_date | surveillance_metric_id | jurisdiction_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | lu_tax_code_template_m11 | Adaptive Corridor | adopted | routine | integrated-scope-52 | 2022-09-03 | 1 | 1 |
| 1001 | 228bd7e4-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Series | not_adopted | annual | seasonal-scope-53 | 2023-02-14 | 2 | 2 |
| 1002 | 8843756 | Composite Assessment D | in_development | ad_hoc | regional-scope-54 | 2024-07-25 | 3 | 3 |
| 1003 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Compact Survey | adopted | routine | legacy-scope-55 | 2025-12-09 | 4 | 4 |

The `population_segments` table describes demographic cohorts. Its columns are `id`, `segment_id`, `segment_name`, `segment_type`, `description`, `population_count`, `age_range`, `geographic_area`, and `jurisdiction_id`. Population segments are linked to jurisdictions through `jurisdiction_id`, and surveillance metrics reference them through `population_segment_id`.

**Table `population_segments`**

| id | segment_id | segment_name | age_min | age_max | total_count | diagnosed_count | undiagnosed_count | prevalence_rate | jurisdiction_id | surveillance_metric_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Series | 19 | 24 | 57 | 22 | 60 | 22.45 | 1 | 1 |
| 1001 | 32825 | Primary Assessment | 25 | 27 | 7 | 20 | 77 | 25.90 | 2 | 2 |
| 1002 | 974920 | Composite Survey D | 31 | 30 | 6 | 93 | 36 | 29.35 | 3 | 3 |
| 1003 | 2933482 | Compact Corridor | 37 | 33 | 0 | 12 | 14 | 32.80 | 4 | 4 |

## Health services

The `health_services` table records the delivery of diabetes-related care. Its columns are `health_service_id`, `service_id`, `service_name`, `service_category`, `availability_status`, `target_group`, `geographic_coverage`, `cost_coverage_percent`, `jurisdiction_id`, and `population_segment_id`. Service categories include `self_management_education`, `specialized_care`, `preventive_screening`, and `treatment`. The `availability_status` column takes values like `limited`, `available`, or `restricted`. The `cost_coverage_percent` column expresses the proportion of costs covered by the service, ranging from 9.54% to 19.97%. Each service is scoped to a jurisdiction via `jurisdiction_id` and to a population segment via `population_segment_id`.

**Table `health_services`**

| health_service_id | service_id | service_name | service_category | availability_status | target_group | geographic_coverage | cost_coverage_percent | jurisdiction_id | population_segment_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 1996925 | Distributed Initiative | self_management_education | limited | composite-target-81 | pilot-geograph-26 | 18.47 | 1 | 1000 |
| 2 | 3990164 | Adaptive Model D | specialized_care | available | primary-target-82 | extended-geograph-27 | 19.97 | 2 | 1001 |
| 3 | 5844258 | Primary Cluster | preventive_screening | restricted | adaptive-target-83 | integrated-geograph-28 | 9.54 | 3 | 1002 |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | treatment | limited | distributed-target-84 | seasonal-geograph-29 | 13.94 | 4 | 1003 |

The `jurisdictions` table also carries a `health_service_id` column that points to the primary health service for that jurisdiction, mirroring the pattern seen with `policy_id`.

## Views: reconstructing domain facts

The fourteen views each perform a join that answers a specific analytical question by combining a fact table with the `jurisdictions` table or, in the case of surveillance views, with `population_segments` or `surveillance_frameworks`.

### Plan and policy views scoped to jurisdictions

The `national_diabetes_plan_jurisdiction_view` joins `national_diabetes_plans` to `jurisdictions` on `jurisdiction_id`, producing a row that pairs each plan's identifier, status, and responsible agency with the jurisdiction's name, country code, and administrative level. Reading the row for plan `PLA-2674`, the view reveals that "Pilot Cluster" (a `national` jurisdiction) is developing a plan overseen by "General Telephone & Electronics."

**View `national_diabetes_plan_jurisdiction_view`**

```sql
CREATE VIEW national_diabetes_plan_jurisdiction_view AS
SELECT a.id, a.plan_identifier, a.jurisdiction_name, a.implementation_status, b.id AS jurisdiction_id, b.jurisdiction_id AS jurisdiction_jurisdiction_id, b.jurisdiction_name AS jurisdiction_jurisdiction_name
FROM national_diabetes_plans a JOIN jurisdictions b ON a.jurisdiction_id = b.id;
```

| id | plan_identifier | jurisdiction_name | implementation_status | jurisdiction_id | jurisdiction_jurisdiction_id | jurisdiction_jurisdiction_name |
|---|---|---|---|---|---|---|
| 1 | PLA-2674 | Pilot Cluster | developing | 1 | 8387534 | Pilot Cluster |
| 2 | PLA-2676 | Baseline Review | partially_implemented | 2 | 99654 | Baseline Review |
| 3 | PLA-2678 | Distributed Initiative A | fully_implemented | 3 | lu_tax_code_template_m_I_4 | Distributed Initiative A |
| 4 | PLA-2680 | Adaptive Model | not_adopted | 4 | 1186090 | Adaptive Model |

The `healthcare_expenditure_jurisdiction_view` joins `healthcare_expenditures` to `jurisdictions`, answering "how much is each jurisdiction spending on diabetes care?" The row for expenditure `7441141` shows that jurisdiction `99654` ("Baseline Review") allocated 1,979 total units in fiscal year 20, with 4.90% coverage and a per-person spend of 19.95.

**View `healthcare_expenditure_jurisdiction_view`**

```sql
CREATE VIEW healthcare_expenditure_jurisdiction_view AS
SELECT a.expenditure_id, a.currency_code, a.amount_per_person, a.total_amount, b.id AS jurisdiction_id, b.jurisdiction_id AS jurisdiction_jurisdiction_id, b.jurisdiction_name AS jurisdiction_jurisdiction_name
FROM healthcare_expenditures a JOIN jurisdictions b ON a.jurisdiction_id = b.id;
```

| expenditure_id | currency_code | amount_per_person | total_amount | jurisdiction_id | jurisdiction_jurisdiction_id | jurisdiction_jurisdiction_name |
|---|---|---|---|---|---|---|
| default_chart_a_tax_code_21 | gd_fp_eu_acc3 | 30.51 | 112.11 | 1 | 8387534 | Pilot Cluster |
| 7441141 | managing-resources | 19.95 | 1,979 | 2 | 99654 | Baseline Review |
| 46bceece-8fc2-11eb-924d-9cd76263cbd0 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 33.06 | 15,418 | 3 | lu_tax_code_template_m_I_4 | Distributed Initiative A |
| L331 | 10445649 | 12.74 | 12,579 | 4 | 1186090 | Adaptive Model |

The `preventive_policy_jurisdiction_view` joins `preventive_policies` to `jurisdictions`, answering "which policies operate in which jurisdictions and at what implementation stage?" The row for policy `10207142` ("Seasonal Assessment D") shows a `regulation` type that is `partially_implemented` in jurisdiction `99654`, targeting `legacy-target-85` and enforced by `regional-enforcin-60`.

**View `preventive_policy_jurisdiction_view`**

```sql
CREATE VIEW preventive_policy_jurisdiction_view AS
SELECT a.policy_id, a.policy_name, a.policy_type, a.implementation_status, b.id AS jurisdiction_id, b.jurisdiction_id AS jurisdiction_jurisdiction_id, b.jurisdiction_name AS jurisdiction_jurisdiction_name
FROM preventive_policies a JOIN jurisdictions b ON a.jurisdiction_id = b.id;
```

| policy_id | policy_name | policy_type | implementation_status | jurisdiction_id | jurisdiction_jurisdiction_id | jurisdiction_jurisdiction_name |
|---|---|---|---|---|---|---|
| 5844252 | Regional Series | voluntary_agreement | developing | 1 | 8387534 | Pilot Cluster |
| 10207142 | Seasonal Assessment D | regulation | partially_implemented | 2 | 99654 | Baseline Review |
| 1562847 | Integrated Survey | promotion | fully_implemented | 3 | lu_tax_code_template_m_I_4 | Distributed Initiative A |
| ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor | ban | not_adopted | 4 | 1186090 | Adaptive Model |

The `health_service_jurisdiction_view` joins `health_services` to `jurisdictions`, answering "what services does each jurisdiction deliver and to what cost?" The row for service `3990164` ("Adaptive Model D") reveals that jurisdiction `99654` offers `specialized_care` that is `available` with 19.97% cost coverage, targeting `primary-target-82`.

**View `health_service_jurisdiction_view`**

```sql
CREATE VIEW health_service_jurisdiction_view AS
SELECT a.health_service_id, a.service_id, a.service_name, a.service_category, b.id AS jurisdiction_id, b.jurisdiction_id AS jurisdiction_jurisdiction_id, b.jurisdiction_name AS jurisdiction_jurisdiction_name
FROM health_services a JOIN jurisdictions b ON a.jurisdiction_id = b.id;
```

| health_service_id | service_id | service_name | service_category | jurisdiction_id | jurisdiction_jurisdiction_id | jurisdiction_jurisdiction_name |
|---|---|---|---|---|---|---|
| 1 | 1996925 | Distributed Initiative | self_management_education | 1 | 8387534 | Pilot Cluster |
| 2 | 3990164 | Adaptive Model D | specialized_care | 2 | 99654 | Baseline Review |
| 3 | 5844258 | Primary Cluster | preventive_screening | 3 | lu_tax_code_template_m_I_4 | Distributed Initiative A |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | treatment | 4 | 1186090 | Adaptive Model |

### Surveillance views scoped to segments and frameworks

The `surveillance_metric_population_segment_view` joins `surveillance_metrics` to `population_segments` on `population_segment_id`, answering "what metrics have been collected for each population segment?" The row for metric `3744010` shows an `incidence` value of 19.95 measured on 2024-07-01 for the segment `pilot-populati-86`, with data sourced from `pilot-data-38`.

**View `surveillance_metric_population_segment_view`**

```sql
CREATE VIEW surveillance_metric_population_segment_view AS
SELECT a.id, a.metric_id, a.metric_type, a.value, b.id AS segment_id, b.segment_id AS segment_segment_id, b.segment_name AS segment_segment_name
FROM surveillance_metrics a JOIN population_segments b ON a.population_segment_id = b.id;
```

| id | metric_id | metric_type | value | segment_id | segment_segment_id | segment_segment_name |
|---|---|---|---|---|---|---|
| 1 | 3744010 | incidence | 19.95 | 1000 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Series |
| 2 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | prevalence | 21.90 | 1001 | 32825 | Primary Assessment |
| 3 | 2986226 | mortality | 23.85 | 1002 | 974920 | Composite Survey D |
| 4 | 2002007020010 | undiagnosed_cases | 25.80 | 1003 | 2933482 | Compact Corridor |

The `surveillance_metric_surveillance_framework_view` joins `surveillance_metrics` to `surveillance_frameworks` on `surveillance_framework_id`, answering "which framework is responsible for each metric?" The row for metric `136630a8-8fcc-11eb-924d-9cd76263cbd0` shows a `prevalence` value of 21.90 collected under framework `1001` on 2025-12-12 for the age range `extended-populati-87`.

**View `surveillance_metric_surveillance_framework_view`**

```sql
CREATE VIEW surveillance_metric_surveillance_framework_view AS
SELECT a.id, a.metric_id, a.metric_type, a.value, b.id AS framework_id, b.framework_id AS framework_framework_id, b.framework_name AS framework_framework_name
FROM surveillance_metrics a JOIN surveillance_frameworks b ON a.surveillance_framework_id = b.id;
```

| id | metric_id | metric_type | value | framework_id | framework_framework_id | framework_framework_name |
|---|---|---|---|---|---|---|
| 1 | 3744010 | incidence | 19.95 | 1000 | lu_tax_code_template_m11 | Adaptive Corridor |
| 2 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | prevalence | 21.90 | 1001 | 228bd7e4-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Series |
| 3 | 2986226 | mortality | 23.85 | 1002 | 8843756 | Composite Assessment D |
| 4 | 2002007020010 | undiagnosed_cases | 25.80 | 1003 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Compact Survey |

### Cross-entity jurisdiction views

The `jurisdiction_population_segment_view` joins `jurisdictions` to `population_segments` on `population_segment_id`, answering "which population segments are associated with each jurisdiction?" The row for jurisdiction `8387534` ("Pilot Cluster") shows it is linked to segment `1000` with a population count of 15021 at the national administrative level.

**View `jurisdiction_population_segment_view`**

```sql
CREATE VIEW jurisdiction_population_segment_view AS
SELECT a.id, a.jurisdiction_id, a.jurisdiction_name, a.country_code, b.id AS segment_id, b.segment_id AS segment_segment_id, b.segment_name AS segment_segment_name
FROM jurisdictions a JOIN population_segments b ON a.population_segment_id = b.id;
```

| id | jurisdiction_id | jurisdiction_name | country_code | segment_id | segment_segment_id | segment_segment_name |
|---|---|---|---|---|---|---|
| 1 | 8387534 | Pilot Cluster | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 1000 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Series |
| 2 | 99654 | Baseline Review | lu_tax_code_template_m_I_2 | 1001 | 32825 | Primary Assessment |
| 3 | lu_tax_code_template_m_I_4 | Distributed Initiative A | default_chart_a_account_57 | 1002 | 974920 | Composite Survey D |
| 4 | 1186090 | Adaptive Model | 727045 | 1003 | 2933482 | Compact Corridor |

The `jurisdiction_preventive_policy_view` joins `jurisdictions` to `preventive_policies` on `policy_id`, answering "which preventive policy is the primary instrument for each jurisdiction?" The row for jurisdiction `8387534` shows it is governed by policy `5844252` ("Regional Series"), a `voluntary_agreement` targeting `regional-target-84`.

**View `jurisdiction_preventive_policy_view`**

```sql
CREATE VIEW jurisdiction_preventive_policy_view AS
SELECT a.id, a.jurisdiction_id, a.jurisdiction_name, a.country_code, b.policy_id AS policy_policy_id, b.policy_name AS policy_policy_name, b.policy_type AS policy_policy_type
FROM jurisdictions a JOIN preventive_policies b ON a.policy_id = b.policy_id;
```

| id | jurisdiction_id | jurisdiction_name | country_code | policy_policy_id | policy_policy_name | policy_policy_type |
|---|---|---|---|---|---|---|
| 1 | 8387534 | Pilot Cluster | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 5844252 | Regional Series | voluntary_agreement |
| 2 | 99654 | Baseline Review | lu_tax_code_template_m_I_2 | 10207142 | Seasonal Assessment D | regulation |
| 3 | lu_tax_code_template_m_I_4 | Distributed Initiative A | default_chart_a_account_57 | 1562847 | Integrated Survey | promotion |
| 4 | 1186090 | Adaptive Model | 727045 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor | ban |

The `jurisdiction_health_service_view` joins `jurisdictions` to `health_services` on `health_service_id`, answering "which health service is the primary offering for each jurisdiction?" The row for jurisdiction `8387534` shows it is served by service `1` ("Distributed Initiative"), a `self_management_education` service with 18.47% cost coverage.

**View `jurisdiction_health_service_view`**

```sql
CREATE VIEW jurisdiction_health_service_view AS
SELECT a.id, a.jurisdiction_id, a.jurisdiction_name, a.country_code, b.health_service_id AS service_health_service_id, b.service_id AS service_service_id, b.service_name AS service_service_name
FROM jurisdictions a JOIN health_services b ON a.health_service_id = b.health_service_id;
```

| id | jurisdiction_id | jurisdiction_name | country_code | service_health_service_id | service_service_id | service_service_name |
|---|---|---|---|---|---|---|
| 1 | 8387534 | Pilot Cluster | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 1 | 1996925 | Distributed Initiative |
| 2 | 99654 | Baseline Review | lu_tax_code_template_m_I_2 | 2 | 3990164 | Adaptive Model D |
| 3 | lu_tax_code_template_m_I_4 | Distributed Initiative A | default_chart_a_account_57 | 3 | 5844258 | Primary Cluster |
| 4 | 1186090 | Adaptive Model | 727045 | 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review |

### Reverse-direction views

The `population_segment_jurisdiction_view` joins `population_segments` to `jurisdictions` on `jurisdiction_id`, answering "which jurisdiction administers each population segment?" The row for segment `1000` shows it falls under jurisdiction `8387534` ("Pilot Cluster") at the national level.

**View `population_segment_jurisdiction_view`**

```sql
CREATE VIEW population_segment_jurisdiction_view AS
SELECT a.id, a.segment_id, a.segment_name, a.age_min, b.id AS jurisdiction_id, b.jurisdiction_id AS jurisdiction_jurisdiction_id, b.jurisdiction_name AS jurisdiction_jurisdiction_name
FROM population_segments a JOIN jurisdictions b ON a.jurisdiction_id = b.id;
```

| id | segment_id | segment_name | age_min | jurisdiction_id | jurisdiction_jurisdiction_id | jurisdiction_jurisdiction_name |
|---|---|---|---|---|---|---|
| 1000 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Series | 19 | 1 | 8387534 | Pilot Cluster |
| 1001 | 32825 | Primary Assessment | 25 | 2 | 99654 | Baseline Review |
| 1002 | 974920 | Composite Survey D | 31 | 3 | lu_tax_code_template_m_I_4 | Distributed Initiative A |
| 1003 | 2933482 | Compact Corridor | 37 | 4 | 1186090 | Adaptive Model |

The `population_segment_surveillance_metric_view` joins `population_segments` to `surveillance_metrics` on `population_segment_id`, answering "what metrics have been recorded for each segment?" The row for segment `1000` shows it has an `incidence` metric with value 19.95 measured on 2024-07-01.

**View `population_segment_surveillance_metric_view`**

```sql
CREATE VIEW population_segment_surveillance_metric_view AS
SELECT a.id, a.segment_id, a.segment_name, a.age_min, b.id AS metric_id, b.metric_id AS metric_metric_id, b.metric_type AS metric_metric_type
FROM population_segments a JOIN surveillance_metrics b ON a.surveillance_metric_id = b.id;
```

| id | segment_id | segment_name | age_min | metric_id | metric_metric_id | metric_metric_type |
|---|---|---|---|---|---|---|
| 1000 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Series | 19 | 1 | 3744010 | incidence |
| 1001 | 32825 | Primary Assessment | 25 | 2 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | prevalence |
| 1002 | 974920 | Composite Survey D | 31 | 3 | 2986226 | mortality |
| 1003 | 2933482 | Compact Corridor | 37 | 4 | 2002007020010 | undiagnosed_cases |

The `surveillance_framework_surveillance_metric_view` joins `surveillance_frameworks` to `surveillance_metrics` on `surveillance_framework_id`, answering "what metrics does each framework collect?" The row for framework `1000` shows it collects an `incidence` metric with value 19.95.

**View `surveillance_framework_surveillance_metric_view`**

```sql
CREATE VIEW surveillance_framework_surveillance_metric_view AS
SELECT a.id, a.framework_id, a.framework_name, a.adoption_status, b.id AS metric_id, b.metric_id AS metric_metric_id, b.metric_type AS metric_metric_type
FROM surveillance_frameworks a JOIN surveillance_metrics b ON a.surveillance_metric_id = b.id;
```

| id | framework_id | framework_name | adoption_status | metric_id | metric_metric_id | metric_metric_type |
|---|---|---|---|---|---|---|
| 1000 | lu_tax_code_template_m11 | Adaptive Corridor | adopted | 1 | 3744010 | incidence |
| 1001 | 228bd7e4-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Series | not_adopted | 2 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | prevalence |
| 1002 | 8843756 | Composite Assessment D | in_development | 3 | 2986226 | mortality |
| 1003 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Compact Survey | adopted | 4 | 2002007020010 | undiagnosed_cases |

The `surveillance_framework_jurisdiction_view` joins `surveillance_frameworks` to `jurisdictions` on `jurisdiction_id`, answering "which jurisdiction hosts each surveillance framework?" The row for framework `1000` shows it is hosted by jurisdiction `8387534` ("Pilot Cluster").

**View `surveillance_framework_jurisdiction_view`**

```sql
CREATE VIEW surveillance_framework_jurisdiction_view AS
SELECT a.id, a.framework_id, a.framework_name, a.adoption_status, b.id AS jurisdiction_id, b.jurisdiction_id AS jurisdiction_jurisdiction_id, b.jurisdiction_name AS jurisdiction_jurisdiction_name
FROM surveillance_frameworks a JOIN jurisdictions b ON a.jurisdiction_id = b.id;
```

| id | framework_id | framework_name | adoption_status | jurisdiction_id | jurisdiction_jurisdiction_id | jurisdiction_jurisdiction_name |
|---|---|---|---|---|---|---|
| 1000 | lu_tax_code_template_m11 | Adaptive Corridor | adopted | 1 | 8387534 | Pilot Cluster |
| 1001 | 228bd7e4-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Series | not_adopted | 2 | 99654 | Baseline Review |
| 1002 | 8843756 | Composite Assessment D | in_development | 3 | lu_tax_code_template_m_I_4 | Distributed Initiative A |
| 1003 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Compact Survey | adopted | 4 | 1186090 | Adaptive Model |

## Synthesis

The schema models diabetes policy and surveillance as a set of jurisdiction-scoped fact tables linked by foreign keys to a central `jurisdictions` hub, with `population_segments` and `surveillance_frameworks` providing additional dimensions for metric collection. Plans, expenditures, policies, and services each carry a `jurisdiction_id` that anchors them to an administrative unit, while metrics carry both `population_segment_id` and `surveillance_framework_id` to capture the multi-dimensional nature of disease monitoring. The fourteen views materialize the most common analytical joins, each answering a concrete question about the relationship between a fact table and its scoping entity. Together, the base tables and views form a normalized, queryable representation of a jurisdiction's complete diabetes management profile—from policy adoption through financial allocation, service delivery, and surveillance measurement.

## Data appendix

**View `health_service_population_segment_view`**

```sql
CREATE VIEW health_service_population_segment_view AS
SELECT a.health_service_id, a.service_id, a.service_name, a.service_category, b.id AS segment_id, b.segment_id AS segment_segment_id, b.segment_name AS segment_segment_name
FROM health_services a JOIN population_segments b ON a.population_segment_id = b.id;
```

| health_service_id | service_id | service_name | service_category | segment_id | segment_segment_id | segment_segment_name |
|---|---|---|---|---|---|---|
| 1 | 1996925 | Distributed Initiative | self_management_education | 1000 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Series |
| 2 | 3990164 | Adaptive Model D | specialized_care | 1001 | 32825 | Primary Assessment |
| 3 | 5844258 | Primary Cluster | preventive_screening | 1002 | 974920 | Composite Survey D |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | treatment | 1003 | 2933482 | Compact Corridor |
