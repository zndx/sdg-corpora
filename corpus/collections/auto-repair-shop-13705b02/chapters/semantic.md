An auto repair shop domain captures the operational relationships between service locations, the technicians who staff them, the customers they serve, the repair tasks they perform, and the diagnostic tools that enable their work. The schema models a mid-sized regional network where each shop employs multiple technicians, each technician may work across multiple shops, and every repair task ties together a technician, a customer, and a diagnostic tool. The normalized design separates entities into five base tables, three junction tables for many-to-many associations, and twelve materialized views that reconstruct domain facts through controlled joins.

## Entity Types and Their Attributes

The `auto_repair_shops` table anchors the domain with one row per service location. Each shop carries a surrogate `id` (e.g. `100`), a business-facing `shop_id` (e.g. `3717615`), and a human-readable `shop_name` such as "Regional Initiative" or "Seasonal Model D". The `established_date` column records when the shop opened — `2024-03-27` for the first row, `2022-01-22` for "Integrated Cluster". The `shop_type` enum distinguishes `repair_shop`, `franchise`, `quick_lube`, and `specialty` operations. Production metrics live in `daily_production_target` (a decimal like `8.95`) and `current_daily_production` (e.g. `13.70`), while `is_profitable` is a boolean flag that is `true` for shops meeting their targets and `false` otherwise. A `diagnostic_tool_id` column creates a one-to-one link to the `diagnostic_tools` table, so shop `100` references tool `1`, shop `101` references tool `2`, and so on through `103` → `4`.

**Table `auto_repair_shops`**

| id | shop_id | shop_name | established_date | shop_type | daily_production_target | current_daily_production | is_profitable | diagnostic_tool_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 3717615 | Regional Initiative | 2024-03-27 | repair_shop | 8.95 | 13.70 | true | 1 |
| 101 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Model D | 2025-08-11 | franchise | 12.90 | 15.40 | false | 2 |
| 102 | 3001009030060 | Integrated Cluster | 2022-01-22 | quick_lube | 16.85 | 17.10 | true | 3 |
| 103 | 505989 | Extended Review | 2023-06-06 | specialty | 20.80 | 18.80 | false | 4 |

The `technicians` table stores one row per service professional. The surrogate `id` runs `1000` through `1003`. A `technician_id` column holds business identifiers like `611494` and `5006464`. The `first_name` and `last_name` columns combine into full names — "Stephanie Collins" and "Paul Allen" appear in the first row, "Janice Johnston" and "Heather Beasley" in the second. The `hourly_rate` is a decimal (e.g. `13.45`, `17.90`, `22.35`, `26.80`), and `skill_level` is an enum of `entry_level`, `basic`, and `master`. The boolean `is_assigned_to_repair` indicates current task assignment status. The `auto_repair_shop_id` column is a foreign key pointing to `auto_repair_shops.id`, so technician `1000` belongs to shop `100`, technician `1001` to shop `101`, technician `1002` to shop `102`, and technician `1003` to shop `103`. A `task_id` column links the technician to their current repair task, referencing `repair_tasks.task_id` — values include `7731870`, `id_28`, `7119763`, and `lu_tax_code_template_m82`.

**Table `technicians`**

| id | technician_id | first_name | last_name | hourly_rate | skill_level | is_assigned_to_repair | auto_repair_shop_id | task_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 611494 | Stephanie Collins | Paul Allen | 13.45 | entry_level | true | 100 | 7731870 |
| 1001 | 5006464 | Janice Johnston | Heather Beasley | 17.90 | basic | false | 101 | id_28 |
| 1002 | 2404 | Upal Saha | Audrey Taylor | 22.35 | master | true | 102 | 7119763 |
| 1003 | 1186102 | Katherine Snyder | Susan Wagner | 26.80 | entry_level | false | 103 | lu_tax_code_template_m82 |

The `repair_tasks` table is the central transactional entity. Its primary key is `task_id`, which uses both pure-numeric identifiers (`7731870`, `7119763`) and alphanumeric codes (`id_28`, `lu_tax_code_template_m82`). The `task_description` column holds names like "Legacy Standard D", "Regional Framework", "Seasonal Protocol", and "Integrated Programme A". Duration tracking uses `estimated_duration` and `actual_duration` as integers — for instance, task `7731870` was estimated at `42` minutes but completed in `41`. The `task_status` enum takes values `pending`, `in_progress`, `completed`, and `failed`; the fourth row shows a `failed` task. The `labor_cost` column is a decimal (e.g. `16.54`, `35.61`, `12.72`, `33.06`). Foreign keys `technician_id`, `customer_id`, and `diagnostic_tool_id` link this table to the `technicians`, `customers`, and `diagnostic_tools` tables respectively, forming the core many-to-many relationships.

**Table `repair_tasks`**

| task_id | task_description | estimated_duration | actual_duration | task_status | labor_cost | technician_id | customer_id | diagnostic_tool_id |
|---|---|---|---|---|---|---|---|---|
| 7731870 | Legacy Standard D | 42 | 41 | pending | 16.54 | 1000 | 1 | 1 |
| id_28 | Regional Framework | 52 | 48 | in_progress | 35.61 | 1001 | 2 | 2 |
| 7119763 | Seasonal Protocol | 62 | 55 | completed | 12.72 | 1002 | 3 | 3 |
| lu_tax_code_template_m82 | Integrated Programme A | 72 | 62 | failed | 33.06 | 1003 | 4 | 4 |

The `customers` table stores client records. The surrogate `id` runs `1` through `4`. The `customer_id` column holds business identifiers such as `Stephanie Lawrence` and `Bryan Larson` — note that in this dataset the `customer_id` values are names rather than numeric codes, which is an artifact of the synthetic data generation. The `first_name` and `last_name` columns store personal names like "Stephanie Collins" and "Paul Allen". The `contact_number` column holds names as well ("Peter Mcdowell", "Sophia Meyer"), again reflecting synthetic data conventions. The `satisfaction_score` is a decimal ranging from `4.45` to `11.80`, and `is_raving_fan` is a boolean flag. The `auto_repair_shop_id` foreign key links each customer to their home shop — customer `1` to shop `100`, customer `2` to shop `101`, and so on.

**Table `customers`**

| id | customer_id | first_name | last_name | contact_number | satisfaction_score | is_raving_fan | auto_repair_shop_id |
|---|---|---|---|---|---|---|---|
| 1 | Stephanie Lawrence | Stephanie Collins | Paul Allen | Peter Mcdowell | 4.45 | true | 100 |
| 2 | Bryan Larson | Janice Johnston | Heather Beasley | Sophia Meyer | 6.90 | false | 101 |
| 3 | Allen Saunders | Upal Saha | Audrey Taylor | Carol Gaines | 9.35 | true | 102 |
| 4 | Francis Gulotta | Katherine Snyder | Susan Wagner | April Snyder | 11.80 | false | 103 |

The `diagnostic_tools` table catalogs the instruments used during repairs. The surrogate `id` runs `1` through `4`. The `tool_id` column holds identifiers like `comi`, `195360`, `3355763`, and `8387539`. The `tool_name` column provides descriptive names — "Composite Model", "Compact Cluster A", "Legacy Review", and "Regional Initiative". The `tool_type` enum distinguishes `hardware` from `software` tools. The `is_free` boolean indicates whether the tool is provided at no cost. The `last_calibration_date` column stores dates such as `2025-12-01`, `2022-05-12`, `2023-10-23`, and `2024-03-07`. The `technician_id` and `task_id` columns are foreign keys linking the tool to the technician who operates it and the repair task for which it is used.

**Table `diagnostic_tools`**

| id | tool_id | tool_name | tool_type | is_free | last_calibration_date | technician_id | task_id |
|---|---|---|---|---|---|---|---|
| 1 | comi | Composite Model | hardware | true | 2025-12-01 | 1000 | 7731870 |
| 2 | 195360 | Compact Cluster A | software | false | 2022-05-12 | 1001 | id_28 |
| 3 | 3355763 | Legacy Review | hardware | true | 2023-10-23 | 1002 | 7119763 |
| 4 | 8387539 | Regional Initiative | software | false | 2024-03-07 | 1003 | lu_tax_code_template_m82 |

## Junction Tables and Many-to-Many Relationships

The schema uses three junction tables to resolve many-to-many relationships that cannot be expressed through single foreign keys. The `shops_technicians` table resolves the relationship between `auto_repair_shops` and `technicians`. Each row contains an `auto_repair_shop_id` and a `technician_id`, forming a composite key. The data shows that shop `100` employs technicians `1000` and `1001`, shop `101` employs `1001` and `1002`, shop `102` employs `1002` and `1003`, and shop `103` employs `1003` and `1000`. This means every technician works at two shops, and every shop employs two technicians — a balanced cross-assignment pattern.

**Table `shops_technicians`**

| auto_repair_shop_id | technician_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

The `shops_customers` table resolves the relationship between `auto_repair_shops` and `customers`. Although the `customers` table already carries an `auto_repair_shop_id` foreign key, the junction table exists to support customers who may be associated with multiple shops. The schema design anticipates a customer visiting or being serviced at more than one location within the regional network.

**Table `shops_customers`**

| auto_repair_shop_id | customer_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `customers_tasks` table resolves the relationship between `customers` and `repair_tasks`. While the `repair_tasks` table already carries a `customer_id` foreign key, this junction table supports the case where a single customer may commission multiple repair tasks, or a task may involve multiple customers (e.g. fleet accounts). The schema design accommodates both one-to-many and many-to-many cardinalities.

**Table `customers_tasks`**

| customer_id | task_id |
|---|---|
| 1 | 7731870 |
| 1 | id_28 |
| 2 | id_28 |
| 2 | 7119763 |
| 3 | 7119763 |
| 3 | lu_tax_code_template_m82 |
| 4 | lu_tax_code_template_m82 |
| 4 | 7731870 |

## Materialized Views

The twelve views materialize the normalized schema into domain-specific perspectives. Each view is a stored query that joins the appropriate tables to answer a particular operational question.

The view `v_auto_repair_shop_technician_detail` joins `auto_repair_shops` with `shops_technicians` and `technicians` to produce a roster of technicians assigned to each shop. Reading the first row, one would see shop `100` ("Regional Initiative") with technician `1000` ("Stephanie Collins", hourly rate `13.45`, skill level `entry_level`). This view answers the question: "Which technicians work at which shops, and what are their qualifications?"

**View `v_auto_repair_shop_technician_detail`**

```sql
CREATE VIEW v_auto_repair_shop_technician_detail AS
SELECT a.id, a.shop_id, a.shop_name, b.id AS technician_id, b.technician_id AS technician_technician_id, b.first_name AS technician_first_name
FROM auto_repair_shops a
  JOIN shops_technicians j ON j.auto_repair_shop_id = a.id
  JOIN technicians b ON b.id = j.technician_id;
```

| id | shop_id | shop_name | technician_id | technician_technician_id | technician_first_name |
|---|---|---|---|---|---|
| 100 | 3717615 | Regional Initiative | 1000 | 611494 | Stephanie Collins |
| 100 | 3717615 | Regional Initiative | 1001 | 5006464 | Janice Johnston |
| 101 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Model D | 1001 | 5006464 | Janice Johnston |
| 101 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Model D | 1002 | 2404 | Upal Saha |
| 102 | 3001009030060 | Integrated Cluster | 1002 | 2404 | Upal Saha |
| 102 | 3001009030060 | Integrated Cluster | 1003 | 1186102 | Katherine Snyder |
| 103 | 505989 | Extended Review | 1003 | 1186102 | Katherine Snyder |
| 103 | 505989 | Extended Review | 1000 | 611494 | Stephanie Collins |

The view `v_auto_repair_shop_customer_detail` joins `auto_repair_shops` with `shops_customers` and `customers` to produce a customer roster per shop. The first row would show shop `100` with customer `1` ("Stephanie Lawrence", satisfaction score `4.45`, `is_raving_fan` = `true`). This view answers: "Which customers are associated with each shop, and how satisfied are they?"

**View `v_auto_repair_shop_customer_detail`**

```sql
CREATE VIEW v_auto_repair_shop_customer_detail AS
SELECT a.id, a.shop_id, a.shop_name, b.id AS customer_id, b.customer_id AS customer_customer_id, b.first_name AS customer_first_name
FROM auto_repair_shops a
  JOIN shops_customers j ON j.auto_repair_shop_id = a.id
  JOIN customers b ON b.id = j.customer_id;
```

| id | shop_id | shop_name | customer_id | customer_customer_id | customer_first_name |
|---|---|---|---|---|---|
| 100 | 3717615 | Regional Initiative | 1 | Stephanie Lawrence | Stephanie Collins |
| 100 | 3717615 | Regional Initiative | 2 | Bryan Larson | Janice Johnston |
| 101 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Model D | 2 | Bryan Larson | Janice Johnston |
| 101 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Model D | 3 | Allen Saunders | Upal Saha |
| 102 | 3001009030060 | Integrated Cluster | 3 | Allen Saunders | Upal Saha |
| 102 | 3001009030060 | Integrated Cluster | 4 | Francis Gulotta | Katherine Snyder |
| 103 | 505989 | Extended Review | 4 | Francis Gulotta | Katherine Snyder |
| 103 | 505989 | Extended Review | 1 | Stephanie Lawrence | Stephanie Collins |

The view `v_auto_repair_shop_diagnostic_tool` joins `auto_repair_shops` with `diagnostic_tools` (via the `diagnostic_tool_id` foreign key in `auto_repair_shops`) to show which diagnostic tool is assigned to each shop. The first row would show shop `100` with tool `1` ("Composite Model", type `hardware`, `is_free` = `true`, last calibrated `2025-12-01`). This view answers: "What diagnostic equipment does each shop have, and when was it last calibrated?"

**View `v_auto_repair_shop_diagnostic_tool`**

```sql
CREATE VIEW v_auto_repair_shop_diagnostic_tool AS
SELECT a.id, a.shop_id, a.shop_name, a.established_date, b.id AS tool_id, b.tool_id AS tool_tool_id, b.tool_name AS tool_tool_name
FROM auto_repair_shops a JOIN diagnostic_tools b ON a.diagnostic_tool_id = b.id;
```

| id | shop_id | shop_name | established_date | tool_id | tool_tool_id | tool_tool_name |
|---|---|---|---|---|---|---|
| 100 | 3717615 | Regional Initiative | 2024-03-27 | 1 | comi | Composite Model |
| 101 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Model D | 2025-08-11 | 2 | 195360 | Compact Cluster A |
| 102 | 3001009030060 | Integrated Cluster | 2022-01-22 | 3 | 3355763 | Legacy Review |
| 103 | 505989 | Extended Review | 2023-06-06 | 4 | 8387539 | Regional Initiative |

The view `v_technician_auto_repair_shop` joins `technicians` with `shops_technicians` and `auto_repair_shops` to produce the inverse perspective of `v_auto_repair_shop_technician_detail` — it lists each technician alongside their shop(s). The first row would show technician `1000` ("Stephanie Collins") at shop `100` ("Regional Initiative"). This view answers: "Which shop(s) does each technician work at?"

**View `v_technician_auto_repair_shop`**

```sql
CREATE VIEW v_technician_auto_repair_shop AS
SELECT a.id, a.technician_id, a.first_name, a.last_name, b.id AS shop_id, b.shop_id AS shop_shop_id, b.shop_name AS shop_shop_name
FROM technicians a JOIN auto_repair_shops b ON a.auto_repair_shop_id = b.id;
```

| id | technician_id | first_name | last_name | shop_id | shop_shop_id | shop_shop_name |
|---|---|---|---|---|---|---|
| 1000 | 611494 | Stephanie Collins | Paul Allen | 100 | 3717615 | Regional Initiative |
| 1001 | 5006464 | Janice Johnston | Heather Beasley | 101 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Model D |
| 1002 | 2404 | Upal Saha | Audrey Taylor | 102 | 3001009030060 | Integrated Cluster |
| 1003 | 1186102 | Katherine Snyder | Susan Wagner | 103 | 505989 | Extended Review |

The view `v_technician_repair_task` joins `technicians` with `repair_tasks` (via the `technician_id` foreign key) to show which repair task each technician is currently handling. The first row would show technician `1000` assigned to task `7731870` ("Legacy Standard D", status `pending`, labor cost `16.54`). This view answers: "What repair task is each technician working on?"

**View `v_technician_repair_task`**

```sql
CREATE VIEW v_technician_repair_task AS
SELECT a.id, a.technician_id, a.first_name, a.last_name, b.task_id AS task_task_id, b.task_description AS task_task_description, b.estimated_duration AS task_estimated_duration
FROM technicians a JOIN repair_tasks b ON a.task_id = b.task_id;
```

| id | technician_id | first_name | last_name | task_task_id | task_task_description | task_estimated_duration |
|---|---|---|---|---|---|---|
| 1000 | 611494 | Stephanie Collins | Paul Allen | 7731870 | Legacy Standard D | 42 |
| 1001 | 5006464 | Janice Johnston | Heather Beasley | id_28 | Regional Framework | 52 |
| 1002 | 2404 | Upal Saha | Audrey Taylor | 7119763 | Seasonal Protocol | 62 |
| 1003 | 1186102 | Katherine Snyder | Susan Wagner | lu_tax_code_template_m82 | Integrated Programme A | 72 |

The view `v_repair_task_technician` joins `repair_tasks` with `technicians` (via the `technician_id` foreign key) to produce the inverse perspective — it lists each repair task alongside its assigned technician. The first row would show task `7731870` ("Legacy Standard D") performed by technician `1000` ("Stephanie Collins"). This view answers: "Which technician is responsible for each repair task?"

**View `v_repair_task_technician`**

```sql
CREATE VIEW v_repair_task_technician AS
SELECT a.task_id, a.task_description, a.estimated_duration, a.actual_duration, b.id AS technician_id, b.technician_id AS technician_technician_id, b.first_name AS technician_first_name
FROM repair_tasks a JOIN technicians b ON a.technician_id = b.id;
```

| task_id | task_description | estimated_duration | actual_duration | technician_id | technician_technician_id | technician_first_name |
|---|---|---|---|---|---|---|
| 7731870 | Legacy Standard D | 42 | 41 | 1000 | 611494 | Stephanie Collins |
| id_28 | Regional Framework | 52 | 48 | 1001 | 5006464 | Janice Johnston |
| 7119763 | Seasonal Protocol | 62 | 55 | 1002 | 2404 | Upal Saha |
| lu_tax_code_template_m82 | Integrated Programme A | 72 | 62 | 1003 | 1186102 | Katherine Snyder |

The view `v_repair_task_customer` joins `repair_tasks` with `customers` (via the `customer_id` foreign key) to show which customer each repair task belongs to. The first row would show task `7731870` ("Legacy Standard D") for customer `1` ("Stephanie Lawrence", satisfaction score `4.45`). This view answers: "Which customer commissioned each repair task?"

**View `v_repair_task_customer`**

```sql
CREATE VIEW v_repair_task_customer AS
SELECT a.task_id, a.task_description, a.estimated_duration, a.actual_duration, b.id AS customer_id, b.customer_id AS customer_customer_id, b.first_name AS customer_first_name
FROM repair_tasks a JOIN customers b ON a.customer_id = b.id;
```

| task_id | task_description | estimated_duration | actual_duration | customer_id | customer_customer_id | customer_first_name |
|---|---|---|---|---|---|---|
| 7731870 | Legacy Standard D | 42 | 41 | 1 | Stephanie Lawrence | Stephanie Collins |
| id_28 | Regional Framework | 52 | 48 | 2 | Bryan Larson | Janice Johnston |
| 7119763 | Seasonal Protocol | 62 | 55 | 3 | Allen Saunders | Upal Saha |
| lu_tax_code_template_m82 | Integrated Programme A | 72 | 62 | 4 | Francis Gulotta | Katherine Snyder |

The view `v_repair_task_diagnostic_tool` joins `repair_tasks` with `diagnostic_tools` (via the `diagnostic_tool_id` foreign key) to show which diagnostic tool was used for each repair task. The first row would show task `7731870` ("Legacy Standard D") using tool `1` ("Composite Model", type `hardware`). This view answers: "What diagnostic tool was used for each repair task?"

**View `v_repair_task_diagnostic_tool`**

```sql
CREATE VIEW v_repair_task_diagnostic_tool AS
SELECT a.task_id, a.task_description, a.estimated_duration, a.actual_duration, b.id AS tool_id, b.tool_id AS tool_tool_id, b.tool_name AS tool_tool_name
FROM repair_tasks a JOIN diagnostic_tools b ON a.diagnostic_tool_id = b.id;
```

| task_id | task_description | estimated_duration | actual_duration | tool_id | tool_tool_id | tool_tool_name |
|---|---|---|---|---|---|---|
| 7731870 | Legacy Standard D | 42 | 41 | 1 | comi | Composite Model |
| id_28 | Regional Framework | 52 | 48 | 2 | 195360 | Compact Cluster A |
| 7119763 | Seasonal Protocol | 62 | 55 | 3 | 3355763 | Legacy Review |
| lu_tax_code_template_m82 | Integrated Programme A | 72 | 62 | 4 | 8387539 | Regional Initiative |

The view `v_customer_auto_repair_shop` joins `customers` with `shops_customers` and `auto_repair_shops` to produce the inverse perspective of `v_auto_repair_shop_customer_detail` — it lists each customer alongside their shop(s). The first row would show customer `1` ("Stephanie Lawrence") at shop `100` ("Regional Initiative"). This view answers: "Which shop(s) is each customer associated with?"

**View `v_customer_auto_repair_shop`**

```sql
CREATE VIEW v_customer_auto_repair_shop AS
SELECT a.id, a.customer_id, a.first_name, a.last_name, b.id AS shop_id, b.shop_id AS shop_shop_id, b.shop_name AS shop_shop_name
FROM customers a JOIN auto_repair_shops b ON a.auto_repair_shop_id = b.id;
```

| id | customer_id | first_name | last_name | shop_id | shop_shop_id | shop_shop_name |
|---|---|---|---|---|---|---|
| 1 | Stephanie Lawrence | Stephanie Collins | Paul Allen | 100 | 3717615 | Regional Initiative |
| 2 | Bryan Larson | Janice Johnston | Heather Beasley | 101 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Model D |
| 3 | Allen Saunders | Upal Saha | Audrey Taylor | 102 | 3001009030060 | Integrated Cluster |
| 4 | Francis Gulotta | Katherine Snyder | Susan Wagner | 103 | 505989 | Extended Review |

The view `v_customer_repair_task_detail` joins `customers` with `customers_tasks` and `repair_tasks` to produce a detailed record of each customer's repair tasks. The first row would show customer `1` ("Stephanie Lawrence") with task `7731870` ("Legacy Standard D", status `pending`, estimated duration `42`, actual duration `41`). This view answers: "What repair tasks has each customer commissioned, and what is their status?"

**View `v_customer_repair_task_detail`**

```sql
CREATE VIEW v_customer_repair_task_detail AS
SELECT a.id, a.customer_id, a.first_name, b.task_id AS task_task_id, b.task_description AS task_task_description, b.estimated_duration AS task_estimated_duration
FROM customers a
  JOIN customers_tasks j ON j.customer_id = a.id
  JOIN repair_tasks b ON b.task_id = j.task_id;
```

| id | customer_id | first_name | task_task_id | task_task_description | task_estimated_duration |
|---|---|---|---|---|---|
| 1 | Stephanie Lawrence | Stephanie Collins | 7731870 | Legacy Standard D | 42 |
| 1 | Stephanie Lawrence | Stephanie Collins | id_28 | Regional Framework | 52 |
| 2 | Bryan Larson | Janice Johnston | id_28 | Regional Framework | 52 |
| 2 | Bryan Larson | Janice Johnston | 7119763 | Seasonal Protocol | 62 |
| 3 | Allen Saunders | Upal Saha | 7119763 | Seasonal Protocol | 62 |
| 3 | Allen Saunders | Upal Saha | lu_tax_code_template_m82 | Integrated Programme A | 72 |
| 4 | Francis Gulotta | Katherine Snyder | lu_tax_code_template_m82 | Integrated Programme A | 72 |
| 4 | Francis Gulotta | Katherine Snyder | 7731870 | Legacy Standard D | 42 |

The view `v_diagnostic_tool_technician` joins `diagnostic_tools` with `technicians` (via the `technician_id` foreign key in `diagnostic_tools`) to show which technician operates each diagnostic tool. The first row would show tool `1` ("Composite Model") operated by technician `1000` ("Stephanie Collins"). This view answers: "Which technician operates each diagnostic tool?"

**View `v_diagnostic_tool_technician`**

```sql
CREATE VIEW v_diagnostic_tool_technician AS
SELECT a.id, a.tool_id, a.tool_name, a.tool_type, b.id AS technician_id, b.technician_id AS technician_technician_id, b.first_name AS technician_first_name
FROM diagnostic_tools a JOIN technicians b ON a.technician_id = b.id;
```

| id | tool_id | tool_name | tool_type | technician_id | technician_technician_id | technician_first_name |
|---|---|---|---|---|---|---|
| 1 | comi | Composite Model | hardware | 1000 | 611494 | Stephanie Collins |
| 2 | 195360 | Compact Cluster A | software | 1001 | 5006464 | Janice Johnston |
| 3 | 3355763 | Legacy Review | hardware | 1002 | 2404 | Upal Saha |
| 4 | 8387539 | Regional Initiative | software | 1003 | 1186102 | Katherine Snyder |

The view `v_diagnostic_tool_repair_task` joins `diagnostic_tools` with `repair_tasks` (via the `task_id` foreign key in `diagnostic_tools`) to show which repair task each diagnostic tool is associated with. The first row would show tool `1` ("Composite Model") used for task `7731870` ("Legacy Standard D", status `pending`). This view answers: "Which repair task is each diagnostic tool associated with?"

**View `v_diagnostic_tool_repair_task`**

```sql
CREATE VIEW v_diagnostic_tool_repair_task AS
SELECT a.id, a.tool_id, a.tool_name, a.tool_type, b.task_id AS task_task_id, b.task_description AS task_task_description, b.estimated_duration AS task_estimated_duration
FROM diagnostic_tools a JOIN repair_tasks b ON a.task_id = b.task_id;
```

| id | tool_id | tool_name | tool_type | task_task_id | task_task_description | task_estimated_duration |
|---|---|---|---|---|---|---|
| 1 | comi | Composite Model | hardware | 7731870 | Legacy Standard D | 42 |
| 2 | 195360 | Compact Cluster A | software | id_28 | Regional Framework | 52 |
| 3 | 3355763 | Legacy Review | hardware | 7119763 | Seasonal Protocol | 62 |
| 4 | 8387539 | Regional Initiative | software | lu_tax_code_template_m82 | Integrated Programme A | 72 |

## Synthesis

The schema models the auto repair shop domain through five entity tables, three junction tables, and twelve materialized views. The base tables capture the core entities — shops, technicians, customers, repair tasks, and diagnostic tools — with attributes that reflect real operational concerns: production targets, hourly rates, satisfaction scores, calibration dates, and task durations. The junction tables (`shops_technicians`, `shops_customers`, `customers_tasks`) resolve many-to-many relationships that arise because technicians work at multiple shops, customers visit multiple locations, and tasks may involve multiple parties. The twelve views materialize these relationships into domain-specific perspectives, each answering a distinct operational question by joining the appropriate tables. The foreign key constraints — `auto_repair_shops.diagnostic_tool_id` → `diagnostic_tools.id`, `technicians.auto_repair_shop_id` → `auto_repair_shops.id`, `technicians.task_id` → `repair_tasks.task_id`, `repair_tasks.technician_id` → `technicians.id`, `repair_tasks.customer_id` → `customers.id`, `repair_tasks.diagnostic_tool_id` → `diagnostic_tools.id`, `diagnostic_tools.technician_id` → `technicians.id`, and `diagnostic_tools.task_id` → `repair_tasks.task_id` — form a tightly interconnected graph that ensures referential integrity across the entire domain. The result is a normalized schema that balances query efficiency with data integrity, where each view reconstructs a coherent domain fact from the underlying normalized tables.