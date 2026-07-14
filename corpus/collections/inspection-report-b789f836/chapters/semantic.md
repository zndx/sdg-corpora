The domain under examination is a social services inspection and delivery ecosystem, where regulatory bodies evaluate service domains, family units undergo needs assessments, and those assessments trigger structured service deliveries. The data model captures this lifecycle through seven base tables and ten materialized views, each view reconstructing a domain fact by joining normalized tables on their foreign keys. The narrative of the model runs from inspection through assessment to delivery, with policy instruments providing the governance layer that ties service domains and needs assessments together.

## Inspection Reports and Their Organizational Context

The entry point into the model is the `inspection_reports` table, which records every formal inspection conducted within the system. Each row carries a surrogate primary key `inspection_report_id`, a human-readable `report_id` such as `1202-0008-S` or `L355`, a `publication_date` like `2025-12-01`, a `reference_code` (for example `62ae4aad5ce84e42acc1003ae3490641`), a `publisher` identifier such as `pilot-publishe-50`, and a `status` column that takes values from the set `{published, draft, archived}`. Temporal metadata is captured in `created_at` and `updated_at` columns. Two foreign keys anchor the report to the organizational and service context: `inspection_body_id` references `inspection_bodies`, and `service_domain_id` references `service_domains`.

**Table `inspection_reports`**

| inspection_report_id | report_id | publication_date | reference_code | publisher | status | inspection_body_id | service_domain_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 1202-0008-S | 2025-12-01 | 62ae4aad5ce84e42acc1003ae3490641 | pilot-publishe-50 | published | 1000 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 8189500 | 2022-05-12 | 2618580 | extended-publishe-51 | draft | 1001 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | L355 | 2023-10-23 | 10207148 | integrated-publishe-52 | archived | 1002 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 5844272 | 2024-03-07 | 2618577 | seasonal-publishe-53 | published | 1003 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `inspection_bodies` table defines the regulatory organizations that conduct inspections. Its primary key `inspection_body_id` is referenced by `inspection_reports.inspection_body_id`. The column `body_name` holds values like `Regional Corridor` and `Seasonal Series D`, while `parent_department` stores strings such as `compact-parent-98`. The boolean column `statutory_powers` indicates whether the body exercises formal authority — rows for `Regional Corridor` show `false`, whereas `Seasonal Series D` and `Extended Survey` both carry `true`. The `jurisdiction` column (values like `regional-jurisdic-30` and `legacy-jurisdic-31`) describes the geographic or functional scope of each body.

**Table `inspection_bodies`**

| inspection_body_id | body_name | parent_department | statutory_powers | jurisdiction |
|---|---|---|---|---|
| 1000 | Regional Corridor | compact-parent-98 | false | regional-jurisdic-30 |
| 1001 | Seasonal Series D | composite-parent-99 | true | legacy-jurisdic-31 |
| 1002 | Integrated Assessment | primary-parent-100 | false | compact-jurisdic-32 |
| 1003 | Extended Survey | adaptive-parent-101 | true | composite-jurisdic-33 |

The relationship between `inspection_reports` and `inspection_bodies` is many-to-one: multiple inspection reports can be attributed to a single body, but each report is produced by exactly one body. This cardinality is enforced by the foreign key `inspection_reports.inspection_body_id → inspection_bodies.inspection_body_id`.

## Service Domains as the Bridge to Policy

The `service_domains` table describes the functional areas in which services are delivered. Its primary key `service_domain_id` is referenced by `inspection_reports.service_domain_id`, creating a second foreign key from inspection reports into the service domain hierarchy. The columns `domain_name` (e.g., `Regional Protocol`, `Seasonal Programme D`), `target_population` (values like `composite-target-21`), `service_type` (taking values from `{personal, childcare, multi-purpose, specialized}`), and `is_holistic` (a boolean) characterize each domain. The column `inspection_report_id` in `service_domains` creates a reverse reference back to `inspection_reports`, establishing a bidirectional association: an inspection report can reference a service domain, and that service domain can point back to the report that evaluated it.

**Table `service_domains`**

| service_domain_id | domain_name | target_population | service_type | is_holistic | inspection_report_id |
|---|---|---|---|---|---|
| 100 | Regional Protocol | composite-target-21 | personal | true | 1000 |
| 101 | Seasonal Programme D | primary-target-22 | childcare | false | 1001 |
| 102 | Integrated Standard | adaptive-target-23 | multi-purpose | true | 1002 |
| 103 | Extended Framework | distributed-target-24 | specialized | false | 1003 |

The join between `inspection_reports` and `service_domains` is the subject of two complementary views. The view `v_inspection_report_inspection_body` reconstructs the organizational provenance of each report by joining `inspection_reports` to `inspection_bodies` on `inspection_reports.inspection_body_id = inspection_bodies.inspection_body_id`. Reading the row where `inspection_report_id = 1000`, the view would surface `report_id = 1202-0008-S` alongside `body_name = Regional Corridor` and `statutory_powers = false`, answering the question: "Which regulatory body produced this report, and does it hold formal authority?"

**View `v_inspection_report_inspection_body`**

```sql
CREATE VIEW v_inspection_report_inspection_body AS
SELECT a.inspection_report_id, a.report_id, a.publication_date, a.reference_code, b.inspection_body_id AS body_inspection_body_id, b.body_name AS body_body_name, b.parent_department AS body_parent_department
FROM inspection_reports a JOIN inspection_bodies b ON a.inspection_body_id = b.inspection_body_id;
```

| inspection_report_id | report_id | publication_date | reference_code | body_inspection_body_id | body_body_name | body_parent_department |
|---|---|---|---|---|---|---|
| 1000 | 1202-0008-S | 2025-12-01 | 62ae4aad5ce84e42acc1003ae3490641 | 1000 | Regional Corridor | compact-parent-98 |
| 1001 | 8189500 | 2022-05-12 | 2618580 | 1001 | Seasonal Series D | composite-parent-99 |
| 1002 | L355 | 2023-10-23 | 10207148 | 1002 | Integrated Assessment | primary-parent-100 |
| 1003 | 5844272 | 2024-03-07 | 2618577 | 1003 | Extended Survey | adaptive-parent-101 |

The view `v_inspection_report_service_domain` joins `inspection_reports` to `service_domains` on `inspection_reports.service_domain_id = service_domains.service_domain_id`. For the row with `inspection_report_id = 1000`, the joined result would present `report_id = 1202-0008-S` together with `domain_name = Regional Protocol`, `service_type = personal`, and `is_holistic = true`. This view answers: "What service domain was evaluated in this inspection, and is the service holistic in scope?"

**View `v_inspection_report_service_domain`**

```sql
CREATE VIEW v_inspection_report_service_domain AS
SELECT a.inspection_report_id, a.report_id, a.publication_date, a.reference_code, b.service_domain_id AS domain_service_domain_id, b.domain_name AS domain_domain_name, b.target_population AS domain_target_population
FROM inspection_reports a JOIN service_domains b ON a.service_domain_id = b.service_domain_id;
```

| inspection_report_id | report_id | publication_date | reference_code | domain_service_domain_id | domain_domain_name | domain_target_population |
|---|---|---|---|---|---|---|
| 1000 | 1202-0008-S | 2025-12-01 | 62ae4aad5ce84e42acc1003ae3490641 | 100 | Regional Protocol | composite-target-21 |
| 1001 | 8189500 | 2022-05-12 | 2618580 | 101 | Seasonal Programme D | primary-target-22 |
| 1002 | L355 | 2023-10-23 | 10207148 | 102 | Integrated Standard | adaptive-target-23 |
| 1003 | 5844272 | 2024-03-07 | 2618577 | 103 | Extended Framework | distributed-target-24 |

Conversely, `v_service_domain_inspection_report` reverses the perspective: it starts from `service_domains` and joins to `inspection_reports` on `service_domains.inspection_report_id = inspection_reports.inspection_report_id`. For the row with `service_domain_id = 100`, the view would surface `domain_name = Regional Protocol` alongside `report_id = 1202-0008-S` and `status = published`. This view answers the inverse question: "Which inspection report evaluated this service domain, and what is the current status of that report?"

**View `v_service_domain_inspection_report`**

```sql
CREATE VIEW v_service_domain_inspection_report AS
SELECT a.service_domain_id, a.domain_name, a.target_population, a.service_type, b.inspection_report_id AS report_inspection_report_id, b.report_id AS report_report_id, b.publication_date AS report_publication_date
FROM service_domains a JOIN inspection_reports b ON a.inspection_report_id = b.inspection_report_id;
```

| service_domain_id | domain_name | target_population | service_type | report_inspection_report_id | report_report_id | report_publication_date |
|---|---|---|---|---|---|---|
| 100 | Regional Protocol | composite-target-21 | personal | 1000 | 1202-0008-S | 2025-12-01 |
| 101 | Seasonal Programme D | primary-target-22 | childcare | 1001 | 8189500 | 2022-05-12 |
| 102 | Integrated Standard | adaptive-target-23 | multi-purpose | 1002 | L355 | 2023-10-23 |
| 103 | Extended Framework | distributed-target-24 | specialized | 1003 | 5844272 | 2024-03-07 |

## Needs Assessments and Family Units

The model then shifts from organizational inspection to individual assessment. The `needs_assessments` table records evaluations of family units. Its primary key `id` is a surrogate identifier, while `assessment_id` carries a business identifier such as `template_ivacode_pagata_20det40ind` or `1204-0009-M`. The `assessment_date` column stores timestamps like `2022-05-10T04:24:00`, and `assessment_type` takes values from `{holistic, service-led, partial}`. The integer column `family_size` records the number of members in the assessed household (values range from `9` to `18` in the sample data). The `status` column tracks progress through the assessment lifecycle with values from `{pending, in_progress, complete, failed}`. The foreign key `family_unit_id` references `family_units`, linking each assessment to the family unit it evaluates.

**Table `needs_assessments`**

| id | assessment_id | assessment_date | assessment_type | family_size | status | family_unit_id |
|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | holistic | 9 | pending | 100 |
| 1001 | 19508914 | 2023-10-21T11:41:00 | service-led | 12 | in_progress | 101 |
| 1002 | 506000 | 2024-03-05T18:58:00 | partial | 15 | complete | 102 |
| 1003 | 1204-0009-M | 2025-08-16T01:15:00 | holistic | 18 | failed | 103 |

The `family_units` table describes the households under assessment. Its primary key `family_unit_id` is referenced by both `needs_assessments.family_unit_id` and `service_deliveries.family_unit_id`. The column `family_id` stores a UUID-like identifier such as `5f91638e-8fcd-11eb-924d-9cd76263cbd0` or the shorter string `democrm`. Boolean columns `has_disabled_parent` and `has_children` capture household composition, while `impairment_type` takes values from `{learning, physical, sensory, chronic_sickness}`. The foreign key `needs_assessment_id` references `needs_assessments`, creating a reverse link from family unit to its assessment.

**Table `family_units`**

| family_unit_id | family_id | has_disabled_parent | has_children | impairment_type | needs_assessment_id |
|---|---|---|---|---|---|
| 100 | 5f91638e-8fcd-11eb-924d-9cd76263cbd0 | false | false | learning | 1000 |
| 101 | democrm | true | true | physical | 1001 |
| 102 | 4060635 | false | false | sensory | 1002 |
| 103 | 69430 | true | true | chronic_sickness | 1003 |

The relationship between `needs_assessments` and `family_units` is bidirectional: each needs assessment references exactly one family unit via `needs_assessments.family_unit_id → family_units.family_unit_id`, and each family unit references exactly one needs assessment via `family_units.needs_assessment_id → needs_assessments.id`. This one-to-one correspondence is materialized in two views that present the same logical fact from opposite directions.

The view `v_needs_assessment_family_unit` joins `needs_assessments` to `family_units` on `needs_assessments.family_unit_id = family_units.family_unit_id`. For the row with `id = 1000`, the joined result would present `assessment_id = template_ivacode_pagata_20det40ind`, `assessment_type = holistic`, `family_size = 9`, and `status = pending` alongside `family_id = 5f91638e-8fcd-11eb-924d-9cd76263cbd0`, `has_disabled_parent = false`, `has_children = false`, and `impairment_type = learning`. This view answers: "What are the details of the family unit associated with this needs assessment?"

**View `v_needs_assessment_family_unit`**

```sql
CREATE VIEW v_needs_assessment_family_unit AS
SELECT a.id, a.assessment_id, a.assessment_date, a.assessment_type, b.family_unit_id AS unit_family_unit_id, b.family_id AS unit_family_id, b.has_disabled_parent AS unit_has_disabled_parent
FROM needs_assessments a JOIN family_units b ON a.family_unit_id = b.family_unit_id;
```

| id | assessment_id | assessment_date | assessment_type | unit_family_unit_id | unit_family_id | unit_has_disabled_parent |
|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | holistic | 100 | 5f91638e-8fcd-11eb-924d-9cd76263cbd0 | false |
| 1001 | 19508914 | 2023-10-21T11:41:00 | service-led | 101 | democrm | true |
| 1002 | 506000 | 2024-03-05T18:58:00 | partial | 102 | 4060635 | false |
| 1003 | 1204-0009-M | 2025-08-16T01:15:00 | holistic | 103 | 69430 | true |

The view `v_family_unit_needs_assessment` reverses the join, starting from `family_units` and joining to `needs_assessments` on `family_units.needs_assessment_id = needs_assessments.id`. For the row with `family_unit_id = 101`, the view would surface `family_id = democrm`, `has_disabled_parent = true`, `has_children = true`, `impairment_type = physical` alongside `assessment_id = 19508914`, `assessment_type = service-led`, `family_size = 12`, and `status = in_progress`. This view answers the inverse: "What needs assessment has been completed for this family unit, and what is its current status?"

**View `v_family_unit_needs_assessment`**

```sql
CREATE VIEW v_family_unit_needs_assessment AS
SELECT a.family_unit_id, a.family_id, a.has_disabled_parent, a.has_children, b.id AS assessment_id, b.assessment_id AS assessment_assessment_id, b.assessment_date AS assessment_assessment_date
FROM family_units a JOIN needs_assessments b ON a.needs_assessment_id = b.id;
```

| family_unit_id | family_id | has_disabled_parent | has_children | assessment_id | assessment_assessment_id | assessment_assessment_date |
|---|---|---|---|---|---|---|
| 100 | 5f91638e-8fcd-11eb-924d-9cd76263cbd0 | false | false | 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 |
| 101 | democrm | true | true | 1001 | 19508914 | 2023-10-21T11:41:00 |
| 102 | 4060635 | false | false | 1002 | 506000 | 2024-03-05T18:58:00 |
| 103 | 69430 | true | true | 1003 | 1204-0009-M | 2025-08-16T01:15:00 |

## Service Deliveries and Their Dual Anchors

The `service_deliveries` table records the actual provision of services to family units. Its primary key `delivery_id` is a string identifier that can be numeric (`4060633`), alphanumeric (`48753454`), or UUID-like (`ba649482-8fbb-11eb-924d-9cd76263cbd0`). The columns `start_date` and `end_date` define the service period (notably, in the sample data the `end_date` precedes the `start_date`, suggesting a data entry convention or a backdating pattern). The `provider_type` column takes values from `{local_council, voluntary, private, multi_disciplinary}`, and `quality_rating` is a numeric measure (values range from `12.20` to `24.80`). Two foreign keys anchor each delivery: `family_unit_id` references `family_units`, and `needs_assessment_id` references `needs_assessments`.

**Table `service_deliveries`**

| delivery_id | start_date | end_date | provider_type | quality_rating | family_unit_id | needs_assessment_id |
|---|---|---|---|---|---|---|
| 4060633 | 2022-09-05 | 2022-09-01 | local_council | 12.20 | 100 | 1000 |
| 48753454 | 2023-02-16 | 2023-02-12 | voluntary | 16.40 | 101 | 1001 |
| ba649482-8fbb-11eb-924d-9cd76263cbd0 | 2024-07-27 | 2024-07-23 | private | 20.60 | 102 | 1002 |
| 1336176 | 2025-12-11 | 2025-12-07 | multi_disciplinary | 24.80 | 103 | 1003 |

The relationship between `service_deliveries` and `family_units` is many-to-one: multiple service deliveries can be made to the same family unit, but each delivery targets exactly one family unit. Similarly, `service_deliveries.needs_assessment_id → needs_assessments.id` creates a many-to-one relationship from deliveries to assessments. Together, these two foreign keys mean that each service delivery is simultaneously associated with a family unit and the needs assessment that justified it.

The view `v_family_unit_service_delivery_detail` joins `family_units` to `service_deliveries` on `family_units.family_unit_id = service_deliveries.family_unit_id`. For the row with `family_unit_id = 100`, the joined result would present `family_id = 5f91638e-8fcd-11eb-924d-9cd76263cbd0`, `has_disabled_parent = false`, `has_children = false`, `impairment_type = learning` alongside `delivery_id = 4060633`, `start_date = 2022-09-05`, `provider_type = local_council`, and `quality_rating = 12.20`. This view answers: "What service deliveries have been made to this family unit, and what are their quality ratings?"

**View `v_family_unit_service_delivery_detail`**

```sql
CREATE VIEW v_family_unit_service_delivery_detail AS
SELECT a.family_unit_id, a.family_id, a.has_disabled_parent, b.delivery_id AS delivery_delivery_id, b.start_date AS delivery_start_date, b.end_date AS delivery_end_date
FROM family_units a
  JOIN units_deliveries j ON j.family_unit_id = a.family_unit_id
  JOIN service_deliveries b ON b.delivery_id = j.delivery_id;
```

| family_unit_id | family_id | has_disabled_parent | delivery_delivery_id | delivery_start_date | delivery_end_date |
|---|---|---|---|---|---|
| 100 | 5f91638e-8fcd-11eb-924d-9cd76263cbd0 | false | 4060633 | 2022-09-05 | 2022-09-01 |
| 100 | 5f91638e-8fcd-11eb-924d-9cd76263cbd0 | false | 48753454 | 2023-02-16 | 2023-02-12 |
| 101 | democrm | true | 48753454 | 2023-02-16 | 2023-02-12 |
| 101 | democrm | true | ba649482-8fbb-11eb-924d-9cd76263cbd0 | 2024-07-27 | 2024-07-23 |
| 102 | 4060635 | false | ba649482-8fbb-11eb-924d-9cd76263cbd0 | 2024-07-27 | 2024-07-23 |
| 102 | 4060635 | false | 1336176 | 2025-12-11 | 2025-12-07 |
| 103 | 69430 | true | 1336176 | 2025-12-11 | 2025-12-07 |
| 103 | 69430 | true | 4060633 | 2022-09-05 | 2022-09-01 |

The view `v_service_delivery_family_unit` reverses the perspective, joining `service_deliveries` to `family_units` on `service_deliveries.family_unit_id = family_units.family_unit_id`. For the row with `delivery_id = 48753454`, the view would surface `provider_type = voluntary`, `quality_rating = 16.40`, `start_date = 2023-02-16` alongside `family_id = democrm`, `has_disabled_parent = true`, `has_children = true`, and `impairment_type = physical`. This view answers: "Which family unit received this service delivery, and what are the household's characteristics?"

**View `v_service_delivery_family_unit`**

```sql
CREATE VIEW v_service_delivery_family_unit AS
SELECT a.delivery_id, a.start_date, a.end_date, a.provider_type, b.family_unit_id AS unit_family_unit_id, b.family_id AS unit_family_id, b.has_disabled_parent AS unit_has_disabled_parent
FROM service_deliveries a JOIN family_units b ON a.family_unit_id = b.family_unit_id;
```

| delivery_id | start_date | end_date | provider_type | unit_family_unit_id | unit_family_id | unit_has_disabled_parent |
|---|---|---|---|---|---|---|
| 4060633 | 2022-09-05 | 2022-09-01 | local_council | 100 | 5f91638e-8fcd-11eb-924d-9cd76263cbd0 | false |
| 48753454 | 2023-02-16 | 2023-02-12 | voluntary | 101 | democrm | true |
| ba649482-8fbb-11eb-924d-9cd76263cbd0 | 2024-07-27 | 2024-07-23 | private | 102 | 4060635 | false |
| 1336176 | 2025-12-11 | 2025-12-07 | multi_disciplinary | 103 | 69430 | true |

The view `v_service_delivery_needs_assessment` joins `service_deliveries` to `needs_assessments` on `service_deliveries.needs_assessment_id = needs_assessments.id`. For the row with `delivery_id = ba649482-8fbb-11eb-924d-9cd76263cbd0`, the joined result would present `provider_type = private`, `quality_rating = 20.60`, `start_date = 2024-07-27` alongside `assessment_id = 506000`, `assessment_type = partial`, `family_size = 15`, and `status = complete`. This view answers: "Which needs assessment justified this service delivery, and what was the assessment outcome?"

**View `v_service_delivery_needs_assessment`**

```sql
CREATE VIEW v_service_delivery_needs_assessment AS
SELECT a.delivery_id, a.start_date, a.end_date, a.provider_type, b.id AS assessment_id, b.assessment_id AS assessment_assessment_id, b.assessment_date AS assessment_assessment_date
FROM service_deliveries a JOIN needs_assessments b ON a.needs_assessment_id = b.id;
```

| delivery_id | start_date | end_date | provider_type | assessment_id | assessment_assessment_id | assessment_assessment_date |
|---|---|---|---|---|---|---|
| 4060633 | 2022-09-05 | 2022-09-01 | local_council | 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 |
| 48753454 | 2023-02-16 | 2023-02-12 | voluntary | 1001 | 19508914 | 2023-10-21T11:41:00 |
| ba649482-8fbb-11eb-924d-9cd76263cbd0 | 2024-07-27 | 2024-07-23 | private | 1002 | 506000 | 2024-03-05T18:58:00 |
| 1336176 | 2025-12-11 | 2025-12-07 | multi_disciplinary | 1003 | 1204-0009-M | 2025-08-16T01:15:00 |

## Policy Instruments and Governance

The `policy_instruments` table provides the governance layer of the model. Although its full column set is not enumerated in the sample data, the views that reference it reveal that it connects to both `service_domains` and `needs_assessments`. The view `v_policy_instrument_service_domain` joins `policy_instruments` to `service_domains`, answering the question: "Which policy instruments govern this service domain?" The view `v_policy_instrument_needs_assessment` joins `policy_instruments` to `needs_assessments`, answering: "Which policy instruments inform this needs assessment?" These views establish that policy instruments serve as a cross-cutting concern, linking the governance layer to both the service delivery infrastructure and the assessment process.

**Table `policy_instruments`**

| instrument_id | title | enactment_date | scope | is_statutory | service_domain_id | needs_assessment_id |
|---|---|---|---|---|---|---|
| 6926365 | Compact Initiative | 2022-01-04 | national | false | 100 | 1000 |
| account_pymes_691 | Legacy Model | 2023-06-15 | local | true | 101 | 1001 |
| 726063 | Regional Cluster A | 2024-11-26 | agency_specific | false | 102 | 1002 |
| 23256422 | Seasonal Review | 2025-04-10 | national | true | 103 | 1003 |

**View `v_policy_instrument_service_domain`**

```sql
CREATE VIEW v_policy_instrument_service_domain AS
SELECT a.instrument_id, a.title, a.enactment_date, a.scope, b.service_domain_id AS domain_service_domain_id, b.domain_name AS domain_domain_name, b.target_population AS domain_target_population
FROM policy_instruments a JOIN service_domains b ON a.service_domain_id = b.service_domain_id;
```

| instrument_id | title | enactment_date | scope | domain_service_domain_id | domain_domain_name | domain_target_population |
|---|---|---|---|---|---|---|
| 6926365 | Compact Initiative | 2022-01-04 | national | 100 | Regional Protocol | composite-target-21 |
| account_pymes_691 | Legacy Model | 2023-06-15 | local | 101 | Seasonal Programme D | primary-target-22 |
| 726063 | Regional Cluster A | 2024-11-26 | agency_specific | 102 | Integrated Standard | adaptive-target-23 |
| 23256422 | Seasonal Review | 2025-04-10 | national | 103 | Extended Framework | distributed-target-24 |

**View `v_policy_instrument_needs_assessment`**

```sql
CREATE VIEW v_policy_instrument_needs_assessment AS
SELECT a.instrument_id, a.title, a.enactment_date, a.scope, b.id AS assessment_id, b.assessment_id AS assessment_assessment_id, b.assessment_date AS assessment_assessment_date
FROM policy_instruments a JOIN needs_assessments b ON a.needs_assessment_id = b.id;
```

| instrument_id | title | enactment_date | scope | assessment_id | assessment_assessment_id | assessment_assessment_date |
|---|---|---|---|---|---|---|
| 6926365 | Compact Initiative | 2022-01-04 | national | 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 |
| account_pymes_691 | Legacy Model | 2023-06-15 | local | 1001 | 19508914 | 2023-10-21T11:41:00 |
| 726063 | Regional Cluster A | 2024-11-26 | agency_specific | 1002 | 506000 | 2024-03-05T18:58:00 |
| 23256422 | Seasonal Review | 2025-04-10 | national | 1003 | 1204-0009-M | 2025-08-16T01:15:00 |

## Synthesis

The relational schema models a social services inspection and delivery ecosystem through seven normalized base tables and ten materialized views. The foreign key topology forms two primary chains: the inspection chain (`inspection_reports → inspection_bodies` and `inspection_reports → service_domains`) and the assessment-delivery chain (`needs_assessments ↔ family_units ↔ service_deliveries`). Policy instruments cross-cut both chains via `v_policy_instrument_service_domain` and `v_policy_instrument_needs_assessment`. Each view materializes a specific domain question by joining two tables on their shared key, reconstructing from normalized storage the composite facts that domain experts need — for example, which regulatory body with statutory powers evaluated a holistic personal service, or which voluntary provider delivered a service to a family with a disabled parent and a physical impairment. The model's design ensures that every join is grounded in a single foreign key relationship, and every view's result can be traced back to the base tables through unambiguous key paths.

## Data appendix

**Table `units_deliveries`**

| family_unit_id | delivery_id |
|---|---|
| 100 | 4060633 |
| 100 | 48753454 |
| 101 | 48753454 |
| 101 | ba649482-8fbb-11eb-924d-9cd76263cbd0 |
| 102 | ba649482-8fbb-11eb-924d-9cd76263cbd0 |
| 102 | 1336176 |
| 103 | 1336176 |
| 103 | 4060633 |
