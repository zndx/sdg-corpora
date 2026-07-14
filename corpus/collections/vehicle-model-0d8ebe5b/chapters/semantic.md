The vehicle domain under study models a fleet of engineered machines whose identity is anchored in a `vehicle_models` table, each row representing a distinct configuration assembled from independently managed subsystems. A vehicle model does not store its powertrain, chassis, suspension, brakes, wheels, or capacity data inline; instead, it references each subsystem by a foreign key, and the subsystem tables themselves cross-reference one another to capture the physical interdependencies that exist in the real world. This chapter walks through the seven base tables, explains how their columns and foreign keys encode domain constraints, and then interprets each of the eighteen materialized views that reconstruct domain facts from the normalized structure.

**Table `vehicle_models`**

| model_identifier | model_display_name | manufacturer_code | color_variant | trim_level | powertrain_id | chassis_frame_id | suspension_system_id | brake_system_id | wheel_assembly_id | capacity_specification_id |
|---|---|---|---|---|---|---|---|---|---|---|
| MOD-2065 | Pilot Survey | Whirlpool Corporation | Brown | adaptive-trim-41 | 1 | 1 | 1 | 1 | 100 | 1000 |
| MOD-2070 | Baseline Corridor | Lucas Industries | Chestnut | distributed-trim-42 | 2 | 2 | 2 | 2 | 101 | 1001 |
| MOD-2075 | Distributed Series A | Luddic Path | Orange | baseline-trim-43 | 3 | 3 | 3 | 3 | 102 | 1002 |
| MOD-2080 | Adaptive Assessment | Diners Club Switzerland Ltd | Brown | pilot-trim-44 | 4 | 4 | 4 | 4 | 103 | 1003 |

The `vehicle_models` table is the central hub of the schema. Its primary key, `model_identifier`, carries human-readable identifiers such as `MOD-2065` and `MOD-2070`. The column `model_display_name` holds the public-facing name — `Pilot Survey`, `Baseline Corridor`, `Distributed Series A`, `Adaptive Assessment` — while `manufacturer_code` attributes each model to an organization like `Whirlpool Corporation` or `Lucas Industries`. The `color_variant` column records aesthetic choices (`Brown`, `Chestnut`, `Orange`), and `trim_level` encodes a configuration tier such as `adaptive-trim-41` or `distributed-trim-42`. Crucially, the last five columns of `vehicle_models` are all foreign keys: `powertrain_id`, `chassis_frame_id`, `suspension_system_id`, `brake_system_id`, `wheel_assembly_id`, and `capacity_specification_id`. Each of these columns points into a dedicated subsystem table, establishing a one-to-many relationship in which a single vehicle model row selects exactly one instance from each subsystem. For example, the row for `MOD-2065` (Pilot Survey) references powertrain `1`, chassis frame `1`, suspension system `1`, brake system `1`, wheel assembly `100`, and capacity specification `1000`. This design ensures that every vehicle model is a composite of independently versioned subsystems, and that changes to a subsystem propagate to all models that reference it.

**Table `powertrains`**

| powertrain_id | engine_type | displacement | horsepower | cooling_method | fuel_delivery_system | transmission_type | gear_positions | drive_mode | wheel_assembly_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | legacy-engine-61 | 17.95 | 7.70 | primary-cooling-34 | pilot-fuel-32 | primary-transmis-34 | compact-gear-50 | primary-drive-70 | 100 |
| 2 | compact-engine-62 | 19.90 | 12.40 | adaptive-cooling-35 | extended-fuel-33 | adaptive-transmis-35 | composite-gear-51 | adaptive-drive-71 | 101 |
| 3 | composite-engine-63 | 21.85 | 17.10 | distributed-cooling-36 | integrated-fuel-34 | distributed-transmis-36 | primary-gear-52 | distributed-drive-72 | 102 |
| 4 | primary-engine-64 | 23.80 | 21.80 | baseline-cooling-37 | seasonal-fuel-35 | baseline-transmis-37 | adaptive-gear-53 | baseline-drive-73 | 103 |

The `powertrains` table captures the propulsion characteristics of a vehicle. Its primary key `powertrain_id` is a simple integer (1 through 4 in the sample data), and the table stores six categorical or numeric attributes: `engine_type` (e.g., `legacy-engine-61`, `compact-engine-62`), `displacement` (a floating-point value like `17.95` or `23.80`), `horsepower` (ranging from `7.70` to `21.80`), `cooling_method` (such as `primary-cooling-34` or `adaptive-cooling-35`), `fuel_delivery_system` (e.g., `pilot-fuel-32`, `extended-fuel-33`), `transmission_type` (e.g., `primary-transmis-34`), `gear_positions` (e.g., `compact-gear-50`), `drive_mode` (e.g., `primary-drive-70`), and `wheel_assembly_id`, which is a foreign key into the `wheel_assemblies` table. The presence of `wheel_assembly_id` in `powertrains` means that a powertrain is not an abstract concept — it is physically coupled to a specific wheel assembly. Powertrain `1` (the legacy-engine variant with `displacement` 17.95 and `horsepower` 7.70) is paired with wheel assembly `100`, while powertrain `4` (primary-engine, displacement 23.80, horsepower 21.80) is paired with wheel assembly `103`. This cross-reference enforces a constraint that every powertrain must be matched to a wheel assembly at the data level.

**Table `chassis_frames`**

| chassis_frame_id | frame_designation | technology_name | geometry_control | wheelbase | ground_clearance | suspension_system_id | brake_system_id | capacity_specification_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | distributed-frame-60 | Baseline Framework D | compact-geometry-26 | 22.45 | 8.95 | 1 | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | baseline-frame-61 | Distributed Protocol | composite-geometry-27 | 26.90 | 12.90 | 2 | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | pilot-frame-62 | Adaptive Programme | primary-geometry-28 | 31.35 | 16.85 | 3 | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | extended-frame-63 | Primary Standard A | adaptive-geometry-29 | 35.80 | 20.80 | 4 | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `chassis_frames` table describes the structural skeleton of a vehicle. Its primary key `chassis_frame_id` is an integer (1–4), and the table includes `frame_designation` (e.g., `distributed-frame-60`, `baseline-frame-61`), `technology_name` (e.g., `Baseline Framework D`, `Distributed Protocol`), `geometry_control` (e.g., `compact-geometry-26`), `wheelbase` (a numeric value like `22.45` or `35.80`), and `ground_clearance` (ranging from `8.95` to `20.80`). Two timestamp columns, `created_at` and `updated_at`, record the lifecycle of each chassis frame record. The table also carries three foreign keys: `suspension_system_id`, `brake_system_id`, and `capacity_specification_id`. This means a chassis frame is not structurally isolated — it must be paired with a suspension system, a brake system, and a capacity specification. Chassis frame `1` (distributed-frame-60, wheelbase 22.45, ground clearance 8.95) references suspension system `1`, brake system `1`, and capacity specification `1000`. The timestamps show that chassis frame `1` was created on `2025-01-01 00:14:00` and last updated on `2025-01-02 00:41:00`, while chassis frame `4` (extended-frame-63) was created on `2025-04-16 09:14:00` and updated on `2025-04-23 15:41:00`, reflecting a deliberate progression of design iterations.

**Table `suspension_systems`**

| suspension_system_id | front_type | rear_type | seat_height | dive_control | chassis_frame_id | wheel_assembly_id |
|---|---|---|---|---|---|---|
| 1 | baseline-front-13 | legacy-rear-91 | 1.15 | true | 1 | 100 |
| 2 | pilot-front-14 | compact-rear-92 | 1.3 | false | 2 | 101 |
| 3 | extended-front-15 | composite-rear-93 | 0.575 | true | 3 | 102 |
| 4 | integrated-front-16 | primary-rear-94 | 1.19 | false | 4 | 103 |

The `suspension_systems` table models the ride and handling characteristics of a vehicle. Its primary key `suspension_system_id` is an integer (1–4), and the table stores `front_type` (e.g., `baseline-front-13`, `pilot-front-14`), `rear_type` (e.g., `legacy-rear-91`, `compact-rear-92`), `seat_height` (a numeric value such as `1.15` or `0.575`), and `dive_control` (a boolean — `true` for suspension systems `1` and `3`, `false` for `2` and `4`). The table carries two foreign keys: `chassis_frame_id` and `wheel_assembly_id`. This bidirectional coupling means that a suspension system is anchored to a specific chassis frame and a specific wheel assembly. Suspension system `1` (front type `baseline-front-13`, rear type `legacy-rear-91`, seat height `1.15`, dive control `true`) is linked to chassis frame `1` and wheel assembly `100`. Suspension system `3` (front type `extended-front-15`, rear type `composite-rear-93`, seat height `0.575`, dive control `true`) is linked to chassis frame `3` and wheel assembly `102`. The foreign keys ensure that the suspension cannot exist in isolation from the chassis and wheels it serves.

**Table `brake_systems`**

| brake_system_id | front_disc_diameter | rear_disc_diameter | caliper_type | ventilation | chassis_frame_id | wheel_assembly_id |
|---|---|---|---|---|---|---|
| 1 | 3.95 | 4.70 | distributed-caliper-72 | false | 1 | 100 |
| 2 | 6.90 | 9.40 | baseline-caliper-73 | true | 2 | 101 |
| 3 | 9.85 | 14.10 | pilot-caliper-74 | false | 3 | 102 |
| 4 | 12.80 | 18.80 | extended-caliper-75 | true | 4 | 103 |

The `brake_systems` table encodes the stopping performance of a vehicle. Its primary key `brake_system_id` is an integer (1–4), and the table stores `front_disc_diameter` (e.g., `3.95`, `6.90`, `9.85`, `12.80`), `rear_disc_diameter` (e.g., `4.70`, `9.40`, `14.10`, `18.80`), `caliper_type` (e.g., `distributed-caliper-72`, `baseline-caliper-73`, `pilot-caliper-74`, `extended-caliper-75`), and `ventilation` (a boolean — `false` for brake systems `1` and `3`, `true` for `2` and `4`). Like the suspension table, `brake_systems` carries two foreign keys: `chassis_frame_id` and `wheel_assembly_id`. Brake system `1` (front disc `3.95`, rear disc `4.70`, caliper `distributed-caliper-72`, ventilation `false`) is tied to chassis frame `1` and wheel assembly `100`. Brake system `4` (front disc `12.80`, rear disc `18.80`, caliper `extended-caliper-75`, ventilation `true`) is tied to chassis frame `4` and wheel assembly `103`. The increasing disc diameters across the four rows reflect a scaling of braking capacity alongside the increasing powertrain output.

**Table `wheel_assemblies`**

| wheel_assembly_id | position | tire_width | tire_height | rim_diameter | rim_material | tire_model | suspension_system_id | brake_system_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | compact-position-20 | 1.05 | 1.12 | 10.95 | baseline-rim-19 | composite-tire-57 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | composite-position-21 | 0.56 | 0.37591002 | 14.90 | pilot-rim-20 | primary-tire-58 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | primary-position-22 | 0.52 | 0.74 | 18.85 | extended-rim-21 | adaptive-tire-59 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | adaptive-position-23 | 1.05 | 0.84 | 22.80 | integrated-rim-22 | distributed-tire-60 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `wheel_assemblies` table describes the rolling stock of a vehicle. Its primary key `wheel_assembly_id` is an integer (100–103 in the sample), and the table stores `position` (e.g., `compact-position-20`, `composite-position-21`, `primary-position-22`, `adaptive-position-23`), `tire_width` (e.g., `1.05`, `0.56`, `0.52`), `tire_height` (e.g., `1.12`, `0.37591002`, `0.74`, `0.84`), `rim_diameter` (e.g., `10.95`, `14.90`, `18.85`, `22.80`), `rim_material` (e.g., `baseline-rim-19`, `pilot-rim-20`, `extended-rim-21`, `integrated-rim-22`), and `tire_model` (e.g., `composite-tire-57`, `primary-tire-58`, `adaptive-tire-59`, `distributed-tire-60`). Two timestamp columns, `created_at` and `updated_at`, track the lifecycle of each wheel assembly record. The table carries two foreign keys: `suspension_system_id` and `brake_system_id`. This means a wheel assembly is physically coupled to a specific suspension system and a specific brake system. Wheel assembly `100` (position `compact-position-20`, tire width `1.05`, rim diameter `10.95`, rim material `baseline-rim-19`, tire model `composite-tire-57`) is linked to suspension system `1` and brake system `1`. Wheel assembly `103` (position `adaptive-position-23`, tire width `1.05`, rim diameter `22.80`, rim material `integrated-rim-22`, tire model `distributed-tire-60`) is linked to suspension system `4` and brake system `4`. The timestamps mirror those in the chassis frames table, with wheel assembly `100` created on `2025-01-01 00:14:00` and updated on `2025-01-02 00:41:00`.

**Table `capacity_specifications`**

| id | capacity_type | value | unit | location | chassis_frame_id | powertrain_id |
|---|---|---|---|---|---|---|
| 1000 | regional-capacity-42 | 19.95 | distributed-unit-18 | extended-location-99 | 1 | 1 |
| 1001 | legacy-capacity-43 | 21.90 | baseline-unit-19 | integrated-location-100 | 2 | 2 |
| 1002 | compact-capacity-44 | 23.85 | pilot-unit-20 | seasonal-location-101 | 3 | 3 |
| 1003 | composite-capacity-45 | 25.80 | extended-unit-21 | regional-location-102 | 4 | 4 |

The `capacity_specifications` table captures the load and volume constraints of a vehicle. Its primary key `capacity_specification_id` is an integer (1000–1003 in the sample data). While the exact column set is not enumerated in the sample rows, the table is referenced by both `vehicle_models` (via `capacity_specification_id`) and `chassis_frames` (via `capacity_specification_id`), establishing it as a shared constraint resource. Capacity specification `1000` is referenced by vehicle model `MOD-2065` (Pilot Survey) and chassis frame `1` (distributed-frame-60); capacity specification `1003` is referenced by vehicle model `MOD-2080` (Adaptive Assessment) and chassis frame `4` (extended-frame-63). The table's role is to define the maximum payload, cargo volume, or passenger capacity that a given chassis and vehicle model combination must support.

The seven base tables form a tightly interlocked graph of foreign keys. The `vehicle_models` table sits at the apex, pointing into all six subsystem tables. Each subsystem table, in turn, points back into at least one other subsystem: `powertrains` references `wheel_assemblies`; `chassis_frames` references `suspension_systems`, `brake_systems`, and `capacity_specifications`; `suspension_systems` references `chassis_frames` and `wheel_assemblies`; `brake_systems` references `chassis_frames` and `wheel_assemblies`; and `wheel_assemblies` references `suspension_systems` and `brake_systems`. This creates a cycle of mutual dependencies — a suspension system belongs to a chassis frame, which in turn references that same suspension system — which is resolved in the relational model by the fact that the foreign keys are declared as constraints rather than enforced at insert time in all RDBMS engines, or by the use of deferred constraints. The cycle is semantically meaningful: it captures the engineering reality that suspension, brakes, and wheels are co-designed with the chassis.

The eighteen views materialize the joins that reconstruct domain facts from this normalized graph. Each view answers a specific question by joining two or more base tables.

**View `vw_vehicle_model_powertrain`**

```sql
CREATE VIEW vw_vehicle_model_powertrain AS
SELECT a.model_identifier, a.model_display_name, a.manufacturer_code, a.color_variant, b.powertrain_id AS powertrain_powertrain_id, b.engine_type AS powertrain_engine_type, b.displacement AS powertrain_displacement
FROM vehicle_models a JOIN powertrains b ON a.powertrain_id = b.powertrain_id;
```

| model_identifier | model_display_name | manufacturer_code | color_variant | powertrain_powertrain_id | powertrain_engine_type | powertrain_displacement |
|---|---|---|---|---|---|---|
| MOD-2065 | Pilot Survey | Whirlpool Corporation | Brown | 1 | legacy-engine-61 | 17.95 |
| MOD-2070 | Baseline Corridor | Lucas Industries | Chestnut | 2 | compact-engine-62 | 19.90 |
| MOD-2075 | Distributed Series A | Luddic Path | Orange | 3 | composite-engine-63 | 21.85 |
| MOD-2080 | Adaptive Assessment | Diners Club Switzerland Ltd | Brown | 4 | primary-engine-64 | 23.80 |

This view joins `vehicle_models` to `powertrains` on `vehicle_models.powertrain_id = powertrains.powertrain_id`. It answers the question: "What powertrain is specified for each vehicle model?" A row for `MOD-2065` (Pilot Survey) would show powertrain `1` with `engine_type` `legacy-engine-61`, `displacement` 17.95, and `horsepower` 7.70. A row for `MOD-2080` (Adaptive Assessment) would show powertrain `4` with `engine_type` `primary-engine-64`, `displacement` 23.80, and `horsepower` 21.80. The view collapses the foreign key into a denormalized row that reads like a specification sheet.

**View `vw_vehicle_model_chassis_frame`**

```sql
CREATE VIEW vw_vehicle_model_chassis_frame AS
SELECT a.model_identifier, a.model_display_name, a.manufacturer_code, a.color_variant, b.chassis_frame_id AS frame_chassis_frame_id, b.frame_designation AS frame_frame_designation, b.technology_name AS frame_technology_name
FROM vehicle_models a JOIN chassis_frames b ON a.chassis_frame_id = b.chassis_frame_id;
```

| model_identifier | model_display_name | manufacturer_code | color_variant | frame_chassis_frame_id | frame_frame_designation | frame_technology_name |
|---|---|---|---|---|---|---|
| MOD-2065 | Pilot Survey | Whirlpool Corporation | Brown | 1 | distributed-frame-60 | Baseline Framework D |
| MOD-2070 | Baseline Corridor | Lucas Industries | Chestnut | 2 | baseline-frame-61 | Distributed Protocol |
| MOD-2075 | Distributed Series A | Luddic Path | Orange | 3 | pilot-frame-62 | Adaptive Programme |
| MOD-2080 | Adaptive Assessment | Diners Club Switzerland Ltd | Brown | 4 | extended-frame-63 | Primary Standard A |

This view joins `vehicle_models` to `chassis_frames` on `vehicle_models.chassis_frame_id = chassis_frames.chassis_frame_id`. It answers: "What chassis frame is specified for each vehicle model?" The row for `MOD-2065` would show chassis frame `1` (distributed-frame-60, technology `Baseline Framework D`, wheelbase 22.45, ground clearance 8.95). The row for `MOD-2080` would show chassis frame `4` (extended-frame-63, technology `Primary Standard A`, wheelbase 35.80, ground clearance 20.80). The view makes it easy to compare the structural dimensions across models.

**View `vw_vehicle_model_suspension_system`**

```sql
CREATE VIEW vw_vehicle_model_suspension_system AS
SELECT a.model_identifier, a.model_display_name, a.manufacturer_code, a.color_variant, b.suspension_system_id AS system_suspension_system_id, b.front_type AS system_front_type, b.rear_type AS system_rear_type
FROM vehicle_models a JOIN suspension_systems b ON a.suspension_system_id = b.suspension_system_id;
```

| model_identifier | model_display_name | manufacturer_code | color_variant | system_suspension_system_id | system_front_type | system_rear_type |
|---|---|---|---|---|---|---|
| MOD-2065 | Pilot Survey | Whirlpool Corporation | Brown | 1 | baseline-front-13 | legacy-rear-91 |
| MOD-2070 | Baseline Corridor | Lucas Industries | Chestnut | 2 | pilot-front-14 | compact-rear-92 |
| MOD-2075 | Distributed Series A | Luddic Path | Orange | 3 | extended-front-15 | composite-rear-93 |
| MOD-2080 | Adaptive Assessment | Diners Club Switzerland Ltd | Brown | 4 | integrated-front-16 | primary-rear-94 |

This view joins `vehicle_models` to `suspension_systems` on `vehicle_models.suspension_system_id = suspension_systems.suspension_system_id`. It answers: "What suspension system is specified for each vehicle model?" The row for `MOD-2065` would show suspension system `1` (front type `baseline-front-13`, rear type `legacy-rear-91`, seat height 1.15, dive control `true`). The row for `MOD-2075` would show suspension system `3` (front type `extended-front-15`, rear type `composite-rear-93`, seat height 0.575, dive control `true`). The view surfaces the ride characteristics alongside the model identity.

**View `vw_vehicle_model_brake_system`**

```sql
CREATE VIEW vw_vehicle_model_brake_system AS
SELECT a.model_identifier, a.model_display_name, a.manufacturer_code, a.color_variant, b.brake_system_id AS system_brake_system_id, b.front_disc_diameter AS system_front_disc_diameter, b.rear_disc_diameter AS system_rear_disc_diameter
FROM vehicle_models a JOIN brake_systems b ON a.brake_system_id = b.brake_system_id;
```

| model_identifier | model_display_name | manufacturer_code | color_variant | system_brake_system_id | system_front_disc_diameter | system_rear_disc_diameter |
|---|---|---|---|---|---|---|
| MOD-2065 | Pilot Survey | Whirlpool Corporation | Brown | 1 | 3.95 | 4.70 |
| MOD-2070 | Baseline Corridor | Lucas Industries | Chestnut | 2 | 6.90 | 9.40 |
| MOD-2075 | Distributed Series A | Luddic Path | Orange | 3 | 9.85 | 14.10 |
| MOD-2080 | Adaptive Assessment | Diners Club Switzerland Ltd | Brown | 4 | 12.80 | 18.80 |

This view joins `vehicle_models` to `brake_systems` on `vehicle_models.brake_system_id = brake_systems.brake_system_id`. It answers: "What brake system is specified for each vehicle model?" The row for `MOD-2065` would show brake system `1` (front disc 3.95, rear disc 4.70, caliper `distributed-caliper-72`, ventilation `false`). The row for `MOD-2080` would show brake system `4` (front disc 12.80, rear disc 18.80, caliper `extended-caliper-75`, ventilation `true`). The view makes it straightforward to audit braking capacity across the model lineup.

**View `vw_vehicle_model_wheel_assembly`**

```sql
CREATE VIEW vw_vehicle_model_wheel_assembly AS
SELECT a.model_identifier, a.model_display_name, a.manufacturer_code, a.color_variant, b.wheel_assembly_id AS assembly_wheel_assembly_id, b.position AS assembly_position, b.tire_width AS assembly_tire_width
FROM vehicle_models a JOIN wheel_assemblies b ON a.wheel_assembly_id = b.wheel_assembly_id;
```

| model_identifier | model_display_name | manufacturer_code | color_variant | assembly_wheel_assembly_id | assembly_position | assembly_tire_width |
|---|---|---|---|---|---|---|
| MOD-2065 | Pilot Survey | Whirlpool Corporation | Brown | 100 | compact-position-20 | 1.05 |
| MOD-2070 | Baseline Corridor | Lucas Industries | Chestnut | 101 | composite-position-21 | 0.56 |
| MOD-2075 | Distributed Series A | Luddic Path | Orange | 102 | primary-position-22 | 0.52 |
| MOD-2080 | Adaptive Assessment | Diners Club Switzerland Ltd | Brown | 103 | adaptive-position-23 | 1.05 |

This view joins `vehicle_models` to `wheel_assemblies` on `vehicle_models.wheel_assembly_id = wheel_assemblies.wheel_assembly_id`. It answers: "What wheel assembly is specified for each vehicle model?" The row for `MOD-2065` would show wheel assembly `100` (position `compact-position-20`, tire width 1.05, rim diameter 10.95, rim material `baseline-rim-19`, tire model `composite-tire-57`). The row for `MOD-2080` would show wheel assembly `103` (position `adaptive-position-23`, tire width 1.05, rim diameter 22.80, rim material `integrated-rim-22`, tire model `distributed-tire-60`). The view presents the rolling stock configuration in a single row per model.

**View `vw_vehicle_model_capacity_specification`**

```sql
CREATE VIEW vw_vehicle_model_capacity_specification AS
SELECT a.model_identifier, a.model_display_name, a.manufacturer_code, a.color_variant, b.id AS specification_id, b.capacity_type AS specification_capacity_type, b.value AS specification_value
FROM vehicle_models a JOIN capacity_specifications b ON a.capacity_specification_id = b.id;
```

| model_identifier | model_display_name | manufacturer_code | color_variant | specification_id | specification_capacity_type | specification_value |
|---|---|---|---|---|---|---|
| MOD-2065 | Pilot Survey | Whirlpool Corporation | Brown | 1000 | regional-capacity-42 | 19.95 |
| MOD-2070 | Baseline Corridor | Lucas Industries | Chestnut | 1001 | legacy-capacity-43 | 21.90 |
| MOD-2075 | Distributed Series A | Luddic Path | Orange | 1002 | compact-capacity-44 | 23.85 |
| MOD-2080 | Adaptive Assessment | Diners Club Switzerland Ltd | Brown | 1003 | composite-capacity-45 | 25.80 |

This view joins `vehicle_models` to `capacity_specifications` on `vehicle_models.capacity_specification_id = capacity_specifications.capacity_specification_id`. It answers: "What capacity specification is assigned to each vehicle model?" The row for `MOD-2065` would show capacity specification `1000`; the row for `MOD-2080` would show capacity specification `1003`. The view links the model to its load and volume constraints.

**View `vw_powertrain_wheel_assembly`**

```sql
CREATE VIEW vw_powertrain_wheel_assembly AS
SELECT a.powertrain_id, a.engine_type, a.displacement, a.horsepower, b.wheel_assembly_id AS assembly_wheel_assembly_id, b.position AS assembly_position, b.tire_width AS assembly_tire_width
FROM powertrains a JOIN wheel_assemblies b ON a.wheel_assembly_id = b.wheel_assembly_id;
```

| powertrain_id | engine_type | displacement | horsepower | assembly_wheel_assembly_id | assembly_position | assembly_tire_width |
|---|---|---|---|---|---|---|
| 1 | legacy-engine-61 | 17.95 | 7.70 | 100 | compact-position-20 | 1.05 |
| 2 | compact-engine-62 | 19.90 | 12.40 | 101 | composite-position-21 | 0.56 |
| 3 | composite-engine-63 | 21.85 | 17.10 | 102 | primary-position-22 | 0.52 |
| 4 | primary-engine-64 | 23.80 | 21.80 | 103 | adaptive-position-23 | 1.05 |

This view joins `powertrains` to `wheel_assemblies` on `powertrains.wheel_assembly_id = wheel_assemblies.wheel_assembly_id`. It answers: "Which wheel assembly is paired with each powertrain?" The row for powertrain `1` (legacy-engine-61, horsepower 7.70) would show wheel assembly `100` (position `compact-position-20`, rim diameter 10.95). The row for powertrain `4` (primary-engine-64, horsepower 21.80) would show wheel assembly `103` (position `adaptive-position-23`, rim diameter 22.80). The view exposes the powertrain-to-wheel coupling that is enforced by the foreign key in `powertrains`.

**View `vw_chassis_frame_suspension_system`**

```sql
CREATE VIEW vw_chassis_frame_suspension_system AS
SELECT a.chassis_frame_id, a.frame_designation, a.technology_name, a.geometry_control, b.suspension_system_id AS system_suspension_system_id, b.front_type AS system_front_type, b.rear_type AS system_rear_type
FROM chassis_frames a JOIN suspension_systems b ON a.suspension_system_id = b.suspension_system_id;
```

| chassis_frame_id | frame_designation | technology_name | geometry_control | system_suspension_system_id | system_front_type | system_rear_type |
|---|---|---|---|---|---|---|
| 1 | distributed-frame-60 | Baseline Framework D | compact-geometry-26 | 1 | baseline-front-13 | legacy-rear-91 |
| 2 | baseline-frame-61 | Distributed Protocol | composite-geometry-27 | 2 | pilot-front-14 | compact-rear-92 |
| 3 | pilot-frame-62 | Adaptive Programme | primary-geometry-28 | 3 | extended-front-15 | composite-rear-93 |
| 4 | extended-frame-63 | Primary Standard A | adaptive-geometry-29 | 4 | integrated-front-16 | primary-rear-94 |

This view joins `chassis_frames` to `suspension_systems` on `chassis_frames.suspension_system_id = suspension_systems.suspension_system_id`. It answers: "Which suspension system is paired with each chassis frame?" The row for chassis frame `1` (distributed-frame-60, wheelbase 22.45) would show suspension system `1` (front type `baseline-front-13`, seat height 1.15, dive control `true`). The row for chassis frame `4` (extended-frame-63, wheelbase 35.80) would show suspension system `4` (front type `integrated-front-16`, seat height 1.19, dive control `false`). The view makes it easy to audit the suspension-to-chassis pairing.

**View `vw_chassis_frame_brake_system`**

```sql
CREATE VIEW vw_chassis_frame_brake_system AS
SELECT a.chassis_frame_id, a.frame_designation, a.technology_name, a.geometry_control, b.brake_system_id AS system_brake_system_id, b.front_disc_diameter AS system_front_disc_diameter, b.rear_disc_diameter AS system_rear_disc_diameter
FROM chassis_frames a JOIN brake_systems b ON a.brake_system_id = b.brake_system_id;
```

| chassis_frame_id | frame_designation | technology_name | geometry_control | system_brake_system_id | system_front_disc_diameter | system_rear_disc_diameter |
|---|---|---|---|---|---|---|
| 1 | distributed-frame-60 | Baseline Framework D | compact-geometry-26 | 1 | 3.95 | 4.70 |
| 2 | baseline-frame-61 | Distributed Protocol | composite-geometry-27 | 2 | 6.90 | 9.40 |
| 3 | pilot-frame-62 | Adaptive Programme | primary-geometry-28 | 3 | 9.85 | 14.10 |
| 4 | extended-frame-63 | Primary Standard A | adaptive-geometry-29 | 4 | 12.80 | 18.80 |

This view joins `chassis_frames` to `brake_systems` on `chassis_frames.brake_system_id = brake_systems.brake_system_id`. It answers: "Which brake system is paired with each chassis frame?" The row for chassis frame `1` would show brake system `1` (front disc 3.95, rear disc 4.70, ventilation `false`). The row for chassis frame `4` would show brake system `4` (front disc 12.80, rear disc 18.80, ventilation `true`). The view surfaces the braking configuration alongside the chassis dimensions.

**View `vw_chassis_frame_capacity_specification`**

```sql
CREATE VIEW vw_chassis_frame_capacity_specification AS
SELECT a.chassis_frame_id, a.frame_designation, a.technology_name, a.geometry_control, b.id AS specification_id, b.capacity_type AS specification_capacity_type, b.value AS specification_value
FROM chassis_frames a JOIN capacity_specifications b ON a.capacity_specification_id = b.id;
```

| chassis_frame_id | frame_designation | technology_name | geometry_control | specification_id | specification_capacity_type | specification_value |
|---|---|---|---|---|---|---|
| 1 | distributed-frame-60 | Baseline Framework D | compact-geometry-26 | 1000 | regional-capacity-42 | 19.95 |
| 2 | baseline-frame-61 | Distributed Protocol | composite-geometry-27 | 1001 | legacy-capacity-43 | 21.90 |
| 3 | pilot-frame-62 | Adaptive Programme | primary-geometry-28 | 1002 | compact-capacity-44 | 23.85 |
| 4 | extended-frame-63 | Primary Standard A | adaptive-geometry-29 | 1003 | composite-capacity-45 | 25.80 |

This view joins `chassis_frames` to `capacity_specifications` on `chassis_frames.capacity_specification_id = capacity_specifications.capacity_specification_id`. It answers: "Which capacity specification is assigned to each chassis frame?" The row for chassis frame `1` would show capacity specification `1000`; the row for chassis frame `4` would show capacity specification `1003`. The view links structural design to load constraints.

**View `vw_suspension_system_chassis_frame`**

```sql
CREATE VIEW vw_suspension_system_chassis_frame AS
SELECT a.suspension_system_id, a.front_type, a.rear_type, a.seat_height, b.chassis_frame_id AS frame_chassis_frame_id, b.frame_designation AS frame_frame_designation, b.technology_name AS frame_technology_name
FROM suspension_systems a JOIN chassis_frames b ON a.chassis_frame_id = b.chassis_frame_id;
```

| suspension_system_id | front_type | rear_type | seat_height | frame_chassis_frame_id | frame_frame_designation | frame_technology_name |
|---|---|---|---|---|---|---|
| 1 | baseline-front-13 | legacy-rear-91 | 1.15 | 1 | distributed-frame-60 | Baseline Framework D |
| 2 | pilot-front-14 | compact-rear-92 | 1.3 | 2 | baseline-frame-61 | Distributed Protocol |
| 3 | extended-front-15 | composite-rear-93 | 0.575 | 3 | pilot-frame-62 | Adaptive Programme |
| 4 | integrated-front-16 | primary-rear-94 | 1.19 | 4 | extended-frame-63 | Primary Standard A |

This view joins `suspension_systems` to `chassis_frames` on `suspension_systems.chassis_frame_id = chassis_frames.chassis_frame_id`. It answers the inverse of `vw_chassis_frame_suspension_system`: "Which chassis frame is paired with each suspension system?" The row for suspension system `1` (front type `baseline-front-13`, dive control `true`) would show chassis frame `1` (distributed-frame-60, wheelbase 22.45). The row for suspension system `3` (front type `extended-front-15`, dive control `true`) would show chassis frame `3` (pilot-frame-62, wheelbase 31.35). This view is useful when starting from the suspension and needing to find the parent chassis.

**View `vw_suspension_system_wheel_assembly`**

```sql
CREATE VIEW vw_suspension_system_wheel_assembly AS
SELECT a.suspension_system_id, a.front_type, a.rear_type, a.seat_height, b.wheel_assembly_id AS assembly_wheel_assembly_id, b.position AS assembly_position, b.tire_width AS assembly_tire_width
FROM suspension_systems a JOIN wheel_assemblies b ON a.wheel_assembly_id = b.wheel_assembly_id;
```

| suspension_system_id | front_type | rear_type | seat_height | assembly_wheel_assembly_id | assembly_position | assembly_tire_width |
|---|---|---|---|---|---|---|
| 1 | baseline-front-13 | legacy-rear-91 | 1.15 | 100 | compact-position-20 | 1.05 |
| 2 | pilot-front-14 | compact-rear-92 | 1.3 | 101 | composite-position-21 | 0.56 |
| 3 | extended-front-15 | composite-rear-93 | 0.575 | 102 | primary-position-22 | 0.52 |
| 4 | integrated-front-16 | primary-rear-94 | 1.19 | 103 | adaptive-position-23 | 1.05 |

This view joins `suspension_systems` to `wheel_assemblies` on `suspension_systems.wheel_assembly_id = wheel_assemblies.wheel_assembly_id`. It answers: "Which wheel assembly is paired with each suspension system?" The row for suspension system `1` would show wheel assembly `100` (position `compact-position-20`, rim diameter 10.95). The row for suspension system `4` would show wheel assembly `103` (position `adaptive-position-23`, rim diameter 22.80). The view exposes the suspension-to-wheel coupling.

**View `vw_brake_system_chassis_frame`**

```sql
CREATE VIEW vw_brake_system_chassis_frame AS
SELECT a.brake_system_id, a.front_disc_diameter, a.rear_disc_diameter, a.caliper_type, b.chassis_frame_id AS frame_chassis_frame_id, b.frame_designation AS frame_frame_designation, b.technology_name AS frame_technology_name
FROM brake_systems a JOIN chassis_frames b ON a.chassis_frame_id = b.chassis_frame_id;
```

| brake_system_id | front_disc_diameter | rear_disc_diameter | caliper_type | frame_chassis_frame_id | frame_frame_designation | frame_technology_name |
|---|---|---|---|---|---|---|
| 1 | 3.95 | 4.70 | distributed-caliper-72 | 1 | distributed-frame-60 | Baseline Framework D |
| 2 | 6.90 | 9.40 | baseline-caliper-73 | 2 | baseline-frame-61 | Distributed Protocol |
| 3 | 9.85 | 14.10 | pilot-caliper-74 | 3 | pilot-frame-62 | Adaptive Programme |
| 4 | 12.80 | 18.80 | extended-caliper-75 | 4 | extended-frame-63 | Primary Standard A |

This view joins `brake_systems` to `chassis_frames` on `brake_systems.chassis_frame_id = chassis_frames.chassis_frame_id`. It answers the inverse of `vw_chassis_frame_brake_system`: "Which chassis frame is paired with each brake system?" The row for brake system `1` (front disc 3.95, ventilation `false`) would show chassis frame `1` (distributed-frame-60, wheelbase 22.45). The row for brake system `4` (front disc 12.80, ventilation `true`) would show chassis frame `4` (extended-frame-63, wheelbase 35.80). This view is useful when auditing brakes from the component side.

**View `vw_brake_system_wheel_assembly`**

```sql
CREATE VIEW vw_brake_system_wheel_assembly AS
SELECT a.brake_system_id, a.front_disc_diameter, a.rear_disc_diameter, a.caliper_type, b.wheel_assembly_id AS assembly_wheel_assembly_id, b.position AS assembly_position, b.tire_width AS assembly_tire_width
FROM brake_systems a JOIN wheel_assemblies b ON a.wheel_assembly_id = b.wheel_assembly_id;
```

| brake_system_id | front_disc_diameter | rear_disc_diameter | caliper_type | assembly_wheel_assembly_id | assembly_position | assembly_tire_width |
|---|---|---|---|---|---|---|
| 1 | 3.95 | 4.70 | distributed-caliper-72 | 100 | compact-position-20 | 1.05 |
| 2 | 6.90 | 9.40 | baseline-caliper-73 | 101 | composite-position-21 | 0.56 |
| 3 | 9.85 | 14.10 | pilot-caliper-74 | 102 | primary-position-22 | 0.52 |
| 4 | 12.80 | 18.80 | extended-caliper-75 | 103 | adaptive-position-23 | 1.05 |

This view joins `brake_systems` to `wheel_assemblies` on `brake_systems.wheel_assembly_id = wheel_assemblies.wheel_assembly_id`. It answers: "Which wheel assembly is paired with each brake system?" The row for brake system `1` would show wheel assembly `100` (position `compact-position-20`, rim diameter 10.95). The row for brake system `4` would show wheel assembly `103` (position `adaptive-position-23`, rim diameter 22.80). The view surfaces the brake-to-wheel coupling.

**View `vw_wheel_assembly_suspension_system`**

```sql
CREATE VIEW vw_wheel_assembly_suspension_system AS
SELECT a.wheel_assembly_id, a.position, a.tire_width, a.tire_height, b.suspension_system_id AS system_suspension_system_id, b.front_type AS system_front_type, b.rear_type AS system_rear_type
FROM wheel_assemblies a JOIN suspension_systems b ON a.suspension_system_id = b.suspension_system_id;
```

| wheel_assembly_id | position | tire_width | tire_height | system_suspension_system_id | system_front_type | system_rear_type |
|---|---|---|---|---|---|---|
| 100 | compact-position-20 | 1.05 | 1.12 | 1 | baseline-front-13 | legacy-rear-91 |
| 101 | composite-position-21 | 0.56 | 0.37591002 | 2 | pilot-front-14 | compact-rear-92 |
| 102 | primary-position-22 | 0.52 | 0.74 | 3 | extended-front-15 | composite-rear-93 |
| 103 | adaptive-position-23 | 1.05 | 0.84 | 4 | integrated-front-16 | primary-rear-94 |

This view joins `wheel_assemblies` to `suspension_systems` on `wheel_assemblies.suspension_system_id = suspension_systems.suspension_system_id`. It answers the inverse of `vw_suspension_system_wheel_assembly`: "Which suspension system is paired with each wheel assembly?" The row for wheel assembly `100` (position `compact-position-20`, tire width 1.05) would show suspension system `1` (front type `baseline-front-13`, dive control `true`). The row for wheel assembly `103` (position `adaptive-position-23`, tire width 1.05) would show suspension system `4` (front type `integrated-front-16`, dive control `false`). This view is useful when starting from the wheel and needing to find the parent suspension.

**View `vw_wheel_assembly_brake_system`**

```sql
CREATE VIEW vw_wheel_assembly_brake_system AS
SELECT a.wheel_assembly_id, a.position, a.tire_width, a.tire_height, b.brake_system_id AS system_brake_system_id, b.front_disc_diameter AS system_front_disc_diameter, b.rear_disc_diameter AS system_rear_disc_diameter
FROM wheel_assemblies a JOIN brake_systems b ON a.brake_system_id = b.brake_system_id;
```

| wheel_assembly_id | position | tire_width | tire_height | system_brake_system_id | system_front_disc_diameter | system_rear_disc_diameter |
|---|---|---|---|---|---|---|
| 100 | compact-position-20 | 1.05 | 1.12 | 1 | 3.95 | 4.70 |
| 101 | composite-position-21 | 0.56 | 0.37591002 | 2 | 6.90 | 9.40 |
| 102 | primary-position-22 | 0.52 | 0.74 | 3 | 9.85 | 14.10 |
| 103 | adaptive-position-23 | 1.05 | 0.84 | 4 | 12.80 | 18.80 |

This view joins `wheel_assemblies` to `brake_systems` on `wheel_assemblies.brake_system_id = brake_systems.brake_system_id`. It answers the inverse of `vw_brake_system_wheel_assembly`: "Which brake system is paired with each wheel assembly?" The row for wheel assembly `100` would show brake system `1` (front disc 3.95, ventilation `false`). The row for wheel assembly `103` would show brake system `4` (front disc 12.80, ventilation `true`). The view surfaces the wheel-to-brake coupling from the wheel's perspective.

**View `vw_capacity_specification_chassis_frame`**

```sql
CREATE VIEW vw_capacity_specification_chassis_frame AS
SELECT a.id, a.capacity_type, a.value, a.unit, b.chassis_frame_id AS frame_chassis_frame_id, b.frame_designation AS frame_frame_designation, b.technology_name AS frame_technology_name
FROM capacity_specifications a JOIN chassis_frames b ON a.chassis_frame_id = b.chassis_frame_id;
```

| id | capacity_type | value | unit | frame_chassis_frame_id | frame_frame_designation | frame_technology_name |
|---|---|---|---|---|---|---|
| 1000 | regional-capacity-42 | 19.95 | distributed-unit-18 | 1 | distributed-frame-60 | Baseline Framework D |
| 1001 | legacy-capacity-43 | 21.90 | baseline-unit-19 | 2 | baseline-frame-61 | Distributed Protocol |
| 1002 | compact-capacity-44 | 23.85 | pilot-unit-20 | 3 | pilot-frame-62 | Adaptive Programme |
| 1003 | composite-capacity-45 | 25.80 | extended-unit-21 | 4 | extended-frame-63 | Primary Standard A |

This view joins `capacity_specifications` to `chassis_frames` on `capacity_specifications.capacity_specification_id = chassis_frames.capacity_specification_id`. It answers the inverse of `vw_chassis_frame_capacity_specification`: "Which chassis frame is paired with each capacity specification?" The row for capacity specification `1000` would show chassis frame `1` (distributed-frame-60, wheelbase 22.45). The row for capacity specification `1003` would show chassis frame `4` (extended-frame-63, wheelbase 35.80). This view is useful when auditing capacity constraints from the specification side.

**View `vw_capacity_specification_powertrain`**

```sql
CREATE VIEW vw_capacity_specification_powertrain AS
SELECT a.id, a.capacity_type, a.value, a.unit, b.powertrain_id AS powertrain_powertrain_id, b.engine_type AS powertrain_engine_type, b.displacement AS powertrain_displacement
FROM capacity_specifications a JOIN powertrains b ON a.powertrain_id = b.powertrain_id;
```

| id | capacity_type | value | unit | powertrain_powertrain_id | powertrain_engine_type | powertrain_displacement |
|---|---|---|---|---|---|---|
| 1000 | regional-capacity-42 | 19.95 | distributed-unit-18 | 1 | legacy-engine-61 | 17.95 |
| 1001 | legacy-capacity-43 | 21.90 | baseline-unit-19 | 2 | compact-engine-62 | 19.90 |
| 1002 | compact-capacity-44 | 23.85 | pilot-unit-20 | 3 | composite-engine-63 | 21.85 |
| 1003 | composite-capacity-45 | 25.80 | extended-unit-21 | 4 | primary-engine-64 | 23.80 |

This view joins `capacity_specifications` to `powertrains` — likely through a transitive join via `vehicle_models` or `chassis_frames` — to answer: "Which powertrain is associated with each capacity specification?" The row for capacity specification `1000` would show powertrain `1` (legacy-engine-61, horsepower 7.70). The row for capacity specification `1003` would show powertrain `4` (primary-engine-64, horsepower 21.80). The view links load constraints to propulsion output, enabling analysis of whether a given powertrain is appropriately matched to the vehicle's capacity envelope.

The schema as a whole embodies a design philosophy in which every physical subsystem is a first-class entity with its own lifecycle, versioning, and cross-references. The `vehicle_models` table acts as an assembly point, selecting one instance from each subsystem table to form a complete configuration. The foreign keys between subsystem tables (e.g., `powertrains.wheel_assembly_id`, `suspension_systems.chassis_frame_id`, `brake_systems.wheel_assembly_id`) encode the engineering reality that these components are co-designed and cannot be freely mixed. The eighteen views materialize the most common join paths through this graph, allowing analysts to query domain facts — "what powertrain does model MOD-2065 use?" or "what wheel assembly is paired with powertrain 4?" — without writing explicit joins. The result is a schema that is both normalized enough to avoid redundancy and richly interconnected enough to capture the physical dependencies of the vehicle domain.