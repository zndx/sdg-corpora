## Ontology-Grounded Relational Modelling of Building Energy Analytics

The domain under examination concerns the quantitative analysis of building energy performance, where architectural geometry, material composition, and environmental simulation converge into a unified data model. At its core, the ontology distinguishes five principal entity types: building shapes, energy simulations, glazing configurations, building materials, and optimization processes. Each entity type materializes as a base table, and their interrelations are expressed through foreign keys that enforce referential integrity across the normalized schema. The model supports eight analytical views that reconstruct domain facts by joining these tables along their relationship edges, enabling queries that span geometry, thermodynamics, and operational optimization in a single result set.

**Table `building_shapes`**

| building_shape_id | shape_id | ground_plan_type | vertical_division_type | volume | surface_area | shape_factor | aerodynamic_coefficient | energy_simulation_id | glazing_ratio_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 69444 | Simple | Simple | 9.45 | 15.95 | 5.95 | 6.20 | 1 | 1 |
| 2 | 5006445 | Complex | Complex | 11.90 | 19.90 | 7.90 | 9.40 | 2 | 2 |
| 3 | b10c1484-8fcd-11eb-924d-9cd76263cbd0 | Simple | Simple | 14.35 | 23.85 | 9.85 | 12.60 | 3 | 3 |
| 4 | 778574 | Complex | Complex | 16.80 | 27.80 | 11.80 | 15.80 | 4 | 4 |

The `building_shapes` table anchors the geometric dimension of the ontology. Its primary key, `building_shape_id`, is a surrogate integer that grows monotonically (1, 2, 3, 4), while the business identifier `shape_id` carries a heterogeneous mix of values: short integers like `69444` and `5006445`, and UUIDs such as `b10c1484-8fcd-11eb-924d-9cd76263cbd0`. The categorical attributes `ground_plan_type` and `vertical_division_type` each take one of two values — `Simple` or `Complex` — and in the sample data they are perfectly correlated, suggesting a design where plan complexity dictates vertical division strategy. The numeric attributes `volume`, `surface_area`, `shape_factor`, and `aerodynamic_coefficient` form a continuous scale ranging from 9.45 to 16.80 for volume and from 15.95 to 27.80 for surface area, with the shape factor (a ratio of surface area to volume) increasing from 5.95 to 11.80 across the four rows. Two foreign keys, `energy_simulation_id` and `glazing_ratio_id`, link each building shape to exactly one energy simulation and one glazing configuration, establishing a one-to-one relationship in both directions.

**Table `energy_simulations`**

| id | simulation_id | simulation_date | energy_consumption | heating_load | cooling_load | ventilation_rate | indoor_temperature | outdoor_temperature | building_shape_id | building_material_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 212 | 2025-12-23T11:21:00 | 4.45 | 6.95 | 14.45 | 10.45 | 0.74 | 1.52 | 1 | 1000 |
| 2 | 047555c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2022-05-07T18:38:00 | 7.90 | 9.90 | 17.90 | 13.90 | 1.09 | 0.6 | 2 | 1001 |
| 3 | 974945 | 2023-10-18T01:55:00 | 11.35 | 12.85 | 21.35 | 17.35 | 0.77 | 0.6000001 | 3 | 1002 |
| 4 | 7119790 | 2024-03-02T08:12:00 | 14.80 | 15.80 | 24.80 | 20.80 | 0.6 | 1.00331 | 4 | 1003 |

The `energy_simulations` table captures the thermodynamic state of a building at a point in time. Its surrogate primary key `id` is a small integer, while the business-level `simulation_id` again mixes short integers (`212`, `974945`) with UUIDs (`047555c4-9bac-11eb-a8a2-19ed5c03f8d3`). The `simulation_date` column records ISO-8601 timestamps spanning from 2022 to 2025. The core performance metrics — `energy_consumption`, `heating_load`, `cooling_load`, and `ventilation_rate` — all increase monotonically across the four rows (4.45 to 14.80, 6.95 to 15.80, 14.45 to 24.80, and 10.45 to 20.80 respectively), suggesting a dataset where each successive simulation models a progressively larger or less efficient building. The environmental context is captured by `indoor_temperature` (ranging from 0.6 to 1.09) and `outdoor_temperature` (ranging from 0.6 to 1.52). Two foreign keys, `building_shape_id` and `building_material_id`, point back to the `building_shapes` and `building_materials` tables, respectively, meaning each simulation is grounded in a specific geometry and a specific material specification.

**Table `glazing_ratios`**

| id | glazing_ratio_id | wall_area | glazing_area | ratio_percentage | orientation | building_shape_id |
|---|---|---|---|---|---|---|
| 1 | 10445629 | 4.20 | 7.95 | 15.70 | North | 1 |
| 2 | 6926365 | 6.40 | 10.90 | 20.40 | South | 2 |
| 3 | 129 | 8.60 | 13.85 | 25.10 | East | 3 |
| 4 | 4060659 | 10.80 | 16.80 | 29.80 | West | 4 |

Glazing configurations are stored in `glazing_ratios`, which quantifies the proportion of transparent envelope area relative to the total wall area. The surrogate key `id` is an integer, while `glazing_ratio_id` carries the business identifier (values like `10445629`, `6926365`, `129`, `4060659`). The geometric attributes `wall_area` and `glazing_area` increase from 4.20 to 10.80 and from 7.95 to 16.80 respectively, and the derived `ratio_percentage` rises from 15.70% to 29.80%. The `orientation` column distinguishes four cardinal directions — `North`, `South`, `East`, and `West` — each assigned to a different row, implying that the model supports orientation-specific glazing analysis. The foreign key `building_shape_id` ties each glazing configuration to exactly one building shape, completing the one-to-one relationship established by `glazing_ratio_id` in the `building_shapes` table.

**Table `building_materials`**

| id | material_id | material_name | thermal_conductivity | density | thickness | installation_date | energy_simulation_id |
|---|---|---|---|---|---|---|---|
| 1000 | 2839521 | Compact Framework | 11.70 | 3.45 | 15.70 | 2022-01-10 | 1 |
| 1001 | 937739 | Legacy Protocol | 16.40 | 5.90 | 18.40 | 2023-06-21 | 2 |
| 1002 | 27cf9038-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Programme A | 21.10 | 8.35 | 21.10 | 2024-11-05 | 3 |
| 1003 | 7021001070070 | Seasonal Standard | 25.80 | 10.80 | 23.80 | 2025-04-16 | 4 |

The `building_materials` table stores the thermophysical properties of construction materials used in energy simulations. Its surrogate primary key `id` uses a large integer range (1000 to 1003), while the business identifier `material_id` mixes short integers (`2839521`, `937739`) with UUIDs (`27cf9038-9bad-11eb-a8a2-19ed5c03f8d3`) and long numeric strings (`7021001070070`). The `material_name` column carries descriptive labels such as `Compact Framework`, `Legacy Protocol`, `Regional Programme A`, and `Seasonal Standard`. The thermal properties — `thermal_conductivity`, `density`, and `thickness` — all increase monotonically from 11.70 to 25.80, 3.45 to 10.80, and 15.70 to 23.80 respectively. The `installation_date` column records dates from 2022 to 2025. The foreign key `energy_simulation_id` links each material to exactly one energy simulation, meaning a simulation references a single material specification.

**Table `optimization_processes`**

| id | process_id | start_date | end_date | cost_reduction | efficiency_gain | status | building_shape_id | energy_simulation_id |
|---|---|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 3,674 | 21.45 | pending | 1 | 1 |
| 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 4,634 | 25.90 | running | 2 | 2 |
| 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 43.25 | 30.35 | complete | 3 | 3 |
| 4 | 1205-0002-XL | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 1,633 | 34.80 | failed | 4 | 4 |

The `optimization_processes` table tracks the lifecycle of energy optimization campaigns. Its surrogate key `id` is a small integer, while `process_id` carries business identifiers that include alphanumeric strings like `template_ivacode_pagata_art15`, UUIDs such as `27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3`, and structured codes like `1205-0002-XL`. The temporal attributes `start_date` and `end_date` record ISO-8601 timestamps; notably, the end dates precede the start dates in every row (e.g., `2022-09-05T20:24:00` to `2022-09-01T08:00:00`), which may indicate a data entry convention or a retrospective recording pattern. The performance outcomes `cost_reduction` (values like `3,674`, `4,634`, `43.25`, `1,633`) and `efficiency_gain` (21.45 to 34.80) quantify the impact of each process. The `status` column is an enum with values `pending`, `running`, `complete`, and `failed`, one per row in the sample. Two foreign keys, `building_shape_id` and `energy_simulation_id`, tie each optimization process to a specific geometry and a specific simulation, enabling traceability from optimization outcome back to the conditions under which it was achieved.

### Reconstructing Domain Facts Through Views

The five base tables are normalized to eliminate redundancy, but domain queries often require joining across entity types. The eight views materialize these joins as reusable query definitions, each answering a specific analytical question.

**View `vw_building_shape_energy_simulation`**

```sql
CREATE VIEW vw_building_shape_energy_simulation AS
SELECT a.building_shape_id, a.shape_id, a.ground_plan_type, a.vertical_division_type, b.id AS simulation_id, b.simulation_id AS simulation_simulation_id, b.simulation_date AS simulation_simulation_date
FROM building_shapes a JOIN energy_simulations b ON a.energy_simulation_id = b.id;
```

| building_shape_id | shape_id | ground_plan_type | vertical_division_type | simulation_id | simulation_simulation_id | simulation_simulation_date |
|---|---|---|---|---|---|---|
| 1 | 69444 | Simple | Simple | 1 | 212 | 2025-12-23T11:21:00 |
| 2 | 5006445 | Complex | Complex | 2 | 047555c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2022-05-07T18:38:00 |
| 3 | b10c1484-8fcd-11eb-924d-9cd76263cbd0 | Simple | Simple | 3 | 974945 | 2023-10-18T01:55:00 |
| 4 | 778574 | Complex | Complex | 4 | 7119790 | 2024-03-02T08:12:00 |

The view `vw_building_shape_energy_simulation` reconstructs the relationship between a building's geometry and its energy simulation. It joins `building_shapes` to `energy_simulations` on `building_shapes.energy_simulation_id = energy_simulations.id`. The result columns include the building shape's surrogate key and business identifier (`shape_id`), its categorical attributes (`ground_plan_type`, `vertical_division_type`), and the simulation's surrogate key, business identifier, and timestamp. Reading the first row: a building shape with `shape_id` `69444` and `ground_plan_type` `Simple` is linked to simulation `id` 1 (business ID `212`), recorded on `2025-12-23T11:21:00`. The second row pairs a `Complex` shape (`shape_id` `5006445`) with simulation `id` 2 (business ID `047555c4-9bac-11eb-a8a2-19ed5c03f8d3`) from `2022-05-07T18:38:00`. This view answers the question: "Given a building shape, what energy simulation was performed on it, and when?"

**View `vw_building_shape_glazing_ratio`**

```sql
CREATE VIEW vw_building_shape_glazing_ratio AS
SELECT a.building_shape_id, a.shape_id, a.ground_plan_type, a.vertical_division_type, b.id AS ratio_id, b.glazing_ratio_id AS ratio_glazing_ratio_id, b.wall_area AS ratio_wall_area
FROM building_shapes a JOIN glazing_ratios b ON a.glazing_ratio_id = b.id;
```

| building_shape_id | shape_id | ground_plan_type | vertical_division_type | ratio_id | ratio_glazing_ratio_id | ratio_wall_area |
|---|---|---|---|---|---|---|
| 1 | 69444 | Simple | Simple | 1 | 10445629 | 4.20 |
| 2 | 5006445 | Complex | Complex | 2 | 6926365 | 6.40 |
| 3 | b10c1484-8fcd-11eb-924d-9cd76263cbd0 | Simple | Simple | 3 | 129 | 8.60 |
| 4 | 778574 | Complex | Complex | 4 | 4060659 | 10.80 |

The view `vw_building_shape_glazing_ratio` joins `building_shapes` to `glazing_ratios` on `building_shapes.glazing_ratio_id = glazing_ratios.id`, reconstructing the geometry-to-glazing relationship. It exposes the building shape's identifiers and categorical attributes alongside the glazing configuration's numeric properties (wall area, glazing area, ratio percentage) and its `orientation`. This view answers: "What glazing configuration is associated with a given building shape, and what are its geometric and orientational properties?"

**View `vw_energy_simulation_building_shape`**

```sql
CREATE VIEW vw_energy_simulation_building_shape AS
SELECT a.id, a.simulation_id, a.simulation_date, a.energy_consumption, b.building_shape_id AS shape_building_shape_id, b.shape_id AS shape_shape_id, b.ground_plan_type AS shape_ground_plan_type
FROM energy_simulations a JOIN building_shapes b ON a.building_shape_id = b.building_shape_id;
```

| id | simulation_id | simulation_date | energy_consumption | shape_building_shape_id | shape_shape_id | shape_ground_plan_type |
|---|---|---|---|---|---|---|
| 1 | 212 | 2025-12-23T11:21:00 | 4.45 | 1 | 69444 | Simple |
| 2 | 047555c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2022-05-07T18:38:00 | 7.90 | 2 | 5006445 | Complex |
| 3 | 974945 | 2023-10-18T01:55:00 | 11.35 | 3 | b10c1484-8fcd-11eb-924d-9cd76263cbd0 | Simple |
| 4 | 7119790 | 2024-03-02T08:12:00 | 14.80 | 4 | 778574 | Complex |

The view `vw_energy_simulation_building_shape` performs the inverse join of `vw_building_shape_energy_simulation`: it starts from `energy_simulations` and joins to `building_shapes` on `energy_simulations.building_shape_id = building_shapes.id`. This direction is useful when the analyst begins with a simulation result and needs to recover the geometry that produced it. The join is semantically equivalent to the forward direction because the relationship is one-to-one, but the column ordering and aliasing differ, reflecting the different analytical starting points.

**View `vw_energy_simulation_building_material`**

```sql
CREATE VIEW vw_energy_simulation_building_material AS
SELECT a.id, a.simulation_id, a.simulation_date, a.energy_consumption, b.id AS material_id, b.material_id AS material_material_id, b.material_name AS material_material_name
FROM energy_simulations a JOIN building_materials b ON a.building_material_id = b.id;
```

| id | simulation_id | simulation_date | energy_consumption | material_id | material_material_id | material_material_name |
|---|---|---|---|---|---|---|
| 1 | 212 | 2025-12-23T11:21:00 | 4.45 | 1000 | 2839521 | Compact Framework |
| 2 | 047555c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2022-05-07T18:38:00 | 7.90 | 1001 | 937739 | Legacy Protocol |
| 3 | 974945 | 2023-10-18T01:55:00 | 11.35 | 1002 | 27cf9038-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Programme A |
| 4 | 7119790 | 2024-03-02T08:12:00 | 14.80 | 1003 | 7021001070070 | Seasonal Standard |

The view `vw_energy_simulation_building_material` joins `energy_simulations` to `building_materials` on `energy_simulations.building_material_id = building_materials.id`. It reconstructs the material specification used in each simulation. Reading the first row: simulation `id` 1 used material `id` 1000, named `Compact Framework`, with `thermal_conductivity` 11.70, `density` 3.45, and `thickness` 15.70, installed on `2022-01-10`. The fourth row shows simulation `id` 4 using material `id` 1003, `Seasonal Standard`, with the highest thermal conductivity (25.80) and density (10.80). This view answers: "What material was specified for a given energy simulation, and what are its thermophysical properties?"

**View `vw_glazing_ratio_building_shape`**

```sql
CREATE VIEW vw_glazing_ratio_building_shape AS
SELECT a.id, a.glazing_ratio_id, a.wall_area, a.glazing_area, b.building_shape_id AS shape_building_shape_id, b.shape_id AS shape_shape_id, b.ground_plan_type AS shape_ground_plan_type
FROM glazing_ratios a JOIN building_shapes b ON a.building_shape_id = b.building_shape_id;
```

| id | glazing_ratio_id | wall_area | glazing_area | shape_building_shape_id | shape_shape_id | shape_ground_plan_type |
|---|---|---|---|---|---|---|
| 1 | 10445629 | 4.20 | 7.95 | 1 | 69444 | Simple |
| 2 | 6926365 | 6.40 | 10.90 | 2 | 5006445 | Complex |
| 3 | 129 | 8.60 | 13.85 | 3 | b10c1484-8fcd-11eb-924d-9cd76263cbd0 | Simple |
| 4 | 4060659 | 10.80 | 16.80 | 4 | 778574 | Complex |

The view `vw_glazing_ratio_building_shape` joins `glazing_ratios` to `building_shapes` on `glazing_ratios.building_shape_id = building_shapes.id`, the inverse of `vw_building_shape_glazing_ratio`. Starting from a glazing configuration, it recovers the building shape's identifiers and categorical attributes. The first row shows a `North`-oriented glazing configuration (wall area 4.20, glazing area 7.95, ratio 15.70%) associated with building shape `id` 1 (`shape_id` `69444`, `ground_plan_type` `Simple`). This view answers: "Given a glazing ratio, which building shape does it belong to?"

**View `vw_building_material_energy_simulation`**

```sql
CREATE VIEW vw_building_material_energy_simulation AS
SELECT a.id, a.material_id, a.material_name, a.thermal_conductivity, b.id AS simulation_id, b.simulation_id AS simulation_simulation_id, b.simulation_date AS simulation_simulation_date
FROM building_materials a JOIN energy_simulations b ON a.energy_simulation_id = b.id;
```

| id | material_id | material_name | thermal_conductivity | simulation_id | simulation_simulation_id | simulation_simulation_date |
|---|---|---|---|---|---|---|
| 1000 | 2839521 | Compact Framework | 11.70 | 1 | 212 | 2025-12-23T11:21:00 |
| 1001 | 937739 | Legacy Protocol | 16.40 | 2 | 047555c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2022-05-07T18:38:00 |
| 1002 | 27cf9038-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Programme A | 21.10 | 3 | 974945 | 2023-10-18T01:55:00 |
| 1003 | 7021001070070 | Seasonal Standard | 25.80 | 4 | 7119790 | 2024-03-02T08:12:00 |

The view `vw_building_material_energy_simulation` joins `building_materials` to `energy_simulations` on `building_materials.energy_simulation_id = energy_simulations.id`, the inverse of `vw_energy_simulation_building_material`. Starting from a material, it recovers the simulation it was used in. The first row shows material `id` 1000 (`Compact Framework`) was used in simulation `id` 1, recorded on `2025-12-23T11:21:00`. This view answers: "Given a building material, which energy simulation used it?"

**View `vw_optimization_process_building_shape`**

```sql
CREATE VIEW vw_optimization_process_building_shape AS
SELECT a.id, a.process_id, a.start_date, a.end_date, b.building_shape_id AS shape_building_shape_id, b.shape_id AS shape_shape_id, b.ground_plan_type AS shape_ground_plan_type
FROM optimization_processes a JOIN building_shapes b ON a.building_shape_id = b.building_shape_id;
```

| id | process_id | start_date | end_date | shape_building_shape_id | shape_shape_id | shape_ground_plan_type |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 69444 | Simple |
| 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 5006445 | Complex |
| 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | b10c1484-8fcd-11eb-924d-9cd76263cbd0 | Simple |
| 4 | 1205-0002-XL | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | 778574 | Complex |

The view `vw_optimization_process_building_shape` joins `optimization_processes` to `building_shapes` on `optimization_processes.building_shape_id = building_shapes.id`. It reconstructs which building shape was the subject of each optimization process. Reading the first row: optimization process `id` 1 (business ID `template_ivacode_pagata_art15`, status `pending`, cost reduction `3,674`, efficiency gain `21.45`) was applied to building shape `id` 1 (`shape_id` `69444`, `ground_plan_type` `Simple`). The fourth row shows process `id` 4 (`1205-0002-XL`, status `failed`, cost reduction `1,633`, efficiency gain `34.80`) applied to building shape `id` 4 (`shape_id` `778574`, `ground_plan_type` `Complex`). This view answers: "Given an optimization process, what building shape was it run against?"

**View `vw_optimization_process_energy_simulation`**

```sql
CREATE VIEW vw_optimization_process_energy_simulation AS
SELECT a.id, a.process_id, a.start_date, a.end_date, b.id AS simulation_id, b.simulation_id AS simulation_simulation_id, b.simulation_date AS simulation_simulation_date
FROM optimization_processes a JOIN energy_simulations b ON a.energy_simulation_id = b.id;
```

| id | process_id | start_date | end_date | simulation_id | simulation_simulation_id | simulation_simulation_date |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 212 | 2025-12-23T11:21:00 |
| 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 047555c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2022-05-07T18:38:00 |
| 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | 974945 | 2023-10-18T01:55:00 |
| 4 | 1205-0002-XL | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | 7119790 | 2024-03-02T08:12:00 |

The view `vw_optimization_process_energy_simulation` joins `optimization_processes` to `energy_simulations` on `optimization_processes.energy_simulation_id = energy_simulations.id`. It reconstructs the simulation context for each optimization process. The first row shows process `id` 1 was run against simulation `id` 1 (business ID `212`, date `2025-12-23T11:21:00`, energy consumption `4.45`). The third row shows process `id` 3 (status `complete`, efficiency gain `30.35`) was run against simulation `id` 3 (business ID `974945`, date `2023-10-18T01:55:00`, energy consumption `11.35`). This view answers: "Given an optimization process, which energy simulation was its basis?"

### Synthesis

The schema models building energy analytics as a network of five interrelated entity types, each normalized into its own table with a surrogate primary key and a set of domain-specific attributes. Foreign keys encode the relationships: building shapes reference energy simulations and glazing ratios; energy simulations reference building shapes and building materials; optimization processes reference both building shapes and energy simulations. The eight views materialize these relationships as reusable join definitions, each oriented from a different analytical starting point. The result is a fully normalized relational model that preserves all domain facts while enabling flexible reconstruction of any entity's context through its join edges. The data values — from shape factors of 5.95 to 11.80, glazing ratios of 15.70% to 29.80%, and efficiency gains of 21.45 to 34.80 — ground the abstract schema in concrete building performance metrics.