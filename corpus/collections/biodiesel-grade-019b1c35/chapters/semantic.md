## Ontology-Grounded Relational Modelling of the Biodiesel Quality Pipeline

The biodiesel quality pipeline tracks a substance from feedstock through production, storage, sampling, and ASTM-standardised testing. Six base tables capture the lifecycle: `biodiesel_grades` defines the specification envelopes; `fuel_properties` records the measurable attributes of each grade; `fuel_samples` anchors individual laboratory specimens; `production_batches` documents the manufacturing runs; `a_s_t_m_test_methods` enumerates the test protocols; and `storage_tanks` holds the physical vessels. A single junction table, `batches_samples`, resolves the many-to-many relationship between batches and samples. The following sections walk through the entity types, their columns, the foreign-key topology, and the twelve materialised views that reconstruct domain facts from the normalised schema.

**Table `biodiesel_grades`**

| id | grade_code | sulfur_limit | flash_point_min | cetane_min | cloud_point_max | acid_number_max | free_glycerin_max | total_glycerin_max | a_s_t_m_test_method_id | fuel_property_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | S15 | 0.015 | 8.20 | 13 | 19.45 | 19.70 | 19.20 | 9.20 | 1 | 1000 |
| 2 | S500 | 0.500 | 11.40 | 16 | 21.90 | 22.40 | 21.40 | 13.40 | 2 | 1001 |
| 3 | S15 | 0.015 | 14.60 | 19 | 24.35 | 25.10 | 23.60 | 17.60 | 3 | 1002 |
| 4 | S500 | 0.500 | 17.80 | 22 | 26.80 | 27.80 | 25.80 | 21.80 | 4 | 1003 |

The `biodiesel_grades` table is the specification anchor. Each row defines a grade envelope with a `grade_code` such as `S15` or `S500`, and a suite of numeric limits: `sulfur_limit` (0.015 for S15, 0.500 for S500), `flash_point_min` (8.20 to 17.80), `cetane_min` (13 to 22), `cloud_point_max` (19.45 to 26.80), `acid_number_max` (19.70 to 27.80), `free_glycerin_max` (19.20 to 25.80), and `total_glycerin_max` (9.20 to 21.80). The surrogate key `id` (1–4) is referenced by downstream tables. Two foreign keys extend the grade's reach: `a_s_t_m_test_method_id` points to `a_s_t_m_test_methods.id`, binding each grade to a default test protocol (AST-2519 through AST-2525), and `fuel_property_id` points to `fuel_properties.fuel_property_id`, linking the grade to its primary property record (1000–1003). This dual linkage means a single grade row simultaneously declares its numeric limits, its governing test method, and its canonical property descriptor.

**Table `fuel_properties`**

| fuel_property_id | property_name | specification_limit | unit_of_measure | is_critical | test_condition | biodiesel_grade_id | fuel_sample_id |
|---|---|---|---|---|---|---|---|
| 1000 | Baseline Standard D | 7.95 | composite-unit-69 | false | primary-test-58 | 1 | 1000 |
| 1001 | Distributed Framework | 11.90 | primary-unit-70 | true | adaptive-test-59 | 2 | 1001 |
| 1002 | Adaptive Protocol | 15.85 | adaptive-unit-71 | false | distributed-test-60 | 3 | 1002 |
| 1003 | Primary Programme A | 19.80 | distributed-unit-72 | true | baseline-test-61 | 4 | 1003 |

`fuel_properties` stores the measurable attribute records. Each row carries a `property_name` — for example, `Baseline Standard D` or `Distributed Framework` — along with a `specification_limit` (7.95 to 19.80), a `unit_of_measure` such as `composite-unit-69` or `primary-unit-70`, a boolean `is_critical` flag, and a `test_condition` like `primary-test-58`. The surrogate key `fuel_property_id` (1000–1003) is the target of the `fuel_property_id` FK in `biodiesel_grades` and also appears as a column in `fuel_samples`, `a_s_t_m_test_methods`, and `storage_tanks`, making it a cross-cutting identifier. Two additional FK columns, `biodiesel_grade_id` and `fuel_sample_id`, create a bidirectional bridge: `biodiesel_grade_id` points back to `biodiesel_grades.id`, while `fuel_sample_id` points to `fuel_samples.id`, thereby tying each property record to both the grade it describes and the sample it was measured against.

**Table `fuel_samples`**

| id | sample_id | collection_date | source_batch_id | storage_temperature | sample_volume | sample_status | fuel_property_id | production_batch_id | a_s_t_m_test_method_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 1562854 | 2025-12-17T11:57:00 | 40c1e50ce74c42d6801b1e2f409c1cfc | 0.625 | 10.20 | pending | 1000 | 1 | 1 |
| 1001 | 726043 | 2022-05-01T18:14:00 | 4463640 | 0.6 | 12.40 | testing | 1001 | 2 | 2 |
| 1002 | 89106 | 2023-10-12T01:31:00 | 505985 | 0.07500005 | 14.60 | complete | 1002 | 3 | 3 |
| 1003 | 10966221 | 2024-03-23T08:48:00 | 4180951 | 0.331550802139037 | 16.80 | failed | 1003 | 4 | 4 |

`fuel_samples` is the operational heart of the pipeline. Each row represents a physical specimen collected from a production batch. The `sample_id` column holds human-readable identifiers such as `1562854` or `726043`, while `collection_date` records the timestamp (e.g., `2025-12-17T11:57:00`). The `source_batch_id` column carries a UUID-like string (`40c1e50ce74c42d6801b1e2f409c1cfc`) that traces the sample back to its originating batch. Additional columns capture `storage_temperature` (0.075 to 0.625), `sample_volume` (10.20 to 16.80), and `sample_status` (`pending`, `testing`, `complete`, or `failed`). The surrogate `id` (1000–1003) is referenced by `fuel_properties`, `a_s_t_m_test_methods`, and `storage_tanks`. Three FK columns — `fuel_property_id`, `production_batch_id`, and `a_s_t_m_test_method_id` — link the sample to its property record, its manufacturing batch, and the ASTM test method applied.

**Table `production_batches`**

| production_batch_id | batch_id | production_date | production_facility_id | total_volume | feedstock_type | batch_status | biodiesel_grade_id | tank_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 050bdfa8-8fc7-11eb-924d-9cd76263cbd0 | 2025-04-06T03:21:00 | 407 | 4.20 | legacy-feedstoc-67 | in_progress | 1 | 4060653 |
| 2 | 2087741 | 2022-09-17T10:38:00 | Harga | 8.40 | compact-feedstoc-68 | completed | 2 | 9246320 |
| 3 | 2106724 | 2023-02-01T17:55:00 | ChIJd13ymnZu5kcRXM7jx5boJBs | 12.60 | composite-feedstoc-69 | quarantined | 3 | 8387534 |
| 4 | 4060663 | 2024-07-12T00:12:00 | 8350008 | 16.80 | primary-feedstoc-70 | released | 4 | id_5 |

`production_batches` documents each manufacturing run. The `batch_id` column holds UUIDs such as `050bdfa8-8fc7-11eb-924d-9cd76263cbd0`, while `production_date` records when the batch was created (e.g., `2025-04-06T03:21:00`). The `production_facility_id` can be numeric (`407`, `8350008`) or textual (`Harga`, `ChIJd13ymnZu5kcRXM7jx5boJBs`). The `total_volume` ranges from 4.20 to 16.80, `feedstock_type` describes the input material (`legacy-feedstoc-67` through `primary-feedstoc-70`), and `batch_status` tracks lifecycle state (`in_progress`, `completed`, `quarantined`, `released`). The surrogate `production_batch_id` (1–4) is referenced by `fuel_samples` and `storage_tanks`. Two FK columns extend the batch's reach: `biodiesel_grade_id` points to `biodiesel_grades.id`, declaring which grade specification the batch targets, and `tank_id` points to `storage_tanks.tank_id`, identifying the storage vessel.

**Table `a_s_t_m_test_methods`**

| id | astm_number | method_description | applicable_grade | is_b_q9000_critical | fuel_property_id | fuel_sample_id |
|---|---|---|---|---|---|---|
| 1 | AST-2519 | Primary Framework A | compact-applicab-20 | true | 1000 | 1000 |
| 2 | AST-2521 | Composite Protocol | composite-applicab-21 | false | 1001 | 1001 |
| 3 | AST-2523 | Compact Programme | primary-applicab-22 | true | 1002 | 1002 |
| 4 | AST-2525 | Legacy Standard D | adaptive-applicab-23 | false | 1003 | 1003 |

`a_s_t_m_test_methods` enumerates the ASTM-standardised test protocols. Each row carries an `astm_number` (AST-2519 through AST-2525), a `method_description` such as `Primary Framework A` or `Composite Protocol`, and an `applicable_grade` field (`compact-applicab-20` through `adaptive-applicab-23`). The boolean `is_b_q9000_critical` flag indicates whether the method is critical to the BQ-9000 certification. The surrogate `id` (1–4) is referenced by `biodiesel_grades` and `fuel_samples`. Two FK columns — `fuel_property_id` and `fuel_sample_id` — link each test method to the property it measures and the sample it was performed on.

**Table `storage_tanks`**

| tank_id | tank_capacity | current_fill_level | tank_material | last_inspection_date | tank_status | production_batch_id | fuel_sample_id |
|---|---|---|---|---|---|---|---|
| 4060653 | 6.20 | 8.70 | compact-tank-92 | 2025-04-12 | active | 1 | 1000 |
| 9246320 | 9.40 | 12.40 | composite-tank-93 | 2022-09-23 | maintenance | 2 | 1001 |
| 8387534 | 12.60 | 16.10 | primary-tank-94 | 2023-02-07 | decommissioned | 3 | 1002 |
| id_5 | 15.80 | 19.80 | adaptive-tank-95 | 2024-07-18 | active | 4 | 1003 |

`storage_tanks` captures the physical storage infrastructure. Each row has a `tank_id` (e.g., `4060653`, `9246320`, `id_5`), a `tank_capacity` (6.20 to 15.80), a `current_fill_level` (8.70 to 19.80), a `tank_material` (`compact-tank-92` through `adaptive-tank-95`), and a `last_inspection_date` (2022-09-23 to 2025-04-12). The `tank_status` column tracks operational state (`active`, `maintenance`, `decommissioned`). The surrogate `tank_id` is referenced by `production_batches.tank_id`. Two FK columns — `production_batch_id` and `fuel_sample_id` — link each tank to the batch it stores and the sample associated with that batch.

**Table `batches_samples`**

| production_batch_id | fuel_sample_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `batches_samples` junction table resolves the many-to-many relationship between `production_batches` and `fuel_samples`. In this particular dataset each batch maps to exactly one sample, but the junction structure permits multiple samples per batch and vice versa. The table's composite key comprises `production_batch_id` (FK to `production_batches.production_batch_id`) and `fuel_sample_id` (FK to `fuel_samples.id`), ensuring referential integrity across the join.

The foreign-key topology forms a tightly coupled graph. `biodiesel_grades` sits at the centre, linked to `a_s_t_m_test_methods` and `fuel_properties` via its own FK columns, while simultaneously being referenced by `production_batches.biodiesel_grade_id` and `fuel_properties.biodiesel_grade_id`. `fuel_properties` bridges grades and samples through its bidirectional FKs. `fuel_samples` connects to `production_batches`, `fuel_properties`, and `a_s_t_m_test_methods`. `production_batches` links to `biodiesel_grades` and `storage_tanks`. `storage_tanks` points back to `production_batches` and `fuel_samples`. `a_s_t_m_test_methods` links to `fuel_properties` and `fuel_samples`. This web of references ensures that any domain fact — a grade's limits, a sample's test result, a batch's storage location — can be reconstructed by joining the appropriate tables.

The twelve materialised views flatten selected slices of this graph into queryable surfaces. Each view answers a specific analytical question by joining two or three base tables.

**View `v_biodiesel_grade_a_s_t_m_test_method`**

```sql
CREATE VIEW v_biodiesel_grade_a_s_t_m_test_method AS
SELECT a.id, a.grade_code, a.sulfur_limit, a.flash_point_min, b.id AS method_id, b.astm_number AS method_astm_number, b.method_description AS method_method_description
FROM biodiesel_grades a JOIN a_s_t_m_test_methods b ON a.a_s_t_m_test_method_id = b.id;
```

| id | grade_code | sulfur_limit | flash_point_min | method_id | method_astm_number | method_method_description |
|---|---|---|---|---|---|---|
| 1 | S15 | 0.015 | 8.20 | 1 | AST-2519 | Primary Framework A |
| 2 | S500 | 0.500 | 11.40 | 2 | AST-2521 | Composite Protocol |
| 3 | S15 | 0.015 | 14.60 | 3 | AST-2523 | Compact Programme |
| 4 | S500 | 0.500 | 17.80 | 4 | AST-2525 | Legacy Standard D |

This view joins `biodiesel_grades` to `a_s_t_m_test_methods` on `a_s_t_m_test_method_id`, producing a grade-to-test-method mapping. Row 1 shows grade `S15` (id 1) bound to test method `AST-2519` (`Primary Framework A`), confirming that the S15 specification mandates this protocol. Row 2 shows grade `S500` (id 2) bound to `AST-2521` (`Composite Protocol`). The view answers the question: "Which ASTM test method is associated with each biodiesel grade?"

**View `v_biodiesel_grade_fuel_property`**

```sql
CREATE VIEW v_biodiesel_grade_fuel_property AS
SELECT a.id, a.grade_code, a.sulfur_limit, a.flash_point_min, b.fuel_property_id AS property_fuel_property_id, b.property_name AS property_property_name, b.specification_limit AS property_specification_limit
FROM biodiesel_grades a JOIN fuel_properties b ON a.fuel_property_id = b.fuel_property_id;
```

| id | grade_code | sulfur_limit | flash_point_min | property_fuel_property_id | property_property_name | property_specification_limit |
|---|---|---|---|---|---|---|
| 1 | S15 | 0.015 | 8.20 | 1000 | Baseline Standard D | 7.95 |
| 2 | S500 | 0.500 | 11.40 | 1001 | Distributed Framework | 11.90 |
| 3 | S15 | 0.015 | 14.60 | 1002 | Adaptive Protocol | 15.85 |
| 4 | S500 | 0.500 | 17.80 | 1003 | Primary Programme A | 19.80 |

This view joins `biodiesel_grades` to `fuel_properties` on `fuel_property_id`, producing a grade-to-property mapping. Row 1 shows grade `S15` (id 1) linked to property `Baseline Standard D` (fuel_property_id 1000) with a specification limit of 7.95. Row 3 shows grade `S15` (id 3) linked to property `Adaptive Protocol` (fuel_property_id 1002) with a limit of 15.85. The view answers: "Which fuel property record corresponds to each biodiesel grade?"

**View `v_fuel_property_biodiesel_grade`**

```sql
CREATE VIEW v_fuel_property_biodiesel_grade AS
SELECT a.fuel_property_id, a.property_name, a.specification_limit, a.unit_of_measure, b.id AS grade_id, b.grade_code AS grade_grade_code, b.sulfur_limit AS grade_sulfur_limit
FROM fuel_properties a JOIN biodiesel_grades b ON a.biodiesel_grade_id = b.id;
```

| fuel_property_id | property_name | specification_limit | unit_of_measure | grade_id | grade_grade_code | grade_sulfur_limit |
|---|---|---|---|---|---|---|
| 1000 | Baseline Standard D | 7.95 | composite-unit-69 | 1 | S15 | 0.015 |
| 1001 | Distributed Framework | 11.90 | primary-unit-70 | 2 | S500 | 0.500 |
| 1002 | Adaptive Protocol | 15.85 | adaptive-unit-71 | 3 | S15 | 0.015 |
| 1003 | Primary Programme A | 19.80 | distributed-unit-72 | 4 | S500 | 0.500 |

This is the inverse of the previous view: it joins `fuel_properties` to `biodiesel_grades` on `biodiesel_grade_id`, producing a property-to-grade mapping. Row 1 shows property `Baseline Standard D` (1000) belonging to grade `S15` (id 1). Row 2 shows property `Distributed Framework` (1001) belonging to grade `S500` (id 2). The view answers: "Which biodiesel grade does each fuel property describe?"

**View `v_fuel_property_fuel_sample`**

```sql
CREATE VIEW v_fuel_property_fuel_sample AS
SELECT a.fuel_property_id, a.property_name, a.specification_limit, a.unit_of_measure, b.id AS sample_id, b.sample_id AS sample_sample_id, b.collection_date AS sample_collection_date
FROM fuel_properties a JOIN fuel_samples b ON a.fuel_sample_id = b.id;
```

| fuel_property_id | property_name | specification_limit | unit_of_measure | sample_id | sample_sample_id | sample_collection_date |
|---|---|---|---|---|---|---|
| 1000 | Baseline Standard D | 7.95 | composite-unit-69 | 1000 | 1562854 | 2025-12-17T11:57:00 |
| 1001 | Distributed Framework | 11.90 | primary-unit-70 | 1001 | 726043 | 2022-05-01T18:14:00 |
| 1002 | Adaptive Protocol | 15.85 | adaptive-unit-71 | 1002 | 89106 | 2023-10-12T01:31:00 |
| 1003 | Primary Programme A | 19.80 | distributed-unit-72 | 1003 | 10966221 | 2024-03-23T08:48:00 |

This view joins `fuel_properties` to `fuel_samples` on `fuel_sample_id`, producing a property-to-sample mapping. Row 1 shows property `Baseline Standard D` (1000) measured against sample `1562854` (id 1000), collected on `2025-12-17T11:57:00` with status `pending`. Row 4 shows property `Primary Programme A` (1003) measured against sample `10966221` (id 1003), collected on `2024-03-23T08:48:00` with status `failed`. The view answers: "Which fuel sample was each property record measured against?"

**View `v_fuel_sample_fuel_property`**

```sql
CREATE VIEW v_fuel_sample_fuel_property AS
SELECT a.id, a.sample_id, a.collection_date, a.source_batch_id, b.fuel_property_id AS property_fuel_property_id, b.property_name AS property_property_name, b.specification_limit AS property_specification_limit
FROM fuel_samples a JOIN fuel_properties b ON a.fuel_property_id = b.fuel_property_id;
```

| id | sample_id | collection_date | source_batch_id | property_fuel_property_id | property_property_name | property_specification_limit |
|---|---|---|---|---|---|---|
| 1000 | 1562854 | 2025-12-17T11:57:00 | 40c1e50ce74c42d6801b1e2f409c1cfc | 1000 | Baseline Standard D | 7.95 |
| 1001 | 726043 | 2022-05-01T18:14:00 | 4463640 | 1001 | Distributed Framework | 11.90 |
| 1002 | 89106 | 2023-10-12T01:31:00 | 505985 | 1002 | Adaptive Protocol | 15.85 |
| 1003 | 10966221 | 2024-03-23T08:48:00 | 4180951 | 1003 | Primary Programme A | 19.80 |

This is the inverse of the previous view: it joins `fuel_samples` to `fuel_properties` on `fuel_property_id`, producing a sample-to-property mapping. Row 1 shows sample `1562854` (id 1000) linked to property `Baseline Standard D` (1000). Row 3 shows sample `89106` (id 1002) linked to property `Adaptive Protocol` (1002). The view answers: "Which fuel property does each sample correspond to?"

**View `v_fuel_sample_production_batch`**

```sql
CREATE VIEW v_fuel_sample_production_batch AS
SELECT a.id, a.sample_id, a.collection_date, a.source_batch_id, b.production_batch_id AS batch_production_batch_id, b.batch_id AS batch_batch_id, b.production_date AS batch_production_date
FROM fuel_samples a JOIN production_batches b ON a.production_batch_id = b.production_batch_id;
```

| id | sample_id | collection_date | source_batch_id | batch_production_batch_id | batch_batch_id | batch_production_date |
|---|---|---|---|---|---|---|
| 1000 | 1562854 | 2025-12-17T11:57:00 | 40c1e50ce74c42d6801b1e2f409c1cfc | 1 | 050bdfa8-8fc7-11eb-924d-9cd76263cbd0 | 2025-04-06T03:21:00 |
| 1001 | 726043 | 2022-05-01T18:14:00 | 4463640 | 2 | 2087741 | 2022-09-17T10:38:00 |
| 1002 | 89106 | 2023-10-12T01:31:00 | 505985 | 3 | 2106724 | 2023-02-01T17:55:00 |
| 1003 | 10966221 | 2024-03-23T08:48:00 | 4180951 | 4 | 4060663 | 2024-07-12T00:12:00 |

This view joins `fuel_samples` to `production_batches` on `production_batch_id`, producing a sample-to-batch mapping. Row 1 shows sample `1562854` (id 1000) originating from batch `050bdfa8-8fc7-11eb-924d-9cd76263cbd0` (production_batch_id 1), produced on `2025-04-06T03:21:00` at facility `407` with volume 4.20. Row 2 shows sample `726043` (id 1001) from batch `2087741` (production_batch_id 2), produced on `2022-09-17T10:38:00` at facility `Harga` with volume 8.40. The view answers: "Which production batch did each fuel sample come from?"

**View `v_fuel_sample_a_s_t_m_test_method`**

```sql
CREATE VIEW v_fuel_sample_a_s_t_m_test_method AS
SELECT a.id, a.sample_id, a.collection_date, a.source_batch_id, b.id AS method_id, b.astm_number AS method_astm_number, b.method_description AS method_method_description
FROM fuel_samples a JOIN a_s_t_m_test_methods b ON a.a_s_t_m_test_method_id = b.id;
```

| id | sample_id | collection_date | source_batch_id | method_id | method_astm_number | method_method_description |
|---|---|---|---|---|---|---|
| 1000 | 1562854 | 2025-12-17T11:57:00 | 40c1e50ce74c42d6801b1e2f409c1cfc | 1 | AST-2519 | Primary Framework A |
| 1001 | 726043 | 2022-05-01T18:14:00 | 4463640 | 2 | AST-2521 | Composite Protocol |
| 1002 | 89106 | 2023-10-12T01:31:00 | 505985 | 3 | AST-2523 | Compact Programme |
| 1003 | 10966221 | 2024-03-23T08:48:00 | 4180951 | 4 | AST-2525 | Legacy Standard D |

This view joins `fuel_samples` to `a_s_t_m_test_methods` on `a_s_t_m_test_method_id`, producing a sample-to-test-method mapping. Row 1 shows sample `1562854` (id 1000) tested with `AST-2519` (`Primary Framework A`), which is marked as BQ-9000 critical. Row 3 shows sample `89106` (id 1002) tested with `AST-2523` (`Compact Programme`), also BQ-9000 critical. The view answers: "Which ASTM test method was applied to each fuel sample?"

**View `v_production_batch_fuel_sample_detail`**

```sql
CREATE VIEW v_production_batch_fuel_sample_detail AS
SELECT a.production_batch_id, a.batch_id, a.production_date, b.id AS sample_id, b.sample_id AS sample_sample_id, b.collection_date AS sample_collection_date
FROM production_batches a
  JOIN batches_samples j ON j.production_batch_id = a.production_batch_id
  JOIN fuel_samples b ON b.id = j.fuel_sample_id;
```

| production_batch_id | batch_id | production_date | sample_id | sample_sample_id | sample_collection_date |
|---|---|---|---|---|---|
| 1 | 050bdfa8-8fc7-11eb-924d-9cd76263cbd0 | 2025-04-06T03:21:00 | 1000 | 1562854 | 2025-12-17T11:57:00 |
| 1 | 050bdfa8-8fc7-11eb-924d-9cd76263cbd0 | 2025-04-06T03:21:00 | 1001 | 726043 | 2022-05-01T18:14:00 |
| 2 | 2087741 | 2022-09-17T10:38:00 | 1001 | 726043 | 2022-05-01T18:14:00 |
| 2 | 2087741 | 2022-09-17T10:38:00 | 1002 | 89106 | 2023-10-12T01:31:00 |
| 3 | 2106724 | 2023-02-01T17:55:00 | 1002 | 89106 | 2023-10-12T01:31:00 |
| 3 | 2106724 | 2023-02-01T17:55:00 | 1003 | 10966221 | 2024-03-23T08:48:00 |
| 4 | 4060663 | 2024-07-12T00:12:00 | 1003 | 10966221 | 2024-03-23T08:48:00 |
| 4 | 4060663 | 2024-07-12T00:12:00 | 1000 | 1562854 | 2025-12-17T11:57:00 |

This view joins `production_batches` to `fuel_samples` on `production_batch_id`, producing a detailed batch-to-sample view. Row 1 shows batch `050bdfa8-8fc7-11eb-924d-9cd76263cbd0` (production_batch_id 1) linked to sample `1562854` (id 1000), with the batch at facility `407`, volume 4.20, status `in_progress`, and the sample collected on `2025-12-17T11:57:00` with volume 10.20 and status `pending`. Row 4 shows batch `4060663` (production_batch_id 4) linked to sample `10966221` (id 1003), with the batch at facility `8350008`, volume 16.80, status `released`, and the sample collected on `2024-03-23T08:48:00` with volume 16.80 and status `failed`. The view answers: "What are the full details of each production batch and its associated sample?"

**View `v_production_batch_biodiesel_grade`**

```sql
CREATE VIEW v_production_batch_biodiesel_grade AS
SELECT a.production_batch_id, a.batch_id, a.production_date, a.production_facility_id, b.id AS grade_id, b.grade_code AS grade_grade_code, b.sulfur_limit AS grade_sulfur_limit
FROM production_batches a JOIN biodiesel_grades b ON a.biodiesel_grade_id = b.id;
```

| production_batch_id | batch_id | production_date | production_facility_id | grade_id | grade_grade_code | grade_sulfur_limit |
|---|---|---|---|---|---|---|
| 1 | 050bdfa8-8fc7-11eb-924d-9cd76263cbd0 | 2025-04-06T03:21:00 | 407 | 1 | S15 | 0.015 |
| 2 | 2087741 | 2022-09-17T10:38:00 | Harga | 2 | S500 | 0.500 |
| 3 | 2106724 | 2023-02-01T17:55:00 | ChIJd13ymnZu5kcRXM7jx5boJBs | 3 | S15 | 0.015 |
| 4 | 4060663 | 2024-07-12T00:12:00 | 8350008 | 4 | S500 | 0.500 |

This view joins `production_batches` to `biodiesel_grades` on `biodiesel_grade_id`, producing a batch-to-grade mapping. Row 1 shows batch `050bdfa8-8fc7-11eb-924d-9cd76263cbd0` (production_batch_id 1) targeting grade `S15` (id 1) with sulfur limit 0.015 and cetane minimum 13. Row 3 shows batch `2106724` (production_batch_id 3) targeting grade `S15` (id 3) with sulfur limit 0.015 and cetane minimum 19. The view answers: "Which biodiesel grade specification does each production batch target?"

**View `v_production_batch_storage_tank`**

```sql
CREATE VIEW v_production_batch_storage_tank AS
SELECT a.production_batch_id, a.batch_id, a.production_date, a.production_facility_id, b.tank_id AS tank_tank_id, b.tank_capacity AS tank_tank_capacity, b.current_fill_level AS tank_current_fill_level
FROM production_batches a JOIN storage_tanks b ON a.tank_id = b.tank_id;
```

| production_batch_id | batch_id | production_date | production_facility_id | tank_tank_id | tank_tank_capacity | tank_current_fill_level |
|---|---|---|---|---|---|---|
| 1 | 050bdfa8-8fc7-11eb-924d-9cd76263cbd0 | 2025-04-06T03:21:00 | 407 | 4060653 | 6.20 | 8.70 |
| 2 | 2087741 | 2022-09-17T10:38:00 | Harga | 9246320 | 9.40 | 12.40 |
| 3 | 2106724 | 2023-02-01T17:55:00 | ChIJd13ymnZu5kcRXM7jx5boJBs | 8387534 | 12.60 | 16.10 |
| 4 | 4060663 | 2024-07-12T00:12:00 | 8350008 | id_5 | 15.80 | 19.80 |

This view joins `production_batches` to `storage_tanks` on `tank_id`, producing a batch-to-tank mapping. Row 1 shows batch `050bdfa8-8fc7-11eb-924d-9cd76263cbd0` (production_batch_id 1) stored in tank `4060653` with capacity 6.20, fill level 8.70, material `compact-tank-92`, and status `active`. Row 3 shows batch `2106724` (production_batch_id 3) stored in tank `8387534` with capacity 12.60, fill level 16.10, material `primary-tank-94`, and status `decommissioned`. The view answers: "Which storage tank is assigned to each production batch?"

**View `v_a_s_t_m_test_method_fuel_property`**

```sql
CREATE VIEW v_a_s_t_m_test_method_fuel_property AS
SELECT a.id, a.astm_number, a.method_description, a.applicable_grade, b.fuel_property_id AS property_fuel_property_id, b.property_name AS property_property_name, b.specification_limit AS property_specification_limit
FROM a_s_t_m_test_methods a JOIN fuel_properties b ON a.fuel_property_id = b.fuel_property_id;
```

| id | astm_number | method_description | applicable_grade | property_fuel_property_id | property_property_name | property_specification_limit |
|---|---|---|---|---|---|---|
| 1 | AST-2519 | Primary Framework A | compact-applicab-20 | 1000 | Baseline Standard D | 7.95 |
| 2 | AST-2521 | Composite Protocol | composite-applicab-21 | 1001 | Distributed Framework | 11.90 |
| 3 | AST-2523 | Compact Programme | primary-applicab-22 | 1002 | Adaptive Protocol | 15.85 |
| 4 | AST-2525 | Legacy Standard D | adaptive-applicab-23 | 1003 | Primary Programme A | 19.80 |

This view joins `a_s_t_m_test_methods` to `fuel_properties` on `fuel_property_id`, producing a test-method-to-property mapping. Row 1 shows test method `AST-2519` (`Primary Framework A`) linked to property `Baseline Standard D` (1000) with specification limit 7.95. Row 3 shows test method `AST-2523` (`Compact Programme`) linked to property `Adaptive Protocol` (1002) with specification limit 15.85. The view answers: "Which fuel property does each ASTM test method measure?"

**View `v_a_s_t_m_test_method_fuel_sample`**

```sql
CREATE VIEW v_a_s_t_m_test_method_fuel_sample AS
SELECT a.id, a.astm_number, a.method_description, a.applicable_grade, b.id AS sample_id, b.sample_id AS sample_sample_id, b.collection_date AS sample_collection_date
FROM a_s_t_m_test_methods a JOIN fuel_samples b ON a.fuel_sample_id = b.id;
```

| id | astm_number | method_description | applicable_grade | sample_id | sample_sample_id | sample_collection_date |
|---|---|---|---|---|---|---|
| 1 | AST-2519 | Primary Framework A | compact-applicab-20 | 1000 | 1562854 | 2025-12-17T11:57:00 |
| 2 | AST-2521 | Composite Protocol | composite-applicab-21 | 1001 | 726043 | 2022-05-01T18:14:00 |
| 3 | AST-2523 | Compact Programme | primary-applicab-22 | 1002 | 89106 | 2023-10-12T01:31:00 |
| 4 | AST-2525 | Legacy Standard D | adaptive-applicab-23 | 1003 | 10966221 | 2024-03-23T08:48:00 |

This view joins `a_s_t_m_test_methods` to `fuel_samples` on `fuel_sample_id`, producing a test-method-to-sample mapping. Row 1 shows test method `AST-2519` (`Primary Framework A`) applied to sample `1562854` (id 1000), collected on `2025-12-17T11:57:00` with status `pending`. Row 4 shows test method `AST-2525` (`Legacy Standard D`) applied to sample `10966221` (id 1003), collected on `2024-03-23T08:48:00` with status `failed`. The view answers: "Which fuel sample was each ASTM test method performed on?"

**View `v_storage_tank_production_batch`**

```sql
CREATE VIEW v_storage_tank_production_batch AS
SELECT a.tank_id, a.tank_capacity, a.current_fill_level, a.tank_material, b.production_batch_id AS batch_production_batch_id, b.batch_id AS batch_batch_id, b.production_date AS batch_production_date
FROM storage_tanks a JOIN production_batches b ON a.production_batch_id = b.production_batch_id;
```

| tank_id | tank_capacity | current_fill_level | tank_material | batch_production_batch_id | batch_batch_id | batch_production_date |
|---|---|---|---|---|---|---|
| 4060653 | 6.20 | 8.70 | compact-tank-92 | 1 | 050bdfa8-8fc7-11eb-924d-9cd76263cbd0 | 2025-04-06T03:21:00 |
| 9246320 | 9.40 | 12.40 | composite-tank-93 | 2 | 2087741 | 2022-09-17T10:38:00 |
| 8387534 | 12.60 | 16.10 | primary-tank-94 | 3 | 2106724 | 2023-02-01T17:55:00 |
| id_5 | 15.80 | 19.80 | adaptive-tank-95 | 4 | 4060663 | 2024-07-12T00:12:00 |

This view joins `storage_tanks` to `production_batches` on `production_batch_id`, producing a tank-to-batch mapping. Row 1 shows tank `4060653` (capacity 6.20, status `active`) storing batch `050bdfa8-8fc7-11eb-924d-9cd76263cbd0` (production_batch_id 1), produced on `2025-04-06T03:21:00` at facility `407` with volume 4.20. Row 4 shows tank `id_5` (capacity 15.80, status `active`) storing batch `4060663` (production_batch_id 4), produced on `2024-07-12T00:12:00` at facility `8350008` with volume 16.80. The view answers: "Which production batch is stored in each tank?"

**View `v_storage_tank_fuel_sample`**

```sql
CREATE VIEW v_storage_tank_fuel_sample AS
SELECT a.tank_id, a.tank_capacity, a.current_fill_level, a.tank_material, b.id AS sample_id, b.sample_id AS sample_sample_id, b.collection_date AS sample_collection_date
FROM storage_tanks a JOIN fuel_samples b ON a.fuel_sample_id = b.id;
```

| tank_id | tank_capacity | current_fill_level | tank_material | sample_id | sample_sample_id | sample_collection_date |
|---|---|---|---|---|---|---|
| 4060653 | 6.20 | 8.70 | compact-tank-92 | 1000 | 1562854 | 2025-12-17T11:57:00 |
| 9246320 | 9.40 | 12.40 | composite-tank-93 | 1001 | 726043 | 2022-05-01T18:14:00 |
| 8387534 | 12.60 | 16.10 | primary-tank-94 | 1002 | 89106 | 2023-10-12T01:31:00 |
| id_5 | 15.80 | 19.80 | adaptive-tank-95 | 1003 | 10966221 | 2024-03-23T08:48:00 |

This view joins `storage_tanks` to `fuel_samples` on `fuel_sample_id`, producing a tank-to-sample mapping. Row 1 shows tank `4060653` (capacity 6.20, material `compact-tank-92`) associated with sample `1562854` (id 1000), collected on `2025-12-17T11:57:00` with volume 10.20. Row 3 shows tank `8387534` (capacity 12.60, material `primary-tank-94`) associated with sample `89106` (id 1002), collected on `2023-10-12T01:31:00` with volume 14.60. The view answers: "Which fuel sample is associated with each storage tank?"

The schema demonstrates a disciplined normalisation strategy. Each entity type — grades, properties, samples, batches, test methods, tanks — occupies its own table with a surrogate key and a focused set of attributes. Foreign keys encode the relationships: a grade references its test method and property; a property bridges grades and samples; a sample connects to its batch, property, and test method; a batch links to its grade and tank; a tank points back to its batch and sample. The junction table `batches_samples` preserves the many-to-many cardinality between batches and samples. The twelve views materialise the most common analytical joins, allowing downstream consumers to query grade-to-method mappings, sample-to-batch traces, and tank-to-batch assignments without writing explicit join clauses. Every row in every view can be traced back to concrete values in the base tables — the S15 grade with sulfur limit 0.015, the sample `1562854` collected on `2025-12-17`, the batch `050bdfa8-8fc7-11eb-924d-9cd76263cbd0` produced at facility `407`, the tank `4060653` with capacity 6.20 — ensuring that the relational model faithfully reflects the ontology of the biodiesel quality pipeline.