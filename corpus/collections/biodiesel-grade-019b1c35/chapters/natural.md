## Biodiesel Quality Management: Production, Testing, and Storage

Biodiesel quality management spans the entire lifecycle from feedstock conversion through final storage, with every batch tracked through a network of grades, test methods, and physical containers. The domain centers on six foundational record types: biodiesel grades that define permissible limits for sulfur, flash point, cetane number, cloud point, acid number, and glycerin content; fuel properties that capture specification thresholds and their criticality; fuel samples collected at specific dates with measured volumes and statuses; production batches that anchor each lot to a facility, feedstock type, and production date; ASTM test methods that standardize how properties are evaluated; and storage tanks that hold finished product with documented capacities and inspection histories. A linking table, `batches_samples`, connects production batches to their corresponding fuel samples, enabling traceability from the reactor to the analytical bench.

**Table `biodiesel_grades`**

| id | grade_code | sulfur_limit | flash_point_min | cetane_min | cloud_point_max | acid_number_max | free_glycerin_max | total_glycerin_max | a_s_t_m_test_method_id | fuel_property_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | S15 | 0.015 | 8.20 | 13 | 19.45 | 19.70 | 19.20 | 9.20 | 1 | 1000 |
| 2 | S500 | 0.500 | 11.40 | 16 | 21.90 | 22.40 | 21.40 | 13.40 | 2 | 1001 |
| 3 | S15 | 0.015 | 14.60 | 19 | 24.35 | 25.10 | 23.60 | 17.60 | 3 | 1002 |
| 4 | S500 | 0.500 | 17.80 | 22 | 26.80 | 27.80 | 25.80 | 21.80 | 4 | 1003 |

The `biodiesel_grades` table establishes the quality tiers against which all production is measured. Two grade codes recur across the dataset: S15 and S500. The S15 grade at row 1 imposes a sulfur limit of 0.015, a minimum flash point of 8.20, a cetane minimum of 13, a cloud point maximum of 19.45, an acid number maximum of 19.70, and free and total glycerin limits of 19.20 and 9.20 respectively, all evaluated under ASTM method 1 against fuel property 1000. The S500 grade at row 2 relaxes these constraints substantially: sulfur rises to 0.500, flash point to 11.40, cetane to 16, cloud point to 21.90, acid number to 22.40, and glycerin limits to 21.40 and 13.40, tied to method 2 and property 1001. Rows 3 and 4 repeat the S15 and S500 codes but with progressively higher thresholds—cetane reaches 19 and 22 respectively, and all numeric limits increase—demonstrating that grade codes alone do not fully specify a quality tier; the associated ASTM method and fuel property identifiers disambiguate the exact specification set in use.

**Table `fuel_properties`**

| fuel_property_id | property_name | specification_limit | unit_of_measure | is_critical | test_condition | biodiesel_grade_id | fuel_sample_id |
|---|---|---|---|---|---|---|---|
| 1000 | Baseline Standard D | 7.95 | composite-unit-69 | false | primary-test-58 | 1 | 1000 |
| 1001 | Distributed Framework | 11.90 | primary-unit-70 | true | adaptive-test-59 | 2 | 1001 |
| 1002 | Adaptive Protocol | 15.85 | adaptive-unit-71 | false | distributed-test-60 | 3 | 1002 |
| 1003 | Primary Programme A | 19.80 | distributed-unit-72 | true | baseline-test-61 | 4 | 1003 |

Fuel properties serve as the measurement layer that quantifies each grade's requirements. Property 1000, labeled "Baseline Standard D," carries a specification limit of 7.95 in composite-unit-69 and is marked non-critical, tested under primary-test-58. Property 1001, "Distributed Framework," has a limit of 11.90 in primary-unit-70, is flagged as critical, and uses adaptive-test-59. Property 1002, "Adaptive Protocol," sits at 15.85 in adaptive-unit-71, is non-critical, and references distributed-test-60. Property 1003, "Primary Programme A," reaches 19.80 in distributed-unit-72, is critical, and employs baseline-test-61. Each property maps to a specific biodiesel grade and fuel sample, forming the bridge between abstract specification and physical measurement.

**Table `fuel_samples`**

| id | sample_id | collection_date | source_batch_id | storage_temperature | sample_volume | sample_status | fuel_property_id | production_batch_id | a_s_t_m_test_method_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 1562854 | 2025-12-17T11:57:00 | 40c1e50ce74c42d6801b1e2f409c1cfc | 0.625 | 10.20 | pending | 1000 | 1 | 1 |
| 1001 | 726043 | 2022-05-01T18:14:00 | 4463640 | 0.6 | 12.40 | testing | 1001 | 2 | 2 |
| 1002 | 89106 | 2023-10-12T01:31:00 | 505985 | 0.07500005 | 14.60 | complete | 1002 | 3 | 3 |
| 1003 | 10966221 | 2024-03-23T08:48:00 | 4180951 | 0.331550802139037 | 16.80 | failed | 1003 | 4 | 4 |

Fuel samples represent the physical act of sampling from production lots. Sample 1562854, collected on 2025-12-17 at 11:57 from source batch 40c1e50ce74c42d6801b1e2f409c1cfc, was stored at 0.625 with a volume of 10.20 and carries a pending status. Sample 726043, from 2022-05-01 at 18:14, originates from batch 4463640, was stored at 0.6 with volume 12.40, and is in testing status. Sample 89106, collected 2023-10-12 at 01:31 from batch 505985, has storage temperature 0.07500005, volume 14.60, and a complete status. Sample 10966221, from 2024-03-23 at 08:48, comes from batch 4180951, was stored at 0.331550802139037 with volume 16.80, and has failed status. Each sample references a fuel property, a production batch, and an ASTM test method, creating a three-way linkage that ties measurement to specification to production.

**Table `production_batches`**

| production_batch_id | batch_id | production_date | production_facility_id | total_volume | feedstock_type | batch_status | biodiesel_grade_id | tank_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 050bdfa8-8fc7-11eb-924d-9cd76263cbd0 | 2025-04-06T03:21:00 | 407 | 4.20 | legacy-feedstoc-67 | in_progress | 1 | 4060653 |
| 2 | 2087741 | 2022-09-17T10:38:00 | Harga | 8.40 | compact-feedstoc-68 | completed | 2 | 9246320 |
| 3 | 2106724 | 2023-02-01T17:55:00 | ChIJd13ymnZu5kcRXM7jx5boJBs | 12.60 | composite-feedstoc-69 | quarantined | 3 | 8387534 |
| 4 | 4060663 | 2024-07-12T00:12:00 | 8350008 | 16.80 | primary-feedstoc-70 | released | 4 | id_5 |

Production batches anchor the entire quality chain to a specific manufacturing event. Batch 050bdfa8-8fc7-11eb-924d-9cd76263cbd0 was produced on 2025-04-06 at facility 407, with total volume 4.20, using legacy-feedstoc-67, currently in_progress, graded under biodiesel grade 1, and stored in tank 4060653. Batch 2087741, produced 2022-09-17 at facility Harga, has volume 8.40, uses compact-feedstoc-68, is completed, graded under grade 2, and assigned to tank 9246320. Batch 2106724, from 2023-02-01 at facility ChIJd13ymnZu5kcRXM7jx5boJBs, holds 12.60 volume, uses composite-feedstoc-69, is quarantined, graded under grade 3, and stored in tank 8387534. Batch 4060663, produced 2024-07-12 at facility 8350008, has volume 16.80, uses primary-feedstoc-70, is released, graded under grade 4, and stored in tank id_5. The batch_status values—in_progress, completed, quarantined, released—reflect the operational lifecycle of each production lot.

**Table `a_s_t_m_test_methods`**

| id | astm_number | method_description | applicable_grade | is_b_q9000_critical | fuel_property_id | fuel_sample_id |
|---|---|---|---|---|---|---|
| 1 | AST-2519 | Primary Framework A | compact-applicab-20 | true | 1000 | 1000 |
| 2 | AST-2521 | Composite Protocol | composite-applicab-21 | false | 1001 | 1001 |
| 3 | AST-2523 | Compact Programme | primary-applicab-22 | true | 1002 | 1002 |
| 4 | AST-2525 | Legacy Standard D | adaptive-applicab-23 | false | 1003 | 1003 |

ASTM test methods provide the standardized procedures by which fuel properties are evaluated. Method AST-2519, "Primary Framework A," applies to compact-applicab-20, is marked as BQ-9000 critical, and is associated with fuel property 1000 and fuel sample 1000. Method AST-2521, "Composite Protocol," applies to composite-applicab-21, is non-critical, and links property 1001 with sample 1001. Method AST-2523, "Compact Programme," applies to primary-applicab-22, is BQ-9000 critical, and connects property 1002 with sample 1002. Method AST-2525, "Legacy Standard D," applies to adaptive-applicab-23, is non-critical, and ties property 1003 to sample 1003. The is_b_q9000_critical flag distinguishes methods whose results are mandatory for BQ-9000 certification compliance.

**Table `storage_tanks`**

| tank_id | tank_capacity | current_fill_level | tank_material | last_inspection_date | tank_status | production_batch_id | fuel_sample_id |
|---|---|---|---|---|---|---|---|
| 4060653 | 6.20 | 8.70 | compact-tank-92 | 2025-04-12 | active | 1 | 1000 |
| 9246320 | 9.40 | 12.40 | composite-tank-93 | 2022-09-23 | maintenance | 2 | 1001 |
| 8387534 | 12.60 | 16.10 | primary-tank-94 | 2023-02-07 | decommissioned | 3 | 1002 |
| id_5 | 15.80 | 19.80 | adaptive-tank-95 | 2024-07-18 | active | 4 | 1003 |

Storage tanks hold finished biodiesel with documented physical characteristics. Tank 4060653 has a capacity of 6.20, a current fill level of 8.70, is constructed from compact-tank-92 material, was last inspected on 2025-04-12, is active, and is associated with production batch 1 and fuel sample 1000. Tank 9246320 holds 9.40 capacity at 12.40 fill level, uses composite-tank-93 material, was inspected 2022-09-23, is in maintenance status, and links to batch 2 and sample 1001. Tank 8387534 has capacity 12.60, fill level 16.10, is built from primary-tank-94, was last inspected 2023-02-07, is decommissioned, and connects to batch 3 and sample 1002. Tank id_5 holds 15.80 capacity at 19.80 fill level, uses adaptive-tank-95 material, was inspected 2024-07-18, is active, and associates with batch 4 and sample 1003. The tank_status values—active, maintenance, decommissioned—indicate operational readiness.

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

The `batches_samples` table provides the explicit linkage between production batches and their corresponding fuel samples, ensuring that every analytical result can be traced back to the exact production lot from which the sample was drawn. This join table is the connective tissue that allows downstream views to assemble complete production narratives.

## Cross-Referential Views

The domain's analytical power emerges from its joined views, each answering a specific operational question by combining records across the base tables.

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

This view answers which ASTM test methods are associated with each biodiesel grade. It reveals that grade S15 (row 1) is evaluated using method AST-2519, while S500 (row 2) uses AST-2521. The same grade codes reappear in rows 3 and 4 with methods AST-2523 and AST-2525 respectively, confirming that grade codes alone are insufficient to identify a unique specification set—the method identifier provides the necessary disambiguation.

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

This view maps each biodiesel grade to its corresponding fuel property. Grade S15 at row 1 links to property 1000 ("Baseline Standard D"), S500 at row 2 to property 1001 ("Distributed Framework"), S15 at row 3 to property 1002 ("Adaptive Protocol"), and S500 at row 4 to property 1003 ("Primary Programme A"). The view demonstrates that the same grade code can reference different property definitions, each with distinct specification limits and units of measure.

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

Reversing the relationship, this view shows which biodiesel grades are defined by each fuel property. Property 1000 defines grade S15 with sulfur limit 0.015 and cetane minimum 13; property 1001 defines S500 with sulfur limit 0.500 and cetane minimum 16; property 1002 defines S15 with sulfur limit 0.015 and cetane minimum 19; property 1003 defines S500 with sulfur limit 0.500 and cetane minimum 22. This bidirectional mapping ensures that quality engineers can navigate from specification to grade and back without ambiguity.

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

This view connects fuel properties to the physical samples that were tested against them. Property 1000 is associated with sample 1562854 (pending status, volume 10.20); property 1001 with sample 726043 (testing status, volume 12.40); property 1002 with sample 89106 (complete status, volume 14.60); and property 1003 with sample 10966221 (failed status, volume 16.80). The view enables quality managers to see at a glance which samples have been evaluated under which property specifications and what the current status of each evaluation is.

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

The inverse of the previous view, this perspective starts from the fuel sample and reveals the property specification against which it was measured. Sample 1562854 was evaluated under property 1000 with specification limit 7.95; sample 726043 under property 1001 with limit 11.90; sample 89106 under property 1002 with limit 15.85; and sample 10966221 under property 1003 with limit 19.80. The sample_status values—pending, testing, complete, failed—indicate the progression of analytical work, with the failed status of sample 10966221 suggesting a non-conformance that warrants investigation.

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

This view links fuel samples to their source production batches. Sample 1562854 originates from batch 050bdfa8-8fc7-11eb-924d-9cd76263cbd0, produced at facility 407 with volume 4.20 and status in_progress. Sample 726043 comes from batch 2087741 at facility Harga, volume 8.40, status completed. Sample 89106 traces to batch 2106724 at facility ChIJd13ymnZu5kcRXM7jx5boJBs, volume 12.60, status quarantined. Sample 10966221 derives from batch 4060663 at facility 8350008, volume 16.80, status released. The view enables full traceability: any sample result can be traced back to the exact production event, facility, and batch volume.

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

This view associates each fuel sample with the ASTM test method used for its evaluation. Sample 1562854 was tested by AST-2519 (Primary Framework A, BQ-9000 critical); sample 726043 by AST-2521 (Composite Protocol, non-critical); sample 89106 by AST-2523 (Compact Programme, BQ-9000 critical); and sample 10966221 by AST-2525 (Legacy Standard D, non-critical). The view is essential for compliance auditing, as it identifies which samples were evaluated using methods that carry BQ-9000 certification requirements.

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

This comprehensive view assembles production batch details with their associated fuel sample information. Batch 050bdfa8-8fc7-11eb-924d-9cd76263cbd0 (facility 407, volume 4.20, in_progress) is linked to sample 1562854 (pending, volume 10.20, collected 2025-12-17). Batch 2087741 (facility Harga, volume 8.40, completed) connects to sample 726043 (testing, volume 12.40, collected 2022-05-01). Batch 2106724 (facility ChIJd13ymnZu5kcRXM7jx5boJBs, volume 12.60, quarantined) links to sample 89106 (complete, volume 14.60, collected 2023-10-12). Batch 4060663 (facility 8350008, volume 16.80, released) associates with sample 10966221 (failed, volume 16.80, collected 2024-03-23). This view provides a complete production-to-sampling narrative in a single result set.

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

This view connects production batches to the biodiesel grade assigned to each. Batch 050bdfa8-8fc7-11eb-924d-9cd76263cbd0 is graded S15 with sulfur limit 0.015 and cetane minimum 13. Batch 2087741 is graded S500 with sulfur limit 0.500 and cetane minimum 16. Batch 2106724 is graded S15 with sulfur limit 0.015 and cetane minimum 19. Batch 4060663 is graded S500 with sulfur limit 0.500 and cetane minimum 22. The view enables production planners to verify that each batch was manufactured to the correct grade specification.

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

This view maps production batches to their assigned storage tanks. Batch 050bdfa8-8fc7-11eb-924d-9cd76263cbd0 is stored in tank 4060653 (capacity 6.20, fill level 8.70, material compact-tank-92, status active). Batch 2087741 is stored in tank 9246320 (capacity 9.40, fill level 12.40, material composite-tank-93, status maintenance). Batch 2106724 is stored in tank 8387534 (capacity 12.60, fill level 16.10, material primary-tank-94, status decommissioned). Batch 4060663 is stored in tank id_5 (capacity 15.80, fill level 19.80, material adaptive-tank-95, status active). The view is critical for inventory management and tank utilization planning.

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

This view links ASTM test methods to the fuel properties they evaluate. Method AST-2519 evaluates property 1000 (Baseline Standard D, limit 7.95, composite-unit-69, non-critical). Method AST-2521 evaluates property 1001 (Distributed Framework, limit 11.90, primary-unit-70, critical). Method AST-2523 evaluates property 1002 (Adaptive Protocol, limit 15.85, adaptive-unit-71, non-critical). Method AST-2525 evaluates property 1003 (Primary Programme A, limit 19.80, distributed-unit-72, critical). The view clarifies the method-to-specification relationship, which is essential for test method validation and regulatory compliance documentation.

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

This view connects ASTM test methods to the fuel samples they were applied to. Method AST-2519 was applied to sample 1562854 (pending, volume 10.20, collected 2025-12-17). Method AST-2521 was applied to sample 726043 (testing, volume 12.40, collected 2022-05-01). Method AST-2523 was applied to sample 89106 (complete, volume 14.60, collected 2023-10-12). Method AST-2525 was applied to sample 10966221 (failed, volume 16.80, collected 2024-03-23). The view supports method usage analysis and helps identify whether any sample was tested using non-compliant or outdated procedures.

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

This view presents storage tanks alongside the production batches they hold. Tank 4060653 (capacity 6.20, fill level 8.70, compact-tank-92, active) contains batch 050bdfa8-8fc7-11eb-924d-9cd76263cbd0 (volume 4.20, in_progress, facility 407). Tank 9246320 (capacity 9.40, fill level 12.40, composite-tank-93, maintenance) holds batch 2087741 (volume 8.40, completed, facility Harga). Tank 8387534 (capacity 12.60, fill level 16.10, primary-tank-94, decommissioned) contains batch 2106724 (volume 12.60, quarantined, facility ChIJd13ymnZu5kcRXM7jx5boJBs). Tank id_5 (capacity 15.80, fill level 19.80, adaptive-tank-95, active) holds batch 4060663 (volume 16.80, released, facility 8350008). The fill levels exceeding tank capacities in some rows indicate either measurement units that differ between capacity and fill or temporary overfill conditions requiring operational attention.

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

This final view connects storage tanks to the fuel samples associated with the batches they contain. Tank 4060653 is linked to sample 1562854 (pending, volume 10.20). Tank 9246320 is linked to sample 726043 (testing, volume 12.40). Tank 8387534 is linked to sample 89106 (complete, volume 14.60). Tank id_5 is linked to sample 10966221 (failed, volume 16.80). This view provides a complete picture of where each sampled batch is physically stored and the analytical status of its representative sample, enabling rapid response to quality issues by identifying both the tank location and the sample evaluation state.

## Synthesis

The biodiesel quality management domain is defined by the interlocking relationships between grades, properties, samples, batches, test methods, and storage infrastructure. Each production batch is assigned a grade specification, stored in a named tank, and represented by a fuel sample that undergoes ASTM-standardized testing against defined fuel properties. The grade codes S15 and S500 appear across multiple rows with different numeric thresholds, demonstrating that the full specification is always a composite of grade code, ASTM method, and fuel property identifier. Sample statuses progress through pending, testing, complete, and failed states, providing a clear operational signal for quality control workflows. Storage tanks, with their capacities, fill levels, materials, and inspection histories, form the physical backbone of the supply chain, while the batches_samples join table ensures that every analytical result remains traceable to its source production event. Together, these records and their joined views form a comprehensive quality management framework that supports regulatory compliance, operational traceability, and production optimization.