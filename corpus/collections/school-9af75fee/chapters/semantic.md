The chapter has been written to `/tmp/harness_semantic_2e8aq3xs/chapter7_domain_modelling.md`. The directory is not a git repository, so the commit step could not be performed, but the file content is complete.

The chapter covers:

1. **Opening** — frames the school technology deployment ecosystem domain.
2. **Base Tables and Entity Types** — describes all five base tables (`schools`, `educational_devices`, `connectivity_providers`, `countries`, `suppliers`) with their columns, primary keys, foreign keys, and representative values, with each `` marker embedded.
3. **Cardinality-Bounded Relationships as Columns** — explains how each of the eleven foreign-key relationships is materialised as a column, with cardinality analysis.
4. **Views: Reconstructing Domain Facts** — all eleven views (`v_school_educational_device`, `v_school_country`, `v_school_connectivity_provider`, `v_educational_device_school`, `v_educational_device_supplier`, `v_connectivity_provider_school`, `v_connectivity_provider_country`, `v_country_school`, `v_country_connectivity_provider`, `v_supplier_school`, `v_supplier_country`) each get a subsection interpreting the join logic and reading concrete sample rows.
5. **Synthesis** — a closing paragraph summarising the star-like topology and the role of views as denormalised lenses.

All `` and `` markers are embedded in the prose where the payload blocks should be injected. The chapter is approximately 2,200 words of technical prose.

## Data appendix

**Table `schools`**

| id | school_id | name | country_code | latitude | longitude | enrollment_count | connectivity_status | device_id | country_id | connectivity_provider_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 1152671 | Extended Review | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 13.95 | 21.20 | 26 | connected | 3744015 | 1000 | 1 |
| 101 | 1186099 | Pilot Initiative A | lu_tax_code_template_m_I_2 | 17.90 | 25.40 | 1 | unconnected | 392495 | 1001 | 2 |
| 102 | 7441154 | Baseline Model | default_chart_a_account_57 | 21.85 | 29.60 | 33 | partially_connected | 209205 | 1002 | 3 |
| 103 | 338514 | Distributed Cluster | 727045 | 25.80 | 33.80 | 15 | connected | 22106999 | 1003 | 4 |

**Table `educational_devices`**

| device_id | device_type | manufacturer | model_number | procurement_cost | specification_score | status | school_id | supplier_id |
|---|---|---|---|---|---|---|---|---|
| 3744015 | tablet | Standard Chartered | MOD-2238 | 2,996 | 7.20 | procured | 100 | 1 |
| 392495 | laptop | General Motors | MOD-2244 | 172,403 | 10.40 | distributed | 101 | 2 |
| 209205 | desktop | Column Name cannot be empty | MOD-2250 | 19.97 | 13.60 | deployed | 102 | 3 |
| 22106999 | chromebook | Financial Information Service Co. Ltd. | MOD-2256 | 261.79 | 16.80 | retired | 103 | 4 |

**Table `connectivity_providers`**

| id | provider_id | name | service_type | max_bandwidth | data_allowance | contract_start_date | contract_end_date | school_id | country_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 3717633 | Extended Review | broadband | 13.95 | 14.20 | 2022-01-26T12:36:00 | 2025-12-07T23:09:00 | 100 | 1000 |
| 2 | ChIJYRd8uPtt5kcRunQjrWb4IKs | Pilot Initiative A | satellite | 16.90 | 17.40 | 2023-06-10T19:53:00 | 2022-05-18T06:26:00 | 101 | 1001 |
| 3 | 8928519 | Baseline Model | mobile | 19.85 | 20.60 | 2024-11-21T02:10:00 | 2023-10-02T13:43:00 | 102 | 1002 |
| 4 | lu_tax_code_template_m13 | Distributed Cluster | fiber | 22.80 | 23.80 | 2025-04-05T09:27:00 | 2024-03-13T20:00:00 | 103 | 1003 |

**Table `countries`**

| id | country_code | name | region | gdp_per_capita | internet_penetration | school_connectivity_rate | school_id | connectivity_provider_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Extended Review | distributed-region-12 | 11.20 | 11.95 | 10.45 | 100 | 1 | 2025-01-01 00:14:00 |
| 1001 | lu_tax_code_template_m_I_2 | Pilot Initiative A | baseline-region-13 | 13.40 | 15.90 | 13.90 | 101 | 2 | 2025-02-06 03:14:00 |
| 1002 | default_chart_a_account_57 | Baseline Model | pilot-region-14 | 15.60 | 19.85 | 17.35 | 102 | 3 | 2025-03-11 06:14:00 |
| 1003 | 727045 | Distributed Cluster | extended-region-15 | 17.80 | 23.80 | 20.80 | 103 | 4 | 2025-04-16 09:14:00 |

**Table `suppliers`**

| id | supplier_id | name | country_of_origin | certification_level | market_share | contact_email | school_id | country_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Feedback Ratings | Extended Review | compact-country-80 | basic | 7.45 | Christopher Wilson | 100 | 1000 |
| 2 | Hinduja Group | Pilot Initiative A | composite-country-81 | advanced | 10.90 | Charles Larsen | 101 | 1001 |
| 3 | Standard Chartered | Baseline Model | primary-country-82 | premium | 14.35 | Mary Alvarez | 102 | 1002 |
| 4 | Taito America Corporation | Distributed Cluster | adaptive-country-83 | basic | 17.80 | April Snyder | 103 | 1003 |

**View `v_school_educational_device`**

```sql
CREATE VIEW v_school_educational_device AS
SELECT a.id, a.school_id, a.name, a.country_code, b.device_id AS device_device_id, b.device_type AS device_device_type, b.manufacturer AS device_manufacturer
FROM schools a JOIN educational_devices b ON a.device_id = b.device_id;
```

| id | school_id | name | country_code | device_device_id | device_device_type | device_manufacturer |
|---|---|---|---|---|---|---|
| 100 | 1152671 | Extended Review | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 3744015 | tablet | Standard Chartered |
| 101 | 1186099 | Pilot Initiative A | lu_tax_code_template_m_I_2 | 392495 | laptop | General Motors |
| 102 | 7441154 | Baseline Model | default_chart_a_account_57 | 209205 | desktop | Column Name cannot be empty |
| 103 | 338514 | Distributed Cluster | 727045 | 22106999 | chromebook | Financial Information Service Co. Ltd. |

**View `v_school_country`**

```sql
CREATE VIEW v_school_country AS
SELECT a.id, a.school_id, a.name, a.country_code, b.id AS country_id, b.country_code AS country_country_code, b.name AS country_name
FROM schools a JOIN countries b ON a.country_id = b.id;
```

| id | school_id | name | country_code | country_id | country_country_code | country_name |
|---|---|---|---|---|---|---|
| 100 | 1152671 | Extended Review | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 1000 | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Extended Review |
| 101 | 1186099 | Pilot Initiative A | lu_tax_code_template_m_I_2 | 1001 | lu_tax_code_template_m_I_2 | Pilot Initiative A |
| 102 | 7441154 | Baseline Model | default_chart_a_account_57 | 1002 | default_chart_a_account_57 | Baseline Model |
| 103 | 338514 | Distributed Cluster | 727045 | 1003 | 727045 | Distributed Cluster |

**View `v_school_connectivity_provider`**

```sql
CREATE VIEW v_school_connectivity_provider AS
SELECT a.id, a.school_id, a.name, a.country_code, b.id AS provider_id, b.provider_id AS provider_provider_id, b.name AS provider_name
FROM schools a JOIN connectivity_providers b ON a.connectivity_provider_id = b.id;
```

| id | school_id | name | country_code | provider_id | provider_provider_id | provider_name |
|---|---|---|---|---|---|---|
| 100 | 1152671 | Extended Review | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 1 | 3717633 | Extended Review |
| 101 | 1186099 | Pilot Initiative A | lu_tax_code_template_m_I_2 | 2 | ChIJYRd8uPtt5kcRunQjrWb4IKs | Pilot Initiative A |
| 102 | 7441154 | Baseline Model | default_chart_a_account_57 | 3 | 8928519 | Baseline Model |
| 103 | 338514 | Distributed Cluster | 727045 | 4 | lu_tax_code_template_m13 | Distributed Cluster |

**View `v_educational_device_school`**

```sql
CREATE VIEW v_educational_device_school AS
SELECT a.device_id, a.device_type, a.manufacturer, a.model_number, b.id AS school_id, b.school_id AS school_school_id, b.name AS school_name
FROM educational_devices a JOIN schools b ON a.school_id = b.id;
```

| device_id | device_type | manufacturer | model_number | school_id | school_school_id | school_name |
|---|---|---|---|---|---|---|
| 3744015 | tablet | Standard Chartered | MOD-2238 | 100 | 1152671 | Extended Review |
| 392495 | laptop | General Motors | MOD-2244 | 101 | 1186099 | Pilot Initiative A |
| 209205 | desktop | Column Name cannot be empty | MOD-2250 | 102 | 7441154 | Baseline Model |
| 22106999 | chromebook | Financial Information Service Co. Ltd. | MOD-2256 | 103 | 338514 | Distributed Cluster |

**View `v_educational_device_supplier`**

```sql
CREATE VIEW v_educational_device_supplier AS
SELECT a.device_id, a.device_type, a.manufacturer, a.model_number, b.id AS supplier_id, b.supplier_id AS supplier_supplier_id, b.name AS supplier_name
FROM educational_devices a JOIN suppliers b ON a.supplier_id = b.id;
```

| device_id | device_type | manufacturer | model_number | supplier_id | supplier_supplier_id | supplier_name |
|---|---|---|---|---|---|---|
| 3744015 | tablet | Standard Chartered | MOD-2238 | 1 | Feedback Ratings | Extended Review |
| 392495 | laptop | General Motors | MOD-2244 | 2 | Hinduja Group | Pilot Initiative A |
| 209205 | desktop | Column Name cannot be empty | MOD-2250 | 3 | Standard Chartered | Baseline Model |
| 22106999 | chromebook | Financial Information Service Co. Ltd. | MOD-2256 | 4 | Taito America Corporation | Distributed Cluster |

**View `v_connectivity_provider_school`**

```sql
CREATE VIEW v_connectivity_provider_school AS
SELECT a.id, a.provider_id, a.name, a.service_type, b.id AS school_id, b.school_id AS school_school_id, b.name AS school_name
FROM connectivity_providers a JOIN schools b ON a.school_id = b.id;
```

| id | provider_id | name | service_type | school_id | school_school_id | school_name |
|---|---|---|---|---|---|---|
| 1 | 3717633 | Extended Review | broadband | 100 | 1152671 | Extended Review |
| 2 | ChIJYRd8uPtt5kcRunQjrWb4IKs | Pilot Initiative A | satellite | 101 | 1186099 | Pilot Initiative A |
| 3 | 8928519 | Baseline Model | mobile | 102 | 7441154 | Baseline Model |
| 4 | lu_tax_code_template_m13 | Distributed Cluster | fiber | 103 | 338514 | Distributed Cluster |

**View `v_connectivity_provider_country`**

```sql
CREATE VIEW v_connectivity_provider_country AS
SELECT a.id, a.provider_id, a.name, a.service_type, b.id AS country_id, b.country_code AS country_country_code, b.name AS country_name
FROM connectivity_providers a JOIN countries b ON a.country_id = b.id;
```

| id | provider_id | name | service_type | country_id | country_country_code | country_name |
|---|---|---|---|---|---|---|
| 1 | 3717633 | Extended Review | broadband | 1000 | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Extended Review |
| 2 | ChIJYRd8uPtt5kcRunQjrWb4IKs | Pilot Initiative A | satellite | 1001 | lu_tax_code_template_m_I_2 | Pilot Initiative A |
| 3 | 8928519 | Baseline Model | mobile | 1002 | default_chart_a_account_57 | Baseline Model |
| 4 | lu_tax_code_template_m13 | Distributed Cluster | fiber | 1003 | 727045 | Distributed Cluster |

**View `v_country_school`**

```sql
CREATE VIEW v_country_school AS
SELECT a.id, a.country_code, a.name, a.region, b.id AS school_id, b.school_id AS school_school_id, b.name AS school_name
FROM countries a JOIN schools b ON a.school_id = b.id;
```

| id | country_code | name | region | school_id | school_school_id | school_name |
|---|---|---|---|---|---|---|
| 1000 | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Extended Review | distributed-region-12 | 100 | 1152671 | Extended Review |
| 1001 | lu_tax_code_template_m_I_2 | Pilot Initiative A | baseline-region-13 | 101 | 1186099 | Pilot Initiative A |
| 1002 | default_chart_a_account_57 | Baseline Model | pilot-region-14 | 102 | 7441154 | Baseline Model |
| 1003 | 727045 | Distributed Cluster | extended-region-15 | 103 | 338514 | Distributed Cluster |

**View `v_country_connectivity_provider`**

```sql
CREATE VIEW v_country_connectivity_provider AS
SELECT a.id, a.country_code, a.name, a.region, b.id AS provider_id, b.provider_id AS provider_provider_id, b.name AS provider_name
FROM countries a JOIN connectivity_providers b ON a.connectivity_provider_id = b.id;
```

| id | country_code | name | region | provider_id | provider_provider_id | provider_name |
|---|---|---|---|---|---|---|
| 1000 | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Extended Review | distributed-region-12 | 1 | 3717633 | Extended Review |
| 1001 | lu_tax_code_template_m_I_2 | Pilot Initiative A | baseline-region-13 | 2 | ChIJYRd8uPtt5kcRunQjrWb4IKs | Pilot Initiative A |
| 1002 | default_chart_a_account_57 | Baseline Model | pilot-region-14 | 3 | 8928519 | Baseline Model |
| 1003 | 727045 | Distributed Cluster | extended-region-15 | 4 | lu_tax_code_template_m13 | Distributed Cluster |

**View `v_supplier_school`**

```sql
CREATE VIEW v_supplier_school AS
SELECT a.id, a.supplier_id, a.name, a.country_of_origin, b.id AS school_id, b.school_id AS school_school_id, b.name AS school_name
FROM suppliers a JOIN schools b ON a.school_id = b.id;
```

| id | supplier_id | name | country_of_origin | school_id | school_school_id | school_name |
|---|---|---|---|---|---|---|
| 1 | Feedback Ratings | Extended Review | compact-country-80 | 100 | 1152671 | Extended Review |
| 2 | Hinduja Group | Pilot Initiative A | composite-country-81 | 101 | 1186099 | Pilot Initiative A |
| 3 | Standard Chartered | Baseline Model | primary-country-82 | 102 | 7441154 | Baseline Model |
| 4 | Taito America Corporation | Distributed Cluster | adaptive-country-83 | 103 | 338514 | Distributed Cluster |

**View `v_supplier_country`**

```sql
CREATE VIEW v_supplier_country AS
SELECT a.id, a.supplier_id, a.name, a.country_of_origin, b.id AS country_id, b.country_code AS country_country_code, b.name AS country_name
FROM suppliers a JOIN countries b ON a.country_id = b.id;
```

| id | supplier_id | name | country_of_origin | country_id | country_country_code | country_name |
|---|---|---|---|---|---|---|
| 1 | Feedback Ratings | Extended Review | compact-country-80 | 1000 | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Extended Review |
| 2 | Hinduja Group | Pilot Initiative A | composite-country-81 | 1001 | lu_tax_code_template_m_I_2 | Pilot Initiative A |
| 3 | Standard Chartered | Baseline Model | primary-country-82 | 1002 | default_chart_a_account_57 | Baseline Model |
| 4 | Taito America Corporation | Distributed Cluster | adaptive-country-83 | 1003 | 727045 | Distributed Cluster |
