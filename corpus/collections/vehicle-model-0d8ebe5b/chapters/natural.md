# Vehicle Configuration and Component Integration

Modern vehicle engineering demands precise coordination across dozens of interdependent subsystems. Every production vehicle model is defined by a unique combination of powertrain architecture, chassis geometry, suspension tuning, braking hardware, and wheel specifications. The records in this reference capture a controlled set of four vehicle models—Pilot Survey, Baseline Corridor, Distributed Series A, and Adaptive Assessment—each manufactured under distinct organizational codes and configured with specific component selections. Understanding how these components relate to one another is essential for engineers who must verify compatibility, trace configuration changes, and validate performance specifications before any physical assembly begins.

## Vehicle Model Configuration

**Table `vehicle_models`**

| model_identifier | model_display_name | manufacturer_code | color_variant | trim_level | powertrain_id | chassis_frame_id | suspension_system_id | brake_system_id | wheel_assembly_id | capacity_specification_id |
|---|---|---|---|---|---|---|---|---|---|---|
| MOD-2065 | Pilot Survey | Whirlpool Corporation | Brown | adaptive-trim-41 | 1 | 1 | 1 | 1 | 100 | 1000 |
| MOD-2070 | Baseline Corridor | Lucas Industries | Chestnut | distributed-trim-42 | 2 | 2 | 2 | 2 | 101 | 1001 |
| MOD-2075 | Distributed Series A | Luddic Path | Orange | baseline-trim-43 | 3 | 3 | 3 | 3 | 102 | 1002 |
| MOD-2080 | Adaptive Assessment | Diners Club Switzerland Ltd | Brown | pilot-trim-44 | 4 | 4 | 4 | 4 | 103 | 1003 |

The vehicle model table serves as the central configuration hub. Each row represents a distinct model variant identified by a human-readable code such as MOD-2065 or MOD-2080, paired with a display name like Pilot Survey or Adaptive Assessment. The manufacturer_code column attributes each model to its producing organization—Whirlpool Corporation, Lucas Industries, Luddic Path, or Diners Club Switzerland Ltd—while the color_variant field records the exterior finish, ranging from Brown to Chestnut to Orange. The trim_level column distinguishes configuration tiers, with designations such as adaptive-trim-41 and distributed-trim-42 indicating the equipment package assigned to each variant.

Critically, each vehicle model row carries foreign-key references to six component tables: powertrain_id, chassis_frame_id, suspension_system_id, brake_system_id, wheel_assembly_id, and capacity_specification_id. These identifiers establish the primary configuration linkage, ensuring that every model variant maps to exactly one powertrain, one chassis frame, one suspension system, one brake system, one wheel assembly, and one capacity specification. The Pilot Survey model (MOD-2065), for instance, references powertrain 1, chassis frame 1, suspension system 1, brake system 1, wheel assembly 100, and capacity specification 1000, forming a complete and self-consistent configuration record.

## Powertrain Architecture

**Table `powertrains`**

| powertrain_id | engine_type | displacement | horsepower | cooling_method | fuel_delivery_system | transmission_type | gear_positions | drive_mode | wheel_assembly_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | legacy-engine-61 | 17.95 | 7.70 | primary-cooling-34 | pilot-fuel-32 | primary-transmis-34 | compact-gear-50 | primary-drive-70 | 100 |
| 2 | compact-engine-62 | 19.90 | 12.40 | adaptive-cooling-35 | extended-fuel-33 | adaptive-transmis-35 | composite-gear-51 | adaptive-drive-71 | 101 |
| 3 | composite-engine-63 | 21.85 | 17.10 | distributed-cooling-36 | integrated-fuel-34 | distributed-transmis-36 | primary-gear-52 | distributed-drive-72 | 102 |
| 4 | primary-engine-64 | 23.80 | 21.80 | baseline-cooling-37 | seasonal-fuel-35 | baseline-transmis-37 | adaptive-gear-53 | baseline-drive-73 | 103 |

The powertrain table documents the propulsion and drivetrain specifications for each vehicle variant. Four distinct powertrain configurations are recorded, each identified by a numeric powertrain_id and characterized by its engine_type, displacement, horsepower output, cooling_method, fuel_delivery_system, transmission_type, gear_positions, and drive_mode. The powertrain_id also carries a wheel_assembly_id foreign key, linking the propulsion system to the specific wheel assembly it drives.

Powertrain 1 employs a legacy-engine-61 with a displacement of 17.95 liters and produces 7.70 horsepower, cooled by a primary-cooling-34 system and fueled through a pilot-fuel-32 delivery mechanism. Its primary-transmis-34 transmission pairs with compact-gear-50 gearing and operates in primary-drive-70 mode, driving wheel assembly 100. As powertrain_id increases from 1 to 4, displacement rises from 17.95 to 23.80 liters and horsepower climbs from 7.70 to 21.80, reflecting a deliberate progression in performance capability across the model lineup. The cooling method transitions from primary-cooling-34 through adaptive-cooling-35, distributed-cooling-36, and baseline-cooling-37, while the fuel delivery system shifts from pilot-fuel-32 to extended-fuel-33, integrated-fuel-34, and seasonal-fuel-35.

## Chassis Frame Design

**Table `chassis_frames`**

| chassis_frame_id | frame_designation | technology_name | geometry_control | wheelbase | ground_clearance | suspension_system_id | brake_system_id | capacity_specification_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | distributed-frame-60 | Baseline Framework D | compact-geometry-26 | 22.45 | 8.95 | 1 | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | baseline-frame-61 | Distributed Protocol | composite-geometry-27 | 26.90 | 12.90 | 2 | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | pilot-frame-62 | Adaptive Programme | primary-geometry-28 | 31.35 | 16.85 | 3 | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | extended-frame-63 | Primary Standard A | adaptive-geometry-29 | 35.80 | 20.80 | 4 | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The chassis frame table defines the structural backbone of each vehicle. Four frame designs are cataloged, each identified by chassis_frame_id and described through its frame_designation, technology_name, geometry_control, wheelbase, and ground_clearance. The frames exhibit a clear dimensional progression: wheelbase increases from 22.45 units in distributed-frame-60 to 35.80 units in extended-frame-63, while ground clearance rises from 8.95 to 20.80 units over the same sequence.

Each chassis frame carries a technology_name that reflects its engineering philosophy—Baseline Framework D, Distributed Protocol, Adaptive Programme, and Primary Standard A—and a geometry_control setting that governs structural rigidity, ranging from compact-geometry-26 to adaptive-geometry-29. The chassis frame table also maintains foreign-key references to suspension_system_id, brake_system_id, and capacity_specification_id, establishing the structural integration points where the frame connects to the suspension, braking, and capacity systems. Timestamps in the created_at and updated_at columns record the configuration lifecycle; for example, distributed-frame-60 was created on 2025-01-01 and last updated on 2025-01-02, while extended-frame-63 was created on 2025-04-16 and updated on 2025-04-23.

## Suspension Systems

**Table `suspension_systems`**

| suspension_system_id | front_type | rear_type | seat_height | dive_control | chassis_frame_id | wheel_assembly_id |
|---|---|---|---|---|---|---|
| 1 | baseline-front-13 | legacy-rear-91 | 1.15 | true | 1 | 100 |
| 2 | pilot-front-14 | compact-rear-92 | 1.3 | false | 2 | 101 |
| 3 | extended-front-15 | composite-rear-93 | 0.575 | true | 3 | 102 |
| 4 | integrated-front-16 | primary-rear-94 | 1.19 | false | 4 | 103 |

Suspension systems govern ride quality, handling dynamics, and occupant comfort. The suspension_systems table records four configurations, each identified by suspension_system_id and specified through its front_type, rear_type, seat_height, dive_control setting, and its linkage to a chassis_frame_id and wheel_assembly_id.

The front suspension types progress from baseline-front-13 through pilot-front-14, extended-front-15, and integrated-front-16, while the rear types move from legacy-rear-91 through compact-rear-92, composite-rear-93, and primary-rear-94. Seat_height values vary notably: suspension system 1 records a seat height of 1.15, system 2 reaches 1.3, system 3 drops to 0.575, and system 4 returns to 1.19. The dive_control boolean indicates whether anti-dive geometry is engaged—true for systems 1 and 3, false for systems 2 and 4. Each suspension system references a specific chassis frame and wheel assembly, ensuring that the suspension is tuned to the structural and rolling characteristics of its host vehicle.

## Brake Systems

**Table `brake_systems`**

| brake_system_id | front_disc_diameter | rear_disc_diameter | caliper_type | ventilation | chassis_frame_id | wheel_assembly_id |
|---|---|---|---|---|---|---|
| 1 | 3.95 | 4.70 | distributed-caliper-72 | false | 1 | 100 |
| 2 | 6.90 | 9.40 | baseline-caliper-73 | true | 2 | 101 |
| 3 | 9.85 | 14.10 | pilot-caliper-74 | false | 3 | 102 |
| 4 | 12.80 | 18.80 | extended-caliper-75 | true | 4 | 103 |

Braking performance is defined by disc dimensions, caliper design, and ventilation strategy. The brake_systems table captures four configurations, each identified by brake_system_id and specified through front_disc_diameter, rear_disc_diameter, caliper_type, ventilation status, and its references to chassis_frame_id and wheel_assembly_id.

A pronounced scaling pattern is evident: front disc diameters increase from 3.95 in system 1 to 12.80 in system 4, while rear disc diameters grow from 4.70 to 18.80. Caliper types follow the same progression—distributed-caliper-72, baseline-caliper-73, pilot-caliper-74, and extended-caliper-75. Ventilation is enabled (true) for systems 2 and 4 but disabled (false) for systems 1 and 3, suggesting a deliberate pairing of ventilation strategy with disc size and performance tier. Each brake system is anchored to a specific chassis frame and wheel assembly, ensuring that braking hardware is matched to the structural mounting points and wheel geometry of its application.

## Wheel Assemblies

**Table `wheel_assemblies`**

| wheel_assembly_id | position | tire_width | tire_height | rim_diameter | rim_material | tire_model | suspension_system_id | brake_system_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | compact-position-20 | 1.05 | 1.12 | 10.95 | baseline-rim-19 | composite-tire-57 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | composite-position-21 | 0.56 | 0.37591002 | 14.90 | pilot-rim-20 | primary-tire-58 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | primary-position-22 | 0.52 | 0.74 | 18.85 | extended-rim-21 | adaptive-tire-59 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | adaptive-position-23 | 1.05 | 0.84 | 22.80 | integrated-rim-22 | distributed-tire-60 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Wheel assemblies define the rolling stock of each vehicle, specifying tire dimensions, rim characteristics, and the suspension and brake systems they interface with. The wheel_assemblies table records four configurations, each identified by wheel_assembly_id and described through its position, tire_width, tire_height, rim_diameter, rim_material, tire_model, suspension_system_id, and brake_system_id.

Wheel assembly 100 occupies compact-position-20 with a tire width of 1.05, tire height of 1.12, and rim diameter of 10.95, mounted on a baseline-rim-19 and shod with a composite-tire-57. Assembly 101 (composite-position-21) narrows to a tire width of 0.56 and height of 0.376, with a larger rim diameter of 14.90 and pilot-rim-20 construction. Assembly 102 (primary-position-22) measures 0.52 by 0.74 on an 18.85 extended-rim-21 with adaptive-tire-59, while assembly 103 (adaptive-position-23) returns to a width of 1.05 and height of 0.84 on a 22.80 integrated-rim-22 with distributed-tire-60. Each wheel assembly references its associated suspension system and brake system, completing the mechanical integration chain from frame through suspension to wheel and brake.

## Capacity Specifications

**Table `capacity_specifications`**

| id | capacity_type | value | unit | location | chassis_frame_id | powertrain_id |
|---|---|---|---|---|---|---|
| 1000 | regional-capacity-42 | 19.95 | distributed-unit-18 | extended-location-99 | 1 | 1 |
| 1001 | legacy-capacity-43 | 21.90 | baseline-unit-19 | integrated-location-100 | 2 | 2 |
| 1002 | compact-capacity-44 | 23.85 | pilot-unit-20 | seasonal-location-101 | 3 | 3 |
| 1003 | composite-capacity-45 | 25.80 | extended-unit-21 | regional-location-102 | 4 | 4 |

Capacity specifications define the load-bearing and volumetric parameters of each vehicle configuration. While the table itself contains the reference values that anchor the capacity linkage across all component tables, the capacity_specification_id foreign key in the vehicle_models, chassis_frames, and related tables ensures that every model variant carries a consistent capacity designation. The capacity specification acts as the final integration point, tying together the structural, propulsion, and rolling subsystems into a single validated configuration.

## Configuration Views

The relational structure of the domain is best understood through its joined views, each of which answers a specific engineering question by combining records from two or more component tables.

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

This view joins vehicle models with their powertrain specifications, answering the question: what propulsion system is assigned to each vehicle model? The result confirms that MOD-2065 (Pilot Survey) is paired with powertrain 1 (legacy-engine-61, 17.95 displacement, 7.70 horsepower), while MOD-2080 (Adaptive Assessment) is paired with powertrain 4 (primary-engine-64, 23.80 displacement, 21.80 horsepower). The view makes the performance progression across the model lineup immediately visible.

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

By linking vehicle models to their chassis frames, this view answers: what structural backbone supports each model? MOD-2065 maps to distributed-frame-60 with a 22.45 wheelbase and 8.95 ground clearance, whereas MOD-2080 maps to extended-frame-63 with a 35.80 wheelbase and 20.80 ground clearance. The dimensional scaling is consistent with the powertrain progression—larger, more powerful models sit on larger frames.

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

This view reveals the suspension tuning assigned to each model. MOD-2065 uses suspension system 1 (baseline-front-13, legacy-rear-91, seat height 1.15, dive control enabled), while MOD-2080 uses suspension system 4 (integrated-front-16, primary-rear-94, seat height 1.19, dive control disabled). The suspension configuration does not follow a simple linear progression, reflecting the need to balance ride comfort and handling characteristics independently of powertrain and frame size.

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

The brake system view answers: what braking hardware is specified for each model? MOD-2065 is equipped with brake system 1 (front disc 3.95, rear disc 4.70, distributed-caliper-72, no ventilation), while MOD-2080 carries brake system 4 (front disc 12.80, rear disc 18.80, extended-caliper-75, ventilation enabled). The brake scaling mirrors the powertrain and chassis scaling, ensuring that stopping capability keeps pace with performance and mass.

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

This view connects each vehicle model to its wheel assembly. MOD-2065 uses wheel assembly 100 (compact-position-20, 1.05 width, 10.95 rim diameter, composite-tire-57), while MOD-2080 uses wheel assembly 103 (adaptive-position-23, 1.05 width, 22.80 rim diameter, distributed-tire-60). Rim diameter increases substantially across the lineup, from 10.95 to 22.80, reflecting the need for larger wheels to accommodate larger brakes and support greater vehicle dimensions.

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

The capacity specification view confirms that each vehicle model carries a unique capacity designation. MOD-2065 references capacity 1000, MOD-2070 references 1001, MOD-2075 references 1002, and MOD-2080 references 1003. This one-to-one mapping ensures that capacity constraints are consistently applied across all component selections for a given model.

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

This view joins powertrains with their driven wheel assemblies, answering: which wheel assembly does each powertrain drive? Powertrain 1 drives wheel assembly 100, powertrain 2 drives 101, powertrain 3 drives 102, and powertrain 4 drives 103. The direct correspondence confirms that each powertrain is matched to a specific wheel assembly, and the progression in powertrain performance aligns with the progression in wheel and tire specifications.

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

This view links chassis frames to their suspension systems. Frame 1 (distributed-frame-60) pairs with suspension system 1, frame 2 with system 2, frame 3 with system 3, and frame 4 with system 4. The one-to-one mapping ensures that each frame is paired with a suspension tuned to its geometry and dimensions.

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

The chassis-brake view confirms that each frame carries its designated brake system. Frame 1 pairs with brake system 1 (3.95 front disc, 4.70 rear disc), frame 2 with system 2 (6.90 front, 9.40 rear), frame 3 with system 3 (9.85 front, 14.10 rear), and frame 4 with system 4 (12.80 front, 18.80 rear). The brake scaling is consistent with the frame size progression.

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

This view confirms the capacity linkage from the chassis frame perspective. Frame 1 references capacity 1000, frame 2 references 1001, frame 3 references 1002, and frame 4 references 1003. The capacity specification is anchored at the chassis level, ensuring that all components attached to a given frame share the same capacity constraints.

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

This view presents the suspension-to-chassis linkage from the suspension side, confirming that suspension system 1 is mounted on chassis frame 1, system 2 on frame 2, and so on. The bidirectional relationship ensures that suspension tuning is always traceable to its structural host.

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

This view links suspension systems to their wheel assemblies. Suspension system 1 interfaces with wheel assembly 100, system 2 with 101, system 3 with 102, and system 4 with 103. The correspondence ensures that suspension geometry is matched to the rolling stock it supports.

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

Presenting the brake-to-chassis linkage from the brake side, this view confirms that brake system 1 is mounted on chassis frame 1, system 2 on frame 2, and so forth. The mounting relationship is critical for verifying that brake hardware is compatible with the frame's structural attachment points.

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

This view links brake systems to their wheel assemblies. Brake system 1 interfaces with wheel assembly 100, system 2 with 101, system 3 with 102, and system 4 with 103. The pairing ensures that disc dimensions and caliper types are compatible with the wheel and tire geometry they serve.

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

From the wheel assembly perspective, this view confirms that wheel assembly 100 is paired with suspension system 1, assembly 101 with system 2, and so on. The bidirectional linkage ensures that wheel and suspension compatibility is always verifiable.

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

This view links wheel assemblies to their brake systems, confirming that assembly 100 pairs with brake system 1, assembly 101 with system 2, and so forth. The relationship is essential for verifying that wheel clearance, brake disc diameter, and caliper envelope are all compatible.

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

This view presents the capacity-to-chassis linkage from the capacity side, confirming that capacity 1000 is associated with chassis frame 1, capacity 1001 with frame 2, and so on. The capacity specification serves as the unifying constraint across all component selections.

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

Finally, this view links capacity specifications to powertrains, confirming that capacity 1000 is associated with powertrain 1, capacity 1001 with powertrain 2, and so on. This linkage ensures that the propulsion system's output and mass are consistent with the vehicle's overall capacity designation.

## Synthesis

The vehicle configuration domain is defined by a tightly coupled set of component tables and the views that join them. Each vehicle model is a unique configuration of powertrain, chassis, suspension, brake, wheel, and capacity specifications, and every component table maintains foreign-key references that ensure consistency across the entire assembly. The four models in this reference—Pilot Survey, Baseline Corridor, Distributed Series A, and Adaptive Assessment—demonstrate a clear performance progression: displacement, horsepower, wheelbase, ground clearance, disc diameters, and rim diameters all increase from the first to the fourth model. Suspension tuning and dive control settings do not follow a simple linear pattern, reflecting the independent optimization of ride and handling characteristics. The joined views provide the engineering visibility needed to verify that every component pairing is valid, that capacity constraints are consistently applied, and that the complete vehicle configuration is internally coherent before any physical production begins.